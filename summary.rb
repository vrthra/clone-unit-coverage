
data = {}

toggle = true
File.open('rdata/cloc.txt').readlines.each do |l|
  if toggle 
    toggle = false; next
  end
  case l
  when /(.*)\t(.+)\t(.+)/
    data[$1] ||= {}
    data[$1].merge!( {:cloc_total => $2, :cloc_test => $3 })
  end
end

toggle = true
File.open('rdata/contributor_count.txt').readlines.each do |l|
  if toggle
    toggle = false; next
  end
  case l
  when /(.*)\t(.+)/
    data[$1] ||= {}
    data[$1].merge!( {:contrib_count => $2})
  else
    raise l
  end
end

toggle = true
File.open('rdata/coverage.txt').readlines.each do |l|
  if toggle 
    toggle = false; next
  end
  case l
  when /(.*)\t(.+)/
    data[$1] ||= {}
    data[$1].merge!( {:coverage_p => $2})
  else
    raise l
  end
end

toggle = true
File.open('rdata/filecount.txt').readlines.each do |l|
  if toggle 
    toggle = false; next
  end
  case l
  when /(.*)\t(.+)/
    data[$1] ||= {}
    data[$1].merge!( {:total_files => $2})
  else
    raise l
  end
end

toggle = true
File.open('rdata/similarity.txt').readlines.each do |l|
  if toggle 
    toggle = false; next
  end
  case l
  when /(.*)\t(.+)/
    data[$1] ||= {}
    data[$1].merge!( {:dup_files => $2})
  else
    raise l
  end
end

toggle = true
File.open('rdata/test_files.txt').readlines.each do |l|
  if toggle 
    toggle = false; next
  end
  case l
  when /(.*)\t(.+)/
    data[$1] ||= {}
    data[$1].merge!( {:test_files => $2})
  else
    raise l
  end
end
toggle = true

puts "\tcloc_test\tcloc_total\tcontrib_count\tcoverage_p\tdup_files\ttest_files\ttotal_files"
data.keys.sort.each do |k|
  d = data[k]
  puts ("%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s" % [k,
    d[:cloc_test] || '-',
    d[:cloc_total] || '-',
    d[:contrib_count]|| '-',
    d[:coverage_p]|| '-',
    d[:dup_files]|| '-',
    d[:test_files]|| '-',
    d[:total_files]|| '-',
  ])
end
