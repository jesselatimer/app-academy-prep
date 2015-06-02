# Enter the file name without the extension as an argument.

file_name = ARGV[0]

abort("#{file_name}.txt doesn't exist") unless File.exists?("#{file_name}.txt")

# Is this code too hard to read?
File.open("#{file_name}-shuffle.txt", "w") do |f|
  File.readlines("#{file_name}.txt").shuffle.each { |line| f.puts line }
end
