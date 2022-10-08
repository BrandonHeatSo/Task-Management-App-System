class Task < ApplicationRecord
  belongs_to :user
  
  validates :user_id, presence: true
  validates :name, presence: true, length: { maximum: 50 }
  validates :description, presence: true, length: { in: 5..300 }
end
