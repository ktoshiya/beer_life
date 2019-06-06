require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    user = expect(FactoryBot.build(:user)).to be_valid
  end
    
  it "ユーザー名、メール、パスワードがあれば有効" do
    user = User.new(
      name: "toshiya",
      email: "Toshiya123456@example.com",
      password: "123456abc"
    )
    expect(user).to be_valid
  end

  it "ユーザー名がなければ無効" do
    user = FactoryBot.build(:user, name: nil)
    user.valid?
    expect(user.errors[:name]).to include "を入力してください"
  end

  it "メールがなければ無効" do
    user = FactoryBot.build(:user, email: nil)
    user.valid?
    expect(user.errors[:email]).to include "を入力してください"
  end

  it "重複したメールなら無効" do
    FactoryBot.create(:user, email: "Toshiya.1234@example.com")
    user = FactoryBot.build(:user, email: "Toshiya.1234@example.com")
    user.valid?
    expect(user.errors[:email]).to include("はすでに存在します")
  end

  it "パスワードは６文字以上で有効" do
    user = FactoryBot.build(:user, password: "12345")
    user.valid?
    expect(user.errors[:password]).to include ("は6文字以上で入力してください")
  end
end
