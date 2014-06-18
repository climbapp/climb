class Payee < ActiveRecord::Base
  validates_presence_of :name, :recurring

  belongs_to :user
  has_many :bills
end
