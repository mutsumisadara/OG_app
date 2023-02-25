require 'rails_helper'
RSpec.describe 'コメント機能', type: :system do
  describe 'コメント機能' do
    context 'コメントを作成した場合' do
      it '作成したコメントが表示される' do
        user = FactoryBot.create(:user)
        group = FactoryBot.create(:group)
        comment_room = FactoryBot.create(:comment_room)
        visit user_session_path
        fill_in 'user[email]', with: user.email
        fill_in 'user[password]', with: user.password
        click_button 'ログイン'
        visit group_path(user.group_id)
        click_link 'チャットルーム'
        fill_in 'comment_room[content]', with: comment_room.content
        click_button '送信'
        expect(page).to have_content 'comment1'
      end
    end
    context 'コメントを編集した場合' do
      it 'コメントが編集できる' do
        user = FactoryBot.create(:user)
        group = FactoryBot.create(:group)
        comment_room = FactoryBot.create(:comment_room)
        second_comment_room = FactoryBot.create(:comment_room)
        visit user_session_path
        fill_in 'user[email]', with: user.email
        fill_in 'user[password]', with: user.password
        click_button 'ログイン'
        visit edit_comment_room_path(comment_room.id)
        fill_in 'comment_room[content]', with: 'content2'
        click_button '登録'
        expect(page).to have_content 'チャットを更新しました'
      end
    end
    context 'コメントを削除した場合' do
      it 'コメントの削除ができる' do
        user = FactoryBot.create(:user)
        comment_room = FactoryBot.create(:comment_room)
        group = FactoryBot.create(:group)
        visit user_session_path
        fill_in 'user[email]', with: user.email
        fill_in 'user[password]', with: user.password
        click_button 'ログイン'
        visit group_path(user.group_id)
        click_link 'チャットルーム'
        fill_in 'comment_room[content]', with: comment_room.content
        click_button '送信'
        visit comment_rooms_path(group_id: user.group_id)
        click_on '削除', match: :first
        page.accept_confirm
        expect(page).not_to have_content 'comment1'
      end
    end
  end
end