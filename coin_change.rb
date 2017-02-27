# Enter your code here. Read input from STDIN. Print output to STDOUT

def make_change(amount, coins)
  @cache = Array.new(amount + 1) { |i| Array.new(coins.size, i.zero? ? 1 : nil) }
  @coins = coins
  do_count(amount, @coins.length - 1)
end

def do_count(n, m)
  if n < 0 || m < 0
    0
  elsif @cache[n][m]
    @cache[n][m]
  else
    @cache[n][m] = do_count(n - @coins[m], m) + do_count(n, m - 1)
  end
end

n, m = gets.split(' ').map(&:to_i)
change = gets.split(' ').map(&:to_i).sort!

puts make_change(n, change)

