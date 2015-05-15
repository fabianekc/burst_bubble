# == Schema Information
#
# Table name: responses
#
#  id             :integer          not null, primary key
#  list           :string(255)
#  quest_id       :integer
#  author         :string(255)
#  confidence     :integer
#  session_id     :string(255)
#  created_at     :datetime
#  updated_at     :datetime
#  valdatime      :datetime
#  vat            :string(255)
#  request_ip     :string(255)
#  request_header :string(255)
#  value          :string(255)
#

class Response < ActiveRecord::Base
end
