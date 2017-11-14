class Operation
    def do_operation
        raise 'no do_operation method'
    end
end

Dir[File.dirname(__FILE__) + '/operation/*.rb'].each {|file| require file }
