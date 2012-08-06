#!/usr/bin/ruby
require 'rubygems'
require 'SVG/Graph/Plot'

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
    raise l
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

project.keys.each do |k|
  next unless project[k][:knowndups] 
  next unless project[k][:code] 
  next unless project[k][:test] 
  next unless project[k][:contributors] 
  next unless project[k][:coverage] 
  next unless project[k][:total] 
  next if project[k][:total] == 0
  next if project[k][:code] == 0
  #puts "%s: dups: %s code: %s test: %s contributors: %s coverage: %s" % [k, project[k][:knowndups], project[k][:code],  project[k][:test], project[k][:contributors], project[k][:coverage] * 100 / project[k][:total]]
  all[k] = project[k]
end



# Data sets are x,y pairs
# Note that multiple data sets can differ in length, and that the
# data in the datasets needn't be in order; they will be ordered
# by the plot along the X-axis.
projection = []

# plot between known dups and cloc:code
all.each do |k, v|
  projection << v[:knowndups]
  projection << v[:contributors]
end

graph = SVG::Graph::Plot.new({
   :height => 500,
   :width => 800,
   :key => true,
   :scale_x_integers => true,
   :scale_y_integerrs => true,
   :show_data_values => false,
   :show_data_points => true
})

graph.add_data({
   :data => projection,
   :title => 'KnownDups(files)/contributors',
})

print graph.burn()
