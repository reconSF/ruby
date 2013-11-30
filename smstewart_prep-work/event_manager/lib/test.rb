require 'csv'
require 'sunlight/congress'
require 'erb'

Sunlight::Congress.api_key = "e179a6973728c4dd3fb1204283aaccb5"

def clean_zipcode(zipcode)
    zipcode.to_s.rjust(5,"0")[0..4]
end

# def legislators_by_zipcode(zipcode)
#     Sunlight::Congress::Legislator.by_zipcode(zipcode)
# end

# def save_thank_you_letter(id, form_letter)
# 	Dir.mkdir("output") unless Dir.exists?("output")
	
# 	filename = "output/thanks_#{id}.html"
	
# 	File.open(filename, 'w') { |file|
# 		file.puts form_letter
# 	}
# end

def clean_phone_numbers(num)
  # This strips all non-digits (\D), skips an optional leading one (^1?)
  # then extracts the first remaining 10 digits in chunks ((\d{3})(\d{3})(\d{4})) and formats.
	if num.gsub(/\D/, "").match(/^1?(\d{3})(\d{3})(\d{4})/)
		[$1, $2, $3].join("").to_s.ljust(10, "0")[0..9]
	else
		"0000000000"
	end
end

def hour_targeting(datetimes)
	datetimes.group_by { |t| DateTime.strptime(t, '%m/%d/%Y %H:%M').hour }.sort.map{ |k,v| Hash[ k, v.length ] }
end

def week_targeting(datetimes)
	datetimes.group_by { |t| DateTime.strptime(t, '%m/%d/%Y %H:%M').wday }.sort.map{ |k,v| Hash[ k, v.length ] }
end


puts "EventManager initialized..." 
puts
contents = CSV.open 'full_event_attendees.csv', headers: true, header_converters: :symbol

# template_letter = File.read "form_letter.erb"
# erb_template = ERB.new template_letter
datetimes = []

contents.each { |row|
    id = row[0]
    name = row[:first_name]
    zipcode = clean_zipcode(row[:zipcode])
    phone = clean_phone_numbers(row[:homephone])
    
    datetimes << row[:regdate]
    #puts "#{name} | Phone: #{phone} | Zip: #{zipcode}"
    
    # legislators = legislators_by_zipcode(zipcode)
    # form_letter = erb_template.result(binding)
    # save_thank_you_letter(id, form_letter)
}

puts "Hourly Registration: {'hour' => 'registrations'}"
puts
puts hour_targeting(datetimes).inspect 

puts "--------------------------------"
print "Weekly Registration: {'day' => 'registrations'}"
puts
puts week_targeting(datetimes).inspect
puts "--------------------------------"
# if the zip code is exactly five digits, assume that it is ok
# if the zip code is more than 5 digits, truncate it to the first 5 digits
# if the zip code is less than 5 digits, add zeros to the front until it becomes five digits

# If the phone number is less than 10 digits assume that it is a bad number
# If the phone number is 10 digits assume that it is good
# If the phone number is 11 digits and the first number is 1, trim the 1 and use the first 10 digits
# If the phone number is 11 digits and the first number is not 1, then it is a bad number
# If the phone number is more than 11 digits assume that it is a bad number
