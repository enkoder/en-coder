set --universal fish_greeting ""

fish_vi_key_bindings 

set --universal tide_right_prompt_items status cmd_duration context jobs virtual_env vi_mode
 
fish_add_path $HOME/.local/bin
fish_add_path $HOME/.cargo/bin

if test -z (pgrep ssh-agent)
  eval (ssh-agent -c) > /dev/null
  set -Ux SSH_AUTH_SOCK $SSH_AUTH_SOCK
  set -Ux SSH_AGENT_PID $SSH_AGENT_PID
  set -Ux SSH_AUTH_SOCK $SSH_AUTH_SOCK
end
