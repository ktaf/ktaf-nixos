{ config, pkgs, lib, inputs, user, ... }:
{

# Shell Package
users.users.${user}.shell = pkgs.zsh;

# Enable ZSH and oh-my-zsh
programs.zsh = {
  enable = true;
  shellAliases = {
    ll = "ls -la";
    cat = "bat";
    k = "kubectl";
    kx = "kubectx";
    tf = "terraform";
    rebase = "'git checkout master && git pull && git checkout - && git rebase master'";
    switch = "sudo nixos-rebuild switch --flake .#${user}";
    switchu = "sudo nixos-rebuild switch --upgrade --flake .#${user}";
    clean = "sudo nix-collect-garbage -d";
    cleanold = "sudo nix-collect-garbage --delete-old";
    cleanboot = "sudo /run/current-system/bin/switch-to-configuration boot";
  };
  ohMyZsh = {
    enable = true;
    plugins = [ "git" "python" "docker" "history" "jsontools" "kubectl"];
    theme = "dpoggi";
  };
  # syntaxHighlighting = {
  # 	enable = true;
  # };
  # autosuggestions = {
  # 	enable = true;
  # };
  # setOptions = [
  # 	"correct"
  # 	"extendedglob"                                             # Extended globbing. Allows using regular expressions with *
  # 	"nocaseglob"                                               # Case insensitive globbing
  # 	"rcexpandparam"                                            # Array expension with parameters
  # 	"nocheckjobs"                                              # Don't warn about running processes when exiting
  # 	"numericglobsort"                                          # Sort filenames numerically when it makes sense
  # 	"nobeep"                                                   # No beep
  # 	"appendhistory"                                            # Immediately append history instead of overwriting
  # 	"histignorealldups"                                        # If a new command is a duplicate, remove the older one
  # 	"autocd"                                                   # if only directory path is entered, cd there.
  # 	"inc_append_history"                                       # save commands are added to the history immediately, otherwise only when shell exits.
  # 	"histignorespace"
  # ];
};

}