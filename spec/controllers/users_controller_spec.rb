require 'rails_helper'

RSpec.describe UsersController, :type => :controller do

  include Devise::TestHelpers
  #routes { Users::Engine.routes }
  #include Users::Engine.routes.url_helpers

  #include Rails.application.routes.url_helpers

  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    user = FactoryGirl.create(:user)
    sign_in user
  end

  describe "GET show" do
    it "returns http success" do
      get :show, :id => 1
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

end
