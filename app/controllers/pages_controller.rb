class PagesController < ApplicationController
  def home
  end

  def update_locale
    @@locale_from_select = params[:locale]

    redirect_back fallback_location: root_path
  end

  def travel_options
  end
end
