# Stores male and female pair

class Team

  attr_reader  :male_player

  def initialize(male_player, female_player)
    @male_player, @female_player = male_player, female_player
  end

  def to_s
    "(#{@female_player.name}, #{@male_player.name}) Satisfaction:\t#{satisfaction}\n"
  end

  def change_male_player(male_player)
    @male_player = male_player
  end

  def satisfaction
    (@male_player.satisfaction(@female_player.proficiency) + @female_player.satisfaction(@male_player.proficiency) ) / 2
  end
end