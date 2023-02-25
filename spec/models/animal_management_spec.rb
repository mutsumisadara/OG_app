require 'rails_helper'

RSpec.describe AnimalManagement, type: :model do
  describe '動物管理バリデーション機能' do
    context 'カルテの日付が空の場合' do
      it 'バリデーションにかかる' do
        animal = FactoryBot.create(:animal)
        animal_management = AnimalManagement.new(recorded_on: '', content: 'おやつ', temprature: '39.0', animal_id: animal.id)
        expect(animal_management).not_to be_valid
      end
    end
    context 'カルテの内容が空の場合' do
      it 'バリデーションにかかる' do
        animal = FactoryBot.create(:animal)
        animal_management = AnimalManagement.new(recorded_on: 2023-01-01, content: '', temprature: '39.0', animal_id: animal.id)
        expect(animal_management).not_to be_valid
      end
    end
    context 'カルテの体温が空の場合' do
      it 'バリデーションにかかる' do
        animal = FactoryBot.create(:animal)
        animal_management = AnimalManagement.new(recorded_on: 2023-01-01, content: 'おやつ', temprature: '', animal_id: animal.id)
        expect(animal_management).not_to be_valid
      end
    end
    context 'カルテの情報が正しく入力されている場合' do
      it 'バリデーションにかからない' do
        animal = FactoryBot.create(:animal)
        animal_management = AnimalManagement.new(recorded_on: 2023-01-01, content: 'おやつ', temprature: '39.0', animal_id: animal.id)
        expect(animal_management).to be_valid
      end
    end
  end
end
