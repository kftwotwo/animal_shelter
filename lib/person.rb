class Person
  attr_reader(:name, :phone)

  def initialize(attributes)
    @name = attributes[:name]
    @phone = attributes[:phone]
  end

end
