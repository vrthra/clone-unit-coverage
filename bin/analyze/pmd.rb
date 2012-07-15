#!/usr/bin/ruby
# vim: set expandtab ts=2 sw=2:

require 'lib/clonelib'

$file = ARGV[0]
$all = false
case $file
when /-all/
 $all = true
else
 $all = false
end

collect = []
others = []
num = 0
STDIN.readlines.each do |l|
  case l
  when /^Found a (\d+) line \(\d+ tokens\) duplication in the following files:/
     num = $1.to_i
     processdup(collect) unless collect.length == 0
     collect = []
  when /Starting at line (\d+) of (.+)$/
     c ={:from => $1.to_i, :file => $2}
     c[:count] = num
     collect << c
  else
     others << l
  end
end
processdup(collect)
