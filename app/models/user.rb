class User < ActiveRecord::Base
  validates :name, :email, :password, :presence => true
  validates :email, :uniqueness => { :case_sensitive => false }
  validates :phone, :presence => true, :if => :sms_remind?

  has_many :payees

  def sms_remind_preferred?
    :sms_remind?
  end

end
