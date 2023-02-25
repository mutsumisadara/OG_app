require 'rails_helper'
RSpec.describe '動物管理機能', type: :system do
  describe '動物管理機能' do
    context 'カルテを新規作成した場合' do
      it '作成したカルテが表示される' do
        user = FactoryBot.create(:user)
        animal = FactoryBot.create(:animal)
        animal_management = FactoryBot.create(:animal_management)
        visit user_session_path
        fill_in 'user[email]', with: user.email
        fill_in 'user[password]', with: user.password
        click_button 'ログイン'
        visit animal_path(animal.id)
        click_link 'カルテ登録'
        fill_in 'animal_management[recorded_on]', with: animal_management.recorded_on
        fill_in 'animal_management[content]', with: animal_management.content
        fill_in 'animal_management[temprature]', with: animal_management.temprature
        click_button '登録'
        expect(page).to have_content animal_management.recorded_on
      end
    end
    context 'カルテを編集した場合' do
      it 'カルテが編集できる' do
        user = FactoryBot.create(:user)
        animal = FactoryBot.create(:animal)
        animal_management = FactoryBot.create(:animal_management)
        second_animal_management = FactoryBot.create(:second_animal_management)
        visit user_session_path
        fill_in 'user[email]', with: user.email
        fill_in 'user[password]', with: user.password
        click_button 'ログイン'
        visit edit_animal_animal_management_path(animal.id, animal_management.id)
        fill_in 'animal_management[recorded_on]', with: second_animal_management.recorded_on
        fill_in 'animal_management[content]', with: second_animal_management.content
        fill_in 'animal_management[temprature]', with: second_animal_management.temprature
        click_button '更新'
        expect(page).to have_content second_animal_management.recorded_on
      end
    end
    context 'カルテを削除した場合' do
      it 'カルテが削除できる' do
        user = FactoryBot.create(:user)
        animal = FactoryBot.create(:animal)
        animal_management = FactoryBot.create(:animal_management)
        visit user_session_path
        fill_in 'user[email]', with: user.email
        fill_in 'user[password]', with: user.password
        click_button 'ログイン'
        visit animal_animal_management_path(animal.id, animal_management.id)
        click_link '削除'
        page.accept_confirm
        expect(page).not_to have_content animal_management.recorded_on
      end
    end
  end
end