require 'rails_helper'

RSpec.describe Like, type: :model do
  let(:user) { FactoryBot.create(:user, name: 'ユーザーA', email: 'a@exmple.com') }
  let(:other_user) { FactoryBot.create(:user, name: 'ユーザーB', email: 'b@exmple.com') }
  let(:other_user_post) { FactoryBot.create(:post, user: other_user) }
  let(:like) { FactoryBot.create(:like, user: user, post: other_user_post) }

  it "いいねが有効であること" do
    expect(like).to be_valid
  end
  it "いいね解除が有効であること" do
    like
    expect{ like.destroy }.to change{ Like.count }.by(-1)
  end
end
