class IgnController < ApplicationController
  def index
    @ign_response = HTTParty.get("https://videogamesrating.p.mashape.com/get.php?game=dota",
    :headers => {
      "X-Mashape-Key" => "8jxjMfitOnmshjPtuOrBNALxx19mp1RoJOojsnkNMwm5lykf2f",
      })
    end
  end
  
