# scrambled-acrostic-challenge

## Approach

I chose Ruby as a programming language, because I really like how short and readable it allows the code to be.

Finding out if a secret message occurs in the magazine text is realized by keeping hashes of counts of different letters. For the secret message, these include all letters of the message. For the magazine there are two hashes: one for the first letters of all words and one for the last letters of all words.

A secret message is included in a magazine if its letters either all occur as first letters of the magazine words, or as last letters of the magazine words. When a letter occurs multiple times in the secret message, it must occur at least as often in the magazine text. Therefore, the count of each letter in the secret message must be less or equal to the count of that letter (only as first or only as last) in the magazine.

## Usage

- `irb` (run the Ruby interpreter)
- `> require './assignment'`
- `> secret_message?` (returns true)
- `> secret_message? possible_messages: ['qx', 'w']` (returns false)

No external libraries are used.

## Performance
- Reading and writing hashes in Ruby is said to be in O(1) (see e.g. https://www.rubyguides.com/2018/03/time-complexity-for-ruby-developers/).
- We can therefore say that line 15 in `magazine_decoder.rb` (`secret_letter_counts.count(letter) <= magazine_letter_counts.count(letter)`) is in O(1).
- For one secret message of length m, we are looping 2 times (first and last letters) over each letter (O(m)): 2 * O(m) * O(1) = O(m). This is a worst case scenario; if the first letter of the secret message does not occur in the magazine (sufficiently often), the loop is stopped.
- The assignment of `secret_letter_counts` (line 12) consists of several loops over the characters of the secrect message to clean up the string and get an array of letters, which are all in O(m). The initialization of the `LetterCount` also loops over all m letters and performs a hash write (O(1)) in the body of this loop, hence O(m). Therefore, the whole `includes?` method of `MagazineDecoder` is in O(m).
- The initialization of the `MagazineDecoder` consists of sevaral loops over the magazine text, of lenght n, to perform the necessary cleanup and arriving to an array of words, resulting in O(n). We loop over n (or possibly less) words twice to get the first and last letters, again O(n). Both arrays of letters are used to initialize two `LetterCount`s, which we already found to be in O(n) (actually we had O(m), but the length of the letters this time is n). Therefore, the whole initialization is in O(n).
- We have a magazine text of length n, and k secret messages, where the longest message consists of m characters. `secret_message?` first reads the magazine text (O(n)) and secret messages (O(k * m)). We initialize the `MagazineDecoder` in O(n). Finally, we loop over each of the k secret messages and call the `includes?` method in O(m). This results in O(n) + O(k * m) + O(n) + k * O(m) = O(n) + O(k * m).