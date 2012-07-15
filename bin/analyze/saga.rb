#!/usr/bin/ruby
require 'rubygems'
require 'nokogiri'  

file = ARGV[0]
case ARGV[0]
when %r{.*[/]([^/ ]+)[.]html-report.html}
   file = $1
end

page =  Nokogiri::HTML(open(ARGV[0]))   
#page =  Nokogiri::HTML(STDIN)   
page.css('tr').select {|x| x['onclick'] =~ /__coverage_toggleSection/}.each do |x|
  next if x.css('td').css('a').css('strong').text =~ /eval/
  puts "#{file}: #{x.css('td').css('a').css('strong').text} #{x.css('td[class=executed]').text}/#{x.css('td[class=statements]').text}"
end
