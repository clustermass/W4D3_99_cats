# == Schema Information
#
# Table name: users
#
#  id              :bigint(8)        not null, primary key
#  user_name       :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ApplicationRecord
  validates :user_name, :password_digest, :session_token, presence: true, uniqueness: true
  before_validation :ensure_session_token
  attr_reader :password
  
  has_many :cats, 
  primary_key: :id,
  foreign_key: :user_id,
  class_name: :Cat
  
  
  def self.find_by_credentials(user_name, input_password)
    user = User.find_by(user_name: user_name) 
    
    if user != nil && user.is_password?(input_password) 
      return user
    else  
      return nil
    end  
  end 
  
  def reset_session_token!
    self.session_token = SecureRandom::urlsafe_base64
    self.save!
    self.session_token
  end

  def password=(input_password)
    @password = input_password
    self.password_digest = BCrypt::Password.create(input_password)
    
  end
  
  def is_password?(input_password)
    BCrypt::Password.new(self.password_digest).is_password?(input_password)
  end
  
  def ensure_session_token
    self.session_token ||= SecureRandom::urlsafe_base64
  end  
  
end
