require 'rails_helper'

describe PayeesController do
  let(:ned_stark){FactoryGirl.create(:user)}

  describe "#index" do
    before(:each){ get :index }

    it "is successful" do
      expect(response).to be_successful
    end

    it "assigns @payees to Payee.all" do
      expect(assigns(:payees)).to eq Payee.all
    end
  end

  describe "#new" do
    before(:each){ get :new, :user_id => ned_stark.id }

    it "is successful" do
      expect(response).to be_successful
    end

    it "assigns @user to the user from params" do
      expect(assigns(:user)).to eq ned_stark
    end

    it "assigns @payee to be a new payee" do
      expect(assigns(:payee)).to be_a_new Payee
    end
  end

  describe "#create" do
    context "valid attributes" do
      let(:create_payee){ post :create, :user_id => ned_stark.id, payee:
        FactoryGirl.attributes_for(:payee) }

      it "creates a payee" do
        expect{ create_payee }.to change{ Payee.count }.by(1)
      end

      it "redirects" do
        create_payee
        expect(response).to be_redirect
      end

      it "assigns the payee to the correct user" do
        expect{ create_payee }.to change{ ned_stark.payees.count }.by(1)
      end
    end

    context "invalid attributes" do
      let(:create_invalid_payee){ post :create, :user_id => ned_stark.id,
        payee: { name: nil } }

      it "doesn't create a payee" do
        expect{ create_invalid_payee }.to change{ Payee.count }.by(0)
      end

      it "renders new payee form" do
        create_invalid_payee
        expect(response).to render_template(:new)
      end
    end
  end

  describe "#update" do
    let(:iron_bank){ FactoryGirl.create(:payee, :user => ned_stark) }
    context "valid attributes" do
      before(:each){ patch :update, id: iron_bank.id, payee: { name: "Iron Bank of Braavos" } }

      it "updates the payee" do
        expect(iron_bank.reload.name).to eq "Iron Bank of Braavos"
      end

      it "redirects_to @payee" do
        expect(response).to redirect_to payee_path(iron_bank)
      end
    end

    context "invalid attributes" do
      before(:each){ patch :update, id: iron_bank.id, payee: {name: nil}}
      it "doesn't update the payee" do
        expect(iron_bank.reload.name).to_not be_nil
      end

      it "renders the edit template" do
        expect(response).to render_template(:edit)
      end
    end
  end

  describe "#destroy" do
    let!(:to_delete){ FactoryGirl.create(:payee, user: ned_stark) }
    let(:delete_payee){delete :destroy, id: to_delete.id}
    it "destroys the payee" do
      expect{ delete_payee }.to change{ Payee.count }.by(-1)
    end

    it "redirects to user_path" do
      delete_payee
      expect(response).to redirect_to user_path(ned_stark)
    end
  end
end
