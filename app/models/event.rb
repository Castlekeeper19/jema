class Event < ApplicationRecord
  belongs_to :user
  belongs_to :church

  has_one_attached :photo
end
