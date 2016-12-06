require('spec_helper')

describe(Animal) do
  before :each do
    @bugs = Animal.new({
      :name => "Bugs",
      :type => "Bunny",
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
end
