function fish_prompt
  set -l last_status $status
  set -l values " $USER" " $(cat /etc/hostname)" " $PWD"
  set -l value_term "▓▒░"
  set -l colors blue black yellow black green black red black
  set -l value_count (count $values)

  set -l prompt_status " OK"
  set -l status_bg $colors[5]
  set -l status_fg $colors[6]

  if test $last_status -ne 0
    set status_bg $colors[7]
    set status_fg $colors[8]
    set prompt_status " KO [$last_status]"
  end

  echo -ne "$(set_color -b $status_bg)$(set_color $status_fg) $prompt_status "
  echo -ne "$(set_color -b $colors[1])$(set_color $status_bg)$value_term"

  for index in (seq 1 $value_count)
    set -l osc1 (math \($index + 1\) % 2 \* 2 + 1)
    set -l osc2 (math $index % 2 \* 2 + 1)

    set -l bg1 (set_color -b $colors[$osc1])
    set -l bg2 (set_color -b $colors[$osc2])
    set -l fg1 (set_color $colors[(math $osc1 + 1)])
    set -l fg2 (set_color $colors[$osc1])

    if test $index -eq $value_count; set bg2 (set_color normal); end

    echo -ne "$bg1$fg1 $values[$index] $bg2$fg2$value_term"
  end

  echo -ne "\n$(set_color reset) "
end
