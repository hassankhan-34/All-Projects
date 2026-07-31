# Linux Server Administration & Web Services Lab

## 📌 Project Overview

This project demonstrates the deployment, configuration, administration, security, and troubleshooting of a **CentOS 7 Linux server** in a virtualized environment.

The objective of this project was to gain practical hands-on experience in Linux server administration and web service management. The server was configured with a static IP address and used to implement various system administration tasks, secure remote access, Apache web services, virtual hosting, system management, testing, and troubleshooting.

The project also demonstrates the ability to identify and resolve common Linux server and web service issues through structured troubleshooting and verification.

---

## 🎯 Project Objectives

The main objectives of this project were to:

* Install and configure a CentOS Linux server.
* Configure hostname and static IP addressing.
* Configure repositories and package management.
* Create and manage Linux users and groups.
* Configure passwords and sudo privileges.
* Manage files, directories, ownership, and permissions.
* Configure Access Control Lists (ACLs).
* Configure SSH for remote server administration.
* Configure firewalld and manage network ports.
* Understand and configure SELinux.
* Install and configure Apache HTTP Server.
* Deploy websites on a Linux server.
* Configure Apache Virtual Hosts.
* Host multiple websites on one Linux server.
* Manage Linux processes and system services.
* Monitor disk usage and system resources.
* Analyze system and Apache logs.
* Perform network and web service testing.
* Simulate and troubleshoot service failures.
* Restore failed services and verify successful recovery.

---

# 🖥️ Server Environment

| Component             | Configuration                |
| --------------------- | ---------------------------- |
| Operating System      | CentOS 7                     |
| Hostname              | `linuxsrv`                   |
| IP Address            | `192.168.10.2`               |
| Server Role           | Linux Server / Web Server    |
| Web Server            | Apache HTTP Server           |
| HTTP Port             | `80`                         |
| Remote Administration | SSH                          |
| Firewall              | firewalld                    |
| Security              | SELinux                      |
| Virtual Hosts         | `site1.local`, `site2.local` |
| Virtualization        | VMware Virtual Machine       |

---

# 🏗️ Project Architecture

The overall project environment was designed as follows:

```text
                    ┌─────────────────────────┐
                    │      Client System      │
                    │    Windows / Browser    │
                    └────────────┬────────────┘
                                 │
                           HTTP / SSH
                                 │
                                 ▼
                    ┌─────────────────────────┐
                    │     CentOS 7 Server     │
                    │                         │
                    │ Hostname: linuxsrv      │
                    │ IP: 192.168.10.2        │
                    ├─────────────────────────┤
                    │                         │
                    │ SSH Remote Access       │
                    │ Apache Web Server       │
                    │ Firewall (firewalld)    │
                    │ SELinux                 │
                    │ User & Group Management │
                    │ File Permissions & ACL  │
                    │ System Administration   │
                    │ Logging & Monitoring    │
                    └────────────┬────────────┘
                                 │
                    ┌────────────┴────────────┐
                    │                         │
                    ▼                         ▼
             ┌──────────────┐         ┌──────────────┐
             │ site1.local  │         │ site2.local  │
             │              │         │              │
             │ Virtual Host │         │ Virtual Host │
             └──────────────┘         └──────────────┘
```

---


---

# 🔧 Project Modules

## 01 Project Documentation

This section contains the planning and documentation files for the project.

It includes:

* Project Overview
* Project Objectives
* System Requirements
* Network Configuration
* Configuration Notes

---

## 02 Linux Server Setup

The CentOS 7 Linux server was installed and configured.

Tasks included:

* CentOS installation
* Hostname configuration
* Static IP configuration
* Repository configuration

Server IP:

```text
192.168.10.2
```

Hostname:

```text
linuxsrv
```

---

## 03 User & Group Administration

Linux account management was implemented.

Tasks included:

* User creation
* Group creation
* Group membership
* Password management
* Sudo privileges

This section demonstrates basic Linux identity and access management.

---

## 04 File System Permissions

Linux filesystem security was configured.

Tasks included:

* Directory management
* File permissions
* Ownership management
* Group ownership
* ACL configuration

Commands such as `chmod`, `chown`, `chgrp`, `setfacl`, and `getfacl` were used.

---

## 05 SSH Remote Administration

SSH was configured to enable secure remote administration of the Linux server.

Tasks included:

* SSH installation
* SSH configuration
* Remote login testing
* SSH troubleshooting

Remote access was tested using the server IP:

```text
192.168.10.2
```

---

## 06 Firewall & SELinux

Linux security mechanisms were configured and tested.

Tasks included:

* firewalld configuration
* Port management
* SELinux configuration
* Security testing

HTTP port 80 was configured for Apache web services.

---

## 07 Apache Web Server

The Apache HTTP Server was installed and configured.

Tasks included:

* Apache installation
* Web server configuration
* Website deployment
* Web server testing

Apache configuration was verified using:

```bash
sudo apachectl configtest
```

Expected result:

```text
Syntax OK
```

---

## 08 Virtual Hosting

Apache Virtual Hosting was implemented to host multiple websites on a single Linux server.

