require './magazine_decoder'

def secret_message?(file: 'lorem-ipsum.txt', possible_messages: nil)
  magazine = MagazineDecoder.new File.read(file)
  possible_messages ||= File.readlines 'secret_messages.txt', chomp: true

  possible_messages.any? do |message|
    magazine.includes? message
  end
end
