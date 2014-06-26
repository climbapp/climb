require 'rails_helper'

describe BillsController do
  let(:my_user){FactoryGirl.create(:user)}
  let(:my_payee){FactoryGirl.create(:payee, :user => my_user)}

  describe '#index' do
    before(:each){ get :index }

    it "is successful" do
      expect(response).to be_successful
    end

    it "assigns @bills to Bill.all" do
      expect(assigns(:bills)).to eq Bill.all
    end
  end

  describe '#new' do
    before(:each){ get :new, payee_id: my_payee.id }

    it "is successful" do
      expect(response).to be_successful
    end

    it "assigns @bill to a new Bill" do
      expect(assigns(:bill)).to be_a_new Bill
    end
  end

  describe '#create' do
    context 'valid attributes' do
      let(:create_bill){ post :create, payee_id: my_payee.id, bill: FactoryGirl.attributes_for(:bill) }

      it "creates a bill" do
        expect{ create_bill }.to change{ Bill.count }.by(1)
      end

      it "redirects" do
        create_bill
        expect(response).to be_redirect
      end
    end

    context 'invalid attributes' do
      let(:create_invalid_bill){ post :create, payee_id: my_payee.id, bill: { name: "Iron Bank of Braavos" } }

      it "doesn't create a bill" do
        expect{ create_invalid_bill }.to change{ Bill.count }.by(0)
      end

      it "renders the new bill template" do
        create_invalid_bill
        expect(response).to render_template(:new)
      end
    end
  end

  describe '#update' do
    let(:my_bill){ FactoryGirl.create(:bill, :payee => my_payee) }
    context 'valid attributes' do
      before(:each){ patch :update, :id => my_bill.id, bill: {name: "Iron Bank of Braavos"} }

      it "updates the bill" do
        expect(my_bill.reload.name).to eq "Iron Bank of Braavos"
      end

      it "redirects to @bill" do
        expect(response).to redirect_to bill_path(my_bill)
      end
    end

    context 'invalid attributes' do
      before(:each){ patch :update, :id => my_bill.id, bill: {amount_due: nil} }
      it "does not update the bill" do
        expect(my_bill.reload.amount_due).to_not be_nil
      end
      it "renders edit template" do
        expect(response).to render_template(:edit)
      end
    end
  end

  describe '#destroy' do
    let!(:to_delete){FactoryGirl.create(:bill, payee: my_payee)}
    let(:delete_bill){delete :destroy, id: to_delete.id}

    it "destroys the bill" do
      expect{ delete_bill }.to change{Bill.count}.by(-1)
    end

    it "redirects to bills_url" do
      delete_bill
      expect(response).to redirect_to bills_url
    end
  end
end
