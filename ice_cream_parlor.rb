times_visited = gets.chomp.to_i

times_visited.times do
  money = gets.chomp.to_i
  num_flavs = gets.chomp.to_i
  flav_costs = gets.split.map(&:to_i)

  for x in 0...flav_costs.size
    if flav_costs[x] > money
      next
    else
      for y in x+1...flav_costs.size
        if flav_costs[y] > money
          next
        else
          if flav_costs[x] + flav_costs[y] == money
            puts "#{x+1} #{y+1}"
            break
          end
        end
      end
    end
  end
end