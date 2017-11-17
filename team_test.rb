require 'test/unit'
require_relative 'team'
require_relative 'player'

class TeamTest < Test::Unit::TestCase

  def setup
    @team = Team.new(Player.new('player1', 4, 6), Player.new('player2', 10, 8))
  end

  def test_to_s
    str = @team.to_s
    str_example = "(player2, player1) Satisfaction:	-2.0\n"
    assert_equal(str_example, str, 'Issue with team to_s')
  end

  def test_change_male_player
    @team.change_male_player(Player.new('player3', 9, 1))
    str = @team.to_s
    str_example = "(player2, player3) Satisfaction:	0\n"
    assert_equal(str_example, str, 'Issue with change_male_player')
  end

end