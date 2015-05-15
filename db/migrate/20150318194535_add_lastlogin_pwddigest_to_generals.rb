class AddLastloginPwddigestToGenerals < ActiveRecord::Migration
  def change
    add_column :generals, :last_login, :datetime
    add_column :generals, :passwort_digest, :string
  end
end
