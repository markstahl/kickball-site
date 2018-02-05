require "sinatra"
require "pry" if development? || test?
require "sinatra/reloader" if development?

require_relative "models/player"
require_relative "models/team"
require_relative "models/team_data"

set :bind, '0.0.0.0'  # bind to all interfaces

get "/" do
  "<h1><b>The LACKP Homepage</b></h1>
  <ul>
  <ol><h2><a href='/teams'>Teams</a></h2></ol>
  <ol><h2><a href='/players'>Players</a></h2></ol>
  <ol><h2><a href='/positions'>Positions</a></h2></ol>
  </ul>
  "
end

get "/teams" do
  @team_names = Team.all
  erb :teams
end

get "/teams/:team_name" do
  @players = Team.players(params[:team_name])
  erb :team_info
end

get "/players" do
  @all_players = Player.all
  erb :players
end

get "/positions" do
  @positions = Team::POSITIONS
  erb :positions
end

get "/positions/:position" do
  @players = Player.player_by_position(params[:position])
  erb :player_by_position
end
