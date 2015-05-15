class AddFieldsToResponses < ActiveRecord::Migration
  def change
    add_column :responses, :valdatime, :datetime
    add_column :responses, :vat, :string
    add_column :responses, :request_ip, :string
    add_column :responses, :request_header, :string
  end
end
