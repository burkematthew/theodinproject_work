def caesar_ciper(string, shift)
  new_string = string.split(//).map do |char|
    # Is the designated character lower-case?
    if (char.ord.between?("a".ord, "z".ord)) then char.shift_character("a", "z", char, shift)
    # Is the designated character upper-case?
    elsif (char.ord.between?("A".ord, "Z".ord)) then char.shift_character("A", "Z", char, shift)
    # If neither upper nor lower case, then simply return the character.
    else char
    end
  end
  new_string.join("")
end

public

def shift_character(start, ending, character, shift)
# Public method to accept a character range, a base character, and a shift value 
#   and returns the shifted character.
  if ((character.ord + shift).chr.between?(start, ending)) then
    (character.ord + shift).chr
  else
    ((character.ord + shift).remainder(ending.ord) + start.ord - 1).chr
  end
end

p caesar_ciper("Good and you? Not so bad.", 15)
