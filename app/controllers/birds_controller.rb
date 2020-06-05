class BirdsController < ApplicationController
  skip_before_action :verify_authenticity_token
  
  def index
    birds = Bird.all
    render json: birds, only: [:id, :name, :species]
  end

  def show
    bird = Bird.find_by(id: params[:id])
    if bird
      render json: bird.slice(:id, :name, :species)
    else
      render json: {message: "Bird not found"}
    end
  end


  def create 

    bird = Bird.new(bird_params)
    if bird.valid?
      bird.save
    render json: bird, only: [:id, :name, :species]
    else
      render json: {errors: bird.errors.full_messages}
    end 
  end


  private

  def bird_params
    params.require(:bird).permit(:name, :species)
  end

end