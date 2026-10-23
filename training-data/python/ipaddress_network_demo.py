import ipaddress

net = ipaddress.ip_network("192.168.10.0/28")
print(net.network_address, net.broadcast_address, net.num_addresses)
print([str(h) for h in list(net.hosts())[:3]])

addr = ipaddress.ip_address("192.168.10.5")
print(addr in net, addr.is_private, addr.version)

print([str(s) for s in net.subnets(prefixlen_diff=1)])
print(ipaddress.ip_interface("10.0.0.7/24").network)
print(ipaddress.ip_address("::1").is_loopback)

try:
    ipaddress.ip_address("300.1.1.1")
except ValueError as e:
    print("invalid:", e)
