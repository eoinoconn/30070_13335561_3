require 'test/unit'
require_relative 'player'

class PlayerTest < Test::Unit::TestCase

  def setup
    @player = Player.new("player1", 10, 5)
  end

  # test satisfaction method
  def test_satisfaction
    sat = @player.satisfaction(6)
    assert_equal(0, sat, 'error with player satisfaction')
    sat = @player.satisfaction(4)
    assert_equal(-1, sat, 'error with player satisfaction')
  end
end