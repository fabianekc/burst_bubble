# == Schema Information
#
# Table name: repositories
#
#  id             :integer          not null, primary key
#  name           :string(255)
#  source         :string(255)
#  description    :string(255)
#  desc_raw       :boolean
#  author         :string(255)
#  interval       :integer
#  end_date       :datetime
#  tags           :string(255)
#  answer_type_id :integer
#  created_at     :datetime
#  updated_at     :datetime
#  vat            :string(255)
#

require 'test_helper'

class RepositoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
