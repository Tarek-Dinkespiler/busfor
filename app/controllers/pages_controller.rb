class PagesController < ApplicationController
  def update_locale
    @@locale_from_select = params[:locale]

    redirect_back fallback_location: root_path
  end

  def Home
  end
end
