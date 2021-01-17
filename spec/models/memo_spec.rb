require 'rails_helper'

RSpec.describe Memo, type: :model do
  before do
    @memo = FactoryBot.build(:memo)
  end
  describe 'メモ作成機能' do
    context '新規作成がうまくいく時' do
      it 'topic, point, explanationが入力されていればメモを作成できる' do
        expect(@memo).to be_valid
      end
      it 'pointがなくても作成できる' do
        @memo.point = nil
        expect(@memo).to be_valid
      end
      it 'explanationがなくても作成できる' do
        @memo.explanation = nil
        expect(@memo).to be_valid
      end
    end
    context '新規作成がうまくいかない時' do
      it 'topicがないと作成できない' do
        @memo.topic = nil
        @memo.valid?
        expect(@memo.errors.full_messages).to include '題目を入力してください'
      end
    end
  end
end
