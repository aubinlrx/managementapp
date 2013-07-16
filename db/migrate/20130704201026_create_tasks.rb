class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :description
      t.date :date
      t.references :task_list, index: true

      t.timestamps
    end
  end
end
