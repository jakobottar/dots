# Uses "#" instead of "»" when running with elevated privileges
PROMPT="%m %{${fg_bold[red]}%}:: %{${fg[green]}%}%2~ "
PROMPT+='$(git_prompt_info)%{${fg[blue]}%}»%{${reset_color}%} '

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}📝"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%}) ✅" 
# check if alacritty is falling back to nerd font
# or if I have to specify certain unicode chars
