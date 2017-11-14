class Team

  attr_reader :satisfaction

  def initialize(male_player, female_player)
    @male_player, @female_player = male_player, female_player
    @satisfaction = calculate_satisfaction
  end

  def to_s
    "(#{@female_player.name}, #{@male_player.name}) Satisfaction:\t#{@satisfaction}\n"
  end

  private

  def calculate_satisfaction
    (@male_player.satisfaction(@female_player.proficiency) + @female_player.satisfaction(@male_player.proficiency) ) / 2
  end
end