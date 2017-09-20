class Dictionary
  @@list = Hash.new
  attr_accessor :word, :definition

  def initialize(word, definition)
    @word = word
    @definition = definition
  end

  def self.add_or_update(word, definition)
    if @@list.key?(word)
      @@list[word].push(definition)
    else
      @@list[word] = [definition]
    end
  end

  def self.clear()
    @@list = {}
  end

  def self.all()
    @@list
  end

  def self.find(word)
    @@list[word]
  end
end
