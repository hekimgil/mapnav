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

class Photo < ActiveRecord::Base
  #attr_accessible :url, :thumbnail, :bitmap, :title, :description, :createdDate
  belongs_to :event

  validates :url, presence: true
  validates :latitude, presence: true, numericality: { less_than_or_equal_to: 90, greater_than_or_equal_to: -90 }
  validates :longitude, presence: true, numericality: { less_than_or_equal_to: 180, greater_than_or_equal_to: -180 }

end
