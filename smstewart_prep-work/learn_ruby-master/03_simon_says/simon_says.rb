def echo(str)
	str
end

def shout(str)
	str.upcase
end

def repeat(str, i = 2)
	((str + " ") * i).rstrip
end

def start_of_word(str, i)
	str[0..(i - 1)]
end

def first_word(str)
	str.split(" ")[0]
end
	
def titleize(str)
  exceptions = %w{a an the and but or for nor of over}
  str.split.each_with_index.map{|x, i| exceptions.include?(x) && i > 0 ? x : x.capitalize }.join(" ")
end
