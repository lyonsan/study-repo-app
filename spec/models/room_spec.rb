require 'rails_helper'

RSpec.describe Room, type: :model do
  before do
    @room = FactoryBot.build(:room)
  end
  describe '学習報告ルーム新規作成' do
    context '新規作成がうまくいく時' do
      it 'title, purpose_roomの値があれば作成できる' do
        expect(@room).to be_valid
      end
    end
    context '新規作成がうまくいかない時' do
      it 'titleがないと作成できない' do
        @room.title = nil
        @room.valid?
        expect(@room.errors.full_messages).to include 'ルーム名を入力してください'
      end
      it 'purpose_roomがないと作成できない' do
        @room.purpose_room = nil
        @room.valid?
        expect(@room.errors.full_messages).to include '学習報告ルームの目的を入力してください'
      end
    end
  end
end
