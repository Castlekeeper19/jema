class Event < ApplicationRecord
  belongs_to :user
  belongs_to :church

  has_one_attached :photo

  include PgSearch::Model
    pg_search_scope :search_by_location_and_name,
      against: [ :location, :name ],
      associated_against: {
      church: [ :name]
      },
      using: {
        tsearch: { prefix: true } # <-- now `superman batm` will return something!
      }
end
