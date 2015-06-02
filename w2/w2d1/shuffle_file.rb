# Enter the file name without the extension as an argument.

file_name = ARGV[0]

abort("#{file_name}.txt doesn't exist") unless File.exists?("#{file_name}.txt")

lines = File.readlines("#{file_name}.txt")

File.open("#{file_name}-shuffle.txt", "w") do |f|
  lines.shuffle.each { |line| f.puts line }
end
