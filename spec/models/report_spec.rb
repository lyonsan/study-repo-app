require 'rails_helper'

RSpec.describe Report, type: :model do
  before do
    @report = FactoryBot.build(:report)
  end
  describe '学習報告新規投稿' do
    context '新規投稿がうまくいく時' do
      it '全ての値が入力され、study_timeをconcentrated_timeが上回らなければ登録できる' do
        expect(@report).to be_valid
      end
      it 'achievedがtrueの時、go_wrongが空欄でも登録できる' do
        @report.achieved = true
        @report.go_wrong = nil
        expect(@report).to be_valid
      end
    end
    context '新規投稿がうまくいかない時' do
      it 'study_timeが空欄だと投稿できない' do
        @report.study_time = nil
        @report.valid?
        expect(@report.errors.full_messages).to include "Study time can't be blank"
      end
      it 'concentrated_timeが空欄だと投稿できない' do
        @report.concentrated_time = nil
        @report.valid?
        expect(@report.errors.full_messages).to include "Concentrated time can't be blank"
      end
      it 'concentrated_timeがstudy_timeを上回ると投稿できない' do
        @report.study_time = '02:00'
        @report.concentrated_time = '03:00'
        @report.valid?
        expect(@report.errors.full_messages).to include 'Concentrated time is shorter than Study Time'
      end
      it 'good_wayがないと投稿できない' do
        @report.good_way = nil
        @report.valid?
        expect(@report.errors.full_messages).to include "Good way can't be blank"
      end
      it 'achievedがfalseの場合、go_wrongがないと投稿できない' do
        @report.achieved = false
        @report.go_wrong = nil
        @report.valid?
        expect(@report.errors.full_messages).to include "Go wrong can't be blank"
      end
      it 'tomorrow_planがないと投稿できない' do
        @report.tomorrow_plan = nil
        @report.valid?
        expect(@report.errors.full_messages).to include "Tomorrow plan can't be blank"
      end
      it 'study_contentがないと投稿できない' do
        @report.study_content = nil
        @report.valid?
        expect(@report.errors.full_messages).to include "Study content can't be blank"
      end
      it 'adviceがないと登録できない' do
        @report.advice = nil
        @report.valid?
        expect(@report.errors.full_messages).to include "Advice can't be blank"
      end
    end
  end
end
