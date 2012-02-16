a = [1, 2, 3, 4]
(a.size - 1).times { a <<  Hash[*a.pop(2)] }
# {1 => {2 => {3 => 4}}}
puts a
