require "rails_helper"

describe "フォロー機能", type: :system do
  let!(:user) {FactoryBot.create(:user, name:"ユーザーA")}
  let!(:other_user) {FactoryBot.create(:user, name:"ユーザーB")}

  describe "ログインしている場合" do
    before do
      sign_in_as user
    end
    context "フォローできること" do
      it "ユーザー一覧画面でフォローができること" do
        visit users_path
        expect {
          find("#follow_form_#{other_user.id}").click_button "フォロー"
          sleep 2
        }.to change(Relationship, :count).by(1)
      end
      it "ユーザー一覧画面でフォロー解除ができること" do
      end
      it "フォローワー画面でフォローができること" do
      end
      it "フォロワー画面でフォロー解除ができること" do
      end
    end

    #ユーザーのフォロー数が表示されていること
    #ユーザーのフォワー数が表示されていること
    #自身のときはフォローボタンが表示されていないこと

    #ログインしていないとき
    #フォローが表示されないこと
    #フロワーが表示されないこと
  end
end
