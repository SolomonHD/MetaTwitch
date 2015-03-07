class TwitchController < ApplicationController
  def index
  end

  def show
    @response = HTTParty.get("https://api.twitch.tv/kraken/search/channels?q=#{params[:id]}&limit=25")

    if @response["_total"].blank?
      redirect_to root_path
    end
    @ign_response = HTTParty.get("https://videogamesrating.p.mashape.com/get.php?game=#{params[:id]}",
    :headers => {
      "X-Mashape-Key" => "8jxjMfitOnmshjPtuOrBNALxx19mp1RoJOojsnkNMwm5lykf2f"
      })
  end
end
