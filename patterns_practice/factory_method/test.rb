require './picture'
require './picture_factory'
require './jpg_picture'
require './gif_picture'
require './jpg_factory'
require './gif_factory'

# Dir[File.dirname(__FILE__) + '/*.rb'].each {|file| require file }

type = ARGV[0] || 'Jpg'
factory = Object.const_get("#{type}Factory").new
picture = factory.get_picture
picture.read
