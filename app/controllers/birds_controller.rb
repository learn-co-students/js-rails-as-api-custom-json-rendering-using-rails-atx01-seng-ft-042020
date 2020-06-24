class BirdsController < ApplicationController
  def index
    birds = Bird.all
    render json: birds, except: [:created_at, :updated_at]
  end

  def show
    bird = Bird.find_by(id: params[:id])
    if bird
      render json: bird, only: [:name, :species]
    else
      render json: "Birds aren't real; at least not this one."
    end
  end
end