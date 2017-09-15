require('rspec')
require('word')
require('pry')

describe("Word") do
  before() do
    Word.clear()
  end

  describe(".all") do
    it("is empty at first") do
      expect(Word.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("saves a word to the list of items") do
      word = Word.new("Word1", "Definition1")
      word.save()
      expect(Word.all()).to(eq([word]))
    end
  end

  describe(".clear") do
    it("clears all items from the list") do
      word = Word.new("Word1", "Definition1")
      word.save()
      Word.clear()
      expect(Word.all()).to(eq([]))
    end
  end

  describe(".delete") do
    it("locates the word by its id index and sets the input_word and input_definition variables equal to empty strings") do
      word = Word.new("Word1", "Definition1")
      word.save()
      Word.delete(word.id)
      expect(Word.all[0].input_word()).to(eq(""))
    end
  end

  describe("#attr_accessor") do
    it("reads the instance variable") do
      word = Word.new("Word3", "Definition3")
      expect(word.input_word()).to(eq("Word3"))
    end
  end

  describe("#attr_accessor") do
    it("writes the instance variable") do
      word = Word.new("Word3", "Definition3")
      word.input_word = "Word4"
      expect(word.input_word).to(eq("Word4"))
    end
  end

  describe("#id") do
    it("increments an id by 1 each time a new word is added") do
      word = Word.new("Word1", "Definition1")
      word.save()
      word2 = Word.new("Word2", "Definition2")
      word2.save()
      expect(word.id()).to(eq(1))
      expect(word2.id()).to(eq(2))
    end
  end


#   describe("#sort") do
#   it("sorting the contact objects by their last_name variables") do
#     contact1 = Contact.new("Keegan", "Ruebling", "job_title", "company", "type", "phone_number", "street_address", "city", "state", "zip")
#     contact1.save()
#     contact2 = Contact.new("Michael", "Brooks", "job_title", "company", "type", "phone_number", "street_address", "city", "state", "zip")
#     contact2.save()
#     Contact.sort()
#     expect(Contact.all()).to(eq([contact2, contact1]))
#   end
# end
#

  # describe(".find") do
  #   it("finds an word based on its id") do
  #     word = Word.new("Word1", "Definition1")
  #     word.save()
  #     word2 = Word.new("Word2", "Definition2")
  #     word2.save()
  #     expect(Word.find(1)).to(eq(word))
  #     expect(Word.find(2)).to(eq(word2))
  #   end
  # end
end
