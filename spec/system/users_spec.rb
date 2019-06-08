require "rails_helper"

describe "ユーザー", type: :system do
  before do
    # ユーザーAを新規作成する
  end

  context "新規登録" do
    it "新規作成後、ユーザー詳細画面にリダイレクトする" do
    end
  end

  context "ログイン" do
    before do
      #ユーザーAでログインする
    end
    it "ユーザー詳細画面が表示される" do

    end
  end

  context "ユーザー編集機能" do
    before do
      #ユーザーAでログインする
    end
    it "成功後、ユーザー詳細画面がリダイレクトされ変更されている" do

    end
    it "ユーザー編集が失敗したときに元の画面にリダイレクト" do

    end
    it "他のユーザーの編集ページにはアクセスできない" do
      
    end
  end

  context "ユーザー一覧機能" do
    before do
      #ユーザーAでログインする
    end
    it "ユーザーをクリックした時にユーザー詳細画面が表示される" do

    end
  end

  context "ユーザー詳細機能" do
    before do
      #ユーザーAでログインする
    end
    it "記事が表示される" do

    end
    it "ログインユーザーの画面であればボタンが表示される" do

    end
    it "ログインユーザーの画面でなければボタンが表示されない" do

    end
  end
end