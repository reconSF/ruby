require 'csv'
require 'sunlight/congress'
require 'erb'

puts
puts "-------------------------"
puts "EventManager initialized."

## Gonna need these vars!
Sunlight::Congress.api_key = "e179a6973728c4dd3fb1204283aaccb5"
datetimes = []
lettercount = 0
contents = CSV.open 'event_attendees.csv', headers: true, header_converters: :symbol
template_letter = File.read "form_letter.erb"
erb_template = ERB.new template_letter
sendMail = false

## Output hourly/weekly registration data to console
def registration_counts(datetimes)
	puts
	puts	
	puts "			REGISTRATION COUNTS"
	puts "----------------------------------------------------------------"
	puts "Hourly: {'hour' => 'registrations'}"
	puts hour_targeting(datetimes).inspect 
	puts
	puts
	print "Weekly: {'day' => 'registrations'}"
	puts
	puts week_targeting(datetimes).inspect
	puts "----------------------------------------------------------------"
end

## Format zip codes, return '00000' for bad zips
def clean_zipcode(zipcode)
    zipcode.to_s.rjust(5,"0")[0..4]
end

## Query API for legislators for given zipcode
def legislators_by_zipcode(zipcode)
    Sunlight::Congress::Legislator.by_zipcode(zipcode)
end

## Generate and save thank you letters for each person in /output
def save_thank_you_letter(id, form_letter)
	Dir.mkdir("output") unless Dir.exists?("output")
	
	filename = "output/thanks_#{id}.html"
	puts
	print "Creating #{filename} for "
	
	File.open(filename, 'w') { |file|
		file.puts form_letter
	}
end

## Strip '()-.' characters from phone numbers, return formated number or '0000000000' for bad phone numbers
def clean_phone_numbers(num)
	if num.gsub(/\D/, "").match(/^1?(\d{3})(\d{3})(\d{4})/) then [$1, $2, $3].join("").to_s.ljust(10, "0")[0..9] else "0000000000" end
end

## Create datetime objects and return a sorted hash using the hours as keys
def hour_targeting(datetimes)
	datetimes.group_by { |t| DateTime.strptime(t, '%m/%d/%Y %H:%M').hour }.sort.map{ |k,v| Hash[ k, v.length ] }
end

## Create datetime objects and return to a sorted hash using weekdays as keys
def week_targeting(datetimes)
	datetimes.group_by { |t| DateTime.strptime(t, '%m/%d/%Y %H:%M').wday }.sort.map{ |k,v| Hash[ k, v.length ] }
end

## Prompt user for input
puts "-------------------------"
puts "Would you like to generate thank you letters? (No to print info only)"
puts
puts "1 - Yes"
puts "2 - No"
puts
print "Enter option: "
input = gets.chomp
sendMail = true if input == "1"


## Process CSV, perform necessary operations
contents.each { |row|
	id = row[0]
	name = row[:first_name]
	zipcode = clean_zipcode(row[:zipcode])
	phone = clean_phone_numbers(row[:homephone])  
	datetimes << row[:regdate]

	legislators = legislators_by_zipcode(zipcode)
	if sendMail
		form_letter = erb_template.result(binding)
		save_thank_you_letter(id, form_letter)
		puts "#{name}..."
		lettercount += 1
	else
		puts
		puts "#{name} | Phone: #{phone} | Zip: #{zipcode} | Legislators: #{legislators}"	
	end
}

## Output Registration and Letter Generation Data
puts
puts "Generated #{lettercount} letters in 'output' folder" if sendMail
registration_counts(datetimes)
