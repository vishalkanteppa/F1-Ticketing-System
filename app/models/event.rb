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
            count.times do |i|
                tickets.create(
                    category: category,
                    seat_no: "#category - #{i+1}",
                    status: "available"
                )
            end
        end
    end

end
