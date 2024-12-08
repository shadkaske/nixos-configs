{ ... }: {
    home.file = {
        "catppuccin-mocha.ini" = {
            enable = true;
            source = builtins.readFile(builtins.fetchurl {
                url = "https://raw.githubusercontent.com/catppuccin/zsh-fsh/refs/heads/main/themes/catppuccin-mocha.ini";
                sha256 = "sha256:0kk1615ksfql0qmsibngd4p4mvl1g7mx4hdhji8qd51ip22rds32";
            });
        };
    };
}
