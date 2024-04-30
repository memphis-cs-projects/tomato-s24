# frozen_string_literal: true

module ApplicationHelper
  BOOTSTRAP_ALERT_CLASS = {
    'success' => 'alert-success',
    'error'   => 'alert-danger',
    'notice'  => 'alert-info',
    'alert'   => 'alert-danger',
    'warn'    => 'alert-warning'
  }.freeze

  def alert_class(flash_key)
    BOOTSTRAP_ALERT_CLASS.fetch(flash_key, 'alert-info')
  end
  def rating_stars(rating)
    full_stars = rating.floor
    half_star = (rating - full_stars).round(1) >= 0.5
    empty_stars = 5 - full_stars - (half_star ? 1 : 0)

    star_html = ""
    full_stars.times { star_html += "<i class='bi bi-star-fill'></i>" }
    star_html += "<i class='bi bi-star-half'></i>" if half_star
    empty_stars.times { star_html += "<i class='bi bi-star'></i>" }

    star_html.html_safe
  end
end
