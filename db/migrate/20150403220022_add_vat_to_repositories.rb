class AddVatToRepositories < ActiveRecord::Migration
  def change
    add_column :repositories, :vat, :string
  end
end
