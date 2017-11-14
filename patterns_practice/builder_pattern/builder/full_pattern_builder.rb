class FullPatternBuilder < Builder
    def build_menu
        @play_pattern.menu = 'full menu'
    end

    def build_play_list
        @play_pattern.play_list = 'full play list'
    end

    def build_main_window
        @play_pattern.main_window = 'full main window'
    end

    def build_control_bar
        @play_pattern.control_bar = 'full control bar'
    end
end
