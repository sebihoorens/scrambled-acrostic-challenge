require './letter_count'

# Find out if a secret message is included in a given text.
class MagazineDecoder
  def initialize(text)
    words = remove_unsupported_chars(text).downcase.split
    @first_letter_counts = LetterCount.new(words.map { |word| word[0] })
    @last_letter_counts = LetterCount.new(words.map { |word| word[-1] })
  end

  def includes?(secret_message)
    secret_letter_counts = LetterCount.new remove_unsupported_chars(secret_message).downcase.gsub(' ', '').split('')
    [@first_letter_counts, @last_letter_counts].any? do |magazine_letter_counts|
      secret_letter_counts.letters.all? do |letter|
        secret_letter_counts.count(letter) <= magazine_letter_counts.count(letter)
      end
    end
  end

  private

  # Only preserve letters, spaces and new lines.
  def remove_unsupported_chars(text)
    text.gsub(/[^A-Za-z(\n) ]/, '')
  end
end
