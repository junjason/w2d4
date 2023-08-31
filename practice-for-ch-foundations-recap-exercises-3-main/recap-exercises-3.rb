# Write a method no_dupes?(arr) that accepts an array as an arg and returns a 
# new array containing the elements that were not repeated in the array.

def no_dupes?(arr)
    hash = Hash.new(0)
    arr.each do |el|
        hash[el] += 1
    end

    no_d = []
    hash.each do |k,v|
        if v == 1
            no_d << k
        end
    end
    no_d
end

# # Examples
# p no_dupes?([1, 1, 2, 1, 3, 2, 4])         # => [3, 4]
# p no_dupes?(['x', 'x', 'y', 'z', 'z'])     # => ['y']
# p no_dupes?([true, true, true])            # => []


# Write a method no_consecutive_repeats?(arr) that accepts an array as an arg. 
# The method should return true if an element never appears consecutively in the array; 
# it should return false otherwise.

def no_consecutive_repeats?(arr)
    (0...arr.length-1).each do |i|
        if arr[i] == arr[i+1]
            return false
        end
    end
    true
end

# # Examples
# p no_consecutive_repeats?(['cat', 'dog', 'mouse', 'dog'])     # => true
# p no_consecutive_repeats?(['cat', 'dog', 'dog', 'mouse'])     # => false
# p no_consecutive_repeats?([10, 42, 3, 7, 10, 3])              # => true
# p no_consecutive_repeats?([10, 42, 3, 3, 10, 3])              # => false
# p no_consecutive_repeats?(['x'])                              # => true

# Write a method char_indices(str) that takes in a string as an arg. The method 
# should return a hash containing characters as keys. The value associated with each 
# key should be an array containing the indices where that character is found.

def char_indices(str)
    hash = Hash.new {|h,k| h[k] = []}
    str.each_char.with_index do |ch, i|
        hash[ch] << i
    end
    hash
end

# Examples
# p char_indices('mississippi')   # => {"m"=>[0], "i"=>[1, 4, 7, 10], "s"=>[2, 3, 5, 6], "p"=>[8, 9]}
# p char_indices('classroom')     # => {"c"=>[0], "l"=>[1], "a"=>[2], "s"=>[3, 4], "r"=>[5], "o"=>[6, 7], "m"=>[8]}

# Write a method longest_streak(str) that accepts a string as an arg. The method should 
# return the longest streak of consecutive characters in the string. If there are any ties, 
# return the streak that occurs later in the string.

def longest_streak(str)
    l_s = ""
    count = 0
    
    i = 0
    while i < str.length-1
        if 
        i += 1
    end
    l_s
end

longest_streak('a')           # => 'a'
longest_streak('accccbbb')    # => 'cccc'
longest_streak('aaaxyyyyyzz') # => 'yyyyy
longest_streak('aaabbb')      # => 'bbb'
longest_streak('abc')         # => 'c'


