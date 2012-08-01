#!/usr/bin/ruby
i = 0
j = 0
STDIN.readlines.each do |l|
case l
when /^(\d+) +\S+/
  i += $1.to_i
  j += 1
else
  p l
end
end

puts "#{i}/#{j}"
puts " =#{i/j}"

