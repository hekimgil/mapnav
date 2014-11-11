# == Schema Information
#
# Table name: photos
#
#  id          :integer          not null, primary key
#  url         :string(255)
#  thumbnail   :string(255)
#  bitmap      :string(255)
#  title       :string(255)
#  description :text
#  ownerEvent  :integer
#  createdDate :datetime
#  created_at  :datetime
#  updated_at  :datetime
#

require 'rails_helper'

RSpec.describe Photo, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
