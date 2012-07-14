#!/usr/bin/ruby
# vim: set expandtab ts=2 sw=2:

$file = ARGV[0]

def processdup(c)
   c.each do |l|
     if l[:file] =~ /$file/
        p c
     end
   end
end

collect = []
others = []
STDIN.readlines.each do |l|
  case l
  when /^Found (\d+) duplicate lines in the following files:/
     processdup(collect) unless collect.length == 0
     collect = []
  when /Between lines (\d+) and (\d+) in (.+)$/
     c ={:from => $1.to_i, :to => $2.to_i, :file => $3}
     c[:count] = c[:to] - c[:from]
     collect << c
  else
     others << l
  end
end
processdup(collect)
#puts others
