#!/usr/local/bin/ruby

##
# @file      arrayBasics.rb
# @author    Mitch Richling <http://www.mitchr.me/>
# @Copyright Copyright 2006 by Mitch Richling.  All rights reserved.
# @brief     Simple array examples.@EOL
# @Keywords  ruby example array
# @Std       Ruby 1.8
#
#            Also see arrayTraverse.rb, arrayAssoc.rb, enumBasics.rb,
#            and strings.rb for more examples.

puts("CONSTRUCTION")
a = [ 1, 2.3, 'hello', 4, 5.6, nil, 7, 'world', TRUE, 'BAR' ]  # They can hold any data type
b = %w{ a bc def }                                             # SAME AS: = ['a', 'bc', 'def']
c = Array.new(10, 'hello')                                     # Set an initial value for elements
d = Array::new                                                 # Empty array (Can also just say [])
puts("  a=#{a.inspect}")
puts("  b=#{b.inspect}")
puts("  c=#{c.inspect}")
puts("  d=#{d.inspect}")

puts("INITIAL VALUE OBJECT")
e = Array.new(10, Array.new())
puts("  e=#{e.inspect}")
e[0].push('hello')
puts("  After push: #{e.inspect}")

# Indexing is rich. NOTE: foo[...] is the same as foo.slice(...)
# Also note foo.at(n) is a tiny bit faster than foo[n]
puts("INDEXING")
puts("  a[1]      = #{a[1].inspect             }")   # zero based indexes!
puts("  a[1..2]   = #{a[1..2].inspect          }")   # Range object
puts("  a[1,3]    = #{a[1,3].inspect           }")   # Start at 1, give me three
puts("  a[-1]     = #{a[-1].inspect            }")   # Last element
puts("  a[-3..-1] = #{a[-3..-1].inspect        }")   # third to last to last
puts("  a[10]     = #{a[10].inspect            }")   # nil if out of range

puts("SUPER INDEXING")
puts("  a.values_at(1)       = #{a.values_at(1).inspect        }")
puts("  a.values_at(1,3,5)   = #{a.values_at(1,3,5).inspect    }")
puts("  a.values_at(1..3, 5) = #{a.values_at(1..3, 5).inspect  }")

puts("NAMED BITS")
puts("  a.first    = #{a.first.inspect                        }")
puts("  a.first(3) = #{a.first(3).inspect                     }")
puts("  a.last     = #{a.last.inspect                         }")
puts("  a.last(3)  = #{a.last(3).inspect                      }")
puts("  a.values_at(1..3, 5) = #{a.values_at(1..3, 5).inspect }")

puts("INDEXING WITH OUT OF BOUND VALUE")
puts("  a[10]                   = #{a[10].inspect                    }")
puts("  a.fetch(10, 'missing')  = #{a.fetch(10, 'missing').inspect   }")
puts("  a.fetch(10) {|i| -i}    = #{(a.fetch(10) {|i| -i}).inspect   }")

puts("ARRAY META DATA")
puts("  a.length = #{a.length.inspect    }")  # Number of items (same as .size)
puts("  a.empty? = #{a.empty?.inspect    }")  # Is array empty?
#puts("  a.nitems = #{a.items.inspect    }")  # Number of non-nil items

puts("ARRAYS AS QUEUES")
a << 'push1'
a.push('push2')
a += Array.new(1, 'push3')   # Note that + creates a new array!!
puts("  After push:    a=#{a.inspect}")
anEle = a.pop
puts("  After pop:     a=#{a.inspect}")
puts("  popped off:    #{anEle.inspect}")
a.unshift('unshift')
puts("  After unshift: a=#{a.inspect}")
anEle = a.shift
puts("  After shift:   a=#{a.inspect}")
puts("  shifted off:   #{anEle.inspect}")

puts("ARRAY SLICE ASSIGNMENT")
a[1,3] = ['foo', 'bar', 'foobar']        # Swap out a slice
puts("  after assn:   a=#{a.inspect}")
a[1,3] = ['FOO', 'BAR']                  # Note we are replacing with smaller array
puts("  after assn:   a=#{a.inspect}")
a.insert(6, 'insertAtSix')
puts("  after insert: a=#{a.inspect}")

puts("PARALLEL ASSIGNMENT WORKS")
x, y = [1, 2]
puts("  x = #{x.inspect}")
puts("  y = #{y.inspect}")
z=1
x, y, z, w = [1, 2]          # The var z has no value, so gets nil
puts("  x = #{x.inspect}")
puts("  y = #{y.inspect}")
puts("  z = #{z.inspect}")
x, y = [1, 2, 3]             # Throw away extra
puts("  x = #{x.inspect}")
puts("  y = #{y.inspect}")
x, *y = [1, 2, 3]            # Rest put into an array and stored in y
puts("  x = #{x.inspect}")
puts("  y = #{y.inspect}")

puts("LOOKING FOR STUFF (GETTING INDEXES)")
puts("  c.index('hello')  = #{c.index('hello').inspect  }")
puts("  c.rindex('hello') = #{c.rindex('hello').inspect  }")

puts("GETTING RID OF STUFF")
a.compact!
puts("  after compact!:  a=#{a.inspect}")   # Also see: compact
a.uniq!
puts("  after unique!:   a=#{a.inspect}")   # Also see: uniq
a.delete(5.6)
puts("  after delete:    a=#{a.inspect}")
anEle = a.delete_at(4)
puts("  after delete_at: a=#{a.inspect}")
puts("  Thing deleted:   #{anEle}")
a.delete_if { |x| x.class == Fixnum }
puts("  after delete_if: a=#{a.inspect}")  # Also see: reject! & reject
a.slice!(2,2)
puts("  after slice:     a=#{a.inspect}")  # Also see: slice
a.clear
puts("  after clear:     a=#{a.inspect}")

puts("ORDERING")
b.reverse!
puts("  after reverse!: b=#{b.inspect}")    # Also see: reverse
b.sort!
puts("  after sort!:    b=#{b.inspect}")    # Also see: sort

puts("LISPY, MAPPEN GOODNESS")
b.map! { |x| x.to_s + "YUMMY" }
puts("  after map!: b=#{b.inspect}")    # Also see: map, collect, & collect!

puts("EVEN LISPY-IER GOODNESS")
c.fill("world")
puts("  after fill 1: c=#{c.inspect}")
c.fill("!", 6)
puts("  after fill 2: c=#{c.inspect}")
c.fill("hello", 0, 3)
puts("  after fill 3: c=#{c.inspect}")
c.fill(0,2) { |idx| idx }
puts("  after fill 4: c=#{c.inspect}")
c.fill(7..8) { |idx| idx }
puts("  after fill 5: c=#{c.inspect}")
c.fill(8) { |idx| idx }
puts("  after fill 6: c=#{c.inspect}")

# Finally, join is our friend....
c.uniq!.delete_if { |x| x.class == Fixnum }
puts(c.join(' ').inspect)
