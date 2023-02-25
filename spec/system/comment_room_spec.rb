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
  end
end