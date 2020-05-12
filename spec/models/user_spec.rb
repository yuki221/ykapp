require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'バリデーションの検証' do
    before do
      @user = FactoryBot.build(:user)
    end

    it '名前、メールアドレス、パスワードがあれば有効な状態であること' do
    user = User.new(
      username: 'sample',
      email: 'sample@example.com',
      password: '123456'
    )
    expect(user).to be_valid
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
        @user.password = @user.password_confirmation = 'a' * 5
        assert_not @user.valid?
      end

      it 'パスワードと確認用パスワードが一致していないと無効であること' do
        @user.password = 'password'
        @user.password_confirmation = 'invalid_password'
        @user.valid?
        expect(@user.errors[:password_confirmation]).to include('とパスワードの入力が一致しません')
      end
    end

   it '1 + 1 は 2 になること' do
    expect(1 + 1).to eq 2
  end
  it '10 - 1 は 9 になること' do
    expect(10 - 1).to eq 9
  end
  end
end
