class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation
  validates_presence_of :email, :on => :create, :message => "can't be blank"
  before_create { generate_token(:auth_token) }
  
  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end
end
