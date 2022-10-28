# Count how often a letter occurs in the given sequence of letters.
class LetterCount
  def initialize(letters)
    @counts = {}
    letters.each do |letter|
      @counts[letter] = count(letter) + 1
    end
  end

  def count(letter)
    @counts[letter] || 0
  end

  def letters
    @counts.keys
  end
end
