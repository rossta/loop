class Schedule < ActiveRecord::Base
  serialize :recurrence, Recurrence

  belongs_to :channel, inverse_of: :schedules

  after_initialize :initialize_recurrence, if: :new_record?

  private

  def initialize_recurrence
    self.recurrence ||= Recurrence.new
  end
end
