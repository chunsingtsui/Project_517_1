class User < ActiveRecord::Base
  attr_accessible :password, :username, :admin

  validates_presence_of :username
  validates_presence_of :password, :on => :create
  validates_uniqueness_of :username

  def self.authenticate(username, password)
    user = find_by_username(username)
    if user && user.password == password
      user
    else
      nil
    end
  end

end
