#GIT IN PROMPT (GLOBAL VARIABLES)
set -g __fish_git_prompt_show_informative_status 1
set -g __fish_git_prompt_hide_untrackedfiles 1

set -g __fish_git_prompt_color_branch magenta bold
set -g __fish_git_prompt_showupstream "informative"
set -g __fish_git_prompt_char_upstream_ahead "↑"
set -g __fish_git_prompt_char_upstream_behind "↓"
set -g __fish_git_prompt_char_upstream_prefix ""

set -g __fish_git_prompt_char_stagedstate "●"
set -g __fish_git_prompt_char_dirtystate "✚"
set -g __fish_git_prompt_char_untrackedfiles "…"
set -g __fish_git_prompt_char_conflictedstate "✖"
set -g __fish_git_prompt_char_cleanstate "✔"

set -g __fish_git_prompt_color_dirtystate blue
set -g __fish_git_prompt_color_stagedstate yellow
set -g __fish_git_prompt_color_invalidstate red
set -g __fish_git_prompt_color_untrackedfiles $fish_color_normal
set -g __fish_git_prompt_color_cleanstate green bold

function fish_prompt --description 'Write out the prompt'
	set -l home_escaped (echo -n $HOME | sed 's/\//\\\\\//g')
	set -l pwd (echo -n $PWD | sed "s/^$home_escaped/~/" | sed 's/ /%20/g')
	set -l prompt_symbol ''

	# check if user is root or regular
	switch $USER
		case root; set prompt_symbol '#'
		case '*';  set prompt_symbol '$'
	end

	# check if git prompt is usable
	set test_or (__fish_git_prompt) 1
	if [ $test_or[1] = 1 ]
		set fish_git_prompt ''	
	else
		set fish_git_prompt (__fish_git_prompt)
	end

	# printing the final prompt
	printf "%s%s%s@%s%s%s %s%s%s%s\n%s " (set_color $fish_color_user) $USER (set_color normal) (set_color $fish_color_host) (hostname -s)  (set_color normal) (set_color $fish_color_cwd) $pwd (set_color normal) $fish_git_prompt $prompt_symbol
end
