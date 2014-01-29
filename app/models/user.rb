class User < ActiveRecord::Base
  # Remember to create a migration!
  has_many :urls
  def self.authenticate(username, password)
    self.find_by(username: username, password: password)
  end
end
