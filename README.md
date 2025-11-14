# F1 Ticketing System

A web-based ticketing platform for Formula 1 racing events, built with Ruby on Rails. The system allows users to browse upcoming F1 Grand Prix events, purchase tickets, and manage their orders. Administrators can manage events, tickets, and view all orders.

## Features

- **User Authentication**: Secure user registration and login powered by Devise
- **Event Management**: Browse upcoming F1 Grand Prix events with detailed information
- **Ticket Categories**: Multiple ticket types (General Admission, Grandstand, VIP)
- **Shopping Cart**: Add tickets to cart and manage quantities before checkout
- **Order Processing**: Complete checkout with payment integration (FakePay service for development)
- **Order History**: Users can view their past and pending orders
- **Email Notifications**: Automated order confirmation emails
- **Admin Dashboard**: Administrators can manage events, tickets, and monitor orders
- **Role-Based Access**: Customer and admin user roles with appropriate permissions
- **Background Jobs**: Asynchronous payment processing with Solid Queue

## Tech Stack

- **Framework**: Ruby on Rails 8.0.2
- **Database**: PostgreSQL
- **Authentication**: Devise
- **Styling**: Tailwind CSS
- **Frontend**: Hotwire (Turbo + Stimulus)
- **Background Jobs**: Solid Queue
- **Caching**: Solid Cache
- **Real-time Features**: Solid Cable
- **Testing**: Minitest, Capybara, Selenium WebDriver

## Prerequisites

Before you begin, ensure you have the following installed:

- Ruby 3.x (check with `ruby -v`)
- Rails 8.0.2 (check with `rails -v`)
- PostgreSQL (check with `psql --version`)
- Node.js (for JavaScript dependencies)
- Bundler (check with `bundle -v`)

## Getting Started

### 1. Clone the Repository

```bash
git clone <repository-url>
cd F1-Ticketing-System
```

### 2. Install Dependencies

```bash
bundle install
```

### 3. Database Setup

Create and set up the database:

```bash
rails db:create
rails db:migrate
```

### 4. Seed the Database (Optional)

Load sample data including test users and F1 events:

```bash
rails db:seed
```

This will create:

**Test Users:**
- Customer 1: `user1@example.com` / `password123`
- Customer 2: `user2@example.com` / `password123`
- Admin: `admin@example.com` / `admin123`

**Sample Events:**
- Australian Grand Prix (Melbourne)
- Bahrain Grand Prix (Bahrain International Circuit)
- Italian Grand Prix (Monza, Italy)

### 5. Start the Application

Start the Rails server:

```bash
./bin/dev
```

Or alternatively:

```bash
rails server
```

The application will be available at `http://localhost:3000`

## Usage

### For Customers:

1. Sign up for a new account or log in with test credentials
2. Browse available F1 events on the home page
3. Select an event to view ticket categories and pricing
4. Add tickets to your cart
5. Review your cart and proceed to checkout
6. Complete payment and receive order confirmation

### For Administrators:

1. Log in with admin credentials
2. Access the admin dashboard
3. Manage events, tickets, and view all orders
4. Monitor ticket availability and sales

## Running Tests

Run the full test suite:

```bash
rails test
```

Run system tests:

```bash
rails test:system
```

Run specific test files:

```bash
rails test test/models/user_test.rb
rails test test/controllers/orders_controller_test.rb
```

## Project Structure

```
app/
├── controllers/     # Application controllers
├── models/          # ActiveRecord models
├── views/           # View templates
├── jobs/            # Background jobs
├── mailers/         # Email mailers
├── services/        # Service objects (e.g., FakePay)
└── assets/          # Images, stylesheets, and JavaScript

config/
├── routes.rb        # Application routes
└── database.yml     # Database configuration

db/
├── migrate/         # Database migrations
├── schema.rb        # Current database schema
└── seeds.rb         # Seed data

test/
├── controllers/     # Controller tests
├── models/          # Model tests
├── system/          # System/integration tests
└── fixtures/        # Test fixtures
```

## Key Models

- **User**: Manages customer and admin accounts (Devise authentication)
- **Event**: Formula 1 Grand Prix events with location, date, and status
- **Ticket**: Different ticket categories for each event with pricing and availability
- **Cart**: Shopping cart for users to collect items before purchase
- **LineItem**: Individual items in cart or order (ticket + quantity)
- **Order**: Completed purchases with status tracking
- **Payment**: Payment records linked to orders

## Configuration

### Environment Variables

Create a `.env` file in the root directory for sensitive configuration:

```env
F1_TICKETING_SYSTEM_DATABASE_PASSWORD=your_production_password
```

### Payment Integration

The application uses a fake payment service (`FakePay`) for development. To integrate a real payment gateway, modify the `app/services/fakepay.rb` service.

## Deployment

The application is Docker-ready and can be deployed using Kamal:

```bash
kamal deploy
```

Make sure to configure your `config/deploy.yml` file with your server details before deployment.

## Development

### Code Quality

Run Rubocop for code style checking:

```bash
rubocop
```

Run Brakeman for security analysis:

```bash
brakeman
```

### Tailwind CSS

To watch for CSS changes during development:

```bash
rails tailwindcss:watch
```

## License

This project is available for educational and personal use.

## Support

For issues or questions, please open an issue in the repository or contact the development team.
