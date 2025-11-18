set -gx PATH /opt/homebrew/bin $PATH

set -gx COLORTERM truecolor

if status is-interactive
    # Commands to run in interactive sessions can go here
end
 
set fish_greeting ""
 
source ~/.config/fish/functions/postexec_newline.fish
 
bind --preset \cC 'cancel-commandline'
 
if type -q nvm
  function __nvm_auto --on-variable PWD
  nvm use --silent 2>/dev/null # Comment out the silent flag for debugging
  end
  __nvm_auto
end
 
# `ls` → `ls -laG` abbreviation
abbr -a -g ls ls -laG
 
if type -q eza
  abbr --add -g ls 'eza --long --classify --all --header --git --no-user --tree --level 1'
end
 
if type -q bat
  abbr --add -g cat 'bat'
end
 
if type -q trash
  abbr --add -g rm 'trash'
end
