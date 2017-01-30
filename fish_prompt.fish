# disable shortening of path but keep replacement of $HOME with ~
set -g fish_prompt_pwd_dir_length 0

function _segment
	set_color $argv[1]
	echo -n -s "[" $argv[2..-1] "]"
	set_color normal
end

function _git_branch_name
	echo (command git symbolic-ref HEAD ^/dev/null | sed -e 's|^refs/heads/||')
end

function _is_git_dirty
	echo (command git status -s --ignore-submodules=dirty ^/dev/null)
end

function _root_segment
	set -l uid (id -u $USER)
	if test $uid -eq 0
		_segment red "⚡︎"
	end
end

function _path_segment
	_segment cyan (prompt_pwd)
end

function _git_segment
	if test (_git_branch_name)
		set -l git_branch (_git_branch_name)
		_segment blue $git_branch

		if test (_is_git_dirty)
			_segment yellow "±"
		end
	end
end

function _prompt_segment
	if test $last_status = 0
		set_color green
	else
		set_color red
		echo -n "[$last_status]"
	end

	echo ""
	echo -n "› "
end

function fish_prompt
	set -g last_status $status

	echo "" 						# start with empty line
	_root_segment 					# display if we're root (sudo)
	_path_segment 					# display current path
	type -q git; and _git_segment 	# display git repo info
	_prompt_segment 				# display prompt

	set_color normal
end
