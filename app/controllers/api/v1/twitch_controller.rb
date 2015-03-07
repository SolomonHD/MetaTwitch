class Api::V1::TwitchController < ApplicationController
  def show
    @twitch = HTTParty.get("https://api.twitch.tv/kraken/search/channels?q=#{params[:id]}&limit=25")
    @response = {twitch:[],ign:{}}
    if @twitch["_total"].blank?
      redirect_to root_path
    else
      @ign = HTTParty.get("https://videogamesrating.p.mashape.com/get.php?game=#{params[:id]}",
      :headers => {
        "X-Mashape-Key" => "8jxjMfitOnmshjPtuOrBNALxx19mp1RoJOojsnkNMwm5lykf2f"
        })
      unless @ign.blank?
        @response.merge!(ign:{thumb: @ign[0]["thumb"], score: @ign[0]["score"], short_description: @ign[0]["short_description"]})
      end
      twitch_response = @twitch["channels"].map do |i|
        {name: i["display_name"],
         url: i["url"],
         views: i["views"],
         followers: i["followers"]}
      end
      @response.merge!(twitch:twitch_response)
    end
    render json: @response
  end
end


# @ign_response[0]["thumb"]
# @ign_response[0]["score"]
# @ign_response[0]["short_description"]
#
# @response["channels"]
# i["display_name"]
# i["url"]
# i["views"]
# i["followers"]
