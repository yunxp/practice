class Cell
  attr_accessor :x, :y, :value, :is_enable

  def initialize(x, y, value = '-')
    @x = x
    @y = y
    @value = value
    @is_enable = true
  end

  def is_mine?
    @value == 'x'
  end

  def ==(object)
    object.x == self.x && object.y == self.y
  end

  def to_s
    "cell: x(#{@x}), y(#{@y}), value(#{@value}), is_enable(#{is_enable})"
  end
end

class MineMap
  attr_accessor :size, :cells, :mines

  def initialize(size, percent = 10)
    @size = size
    @cells = []
    @mines = []
    init_map([size*size/percent.to_i, 1].max)
  end

  def display_map(is_all = false)
    (0...@size).each do |y|
      str = ''
      (0...@size).each do |x|
        cell = find_cell(x, y)
        value = cell.value if is_all || !cell.is_enable
        str += (value || '*') + '    '
      end
      puts str
      puts
    end
  end

  def find_cell(x, y)
    cell_index = @cells.index(Cell.new(x, y))
    cell_index ? @cells[cell_index] : nil
  end

  private
  def find_mine(x, y)
    cell_index = @mines.index(Cell.new(x, y))
    cell_index ? @mines[cell_index] : nil
  end

  def init_map(mine_size)
    init_mines(mine_size)
    init_blank
  end

  def init_mines(mine_size)
    while true
      x = rand(0...@size)
      y = rand(0...@size)
      @mines << Cell.new(x, y, 'x') unless find_mine(x, y)
      break if @mines.size >= mine_size
    end
  end

  def init_blank
    (0...@size).each do |x|
      (0...@size).each do |y|
        @cells << (find_mine(x, y) || calculate_cell(x, y))
      end
    end
  end

  def calculate_cell(x_index, y_index)
    value = 0
    (x_index-1..x_index+1).each do |x|
      (y_index-1..y_index+1).each do |y|
        next if x < 0 || y < 0 || x >= @size || y >= @size
        value += 1 if find_mine(x, y)
      end
    end
    Cell.new(x_index, y_index, value.to_s)
  end
end

class DigMine
  def initialize(size = 9)
    @map = MineMap.new(size)
  end

  def start
    loop do
      @map.display_map
      puts 'Please input position...:'
      position = STDIN.gets.chomp
      x, y = position.split(',')
      begin
        x, y = x.to_i, y.to_i
      rescue StandardError
        next
      end
      dig(x, y)
      puts
    end
  end

  private
  def dig(x, y)
    cell = @map.find_cell(x, y)
    return unless cell.is_enable
    abort 'error' unless cell
    finish 'failed...' if cell.is_mine?
    cell.is_enable = false
    finish 'success...' if success?
  end

  def finish(msg)
    @map.display_map(true)
    abort msg
  end

  def success?
    @map.cells.select {|cell| cell.is_enable }.count == @map.mines.size
  end
end

game = DigMine.new(3)
game.start
