require 'rails_helper'

RSpec.describe Group, type: :model do
  describe 'validate group test' do
    it 'validate name' do
      subject {Group.new(author_id: @user.id, icon:'https://upload.wikimedia.org/wikipedia/commons/thumb/8/83/Simple_icon_location.svg/1280px-Simple_icon_location.svg.png')}
      expect(subject).to_not be_valid
    end

    it 'validate icon' do
      subject {Group.new(author_id: @user.id, name: 'Food')}
      expect(subject).to_not be_valid
    end
  end
end
