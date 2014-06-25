require 'spec_helper'


describe User do
  let!(:user1){ FactoryGirl.create(:user_phone) }

  it { should validate_presence_of :email }
  it { should validate_presence_of :password_digest }
  it { should validate_presence_of :phone }

  it { should validate_uniqueness_of(:email).case_insensitive }

  it { should have_many :payees }
end
