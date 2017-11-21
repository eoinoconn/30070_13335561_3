# Class with template method for SteepestAscent

module SteepestAscent

  def steepest_ascent_hill(list)
    best_fitness = evaluate_fitness(list)
    list.length.times do |x|
      swap = 0
      list.length.times do |y|
        next if x == y
        list = swap_spots(x, y, list)
        new_fitness = evaluate_fitness(list)
        list = swap_spots(x, y, list)
        swap, best_fitness = y, new_fitness if new_fitness > best_fitness
      end
      list = swap_spots(x, swap, list) if swap != 0
    end
    list
  end

end