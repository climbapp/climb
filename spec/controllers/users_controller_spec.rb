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

  describe "create" do
    it "assigns @user to a new user"
    context "format html" do
      context "valid attributes" do
        it "creates a new user"
        it "redirects to @user"
      end

      context "invalid attributes" do
        it "does not create a new user"
        it "renders new_user template"
      end
    end

    context "format json" do
      context "valid attributes" do
        it "creates a new user"
        it "renders something"
      end

      context "invalid attributes" do
        it "does not create a new user"
        it "renders something"
      end
    end
  end

  describe "update" do
    context "format html" do
      context "valid attributes" do
        it "updates the user's attributes"
        it "redirects to @user"
      end

      context "invalid attributes" do
        it "doesn't update the user's attributes"
        it "renders the edit user form"
      end
    end

    context "format json" do
      context "valid attributes" do
        it "updates the user's attributes"
        it "renders something"
      end

      context "invalid attributes" do
        it "doesn't update the user's attributes"
        it "renders something"
      end
    end
  end

  describe "destroy" do
    it "destroys the user"
    context "format html" do
      it "redirects to users_url"
    end
    context "format json" do
      it "does something i don't understand"
    end
  end



end