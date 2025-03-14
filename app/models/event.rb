class Event < ApplicationRecord
    has_many :tickets, dependent: :destroy
    
    validates_presence_of :name, :location, :date, :status
    validates_uniqueness_of :name, :date

    after_create :generate_tickets

    def ticket_categories
        {
            "General Admission" => 500,
            "Grandstand" => 200,
            "VIP" => 50
        }
    end

    def generate_tickets
        ticket_categories.each do |category, count|
            if category == "General Admission"
                price = 150
            elsif category == "Grandstand"
                price = 400
            elsif category == "VIP"
                price = 900
            end
            count.times do |i|
                ticket = tickets.create(
                    category: category,
                    seat_no: "#category - #{i+1}",
                    status: "available",
                    price: price
                )
            end
        end
    end

end
