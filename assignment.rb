def remove_unsupported_chars(text)
  text.gsub(/[^A-Za-z(\n) ]/, '')
end

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

class SecretMessage
  def initialize(text)
    @letter_counts = LetterCount.new remove_unsupported_chars(text).downcase.gsub(' ', '').split('')
  end

  attr_reader :letter_counts
end

class MagazineText
  def initialize(text)
    words = remove_unsupported_chars(text).downcase.split
    @first_letter_counts = LetterCount.new(words.map { |word| word[0] })
    @last_letter_counts = LetterCount.new(words.map { |word| word[-1] })
  end

  def includes?(secret_message)
    [@first_letter_counts, @last_letter_counts].any? do |magazine_letter_counts|
      secret_message.letter_counts.letters.all? do |letter|
        secret_message.letter_counts.count(letter) <= magazine_letter_counts.count(letter)
      end
    end
  end
end