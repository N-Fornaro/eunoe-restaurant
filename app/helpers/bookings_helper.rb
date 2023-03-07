# frozen_string_literal: true

module BookingsHelper
  def build_order_link(column:, label:)
    direction = (column == session.dig('booking_filters', 'column') ? next_direction : 'asc')
    link_to(label, list_bookings_path(column:, direction:))
  end

  def next_direction
    session['booking_filters']['direction'] == 'asc' ? 'desc' : 'asc'
  end

  def sort_indicator
    # params[:direction] == 'asc' ? '▲' : '▼'
    tag.span(class: "sort sort-#{session['booking_filters']['direction']}")
  end
end
