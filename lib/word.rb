class Word
  @@list = []
  attr_reader :id
  attr_accessor :input_word, :input_definition

  def initialize(input_word, input_definition)
    @input_word = input_word
    @input_definition = input_definition
    @id = @@list.length + 1
  end

  def self.all()
    @@list
  end

  def self.clear()
    @@list = []
  end

  def self.find(id)
    word_id = id.to_i()
    @@list.each do |word|
      if word.id == word_id
        return word
      end
    end
  end

  def save()
    if @@list.all? do |word|
      self.input_word != "" and self.input_definition != ""
      end
      @@list.push(self)
    end
  end

  def self.delete(id)
    word_id = id.to_i()
    @@list.map do |word|
      if word.id == word_id
        word.input_word = ""
        word.input_definition = ""
      end
    end
  end

  def self.sort()
    @@list.sort_by! {|x| x.input_word}
  end

end

# "word1" => "definition1", "word2" => "definition2"
