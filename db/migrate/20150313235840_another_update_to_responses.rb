class AnotherUpdateToResponses < ActiveRecord::Migration
  def change
    add_column :responses, :value, :string
    remove_column :responses, :response
  end
end
