class CorrectionsEvent < ActiveRecord::Base
  belongs_to :corrections_schedule, inverse_of: :corrections_events
end
