# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

OrderStatus.delete_all
puts "Deleting Order Statuses..."
pending = OrderStatus.create(:title => "pending")
accepted = OrderStatus.create(:title => "accepted")
picked_up = OrderStatus.create(:title => "picked_up")
en_route = OrderStatus.create(:title => "en_route")
delivered = OrderStatus.create(:title => "delivered")
puts "Created Order Statuses..."

Merchant.delete_all
rudys_flowers = Merchant.create(:name => "Rudy's Flower Shop",
                                :phone => 3127725636,
                                :address => "222 W. Ontario, Chicago, IL",
                                :email => "rudyonrails@gmail.com",
                                :password => "rudysflowers",
                                :password_confirmation => "rudysflowers")

Order.delete_all
flowers_to_greg = rudys_flowers.orders.build(:address => "222 W. Merchandise Mart",
                                             :customer_first_name => "Greg",
                                             :customer_last_name => "Williams",
                                             :customer_email => "shahshaan@gmail.com",
                                             :customer_phone => "312-999-9999",
                                             :product_name => "Dozen Roses")
flowers_to_greg.save  

puts "In production, must set two environment variables (whydeliver_gmail_username and whydeliver_gmail_password"                                           