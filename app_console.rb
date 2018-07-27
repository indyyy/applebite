# pry session with your data models loaded

require 'pry'
require_relative 'db_config'
require_relative 'models/adpost'
require_relative 'models/user'

binding.pry