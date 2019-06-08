require 'rails_helper'

RSpec.describe User, type: :model do
  include CarrierWave::Test::Matchers

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
    FactoryBot.create(:user, email: "1234@example.com")
    user = FactoryBot.build(:user, email: "1234@example.com")
    user.valid?
    expect(user.errors[:email]).to include("はすでに存在します")
  end

  it "パスワードは６文字以上で有効" do
    user = FactoryBot.build(:user, password: "12345")
    user.valid?
    expect(user.errors[:password]).to include ("は6文字以上で入力してください")
  end

  it "画像ファイルが有効" do
    formats = %w(jpg jpeg gif png)
    formats.each do |format|
     image_path = File.join(Rails.root, "spec/fixtures/sample.#{format}")
     user = FactoryBot.build(:user, image: File.open(image_path))
     expect(user).to be_valid
    end
  end

  it "画像ファイルが無効" do
    image_path = File.join(Rails.root, "spec/fixtures/sample.rb")
    user = FactoryBot.build(:user, image: File.open(image_path))
    expect(user).not_to be_valid
  end

  it "リサイズがされていれば有効" do
    image_path = File.join(Rails.root, "spec/fixtures/sample.jpg")
    user = FactoryBot.create(:user, image: File.open(image_path))
    expect(user.image).to be_no_larger_than(400, 400)
  end

end
