class AddCommentToResponses < ActiveRecord::Migration
  def change
    add_column :responses, :comment, :text
  end
end
