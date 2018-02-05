require_relative "./team_data"

class Player
  attr_reader :name, :position, :team

  def initialize(name, position, team)
    @name = name
    @position = position
    @team = team
  end

  def self.player_by_position(player_position)
    @players = []
    TeamData::ROLL_CALL.each do | team, players |
      players.each do | position, player |
        if position.to_s == player_position
          @players <<  Player.new(player,position,team)
        end
      end
    end
  @players
  end

  def self.all
    @all_players = []
    TeamData::ROLL_CALL.each do | team, players |
      players.each do | position, player |
        @all_players <<  Player.new(player,position,team)
      end
    end
    @all_players
  end
end
