require_relative 'player.rb'
require_relative 'mdt_agency.rb'

agency = MDT_Agency.new

# Read input file, create player object and add to agency
IO.foreach('men.txt') do |line|
  data = line.split # data is an array of strings
  name = data[0].to_s
  proficiency = data[1].to_i
  min_desired_partner_proficiency = data[2].to_i
  agency.add_male_player(Player.new(name, proficiency, min_desired_partner_proficiency))
end

IO.foreach('women.txt') do |line|
  data = line.split # data is an array of strings
  name = data[0].to_s
  proficiency = data[1].to_i
  min_desired_partner_proficiency = data[2].to_i
  agency.add_female_player(Player.new(name, proficiency, min_desired_partner_proficiency))
end

# List players
string = agency.to_s
puts(string)

# create teams
agency.create_teams

# Print teams
string = agency.teams_to_s
puts(string)

# Print each player with a proficiency of 9 or greater
agency.each_player { |player| puts(player.name) if player.proficiency >= 9}

# Apply steepest_ascent
old_fitness = agency.team_fitness
agency.improve_teams
new_fitness = agency.team_fitness
puts("old fitness\n#{old_fitness}\nNew fitness:\n#{new_fitness}")

# check that it worked
string = agency.teams_to_s
puts(string)