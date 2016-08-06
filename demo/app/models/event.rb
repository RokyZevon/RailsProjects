class Event < ApplicationRecord
	validates :name, presence: true

	has_many :attendees
	has_one :location

	belongs_to :category
end
