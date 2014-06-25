class User < ActiveRecord::Base
  validates :email, :password_digest, :presence => true
  validates :email, :uniqueness => { :case_sensitive => false }
  validates :phone, :presence => true, :if => :sms_remind_preferred?

  has_many :payees

  def sms_remind_preferred?
    :sms_remind?
  end

end
