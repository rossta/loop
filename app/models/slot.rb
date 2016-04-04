class Slot < ActiveRecord::Base
  belongs_to :post, inverse_of: :slots
  belongs_to :schedulable, inverse_of: :slots
end
