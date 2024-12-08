{
  pkgs,
  ...
}:{
  programs.bat = {
    enable = true;
    extraPackages = with pkgs.bat-extras; [ batdiff batman batgrep  batwatch ];
    config = {
      theme = "Catppuccin Mocha";
      pager = "less -FR";
    };
    themes = {
      Catppuccin-mocha = {
        src = pkgs.fetchFromGitHub {
          owner = "catppuccin";
          repo = "bat";
          rev = "main";
          sha256 = "sha256-x1yqPCWuoBSx/cI94eA+AWwhiSA42cLNUOFJl7qjhmw=";
        };
        file = "Catppuccin Mocha.tmTheme";
      };
    };
  };
}

