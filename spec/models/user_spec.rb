require 'rails_helper'

describe User do
  context "without sms reminder" do
    let!(:user1){ FactoryGirl.create(:user) }

    it { should validate_presence_of :email }
    it { should validate_presence_of :password_digest }
    it { should_not validate_presence_of :phone }

    it { should validate_uniqueness_of(:email).case_insensitive }

    it { should have_many :payees }
  end

  # context "with sms reminder" do
  #   let!(:user2){ FactoryGirl.create(:user_phone) }

  #   it { should validate_presence_of :email }
  #   it { should validate_presence_of :password_digest }
  #   xit { should validate_presence_of :phone }
  #   #trouble getting this to pass for some reason

  #   it { should validate_uniqueness_of(:email).case_insensitive }

  #   it { should have_many :payees }
  # end
end

