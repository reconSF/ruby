# Given a 3 or 4 digit number with distinct digits,
# return a sorted array of all the unique numbers than
# can be formed with those digits.

def number_shuffle(number)
    no_of_combinations = number.to_s.size == 3 ? 6 : 24
    digits = number.to_s.split(//)
    combinations = []
    combinations << digits.shuffle.join.to_i while combinations.uniq.size!=no_of_combinations
    combinations.uniq.sort
end

# number_shuffle(1024)
#=> [124, 142, 214, 241, 412, 421, 1024, 1042, 1204, 1240, 1402, 1420, 2014,
# 2041, 2104, 2140, 2401, 2410, 4012, 4021, 4102, 4120, 4201, 4210]