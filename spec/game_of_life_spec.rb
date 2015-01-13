require 'game_of_life'

describe 'game of life' do
  context "cell utility methods" do
    subject { Cell.new }
    it "spawn relative to" do
      cell = subject.spawn_at(3, 5)
      expect(cell.is_a?(Cell)).to be true
      expect(cell.x).to eq 3
      expect(cell.y).to eq 5
    end
  end


  it "any live cell with fewer than two live neighbours dies" do
    cell = Cell.new
    expect(cell.neighbours.count).to equal 0
  end
end
