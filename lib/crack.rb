require_relative 'cracker'

unless ARGV.length == 3 || ARGV.length == 2
	puts "Not the right number of arguments."
  puts "Usage: ruby #{__FILE__} encrypted.txt cracked.txt <ddmmyy>\n"
  exit
end

def read_file(file_name)
  file = File.open(file_name, "r")
  data = file.read.strip
  puts "inside read_file: data = #{data}"
  file.close
  return data
end

def crack_file(file_name,data,date)
	puts "inside crack_file: data = #{data}"
	cracker = Crack.new(data,date)
	plaintext = cracker.crackle
	File.write(file_name, plaintext)
	puts "Created #{file_name} with the key #{cracker.cracked_key} and date #{cracker.date}"
end

encrypted_file = ARGV[0]
data = read_file(encrypted_file)

cracked_file = ARGV[1]
date = ARGV[2]
puts "date = #{date}"
date ||= Time.now
crack_file(cracked_file, data, date)