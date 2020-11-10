require 'securerandom'

class User < ApplicationRecord
  before_create :set_api_key

  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, presence: true
  # validates :api_key, presence: true

  has_secure_password

  private

  def set_api_key
    self.api_key = SecureRandom.urlsafe_base64
  end
end
