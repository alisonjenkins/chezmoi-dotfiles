# Source existing files bash helpers
SOURCE_FILES=(
    "$HOME/git/bashton-sshuttle/sshuttle-vpn"
    "$HOME/puppet-log-reader/bash-functions.sh"
    /usr/share/doc/pkgfile/command-not-found.bash
)

for FILE in "${SOURCE_FILES[@]}";
do
    if [ -e "$FILE" ];
    then
        source "$FILE"
    fi
done
