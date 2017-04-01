require "data_mapper"

options = YAML.load_file './config/database.yml'

DataMapper.setup :default, options['development']

Dir['./app/models/*.rb'].each { |file| require file }
