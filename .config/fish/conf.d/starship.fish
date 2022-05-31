if not status is-interactive && test "$CI" != true
    exit
end
eval (starship init fish)
