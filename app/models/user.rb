class User < ActiveRecord::Base
  has_secure_password

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates(:name, presence: true)
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates_confirmation_of :password, if: lambda { |m| m.password.present? }
  validates :password, length: { minimum: 6 }  
  before_save { self.email = email.downcase }
end
