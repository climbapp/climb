require 'spec_helper'
describe PayeesController do
  let(:ned_stark){FactoryGirl.create(:user_phone)}
  describe '#index' do
    before(:each){get :index}
    it "is successful" do
      expect(response).to be_successful
    end
    it "assigns @payees to Payee.all" do
      expect(assigns(:payees)).to eq Payee.all
    end
  end

  describe '#new' do
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
end
