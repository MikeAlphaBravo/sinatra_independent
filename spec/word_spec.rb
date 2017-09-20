require('rspec')
require('dictionary')
require('pry')

describe("Word") do
  before() do
    Dictionary.clear()
  end

  describe(".all") do
    it("is empty at first") do
      expect(Dictionary.all()).to(eq({}))
    end
  end

  describe(".add_or_update") do
    it("adds definition to new or existing word") do
      expect(Dictionary.add_or_update("word", "def")).to(eq(["def"]))
    end
  end

  describe(".find") do
    it("finds a word based on its key") do
      Dictionary.add_or_update("anything", "def")
      expect(Dictionary.find("anything")).to(eq(["def"]))
    end
  end
end
