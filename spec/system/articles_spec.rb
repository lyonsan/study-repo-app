require 'rails_helper'

RSpec.describe "記事作成機能", type: :system do
  before do
    @user = FactoryBot.create(:user)
    @article = FactoryBot.build(:articles_tag)
  end

  context '記事新規作成ができる時' do
    it 'ログインしたユーザーは記事を新規投稿できる' do
      # サインインする
      sign_in(@user)
      # 記事一覧へのリンクがあることを確認する
      expect(page).to have_content '記事'
      # 記事一覧ページに遷移する
      visit articles_path
      # 記事作成ページへのリンクがあることを確認する
      expect(page).to have_content '記事作成'
      # 記事新規作成画面に遷移する
      visit new_article_path
      # 記事の内容を入力する
      fill_in '記事タイトル', with: @article.summary
      find('#articles_tag_study_genre_id').find("option[value='#{@article.study_genre_id}']").select_option
      fill_in 'タグ', with: @article.tag_name
      fill_in '本文', with: @article.detail
      # 記事投稿ボタンを押すと確認画面へ遷移する
      click_on '記事投稿'
      # 確認画面へ遷移する
      expect(current_path).to eq "/articles/confirm"
      # 記事投稿ボタンを押すと記事モデルのカウントが1上がる
      expect do
        click_on '送信する'
      end.to change { Article.count }.by(1)
      # 記事一覧ページに遷移していることを確認する
      expect(current_path).to eq articles_path
      # 先ほど投稿した記事が一覧で表示されている
      expect(page).to have_content(@article.summary)
    end
  end
  context '記事新規作成ができない時' do
    it 'ログインしていないユーザーは記事投稿ができない' do
      # トップページへ遷移する
      visit root_path
      # 記事一覧ページに遷移する
      visit articles_path
      # 記事作成ボタンをクリックする
      click_on '記事作成'
      # ログインページに遷移される
      expect(current_path).to eq new_user_session_path
    end
    it '情報が不十分では記事投稿ができない' do
      # サインインする
      sign_in(@user)
      # 記事一覧へのリンクがあることを確認する
      expect(page).to have_content '記事'
      # 記事一覧ページに遷移する
      visit articles_path
      # 記事作成ページへのリンクがあることを確認する
      expect(page).to have_content '記事作成'
      # 記事新規作成画面に遷移する
      visit new_article_path
      # 記事の内容を入力する
      fill_in '記事タイトル', with: nil
      fill_in 'タグ', with: nil
      fill_in '本文', with: nil
      # 記事投稿ボタンを押すと確認画面へ遷移する
      click_on '記事投稿'
      # 確認画面へ遷移用のパスが表示される
      expect(current_path).to eq "/articles/confirm"
      # 確認ページに表示されているはずの「送信する」ボタンが表示されていない
      expect(page).to have_no_content '送信する'
    end
  end
end

