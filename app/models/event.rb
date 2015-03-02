class Event < ActiveRecord::Base
  belongs_to :group
  belongs_to :instance, polymorphic: true, dependent: :destroy
end
