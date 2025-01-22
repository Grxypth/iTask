# db/seeds.rb

# Create some categories
category1 = Category.find_or_create_by(name: "İş")
category1 = Category.find_or_create_by(name: "Kişisel")
category1 = Category.find_or_create_by(name: "Alışveriş")
category1 = Category.find_or_create_by(name: "Sağlık")

# Find existing users by email
user1 =
  User.find_or_create_by(email: "john@example.com") do |user|
    user.password = "password" # Ensure you set a password if using Devise or similar
  end

# Create some tasks
Task.create(
  title: "Complete project report",
  description: "Finish the project report by the end of the week.",
  due_date: DateTime.now + 7.days,
  priority: :high,
  status: :in_progress,
  category: category1,
  user: user1,
  completed_at: nil
)
Task.create(
  title: "Complete project report",
  description: "Finish the project report by the end of the week.",
  due_date: DateTime.now + 7.days,
  priority: :high,
  status: :in_progress,
  category: category1,
  user: user1,
  completed_at: nil
)

Task.create(
  title: "Complete project report",
  description: "Finish the project report by the end of the week.",
  due_date: DateTime.now + 7.days,
  priority: :high,
  status: :in_progress,
  category: category1,
  user: user1,
  completed_at: nil
)

Task.create(
  title: "Complete project report",
  description: "Finish the project report by the end of the week.",
  due_date: DateTime.now + 7.days,
  priority: :high,
  status: :in_progress,
  category: category1,
  user: user1,
  completed_at: nil
)
