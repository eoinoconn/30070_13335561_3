class Improve_Outcome

  def improve_pairs(list)
    fitness = list_fitness
    list.length.times do |x|
      swap = 0
      list.length.times do |y|
        next if x == y
        swap_spots(x, y, list)
        new_fitness = list_fitness
        swap_spots(x, y, list)
        if new_fitness > fitness
          swap, fitness = y, new_fitness
        end
      end
      if swap != 0
        swap_spots(x, swap, list)
      end
    end
  end

end