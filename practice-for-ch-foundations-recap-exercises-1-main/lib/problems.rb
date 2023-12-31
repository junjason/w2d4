# Write a method, all_vowel_pairs, that takes in an array of words and returns
# all pairs of words that contain every vowel. Vowels are the letters a, e, i,
# o, u. A pair should have its two words in the same order as the original
# array. 
#
# Example:
#
# all_vowel_pairs(["goat", "action", "tear", "impromptu", "tired", "europe"]) # => ["action europe", "tear impromptu"]

def is_vowel_pair(word_1, word_2)
  pair = word_1+word_2
  has_a = false
  has_e = false
  has_i = false
  has_o = false
  has_u = false
  pair.each_char do |ch|
    has_a = true if 'a' == ch
    has_e = true if 'e' == ch
    has_i = true if 'i' == ch
    has_o = true if 'o' == ch
    has_u = true if 'u' == ch
  end
  return true if (has_a && has_e && has_i && has_o && has_u)
  false
end

def all_vowel_pairs(words)
    pairs = []
    (0...words.length).each do |i|
      (i+1...words.length).each do |j|
        if is_vowel_pair(words[i], words[j])
          pairs << (words[i] + " " + words[j])
        end
      end
    end
    pairs
end


# Write a method, composite?, that takes in a number and returns a boolean
# indicating if the number has factors besides 1 and itself
#
# Example:
#
# composite?(9)     # => true composite?(13)    # => false
def composite?(num)
  (2...num).each do |f|
    return true if num%f == 0
  end
  false
end


# A bigram is a string containing two letters.
# Write a method, find_bigrams, that takes in a string and an array of bigrams.
# The method should return an array containing all bigrams found in the string.
# The found bigrams should be returned in the order of their appearance in the
# original array.
#
# Examples:
#
# find_bigrams("the theater is empty", ["cy", "em", "ty", "ea", "oo"])  # => ["em", "ty", "ea"]
# find_bigrams("to the moon and back", ["ck", "oo", "ha", "at"])        # => ["ck", "oo"]
def find_bigrams(str, bigrams)
  words = str.split(" ")
  matching = []
  bigrams.each do |bigram|
    words.each do |word|
      (0...word.length-1).each do |i|
        substr = word[i..i+1]
        if substr == bigram
          matching << bigram
        end
      end
    end
  end
  matching
end


# Write a method, Hash#my_select, that takes in an optional proc argument
# The method should return a new hash containing the key-value pairs that return
# true when passed into the proc.
# If no proc is given, then return a new hash containing the pairs where the key
# is equal to the value.
#
# Examples:
#
# hash_1 = {x: 7, y: 1, z: 8}
# hash_1.my_select { |k, v| v.odd? }          # => {x: 7, y: 1}
#
# hash_2 = {4=>4, 10=>11, 12=>3, 5=>6, 7=>8}
# hash_2.my_select { |k, v| k + 1 == v }      # => {10=>11, 5=>6, 7=>8})
# hash_2.my_select                            # => {4=>4}
class Hash
  def my_select(&prc)
    prc ||= Proc.new {|k, v| k == v}
    hash = {}
    self.each do |k, v|
      if prc.call(k, v)
        hash[k] = v
      end
    end
    hash
  end
end


# Write a method, String#substrings, that takes in a optional length argument
# The method should return an array of the substrings that have the given length.
# If no length is given, return all substrings.
#
# Examples:
#
# "cats".substrings     # => ["c", "ca", "cat", "cats", "a", "at", "ats", "t", "ts", "s"]
# "cats".substrings(2)  # => ["ca", "at", "ts"]
class String
  def substrings(length = nil)
    substr = []
    (0...self.length).each do |i|
      (i...self.length).each do |j|
        substr << self[i..j]
      end
    end

    return substr if !length
    filter = []
    substr.each do |ss|
      if ss.length == length
        filter << ss
      end
    end
    filter
  end
end


# Write a method, String#caesar_cipher, that takes in an a number.
# The method should return a new string where each char of the original string
# is shifted the given number of times in the alphabet.
#
# Examples:
#
# "apple".caesar_cipher(1)    #=> "bqqmf"
# "bootcamp".caesar_cipher(2) #=> "dqqvecor"
# "zebra".caesar_cipher(4)    #=> "difve"
class String
  def caesar_cipher(num)
    letters = "abcdefghijklmnopqrstuvwxyz"
    cc = ""
    self.each_char do |ch|
      org_idx = letters.index(ch)
      new_idx = (org_idx+num)%26
      cc += letters[new_idx]
    end
    cc
  end
end