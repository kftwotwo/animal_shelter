class Person
  attr_reader(:name, :phone, :type_pref, :breed_pref)

  def initialize(attrs)
    @name = attrs[:name]
    @phone = attrs[:phone]
    @type_pref = attrs[:type_pref => nil]
    @breed_pref = attrs[:breed_pref => nil]
  end

end
