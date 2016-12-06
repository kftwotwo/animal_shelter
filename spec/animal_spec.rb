require('spec_helper')

describe(Animal) do
  before :each do
    @bugs = Animal.new({
      :name => "Bugs",
      :type => "Bunny",
      :breed => "Mutant",
      :gender => "Male"
    })

    @daffy = Animal.new({
      :name => "Daffy",
      :type => "Duck",
      :breed => "Mutant",
      :gender => "Male"
    })
  end

  describe '#initialize' do
    it 'initializes basic properties' do
      expect(@bugs.name).to eq "Bugs"
      expect(@bugs.type).to eq "Bunny"
      expect(@bugs.breed).to eq "Mutant"
      expect(@bugs.gender).to eq "Male"
    end
  end

  describe '#save' do
    it "will save the into the database" do
      @bugs.save()
      expect(Animal.all).to be_an_instance_of(Array)
    end

    it "will update animals that already exist" do
      @bugs.save
      @bugs.save
      bugs2_id = @bugs.id
      expect(Animal.all.first).to eq @bugs
      expect(Animal.all.first.id.to_i).to eq bugs2_id
    end
  end

  describe '.all' do
    it "will list out all animals in the database" do
      @bugs.save()
      expect(Animal.all).to eq [@bugs]
    end
  end

  describe '#==' do
    it "will return false if and of the name, breed, type, or gender don't match" do
      expect(@bugs == @daffy).to eq false
    end
  end
  # TODO: Add sort methods name, type, breed, and date
  # TODO: Add method to add person to Animal
  # TODO: Add method to update / fix save method so it updates

end
