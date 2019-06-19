# frozen_string_literal: true

require 'rails_helper'

describe 'post', type: :system do
  let!(:user) { FactoryBot.create(:user, name: 'ユーザーA') }
  let!(:other_user) { FactoryBot.create(:user, name: 'ユーザーB') }
  let!(:user_post) { FactoryBot.create(:post, user: user) }
  let!(:other_user_post) { FactoryBot.create(:post, user: other_user) }

  describe 'ログインしている場合' do
    before do
      sign_in_as user
    end
    context '新規投稿' do
      before do
        visit new_post_path
      end
      it '投稿できること' do
        fill_in 'ビール名', with: 'スーパードライ'
        fill_in '感想', with: '美味しい！'
        select '10本', from: '飲んだ量'
        fill_in '飲んだ日', with: '2019/06/1'
        attach_file 'post[picture]', "#{Rails.root}/spec/fixtures/sample.jpg"
        click_button '投稿'
        expect(page).to have_content '投稿しました'
        expect(page).to have_content user_post.beer_name
      end
    end
    context '投稿編集' do
      it '投稿編集ができること' do
        visit user_path(user)
        click_on '編集'
        fill_in 'ビール名', with: 'サッポロビール'
        fill_in '感想', with: '美味しい！'
        select '1本', from: '飲んだ量'
        fill_in '飲んだ日', with: '2019/06/1'
        attach_file 'post[picture]', "#{Rails.root}/spec/fixtures/sample.jpg"
        click_button '投稿'
        expect(page).to have_content '投稿を編集しました'
        expect(page).to have_content 'サッポロビール'
      end
    end
    context '投稿削除' do
      it '投稿削除ができること' do
      end
    end
    context 'ユーザーの投稿一覧' do
      it '投稿一覧が表示されていること' do
        visit user_path(user)
        expect(page).to have_content user.name
        expect(page).to have_content user_post.beer_name
      end
    end
    context '他ユーザーの投稿一覧' do
      it '他ユーザーの投稿一覧が表示されていること' do
        visit user_path(other_user)
        expect(page).to have_content other_user.name
        expect(page).to have_content other_user_post.beer_name
      end
    end
    context '投稿検索ができること' do
      before do
        other_post = FactoryBot.create(:post, beer_name: '違うビール', user: user)
        visit posts_path
      end
      it '検索前の表示が正しいこと' do
        expect(page).to have_content '最近の投稿'
      end
      it '検索結果が正しいこと' do
        fill_in 'キーワード検索', with: '違うビール'
        click_button '検索'
        expect(page).to have_content '検索結果'
        expect(page).to have_content '違うビール'
        expect(page).to_not have_content 'サッポロビール'
      end
    end
  end
end
