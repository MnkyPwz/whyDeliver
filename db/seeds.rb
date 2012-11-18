# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
#
 
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


 Transporter.delete_all
 transporter1 = Transporter.create(
                              :first_name => "Tony",
                              :last_name => "Chandler",
                              :phone => 7734259900,
                              :current_lat => 41.833733,
                              :current_long => -87.731964,
                              :email => "tony.chandler@whydeliver.com",
                              :available => true
 )

 transporter2 = Transporter.create(
                              :first_name => "Bobby",
                              :last_name => "Hernandez",
                              :phone => 7739007766,
                              :current_lat => 41.90744,
                              :current_long => -87.675886,
                              :email => "bobby.hernandez@whydeliver.com",
                              :available => true
 )

 transporter3 = Transporter.create(
                              :first_name => "Joe",
                              :last_name => "Magglio",
                              :phone => 2248802134,
                              :current_lat => 41.921147,
                              :current_long => -87.682768,
                              :email => "joe.magglio@whydeliver.com",
                              :available => true
 )



 Order.delete_all
 p beard_papa
 p psychobaby

 order1 = beard_papa.orders.build(:address => "222 W. Merchandise Mart",
                                              :customer_first_name => "Jimmy",
                                              :customer_last_name => "Odom",
                                              :customer_email => "shahshaan@gmail.com",
                                              :customer_phone => "312-999-9999",
                                              :order_status => "delivered",
                                              :charge => 57,
                                              :created_at => Time.now - 1.hour,
                                              :transporter_id => transporter1.id,
                                              :quantity => 4,
                                              :delivery_distance => 2.3,
                                              :product_name => "Cocoa Puff (4 dozen)")


 order2 = psychobaby.orders.build(:address => "6816 N Ashland Blvd, Chicago, IL 60626",
                                              :customer_first_name => "Nathaniel",
                                              :customer_last_name => "Briggs",
                                              :customer_email => "shahshaan@gmail.com",
                                              :customer_phone => "312-999-9999",
                                              :order_status => "delivered",
                                              :charge => 68,
                                              :created_at => Time.now - 2.days,
                                              :transporter_id => transporter2.id,
                                              :quantity => 4.8,
                                              :delivery_distance => 5.7,
                                              :product_name => "Board Books(4 items)")
 
 order3 = psychobaby.orders.build(:address => "222 W. Merchandise Mart",
                                              :customer_first_name => "Greg",
                                              :customer_last_name => "Williams",
                                              :customer_email => "shahshaan@gmail.com",
                                              :customer_phone => "312-999-9999",
                                              :order_status => "delivered",
                                              :charge => 158,
                                              :created_at => Time.now - 1.days,
                                              :transporter_id => transporter2.id,
                                              :quantity => 16,
                                              :delivery_distance => 6.7,
                                              :product_name => "Childrens clothing (16 items)")

 order4 = psychobaby.orders.build(:address => "1344 W Grenshaw St, Chicago, IL 60607",
                                              :customer_first_name => "Tim",
                                              :customer_last_name => "Bradley",
                                              :customer_email => "shahshaan@gmail.com",
                                              :customer_phone => "312-999-9999",
                                              :order_status => "accepted",
                                              :charge => 129,
                                              :created_at => Time.now - 30.minutes,
                                              :transporter_id => transporter1.id,
                                              :quantity => 1,
                                              :delivery_distance => 5.2,
                                              :product_name => "Cartoon Mattress (1 item)")
 
 order5 = psychobaby.orders.build(:address => "2323 N Leavitt St, Chicago, IL 60647",
                                              :customer_first_name => "Jamie",
                                              :customer_last_name => "Bosley",
                                              :customer_email => "shahshaan@gmail.com",
                                              :customer_phone => "312-999-9999",
                                              :order_status => "enroute",
                                              :charge => 215,
                                              :created_at => Time.now - 4.hours,
                                              :transporter_id => transporter3.id,
                                              :quantity => 5,
                                              :delivery_distance => 2.3,
                                              :product_name => "Kids toys (5 items)")

 order6 = psychobaby.orders.build(:address => "4724 N Lamon Ave, Chicago, IL 60630",
                                              :customer_first_name => "Cindy",
                                              :customer_last_name => "Caswell",
                                              :customer_email => "shahshaan@gmail.com",
                                              :customer_phone => "312-999-9999",
                                              :order_status => "pending",
                                              :charge => 310,
                                              :created_at => Time.now,
                                              :quantity => 32,
                                              :delivery_distance => 8.1,
                                              :product_name => "Childrens clothing (32 items)")




 
 order1.save  
 order2.save
 order3.save
 order4.save
 order5.save
 order6.save
# 
# puts "In production, must set two environment variables (whydeliver_gmail_username and whydeliver_gmail_password"                                           
