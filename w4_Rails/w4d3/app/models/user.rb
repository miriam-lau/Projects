class User < ActiveRecord::Base
  validates :user_name, :password_digest, presence: true, uniqueness: true
  #validates requires the getter and setter for password
  validates :password, length: { minimum: 6 }, allow_nil: true
  validates :session_token, presence: true

  after_initialize :ensure_session_token

  attr_reader :password

  def self.generate_session_token
    SecureRandom::urlsafe_base64(16)
  end

  def reset_session_token!
    self.session_token = User.generate_session_token
    self.save!
    self.session_token
  end

  def password=(password)
    #@password instance var is needed for the validates
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def self.find_by_credentials(username, password)
    user = User.find_by(username)
    if user && user.is_password?(password)
      return user
    end
    nil
  end

  has_many :cats,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: 'Cat'

  has_many :requested_cats,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: 'CatRentalRequest'

  private

  def ensure_session_token
    self.session_token ||= User.generate_session_token
  end
end
