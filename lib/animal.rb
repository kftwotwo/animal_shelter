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
    if @id == nil
    saved = DB.exec("INSERT INTO  animals (name, type, breed, gender, date, person_id) VALUES ('#{@name}', '#{@type}', '#{@breed}', '#{@gender}', #{@date or 'NULL'}, #{@person_id or 'NULL'}) RETURNING id;")
      @id = saved.first["id"].to_i
    else
      DB.exec("UPDATE animals SET name = '#{@name}', type = '#{@type}', breed = '#{@breed}', gender = '#{@gender}', date = #{@date or 'NULL'}, person_id = #{@person_id or 'NULL'} WHERE id = #{@id};")
    end
  end

  def ==(other)
    @name == other.name and \
    @type == other.type and \
    @breed == other.breed and \
    @gender == other.gender
  end


end
