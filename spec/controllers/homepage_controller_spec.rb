require 'rails_helper'

RSpec.describe HomepageController, :type => :controller do

  include Devise::TestHelpers

  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    user = FactoryGirl.create(:user)
    sign_in user
  end

  before(:each) do
    request.env["HTTP_REFERER"] = "where_i_came_from"
  end

  describe "GET home" do
    it "returns http success" do
      get :home
      expect(response).to have_http_status(:success)
    end
  end

end
