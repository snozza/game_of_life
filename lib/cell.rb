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
       @neighbours << cell if self.x == cell.x && self.y == cell.y - 1
        
      #Has a cell to the north east
      @neighbours << cell if self.x == cell.x - 1 && self.y == cell.y - 1

      #Has a cell to the west
      @neighbours << cell if self.x == cell.x + 1 && self.y == cell.y       

      #Has a cell to the east
      @neighbours << cell if self.x == cell.x - 1 && self.y == cell.y

      #Has a cell to the south
      @neighbours << cell if self.x == cell.x && self.y == cell.y + 1

      #Has a cell to the south east
      @neighbours << cell if self.x == cell.x - 1 && self.y == cell.y + 1

      #Has a cell to the south west
      @neighbours << cell if self.x == cell.x + 1 && self.y == cell.y + 1

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