{ pkgs, ... }: {
  programs.kitty = {
    enable = true;
    font = {
      name = "JetBrainsMono NFM Thin";
      size = 12;
    };
    settings = {
      scrollback_lines = 10000;
      enable_audio_bell = false;
      update_check_interval = 0;
      italic_font = "JetBrainsMono NFM Thin Italic";
      bold_font = "JetBrainsMono NFM SemiBold";
      bold_italic_font = "JetBrainsMono NFM SemiBold Italic";
      adjust_line_height = "110%";
      background_opacity = 1.0;
      copy_on_select = true;
      remember_window_size = false;
      initial_window_width = "124c";
      initial_window_height = "32c";
      placement_strategy = "center";
      strip_trailing_spaces = "smart";
      confirm_os_window_close = 0;
      window_padding_width = 4;
      tab_bar_min_tabs = 2;
      tab_bar_edge = "bottom";
      tab_bar_style = "powerline";
      tab_powerline_style = "slanted";
      tab_title_template = "{title}{' :{}:'.format(num_windows) if num_windows > 1 else ''}";
    };
    themeFile = "Catppuccin-Mocha";
  };
}
