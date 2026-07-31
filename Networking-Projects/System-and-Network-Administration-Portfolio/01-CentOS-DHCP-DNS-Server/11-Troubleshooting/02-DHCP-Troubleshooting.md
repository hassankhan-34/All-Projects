# DHCP Troubleshooting

## Problem

The DHCP clients were not initially receiving the expected IP configuration automatically.

## Symptoms

The client did not receive the expected IP address from the DHCP server.

The DHCP server also displayed the following message:

"Ignoring requests on virbr0."

## Investigation

The DHCP service was checked using:

systemctl status dhcpd

The DHCP logs were checked using:

journalctl -u dhcpd --no-pager -n 30

The DHCP listening ports were checked using:

ss -ulpn | grep :67

The DHCP configuration was checked using:

cat /etc/dhcp/dhcpd.conf

The available network interfaces were checked using:

nmcli device status

## Findings

The CentOS server contained multiple network interfaces:

ens33
ens36
virbr0

The DHCP server was configured for the 192.168.10.0/24 network on ens33.

The virbr0 interface was part of the default libvirt virtual networking environment and was running dnsmasq.

The DHCP service correctly listened on the ens33 interface for the configured 192.168.10.0/24 network.

## Verification

The DHCP service was verified using:

systemctl status dhcpd

The DHCP service was confirmed to be running.

The DHCP port was verified using:

ss -ulpn | grep :67

The DHCP client configuration was verified using:

ip addr show ens33

The DHCP lease database was checked using:

cat /var/lib/dhcpd/dhcpd.leases

## Result

The DHCP server successfully provided IP addresses to the CentOS clients.

The clients successfully received network configuration from the DHCP server.