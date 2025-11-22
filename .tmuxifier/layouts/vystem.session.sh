# Set a custom session root path. Default is `$HOME`.
# Must be called before `initialize_session`.
session_root "~/Developer/work/vystem-platform/"

# Create session with specified name if it does not already exist. If no
# argument is given, session name will be based on layout file name.
if initialize_session "vystem-platform"; then

  new_window "nvim"
  run_cmd "cursor ."
  run_cmd "nvim"

  new_window "servers"
  run_cmd "cd backend/"
  run_cmd "npm run dev"

  select_pane 0
  split_v 50

  run_cmd "cd frontend/"
  run_cmd "yarn dev"

  new_window "redis"
  run_cmd "redis-server"

  select_window "servers"

fi

# Finalize session creation and switch/attach to it.
finalize_and_go_to_session
