require('rspec')
require('dictionary')
require('pry')

describe("Word") do
  before() do
    Dictionary.clear()
  end

  describe(".all") do
    it("is empty at first") do
      expect(Dictionary.all()).to(eq([]))
    end
  end

  # describe(".add_or_update") do
  #   it("adds definition to existing word") do
  #     expect(Dictionary.add_or_update("word","new definition")).to(eq("[new definition]"))
  #   end
  # end

  # describe(".find") do
  #   it("finds an word based on its key") do
  #     word = Dictionary.new("word1")
  #     expect(Dictionary.find("word1")).to(eq([word1]))
  #   end
  # end

  # describe('.sort') do
  #   it('sorts words in Hash') do
  #     expect(Dictionary.sort).to(eq(Dictionary.sort))
  #   end
  # end

end
