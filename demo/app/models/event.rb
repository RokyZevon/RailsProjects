class Event < ApplicationRecord
	validates :name, presence: true

	has_many :attendees
end
