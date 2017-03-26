require "data_mapper"

options = YAML.load_file './config/database.yml'

DataMapper.setup :default, options['development']

require './app/models/user'
