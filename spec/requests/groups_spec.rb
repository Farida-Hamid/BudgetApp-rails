require 'rails_helper'

RSpec.describe "Groups", type: :request do
  include Devise::Test::IntegrationHelpers

  describe "GET /index" do

    before(:each) do
      @user = User.create(name: 'Fady', email: 'fhady@gmail.com', password: '123456', password_confirmation: '123456')
      @group = Group.create(author_id: @user.id, name: 'Food', icon:'https://upload.wikimedia.org/wikipedia/commons/thumb/8/83/Simple_icon_location.svg/1280px-Simple_icon_location.svg.png')

      sign_in @user
    end

    it 'user can access groups#index' do
      get user_groups_path(@user.id)
      expect(response).to have_http_status(:success)
    end

    it 'user can access groups#new' do
      get new_user_group_path(@user.id)
      expect(response).to have_http_status(:success)
    end
  end
end
