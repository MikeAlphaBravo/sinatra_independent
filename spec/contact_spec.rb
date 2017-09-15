require('rspec')
require('contact')
require('pry')

describe("Contact") do
  before() do
    Contact.clear()
  end

  describe(".all") do
    it("is empty at first") do
      expect(Contact.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("saves an contact to the list of items") do
      contact = Contact.new("Keegan", "Ruebling", "job_title", "company", "type", "phone_number", "street_address", "city", "state", "zip")
      contact.save()
      expect(Contact.all()).to(eq([contact]))
    end
  end

  describe(".clear") do
    it("clears all items from the list") do
      contact = Contact.new("Keegan", "Ruebling", "job_title", "company", "type", "phone_number", "street_address", "city", "state", "zip")
      contact.save()
      Contact.clear()
      expect(Contact.all()).to(eq([]))
    end
  end

  describe(".delete") do
    it("locates the contact by its id index and sets the first and last name variables equal to empty strings") do
      contact = Contact.new("Keegan", "Ruebling", "job_title", "company", "type", "phone_number", "street_address", "city", "state", "zip")
      contact.save()
      Contact.delete(contact.id)
      expect(Contact.all[0].first_name()).to(eq(""))
    end
  end

  describe("#attr_accessor") do
      it("reads the instance variable") do
        contact = Contact.new("Keegan", "Ruebling", "job_title", "company", "type", "phone_number", "street_address", "city", "state", "zip")
        expect(contact.first_name()).to(eq("Keegan"))
      end
    end

  describe("#attr_accessor") do
    it("writes the instance variable") do
      contact = Contact.new("Keegan", "Ruebling", "job_title", "company", "type", "phone_number", "street_address", "city", "state", "zip")
      contact.first_name = "Michael"
      expect(contact.first_name).to(eq("Michael"))
    end
  end

  describe("#id") do
    it("increments an id by 1 each time a new contact is added") do
      contact = Contact.new("Keegan", "Ruebling", "job_title", "company", "type", "phone_number", "street_address", "city", "state", "zip")
      contact.save()
      contact2 = Contact.new("Michael", "Brooks", "job_title", "company", "type", "phone_number", "street_address", "city", "state", "zip")
      contact2.save()
      expect(contact.id()).to(eq(1))
      expect(contact2.id()).to(eq(2))
    end
  end

  describe("#sort") do
    it("sorting the contact objects by their last_name variables") do
      contact1 = Contact.new("Keegan", "Ruebling", "job_title", "company", "type", "phone_number", "street_address", "city", "state", "zip")
      contact1.save()
      contact2 = Contact.new("Michael", "Brooks", "job_title", "company", "type", "phone_number", "street_address", "city", "state", "zip")
      contact2.save()
      Contact.sort()
      expect(Contact.all()).to(eq([contact2, contact1]))
    end
  end

  describe(".find") do
    it("finds an contact based on its id") do
      contact = Contact.new("Keegan", "Ruebling", "job_title", "company", "type", "phone_number", "street_address", "city", "state", "zip")
      contact.save()
      contact2 = Contact.new("Michael", "Brooks", "job_title", "company", "type", "phone_number", "street_address", "city", "state", "zip")
      contact2.save()
      expect(Contact.find(1)).to(eq(contact))
      expect(Contact.find(2)).to(eq(contact2))
    end
  end
end
