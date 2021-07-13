class Church < ApplicationRecord
  has_many :events
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_location?
  has_one_attached :photo

  # searchkick

   include PgSearch::Model
    pg_search_scope :search_by_longitude_and_latitude,
      against: [ :longitude, :latitude ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }

    def address
      [address1, city, prefecture].compact.join(', ')
    end

  CHURCHNAMES = ["Church", "Gathering", "Fellowship", "Congregation", "Community"]
end
