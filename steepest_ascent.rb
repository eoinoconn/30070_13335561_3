# Class with template method for SteepestAscent

module SteepestAscent

  def steepest_ascent_hill(list)
    # First get current fitness of all teams
    best_fitness = evaluate_fitness(list)
    list.length.times do |x|
      swap = 0
      list.length.times do |y|
        # Check every permutation of male partner with female.
        next if x == y
        list = swap_spots(x, y, list)
        new_fitness = evaluate_fitness(list)
        list = swap_spots(x, y, list)

        # if the new partner orientation is an improvement,
        # remember the pair
        swap, best_fitness = y, new_fitness if new_fitness > best_fitness
      end

      #perform the swap of the best fitness improvement
      list = swap_spots(x, swap, list) if swap != 0
    end
    list
  end

end