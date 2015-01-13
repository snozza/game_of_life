class Cell
  attr_accessor :dead, :world, :x, :y

  def initialize(world, x=0, y=0)
    @world = world
    @x = x
    @y = y
    world.cells << self
  end

  def neighbours
    @neighbours = []
    
    world.cells.each do |cell|
      #Has a cell to the north
      if self.x == cell.x && self.y == cell.y - 1
        @neighbours << cell
      end

      #Has a cell to the north east
      if self.x == cell.x - 1 && self.y == cell.y - 1
        @neighbours << cell
      end

      #Has a cell to the west
      if self.x == cell.x + 1 && self.y == cell.y
        @neighbours << cell
      end

      #Has a cell to the east
      if self.x == cell.x - 1 && self.y == cell.y
        @neighbours << cell
      end

      #Has a cell to the south
      if self.x == cell.x && self.y == cell.y + 1
        @neighbours << cell
      end

      #Has a cell to the south east
      if self.x == cell.x - 1 && self.y == cell.y + 1
        @neighbours << cell
      end

      #Has a cell to the south west
      if self.x == cell.x + 1 && self.y == cell.y + 1
        @neighbours << cell
      end

    end

    @neighbours

  end

  def dead?
    !world.cells.include?(self)
  end

  def alive?
    world.cells.include?(self)
  end

  def die!
    world.cells.delete(self)
  end

  def spawn_at(x, y)
    Cell.new(world, x, y)
  end

end