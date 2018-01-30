class String
  def bg_cyan; "\e[46m#{self}\e[0m" end
end

class Point
  attr_accessor :x, :y

  def initialize(x, y)
    @x, @y = x, y
  end
end

class GenerateMaze
  attr_accessor :maze

  DIRS = {
    'l' => [-1, 0],
    'r' => [1, 0],
    'u' => [0, -1],
    'd' => [0, 1]
  }

  def initialize(width, height)
    @width = width
    @height = height
    @start_point = Point.new(1, 1)
    @end_point = nil
    @history = [@start_point]
    @maze = [Point.new(0, 1), @start_point]
  end

  def run
    while @history.size > 0
      point = @history.last
      result = false
      dirs = []
      while(!result && dirs.size != DIRS.keys.size)
        next_step = DIRS.keys.sample
        while dirs.include?(next_step)
          next_step = DIRS.keys.sample
        end
        dirs << next_step
        result = go(next_step, point)
      end
      unless result
        @history.pop
      end
    end
    @maze << @end_point if @end_point
  end

  def print_maze
    (0...@height).each do |y|
      str = ''
      (0...@width).each do |x|
        value = visited_point?(x, y) ? ' ' : '='.bg_cyan
        str += value
      end
      puts str
    end
  end

  private
  def can_next?(x, y)
    x > 0 && x < @width && y > 0 && y < @height && !visited_point?(x, y)
  end

  def visited_point?(x, y)
    @maze.find { |point| point.x == x && point.y == y }
  end

  def go(next_step, point)
    if next_step == 'r' && @end_point.nil? && (point.x + 1 == @width - 1)
      @end_point = Point.new(point.x + 1, point.y)
    end
    x, y = point.x + DIRS[next_step][0] * 2, point.y + DIRS[next_step][1] * 2
    return false unless can_next?(x, y)
    next_point = Point.new(x, y)
    @maze << Point.new(point.x + DIRS[next_step][0], point.y + DIRS[next_step][1])
    @maze << next_point
    @history << next_point
    return true
  end
end

maze = GenerateMaze.new(61, 35)
maze.run
maze.print_maze
