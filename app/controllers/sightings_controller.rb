class SightingsController < ApplicationController

  def show
    sighting = Sighting.find_by(id: params[:id])
    if sighting
      render json: sighting.to_json(:include => {
        :bird => {:only => [:name, :species]},
        :location => {:only => [:latitude, :longitude]}
      }, :except => [:updated_at])
    else
      render json: {message: "Sorry, no sighting could be found"}
    end
  end

  def index
    sightings = Sighting.all
    render json: sightings, include: [:bird, :location]
  end
end
