class CreateGenerals < ActiveRecord::Migration
  def change
    create_table :generals do |t|
      t.string :password

      t.timestamps
    end
  end
end
