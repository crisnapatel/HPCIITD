if [ -n "$SSH_TTY" ]; then
    $HOME/sourceme.sh
    trap "$HOME/.kill_DontBlockMeHPC.sh" EXIT
fi
