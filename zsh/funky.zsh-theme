# Taken from Tassilo's Blog
# https://tsdh.wordpress.com/2007/12/06/my-funky-zsh-prompt/
#


setopt PROMPT_SUBST
local blue_op="%{$fg[blue]%}[%{$reset_color%}"
local blue_cp="%{$fg[blue]%}]%{$reset_color%}"

function git_branch_name()
{
  branch=$(git symbolic-ref HEAD 2> /dev/null | awk 'BEGIN{FS="/"} {print $NF}')
  if [[ $branch == "" ]];
  then
    :
  else
    echo -n "─${blue_op}$branch"
    if git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
        git diff --numstat | awk '{ added += $1; deleted += $2 } END { if (added || deleted) printf " "; if (added && deleted) printf "\033[32m+%s\033[0m/\033[31m-%s\033[0m", added, deleted; else if (added) printf "\033[32m+%s\033[0m", added; else if (deleted) printf "\033[31m-%s\033[0m", deleted }'
    fi
    echo -n "${blue_cp}"
  fi
}

venv_prompt_info() {
    if [[ -n "$VIRTUAL_ENV" ]]; then
        echo -n "─${blue_op}`basename $VIRTUAL_ENV`${blue_cp}"
    fi
}
ZSH_THEME_GIT_PROMPT_PREFIX=

local path_p="${blue_op}%~${blue_cp}"
local user_host="${blue_op}%n@%m${blue_cp}"
local ret_status="${blue_op}%?${blue_cp}"
local hist_no="${blue_op}%h${blue_cp}"
local hist_no="${blue_op}%h${blue_cp}"
local smiley="%(?,%{$fg[green]%}:%)%{$reset_color%},%{$fg[red]%}:(%{$reset_color%})"
PROMPT='╭─${user_host}─${path_p}$(git_branch_name)$(venv_prompt_info)
╰─${blue_op}${smiley}${blue_cp} '
local cur_cmd="${blue_op}%_${blue_cp}"
PROMPT2="${cur_cmd}> "

