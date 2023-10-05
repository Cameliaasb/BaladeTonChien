class WalksController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :authenticate_user!, only: :home

  # homepage with dog and action btn
  def home
  end

  def index
    @walks = Walk.all
    @dog = current_user.dog
    # filters the map if any filters have been activated
    # And inserts all walks in map
    insert_markers(filter(@walks))
  end

  def show
    @walk = Walk.find(params[:id])
    # inserts the detailed walk in the map
    @walk_geometry = @walk.geometry
    @markers = [{
      lat: @walk.start_address_latitude, lng: @walk.start_address_longitude,
      marker_html: render_to_string(partial: "marker"),
      info_window_html: render_to_string(partial: "info_window", locals: { walk: @walk })
    }]
  end

  def filter(walks)
    walks = Walk.where(difficulty: params[:difficulty]) if params[:difficulty].present?
    walks = walks.where("walks.duration <= ?", params[:duration]) if params[:duration].present?
    walks = walks.where("walks.distance <= ?", params[:distance]) if params[:distance].present?

    if params[:query].present?
      sql_subquery = "title @@ :query OR description @@ :query OR difficulty @@ :query OR city @@ :query"
      walks = walks.where(sql_subquery, query: "%#{params[:query]}%")
    end

    return walks
  end

  def insert_markers(walks)
    @markers = walks.map do |walk|
      {
        lat: walk.start_address_latitude,
        lng: walk.start_address_longitude,
        info_window_html: render_to_string(partial: "info_window", locals: { walk: walk }),
        marker_html: render_to_string(partial: "marker")
      }
    end
  end
end
