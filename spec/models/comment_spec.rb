# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'コメントのバリデーションについての検証' do
    before do
      @user = FactoryBot.create(:user)
      @post = FactoryBot.create(:post, user: @user)
      @comment = @user.comments.create(
        content: 'good place!',
        post: @post
      )
    end

    it 'コメントが有効であること' do
      expect(@comment).to be_valid
    end

    it 'コメントが空欄であるなら無効であること' do
      @comment.content = nil
      @comment.valid?
      expect(@comment.errors).to be_added(:content, :blank)
    end

    it 'コメントにuser_idがなければ無効であること' do
      @comment = Comment.create(user_id: nil)
      @comment.valid?
      expect(@comment.errors[:content]).to include 'を入力してください'
    end

    it 'コメントが501文字以上であるなら無効であること' do
      @comment.content = 'a' * 101
      @comment.valid?
      expect(@comment.errors).to be_added(:content, :too_long, count: 100)
    end

    it 'コメントが100文字以内だと有効であること' do
      @comment.content = 'a' * 100
      expect(@comment).to be_valid
    end
  end
end
