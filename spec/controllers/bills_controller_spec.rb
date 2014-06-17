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

end
