#!/usr/bin/env puma

environment 'production'
daemonize true

pidfile 'tmp/pids/puma.pid'
state_path 'tmp/pids/puma.state'

stdout_redirect 'log/puma.log', 'log/puma_err.log'

threads 0, 16
bind 'unix://tmp/sockets/puma.sock'

activate_control_app 'unix://tmp/sockets/pumactl.sock'
