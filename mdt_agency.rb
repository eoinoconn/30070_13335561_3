# Class to represent agency, stores male players, female player and teams when created.
# Extends SteepestAscent to utilise template method for creating better teams

require_relative 'team'
require_relative 'steepest_ascent'

class MDT_Agency < SteepestAscent

  def initialize
    @male_players = []
    @female_players = []
  end

  def add_male_player(player)
    @male_players.push(player)
  end

  def add_female_player(player)
    @female_players.push(player)
  end

  def create_teams
    @teams = []
    # sort players by descending proficiency
    @male_players.sort! { |x, y| y.proficiency <=> x.proficiency }
    @female_players.sort! { |x, y| y.proficiency <=> x.proficiency }
    @female_players.zip(@male_players).each do |female, male|
      # create new array of teams
      @teams.push(Team.new(male, female))
    end
  end


  def team_fitness
    evaluate_fitness(@teams)
  end

  def to_s
    str = "MALE Players:\n"
    @male_players.each do |male|
      str += "#{male.name},\tproficiency:\t#{male.proficiency},\tseeks proficiency >= #{male.min_desired_partner_proficiency}\n"
    end
    str += "\nFEMALE Players:\n"
    @female_players.each do |female|
      str += "#{female.name},\tproficiency:\t#{female.proficiency},\tseeks proficiency >= #{female.min_desired_partner_proficiency}\n"
    end
    str
  end

  def teams_to_s
    str = "Teams\n"
    @teams.each { |team| str += team.to_s }
    str
  end

  # iterator for each player
  def each_player
    @male_players.each do |male|
      yield male
    end
    @female_players.each do |female|
      yield female
    end
  end


  # improve teams using steepest ascent
  def improve_teams
    @teams = steepest_ascent_hill(@teams)
  end

  private

  # implement methods to utilise template method
  def evaluate_fitness(list)
    list.inject(0) { |fitness, team| fitness + team.satisfaction }
  end

  def swap_spots(x, y, list)
    other_male_player = list[y].male_player
    list[y].change_male_player(list[x].male_player)
    list[x].change_male_player(other_male_player)
    list
  end


end