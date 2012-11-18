# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
 
 Merchant.delete_all
 beard_papa = Merchant.create(:name => "Beard Papa",
                                 :phone => 3129609000,
                                 :address => "108 N State St, Chicago, IL 60602",
                                 :lat => 41.911461,
                                 :long => -87.67759,
                                 :stripe_customer_id => "cus_0l8lcLVFAroGz6",
                                 :email => "rudyonrails@gmail.com",
                                 :password => "testing",
                                 :password_confirmation => "testing")

 psychobaby = Merchant.create(:name => "Psychobaby",
                                 :phone => 7737722815,
                                 :address => "1630 N Damen Ave, Chicago, IL 60647",
                                 :lat => 41.833733,
                                 :long => -87.731964,
                                 :stripe_customer_id => "cus_0l8mgIHPSSxvfr",
                                 :email => "contrerasnet@gmail.com",
                                 :password => "testing",
                                 :password_confirmation => "testing")


 Order.delete_all
 p beard_papa

 order1 = beard_papa.orders.build(:address => "222 W. Merchandise Mart",
                                              :customer_first_name => "Jimmy",
                                              :customer_last_name => "Odom",
                                              :customer_email => "shahshaan@gmail.com",
                                              :customer_phone => "312-999-9999",
                                              :order_status => "delivered",
                                              :product_name => "Cocoa Puff (4 dozen)")


 order2 = psychobaby.orders.build(:address => "222 W. Merchandise Mart",
                                              :customer_first_name => "Nathaniel",
                                              :customer_last_name => "Briggs",
                                              :customer_email => "shahshaan@gmail.com",
                                              :customer_phone => "312-999-9999",
                                              :order_status => "delivered",
                                              :product_name => "Board Books")
 
 order3 = psychobaby.orders.build(:address => "222 W. Merchandise Mart",
                                              :customer_first_name => "Greg",
                                              :customer_last_name => "Williams",
                                              :customer_email => "shahshaan@gmail.com",
                                              :customer_phone => "312-999-9999",
                                              :order_status => "delivered",
                                              :product_name => "Dozen Roses")

 order4 = psychobaby.orders.build(:address => "222 W. Merchandise Mart",
                                              :customer_first_name => "Greg",
                                              :customer_last_name => "Williams",
                                              :customer_email => "shahshaan@gmail.com",
                                              :customer_phone => "312-999-9999",
                                              :order_status => "delivered",
                                              :product_name => "Dozen Roses")
 
 order5 = psychobaby.orders.build(:address => "222 W. Merchandise Mart",
                                              :customer_first_name => "Greg",
                                              :customer_last_name => "Williams",
                                              :customer_email => "shahshaan@gmail.com",
                                              :customer_phone => "312-999-9999",
                                              :order_status => "delivered",
                                              :product_name => "Dozen Roses")

 order6 = psychobaby.orders.build(:address => "222 W. Merchandise Mart",
                                              :customer_first_name => "Greg",
                                              :customer_last_name => "Williams",
                                              :customer_email => "shahshaan@gmail.com",
                                              :customer_phone => "312-999-9999",
                                              :order_status => "delivered",
                                              :product_name => "Dozen Roses")
 
 order1.save  
 order2.save
 order3.save
 order4.save
 order5.save
 order6.save
# 
# puts "In production, must set two environment variables (whydeliver_gmail_username and whydeliver_gmail_password"                                           
