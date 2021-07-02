class Church < ApplicationRecord
  has_many :events
  CHURCHNAMES = ["Church", "Gathering", "Fellowship", "Congregation", "Community"]
end
