require 'rails_helper'

RSpec.describe Animal, type: :model do
  describe '動物バリデーション機能' do
    context '動物の名前が空の場合' do
      it 'バリデーションにかかる' do
        group = FactoryBot.create(:group)
        animal = Animal.new(name: '', birthday: 2023-01-01, group_id: group.id)
        expect(animal).not_to be_valid
      end
    end
    context '動物の誕生日が空の場合' do
      it 'バリデーションにかかる' do
        group = FactoryBot.create(:group)
        animal = Animal.new(name: 'animal', birthday: '', group_id: group.id)
        expect(animal).not_to be_valid
      end
    end
    context '動物の情報を入力した場合' do
      it 'バリデーションにかからない' do
        group = FactoryBot.create(:group)
        animal = Animal.new(name: 'animal', birthday: 2023-01-01, group_id: group.id)
        expect(animal).to be_valid
      end
    end
  end
end