# Set the working application directory
# working_directory "/path/to/your/app"
working_directory "/home/gestcert/web/gestcert"

# Unicorn PID file location
# pid "/path/to/pids/unicorn.pid"
pid "/home/gestcert/web/gestcert/pids/unicorn.pid"

# Path to logs
# stderr_path "/path/to/log/unicorn.log"
# stdout_path "/path/to/log/unicorn.log"
stderr_path "/home/gestcert/web/gestcert/log/unicorn.log"
stdout_path "/home/gestcert/web/gestcert/log/unicorn.log"

# Unicorn socket
# listen "/tmp/unicorn.[app name].sock"
listen "/tmp/unicorn.gestcert.sock"

# Number of processes
# worker_processes 10
worker_processes 10

# Time-out
timeout 30
