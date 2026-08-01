# Windows Server & Active Directory Infrastructure Lab

![Windows Server](https://img.shields.io/badge/Windows%20Server-2016-blue)
![Active Directory](https://img.shields.io/badge/Active%20Directory-AD%20DS-green)
![DNS](https://img.shields.io/badge/DNS-Configured-orange)
![VMware](https://img.shields.io/badge/Virtualization-VMware%20Workstation-purple)
![Status](https://img.shields.io/badge/Status-Completed-success)

## 📌 Project Overview

This project demonstrates the deployment, configuration, and administration of a **Windows Server 2016-based Active Directory infrastructure** in a virtualized VMware Workstation environment.

The project simulates a small enterprise network environment where a Windows Server 2016 system is configured as a **Domain Controller** for the `lab.local` Active Directory domain.

The laboratory covers **Active Directory Domain Services (AD DS), DNS, Organizational Units, User and Group Management, Group Policy, Domain Controller diagnostics, service verification, and troubleshooting**.

This project was developed as part of a **System & Network Administration Portfolio** to demonstrate practical Windows Server and enterprise infrastructure administration skills.

---

# 🎯 Project Objectives

The main objectives of this project were to:

* Install and configure Windows Server 2016.
* Configure a static IP address and server hostname.
* Deploy Active Directory Domain Services.
* Promote Windows Server to a Domain Controller.
* Create and configure the `lab.local` Active Directory domain.
* Configure and verify DNS services.
* Create Organizational Units for different departments.
* Create and manage Active Directory users.
* Create security groups and assign users.
* Configure Group Policy Objects.
* Implement basic security and user restrictions.
* Verify Active Directory and DNS functionality.
* Perform Domain Controller health diagnostics.
* Verify critical Windows Server services.
* Troubleshoot common Active Directory and DNS issues.
* Document the complete implementation process.

---

# 🏗️ Lab Environment

| Component             | Configuration                    |
| --------------------- | -------------------------------- |
| Server OS             | Windows Server 2016              |
| Virtualization        | VMware Workstation               |
| Server Name           | DC01                             |
| Domain                | `lab.local`                      |
| Server Role           | Domain Controller                |
| Directory Service     | Active Directory Domain Services |
| DNS                   | Windows Server DNS               |
| Network               | VMware Virtual Network           |
| Client Domain Joining | Not Completed                    |
| Client ISO            | Not Available                    |

---

# 🌐 Network Architecture

The basic laboratory architecture is:

```text
                    VMware Virtual Network
                            │
                            │
                            ▼
                 ┌─────────────────────┐
                 │       DC01          │
                 │  Windows Server 2016 │
                 │                     │
                 │  Active Directory   │
                 │  DNS Server         │
                 │  Domain Controller  │
                 └──────────┬──────────┘
                            │
                            ▼
                      Active Directory
                         lab.local
                            │
              ┌─────────────┼─────────────┐
              │             │             │
             IT            HR          Finance
              │             │             │
              └─────────────┼─────────────┘
                            │
                        Management
```


---

# ⚙️ Technologies & Tools

The following technologies and tools were used in this project:

* Windows Server 2016
* Active Directory Domain Services (AD DS)
* DNS Server
* Group Policy Management
* Active Directory Users and Computers
* Windows PowerShell
* Command Prompt
* Event Viewer
* Server Manager
* VMware Workstation

---

# 🏢 Active Directory Structure

The Active Directory environment was organized using Organizational Units.

```text
lab.local
│
├── IT
├── HR
├── Finance
├── Management
├── Workstations
└── Security-Groups
```

This structure provides logical separation of organizational resources and provides a foundation for applying department-specific Group Policies.

---

# 👤 User Management

Users were created and organized according to departmental roles.

Example structure:

```text
IT
├── it.admin
└── it.user

HR
├── hr.manager
└── hr.user

Finance
├── finance.manager
└── finance.user

Management
└── manager.user
```

---

# 👥 Security Groups

The following security groups were created:

```text
IT-Admins
IT-Users
HR-Users
Finance-Users
Management-Users
```

Users were assigned to appropriate groups based on their organizational roles.

This approach demonstrates the use of **role-based group management** in an Active Directory environment.

---

# 🛡️ Group Policy

The project includes the configuration of Group Policy Objects for centralized management.

The main GPOs include:

```text
Domain-Security-Policy
Desktop-Restrictions
User-Restrictions
```

The policies were designed to demonstrate:

* Password security
* Account lockout settings
* Desktop restrictions
* User restrictions
* Centralized security management

---

# 🌐 DNS Configuration

DNS was configured as an essential component of the Active Directory infrastructure.

The Active Directory domain is:

```text
lab.local
```

DNS testing was performed using:

```cmd
nslookup dc01.lab.local
```

```cmd
nslookup lab.local
```

```cmd
ping dc01.lab.local
```

DNS troubleshooting documentation is available in:

```text
13-Troubleshooting/02-DNS-Troubleshooting.md
```

---

# 🧪 Verification & Testing

The Active Directory infrastructure was verified using several tools and commands.

### Domain Verification

```cmd
echo %USERDNSDOMAIN%
```

```cmd
echo %USERDOMAIN%
```

```cmd
whoami
```

### Domain Controller Diagnostics

```cmd
dcdiag
```

### Network Verification

```cmd
ipconfig /all
```

```cmd
ping
```

### DNS Verification

```cmd
nslookup
```

### Active Directory PowerShell Verification

```powershell
Get-ADDomain
```

```powershell
Get-ADForest
```

```powershell
Get-ADDomainController
```

```powershell
Get-ADUser -Filter *
```

```powershell
Get-ADGroup -Filter *
```

```powershell
Get-ADOrganizationalUnit -Filter *
```

### Service Verification

```powershell
Get-Service NTDS,DNS,Netlogon,KDC,W32Time
```

---

# 🔧 Troubleshooting

The project includes dedicated troubleshooting documentation covering:

* DNS troubleshooting
* Active Directory troubleshooting
* Domain Controller diagnostics
* Group Policy troubleshooting
* Windows Server service verification
* Event Viewer investigation

The troubleshooting documentation is available in:

```text
13-Troubleshooting
```

The troubleshooting methodology followed this process:

```text
Identify Problem
       ↓
Collect Information
       ↓
Check Configuration
       ↓
Test Connectivity
       ↓
Identify Root Cause
       ↓
Apply Solution
       ↓
Verify Resolution
```

---

# ⚠️ Project Limitation

The Windows client domain-joining phase was not completed because a Windows 10/11 Pro client ISO was not available during the project implementation.

Therefore, the following activities remain as future extensions:

* Windows client VM deployment
* Windows client domain joining
* Domain user authentication from a client
* Client-side Group Policy testing
* Client-side domain authentication verification

The server-side Active Directory infrastructure was completed and verified using Windows Server 2016.

---

# 🚀 Future Improvements

The following improvements can be added to expand the laboratory:

* Add a Windows 10/11 Pro client VM.
* Join the client to the `lab.local` domain.
* Test domain authentication.
* Verify Group Policy application on clients.
* Deploy a second Domain Controller.
* Configure Active Directory replication.
* Integrate Linux systems with Active Directory.
* Configure Samba-based file sharing.
* Implement centralized backup and recovery.
* Add network and server monitoring.
* Integrate the environment with a NOC monitoring solution.

---

# 📚 Skills Demonstrated

This project demonstrates practical skills in:

### Windows Server Administration

* Windows Server 2016 deployment
* Server configuration
* Network configuration
* Windows services
* Server troubleshooting

### Active Directory

* Active Directory Domain Services
* Domain Controller deployment
* Domain management
* Organizational Unit design
* User management
* Security group management

### DNS

* DNS server configuration
* Forward lookup
* Reverse lookup
* DNS troubleshooting

### Group Policy

* GPO creation
* GPO management
* Security policy configuration
* User restrictions
* Desktop restrictions

### Troubleshooting

* Domain Controller diagnostics
* DNS troubleshooting
* Active Directory troubleshooting
* Group Policy troubleshooting
* Event Viewer analysis

### PowerShell

* Active Directory administration
* Service verification
* Domain information gathering
* User and group verification
* Organizational Unit verification

---

# 📊 Project Status

| Component                        | Status           |
| -------------------------------- | ---------------- |
| Windows Server 2016 Installation | ✅ Completed      |
| Initial Server Configuration     | ✅ Completed      |
| Network Configuration            | ✅ Completed      |
| Active Directory Domain Services | ✅ Completed      |
| Domain Controller                | ✅ Completed      |
| `lab.local` Domain               | ✅ Completed      |
| DNS Configuration                | ✅ Completed      |
| Organizational Units             | ✅ Completed      |
| User Management                  | ✅ Completed      |
| Security Groups                  | ✅ Completed      |
| Group Policy                     | ✅ Completed      |
| Active Directory Verification    | ✅ Completed      |
| Troubleshooting Documentation    | ✅ Completed      |
| Windows Client Domain Joining    | ⏸️ Not Completed |
| Final Documentation              | ✅ Completed      |

---

# 📄 Project Documentation

The complete project report is available in:

```text
15-Final-Report
```

Files include:

* `Windows-Server-Active-Directory-Infrastructure-Lab-Final-Report.docx`
* `Windows-Server-Active-Directory-Infrastructure-Lab-Final-Report.pdf`

---

# 🎓 Learning Outcomes

After completing this project, the following practical skills were developed:

* Deploying Windows Server in a virtual environment.
* Configuring a Windows Server Domain Controller.
* Creating and managing an Active Directory domain.
* Configuring DNS for Active Directory.
* Creating Organizational Units.
* Managing users and security groups.
* Applying centralized Group Policy.
* Diagnosing Domain Controller health.
* Verifying Windows Server services.
* Troubleshooting Active Directory and DNS issues.
* Using PowerShell for administrative tasks.
* Documenting enterprise infrastructure projects.

---

# 🔗 Related Projects

This project is part of a larger **System & Network Administration Portfolio** consisting of:

1. **CentOS DHCP & DNS Server Administration Lab**
2. **Linux Server Administration & Web Services Lab**
3. **Windows Server & Active Directory Infrastructure Lab** ← This Project
4. **Enterprise Linux & Windows Integration Lab**
5. **Enterprise File Sharing & FTP Server Lab**
6. **NOC Monitoring & Network Operations Lab**

---

# 👨‍💻 Author

**Hassan Khan**

System & Network Administration Portfolio

Focused on:

* System Administration
* Network Administration
* Linux Administration
* Windows Server Administration
* Active Directory
* DNS & DHCP
* Infrastructure Monitoring
* Cybersecurity

---

# 📌 Disclaimer

This project was created as a **virtualized educational laboratory environment** for learning and portfolio development.

The infrastructure is not intended to represent a production enterprise deployment. Configuration values and network settings may differ from real-world enterprise environments.

