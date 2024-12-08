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
        src = pkgs.fetchurl {
          url = "https://github.com/catppuccin/bat/raw/refs/heads/main/themes/Catppuccin%20Mocha.tmTheme";
          sha256 = "sha256-UBuh6EeUhD5V9TjAo7hBRaGCt3KjkkO7QDxuaEBzN0s=";
        };
        file = "Catppuccin-mocha.tmTheme";
      };
    };
  };
}

