class User < ActiveRecord::Base
  has_secure_password
  has_many :adposts
  # add a method password - password
  # add another method - authenticate
end