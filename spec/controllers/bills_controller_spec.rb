require 'spec_helper'

describe BillsController do
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
    before(:each){ get :new }
    it "is successful" do
      expect(response).to be_successful
    end

    it "assigns @bill to a new Bill" do
      expect(assigns(:bill)).to be_a_new Bill
    end
  end

  describe '#create' do
    context '#valid attributes' do
      let(:create_bill){post :create, bill: FactoryGirl.attributes_for(:bill)}
      it "creates a bill" do
        expect{create_bill}.to change{Bill.count}.by(1)
      end
      it "redirects" do
        create_bill
        expect(response).to be_redirect
      end
    end

    context '#invalid attributes' do
      let(:create_invalid_bill){ post :create, bill: {name: "Iron Bank of Braavos"}}
      it "doesn't create a bill" do
        expect{create_invalid_bill}.to change{Bill.count}.by(0)
      end
      it "renders the new bill template" do
        create_invalid_bill
        expect(response).to render_template(:new)
      end
    end
  end

end
