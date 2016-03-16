require 'rspec'
require 'test_driven_development'

# [1, 2, 1, 3, 3].uniq # => [1, 2, 3]
describe "Array" do
  describe "#my_uniq" do
    it "works with an empty array" do
      expect([].my_uniq).to eq([])
    end

    it "works without duplicates" do
      expect([1, 2, 3].my_uniq).to eq([1, 2, 3])
    end

    it "works with duplicates" do
      expect([1, 2, 1, 3, 3].my_uniq).to eq([1, 2, 3])
    end

    it "does not modify original array" do
      array = [1, 2, 1, 3, 3]
      array.my_uniq
      expect(array).to eq([1, 2, 1, 3, 3])
    end
    
  end
end
