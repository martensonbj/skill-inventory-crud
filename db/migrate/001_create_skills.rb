require 'sequel'
require 'sqlite3'

environments = ["test", "development"]

environments.each do |env|
  Sequel.sqlite("db/skill_inventory_#{env}.sqlite3").create_table(:skills) do
    primary_key :id
    String :name
    String :status
  end
  puts "Migrated #{env} environment."
end
