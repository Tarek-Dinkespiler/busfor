class PagesController < ApplicationController
  before_action :set_destinations

  def home
  end

  def update_locale
    @@locale_from_select = params[:locale]

    redirect_back fallback_location: root_path
  end

  def travel_options
    @from_city = params[:from_city]
    @to_city = params[:to_city]
    @selected_date = params[:selected_date]

    @travel_options = BusTimeTable.find_travel_options(@from_city, @to_city, @selected_date)
  end

  private

  def set_destinations
    @destinations = Destination.all
  end
end
