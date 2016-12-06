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
end
