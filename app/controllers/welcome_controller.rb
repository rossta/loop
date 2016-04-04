class WelcomeController < ApplicationController
  def index
    @slots = Slot.includes(:post).order(publish_at: :asc).where(published_at: nil)
  end
end
