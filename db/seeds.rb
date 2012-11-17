# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

OrderStatus.delete_all
pending = OrderStatus.create(:title => "pending")
accepted = OrderStatus.create(:title => "accepted")
picked_up = OrderStatus.create(:title => "picked_up")
en_route = OrderStatus.create(:title => "en_route")
delivered = OrderStatus.create(:title => "delivered")
