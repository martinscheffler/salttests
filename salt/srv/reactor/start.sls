# Execute hightstate (Make minion download desired states from master and execute them)
# data['id'] evaluates to the ID of the minion that triggered the start event
apply_highstate:
  local.state.highstate:
    - tgt: {{ data['id'] }}
