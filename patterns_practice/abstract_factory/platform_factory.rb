class PlatformFactory

    def create_operation
       Operation.new
    end

    def create_interface
        Interface.new
    end

end

Dir[File.dirname(__FILE__) + '/platform_factory/*.rb'].each {|file| require file }
