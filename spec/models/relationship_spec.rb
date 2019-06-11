require 'rails_helper'

RSpec.describe Relationship, type: :model do
  let(:user_a) { FactoryBot.create(:user, name: "user_a") }
  let(:user_b) { FactoryBot.create(:user, name: "user_b") }
  
  it "フォローがあれば有効" do
    relationship = Relationship.new(
      follower_id: user_a.id,
      followed_id: user_b.id
    )
    expect(relationship).to be_valid
  end
  it "フォローされていれば有効" do
    relationship = Relationship.new(
      follower_id: user_b.id,
      followed_id: user_a.id
    )
    expect(relationship).to be_valid
  end
  it "フォローがなければ無効" do
    relationship = Relationship.new(
      follower_id: user_a.id,
      followed_id: nil
    )
    expect(relationship).to_not be_valid
  end
  it "フォローがされていなければ無効" do
    relationship = Relationship.new(
      follower_id: nil,
      followed_id: user_b.id
    )
    expect(relationship).to_not be_valid
  end
end
