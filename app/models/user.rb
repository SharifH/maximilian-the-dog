class User < ActiveRecord::Base
  attr_accessible :name, :email, :password, :password_confirmation
   belongs_to :loginable, :polymorphic => true
  has_secure_password

  before_save { |user| user.email = email.downcase }
  before_save :create_remember_token

  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence:   true,
                    format:     { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }, if: :password_required?
  validates :password_confirmation, presence: true, if: :password_required?

  def create_remember_token
    self.remember_token = SecureRandom.urlsafe_base64
  end

  def password_required?
    password_digest.blank?
  end

end
