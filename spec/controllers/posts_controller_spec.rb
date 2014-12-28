require 'rails_helper'

RSpec.describe PostsController, :type => :controller do

  include Devise::TestHelpers

  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    user = FactoryGirl.create(:user)
    sign_in user
  end

  before(:each) do
    request.env["HTTP_REFERER"] = "where_i_came_from"
  end

  describe "POST create" do
    it "shouldn't create a post if data is invalid" do
      expect{post :create}.to change(Post, :count).by(0)
    end
  end

  describe "POST create success" do
    it "should create a post if data is valid" do
      expect{post :create, {'post' => {'content' =>"posts controller rspec"}}}.to change(Post, :count).by(1)
    end
  end

end
