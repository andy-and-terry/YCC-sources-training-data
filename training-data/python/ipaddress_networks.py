import ipaddress


if __name__ == "__main__":
    net = ipaddress.ip_network("192.168.1.0/28")
    print(net.netmask, net.broadcast_address, net.num_addresses)
    print([str(h) for h in list(net.hosts())[:3]])
    print(ipaddress.ip_address("192.168.1.5") in net)
    print(ipaddress.ip_address("10.0.0.1").is_private)
    print(list(ipaddress.ip_network("10.0.0.0/30").subnets(prefixlen_diff=1)))
    print(ipaddress.ip_address("::1").is_loopback, ipaddress.ip_address("::1").version)
    print(list(ipaddress.summarize_address_range(
        ipaddress.ip_address("10.0.0.0"), ipaddress.ip_address("10.0.0.255"))))
