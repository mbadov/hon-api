class MatchesController < ApplicationController
  def show
    match = Match.find_by_id(params[:id])
    render :json => match.to_json
  end
end
