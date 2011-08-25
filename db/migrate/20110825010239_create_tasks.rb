class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.integer :user_id
      t.integer :parent_id
      t.string :title
      t.text :description
      t.datetime :due_date
      t.datetime :completed_at

      t.timestamps
    end
  end
end
