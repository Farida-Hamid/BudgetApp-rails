require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validation test' do
    it 'validate name' do
      subject { User.new(email: 'Shady@gmail.com', password: '123456', password_confirmation: '123456')}
      expect(subject).to_not be_valid
    end

    it 'validate name' do
      subject { User.new(name: 'Shady', password: '123456', password_confirmation: '123456')}
      expect(subject).to_not be_valid
    end

    it 'validate name' do
      subject { User.new(name: 'Shady', email: 'Shady@gmail.com')}
      expect(subject).to_not be_valid
    end
  end
end
