require 'rails_helper'

RSpec.describe ArticlesTag, type: :model do
  before do
    @article = FactoryBot.build(:articles_tag)
  end
  describe '記事新規作成' do
    context '記事新規作成がうまくいく時' do
      it 'summary, detailが入力されており、study_genre_idが2-6である時' do
        expect(@article).to be_valid
      end
      it 'tag_nameがなくても登録できる' do
        @article.tag_name = nil
        expect(@article).to be_valid
      end
    end
    context '記事新規作成がうまくいかない時' do
      it 'summaryがないと登録できない' do
        @article.summary = nil
        @article.valid?
        expect(@article.errors.full_messages).to include '記事タイトルを入力してください'
      end
      it 'detailがないと登録できない' do
        @article.detail = nil
        @article.valid?
        expect(@article.errors.full_messages).to include '本文を入力してください'
      end
      it 'study_genre_idが1だと登録できない' do
        @article.study_genre_id = 1
        @article.valid?
        expect(@article.errors.full_messages).to include 'ジャンルを選択してください'
      end
    end
  end
end
