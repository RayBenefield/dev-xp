function fish_prompt
  # Cache exit status
  set -l last_status $status

  # Just calculate these once, to save a few cycles when displaying the prompt
  if not set -q __fish_prompt_hostname
    set -g __fish_prompt_hostname (hostname|cut -d . -f 1)
  end
  if not set -q __fish_prompt_char
    switch (id -u)
      case 0
    set -g __fish_prompt_char '#'
      case '*'
    set -g __fish_prompt_char 'λ'
    end
  end

  # Setup colors
  #use extended color pallete if available
#if [[ $terminfo[colors] -ge 256 ]]; then
#    turquoise="%F{81}"
#    orange="%F{166}"
#    purple="%F{135}"
#    hotpink="%F{161}"
#    limegreen="%F{118}"
#else
#    turquoise="%F{cyan}"
#    orange="%F{yellow}"
#    purple="%F{magenta}"
#    hotpink="%F{red}"
#    limegreen="%F{green}"
#fi
  set -l normal (set_color normal)
  set -l white (set_color FFFFFF)
  set -l black (set_color 333333)
  set -l cyan (set_color cyan)
  set -l bgcyan (set_color -b cyan)
  set -l bgnormal (set_color -b normal)
  set -l turquoise (set_color 5fdfff)
  set -l orange (set_color df5f00)
  set -l hotpink (set_color df005f)
  set -l blue (set_color blue)
  set -l bgblue (set_color -b blue)
  set -l limegreen (set_color 87ff00)
  set -l purple (set_color af5fff)
 
  # Configure __fish_git_prompt
  set -g __fish_git_prompt_char_stateseparator ' '
  set -g __fish_git_prompt_color 5fdfff
  set -g __fish_git_prompt_color_flags df5f00
  set -g __fish_git_prompt_color_prefix white
  set -g __fish_git_prompt_color_suffix white
  set -g __fish_git_prompt_showdirtystate true
  set -g __fish_git_prompt_showuntrackedfiles true
  set -g __fish_git_prompt_showstashstate true
  set -g __fish_git_prompt_show_informative_status true 
 
  set -l dir (pwd | string replace '/' '' | string replace -i 'Users/RayBenefield/' '' | string replace -i 'home/RayBenefield' '🐧 ' | string replace 'mnt/c' '🌎 ' | string replace -i 'Development/dev-xp' 'Dev XP' | string replace -i 'Dropbox/My PC (Ray-PC)/Documents/My Games/CORE/Saved/Maps' '🎮' | string replace -a '/' '  ')

  # Line 1
  echo -n $cyan╭$black$bgcyan $USER $bgblue$cyan $dir $bgnormal$blue$turquoise
  set -l git_branch (git branch ^/dev/null | sed -n '/\* /s///p')
  echo 〖$git_branch〗

  # Line 2
  echo -n $cyan'╰→' $normal
end
