class Person
  attr_reader(:id, :name, :phone, :type_pref, :breed_pref)

  def initialize(attrs)
    @id = attrs[:id => nil]
    @name = attrs[:name]
    @phone = attrs[:phone]
    @type_pref = attrs[:type_pref]
    @breed_pref = attrs[:breed_pref]
  end

end
