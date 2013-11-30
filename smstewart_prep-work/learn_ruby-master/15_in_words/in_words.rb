module In_Words

    def in_words
        result = ""
        remain = self
        small_nums = ["", "one ", "two ", "three ", "four ", "five ", "six ", "seven ", "eight ", "nine ", "ten ", "eleven ", "twelve ", "thirteen ", "fourteen ", "fifteen ", "sixteen ", "seventeen ", "eighteen ", "nineteen "]
        med_nums = ["", "", "twenty ", "thirty ", "forty ", "fifty ", "sixty ", "seventy ", "eighty ", "ninety "]
        large_nums = ["", "thousand ", "million ", "billion ", "trillion ", "quadrillion ", "quintillion "]        

        if self == 0
            result << "zero"
        end

        i = 0
        while remain > 0 
            current = remain.divmod(1000).pop
            remain = remain.divmod(1000).shift
            str = ""

            if current >= 100
                hundreds = current.divmod(100).shift
                str << small_nums[hundreds]
                str << "hundred "
            end

            tens = current.divmod(100).pop

            if tens < 20
                str << small_nums[tens]
            else
                str << med_nums[tens.divmod(10).shift]
                str << small_nums[tens.divmod(10).pop]
            end

            if current > 0
                str << large_nums[i]
            end
            
            i += 1

            result = str + result
        end

        result.rstrip
    end
end 

class Fixnum
    include In_Words
end