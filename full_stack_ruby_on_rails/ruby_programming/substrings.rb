DICTIONARY = ["It", "should", "return", "a", "hash", "listing", "each", "substring",
"case", "insensitive", "that", "was", "found", "in", "the", "original", "string", "and",
"how", "many", "times"]

def substrings(string, dictionary)
  match_counts = []
  # Eliminate special characters and spaces
  formatted_string = string.downcase.gsub(/[^0-9A-Za-z]/, '')
  # Find any initial matches without count
  matches = dictionary.map { |match| match.downcase if formatted_string.include?(match.downcase)}.compact
  matches.each do |match|
    for i in 0..formatted_string.length - match.length - 1
      if (formatted_string[i, match.length].include?(match)) then
         match_counts.push({
           match: match
         })
      end
    end
  end
  # First, group by the word match.
  # Then, map into an array of the match and the number of matches.
  # Last, convert to a hash.
  match_counts.group_by {|match| match[:match]}.map {|k, v| [k, v.count]}.to_h
end

p substrings("Howdy partner, sit down! How's it going?", DICTIONARY)
