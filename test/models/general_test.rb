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

require 'test_helper'

class GeneralTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
