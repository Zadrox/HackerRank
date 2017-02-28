def mod_fib(i, init_one, init_two)
  @cache = Array.new(i)
  @cache[1] = init_one
  @cache[2] = init_two
  do_fib(i)
end

def do_fib(i)
  if i < 1
    0
  elsif @cache[i]
    @cache[i]
  else
    @cache[i] = do_fib(i - 2) + do_fib(i - 1)**2
  end

end

init_one, init_two, i = gets.split(' ').map(&:to_i)

mod_fib(i, init_one, init_two)

puts @cache[i]
