{
  pkgs,
  ...
}:{
  programs.bat = {
    enable = true;
    extraPackages = with pkgs.bat-extras; [ batdiff batman batgrep  batwatch ];
    config = {
      theme = "Catppuccin-mocha";
      pager = "less -FR";
    };
    themes = {
      Catppuccin-mocha = {
        src = pkgs.fetchFromGitHub {
          owner = "catppuccin";
          repo = "bat";
          rev = "main";
          sha256 = "";
        };
        file = "Catppuccin-mocha.tmTheme";
      };
    };
  };
}

