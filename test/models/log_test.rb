# == Schema Information
#
# Table name: logs
#
#  id          :integer          not null, primary key
#  description :string(255)
#  log_class   :integer
#  log_objects :text
#  created_at  :datetime
#  updated_at  :datetime
#

require 'test_helper'

class LogTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
