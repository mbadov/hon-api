class MatchesController < ApplicationController
  def index
    render :text => "Welcome to HoN API"
  end
  
  def show
    match = Match.find_by_id(params[:id])
    render :json => match.to_json
  end
end
