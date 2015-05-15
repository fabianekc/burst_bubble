class CreateLogs < ActiveRecord::Migration
  def change
    create_table :logs do |t|
      t.string :description
      t.integer :log_class
      t.text :log_objects

      t.timestamps
    end
  end
end
