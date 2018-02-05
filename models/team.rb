require_relative "./team_data"

class Team
  POSITIONS =
  [
        "Catcher",
        "Pitcher",
        "1st Base",
        "2nd Base",
        "3rd Base",
        "Shortstop",
        "Right Field",
        "Center Field",
        "Left Field"
  ]

  attr_reader :name

  def initialize(name)
    @name = name
  end

  def self.players(team_name)
    @players = []
    TeamData::ROLL_CALL.each do | team, players |
      if team.to_s == team_name
        players.each do | player, position |
          @players <<  Player.new(player,position,team)
        end
      end
    end
    @players
  end

  def self.all
    @team_names = []
    TeamData::ROLL_CALL.each do | team, players |
      @team_names << team
    end
    @team_names
  end
end
