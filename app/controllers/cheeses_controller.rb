class CheesesController < ApplicationController

  # GET /cheeses
  def index
    cheeses = Cheese.all
    render json: cheeses, only: [:id, :price, :is_best_seller]

  end

  # GET /cheeses/:id
  def show
    cheese = Cheese.find_by(id: params[:id])

    #only: show only listed attributes
    # render json: cheese, only: [:id, :price, :is_best_seller]

    #except: show all but listed attributes
    # render json: cheese, except: [:created_at, :updated_at]

    #extending JSON Data with :methods
    # render json: cheese, except: [:created_at, :updated_at], methods: [:summary]

    #Building Custom Error Message:
    if cheese
      render json: cheese, except: [:created_at, :updated_at], methods: [:summary]
    else
      render json: {error: "data not found"}, status: :not_found
    end
  end

end
