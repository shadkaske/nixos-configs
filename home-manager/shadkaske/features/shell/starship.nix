{ lib, ... }: {
  programs.starship = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    settings = {
      add_newline = true;
      format = lib.concatStrings [
        "$os"
        "$username"
        "$hostname"
        "$directory"
        "$git_branch"
        "$git_state"
        "$git_status"
        "$shell"
        "$character"
      ];
      right_format = lib.concatStrings [
        "$python"
        "$custom"
        "$php"
        "$nodejs"
      ];
      continuation_prompt = " ❯❯ ";
      os = {
        disabled = false;
        style = "dimmed cyan";
        symbols = {
          Fedora = " ";
          Arch = " ";
          Mint = " ";
          Linux = " ";
          Pop = " ";
          Ubuntu = " ";
        };
      };
      hostname = {
        ssh_symbol = " 󰣀";
        format = "@(dimmmed white)[$hostname$ssh_symbol]($style) ";
      };
      username = {
        format = "[$user]($style)";
        style_user = "dimmed bright-yellow";
      };
      directory = {
        style = "blue";
        truncate_to_repo = false;
        truncation_length = 5;
        read_only = " ";
        read_only_style = "red";
      };
      shell = {
        disabled = true;
      };
      character = {
        success_symbol = "[ ❯](purple)";
        error_symbol = "[ ❯](red)";
        vimcmd_symbol = "[ ❮](green)";
      };

      git_branch = {
        format = "[$symbol](dimmed white)[$branch]($style)";
        style = "purple";
        symbol = " ";
      };

      git_status = {
        format = " ([$all_status$ahead_behind]($style))";
        style = "cyan";
        stashed = "≡";
      };

      git_state = {
        format = "\([$state( $progress_current/$progress_total)]($style)\) ";
        style = "bright-black";
      };
      cmd_duration = {
        format = " [$duration]($style) ";
        style = "yellow";
      };

      python = {
        format = "[$symbol](green)[$virtualenv]($style) ";
        style = "bright-black";
        symbol = " ";
      };

      nodejs = {
        format = " [$symbol]($style)[$version](dimmed white)";
        style = "dimmed blue";
        symbol = " ";
        version_format = "$major.$minor";
      };

      php = {
        format = " [$symbol]($style)[$version](dimmed white)";
        style = "dimmed purple";
        symbol = " ";
        version_format = "$major.$minor";
      };

      custom.laravel = {
        format = "[$symbol]($style)[$output](dimmed white)";
        command = "php artisan --version | cut -d\" \" -f3-";
        detect_files = ["composer.json" "artisan"];
        require_repo = true;
        symbol = "󰫐 ";
        style = "dimmed red";
      };
    };
  };
}
