# CentOS DHCP & DNS Server Administration Lab

A practical Linux Server Administration and Network Services project built using **CentOS Linux** and **VMware Workstation**.

This project demonstrates the deployment, configuration, integration, testing, and troubleshooting of **DHCP and DNS services** in a virtualized network environment.

The project includes a CentOS server providing centralized DHCP and DNS services to two CentOS client systems through a VMware Host-Only network.

---

## 📌 Project Overview

The objective of this project is to build a complete Linux-based network services environment using CentOS.

The main server is configured with a static IP address and provides:

- DHCP Server
- DNS Server
- Forward DNS Resolution
- Reverse DNS Resolution
- DHCP-DNS Integration

Two CentOS client systems are configured to obtain their network configuration automatically through DHCP and use the CentOS server as their DNS server.

The project also includes network testing, service verification, troubleshooting, and complete technical documentation.

---

## 🎯 Project Objectives

The main objectives of this project are:

- Install and configure CentOS Linux in VMware Workstation.
- Configure a VMware Host-Only virtual network.
- Configure a static IP address on the CentOS server.
- Install and configure a DHCP server.
- Create and configure a DHCP IP address pool.
- Automatically assign IP addresses to client systems.
- Install and configure BIND DNS.
- Create a forward DNS zone.
- Create a reverse DNS zone.
- Configure A and PTR DNS records.
- Integrate DHCP and DNS services.
- Configure CentOS clients as DHCP clients.
- Test forward and reverse DNS resolution.
- Verify server and client connectivity.
- Troubleshoot network, DHCP, and DNS issues.
- Document the complete implementation process.

---

## 🏗️ Network Architecture

The project uses a VMware Host-Only network with the following architecture:

```text
                         VMware Workstation
                                │
                         VMnet1 Host-Only
                         192.168.10.0/24
                                │
             ┌──────────────────┼──────────────────┐
             │                  │                  │
             ▼                  ▼                  ▼
      CentOS Server        CentOS Client 1    CentOS Client 2
      DHCP + DNS              DHCP Client        DHCP Client
      192.168.10.2                 │                  │
             │                     │                  │
             │                     └────────┬─────────┘
             │                              │
             ▼                              ▼
       DHCP Service                   Dynamic IP
       DNS Service                    Configuration
