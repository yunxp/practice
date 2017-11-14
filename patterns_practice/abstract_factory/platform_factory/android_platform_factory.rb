class AndroidPlatformFactory < PlatformFactory

    def create_operation
       AndroidOperation.new
    end

    def create_interface
        AndroidInterface.new
    end

end
