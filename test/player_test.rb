require 'minitest/autorun'
require 'minitest/pride'
require './lib/player'
require 'pry'

class PlayerTest < MiniTest::Test

  def test_it_has_attributes
    player = Player.new({name: "Luka Modric", position: "midfielder"})

    assert_instance_of Player, player
    assert_equal "Luka Modric", player.name
    assert_equal "midfielder", player.position

  end

end
