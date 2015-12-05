class User < ActiveRecord::Base
  # users.password_hash in the database is a :string
  include BCrypt

  has_many :wines

  def password
    @password ||= Password.new(password_thing)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_thing = @password
  end

  def self.authenticate(username, password)
    user = User.find_by(username: username)
    if user && user.password == password
      user
    else
      nil
    end
  end

end