{ ... }: {
    programs.eza = {
        enable = true;
        enableBashIntegration = true;
        enableZshIntegration = true;
        extraOptions = [
            "--group-directories-first"
        ];
        git = true;
        icons = "auto";
    };
}
