class Event < ApplicationRecord
	validates :name, presence: true

#	belongs_to :category

	has_one :location, dependent: :destroy
	has_many :attendees, dependent: :destroy
	has_many :event_groupships
	has_many :groups, through: :event_groupships

end
