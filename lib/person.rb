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
    if @id == nil
      saved = DB.exec("INSERT INTO  people (name, phone, type_pref, breed_pref) VALUES ('#{@name}', '#{@phone}', '#{@type_pref}', '#{@breed_pref}') RETURNING id;")
      @id = saved.first["id"].to_i
    else
      DB.exec("UPDATE people SET name = '#{@name}', phone = '#{@phone}', type_pref = '#{@type_pref}', breed_pref = '#{@breed_pref}' WHERE id = #{@id};")
    end
  end

  def ==(other)
    @name == other.name and \
    @phone == other.phone
  end
  # TODO: Add method to update / fix save method so it updates
  # TODO: Add method to list customers by breed preference

end
