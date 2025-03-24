class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    has_secure_password

    has_many :orders
    has_many :payments, through: :orders
    has_one :cart, dependent: :destroy

    validates_presence_of :name, :email, :username, :role
    validates_uniqueness_of :email, :username
end
