# Troubleshooting Summary

## Project
CentOS DHCP and DNS Server Administration Lab

## Environment

Server:
CentOS Linux

Server IP:
192.168.10.2

Network:
192.168.10.0/24

DHCP Service:
dhcpd

DNS Service:
BIND (named)

Clients:
CentOS Client 1
CentOS Client 2

## Problems Encountered

During the project implementation, several configuration and connectivity issues were encountered.

### Problem 1 — Server Could Not Reach the Gateway

The CentOS server was configured with the IP address 192.168.10.2 and default gateway 192.168.10.1. However, the server returned "Destination Host Unreachable" when attempting to ping the gateway.

### Problem 2 — Internet Connectivity Was Not Available

The server was unable to ping 8.8.8.8 and could not resolve external domain names.

### Problem 3 — DHCP Service Was Listening on Multiple Interfaces

The DHCP service showed the expected DHCP listener on ens33 but the system also had the default libvirt virbr0 interface running dnsmasq.

### Problem 4 — DHCP Client Configuration

The CentOS clients initially required correct network configuration to obtain IP addresses automatically from the DHCP server.

### Problem 5 — DNS Resolution

DNS records and client DNS configuration had to be verified to ensure that hostnames could be resolved correctly.

## Troubleshooting Approach

The troubleshooting process followed these steps:

1. Check physical and virtual network connectivity.
2. Verify VMware network configuration.
3. Check network interface status.
4. Verify IP address configuration.
5. Verify routing table.
6. Test gateway connectivity.
7. Check DHCP service status.
8. Check DHCP logs and leases.
9. Check DNS service status.
10. Verify DNS zone configuration.
11. Test forward DNS resolution.
12. Test reverse DNS resolution.
13. Verify client connectivity.