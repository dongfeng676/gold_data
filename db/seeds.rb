# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

golds = Gold.all
golds.each do |gold|
  AppLog.info(" date: #{gold.date} #{gold.time},price: #{gold.price}")
end
