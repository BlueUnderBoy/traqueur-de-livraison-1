# == Schema Information
#
# Table name: deliveries
#
#  id          :bigint           not null, primary key
#  description :string
#  details     :text
#  expected_on :date
#  rec         :string
#  user        :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Delivery < ApplicationRecord
end
