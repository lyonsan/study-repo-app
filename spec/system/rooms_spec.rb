require 'rails_helper'

RSpec.describe '学習報告ルームの作成機能', type: :system do
  before do
    @user = FactoryBot.create(:user)
    @user1 = FactoryBot.create(:user)
    @room_title = Faker::Team.name
    @room_purpose_room = Faker::Lorem.sentence
  end
  context 'ルーム作成ができる時' do
    it 'ログインしたユーザーは新規ルーム作成ができる' do
      # ログインする
      sign_in(@user)
      # 新規ルーム作成ページへのリンクがあることを確認する
      expect(page).to have_content('学習報告ルーム作成ページ')
      # 新規ルーム作成ページに遷移する
      visit new_room_path
      # 添付する写真を定義する
      image_path = Rails.root.join('app/assets/images/rooms-index-01.jpg')
      # フォームに情報を入力する
      attach_file('room[image]', image_path, make_visible: true)
      fill_in 'ルーム名', with: @room_title
      fill_in '学習報告ルームの目的', with: @room_purpose_room
      find('#room_user').find("option[value='#{@user1.id}']").select_option
      # 送信するとRoomモデルのカウントが1上がる
      expect do
        find('input[name="commit"]').click
      end.to change { Room.count }.by(1)
      # 投稿完了ページに遷移することを確認する
      expect(current_path).to eq rooms_path
      # 「学習報告ルーム作成が完了しました!」と表示されている
      expect(page).to have_content('学習報告ルーム作成が完了しました!')
      # トップページへのリンクがあることを確認する
      expect(page).to have_content('トップページに戻る')
      # トップページに遷移する
      visit root_path
      # トップページには先ほど作成したルームがあることを確認する
      expect(page).to have_content(@room_title)
    end
  end
  context 'ルーム作成ができない時' do
    it 'ログインしていないと新規ルーム作成ができない' do
      # トップページに遷移する
      visit root_path
      # 新規投稿ページへのリンクがない
      expect(page).to have_no_content('学習報告ルーム作成ページ')
    end
    it '誤った情報では新規ルーム作成ができずにルーム作成ページに戻ってくる' do
      # ログインする
      sign_in(@user)
      # 新規ルーム作成ページへのリンクがあることを確認する
      expect(page).to have_content('学習報告ルーム作成ページ')
      # 新規ルーム作成ページに遷移する
      visit new_room_path
      # フォームに値を入力する
      fill_in 'ルーム名', with: nil
      fill_in '学習報告ルームの目的', with: nil
      # 新規作成ボタンを押してもRoomモデルのカウントが上がらないことを確認
      expect  do
        find('input[name="commit"]').click
      end.to change { Room.count }.by(0)
      # 新規ルーム作成ページに戻されることを確認する
      expect(current_path).to eq '/rooms'
    end
  end
end

RSpec.describe '学習報告ルームの情報編集機能', type: :system do
  before do
    @room_user = FactoryBot.create(:room_user)
    @user = @room_user.user
    @room = @room_user.room
    @room_title1 = Faker::Team.name
    @room_purpose_room1 = Faker::Lorem.sentence
    @user1 = FactoryBot.create(:user)
  end
  context 'ルーム情報編集ができる時' do
    it 'ログインしたユーザーは自分の所属するルームの情報を編集できる' do
      # ログインする
      sign_in(@user)
      # ルーム名が表示されていることを確認する
      expect(page).to have_content(@room.title)
      # ルームの詳細ページにアクセスする
      visit room_path(@room)
      # 詳細ページに、「ルームの編集」ボタンがあることを確認する
      expect(page).to have_content('ルームの編集')
      # ルーム情報編集ページにアクセスする
      visit edit_room_path(@room)
      # 元々のルームの情報が既に入力されていることを確認する(画像を除く)
      expect(
        find('textarea[name="room[title]"]').value
      ).to eq @room.title
      expect(
        find('textarea[name="room[purpose_room]"]').value
      ).to eq @room.purpose_room
      # 添付する画像を定義する
      image_path = Rails.root.join('app/assets/images/rooms-index-02.jpeg')
      # 投稿内容を編集する
      attach_file('room[image]', image_path, make_visible: true)
      fill_in 'ルーム名', with: @room_title1
      fill_in '学習報告ルームの目的', with: @room_purpose_room1
      # 「ルーム情報を更新する」をクリックしてもRoomモデルのカウントは変わらない
      expect  do
        find('input[name="commit"]').click
      end.to change { Room.count }.by(0)
      # 編集完了画面に遷移したことを確認する
      expect(current_path).to eq room_path(@room)
      # 「学習報告ルーム編集が完了しました!」の文字があることを確認する
      expect(page).to have_content('学習報告ルーム編集が完了しました!')
      # ルームの詳細情報ページにアクセスする
      visit room_path(@room)
      # ルーム詳細ページには先ほど編集したルーム情報が表示されていることを確認する
      expect(page).to have_content(@room_title1)
    end
  end
  context 'ルーム情報編集ができない時' do
    it '誤った情報では新規ルーム作成ができずにルーム作成ページに戻ってくる' do
      # ログインする
      sign_in(@user)
      # ルーム名が表示されていることを確認する
      expect(page).to have_content(@room.title)
      # ルームの詳細ページにアクセスする
      visit room_path(@room)
      # 詳細ページに、「ルームの編集」ボタンがあることを確認する
      expect(page).to have_content('ルームの編集')
      # ルーム情報編集ページにアクセスする
      visit edit_room_path(@room)
      # 元々のルームの情報が既に入力されていることを確認する(画像を除く)
      expect(
        find('textarea[name="room[title]"]').value
      ).to eq @room.title
      expect(
        find('textarea[name="room[purpose_room]"]').value
      ).to eq @room.purpose_room
      # 投稿内容を編集する
      fill_in 'ルーム名', with: nil
      fill_in '学習報告ルームの目的', with: nil
      # 「ルーム情報を更新する」をクリックしてもRoomモデルのカウントは変わらない
      expect  do
        find('input[name="commit"]').click
      end.to change { Room.count }.by(0)
      # 編集ページに戻されることを確認する
      expect(current_path).to eq "/rooms/#{@room.id}"
    end
    it 'ログインしていないとルーム編集ができない' do
      # ルーム詳細ページに遷移する
      visit room_path(@room)
      # 新規投稿ページへのリンクがない
      expect(page).to have_no_content('ルームの編集')
    end
    it 'メンバー外のユーザーはルーム編集ができない' do
      # サインイン
      sign_in(@user1)
      # ルーム詳細ページに遷移する
      visit room_path(@room)
      # ルーム情報編集ページへのリンクがない
      expect(page).to have_no_content('ルームの編集')
    end
  end
end
