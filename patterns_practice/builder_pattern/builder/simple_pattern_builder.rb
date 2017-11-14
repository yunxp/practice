class SimplePatternBuilder < Builder
    def build_menu
        @play_pattern.menu = 'simple menu'
    end

    def build_play_list
        # @play_pattern.play_list = 'simple play list'
    end

    def build_main_window
        # @play_pattern.main_window = 'simple main window'
    end

    def build_control_bar
        @play_pattern.control_bar = 'simple control bar'
    end
end
