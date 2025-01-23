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

  before_save :set_completed_at, if: :will_save_change_to_status?
  before_save :check_due_date

  private

  def set_completed_at
    self.completed_at = Time.current if status == "completed"
  end

  def check_due_date
    self.status = "expired" if due_date.present? && due_date < Date.today
  end
end
