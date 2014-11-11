# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  firstName  :string(255)
#  lastName   :string(255)
#  email      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

require 'rails_helper'

RSpec.describe User, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
