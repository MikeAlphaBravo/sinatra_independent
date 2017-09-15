class Word
  @@list = ["word1" => "definition1", "word2" => "definition2"]
  attr_reader :word, :definition, :id
  attr_accessor :input_word, :input_definition

  def initialize(word, definition, input_word, input_definition)
    @word = word
    @definition = definition
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
    contact_id = id.to_i()
    @@list.each do |contact|
      if contact.id == contact_id
        return contact
      end
    end
  end

  def save()
    if @@list.all? do |contact|
      self.first_name != "" and self.last_name != ""
      end
      @@list.push(self)
    end
  end

end
