class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :trackable
  before_save :skip_confirmation!

  has_many :groups, foreign_key: 'author_id'
  has_many :payments, foreign_key: 'author_id'

  validates :name, presence: true
  validates :email, presence: true
  validates :password, presence: true
end
