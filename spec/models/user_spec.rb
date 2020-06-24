require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'バリデーションについての検証' do
    before do
      @user = FactoryBot.build(:user)
    end

    it '名前、メールアドレス、パスワードがあれば有効な状態であること' do
    expect(@user).to be_valid
  end

  describe '存在性の検証' do
    it '名前が無ければ無効な状態であること' do
      @user.username = nil
      @user.valid?
      expect(@user.errors).to be_added(:username, :blank)
    end

    it 'メールアドレスが無ければ無効な状態であること' do
      @user.email = nil
      @user.valid?
      expect(@user.errors).to be_added(:email, :blank)
    end

    it 'パスワードが無ければ無効な状態であること' do
      @user.password = nil
      @user.valid?
      expect(@user.errors).to be_added(:password, :blank)
    end
  end

  describe '一意性の検証' do
    it '重複したメールアドレスは登録できないこと' do
        @user.save
        duplicate_user = @user.dup
        duplicate_user.email = @user.email
        expect(duplicate_user).to be_invalid
      end

    it 'メールアドレス登録時に小文字に変換されること' do
        mixed_case_email = 'TesT@ExAMPle.CoM'
        @user.email = mixed_case_email
        @user.save
        expect(@user.reload.email).to eq mixed_case_email.downcase
      end
  end

  context 'ユーザー名についての検証' do
      it 'ユーザー名が30文字を超えると無効であること' do
        @user.username = 'a' * 31
        @user.valid?
        expect(@user.errors[:username]).to include('は30文字以内で入力してください')
      end

      it 'ユーザー名が30文字以内だと有効であること' do
        @user.username = 'a' * 30
        @user.valid?
        expect(@user).to be_valid
      end
    end

  context 'パスワードについての検証' do
      it 'パスワードがなければ無効であること' do
        @user.password = nil
        @user.valid?
        expect(@user.errors).to be_added(:password, :blank)
      end

      it 'パスワードが6文字未満なら無効であること' do
        @user.password = @user.password_confirmation = 'a' * 5
        @user.valid?
        expect(@user.errors).to be_added(:password, :too_short, count: 6)
      end

      it 'パスワードが6文字以上なら有効であること' do
        @user.password = @user.password_confirmation = 'a' * 6
        @user.valid?
        expect(@user).to be_valid
      end

      it 'パスワードと確認用パスワードが一致していないと無効であること' do
        @user.password = 'password'
        @user.password_confirmation = 'invalid_password'
        @user.valid?
        expect(@user.errors[:password_confirmation]).to include('が一致しません')
      end
    end

    context 'プロフィールについての検証' do
      it 'プロフィールの文字数が300字以内だと有効であること' do
        @user.profile = 'a' * 300
        expect(@user).to be_valid
      end
    end
  end
end
