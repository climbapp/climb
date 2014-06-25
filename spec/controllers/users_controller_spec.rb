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
    context "valid attributes" do
      let(:create_user){ post :create, :user => FactoryGirl.attributes_for(:user_phone) }

      it "creates a new user" do
        expect{ create_user }.to change{ User.count }.by(1)
      end

      it "redirects" do
        create_user
        expect(response).to be_redirect
      end
    end

    context "invalid attributes" do
      let(:create_invalid_user){post :create, :user => FactoryGirl.attributes_for(:user)}

      it "does not create a new user" do
        expect{ create_invalid_user }.to change{User.count}.by(0)
      end

      it "renders new_user template" do
        create_invalid_user
        expect(response).to render_template(:new)
      end
    end

  end

  describe "update" do
    let(:my_user){ FactoryGirl.create(:user_phone) }
    context "valid attributes" do
      before(:each){ patch :update, :id => my_user.id, :user => {name: "Ned Stark"} }

      it "updates the user's attributes" do
        expect(my_user.reload.name).to eq "Ned Stark"
      end

      it "redirects to @user" do
        expect(response).to redirect_to user_path(my_user)
      end
    end

    context "invalid attributes" do
      before(:each) { patch :update, :id => my_user.id, :user => {name: nil}}
      it "doesn't update the user's attributes" do
        expect(my_user.reload.name).to_not be_nil
      end

      it "renders the edit user form" do
        expect(response).to render_template(:edit)
      end
    end
  end

  describe "destroy" do
    let!(:dead_user){FactoryGirl.create(:user_phone)}
    let(:delete_user){delete :destroy, :id => dead_user.id}
    it "destroys the user" do
      expect{delete_user}.to change{User.count}.by(-1)
    end

    it "redirects to users_url" do
      delete_user
      expect(response).to redirect_to users_url
    end
  end
end
