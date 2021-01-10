require 'rails_helper'

RSpec.describe "学習報告ルームの作成機能", type: :system do
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
      # フォームに情報を入力する
      fill_in 'ルーム名', with: @room_title
      fill_in '学習報告ルームの目的', with: @room_purpose_room
      find('#room_user').find("option[value='#{@user1.id}']").select_option
      # 送信するとRoomモデルのカウントが1上がる
      expect  do
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
      # フォームに情報を入力する
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
