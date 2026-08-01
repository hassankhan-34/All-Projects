
# NOC Incident Response & Troubleshooting Lab

![EVE-NG](https://img.shields.io/badge/EVE--NG-Network%20Simulation-blue)
![Zabbix](https://img.shields.io/badge/Zabbix-Network%20Monitoring-red)
![Cisco IOS](https://img.shields.io/badge/Cisco%20IOS-Networking-orange)
![Kali Linux](https://img.shields.io/badge/Kali%20Linux-Monitoring-black)
![NOC](https://img.shields.io/badge/NOC-Incident%20Response-green)

## 📌 Project Overview

This project is an end-to-end **Network Operations Center (NOC) monitoring and incident response simulation** built using **EVE-NG, Cisco IOS, Kali Linux, and Zabbix**.

The lab demonstrates infrastructure monitoring, NOC dashboarding, alert detection, network troubleshooting, root cause analysis, incident resolution, recovery verification, and incident documentation.

The environment was designed to simulate realistic network failures across different levels of the infrastructure:

1. **Single-host outage**
2. **Core gateway outage**
3. **WAN link outage**

The incidents were detected using **Zabbix ICMP monitoring** and investigated using network troubleshooting tools and Cisco IOS commands. Each incident followed a structured NOC incident response lifecycle:

```text
Detection
    ↓
Triage
    ↓
Diagnostics
    ↓
Root Cause Analysis
    ↓
Remediation
    ↓
Verification
    ↓
Reporting
```

---

# 🎯 Project Objectives

The main objectives of this project were:

* Build a simulated NOC environment using EVE-NG.
* Configure Cisco IOS network devices for monitoring.
* Deploy Zabbix monitoring on Kali Linux.
* Configure host monitoring in Zabbix.
* Monitor network and end devices using ICMP.
* Create a centralized NOC dashboard.
* Configure availability monitoring and alerts.
* Simulate realistic network incidents.
* Detect incidents through Zabbix.
* Perform structured incident triage.
* Investigate network failures using CLI tools.
* Identify the root cause of each incident.
* Apply appropriate remediation.
* Verify service recovery.
* Document incidents using a structured incident response process.

---

# 🏗️ Lab Architecture

The lab topology consists of an ISP router connected to a Home Router through a WAN link.

The Home Router provides LAN connectivity through a switch, which connects multiple end-user PCs.

The Kali Linux system hosts the Zabbix monitoring environment.

```text
                         WAN / ISP Network
                              │
                              │
                       ┌──────▼──────┐
                       │   ISP-R1    │
                       │  10.0.0.1   │
                       └──────┬──────┘
                              │
                         WAN Link
                              │
                       ┌──────▼──────┐
                       │  Home-R1    │
                       │ 192.168.1.1 │
                       └──────┬──────┘
                              │
                              │ LAN
                              │
                       ┌──────▼──────┐
                       │     SW1     │
                       │ 192.168.1.2 │
                       └──┬───┬───┬──┘
                          │   │   │
                         PC1 PC2 PC3
                          │
                          │
                  ┌───────▼────────┐
                  │ Kali Linux /   │
                  │ Zabbix Server  │
                  │ 192.168.1.10   │
                  └────────────────┘
```

---

# 🌐 IP Addressing

| Device              | Interface / Role  | IP Address        |
| ------------------- | ----------------- | ----------------- |
| ISP-R1              | WAN               | `8.8.8.8/24`      |
| ISP-R1              | Link to Home-R1   | `10.0.0.1/24`     |
| Home-R1             | WAN               | `10.0.0.2/24`     |
| Home-R1             | LAN Gateway       | `192.168.1.1/24`  |
| SW1                 | VLAN 1            | `192.168.1.2`     |
| Kali Linux / Zabbix | Monitoring Server | `192.168.1.10/24` |
| PC1                 | LAN Client        | DHCP              |
| PC2                 | LAN Client        | DHCP              |
| PC3                 | LAN Client        | DHCP              |

The project document specifies the EVE-NG topology with ISP-R1, Home-R1, SW1, PC1–PC3, and the Kali Linux/Zabbix monitoring server.

---

# 📊 Zabbix Monitoring

Zabbix was deployed on Kali Linux and used as the central monitoring platform.

The Zabbix web interface was used to configure the monitoring environment.

## Host Groups

Two host groups were created:

```text
Network Devices
End Devices
```

## Monitored Hosts

The following devices were added to Zabbix:

```text
ISP-Router
Home-Router
Switch
PC1
PC2
PC3
```

## Monitoring Method

The standard ICMP Ping template was linked to the monitored hosts for availability monitoring.

The monitoring system was used to detect:

* Device availability.
* ICMP reachability.
* Packet loss.
* Device outages.
* Recovery events.

The Zabbix configuration and baseline included host groups, monitored hosts, ICMP monitoring, and a dashboard with Host Availability and Problems widgets.

---

# 📈 NOC Dashboard

A Zabbix dashboard was created to provide centralized visibility into the lab infrastructure.

The dashboard included:

* Host Availability widget.
* Network Devices group.
* End Devices group.
* Problems widget.
* Warning and higher severity problems.

Before beginning the incident simulations, all monitored devices were verified as operational.

This established a healthy baseline for the incident response exercises.

---

# 🚨 Incident Response Scenarios

Three incidents were simulated sequentially.

The incidents increased in scope and severity:

```text
INC-001
Single Host Failure
        ↓
INC-002
Core Gateway Failure
        ↓
INC-003
WAN Link Failure
```

This allowed the project to demonstrate troubleshooting at three different infrastructure levels.

---

# 🔴 INC-001 — Host Connectivity Failure

## Incident Information

| Field       | Details                   |
| ----------- | ------------------------- |
| Incident ID | `INC-001`                 |
| Title       | Host Connectivity Failure |
| Target      | PC2                       |
| Detection   | Zabbix ICMP Ping Trigger  |
| Severity    | Host-level outage         |

## Symptom

Zabbix generated an alert indicating that PC2 was unreachable.

The impact was limited to a single host, while other network devices remained operational.

## Investigation

An ICMP test was performed from the Kali NOC workstation to PC2.

The test showed:

```text
100% Packet Loss
```

The switch interface connected to PC2 was then checked.

The interface was found to be down, indicating a simulated physical disconnection or interface shutdown.

## Root Cause

The root cause was identified as:

```text
Physical or logical interface drop on the access-layer switch port
```

## Resolution

The switch port was re-enabled or the interface connection was restored.

## Verification

Recovery was verified by:

* Confirming ICMP replies from PC2.
* Checking Zabbix status.
* Confirming the recovery notification.

## Status

```text
RESOLVED
```

The incident demonstrated how a NOC analyst can isolate a single-host failure without incorrectly assuming that the entire network is down.

---

# 🔴 INC-002 — Core Gateway Outage

## Incident Information

| Field       | Details                  |
| ----------- | ------------------------ |
| Incident ID | `INC-002`                |
| Title       | Core Gateway Outage      |
| Target      | Home-Router              |
| IP Address  | `192.168.1.1`            |
| Detection   | Zabbix ICMP Ping Trigger |
| Severity    | High / Critical          |

## Symptom

Multiple alerts were triggered simultaneously.

The outage affected the LAN and prevented outbound connectivity.

The Home-Router was identified as the common gateway and a **Single Point of Failure (SPOF)** for downstream hosts.

## Investigation

The incident was analyzed by looking at the pattern of simultaneous failures across the LAN.

The Home-Router was identified as the common dependency for the affected systems.

A console connection to the router confirmed that the router process or node was down.

## Root Cause

The root cause was:

```text
Home-Router node was shut down or suspended,
removing the default gateway for the entire LAN segment.
```

## Resolution

The router process was restarted and the core link was re-enabled.

## Verification

Recovery was verified by:

```bash
ping 192.168.1.1
```

The downstream hosts automatically cleared their Zabbix alerts within approximately 120 seconds.

## Status

```text
RESOLVED
```

This incident demonstrated the importance of recognizing common failure patterns and identifying a core gateway or single point of failure.

---

# 🔴 INC-003 — WAN Link Outage

## Incident Information

| Field       | Details                       |
| ----------- | ----------------------------- |
| Incident ID | `INC-003`                     |
| Title       | WAN Link Outage               |
| Target Link | Home-R1 ↔ ISP-R1              |
| WAN Network | `10.0.0.0/24`                 |
| Detection   | Zabbix ICMP / Edge Monitoring |
| Severity    | High                          |

## Symptom

Zabbix reported that ISP-R1 was unreachable.

At the same time:

* PC1 remained reachable.
* PC2 remained reachable.
* PC3 remained reachable.
* Home-Router remained reachable.

This indicated that the local LAN was operational and the problem was likely beyond the LAN.

## Investigation

A traceroute was performed from Kali Linux toward:

```text
10.0.0.1
```

The trace reached:

```text
Home-Router
192.168.1.1
```

After that point, the trace timed out.

The Home-Router CLI was then checked using:

```text
show ip interface brief
```

The WAN interface was found to be:

```text
up/down
```

This indicated a WAN link or line protocol problem.

## Root Cause

The root cause was:

```text
WAN link failure between Home-R1 and ISP-R1.
```

The failure simulated an upstream provider issue or physical WAN interface/link failure.

## Resolution

The WAN connection between Home-Router and ISP-R1 was restored.

## Verification

Recovery was verified using:

```text
show ip route
```

Routing table convergence was confirmed.

Zabbix also confirmed that ISP-R1 became reachable again.

## Status

```text
RESOLVED
```

This incident demonstrated troubleshooting beyond the local LAN by using traceroute and Cisco IOS interface and routing commands.

---

# 🔧 Troubleshooting Methodology

The project followed a structured troubleshooting process.

```text
1. Detect the Alert
        ↓
2. Identify the Scope
        ↓
3. Perform Initial Triage
        ↓
4. Test Connectivity
        ↓
5. Isolate the Failure Domain
        ↓
6. Identify Root Cause
        ↓
7. Apply Remediation
        ↓
8. Verify Recovery
        ↓
9. Document the Incident
```

The troubleshooting tools used included:

```text
ping
traceroute
show ip interface brief
show ip route
Zabbix Dashboard
Zabbix Alerts
```

The approach demonstrated the ability to distinguish between:

* Single-host failures.
* Core gateway failures.
* WAN edge failures.

---

# 🧪 Incident Summary

| Incident | Failure Type              | Impact                             | Root Cause                              | Status   |
| -------- | ------------------------- | ---------------------------------- | --------------------------------------- | -------- |
| INC-001  | Host Connectivity Failure | Single host                        | Access-layer switch port/interface drop | Resolved |
| INC-002  | Core Gateway Outage       | Entire LAN / outbound connectivity | Home-Router shutdown/suspension         | Resolved |
| INC-003  | WAN Link Outage           | External/WAN connectivity          | WAN link between Home-R1 and ISP-R1     | Resolved |

---

# 🛠️ Tools and Technologies

The project used the following tools and technologies:

* EVE-NG
* Cisco IOS
* Kali Linux
* Zabbix
* ICMP
* SNMP
* Ping
* Traceroute
* Cisco IOS CLI
* Network monitoring
* Incident response
* Root cause analysis

The project documentation specifically identifies EVE-NG, Cisco IOS, Kali Linux, and Zabbix as the primary technologies used in the lab.

---

# 💡 Skills Demonstrated

This project demonstrates practical skills in:

### Network Monitoring

* Zabbix monitoring.
* ICMP availability monitoring.
* Host monitoring.
* Alert detection.
* Dashboard configuration.

### NOC Operations

* Incident detection.
* Incident triage.
* Failure isolation.
* Incident prioritization.
* Incident response lifecycle.

### Network Troubleshooting

* Ping testing.
* Traceroute analysis.
* Cisco IOS troubleshooting.
* Interface status verification.
* Routing table verification.
* WAN troubleshooting.

### Root Cause Analysis

* Single-host failure identification.
* Single Point of Failure identification.
* LAN versus WAN failure isolation.
* Access-layer troubleshooting.
* Core gateway troubleshooting.
* WAN edge troubleshooting.

### Documentation

* Incident reporting.
* Root cause documentation.
* Resolution documentation.
* Recovery verification.
* NOC workflow documentation.

---


---

# 📊 Project Results

The NOC simulation successfully demonstrated:

* Centralized infrastructure monitoring.
* Zabbix-based availability detection.
* NOC dashboard visibility.
* Alert-driven incident response.
* Single-host outage troubleshooting.
* Core gateway outage troubleshooting.
* WAN failure troubleshooting.
* Root cause identification.
* Incident remediation.
* Recovery verification.
* Professional incident documentation.

All three simulated incidents were successfully resolved and verified.

---

# 🚀 Future Improvements

The monitoring environment can be expanded with:

* SNMP-based monitoring for deeper device metrics.
* CPU and memory monitoring.
* Interface utilization monitoring.
* Interface error monitoring.
* Automated alert notifications.
* Email or messaging integrations.
* Syslog integration.
* Network performance monitoring.
* More complex failure simulations.
* DHCP failure scenarios.
* NAT failure scenarios.
* Redundant gateway configurations.
* High-availability network design.

---

# 🏁 Conclusion

This project demonstrates a realistic **NOC monitoring and incident response workflow** across three distinct network failure scenarios.

The lab successfully demonstrated how a NOC analyst can use Zabbix to detect infrastructure failures, perform initial triage, isolate the affected part of the network, investigate the root cause, apply remediation, verify recovery, and document the incident.

The three scenarios covered:

```text
Single Endpoint Outage
        ↓
Core Gateway / SPOF Outage
        ↓
WAN Edge Outage
```

Each incident was successfully detected, investigated, resolved, verified, and documented.

The project demonstrates practical experience with **Zabbix monitoring, EVE-NG network simulation, Cisco IOS troubleshooting, ICMP monitoring, network diagnostics, root cause analysis, and structured NOC incident response**.

This project is suitable as part of a professional **Network Administrator / NOC Analyst portfolio** and demonstrates hands-on experience with the incident lifecycle expected in a network operations environment.

---

## 👨‍💻 Author

**Hassan Khan**

Aspiring Network / NOC Analyst

### Core Skills Demonstrated

`EVE-NG` • `Cisco IOS` • `Zabbix` • `Kali Linux` • `Network Monitoring` • `ICMP` • `SNMP` • `Incident Response` • `Root Cause Analysis` • `Network Troubleshooting` • `NOC Operations`
