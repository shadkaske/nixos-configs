{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  # You can import other home-manager modules here
  imports = [
    ./zsh.nix
    ./fzf.nix
    ./direnv.nix
    ./bash.nix
    ./starship.nix
    ./bat.nix
  ];
}
