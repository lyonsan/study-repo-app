require 'rails_helper'

RSpec.describe 'チャットルーム作成機能', type: :system do
  before do
    @user = FactoryBot.create(:user)
    @user1 = FactoryBot.create(:user)
  end
  context 'チャットルーム作成ができる時' do
    it 'ログインしたユーザーは新規チャットルームを作成できる' do
      # サインインする
      sign_in(@user)
      # ユーザー一覧へのリンクがあることを確認する
      expect(page).to have_content 'Users'
      # ユーザー一覧ページに遷移する
      visit users_path
      # ユーザー一覧ページに別のユーザーの名前があることを確認する
      expect(page).to have_content @user1.nickname
      # 別のユーザーの詳細ページに遷移する
      visit user_path(@user1)
      # 「チャットを始める」ボタンを押すと、Chatモデルのカウントが1上がる
      expect do
        find('input[name="commit"]').click
      end.to change { Chat.count }.by(1)
      # 「別のユーザーとのチャットルーム」の文字を確認する
      expect(page).to have_content "#{@user1.nickname}さんとのチャット"
    end
  end
  context 'チャットルーム作成ができない時' do
    it 'ログインしていないユーザーは新規チャットルームを作成できない' do
      # トップページに遷移する
      visit root_path
      # ユーザー一覧ページに遷移する
      visit users_path
      # ユーザー一覧ページに別のユーザーの名前があることを確認する
      expect(page).to have_content @user1.nickname
      # 別のユーザーの詳細ページに遷移する
      visit user_path(@user1)
      # 「チャットを始める」ボタンがないことを確認する
      expect(page).to have_no_content 'チャットを始める'
    end
  end
end
RSpec.describe 'チャットルーム削除', type: :system do
  before do
    @user = FactoryBot.create(:user)
    @user1 = FactoryBot.create(:user)
  end
  context 'チャットルーム削除ができる時' do
    it 'ログインしたユーザーはチャットルームを削除できる' do
      # サインインする
      sign_in(@user)
      # ユーザー一覧へのリンクがあることを確認する
      expect(page).to have_content 'Users'
      # ユーザー一覧ページに遷移する
      visit users_path
      # ユーザー一覧ページに別のユーザーの名前があることを確認する
      expect(page).to have_content @user1.nickname
      # 別のユーザーの詳細ページに遷移する
      visit user_path(@user1)
      # 「チャットを始める」ボタンを押すと、Chatモデルのカウントが1上がる
      expect do
        find('input[name="commit"]').click
      end.to change { Chat.count }.by(1)
      # 「別のユーザーとのチャットルーム」の文字を確認する
      expect(page).to have_content "#{@user1.nickname}さんとのチャット"
      # 「チャットルームを削除する」のリンクがあることを確認する
      expect(page).to have_content 'チャットルームを削除する'
      # 「チャットルームを削除する」を押すとChatモデルのカウントが1減る
      expect do
        click_link 'チャットルームを削除する'
      end.to change { Chat.count }.by(-1)
    end
  end
end
