require('spec_helper')

describe(Person) do
  describe('#initialize') do
    it "will return name" do
      person = Person.new({:name => "Kenny", :phone => '406-555-1234'})
      expect(person.name).to eq "Kenny"
      expect(person.phone).to eq '406-555-1234'
      expect(person.type_pref).to eq nil
      expect(person.breed_pref).to eq nil
    end
  end

end
