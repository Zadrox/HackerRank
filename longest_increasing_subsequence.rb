def binary_search(i, tails)
  l = 0
  r = tails.size - 1

  while (r - l) > 1

    m = (l+r)/2
    tails[m] < i ? l = m : r = m

  end

  r

end

ar_vals = []
tails = []
(1..gets.to_i).each { ar_vals << gets.to_i }
tails << ar_vals[0]

(1...ar_vals.size).each do |i|
  k = ar_vals[i]
  if k <= tails[0]
    tails[0] = k
  elsif k > tails[-1]
    tails << k
  else
    tails[binary_search(k, tails)] = k
  end
end

puts tails.size
