require 'rails_helper'
RSpec.describe User, type: :system do
describe 'ユーザー機能' do
  context 'ユーザーが新規登録した場合' do
    it '新規登録ができる' do
      visit new_user_registration_path
      fill_in 'user[name]', with: 'test'
      fill_in 'user[email]', with: 'test@gmail.com'
      fill_in 'user[password]', with: 'testtest'
      fill_in 'user[password_confirmation]', with: 'testtest'
      click_button 'アカウント登録'
      expect(current_path).to eq user_path(User.last)
    end
  end
  context 'ユーザーがログインせずグループ一覧画面に飛ぼうとした場合' do
    it 'ログイン画面に遷移する' do
      visit groups_path
      expect(current_path).to eq new_user_session_path
      expect(current_path).not_to eq groups_path
    end
  end
  context 'セッション機能のテスト' do
    it 'ログインができる' do
      user = FactoryBot.create(:user)
      visit user_session_path
      fill_in 'user[email]', with: user.email
      fill_in 'user[password]', with: user.password
      click_button 'ログイン'
      visit user_path(User.first)
      expect(page).to have_content('ログアウト')
    end
  end
  context 'セッション機能のテスト' do
    it 'ログアウトができる' do
      user = FactoryBot.create(:user)
      visit user_session_path
      fill_in 'user[email]', with: user.email
      fill_in 'user[password]', with: user.password
      click_button 'ログイン'
      visit user_path(User.first)
      expect(page).to have_content('ログアウト')
      click_link 'ログアウト'
      expect(current_path).to eq user_session_path
      end
    end
  end
end