# openbfdd

Upstream: https://github.com/dyninc/OpenBFDD
WIKI: https://github.com/dyninc/OpenBFDD/wiki

### OpenBFDD Container

### Usage

This needs bridge mode as the BFD packets don't play well with NAT due to asymmetric flows.

You can interact with the bfdd-beacon using the bfdd-control command within the container.

# Running the container
```
docker run -d --name openbfdd \
  -v /opt/openbfdd/openbfdd.conf:/etc/openbfdd.conf \
  --net=host \
  biwhite/openbfdd
```

# Config
This container runs bfdd-daemon from openbfdd, reading a config file in /etc/openbfdd.conf.
The file contains sets of commands as per bfdd-control syntax.

# Get status of sessions
```docker exec openbfdd bfdd-control status```

# Other bfdd-control commands
Documented at http://dyninc.github.io/OpenBFDD/bfdd-control.8.html

# Restart
The config file will be re-read each time the daemon starts.

```docker exec openbfdd killall  bfdd-beacon```
