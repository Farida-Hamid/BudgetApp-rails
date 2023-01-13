require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validate user test' do
    it 'validate name' do
      subject { User.new(email: 'Shady@gmail.com', password: '123456', password_confirmation: '123456')}
      expect(subject).to_not be_valid
    end

    it 'validate email' do
      subject { User.new(name: 'Shady', password: '123456', password_confirmation: '123456')}
      expect(subject).to_not be_valid
    end

    it 'validate password' do
      subject { User.new(name: 'Shady', email: 'Shady@gmail.com')}
      expect(subject).to_not be_valid
    end
  end
end
