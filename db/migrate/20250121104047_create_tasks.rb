class CreateTasks < ActiveRecord::Migration[7.1]
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :description
      t.datetime :due_date
      t.integer :priority
      t.integer :status
      t.references :user, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true
      t.datetime :completed_at

      t.timestamps
    end
  end
end
