class Bill < ActiveRecord::Base
  belongs_to :payee
end
