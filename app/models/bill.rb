class Bill < ActiveRecord::Base
  validates_presence_of :amount_due, :due_date

  belongs_to :payee
end
