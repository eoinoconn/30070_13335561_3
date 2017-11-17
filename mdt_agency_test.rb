require 'test/unit'
require_relative 'mdt_agency'
require_relative 'player'

class MDTAgencyTest < Test::Unit::TestCase

  def setup
    @agency = MDT_Agency.new
    4.times do |x|
      @agency.add_male_player(Player.new("player#{x}", x*2 + 1, x + 1))
      @agency.add_female_player(Player.new("player#{x + 4}", x*2 + 2, x + 2))
    end
  end

  def example_to_s
    str = "MALE Players:\n"
    3.downto(0) do |x|
      str += "player#{x},\tproficiency:\t#{x * 2 + 1},\tseeks proficiency >= #{x + 1}\n"
    end
    str += "\nFEMALE Players:\n"
    3.downto(0) do |x|
      str += "player#{x + 4},\tproficiency:\t#{x * 2 + 2},\tseeks proficiency >= #{x + 2}\n"
    end
    str
  end

  def test_to_s
    @agency.create_teams
    str_test = @agency.to_s
    str_example = example_to_s
    assert_equal(str_example, str_test, 'to_s method returning incorrectly')
  end

  def test_team_fitness
    @agency.create_teams
    assert_equal(@agency.team_fitness, -0.5, 'Fitness incorrect')
  end

  def test_each_player
    str, str_example = '', ''
    @agency.each_player do |player|
      str += (player.name + "\n")
    end
    8.times do |x|
      str_example += ("player#{x}\n")
    end
    assert_equal(str, str_example, 'Issue with each_player iterator')
  end

end