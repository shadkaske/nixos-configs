{ nixpkgs-unstable, ... }: {
  # TODO: Configure FZF
  programs.fzf = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    package = nixpkgs-unstable.fzf;
    tmux = {
      enableShellIntegration = true;
      # TODO: Set up fzf Tmux Config
    };
  };
}
