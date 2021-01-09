require 'rails_helper'

RSpec.describe 'ユーザー新規登録', type: :system do
  before do
    @user = FactoryBot.build(:user)
  end

  context 'ユーザー登録ができる時' do
    it '正しい情報を入力すればユーザー新規登録ができてトップページに移動する' do
      # トップページに遷移する
      visit root_path
      # トップページにサインアップページへ遷移するボタンがあることを確認する
      expect(page).to have_content('新規登録')
      # 新規登録ページへ移動する
      visit new_user_registration_path
      # ユーザー情報を入力する
      fill_in 'ニックネーム', with: @user.nickname
      fill_in 'メールアドレス', with: @user.email
      fill_in 'パスワード', with: @user.password
      fill_in 'パスワード(確認)', with: @user.password
      find('#user_birthday_1i').find("option[value='#{@user.birthday.year}']").select_option
      find('#user_birthday_2i').find("option[value='#{@user.birthday.month}']").select_option
      find('#user_birthday_3i').find("option[value='#{@user.birthday.day}']").select_option
      find('#user_study_genre_id').find("option[value='#{@user.study_genre_id}']").select_option
      fill_in '自己紹介/勉強していることの詳細', with: @user.self_introduction
      # 新規登録ボタンを押すとユーザーモデルのカウントが1上がることを確認する
      expect  do
        find('input[name="commit"]').click
      end.to change { User.count }.by(1)
      # トップページへ遷移したことを確認する
      expect(current_path).to eq root_path
      # ログアウトボタン、ユーザー名、メモルームへのリンクボタンが表示されていることを確認する
      expect(page).to have_content('ログアウト')
      expect(page).to have_content(@user.nickname)
      expect(page).to have_content('メモ')
      # 新規登録ページへ遷移するボタンやログインページに遷移するボタンが表示されていないことを確認する
      expect(page).to have_no_content('新規登録')
      expect(page).to have_no_content('ログイン')
    end
  end
  context 'ユーザー新規登録ができない時' do
    it '誤った情報ではユーザー新規登録ができずに新規登録ページへ戻ってくる' do
      # トップページに遷移する
      visit root_path
      # トップページにサインアップページへ遷移するボタンがあることを確認する
      expect(page).to have_content('新規登録')
      # 新規登録ページへ移動する
      visit new_user_registration_path
      # ユーザー情報を入力する
      fill_in 'ニックネーム', with: nil
      fill_in 'メールアドレス', with: nil
      fill_in 'パスワード', with: nil
      fill_in 'パスワード(確認)', with: nil
      # 新規登録ボタンを押してもユーザーモデルのカウントが上がらないことを確認する
      expect  do
        find('input[name="commit"]').click
      end.to change { User.count }.by(0)
      # 新規登録ページへ戻されることを確認する
      expect(current_path).to eq '/users'
    end
  end
end
