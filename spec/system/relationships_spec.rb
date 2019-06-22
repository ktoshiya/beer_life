# frozen_string_literal: true

require 'rails_helper'

describe 'フォロー機能', type: :system do
  let!(:user) { FactoryBot.create(:user, name: 'ユーザーA') }
  let!(:other_user) { FactoryBot.create(:user, name: 'ユーザーB') }

  let(:active_relationship) do
    user.active_relationships.create(
      follower_id: user.id, followed_id: other_user.id
    )
  end
  let(:passive_relationship) do
    user.passive_relationships.create(
      follower_id: other_user.id, followed_id: user.id
    )
  end

  describe 'ログインしている場合' do
    before do
      sign_in_as user
    end
    context 'フォローできること' do
      it 'ユーザー一覧画面でフォローができること' do
        visit users_path
        expect do
          find("#follow_form_#{other_user.id}").click_button 'フォロー'
          sleep 2
        end.to change(Relationship, :count).by(1)
      end
      it 'ユーザー一覧画面でフォロー解除ができること' do
        active_relationship
        visit users_path
        expect do
          find("#follow_form_#{other_user.id}").click_button 'フォロー中'
          sleep 2
        end.to change(Relationship, :count).by(-1)
      end
      it 'フォロー一覧画面でフォロー解除ができること' do
        active_relationship
        visit following_user_path(user)
        expect do
          find("#follow_form_#{other_user.id}").click_button 'フォロー中'
          sleep 2
        end.to change(Relationship, :count).by(-1)
      end
      it 'フォロワー一覧画面でフォローができること' do
        passive_relationship
        visit followers_user_path(user)
        expect do
          find("#follow_form_#{other_user.id}").click_button 'フォロー'
          sleep 2
        end.to change(Relationship, :count).by(1)
      end
      it 'フォロワー一覧画面でフォロー解除ができること' do
        active_relationship
        passive_relationship
        visit followers_user_path(user)
        expect do
          find("#follow_form_#{other_user.id}").click_button 'フォロー中'
          sleep 2
        end.to change(Relationship, :count).by(-1)
      end
    end
    context 'ユーザー画面でカウント表示が適切であること' do
      before do
        active_relationship
        passive_relationship
      end
      it 'ユーザーのフォロー、フォロワー数が表示されていること' do
        visit user_path(user)
        expect(page).to have_content 'フォロー1'
        expect(page).to have_content 'フォロワー1'
      end
    end
    context '自身のフォローボタンが表示されていないこと' do
      it 'フォローボタンが表示されていないこと' do
        visit users_path
        expect(
          find("#follow_form_#{other_user.id}")
        ).to_not have_content 'フォロー', 'フォロー中'
      end
    end
  end
  describe '未ログイン' do
    it 'フォローページが表示されないこと' do
      visit following_user_path(user)
      expect(page).to have_content 'アカウント登録もしくはログインしてください。'
    end
    it 'フォロワーページが表示されないこと' do
      visit followers_user_path(user)
      expect(page).to have_content 'アカウント登録もしくはログインしてください。'
    end
  end
end
