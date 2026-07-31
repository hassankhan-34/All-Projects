# Troubleshooting Solutions

## Solution 1 Network Connectivity

### Problem

The CentOS server could not reach the gateway at 192.168.10.1.

### Checks Performed

The network interface was checked.

The IP address was verified.

The routing table was checked using:

ip route

The VMware VMnet1 configuration was verified.

The server IP configuration was verified.

### Correct Configuration

Server IP:
192.168.10.2

Subnet Mask:
255.255.255.0

Network:
192.168.10.0/24

Gateway:
192.168.10.1

### Result

The network configuration was verified and corrected where necessary.

---

## Solution 2 DHCP Interface Configuration

### Problem

The DHCP service detected the virbr0 interface.

### Cause

The CentOS server had a default libvirt virtual bridge named virbr0.

The interface used dnsmasq and was separate from the project network.

### Solution

The DHCP server was configured with a subnet declaration for the project network:

192.168.10.0/24

The DHCP service was verified on the required network interface.

### Verification

The DHCP service was checked using:

systemctl status dhcpd

The DHCP port was checked using:

ss -ulpn | grep :67

### Result

The DHCP server successfully operated on the project network.

---

## Solution 3 DNS Configuration

### Problem

DNS hostname resolution was not working.

### Cause

The DNS service or zone configuration required verification.

### Solution

The BIND configuration was validated using:

named-checkconf

The forward zone was validated using:

named-checkzone

The reverse zone was validated using:

named-checkzone

The DNS service was restarted using:

systemctl restart named

### Result

The DNS server successfully resolved internal hostnames.

---

## Solution 4 Client DNS Configuration

### Problem

The client could access the network but could not resolve internal hostnames.

### Cause

The client was not using the CentOS DNS server.

### Solution

The DHCP configuration was updated to provide:

DNS Server:
192.168.10.2

DNS Domain:
lab.local

The client network connection was renewed.

### Verification

The following command was used:

cat /etc/resolv.conf

The client was verified to use:

nameserver 192.168.10.2

### Result

The client successfully resolved internal DNS records.

---

## Final Result

After troubleshooting and correcting the configuration:

DHCP Service:
Working

DNS Service:
Working

Client IP Assignment:
Working

Forward DNS Resolution:
Working

Reverse DNS Resolution:
Working

Client-to-Server Connectivity:
Working

Client-to-Client Connectivity:
Working

The CentOS DHCP and DNS Server Administration Lab was successfully completed.
