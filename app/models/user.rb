class User < ApplicationRecord
    has_secure_password

    has_many :orders
    has_many :payments, through: :orders

    validates_presence_of :name, :username
    validates_uniqueness_of :name, :username
end
