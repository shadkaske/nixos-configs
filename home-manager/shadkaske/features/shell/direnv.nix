{ ... }: {
    programs.direnv = {
        enable = true;
        enableBashIntegration = true;
        enableZshIntegration = true;
        silent = true;
        nix-direnv.enable = true;
        config = {
            global = {
                disable_stdin = true;
                load_dotenv = true;
                warn_timeout = "1m";
            };
            whitelist = {
                prefix = [ "~/Code" ];
            };
        };
    };
}
