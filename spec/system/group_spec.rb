require 'rails_helper'
RSpec.describe 'グループ機能', type: :system do
  describe 'グループ機能' do
    context 'グループを新規作成した場合' do
      it '作成したグループが表示される' do
        user = FactoryBot.create(:user)
        visit user_session_path
        fill_in 'user[email]', with: user.email
        fill_in 'user[password]', with: user.password
        click_button 'ログイン'
        visit new_group_path
        fill_in 'group[name]', with: 'グループ1'
        click_button '登録'
        expect(page).to have_content 'グループ1'
      end
    end
    context 'グループを作成した場合管理者は' do
      it 'グループの編集ができる' do
        user = FactoryBot.create(:user)
        group = FactoryBot.create(:group)
        second_group = FactoryBot.create(:second_group)
        visit user_session_path
        fill_in 'user[email]', with: user.email
        fill_in 'user[password]', with: user.password
        click_button 'ログイン'
        visit edit_group_path(group.id)
        fill_in 'group[name]', with: second_group.name
        click_button '登録'
        expect(page).to have_content 'group2'
      end
    end
    context 'グループを作成した場合管理者じゃない場合は' do
      it 'グループの編集の文字が表示されない' do
        user = FactoryBot.create(:second_user)
        group = FactoryBot.create(:group)
        visit user_session_path
        fill_in 'user[email]', with: user.email
        fill_in 'user[password]', with: user.password
        click_button 'ログイン'
        visit groups_path
        expect(page).not_to have_content '編集'
      end
    end
    context 'グループを作成した場合管理者は' do
      it 'グループの削除ができる' do
        user = FactoryBot.create(:user)
        group = FactoryBot.create(:group)
        visit user_session_path
        fill_in 'user[email]', with: user.email
        fill_in 'user[password]', with: user.password
        click_button 'ログイン'
        visit groups_path
        click_link '削除', match: :first
        page.accept_confirm
        expect(page).not_to have_content 'group1'
      end
    end
    context 'グループを作成した場合管理者じゃない場合は' do
      it 'グループの削除の文字が表示されない' do
        user = FactoryBot.create(:second_user)
        group = FactoryBot.create(:group)
        visit user_session_path
        fill_in 'user[email]', with: user.email
        fill_in 'user[password]', with: user.password
        click_button 'ログイン'
        visit groups_path
        expect(page).not_to have_content '削除'
      end
    end
  end
end