# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#

# Payment.delete_all
# Order.delete_all
# LineItem.delete_all  # Line items should be deleted before carts and tickets
# Cart.delete_all
# Ticket.delete_all
# Event.delete_all
# User.delete_all

ActiveRecord::Base.connection.execute("TRUNCATE payments, orders, line_items, carts, tickets, events, users RESTART IDENTITY CASCADE;")



user1 = User.create(
  email: "user1@example.com",
  password: "password123", # this will be saved as password_digest later on
  role: "customer", # default value
  username: "user1"
)

user2 = User.create(
  email: "user2@example.com",
  password: "password123", 
  role: "customer", 
  username: "user2"
)

admin_user = User.create(
  email: "admin@example.com",
  password: "admin123", 
  role: "admin",
  username: "admin"
)

event1 = Event.create(
  name: "Australian Grand Prix",
  location: "Melbourne",
  date: "2025-05-25 14:00:00",
  status: "upcoming",
  event_image_url: "events/aus.jpg"
)


event2 = Event.create(
  name: "Bahrain Grand Prix",
  location: "Bahrain International Circuit",
  date: "2025-07-05 13:00:00", 
  status: "upcoming",
  event_image_url: "events/bahrain.jpg"

)

event3 = Event.create(
  name: "Italian Grand Prix",
  location: "Monza, Italy",
  date: "2025-09-05 13:00:00", 
  status: "upcoming",
  event_image_url: "events/monza.avif"
  )

# Ticket.create([
#   { category: "General Admission", price: 150.00, event: event1 },
#   { category: "Grandstand", price: 450.00, event: event1 },
#   { category: "VIP", price: 1200.00, availability: 50, event: event1 },

#   { category: "General Admission", price: 130.00, event: event2 },
#   { category: "Grandstand", price: 400.00, event: event2 },
#   { category: "VIP", price: 1000.00, event: event2 },

#   { category: "General Admission", price: 140.00, event: event3 },
#   { category: "Grandstand", price: 420.00, event: event3 },
#   { category: "VIP", price: 1100.00, event: event3 }
# ])

# order1 = Order.create(
#     user: user1,
#     status: "pending", # default value
#     total_price: 300.00
# )

# order2 = Order.create(
#     user: user2,
#     status: "pending",
#     total_price: 750.00
# )

# order3 = Order.create(
#     user: admin_user,
#     status: "pending",
#     total_price: 120.00
# )

# Payment.create([
#   { order: order1, status: "pending", payment_method: "Credit Card" },
#   { order: order2, status: "pending", payment_method: "PayPal" },
#   { order: order3, status: "pending", payment_method: "Bank Transfer" }
# ])

