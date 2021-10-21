SHELL_SESSION_HISTORY=0
export VIRTUALENVWRAPPER_PYTHON="/Library/Frameworks/Python.framework/Versions/3.7/bin/python3.7"
export WORKON_HOME=~/Envs
export PROJECT_HOME=~/Projects
source /Library/Frameworks/Python.framework/Versions/3.7/bin/virtualenvwrapper.sh
export PATH=$PATH:/usr/local/mysql/bin
source ~/.custom_bash_scripts.sh
export SCRIPTS_PATH=~/.custom_bash_scripts.sh
export FB_API='v11.0'
export VISUAL='vim'
export GITUSER=bradisbon
export MYGIT=https://github.com/$GITUSER


# Setting PATH for Python 3.6
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}"
export PATH

# Needed for basemap in matplotlib
# export GEOS_DIR=/usr/local/Cellar/geos/3.6.2/

# Setting PATH for Python 3.7
# The original version is saved in .bash_profile.pysave
# PATH="/Library/Frameworks/Python.framework/Versions/3.7/bin:${PATH}"
# export PATH

# if [ -d "$HOME/Library/Python/3.6/bin/" ] ; then
#    PATH="$HOME/Library/Python/3.6/bin/:$PATH"
# fi

# export PYCHARM_PATH="/Users/bradi/Applications/JetBrains Toolbox/PyCharm Professional.app"

export LOCAL_UTILS="/Users/bradi/Projects/local-utils"
export MYGIT="https://github.com/bradisbon"

# Setting PATH for Python 3.7
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.7/bin:${PATH}"
export PATH


[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
export PATH="$PATH:$HOME/.rvm/bin"


# Setting PATH for Python 3.8
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.8/bin:${PATH}"
export PATH

##
# Your previous /Users/bradi/.bash_profile file was backed up as /Users/bradi/.bash_profile.macports-saved_2020-05-28_at_15:23:19
##

# MacPorts Installer addition on 2020-05-28_at_15:23:19: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.


export PATH="$HOME/.poetry/bin:$PATH"

# osx bugfix for weird error. suggested here: https://github.com/pypa/pipenv/issues/187
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

