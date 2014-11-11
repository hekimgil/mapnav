require 'rails_helper'

RSpec.describe UsersController, :type => :controller do

  describe "GET new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

#    it "should have the right title" do
#      get :new
#      expect(response).to have_selector("title", :text => "Register")
#    end
  end

end
