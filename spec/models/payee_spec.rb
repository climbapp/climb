require 'rails_helper'

describe Payee do
  let!(:user1){ FactoryGirl.create(:user) }
  let!(:payee1){ FactoryGirl.create(:payee, user: user1) }

  it { should validate_presence_of :name }
  it { should validate_presence_of :recurring }

  it { should belong_to :user }
end
