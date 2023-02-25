require 'rails_helper'
RSpec.describe '予定機能', type: :system do
  describe '予定機能' do
    context '予定を新規作成した場合' do
      it '作成した予定が表示される' do
        user = FactoryBot.create(:user)
        group = FactoryBot.create(:group)
        schedule = FactoryBot.create(:schedule)
        visit user_session_path
        fill_in 'user[email]', with: user.email
        fill_in 'user[password]', with: user.password
        click_button 'ログイン'
        visit schedules_path(group_id: group.id)
        click_link 'スケジュール追加'
        visit new_schedule_path(group_id: group.id)
        fill_in 'schedule[content]', with: schedule.content
        fill_in 'schedule[start_time]', with: schedule.start_time
        click_button '登録'
        expect(page).to have_content 'スケジュールを追加しました'
      end
    end
    context '予定を編集した場合' do
      it '編集した予定が表示される' do
        user = FactoryBot.create(:user)
        group = FactoryBot.create(:group)
        schedule = FactoryBot.create(:schedule)
        second_schedule = FactoryBot.create(:second_schedule)
        visit user_session_path
        fill_in 'user[email]', with: user.email
        fill_in 'user[password]', with: user.password
        click_button 'ログイン'
        visit edit_schedule_path(schedule.id)
        fill_in 'schedule[content]', with: second_schedule.content
        fill_in 'schedule[start_time]', with: second_schedule.start_time
        click_button '登録'
        expect(page).to have_content '更新しました'
      end
    end
    context '予定を削除した場合' do
      it '削除ができる' do
        user = FactoryBot.create(:user)
        animal = FactoryBot.create(:animal)
        group = FactoryBot.create(:group)
        schedule = FactoryBot.create(:schedule)
        visit user_session_path
        fill_in 'user[email]', with: user.email
        fill_in 'user[password]', with: user.password
        click_button 'ログイン'
        visit schedule_path(schedule.id)
        click_link '削除'
        page.accept_confirm
        expect(page).to have_content '削除しました'
      end
    end
  end
end