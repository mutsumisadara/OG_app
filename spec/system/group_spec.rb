require 'rails_helper'
RSpec.describe 'グループ機能', type: :system do
  describe 'グループ機能' do
    context 'グループを新規作成した場合' do
      it '作成したグループが表示される' do
        visit new_group_path
        fill_in 'group[name]', with: 'グループ1'
        click_button '登録'
        expect(page).to have_content 'グループ1'
      end
    end
    context 'グループを編集した場合' do
      it '編集ができる' do
      end
    end
  end
end