require('spec_helper')

describe Person  do
  before :each  do
    @person = Person.new({:name => "Kenny", :phone => '406-555-1234'})
    @person2 = Person.new({
      :name => "Kevin",
      :phone => '406-555-5678',
      :type_pref => 'dog',
      :breed_pref => 'labs'
    })
  end
  describe '#initialize'  do
    it "will return name and phone" do
      expect(@person.name).to eq "Kenny"
      expect(@person.phone).to eq '406-555-1234'
    end

    it "will initialize id, type and breed preferences as nil if not supplied" do
      expect(@person.id).to eq nil
      expect(@person.type_pref).to eq nil
      expect(@person.breed_pref).to eq nil
    end

    it "will initialize breed preferences properly if provided" do
      expect(@person2.type_pref).to eq "dog"
      expect(@person2.breed_pref).to eq "labs"
    end
  end

  describe '#save' do
    it "will save the into the database" do
      @person.save()
      expect(Person.all).to be_an_instance_of(Array)
    end

    it "will update entries that already exist" do
      @person2.save
      @person2.save
      person2_id = @person2.id
      expect(Person.all.first).to eq @person2
      expect(Person.all.first.id.to_i).to eq person2_id
    end
  end

  describe '.all' do
    it "will list out all animals in the database" do
      @person.save()
      expect(Person.all).to eq [@person]
    end
  end

  describe '#==' do
    it "will return false if the name or phone don't match" do
      expect(@person == @person2).to eq false
    end
  end

end
