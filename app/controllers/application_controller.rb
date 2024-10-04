class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  before_action :set_locale_from_select
  before_action :set_locale

  def set_locale_from_select
    if !(defined?(@@locale_from_select))
      @@locale_from_select = nil
    end
  end

  def set_locale
    begin
      I18n.locale =
        locale_from_params ||
        locale_from_select ||
        locale_from_header ||
        I18n.default_locale
    rescue
      I18n.locale = I18n.default_locale
    end
  end

  private

  def locale_from_params
    params[:lang]&.scan(/[a-z]{2}/)&.first
  end

  def locale_from_select
    @@locale_from_select
  end

  def locale_from_header
    request.env.fetch("HTTP_ACCEPT_LANGUAGE", "").scan(/[a-z]{2}/).first
  end
end
