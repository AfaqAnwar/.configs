function fish_prompt
    set -l rosewater  '#f5e0dc'
    set -l flamingo   '#f2cdcd'
    set -l pink       '#f5c2e7'
    set -l mauve      '#cba6f7'
    set -l red        '#f38ba8'
    set -l maroon     '#eba0ac'
    set -l peach      '#fab387'
    set -l yellow     '#f9e2af'
    set -l green      '#a6e3a1'
    set -l teal       '#94e2d5'
    set -l sky        '#89dceb'
    set -l sapphire   '#74c7ec'
    set -l blue       '#89b4fa'
    set -l lavender   '#b4befe'
    set -l text       '#cdd6f4'
    set -l overlay2   '#9399b2'
    set -l surface1   '#45475a'
    set -l base       '#1e1e2e'

    set -l ACCENT  $mauve
    set -l ERR     $red
    set -l CWD_C   $sapphire
    set -l GIT_C   $lavender

    set -l last_status $status
    set -l pointer_color $ACCENT
    test $last_status -ne 0; and set pointer_color $ERR

    set -q __fish_git_prompt_showupstream; or set -g __fish_git_prompt_showupstream auto
    if not set -q VIRTUAL_ENV_DISABLE_PROMPT
        set -g VIRTUAL_ENV_DISABLE_PROMPT true
    end

    set -l prompt_git (fish_git_prompt '%s')
    test -n "$prompt_git"; and set -l git_segment (string trim -- " $prompt_git")

    set_color $CWD_C
    printf '%s' (prompt_pwd --dir-length=0)
    set_color normal

    if test -n "$git_segment"
        printf ' '
        set_color $GIT_C -d
        printf '%s' $git_segment
        set_color normal
    end

    printf ' '
    set_color $pointer_color
    printf '> '
    set_color normal
end
