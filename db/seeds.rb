# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#

Payment.delete_all
Order.delete_all
Ticket.delete_all
Event.delete_all
User.delete_all

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
  status: "upcoming"
)
puts "Event 1: #{event1.errors.full_messages}" if event1.errors.any?


event2 = Event.create(
  name: "Bahrain Grand Prix",
  location: "Bahrain International Circuit",
  date: "2025-07-05 13:00:00", 
  status: "upcoming"
)

event3 = Event.create(
  name: "Italian Grand Prix",
  location: "Monza, Italy",
  date: "2025-09-05 13:00:00", 
  status: "upcoming"
  )

Ticket.create([
  { category: "General Admission", price: 150.00, availability: 500, event: event1 },
  { category: "Grandstand", price: 450.00, availability: 200, event: event1 },
  { category: "VIP", price: 1200.00, availability: 50, event: event1 },

  { category: "General Admission", price: 130.00, availability: 600, event: event2 },
  { category: "Grandstand", price: 400.00, availability: 250, event: event2 },
  { category: "VIP", price: 1000.00, availability: 75, event: event2 },

  { category: "General Admission", price: 140.00, availability: 550, event: event3 },
  { category: "Grandstand", price: 420.00, availability: 220, event: event3 },
  { category: "VIP", price: 1100.00, availability: 60, event: event3 }
])

order1 = Order.create(
    user: user1,
    status: "pending", # default value
    total_price: 300.00
)

order2 = Order.create(
    user: user2,
    status: "pending",
    total_price: 750.00
)

order3 = Order.create(
    user: admin_user,
    status: "pending",
    total_price: 120.00
)

Payment.create([
  { order: order1, status: "pending", payment_method: "Credit Card" },
  { order: order2, status: "pending", payment_method: "PayPal" },
  { order: order3, status: "pending", payment_method: "Bank Transfer" }
])

