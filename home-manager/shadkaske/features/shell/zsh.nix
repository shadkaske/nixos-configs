{
  pkgs,
  ...
}:{
  programs.zsh = {
    enable = true;

    enableCompletion = true;

    autocd = true;

    autosuggestion.enable = true;

    history = {
      append = true;
      expireDuplicatesFirst = true;
      ignoreAllDups = true;
    };

    historySubstringSearch = {
      enable = true;
    };

    # Plugins
    antidote = {
      enable = true;
      plugins = [
        "zsh-users/zsh-autosuggestions"
        "zsh-users/zsh-history-substring-search"
        "zsh-users/zsh-completions"
        "Aloxaf/fzf-tab"
        "zdharma-continuum/fast-syntax-highlighting"
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
        "jeffreytse/zsh-vi-mode"
        "jessarcher/zsh-artisan"
        "greymd/docker-zsh-completion"
      ];
    };

# TODO: Configure Bat and Eza
# Might not need thes plugins
# fdellwing/zsh-bat
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