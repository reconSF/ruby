# Compute the sum of cubes for a given range a through b.

def sum_of_cubes(a, b)
    total = 0

    (a..b).each { |x|
        total += (x*x)*x
    }

    total
end