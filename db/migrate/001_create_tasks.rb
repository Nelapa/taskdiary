class CreateTasks < ActiveRecord::Migration
  def self.up
    create_table :tasks do |t|
      t.string :name
      t.boolean :status
      t.boolean :complete
      t.text :description
      t.date :due

      t.timestamps
    end
  end

  def self.down
    drop_table :tasks
  end
end
