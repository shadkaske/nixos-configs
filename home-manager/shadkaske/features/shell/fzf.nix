{
  # TODO: Configure FZF
  programs.fzf = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    tmux = {
      enableShellIntegration = true;
      # TODO: Set up fzf Tmux Config
    };
  };
}
