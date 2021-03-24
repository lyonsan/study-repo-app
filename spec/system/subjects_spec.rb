require 'rails_helper'

RSpec.describe '科目別メモルームの作成機能', type: :system do
  before do
    @user = FactoryBot.create(:user)
    @subject_name = Faker::Team.name
    @subject_purpose_subject = Faker::Lorem.sentence
  end
  context '科目別メモルーム作成ができる時' do
    it 'ログインしたユーザーは新規科目別メモルームを作成できる' do
      # サインインする
      sign_in(@user)
      # メモルーム一覧ページへのリンクがあることを確認する
      expect(page).to have_content('メモ')
      # メモルーム一覧に移動する
      visit subjects_path
      # メモルーム一覧ページに遷移する
      visit subjects_path
      # メモルーム新規作成ページへのリンクがあることを確認する
      expect(page).to have_content('科目/カテゴリー新規作成')
      # メモルーム新規作成ページに遷移する
      visit new_subject_path
      # フォームに情報を記入する
      fill_in 'カテゴリ/科目名', with: @subject_name
      fill_in '目的/主旨', with: @subject_purpose_subject
      # 科目作成ボタンを押すとSubjectモデルのカウントが1上がる
      expect do
        find('input[name="commit"]').click
      end.to change { Subject.count }.by(1)
      # 作成完了ページに遷移したことを確認する
      expect(current_path).to eq subjects_path
      # 「新規ルーム作成が完了しました!」の表示があることを確認する
      expect(page).to have_content('新規ルーム作成が完了しました!')
      # メモ一覧ページへのリンクがあることを確認する
      expect(page).to have_content('一覧ページに戻る')
      # メモ一覧ページに遷移する
      visit subjects_path
      # ページには先ほど作成したルームへのリンクがあることを確認する
      expect(page).to have_content(@subject_name)
    end
  end
  context '科目別メモルームが作成できない時' do
    it 'ログインしていないユーザーは新規科目別メモルームを作成できない' do
      # トップページに遷移する
      visit root_path
      # 新規作成ページへのリンクがない
      expect(page).to have_no_content('科目/カテゴリー新規作成')
    end
    it '正しい情報を入力しなければ作成できない' do
      # サインインする
      sign_in(@user)
      # メモルーム一覧ページへのリンクがあることを確認する
      expect(page).to have_content('メモ')
      # メモルーム一覧ページに遷移する
      visit subjects_path
      # メモルーム新規作成ページへのリンクがあることを確認する
      expect(page).to have_content('科目/カテゴリー新規作成')
      # メモルーム新規作成ページに遷移する
      visit new_subject_path
      # フォームに誤った情報を記入する
      fill_in 'カテゴリ/科目名', with: nil
      fill_in '目的/主旨', with: nil
      # 科目作成ボタンを押してもSubjectモデルのカウントが上がらない
      expect do
        find('input[name="commit"]').click
      end.to change { Subject.count }.by(0)
      # 作成ページに戻されることを確認する
      expect(current_path).to eq '/subjects'
    end
  end
end

RSpec.describe '科目別メモルームの削除機能', type: :system do
  before do
    @subject = FactoryBot.create(:subject)
  end
  context '科目別ルーム削除がうまくいく時' do
    it 'ルーム作成者は科目ルームを削除することができる' do
      # サインインする
      sign_in(@subject.user)
      # メモルーム一覧ページへのリンクがあることを確認する
      expect(page).to have_content('メモ')
      # メモルーム一覧ページに遷移する
      visit subjects_path
      # 生成された科目ルームが存在することを確認する
      expect(page).to have_content(@subject.name)
      # メモ一覧ページに移動
      visit subject_memos_path(@subject)
      # 「科目ルームの削除」があることを確認する
      expect(page).to have_content('科目ルームの削除')
      # ボタンを押すと、Subjectモデルのカウントが1下がることを確認する
      expect do
        click_link '科目ルームの削除'
      end.to change { Subject.count }.by(-1)
      # 削除完了ページに遷移していることを確認する
      expect(current_path).to eq "/subjects/#{@subject.id}"
    end
  end
end
