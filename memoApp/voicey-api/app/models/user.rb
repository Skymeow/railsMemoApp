class User < ApplicationRecord
  has_many :memos
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  # step2 before save user to db
  before_save :encrypt_password

  # step2 before generate a token
  before_create :generate_token
  #  Adds a virtual password field, which we will use when creating a user
  attribute :paassword, :string

  def self.authenticate(email, password)
    user = self.find_by_email(email)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end

  def encrypt_password do
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_hash)
    end
  end

  # generate user token
  def generate_token
    token_gen = SecureRandom.hex
    self.token = token_gen
    token_gen
  end

end
