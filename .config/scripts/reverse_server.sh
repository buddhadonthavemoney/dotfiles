while true; do echo "Starting ncat on port 4242..."; ncat -lvp 4242 | tee /tmp/.reverse.log ; sleep 10 ; done 
