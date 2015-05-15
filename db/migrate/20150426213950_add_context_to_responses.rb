class AddContextToResponses < ActiveRecord::Migration
  def change
    add_column :responses, :context, :text
  end
end
