require 'rails_helper'

RSpec.describe Payment, type: :model do
  describe 'validate payment test' do
    it 'validate name' do
      subject {Payment.new(auther_id: 1, amount: 23, group_id: 1)}
      expect(subject).to_not be_valid
    end

    it 'validate amount' do
      subject {Payment.new(auther_id: 1, name: 'Burger', group_id: 1)}
      expect(subject).to_not be_valid
    end

    it 'validate group' do
      subject {Payment.new(auther_id: 1, name: 'Burger', amount: 23)}
      expect(subject).to_not be_valid
    end
  end
end
