require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザーバリデーション機能' do
    context 'ユーザーの名前が空の場合' do
      it 'バリデーションにかかる' do
        user = User.new(name: '', email: 'test@gmail.com')
        expect(user).not_to be_valid
      end
    end
    context 'ユーザーのメールアドレスが空の場合' do
      it 'バリデーションにかかる' do
        user = User.new(name: 'test', email: '')
        expect(user).not_to be_valid
      end
    end
    context 'ユーザーのパスワードが空の場合' do
      it 'バリデーションにかかる' do
        user = User.new(name: 'test', email: 'test@gmail.com', password: '', password_confirmation: '')
        expect(user).not_to be_valid
      end
    end
    context 'ユーザーの情報が全て記載されている場合' do
      it 'バリデーションが通る' do
        user = User.new(name: 'test', email: 'test@gmail.com', password: '12345678', password_confirmation: '12345678')
        expect(user).to be_valid
      end
    end
  end
end