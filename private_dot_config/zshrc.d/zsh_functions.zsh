# This function starts ranger and allows you to select
# a directory to switch into upon exiting ranger.
function rcd {
    # create a temp file and store the name
    tempfile="$(mktemp -t tmp.XXXXXX)"

    # run ranger and ask it to output the last path into the
    # temp file
    ranger --choosedir="$tempfile" "${@:-$(pwd)}"

    # if the temp file exists read and the content of the temp
    # file was not equal to the current path
    test -f "$tempfile" &&
    if [ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]; then
        # change directory to the path in the temp file
        cd -- "$(cat "$tempfile")"
    fi

    # its not super necessary to have this line for deleting
    # the temp file since Linux should handle it on the next
    # boot
    rm -f -- "$tempfile"
}

# This function starts broot and executes the command
# it produces, if any.
# It's needed because some shell commands, like `cd`,
# have no useful effect if executed in a subshell.
function br {
    f=$(mktemp)
    (
        set +e
        broot --outcmd "$f" "$@"
        code=$?
        if [ "$code" != 0 ]; then
            rm -f "$f"
            exit "$code"
        fi
    )
    code=$?
    if [ "$code" != 0 ]; then
        return "$code"
    fi
    d=$(<"$f")
    rm -f "$f"
    eval "$d"
}

# This is a function for switching directory using nnn
# it is similar to rcd but using nnn instead of ranger.
n ()
{
    # Block nesting of nnn in subshells
    if [ -n $NNNLVL ] && [ "${NNNLVL:-0}" -ge 1 ]; then
        echo "nnn is already running"
        return
    fi

    # The default behaviour is to cd on quit (nnn checks if NNN_TMPFILE is set)
    # To cd on quit only on ^G, remove the "export" as in:
    #     NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"
    # NOTE: NNN_TMPFILE is fixed, should not be modified
    export NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"

    # Unmask ^Q (, ^V etc.) (if required, see `stty -a`) to Quit nnn
    # stty start undef
    # stty stop undef
    # stty lwrap undef
    # stty lnext undef

    nnn "$@"

    if [ -f "$NNN_TMPFILE" ]; then
            . "$NNN_TMPFILE"
            rm -f "$NNN_TMPFILE" > /dev/null
    fi
}
