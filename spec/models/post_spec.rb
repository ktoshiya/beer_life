require 'rails_helper'

RSpec.describe Post, type: :model do

  let(:user_a) { FactoryBot.create(:user, name: 'ユーザーA', email: 'a@exmple.com') }
  let(:user_b) { FactoryBot.create(:user, name: 'ユーザーB', email: 'b@exmple.com') }

  describe 'FactoryBotが有効であること' do
    it 'user_aが有効であること' do
      expect(user_a).to be_valid
    end
    it 'user_bが有効であること' do
      expect(user_b).to be_valid
    end
  end

  describe "postモデルが有効であること"
    it "ビール名、コンテンツ、カウント、評価が有効であること" do
      user = user_a
      post = user.posts.create(
        beer_name: "スーパードライ",
        content: "美味しかった！",
        count: 10,
        drink_date: '2010-10-11'
      )
    end
    describe "ビール名" do
      it "ビール名を50文字以上で無効" do
        post = Post.create(beer_name: "a"* 51)
        post.valid?
        expect(post.errors[:beer_name]).to include "は50文字以内で入力してください"
      end
      it "ビール名がなければ無効" do
        post = Post.create(beer_name: nil)
        post.valid?
        expect(post.errors[:beer_name]).to include "を入力してください"
      end
    end
    describe "コンテンツ" do
      it "コンテンツは140文字以内で無効" do
        post = Post.create(content: "a"* 141)
        post.valid?
        expect(post.errors[:content]).to include "は140文字以内で入力してください"
      end
      it "コンテンツがなければ無効" do
        post = Post.create(content: nil)
        post.valid?
        expect(post.errors[:content]).to include "を入力してください"
      end
    end
    describe "カウント" do
      it "カウントは11以上で無効" do
        post = Post.create(count: 11)
        post.valid?
        expect(post.errors[:count]).to include "は一覧にありません"
      end
      it "カウントがなければ無効" do
        post = Post.create(count: nil)
        post.valid?
        expect(post.errors[:count]).to include "を入力してください"
      end
      it "カウントが文字列ならば無効" do
        post = Post.create(count: "１")
        post.valid?
        expect(post.errors[:count]).to include "は一覧にありません"
      end
    end
    it "飲んだ日は日付でなければ無効" do

    end
end
