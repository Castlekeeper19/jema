class Church < ApplicationRecord
  has_many :events
  belongs_to :user
  has_many :services

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_location?
  has_one_attached :photo

  # searchkick

   include PgSearch::Model
    pg_search_scope :search_by_longitude_and_name,
      against: [ :location, :name ],
    using: {
      tsearch: { prefix: true, any_word: true }
    }

    def address
      [address1, city, prefecture].compact.join(', ')
    end

  CHURCHNAMES = ["Church", "Gathering", "Fellowship", "Congregation", "Community"]
end
