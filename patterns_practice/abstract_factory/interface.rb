class Interface
    def show_interface
        raise 'no show_interface method'
    end
end

Dir[File.dirname(__FILE__) + '/interface/*.rb'].each {|file| require file }
