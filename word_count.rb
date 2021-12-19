# Program that counts the number of occurences of each word within a phrase
#
# Alex Foggia 12/19/2021
#
# General process:
#         1. Take the given phrase and remove any extra punctuation,
#            convert it to lower case, and translate it into an array to iterate on
#         2. Check each word, if this word already has an entry in the hash then we 
#            just increment its count. Otherwise, we create a new entry within the hash
#         3. Return the hash to see each word and its count
#

class Phrase
    
    def initialize(phrase)
        # Prep the phrase to count the words,
        # in this case we convert the phrase into
        # an array of strings that we can cycle through
        #
        @phrase = phrase.gsub(/[^A-Za-z0-9\s']/," ").downcase.split
        
        # We need to initialize a hash to hold our
        # {word,count} pairs
        #
        @word_hash = Hash.new { |hash,key| hash[key] = "Whoops, this key doesn't exist"}
    end
    
    def word_count
        # Iterate through each word in the phrase
        @phrase.each { |word|
            # Strip off any leading/trailing apostrophes if necessary
            # NOTE: delete_prefix() and delete_suffix() can be used here in this way:
            #       word = word.delete_prefix("'").delete_suffix("'")
            #       However, those methods are only valid for Ruby 2.5 and later so I opted to keep the approach
            #       below so the code is backwards compatible 
            #
            word = word.start_with?("'") ? word[1..(word.length-1)].chomp("'") : word.chomp("'")
            # Check if there is already a hash entry for this word and if there
            # is increment its count. Otherwise, make a new entry for it and 
            # initialize it to 1
            #
            @word_hash[word] = !@word_hash.key?(word) ? 1 : @word_hash[word] += 1
        }
        return @word_hash
    end
end
