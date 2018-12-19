class PokemonController < ApplicationController


  def show
    res = HTTParty.get("http://pokeapi.co/api/v2/pokemon/#{params[:id]}/")
    body = JSON.parse(res.body)
    name  = body["name"]
    id = body["id"]
    types = body["types"]
    simple_types = []
    types.each do |thing|
      simple_types << thing["type"]["name"]
    end
    # simple_types = types.map do |thing|
    #   thing["type"]["name"]
    # end
    render json: { id: id, name: name, types: simple_types }
  end
end
