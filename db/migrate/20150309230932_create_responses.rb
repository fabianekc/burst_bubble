class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.string :list
      t.integer :quest_id
      t.string :response
      t.string :author
      t.integer :confidence
      t.string :session_id

      t.timestamps
    end
  end
end
