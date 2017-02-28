# merge range code taken from github

def ranges_overlap?(a, b)
  a.include?(b.begin) || b.include?(a.begin)
end

def merge_ranges(a, b)
  [a.begin, b.begin].min..[a.end, b.end].max
end

def merge_overlapping_ranges(ranges)
  ranges.sort_by(&:begin).inject([]) do |ranges, range|
    if !ranges.empty? && ranges_overlap?(ranges.last, range)
      ranges[0...-1] + [merge_ranges(ranges.last, range)]
    else
      ranges + [range]
    end
  end
end

rows, columns, tracks = gets.split(' ').map(&:to_i)

city_grid = Hash.new([])

tracks.times do
  row, column_start, column_end = gets.split(' ').map(&:to_i)

  if city_grid.key?(row)
    track_arr = city_grid[row]
    track_arr = merge_overlapping_ranges(track_arr + [column_start..column_end])
    city_grid[row] = track_arr

  else
    city_grid[row] = [column_start..column_end]
  end
end

lamps = columns*rows

track_ranges = city_grid.values
track_ranges.each do |y|
  y.each do |x|
    lamps -= (x.end - x.begin)+1
  end
end

puts lamps
