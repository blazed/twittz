class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  before_validation :strip_handle
  before_save :update_handle_lower
  before_save :strip_downcase_email
  before_save :ensure_authentication_token

  validates :handle, presence: true, length: { minimum: 1, maximum: 30 }, uniqueness: { case_sensitive: false }, format: { with: /\A[a-zA-Z0-9_-]*\z/ }

  has_one :profile


  def strip_handle
    self.handle = handle.strip unless self.handle.nil?
  end

  def update_handle_lower
    self.handle_lower = handle.downcase
  end

  def strip_downcase_email
    self.email = self.email.strip
    self.email = self.email.downcase
  end

  def self.build(opts = {})
    u = User.new(opts)
    u.setup(opts)
    u
  end

  def setup(opts)
    self.handle = opts[:handle]
    self.email = opts[:email]
    self.valid?
    errors = self.errors
    errors.delete :profile
    return if errors.size > 0
    self.setup_profile(Profile.new((opts[:profile] || {})))
    self
  end

  def setup_profile(profile)
    profile.handle = "#{self.handle_lower}"
    self.profile = profile
    self.profile.save
  end

  private

  def ensure_authentication_token
    if self.authentication_token.blank?
      self.authentication_token = generate_authentication_token
    end
  end

  def generate_authentication_token
    loop do
      token = Devise.friendly_token
      break token unless User.exists?(authentication_token: token)
    end
  end
end
