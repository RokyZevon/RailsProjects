class Event < ApplicationRecord
	validates :name, presence: true

	has_many :attendees

	belongs_to :category
end
