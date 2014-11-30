class User < ActiveRecord::Base
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  validates :username, presence: true
  validates :email, presence: true, uniqueness: true, format: EMAIL_REGEX
  validates :encrypted_password, presence: true
      # record.errors[attribute] << (options[:message] || "is not an email")
	def self.authenticate(email, encrypted_password)
    if EMAIL_REGEX.match(email)
      user = User.find_by_email(email)
    else
      return nil
    end

    if user && user.encrypted_password == encrypted_password
      return user
    else
      return nil
    end
  end

end