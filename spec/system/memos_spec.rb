require 'rails_helper'

RSpec.describe "メモ作成機能", type: :system do
  before do
    @subject = FactoryBot.create(:subject)
    @memo = FactoryBot.build(:memo)
    @user1 = FactoryBot.create(:user)
  end
  context 'メモ作成がうまくいく時' do
    it '正しい情報を入力することでメモが作成できる' do
      # サインインする
      sign_in(@subject.user)
      # 「メモ」ページへのリンクがあることを確認する
      expect(page).to have_content("メモ")
      # 科目ルーム一覧ページに遷移する
      visit subjects_path
      # 生成された科目ルームが存在することを確認する
      expect(page).to have_content(@subject.name)
      # メモ一覧ページに移動
      visit subject_memos_path(@subject)
      # 「メモを作成する」のリンクがあることを確認
      expect(page).to have_content("メモを作成する")
      # メモ新規作成ページへ遷移
      visit new_subject_memo_path(@subject)
      # 今回貼り付ける画像を定義する
      image_path = Rails.root.join('app/assets/images/rooms-index-01.jpg')
      # メモの内容を記入する
      fill_in 'メモの題名', with: @memo.topic
      fill_in '関係する記述（コードや問題文等）を書きましょう', with: @memo.point
      fill_in 'メモを書きましょう', with: @memo.explanation
      # 作成ボタンを押すと、Memoモデルのカウントが1上がることを確認する
      expect do
        find('input[name="commit"]').click
      end.to change { Memo.count }.by(1)
      # 作成完了ページに遷移することを確認する
      expect(current_path).to eq subject_memos_path(@subject)
      # 「メモを作成しました!」の文字があることを確認する
      expect(page).to have_content("メモを作成しました!")
      # メモ一覧ページに遷移する
      visit subject_memos_path(@subject)
      # 先ほど作成したメモが存在することを確認する
      expect(page).to have_content(@memo.topic)
    end
  context 'メモ作成がうまくいかない時' do
    it '科目ルーム作成者以外のユーザーはルームにアクセスできず、メモ作成ができない' do
      # サインインする
      sign_in(@user1)
      # 「メモ」ページへのリンクがあることを確認する
      expect(page).to have_content("メモ")
      # 科目ルーム一覧ページに遷移する
      visit subjects_path
      # 生成された科目ルームが存在しないことを確認する
      expect(page).to have_no_content(@subject.name)
    end
    it '正しい情報を入力しないと作成できない' do
      # サインインする
      sign_in(@subject.user)
      # 「メモ」ページへのリンクがあることを確認する
      expect(page).to have_content("メモ")
      # 科目ルーム一覧ページに遷移する
      visit subjects_path
      # 生成された科目ルームが存在することを確認する
      expect(page).to have_content(@subject.name)
      # メモ一覧ページに移動
      visit subject_memos_path(@subject)
      # 「メモを作成する」のリンクがあることを確認
      expect(page).to have_content("メモを作成する")
      # メモ新規作成ページへ遷移
      visit new_subject_memo_path(@subject)
      # メモの内容を記入する
      fill_in 'メモの題名', with: nil
      fill_in '関係する記述（コードや問題文等）を書きましょう', with: nil
      fill_in 'メモを書きましょう', with: nil
      # 作成ボタンを押しても、Memoモデルのカウントが変わらないことを確認する
      expect do
        find('input[name="commit"]').click
      end.to change { Memo.count }.by(0)
      # メモ作成ページに戻されていることを確認する
      expect(current_path).to eq "/subjects/#{@subject.id}/memos"
      end
    end
  end
end
RSpec.describe 'メモの削除機能', type: :system do
  before do
    @subject = FactoryBot.create(:subject)
    @memo = FactoryBot.build(:memo)
  end
  context '科目別ルーム削除がうまくいく時' do
    it 'ルーム作成者は科目ルームを削除することができ、その場合科目ルームに紐づいたメモも同時に削除される' do
      # サインインする
      sign_in(@subject.user)
      # 作成された科目ルームにアクセスし、新規メモを作成し、メモ一覧ページへ遷移する
      memo_create(@subject, @memo)
      # 「科目ルームの削除」があることを確認する
      expect(page).to have_content('科目ルームの削除')
      # ボタンを押すと、Memoモデルのカウントが1下がることを確認する
      expect do
        click_link '科目ルームの削除'
      end.to change { Memo.count }.by(-1)
      # 削除完了ページに遷移していることを確認する
      expect(current_path).to eq "/subjects/#{@subject.id}"
    end
  end
end
