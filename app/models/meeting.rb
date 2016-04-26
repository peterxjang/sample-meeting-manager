class Meeting < ActiveRecord::Base
  has_many :meeting_tags
  has_many :tags, through: :meeting_tags

  validates :name, presence: true
  validates :address, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
end
