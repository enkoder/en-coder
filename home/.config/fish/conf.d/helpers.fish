# ANSI collors
set MAGENTA '\033[35;1m'
set RED '\033[91;1m'
set GREEN '\033[32;1m'
set CYAN '\033[36;1m'
set RESET '\033[0m'

function print -d "Prints the text passed to the function"  
    printf "$argv"
end

function print_step -d "Prints a megenta line"
    set_color magenta; echo $argv
end

function print_error -d "Prints a red line"
    set_color red; echo $argv
end

function print_warning -d "Prints a yello line" 
    set_color yellow; echo $argv
end

function print_good -d "Prints a green line"
    set_color green; echo $argv
end
