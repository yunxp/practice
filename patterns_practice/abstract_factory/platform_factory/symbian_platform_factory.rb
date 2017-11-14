class SymbianPlatformFactory < PlatformFactory

    def create_operation
       SymbianOperation.new
    end

    def create_interface
        SymbianInterface.new
    end

end
