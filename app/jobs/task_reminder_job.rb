# app/jobs/task_reminder_job.rb
class TaskReminderJob < ApplicationJob
  queue_as :default

  def perform
    tasks_to_remind =
      Task.where(
        "due_date > ? AND due_date < ?",
        Time.now + 1.day,
        Time.now + 2.days
      )

    tasks_to_remind.each do |task|
      TaskMailer.reminder_email(task.user, task).deliver_now
    end
  end
end
