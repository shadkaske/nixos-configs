{ ... }: {
  # TODO: Configure FZF
  programs.fzf = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;

    defaultCommand = "fd --type file --follow --exclude .steam --hidden --color=always";

    defaultOptions = [
      "--border=rounded"
      "--layout=reverse"
      "--multi"
    ];

    colors = {
        "bg+" = "#313244";
        bg = "#1e1e2e";
        spinner = "#f5e0dc";
        hl = "#f38ba8";
        fg = "#cdd6f4";
        header = "#f38ba8";
        info = "#cba6f7";
        pointer = "#f5e0dc";
        marker = "#b4befe";
        "fg+" = "#cdd6f4";
        prompt = "#cba6f7";
        "hl+" = "#f38ba8";
        selected-bg = "#45475a";
    };

    historyWidgetOptions = [
        "--border-label='History Search'"
    ];

    changeDirWidgetCommand = "fd --type d --exclude .steam --hidden --follow . $HOME";
    changeDirWidgetOptions = [
        "--border-label='Directory Search'"
    ];

    fileWidgetCommand = "fd  --hidden --exclude .steam --follow . $HOME";
    fileWidgetOptions = [
        "--border-label='File Search'"
        "--preview 'bat {}'"
    ];

    tmux = {
      enableShellIntegration = true;
      # TODO: Set up fzf Tmux Config
    };
  };
}
