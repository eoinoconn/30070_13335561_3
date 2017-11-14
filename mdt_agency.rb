
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
    @teams = @female_players.zip(@male_players)
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
end