require 'rails_helper'

RSpec.describe Schedule, type: :model do
  describe '予定バリデーション機能' do
    context '予定の内容が空の場合' do
      it 'バリデーションにかかる' do
        group = FactoryBot.create(:group)
        schedule = Schedule.new(content: '', start_time: 2023-01-01, group_id: group.id)
        expect(schedule).not_to be_valid
      end
    end
    context '予定の日付が空の場合' do
      it 'バリデーションにかかる' do
        group = FactoryBot.create(:group)
        schedule = Schedule.new(content: '予防接種', start_time: '', group_id: group.id)
        expect(schedule).not_to be_valid
      end
    end
    context '予定が全て入力されている場合' do
      it 'バリデーションにかからない' do
        group = FactoryBot.create(:group)
        schedule = Schedule.new(content: '予防接種', start_time: '2023-01-01', group_id: group.id)
        expect(schedule).to be_valid
      end
    end
  end
end
