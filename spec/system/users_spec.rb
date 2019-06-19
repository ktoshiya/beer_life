# frozen_string_literal: true

require 'rails_helper'

describe 'user', type: :system do
  let!(:user) do
    FactoryBot.create(:user,
                      name: 'ユーザーA',
                      email: 'a@example.com',
                      password: '123456')
  end
  let!(:other_user) do
    FactoryBot.create(:user,
                      name: 'ユーザーB',
                      email: 'b@example.com',
                      password: '123456')
  end
  let!(:user_post) { FactoryBot.create(:post, user: user) }
  let!(:other_user_post) { FactoryBot.create(:post, user: other_user) }

  context '新規登録' do
    it '新規登録ができること' do
      expect do
        visit new_user_registration_path
        fill_in '名前', with: 'としや'
        fill_in 'メールアドレス', with: 'a@example.com'
        fill_in 'パスワード', with: 'password'
        fill_in '確認用パスワード', with: 'password'
        click_button '新規登録'
      end.to change { User.count }.by(0)
    end
  end

  context 'ログイン操作' do
    it 'ログイン後、ユーザー詳細画面が表示されること' do
      visit new_user_session_path
      fill_in 'メールアドレス', with: user.email
      fill_in 'パスワード', with: user.password
      click_button 'ログイン'
      expect(page).to have_content 'ログインしました'
      expect(page).to have_content "#{user.name}さんの記録"
    end
  end

  context 'ログインしている場合' do
    before do
      sign_in_as user
    end
    it 'ユーザー編集が有効であること' do
      visit edit_user_registration_path
      fill_in '名前', with: user.name
      fill_in 'メールアドレス', with: user.email
      fill_in 'パスワード', with: 'password'
      fill_in '確認用パスワード', with: 'password'
      fill_in '現在のパスワード', with: user.password
      attach_file 'user[image]', "#{Rails.root}/spec/fixtures/sample.jpg"
      click_button '更新'
      expect(page).to have_content 'アカウント情報を変更しました'
      expect(page).to have_content user.name
    end
    it 'ユーザー一覧が表示されていること' do
      visit users_path
      expect(page).to have_content user.name
      expect(page).to have_content other_user.name
    end
    it 'ユーザー詳細画面が記事が表示されること' do
      visit user_path(user)
      expect(page).to have_content user.name
    end
    it '他のユーザー詳細画面が表示されること' do
      visit user_path(other_user)
      expect(page).to have_content other_user.name
    end
  end

  context 'ログインしていない場合' do
    it 'ユーザー詳細画面にアクセスできないこと' do
      visit user_path(user)
      expect(page).to have_content 'アカウント登録もしくはログインしてください'
    end
    it 'ユーザー詳細画面にアクセスできないこと' do
      visit users_path
      expect(page).to have_content 'アカウント登録もしくはログインしてください'
    end
    it 'ユーザー編集画面にアクセスできないこと' do
      visit edit_user_registration_path
      expect(page).to have_content 'アカウント登録もしくはログインしてください'
    end
  end
end
