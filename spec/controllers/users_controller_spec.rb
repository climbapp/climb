require 'spec_helper'

describe UsersController do
  describe "index" do
    before(:each){ get :index }

    it "is successful" do
      expect(response).to be_successful
    end

    it "assigns @users to all users" do
      expect(assigns(:users)).to eq User.all
    end
  end

  describe "new" do
    before(:each){ get :new }
    it "is successful" do
      expect(response).to be_successful
    end

    it "assigns @user to a new user" do
      expect(assigns(:user)).to be_a_new User
    end
  end




end