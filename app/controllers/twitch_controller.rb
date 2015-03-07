class TwitchController < ApplicationController
  def index
    @response = HTTParty.get("https://api.twitch.tv/kraken/search/channels?q=dota2&limit=25",
    :headers => {
      "Client Secret" => "#{ENV['TWITCH_TOKEN']}",
      "Client-ID" => "ec5agpzfzyczq1wskui7hv9zzrhageg"})
  end

  def show
    @response = HTTParty.get("https://api.twitch.tv/kraken/search/channels?q=#{params[:id]}&limit=25")
    #  :headers => {
    #    "Client Secret" => "#{ENV['TWITCH_TOKEN']}",
    #    "Client-ID" => "ec5agpzfzyczq1wskui7hv9zzrhageg"})
    if @response["_total"].blank?
      redirect_to root_path
    end
    @ign_response = HTTParty.get("https://videogamesrating.p.mashape.com/get.php?game=#{params[:id]}",
    :headers => {
      "X-Mashape-Key" => "8jxjMfitOnmshjPtuOrBNALxx19mp1RoJOojsnkNMwm5lykf2f"
      })
    end
end
