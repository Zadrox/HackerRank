class DfsCompute

  def initialize(vertices)
    @vertices = vertices
    @visited = Array.new(@vertices.size, false)
    @sums = []

    dfs
  end

  def dfs_util(i, count = 0)
    @visited[i] = true
    count += 1

    unless @vertices[i].nil?
      @vertices[i].each do |e|
        count = dfs_util(e, count) unless @visited[e]
      end
    end
    count
  end

  def dfs
    (0...@vertices.size).each do |i|
      @sums << dfs_util(i) if !@visited[i] && !@vertices[i].nil?
    end
  end

  def my_sums
    @sums
  end

end

n, i = gets.split.map(&:to_i)

vertices = Array.new(n) { [] }

i.times do
  a, b = gets.split.map(&:to_i)
  vertices[a] << b
  vertices[b] << a
end

computer = DfsCompute.new(vertices)
sums = computer.my_sums

result = 0
running_sum = 0

(0...sums.size).each do |j|
  result += running_sum*sums[j]
  running_sum += sums[j]
end

puts result
