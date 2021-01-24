require 'rails_helper'

RSpec.describe Message, type: :model do
  before do
    @message = FactoryBot.build(:message)
  end
  describe 'メッセージ投稿がうまくいく時' do
    it 'contentがあれば登録できる' do
      expect(@message).to be_valid
    end
  end
  describe 'メッセージ投稿がうまくいかない時' do
    it 'contentがないと登録できない' do
      @message.content = nil
      @message.valid?
      expect(@message.errors.full_messages).to include 'Contentを入力してください'
    end
  end
end
