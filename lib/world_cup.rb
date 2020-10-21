class WorldCup
  attr_reader :year, :teams

  def initialize(year, teams)
    @year = year
    @teams = teams
  end

  def active_players_by_position(position)
    players = []
    @teams.each do |team|
      if team.eliminated == false
        players << team.players_by_position(position)
      end
    end
    players.flatten
  end

  def active_players
    teams.map do |team|
      team.players
    end.flatten
  end

  def all_players_by_position
    hash = {}

    active_players.each do |player|
      if hash[player.position]
        hash[player.position] << player
      else
        hash[player.position] = [player]
      end
    end
    hash
  end

end
