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

class Event < ActiveRecord::Base
  #attr_accessible :title, :description
  has_many :photos, dependent: :destroy
  belongs_to :user
end
