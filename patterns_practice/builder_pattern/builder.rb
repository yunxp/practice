class Builder
    attr_accessor :play_pattern

    def build_pattern
        @play_pattern = PlayPattern.new
        self.build_menu
        self.build_play_list
        self.build_main_window
        self.build_control_bar
        @play_pattern
    end
end

Dir[File.dirname(__FILE__) + '/builder/*.rb'].each {|file| require file }
