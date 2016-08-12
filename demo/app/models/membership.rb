class Membership < ApplicationRecord
  belongs_to :event
  belongs_to :user

  # delegate :id, to: :event, prefix: true, allow_nil: true
end
