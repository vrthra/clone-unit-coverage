#!/usr/bin/ruby
# vim: set expandtab ts=2 sw=2:

$file = ARGV[0]

def processdup(c)
   has=false;
   count = 0
   c.each do |l|
     if l[:file].include?($file)
        has = true
     else
        count += l[:count]
     end
   end
   if has
      c.each do |l|
        puts "#{l[:file]} similarity #{l[:count]}" unless l[:file].include?($file)
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
