set --universal fish_greeting ""

fish_vi_key_bindings 

set --universal tide_right_prompt_items status cmd_duration context jobs virtual_env vi_mode
 
fish_add_path $HOME/.local/bin
fish_add_path $HOME/.cargo/bin

