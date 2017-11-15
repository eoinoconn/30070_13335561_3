
require_relative 'team'


class MDT_Agency

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
    @male_players.sort! { |x, y| y.proficiency <=> x.proficiency }
    @female_players.sort! { |x, y| y.proficiency <=> x.proficiency }
    @female_players.zip(@male_players).each do |female, male|
      @teams.push(Team.new(male, female))
    end
  end

  def improve_team
    fitness = list_fitness(@teams)
    @teams.length.times do |x|
      initial_male_player = @teams[x].male_player
      swap = 0
      @teams.length.times do |y|
        if x == y
          next
        end
        other_male_player = @teams[y].male_player
        @teams[x].change_male_player(other_male_player)
        @teams[y].change_male_player(initial_male_player)
        new_fitness = list_fitness(@teams)
        @teams[x].change_male_player(initial_male_player)
        @teams[y].change_male_player(other_male_player)
        if new_fitness > fitness
          swap = y
          fitness = new_fitness
        end
      end
      if swap != 0
        @teams[x].change_male_player(@teams[swap].male_player)
        @teams[swap].change_male_player(initial_male_player)
      end
    end
  end

  def list_fitness(list)
    list.inject(0) { |fitness, team| fitness + team.satisfaction }
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

  def each_player
    @male_players.each do |male|
      yield male
    end
    @female_players.each do |female|
      yield female
    end
  end

  def steepest_ascent_hill(list)
    fitness = list_fitness(list)
    list.length.times do |x|
      swap = 0
      list.length.times do |y|
        next if x == y
        list = swap_spots(x, y, list)
        new_fitness = list_fitness(list)
        list = swap_spots(x, y, list)
        swap, fitness = y, new_fitness if new_fitness > fitness
      end
      list = swap_spots(x, swap, list) if swap != 0
    end
    list
  end

  def swap_spots(x, y, list)
    other_male_player = list[y].male_player
    list[y].change_male_player(list[x].male_player)
    list[x].change_male_player(other_male_player)
    list
  end

  def steep
    @teams = steepest_ascent_hill(@teams)
  end

end