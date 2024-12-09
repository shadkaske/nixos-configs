{
  pkgs,
  config,
  ...
}: {
  programs.zsh = {
    enable = true;

    enableCompletion = true;

    autocd = true;

    autosuggestion.enable = true;

    dotDir = ".config/zsh";

    history = {
      append = true;
      expireDuplicatesFirst = true;
      ignoreAllDups = true;
    };

    historySubstringSearch = {
      enable = true;
    };

    localVariables = {
      WORDCHARS = "*?_-.[]~=&;!#$%^(){}<>";
    };

    envExtra = ''
      export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR"/ssh-agent.socket
      export VIRSH_DEFAULT_CONNECT_URI="qemu:///system"
      export MANPAGER="sh -c 'col -bx | bat -l man -p'"
      export MANROFFOPT="-c"
    '';

    # Plugins
    plugins = [
      {
        name = "vi-mode";
        src = pkgs.zsh-vi-mode;
        file = "share/zsh-vi-mode/zsh-vi-mode.plugin.zsh";
      }
      {
        name = "zsh-autosuggestions";
	src = pkgs.zsh-autosuggestions;
	file = "share/zsh-autosuggestions/zsh-autosuggestions.zsh";
      }
      {
      	name = "zsh-history-substring-search";
	src = pkgs.zsh-history-substring-search;
	file = "share/zsh-history-substring-search/zsh-history-substring-search.zsh";
      }
      {
        name = "zsh-completions";
	src = pkgs.zsh-completions;
      }
      {
        name = "fzf-tab";
	src = pkgs.zsh-fzf-tab;
	file = "share/fzf-tab/fzf-tab.plugin.zsh";
      }
    ];

    # Antidote Plugin Manager
    antidote = {
      enable = true;
      plugins = [
        "zdharma-continuum/fast-syntax-highlighting"
        "fdellwing/zsh-bat"
        "jessarcher/zsh-artisan"
        "greymd/docker-zsh-completion"
        "getantidote/use-omz"
        "ohmyzsh/ohmyzsh path:plugins/git"
        "ohmyzsh/ohmyzsh path:plugins/systemd"
        "ohmyzsh/ohmyzsh path:plugins/firewalld"
        "ohmyzsh/ohmyzsh path:plugins/ubuntu"
        "ohmyzsh/ohmyzsh path:plugins/archlinux"
        "ohmyzsh/ohmyzsh path:plugins/dnf"
        "ohmyzsh/ohmyzsh path:plugins/sudo"
        "ohmyzsh/ohmyzsh path:plugins/ssh-agent"
        "ohmyzsh/ohmyzsh path:plugins/docker-compose"
      ];
    };

# TODO: Configure Bat and Eza
# Might not need thes plugins
# z-shell/zsh-eza

      initExtra = ''
        zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
        zstyle ':completion:*' list-colors "\$\{(s.:.)LS_COLORS\}"
        zstyle ':completion:*' menu no
        zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls -a --color $realpath'
        zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls -a --color $realpath'
        zstyle :omz:plugins:ssh-agent quiet yes
        zstyle :omz:plugins:ssh-agent helper ksshaskpass
        zstyle :omz:plugins:ssh-agent agent-forwarding yes
        if [[ -f "$HOME/.config/fsh/catppuccin-mocah.ini" ]];
            then fast-theme XDG:catppuccin-mocha > /dev/null
        fi
        zvm_after_init() {
            source ${config.programs.fzf.package}/share/fzf/key-bindings.zsh
        }
      '';

     shellAliases = {
  gs = "git status";
  gpl = "git pull";
  gpoat = "git push origin --all && git push origin --tags";
  lg = "lazygit";
  fm = "yazi";
  tsu = "sudo tailscale up --accept-routes";
  tsd = "sudo tailscale down";
  lap = "eza -alh | bat -l fs";
  cl = "clear";
  v = "nvim";
  n = "nvim";
  vim = "nvim";
  xoff = "sudo phpdismod -s cli xdebug";
  xon = "sudo phpenmod -s cli xdebug";
  s = "sesh cn $(sesh l | fzf)";
  ".." = "cd ..";
  "..." = "cd ../..";
  "...." = "cd ../../..";
  gcd = "git checkout $(git config gitflow.branch.develop)";
  gch = "git checkout $(git config gitflow.prefix.hotfix)";
  gcr = "git checkout $(git config gitflow.prefix.release)";
  tinker = "sail artisan tinker";
  sail = "sh $([ -f sail ] && echo sail || echo vendor/bin/sail)";
     };
  };
}
