class Church < ApplicationRecord
  has_many :events
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
  has_one_attached :photo

  CHURCHNAMES = ["Church", "Gathering", "Fellowship", "Congregation", "Community"]
end
