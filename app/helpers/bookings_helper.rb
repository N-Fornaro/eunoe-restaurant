# frozen_string_literal: true

module BookingsHelper
  def sort_link(column:, label:)
    link_to(label, list_bookings_path(column:, direction: (column == params[:column] ? next_direction : 'asc')))
  end

  def next_direction
    params[:direction] == 'asc' ? 'desc' : 'asc'
  end

  def sort_indicator
    # params[:direction] == 'asc' ? '▲' : '▼'
    tag.span(class: "sort sort-#{params[:direction]}")
  end
end
