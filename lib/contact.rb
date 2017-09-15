class Contact
  @@list = []
  attr_reader :id
  attr_accessor :first_name, :last_name, :job_title, :company, :type, :phone_number, :street_address, :city, :state, :zip

  def initialize(first_name, last_name, job_title, company, type, phone_number, street_address, city, state, zip)
    @first_name = first_name
    @last_name = last_name
    @job_title = job_title
    @company = company
    @type = type
    @phone_number = phone_number
    @street_address = street_address
    @city = city
    @state = state
    @zip = zip
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

  def self.delete(id)
    contact_id = id.to_i()
    @@list.map do |contact|
      if contact.id == contact_id
        contact.first_name = ""
        contact.last_name = ""
      end
    end
  end

  def self.sort()
    @@list.sort_by! {|x| x.last_name}
  end

end
