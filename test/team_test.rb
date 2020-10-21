require 'minitest/autorun'
require 'minitest/pride'
require './lib/player'
require './lib/team'
require 'pry'

class TeamTest < MiniTest::Test

  def test_it_has_attributes
    team = Team.new("France")

    assert_instance_of Team, team
    assert_equal "France", team.country
    assert_equal false, team.eliminated?

    team.eliminated = true

    assert_equal true, team.eliminated?
  end

  def test_teams_have_players
    team = Team.new("France")
    mbappe = Player.new({name: "Kylian Mbappe", position: "forward"})
    pogba = Player.new({name: "Paul Pogba", position: "midfielder"})

    assert_equal [], team.players

    team.add_player(mbappe)
    team.add_player(pogba)
    expected = [mbappe, pogba]

    assert_equal expected, team.players
    assert_equal [pogba], team.players_by_position("midfielder")
    assert_equal [], team.players_by_position("defender")
  end

end
