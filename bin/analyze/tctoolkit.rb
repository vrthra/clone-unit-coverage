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

#==================================================
#Match 9353:
#Found an approx. 8 line duplication in 3 files.
#Starting at line 72 of /home/rahul/research/clone-unit-coverage/src/OpenLayers-2.12/doc/devdocs/files/OpenLayers/Format/OWSContext/v0_3_1-js.html
#Starting at line 52 of /home/rahul/research/clone-unit-coverage/src/OpenLayers-2.12/doc/devdocs/files/OpenLayers/Format/XML/VersionedOGC-js.html


collect = []
others = []
num = 0
STDIN.readlines.each do |l|
  case l
  when /^Found an approx. (\d+) line duplication in (\d+) files./
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

