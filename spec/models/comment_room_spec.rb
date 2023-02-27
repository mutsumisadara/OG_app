require 'rails_helper'

RSpec.describe CommentRoom, type: :model do
  describe 'コメントバリデーション機能' do
    context 'コメントの内容が空の場合' do
      it 'バリデーションにかかる' do
        group = FactoryBot.create(:group)
        comment_room = CommentRoom.new(content: '', group_id: group.id)
        expect(comment_room).not_to be_valid
      end
    end
    context 'コメントの内容が140文字以上の場合' do
      it 'バリデーションにかかる' do
        group = FactoryBot.create(:group)
        comment_room = CommentRoom.new(content: 'a'* 141, group_id: group.id)
        expect(comment_room).not_to be_valid
      end
    end
    context 'コメントの内容が入力されている場合' do
      it 'バリデーションにかからない' do
        group = FactoryBot.create(:group)
        comment_room = CommentRoom.new(content: 'Hello World', group_id: group.id)
        expect(comment_room).to be_valid
      end
    end
  end
end