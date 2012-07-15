
$base_slash = 6

def processdup_file(c)
   has=false;
   c.each do |l|
     if l[:file].include?($file)
        has = true
     end
   end
   if has
      c.each do |l|
        puts "#{l[:file]} similarity #{l[:count]}" unless l[:file].include?($file)
      end
   end
end

def get_base(file)
    file.split('/')[$base_slash]
end

def get_file(file)
    file.split('/')[$base_slash..-1].join('/')
end

# dumps only if the base repositories are different.
def processdup_all(c)
   prev_base = nil
   show = false
   c.each do |l|
      base = get_base(l[:file])
      if prev_base && base != prev_base
         show = true
         break
      end
      prev_base = base
   end
   if show
      c.each do |l|
        puts "#{get_file(l[:file])} similarity #{l[:count]}"
      end
      puts ""
   end
end


def processdup(c)
   if $all
     processdup_all(c)
   else
     processdup_file(c)
   end
end



