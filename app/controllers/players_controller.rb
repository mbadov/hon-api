class PlayersController < ApplicationController
  def show
    match_players = MatchPlayer.find_all_by_account_id(params[:id])
    render :json => match_players.to_json
  end
end
