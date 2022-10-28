# scrambled-acrostic-challenge

## Approach

Finding out if a secret message occurs in the magazine text is realized by keeping hashes of counts of different letters. For the secret message, these are all letters of the message. For the magazine there are two hashes: one for first letters of all words and one for the last letters of all words. 

A secret message is included in a magazine if its letters either all occur as first letters of the magazine words, or as last letters of the magazine words. When a letter occurs multiple times in the secret message, it must occur at least as often in the magazine text. Therefore, the count of the letter in the secret message must be less or equal to the count of the letter (first or last) in the magazine.

## Usage

- `irb` (run the ruby interpreter)
- `> require ./assigment`
- `> secret_message?` (returns true)
- `> secret_message? possible_messages: ['qx']` (returns false)