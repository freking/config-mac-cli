# -------------------------------
# Environment
# -------------------------------
set -gx EDITOR hx
set -gx VISUAL hx
set -gx PAGER less -R

# Use ripgrep if available
if type -q rg
    set -gx FZF_DEFAULT_COMMAND "rg --files"
end

# -------------------------------
# Prompt (Amber phosphor friendly)
# -------------------------------
function fish_prompt
    set_color FFC94A
    printf "%s" (prompt_pwd)

    set_color AC4FC6
    printf " λ "

    set_color normal
end

# -------------------------------
# Bright Red Phosphor Errors
# -------------------------------

# Error messages
set -g fish_color_error FF3B1F

# Invalid command
set -g fish_color_command_not_found FF3B1F

# Redirection / parse errors
set -g fish_color_redirection FF3B1F

# Syntax highlighting for invalid tokens
set -g fish_color_valid_path normal
set -g fish_color_escape FF3B1F

# -------------------------------
# Aliases (simple + useful)
# -------------------------------
alias ll="ls -lah"
alias la="ls -A"
alias gs="git status"
alias ga="git add"
alias gc="git commit"
alias gp="git push"
alias gl="git log --oneline --graph"
alias hx.="hx ."

# safer rm/cp/mv
alias rm="rm -i"
alias cp="cp -i"
alias mv="mv -i"

# -------------------------------
# Dev helpers
# -------------------------------
function mkcd
    mkdir -p $argv[1]
    cd $argv[1]
end

function f
    rg $argv
end

function serve
    python3 -m http.server 8000
end

# -------------------------------
# PATH additions (if needed)
# -------------------------------
fish_add_path ~/.local/bin

# Ensure Homebrew is available
fish_add_path /opt/homebrew/bin
fish_add_path /opt/homebrew/sbin
