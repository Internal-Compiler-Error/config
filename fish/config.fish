if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -x EDITOR (which neovide)
zoxide init fish | source
emit nvm_install


# Ensure that GPG Agent is used as the SSH agent
set -e SSH_AUTH_SOCK
set -U -x SSH_AUTH_SOCK (gpgconf --list-dirs agent-ssh-socket)

set -x GPG_TTY (tty)

gpgconf --launch gpg-agent
