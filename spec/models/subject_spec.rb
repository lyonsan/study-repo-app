require 'rails_helper'

RSpec.describe Subject, type: :model do
  before do
    @subject = FactoryBot.build(:subject)
  end
  describe 'メモルーム新規作成' do
    context 'メモルーム作成がうまくいく時' do
      it 'nameとpurpose_subjectがあれば登録できる' do
        expect(@subject).to be_valid
      end
      it 'purpose_subjectがなくても登録できる' do
        @subject.purpose_subject = nil
        expect(@subject).to be_valid
      end
    end
    context 'メモルーム作成がうまくいかない時' do
      it 'nameがないと登録できない' do
        @subject.name = nil
        @subject.valid?
        expect(@subject.errors.full_messages).to include "カテゴリ/科目名を入力してください"
      end
    end
  end
end
