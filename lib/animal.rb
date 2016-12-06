class Animal
  attr_reader(:id, :name, :type, :breed, :gender, :date, :person_id)

  def initialize(attrs)
    @id = attrs[:id]
    @name = attrs[:name]
    @type = attrs[:type]
    @breed = attrs[:breed]
    @gender = attrs[:gender]
    @date = attrs[:date]
    @person_id = attrs[:person_id]
  end

  class << self

    def all
      DB.exec("Select * FROM animals;").map do |animal|
        Animal.new({
          :id => animal["id"],
          :name => animal["name"],
          :type => animal["type"],
          :breed => animal["breed"],
          :gender => animal["gender"],
          :date => animal["date"],
          :person_id => animal["person_id"]
        })
      end
    end
  end

  def save
    saved = DB.exec("INSERT INTO  animals (name, type, gender, breed, date, person_id) VALUES ('#{@name}', '#{@type}', '#{@gender}', '#{@breed}', #{@date or "NULL"}, #{@person_id or "NULL"});")
  end

  def ==(other)
    @name == other.name and \
    @type == other.type and \
    @breed == other.breed and \
    @gender == other.gender
  end


end
