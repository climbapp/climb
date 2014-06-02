require 'spec_helper'

describe UsersController do
  describe "index" do
    before(:each){get :index}

    it "is successful" do
      expect(response).to be_successful
    end

    it "assigns @users to all users" do
      expect(assigns(:users)).to eq User.all
    end
  end


end