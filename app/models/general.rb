# == Schema Information
#
# Table name: generals
#
#  id              :integer          not null, primary key
#  password        :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#  last_login      :datetime
#  password_digest :string(255)
#

class General < ActiveRecord::Base
  has_secure_password
  validates :password,
          # you only need presence on create
          :presence => { :on => :create },
          # allow_nil for length (presence will handle it on create)
          :length   => { :minimum => 6, :allow_nil => true },
          # and use confirmation to ensure they always match
          :confirmation => true
end
