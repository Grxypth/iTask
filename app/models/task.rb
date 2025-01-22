class Task < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :comments, dependent: :destroy

  enum priority: { low: 0, medium: 1, high: 2 }
  enum status: { todo: 0, in_progress: 1, completed: 2, expired: 3 }
  validates :title,
            :description,
            :due_date,
            :priority,
            :status,
            :user,
            :category,
            presence: true
end
