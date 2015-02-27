# docker
# Autogenerated from man page /usr/share/man/man1/docker.1.gz
# using Deroffing man parser
complete -c docker -s D --description '   Enable debug mode.  Default is false.'
complete -c docker -l help --description '  Print usage statement.'
complete -c docker -s H -l host --description 'unix://[/path/to/socket] to use.'
complete -c docker -l api-enable-cors --description '  Enable CORS headers in the remote API.  Default is false.'
complete -c docker -s b --description '  Attach containers to a pre-existing network b… [See Man Page]'
complete -c docker -l bip --description '  Use the provided CIDR notation address for th… [See Man Page]'
complete -c docker -s d --description '  Enable daemon mode.  Default is false.'
complete -c docker -l dns --description '  Force Docker to use specific DNS servers.'
complete -c docker -s g --description '  Path to use as the root of the Docker runtime.'
complete -c docker -l fixed-cidr --description '  IPv4 subnet for fixed IPs (e. g. , 10. 20. 0.'
complete -c docker -l fixed-cidr-v6 --description '  IPv6 subnet for global IPv6 addresses (e. g.'
complete -c docker -l icc --description '  Allow unrestricted inter-container and Docker… [See Man Page]'
complete -c docker -l ip --description '  Default IP address to use when binding container ports.'
complete -c docker -l ip-forward --description '  Docker will enable IP forwarding.  Default is true.'
complete -c docker -l ip-masq --description '  Enable IP masquerading for bridge\'s IP range.'
complete -c docker -l iptables --description '  Disable Docker\'s addition of iptables rules.'
complete -c docker -l ipv6 --description '  Enable IPv6 support.  Default is false.'
complete -c docker -s l -l log-level --description '  Set the logging level.  Default is info.'
complete -c docker -l label --description '  Set key=value labels to the daemon (displayed… [See Man Page]'
complete -c docker -l mtu --description '  Set the containers network mtu.  Default is 1500.'
complete -c docker -s p --description '  Path to use for daemon PID file.  Default is /var/run/docker.'
complete -c docker -l registry-mirror --description '  Prepend a registry mirror to be used for image pulls.'
complete -c docker -s s --description '  Force the Docker runtime to use a specific storage driver.'
complete -c docker -l storage-opt --description '  Set storage driver options.  See STORAGE DRIVER OPTIONS.'
complete -c docker -s v --description '  Print version information and quit.  Default is false.'
complete -c docker -l selinux-enabled --description '  Enable selinux support.  Default is false.'

