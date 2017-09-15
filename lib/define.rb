class Define
  @@define = []
  attr_accessor(:define)

  def initialize (define)
    @define = define
  end

  def self.all
    @@define
  end

  def self.clear
    @@define = []
  end

  def save
    @@define.push(self)
  end

end
