class UpdatePwddigest < ActiveRecord::Migration
  def change
    remove_column :generals, :passwort_digest
    add_column :generals, :password_digest, :string
  end
end
