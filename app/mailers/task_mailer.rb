# app/mailers/task_mailer.rb
class TaskMailer < ApplicationMailer
  default from: "no-reply@example.com"

  def reminder_email(user, task)
    @user = user
    @task = task
    mail(
      to: @user.email,
      subject: "Reminder: Yarına issue tamamlanacak - #{@task.title}"
    )
  end
end
