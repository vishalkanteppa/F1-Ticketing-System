class User < ApplicationRecord
    has_secure_password

    has_many :orders
    has_many :payments, through: :orders
    has_one :cart, dependent: :destroy

    validates_presence_of :email, :username, :role
    validates_uniqueness_of :email, :username
end
