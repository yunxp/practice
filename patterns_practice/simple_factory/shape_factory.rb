require './shape'
require './my_round'
require './my_triangle'
require './my_square'

class ShapeFactory
    def self.get_shape(type)
        # "my_#{type}".titleize.constantize.new
        Object.const_get("My#{type.capitalize}").new
    end
end

type = ARGV[0]
shape = ShapeFactory.get_shape(type)
shape.draw
shape.erase

