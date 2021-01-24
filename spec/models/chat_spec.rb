require 'rails_helper'

RSpec.describe Chat, type: :model do
  before do
    @chat = FactoryBot.build(:chat)
  end
  describe 'チャットルーム新規作成' do
    context '新規作成がうまくいく時' do
      it 'themeがあれば登録できる' do
        expect(@chat).to be_valid
      end
      it 'themeがなくても登録できる' do
        @chat.theme = nil
        expect(@chat).to be_valid
      end
    end
  end
end
