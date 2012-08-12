#!/usr/bin/ruby
require 'rubygems'

project = {}

File.open('summary/similarity.summary').each_line do |l|
  case l.chomp
  when /(\d+) result\/(.+).sim$/
    project[$2.to_sym] = {:knowndups => $1.to_i}
  when /.*\.summary$/
  else
    raise l
  end
end

File.open('summary/cloc.txt').each_line do |l|
  case l.chomp
  when /([^ ]+) code: (\d+) test: (\d+) test\/code (\d+) %/
    name = $1.downcase.to_sym
    next unless project[name]
    code = $2.to_i
    test = $3.to_i
    project[name][:code] = code
    project[name][:test] = test
  else
    raise l
  end
end


File.open('summary/contributor_count.txt').each_line do |l|
  case l.chomp
  when /(\d+) : ([^ ]+)/
    name = $2.downcase.to_sym
    next unless project[name]
    count = $1.to_i
    project[name][:contributors] = count
  else
    raise l
  end
end

File.open('summary/coverage-data.txt').each_line do |l|
  case l.chomp
  when /(\d+)\/(\d+) ([^ ]+)-report.log$/
    name = $3.downcase.to_sym
    next unless project[name]
    coverage = $1.to_i
    total = $2.to_i
    project[name][:coverage] = coverage
    project[name][:total] = total
  else
    #raise l
  end
end

File.open('summary/filecount.summary').each_line do |l|
  case l.chomp
  when /(\d+) ([^ ]+)$/
    name = $2.downcase.to_sym
    next unless project[name]
    project[name][:filecount] = $1
  else
    raise l
  end
end


all = {}

# In r format
puts "\ttotal_files\tdup_files\tcode_lines\ttest_lines\tcontributors\tcoverage_percent"
project.keys.each do |k|
  next unless project[k][:knowndups] 
  next unless project[k][:code] 
  next unless project[k][:test] 
  next unless project[k][:contributors] 
  next unless project[k][:coverage] 
  next unless project[k][:total] 
  next if project[k][:total] == 0
  next if project[k][:code] == 0
  puts "%s\t%s\t%s\t%s\t%s\t%s\t%s" % [k, project[k][:filecount], project[k][:knowndups], project[k][:code],  project[k][:test], project[k][:contributors], project[k][:coverage] * 100 / project[k][:total]]
  all[k] = project[k]
end
