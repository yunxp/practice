class WindowsPlatformFactory < PlatformFactory

    def create_operation
       WindowsOperation.new
    end

    def create_interface
        WindowsInterface.new
    end

end
