readonly SCRIPT_DIR=$(cd -P -- "$(dirname -- "$0")" && printf '%s\n' "$(pwd -P)/")


link_each() {
    while [ "$#" -gt 0 ]; do
        ln -s "${SCRIPT_DIR}$1" ~/$1

        shift
    done
}

DOTFILES=0
get_all_dotfiles() {
    DOTFILES=$(ls -ad .??* | grep -v git)
}

get_all_dotfiles
echo $DOTFILES
link_each $DOTFILES
