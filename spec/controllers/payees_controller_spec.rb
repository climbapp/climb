require 'spec_helper'
describe PayeesController do
  describe '#index' do
    before(:each){get :index}
    it "is successful" do
      expect(response).to be_successful
    end
    it "assigns @payees to Payee.all" do
      expect(assigns(:payees)).to eq Payee.all
    end
  end


end
