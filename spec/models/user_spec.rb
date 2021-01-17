require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    context '新規登録がうまくいく時' do
      it 'email,password,password_confirmation,nickname,birthday,study_genre_id,self_introductionがあれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordが6文字以上で登録できる' do
        @user.password = '111aaa'
        @user.password_confirmation = '111aaa'
        expect(@user).to be_valid
      end
      it 'self_introductionが空でも登録できる' do
        @user.self_introduction = nil
        expect(@user).to be_valid
      end
    end
    context '新規登録がうまくいかない時' do
      it 'emailがないと登録できない' do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include 'Eメールを入力してください'
      end
      it 'emailに@がないと登録できない' do
        @user.email = 'email'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Eメールは不正な値です'
      end
      it 'emailが重複していると登録できない' do
        @user.email = 'aaa@mail.com'
        @user.save
        @user1 = FactoryBot.build(:user)
        @user1.email = 'aaa@mail.com'
        @user1.valid?
        expect(@user1.errors.full_messages).to include 'Eメールはすでに存在します'
      end
      it 'passwordがないと登録できない' do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include 'パスワードを入力してください'
      end
      it 'passwordが英字のみだと登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include 'パスワードには半角英字と半角数字を両方含めてください'
      end
      it 'passwordが数字のみだと登録できない' do
        @user.password = '111111'
        @user.password_confirmation = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include 'パスワードには半角英字と半角数字を両方含めてください'
      end
      it 'passwordが5文字以下だと登録できない' do
        @user.password = '11aaa'
        @user.password_confirmation = '11aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include 'パスワードは6文字以上で入力してください'
      end
      it 'passwordとpassword_confirmationが一致していないと登録できない' do
        @user.password = '111aaa'
        @user.password_confirmation = '222aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include 'パスワード（確認用）とパスワードの入力が一致しません'
      end
      it 'nicknameがないと登録できない' do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include 'ニックネームを入力してください'
      end
      it 'birthdayがないと登録できない' do
        @user.birthday = nil
        @user.valid?
        expect(@user.errors.full_messages).to include '誕生日を入力してください'
      end
      it 'study_genre_idが1だと登録できない' do
        @user.study_genre_id = 1
        @user.valid?
        expect(@user.errors.full_messages).to include '勉強していることを選択してください'
      end
    end
  end
end
