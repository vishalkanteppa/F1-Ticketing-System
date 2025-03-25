class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable
          
    has_many :orders
    has_many :payments, through: :orders
    has_one :cart, dependent: :destroy

    validates_presence_of :name, :email, :role, :encrypted_password
    validates_uniqueness_of :email
end
