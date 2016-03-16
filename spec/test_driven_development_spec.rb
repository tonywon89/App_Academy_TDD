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

  describe "#two_sums" do
    it "returns empty array if array is empty" do
      expect([].two_sums).to eq([])
    end

    it "empty if no matches" do
      expect([1,2,3].two_sums).to eq([])
    end

    it "doesn't duplicate matches" do
      expect([1,-1].two_sums).to eq([[0,1]])
    end

    it "handles multiple matches" do
      expect([-1, 0, 2, -2, 1].two_sums).to eq([[0, 4], [2, 3]])
    end
  end

  describe "#my_transpose" do
    it "handles empty array" do
      expect([].my_transpose).to eq([])
    end

    it "raise error if array contains non-array items" do
      expect {[1].my_transpose}.to raise_error(ArgumentError)
    end

    context "multidimensional arrays" do
      let(:square_matrix) do
        [
         [1,2,3],
         [4,5,6],
         [7,8,9]
        ]
      end

      let(:transposed_square) do
        [
          [1,4,7],
          [2,5,8],
          [3,6,9]
        ]
      end

      let(:rect_matrix) do
        [
          [1,2,3],
          [4,5,6]
        ]
      end

      let(:transposed_rec) do
        [
          [1,4],
          [2,5],
          [3,6]
        ]
      end

      it "transposes a square matrix" do
        expect(square_matrix.my_transpose).to eq(transposed_square)
      end

      it "transposes a rectangular matrix" do
        expect(rect_matrix.my_transpose).to eq(transposed_rec)
      end

      it "returns original matrix if transposed twice" do
        expect(rect_matrix.my_transpose.my_transpose).to eq(rect_matrix)
      end
    end
  end
end

describe "#stock_picker" do
  it "handles an empty array" do
    expect(stock_picker([])).to eq(nil)
  end

  it "return nil if only one price" do
    expect(stock_picker([42])).to eq(nil)
  end

  it "finds the most profitable pair of days" do
    expect(stock_picker([12, 4, 20])).to eq([1, 2])
  end

  it "doesn't go back in time to sell" do
    expect(stock_picker([12, 4, 20, 3])).to eq([1, 2])
  end

  it "minimizes losses" do
    expect(stock_picker([12, 10, 7, 3])).to eq([0, 1])
  end
end
