# == Schema Information
#
# Table name: events
#
#  id          :integer          not null, primary key
#  eventId     :integer
#  createdDate :datetime
#  title       :string(255)
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#

require 'rails_helper'

RSpec.describe Event, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
