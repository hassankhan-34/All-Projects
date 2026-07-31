# DNS Troubleshooting

## Problem

DNS hostname resolution was not working correctly during the initial configuration.

## Symptoms

The client could not resolve internal hostnames such as:

dns-dhcp-server.lab.local

client1.lab.local

client2.lab.local

## Investigation

The DNS service status was checked using:

systemctl status named

The DNS port was checked using:

ss -tulpn | grep :53

The DNS configuration was verified using:

named-checkconf

The forward DNS zone was checked using:

named-checkzone lab.local /var/named/forward.lab.local

The reverse DNS zone was checked using:

named-checkzone 10.168.192.in-addr.arpa /var/named/reverse.lab.local

The client DNS configuration was checked using:

cat /etc/resolv.conf

The DNS server was tested using:

nslookup dns-dhcp-server.lab.local 192.168.10.2

## Findings

The DNS server required correct zone configuration and correct DNS records.

The clients also needed to use 192.168.10.2 as their DNS server.

## Verification

The DNS service was confirmed to be running.

The DNS server was listening on port 53.

The forward zone successfully resolved hostnames to IP addresses.

The reverse zone successfully resolved IP addresses to hostnames.

## Result

The DNS server successfully resolved internal hostnames.

Forward DNS resolution was successful.

Reverse DNS resolution was successful.