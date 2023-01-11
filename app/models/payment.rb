class Payment < ApplicationRecord
  belongs_to :user, class_name: "User", foreign_key: "author_id"
  has_and_belongs_to_many :groups

  validates :name, presence: true
  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates :groups, presence: true


end
