require 'cell'
require 'world'

describe 'game of life' do
  let(:world) { World.new }
  context "cell utility methods" do
    subject { Cell.new(world) }
    it "spawn relative to" do
      cell = subject.spawn_at(3, 5)
      expect(cell.is_a?(Cell)).to be true
      expect(cell.x).to eq 3
      expect(cell.y).to eq 5
      expect(cell.world).to eq subject.world
    end

    it "detects a neighbour to the north" do
      cell = subject.spawn_at(0, 1)
      p subject.neighbours.count
      expect(subject.neighbours.count).to eq 1
    end

    it "detects a neighbour to the north east" do
      cell = subject.spawn_at(1, 1)
      expect(subject.neighbours.count).to eq 1
    end

    it "detects a neighbour to the east" do
      cell = subject.spawn_at(1, 0)
      expect(subject.neighbours.count).to eq 1
    end

    it "detects a neighbour to the west" do
      cell = subject.spawn_at(-1, 0)
      expect(subject.neighbours.count).to eq 1
    end

    it "detects a neighbour to the south" do
      cell = subject.spawn_at(0, -1)
      expect(subject.neighbours.count).to eq 1
    end

    it "detects a neighbour to the south east" do
      cell = subject.spawn_at(1, -1)
      expect(subject.neighbours.count).to eq 1
    end

    it "detects a neighbour to the south west" do
      cell = subject.spawn_at(-1, -1)
      expect(subject.neighbours.count).to eq 1
    end

    it "dies" do
      subject.die!
      expect(world.cells).to_not include subject
    end

  end


  it "Rule1: any live cell with fewer than two live neighbours dies" do
    cell = Cell.new(world)
    new_cell = cell.spawn_at(2, 0)
    world.tick!
    expect(cell).to be_dead
  end

  it "Rule2: any live cell with two or three neighbours lives on to see next gen" do
    cell = Cell.new(world)
    new_cell = cell.spawn_at(1, 0)
    other_new_cell = cell.spawn_at(-1, 0)
    world.tick!
    expect(cell).to be_alive
  end

end
