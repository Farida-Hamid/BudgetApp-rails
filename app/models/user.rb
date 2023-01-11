class User < ApplicationRecord
  has_many :groups, class_name: "Group", foreign_key: "author_id"
  has_many :payments, class_name: "Payment", foreign_key: "author_id"

end
