class Payee < ActiveRecord::Base
  validates_presence_of :name, :recurring

  belongs_to :user
end
