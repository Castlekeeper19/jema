class Service < ApplicationRecord
  belongs_to :church

  SERVICETYPE = ["Worship", "Bible Study", "Youth Gathering", "Social Event", "Out Reach"]
  LANGUAGES = ["English", "Japanese", "Korean", "Chinese"]
end
