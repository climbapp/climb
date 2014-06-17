require 'spec_helper'

describe BillsController do
  describe '#index' do
    before(:each){get :index}
    it "is successful" do
      expect(response).to be_successful
    end

    it "assigns @bills to Bill.all" do
      expect(assigns(:bills)).to eq Bill.all
    end
  end

end
