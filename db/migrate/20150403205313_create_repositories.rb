class CreateRepositories < ActiveRecord::Migration
  def change
    create_table :repositories do |t|
      t.string :name
      t.string :source
      t.string :description
      t.boolean :desc_raw
      t.string :author
      t.integer :interval
      t.datetime :end_date
      t.string :tags
      t.integer :answer_type_id

      t.timestamps
    end
  end
end
