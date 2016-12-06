class Person
  attr_reader(:id, :name, :phone, :type_pref, :breed_pref)

  def initialize(attrs)
    @id = attrs[:id]
    @name = attrs[:name]
    @phone = attrs[:phone]
    @type_pref = attrs[:type_pref]
    @breed_pref = attrs[:breed_pref]
  end

  class << self

    def all
      DB.exec("Select * FROM people;").map do |person|
        Person.new({
          :id => person["id"],
          :name => person["name"],
          :phone => person["phone"],
          :type_pref => person["type_pref"],
          :breed_pref => person["breed_pref"],
        })
      end
    end
  end

  def save
    saved = DB.exec("INSERT INTO  people (name, phone, type_pref, breed_pref) VALUES ('#{@name}', '#{@phone}', '#{@type_pref}', '#{@breed_pref}');")
  end

  def ==(other)
    @name == other.name and \
    @phone == other.phone
  end

end
