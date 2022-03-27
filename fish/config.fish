if status is-interactive
    # Commands to run in interactive sessions can go here
end

# to make gpg happy
set -gx GPG_TTY (tty)

# zoxide is a smarter cd command
zoxide init fish | source

# starship is a minimal, blazing-fast, and infinitely customizable prompt for any shell! 
# starship init fish | source
