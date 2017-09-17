class Dictionary
  @@list = Hash.new
  attr_accessor :word, :definition

  def initialize(word, definition)
    @word = word
    @definition = definition
  end

# in find and save
# a method

  def self.add_or_update(word, definition)
    if @@list.key?(word)
      @@list[word].push(definition)
    else
      @@list[word] = [definition]
    end
  end


  def self.all()
    @@list
  end

  def self.find(word)
    @@list[word]
  end

  def self.delete(word)
    @@list.delete(word)
  end

  # def self.sort()
  #   @@list.sort_by! {|x| x.input_word}
  # end

end
