function cat --wraps='bat --paging never --style plain -f' --description 'alias cat=bat --paging never --style plain -f'
  bat --paging never --style plain -f $argv; 
end
