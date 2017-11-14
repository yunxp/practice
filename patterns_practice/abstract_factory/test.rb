#Dir[File.dirname(__FILE__) + '/*.rb'].each {|file| require file }
require './operation.rb'
require './interface.rb'
require './platform_factory.rb'

factory = Object.const_get("#{ARGV[0]}Factory").new
opt = factory.create_operation
face = factory.create_interface
opt.do_operation
face.show_interface
