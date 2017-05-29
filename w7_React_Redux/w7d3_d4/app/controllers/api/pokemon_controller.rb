class Api::PokemonController < ApplicationController
  def index
    @pokemon = Pokemon.all
  end

  def show
    @pokemon = Pokemon.includes(:items).find(params[:id])
  end

  def create
    debugger
    @pokemon = Pokemon.new(pokemon_params)
    if @pokemon.save
      render :show
    else
    end
  end

  private

  def pokemon_params
    params.require(:pokemon).permit(:name, :attack, :defense,
                                    :image_url, :moves, :poke_type,
                                    :items)
  end
end
