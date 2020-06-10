class SightingsController < ApplicationController

    def index
        sightings = Sighting.all
        render json: sightings.to_json(
            include:
                [{bird: {except: [:created_at, :updated_at]}},
                {location: {except: [:created_at, :updated_at]}}],
            except: [:created_at, :updated_at])
    end

    def show
        sighting = Sighting.find_by(id: params[:id])
        if sighting
            render json: {id: sighting.id, bird: sighting.bird, location: sighting.location}
        else
            render json: {message: "There is no sighting with this id"}
        end
    end
end
