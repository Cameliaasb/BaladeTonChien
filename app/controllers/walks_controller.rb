class WalksController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :authenticate_user!, only: :home


  def home
  end

  def index
    @walks = Walk.all

    if params[:difficulty].present?
      puts params[:difficulty]
      @walks = Walk.where(difficulty: "#{params[:difficulty]}")
      p @walks.count
    end

    if params[:duration].present?
      puts params[:duration]
      @walks = @walks.where("walks.duration <= ?", params[:duration])
      p @walks.count
    end

    if params[:distance].present?
      puts params[:distance]
      @walks = @walks.where("walks.distance <= ?", params[:distance])
      p @walks.count
    end

    if params[:query].present?
      sql_subquery = "title @@ :query OR description @@ :query OR difficulty @@ :query OR city @@ :query"
      @walks = @walks.where(sql_subquery, query: "%#{params[:query]}%")
    end

    @dog = current_user.dog

    # Insere toutes les balades sur la map
    @markers = @walks.map do |walk|
      {
        lat: walk.start_address_latitude,
        lng: walk.start_address_longitude,
        info_window_html: render_to_string(partial: "info_window", locals: { walk: walk }),
        marker_html: render_to_string(partial: "marker")
      }
    end
  end

  def show
    @walk = Walk.find(params[:id])
    @walk_geometry = @walk.geometry
    @markers = [{
      lat: @walk.start_address_latitude, lng: @walk.start_address_longitude,
      marker_html: render_to_string(partial: "marker"),
      info_window_html: render_to_string(partial: "info_window", locals: { walk: @walk })
    }]
  end
end
