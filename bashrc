# Load shell dotfiles
DOTFILES=dotfiles
source ~/${DOTFILES}/aliases
source ~/${DOTFILES}/export

#sets terminal title to passed argument 
function set_title {
	x=$1
	PROMPT_COMMAND='echo -ne "\033]0;${x}\007"'
}

# Set terminal title to $PWD
PROMPT_COMMAND='echo -ne "\033]0;${PWD}\007"'

# Don't overwirte existing files by redirection
set -o noclobber 

# Simple prompt: violet, host only
PS1="\[\e[1;35m\]\h$ \[\e[0m\]" 

# Load local .bashrc
if [[ -f ~/.bashrc-local ]]; then
	source ~/.bashrc-local
fi

# Load git completions
. ~/${DOTFILES}/git-completion.bash

# Load solarized colors for ls
eval $(dircolors ~/.dircolors)

# pip bash completion start
_pip_completion()
{
    COMPREPLY=( $( COMP_WORDS="${COMP_WORDS[*]}" \
                   COMP_CWORD=$COMP_CWORD \
                   PIP_AUTO_COMPLETE=1 $1 ) )
}
complete -o default -F _pip_completion pip
# pip bash completion end

# virtualenv/virtualenvwrapper:
if [[ -a /usr/local/bin/virtualenvwrapper.sh ]]; then
		export WORKON_HOME="${HOME}/.virtualenvs"
		export PROJECT_HOME="${HOME}/0dev/pythonvw_projects"
		source /usr/local/bin/virtualenvwrapper.sh
fi

#echo -e -n "\x1b[\x35 q" # changes to blinking bar

#nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

