class User < ActiveRecord::Base
  # Remember to create a migration!
  has_many :rounds

  def authentication(password)
    self.password == password
  end
end
