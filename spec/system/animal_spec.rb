require 'rails_helper'
RSpec.describe '動物機能', type: :system do
  describe '動物機能' do
    context '動物を新規作成した場合' do
      it '作成した動物が表示される' do
        user = FactoryBot.create(:user)
        animal = FactoryBot.create(:animal)
        group = FactoryBot.create(:group)
        animal_management = FactoryBot.create(:animal_management)
        visit user_session_path
        fill_in 'user[email]', with: user.email
        fill_in 'user[password]', with: user.password
        click_button 'ログイン'
        visit group_path(user.group_id)
        click_link '天使登録'
        visit new_animal_path
        fill_in 'animal[name]', with: animal.name
        fill_in 'animal[birthday]', with: animal.birthday
        click_button '登録'
        expect(page).to have_content 'animal1'
      end
    end
    context '動物を編集した場合' do
      it '編集ができる' do
        user = FactoryBot.create(:user)
        animal = FactoryBot.create(:animal)
        second_animal = FactoryBot.create(:second_animal)
        group = FactoryBot.create(:group)
        animal.group_id = group.id
        visit user_session_path
        fill_in 'user[email]', with: user.email
        fill_in 'user[password]', with: user.password
        click_button 'ログイン'
        visit edit_animal_path(animal.id)
        fill_in 'animal[name]', with: second_animal.name
        fill_in 'animal[birthday]', with: second_animal.birthday
        click_button '登録'
        expect(page).to have_content 'animal2'
      end
    end
    context '動物を削除した場合' do
      it '削除ができる' do
        user = FactoryBot.create(:user)
        animal = FactoryBot.create(:animal)
        group = FactoryBot.create(:group)
        visit user_session_path
        fill_in 'user[email]', with: user.email
        fill_in 'user[password]', with: user.password
        click_button 'ログイン'
        visit animal_path(animal.id)
        click_link '削除'
        page.accept_confirm
        expect(page).not_to have_content 'animal1'
      end
    end
  end
end