# Cisco Route Redistribution Mega Lab

## 📌 Overview

This project demonstrates a large-scale Cisco networking lab that implements **Route Redistribution** across multiple routing protocols. The lab is designed in Cisco IOS and includes **40 routers**, **78 networks**, and multiple routing domains connected through redistribution.

The objective is to provide complete end-to-end communication between all networks using proper redistribution techniques.

---

## 🛠 Technologies Used

- Cisco IOS
- EVE-NG / Cisco Packet Tracer (Compatible)
- OSPF
- EIGRP
- RIP Version 2

---

## 🌐 Network Information

| Item | Details |
|------|---------|
| Total Routers | 40 |
| Total Networks | 78 |
| OSPF Areas | 0, 1, 2, 3 |
| EIGRP AS | 100 & 50 |
| RIP Version | Version 2 |

---

## 📖 Routing Protocols

- OSPF Process ID 10
- EIGRP Autonomous System 100
- RIP Version 2
- EIGRP Autonomous System 50

---

## 🔀 Route Redistribution

Redistribution is configured between different routing domains to achieve full connectivity.

### Redistribution Points

- OSPF ↔ EIGRP 100
- EIGRP 100 ↔ RIP v2
- RIP v2 ↔ EIGRP 50
- Static Routes → EIGRP 50

---

## ⚙ Features

- Multi-Protocol Routing
- Route Redistribution
- Static Route Redistribution
- End-to-End Connectivity
- Routing Table Verification
- Ping Testing
- Large Enterprise Topology

---

## 🧪 Verification Commands

```bash
show ip route
show ip route summary
show running-config
ping
```

---

## 📂 Project Structure

```
Route_Redistribution_Mega_Lab.pdf
README.md
```

---

## 📸 Lab Includes

- Complete Network Topology
- IP Addressing Table
- Router Configuration
- Redistribution Commands
- Routing Verification
- Ping Test Results

---

## 🎯 Learning Outcomes

- Configure OSPF
- Configure EIGRP
- Configure RIP v2
- Perform Route Redistribution
- Verify Routing Tables
- Troubleshoot Connectivity

---

## 📄 Report

The complete lab report is available in:

`Route_Redistribution_Mega_Lab.pdf`

---

## 👨‍💻 Author

**Hassan Khan**

---

## ⭐ Repository Purpose

This repository is created for learning Cisco Enterprise Routing, Route Redistribution, and networking lab practice.