Configured virtual hosts:

```text
site1.local
site2.local
```

Each website was configured with its own document root and Virtual Host configuration.

Both websites were tested successfully.

---

## 09 System Administration

This module focused on ongoing Linux server administration.

Tasks included:

* Process management
* Systemd service management
* Disk management
* Log management

Linux commands were used to monitor system processes, services, disk usage, and logs.

---

## 10 Testing & Troubleshooting

The server and services were tested to verify proper operation.

Testing included:

* IP configuration testing
* Network connectivity testing
* Gateway testing
* SSH testing
* Apache service testing
* Port 80 verification
* Website testing
* Virtual Host testing

A controlled Apache service failure was also simulated.

The troubleshooting process included:

```text
Identify Problem
      ↓
Check Service Status
      ↓
Check Port 80
      ↓
Test Apache Configuration
      ↓
Identify Root Cause
      ↓
Restore Apache
      ↓
Verify Service
      ↓
Verify Websites
```

The detailed troubleshooting documentation is available in:

```text
10-Testing-Troubleshooting/04-Troubleshooting-Evidence/Troubleshooting-Report.md
```

---

# 📸 Screenshots & Evidence

The project includes screenshots documenting the practical implementation and testing of the Linux server environment.

Evidence is organized into categories including:

* Server Configuration
* User Management
* File Permissions
* SSH
* Firewall
* SELinux
* Apache
* Virtual Hosts
* Testing

The screenshots provide visual evidence of the configuration and successful operation of the implemented services.

---


---

# 🛠️ Troubleshooting Highlights

During the project, an Apache Virtual Host configuration error was encountered.

The Apache configuration returned an error related to an unmatched:

```text
</VirtualHost>
```

The configuration files were reviewed and corrected.

The configuration was then tested using:

```bash
sudo apachectl configtest
```

The final result was:

```text
Syntax OK
```

A separate Apache service failure was also simulated.

The service was stopped intentionally:

```bash
sudo systemctl stop httpd
```

The problem was diagnosed by checking the service status and HTTP port.

The Apache service was then restored:

```bash
sudo systemctl start httpd
```

The service and websites were successfully verified after recovery.

Detailed troubleshooting information can be found in:

```text
10-Testing-Troubleshooting/04-Troubleshooting-Evidence/Troubleshooting-Report.md
```

---

# 🎓 Skills Demonstrated

This project demonstrates practical knowledge of:

### Linux Administration

* CentOS 7
* Linux command line
* User management
* Group management
* File permissions
* Ownership
* ACLs
* Process management
* Systemd
* Disk management
* Log management

### Networking

* IPv4 configuration
* Static IP addressing
* Gateway configuration
* Connectivity testing
* Port verification
* SSH

### Security

* SSH security
* firewalld
* Port management
* SELinux
* File permissions
* Access Control Lists

### Web Services

* Apache HTTP Server
* Website deployment
* Virtual Hosts
* HTTP port management
* Web service testing

### Troubleshooting

* Service status analysis
* Port troubleshooting
* Configuration validation
* Log analysis
* Root cause identification
* Service recovery
* Post-recovery verification

---

# 📊 Project Outcome

The project successfully produced a functional CentOS Linux server environment capable of:

* Providing secure remote administration through SSH.
* Managing users and groups.
* Enforcing file and directory permissions.
* Providing controlled access using ACLs.
* Protecting services using firewalld and SELinux.
* Hosting websites using Apache.
* Hosting multiple websites using Virtual Hosts.
* Monitoring and managing system services.
* Managing processes and storage.
* Analyzing system and web server logs.
* Detecting and troubleshooting service failures.
* Recovering failed services and verifying successful operation.

---

---

# 🏁 Final Status

**Project Status: COMPLETED SUCCESSFULLY ✅**

This project demonstrates practical hands-on experience in **Linux Server Administration, Apache Web Services, Virtual Hosting, Server Security, System Management, and Troubleshooting**.

It serves as a practical portfolio project for roles such as:

* Linux System Administrator
* Junior System Administrator
* Network Administrator
* NOC Engineer
* IT Support Engineer
* Infrastructure Support Engineer
* Server Support Engineer

---

## 👨‍💻 Author

**Hassan Khan**

**BS Information Technology**

---

## 📌 Project Type

**Hands-on Linux Server Administration & Web Services Lab**

---

## 🔖 Technologies & Tools

```text
CentOS 7
Linux
Apache HTTP Server
SSH
firewalld
SELinux
Systemd
ACL
Bash / Linux CLI
VMware
```

---

## ⭐ Project Highlights

```text
✓ Linux Server Deployment
✓ Static IP Configuration
✓ User & Group Management
✓ File Permissions & ACLs
✓ SSH Remote Administration
✓ Firewall Configuration
✓ SELinux
✓ Apache Web Server
✓ Apache Virtual Hosting
✓ Multiple Website Hosting
✓ System Administration
✓ Log Management
✓ Network & Web Testing
✓ Troubleshooting & Service Recovery
```

**End of Project Documentation**
