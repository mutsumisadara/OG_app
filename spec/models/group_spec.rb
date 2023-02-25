require 'rails_helper'

RSpec.describe Group, type: :model do
  describe 'グループバリデーション機能' do
    context 'グループーの名前が空の場合' do
      it 'バリデーションにかかる' do
        group = Group.new(name: '')
        expect(group).not_to be_valid
      end
    end
    context 'グループーの名前入力されている場合' do
      it 'バリデーションに通る' do
        group = Group.new(name: 'group')
        expect(group).to be_valid
      end
    end
  end
end
