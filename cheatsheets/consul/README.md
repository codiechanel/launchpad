# Consul start guide

---

## running consule

`edit /etc/dhcp/dhclient.conf`

## add consul dns

`prepend domain-name-servers x.x.x.x, y.y.y.y;`

## Name servers

###### we cnt edit /etc/resolv.conf directly so we should edit /etc/resolv.conf

`nameserver 127          
and docker bridge ip`

 i forgot something

---

## Start Consul

`docker run -d -p 8500:8500 -p 172.17.0.1:53:8600/udp -p 8400:8400 gliderlabs/consul-server -node myconsul -bootstrap`

## Start Registrator

`docker run -d -v /var/run/docker.sock:/tmp/docker.sock --net=host gliderlabs/registrator -internal consul://localhost:8500`

## Web UI

[`http://consul:8500`](http://consul:8500)

