class User < ApplicationRecord
  has_secure_password
  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :email, :presence => true, :uniqueness => { :case_sensitive => false}
  validates :password, :length => {:minimum => 4}, :presence => true
  validates :password_confirmation, :presence => true

  def self.authenticate_with_credentials(email, password)
    email_to_downcase = email.strip.downcase
    user = User.find_by_email(email_to_downcase)
    if user && user.authenticate(password)
      user
    else
      nil
    end
  end
end
