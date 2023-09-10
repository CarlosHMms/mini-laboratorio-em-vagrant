      apt-get update
      apt-get -y install net-tools
      
      sudo sysctl -w net.ipv4.ip_forward=1
      sudo iptables -t nat -A POSTROUTING -o enp0s3 -j MASQUERADE