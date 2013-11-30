
# The time limit is 15 minutes
# We don't care about the efficiency of your solution
# Please ask me questions instead of looking it up or running code on
# your machine
# Please tell me your plan of attack after you've had a chance to read
# the question and think about it for a while


# Write a method that takes an array of stock prices (prices on days
# 0, 1, ...), and outputs the most profitable pair of days on which to
# first buy the stock and then sell the stock,
# e.g.: stock_picker( [ 44, 30, 24, 32, 35, 30, 40, 38 ] ) == [ 2, 6 ]

def stock_picker(stocks)
    cash_in_dates = []

    profit = 0
    stocks.each_with_index { |bVal, bIdx|
        stocks[bIdx..-1].each_with_index { |sVal, sIdx|
            puts "Profit: #{profit}"
            x = sVal - bVal

            if x > profit
                puts "profit #{sVal} - #{bVal} = #{x}"
                profit = x
                cash_in_dates = [bIdx+1,sIdx+1]
            end
        }
    }

    cash_in_dates
end

stock_picker([44, 30, 24, 32, 35, 30, 40, 38])