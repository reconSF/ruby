# You have 100 cats (You are quite lucky to own so many cats!).
# You have arranged all your cats in a line. Initially, none of your
# cats have any hats. You take 100 rounds walking around the cats,
# always starting with the first cat. Every time you stop at a cat,
# you put a hat on it if it doesn't have one, and you take itshat off if it has one on.

# The first round, you stop at every cat. The second round, you only
# stop at every 2nd cat (#2, #4, #6, #8, etc.). The third round, you
# only stop at every 3rd cat (#3, #6, #9, #12, etc.). You continue this
# process until the 100th round (i.e. you only visit the 100th cat).

# Write a program that prints which cats have hats at the end.

def cats_in_hats()
    cats = Hash.new(100)
    100.times { |i| cats[i] = "none"  }



    100.times { |x|
        i = 0
        while i < cats.length
            if cats[i + x] == "none"
                cats[i + x] = "hat"
            elsif cats[i + x] == "hat"
                cats[i + x] = "none"
            end
            i += 1
        end
    }

    cats.select { |k,v| v == "hat" }
end

cats_in_hats()