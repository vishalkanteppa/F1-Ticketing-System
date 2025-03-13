class Event < ApplicationRecord
    has_many :tickets
    
    validates_presence_of :name, :location, :date, :status
    validates_uniqueness_of :name, :date
end
