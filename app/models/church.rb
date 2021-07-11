class Church < ApplicationRecord
  has_many :events
  CHURCHNAMES = ["Church", "Gathering", "Fellowship", "Congregation", "Community"]
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

end
