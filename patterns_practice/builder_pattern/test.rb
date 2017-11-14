require './play_pattern'
require './builder'

type = ARGV[0] || 'Full'

builder = Object.const_get("#{type}PatternBuilder").new
pattern = builder.build_pattern
puts pattern.menu
puts pattern.play_list
puts pattern.main_window
puts pattern.control_bar

