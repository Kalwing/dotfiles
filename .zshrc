# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

DEFAULT_USER="thomas"
# Path to your oh-my-zsh installation.
export ZSH="/home/"$DEFAULT_USER"/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
export TERM=xterm-256color  # Fix to get colors in vim in tmux
ZSH_THEME="agnoster"
#"robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

# common-aliases:
#   l: List files as a long list, show size, type, human-readable
#   la : List almost all files as a long list show size, type, human-readable
#   zip, tar, rar, tar.gz: Lists files inside a .* file
# dirhistory: alt left: prev dir, alt right: next dir, alt up: parent, alt down: first child
# octozen : zen quote from github
# per-directory-history: ctrl+G to switch between local and global history
# python: pyclean [dirs] : clean bytecode and cache
# sudo : prefix your current or previous commands with sudo by pressing esc twice
# ubuntu :  adds completions and aliases for Ubuntu
VSCODE=code-insiders # vsc to open the current folder in vscode # vsca to add the cur folder to last win # vscr file to last win
plugins=(colored-man-pages common-aliases dirhistory docker emoji-clock git pip python rand-quote sudo tmux vscode kwote)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#

export PATH=$PATH:/usr/bin/python3.12
export VIRTUALENV_PYTHON=/usr/bin/python3.12
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3.12
source ~/.local/bin/virtualenvwrapper.sh

# Example aliases
alias zshconfig="vim ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias vimconfig="vim ~/.vimrc"
alias nano="vim"
alias python="python3"
alias SD="workon SD8; echo 'Starting SD session:'; cd ~/Documents/Cours/M2; jupyter lab ."
alias PHD="workon PHD; echo 'Starting PHD session:'; cd ~/Documents/PhD; jupyter lab ."
# Project management
export PROJECT_ROOT="$HOME/Documents/Project"
CURRENT_PROJECT_FILE="$HOME/.current_project"

# Read current project from file if it exists
if [[ -f "$CURRENT_PROJECT_FILE" ]]; then
    export CURRENT_PROJECT=$(cat "$CURRENT_PROJECT_FILE")
else
    export CURRENT_PROJECT=""
fi


cd_pr() {
    cd "$PROJECT_ROOT"
}

cd_cpr() {
    cd "$PROJECT_ROOT/$CURRENT_PROJECT"
}

set_cpr() {
    export CURRENT_PROJECT="$1"
    echo "$1" > "$CURRENT_PROJECT_FILE"
}


export EDITOR="vim"

export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
export PATH=$PATH:$JAVA_HOME/bin

export PATH=/usr/local/cuda/bin:$PATH
export LD_LIBRARY_PATH=/usr/local/cuda/extras/CUPTI/lib64:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=/usr/local/cuda-10.1/lib64:$LD_LIBRARY_PATH

alias kitty="~/.local/kitty.app/bin/kitty"
alias icat="kitty +kitten icat"
alias clipboard="kitty +kitten clipboard"

export PATH=$PATH:/home/$DEFAULT_USER/julia/bin


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# >>> juliaup initialize >>>

# !! Contents within this block are managed by juliaup !!

path=('/home/thomas/.juliaup/bin' $path)
export PATH

# <<< juliaup initialize <<<

. "/home/thomas/.deno/env"


echo -n "\e[1;33mQOTD\e[0;93m — $(date +%d/%m/%Y) $(date +%k:%M) \e[0m"
emoji-clock
fetch_kwote "https://thomasdargent.com/api/get_quote/date" 2 && echo "\e[1;90msa fé reflechir...\e[0m" || echo "No quotes today"
