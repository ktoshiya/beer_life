require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:user) { FactoryBot.create(:user, name: 'ユーザーA', email: 'a@exmple.com') }
  let(:other_user) { FactoryBot.create(:user, name: 'ユーザーB', email: 'b@exmple.com') }
  let(:other_user_post) { FactoryBot.create(:post, user: other_user) }

  describe 'FactoryBotが有効であること' do
    it 'userが有効であること' do
      expect(user).to be_valid
    end
    it 'other_userが有効であること' do
      expect(other_user).to be_valid
    end
    it 'other_user_postが有効であること' do
      expect(other_user_post).to be_valid
    end
  end

  describe 'commentモデルが有効であること' do
    it 'コンテンツが有効であること' do
      comment = user.other_user_post.comments.create(comment: '美味しそう！')
      expect(comment).to be_valid
    end
    describe 'コメント' do
      it 'コンテンツは140文字以内で無効' do
        comment = Comment.create(content: 'a' * 141)
        comment.valid?
        expect(comment.errors[:content]).to include 'は140文字以内で入力してください'
      end
      it 'コンテンツがなければ無効' do
        comment = Comment.create(content: nil)
        comment.valid?
        expect(comment.errors[:content]).to include 'を入力してください'
      end
    end
  end
end