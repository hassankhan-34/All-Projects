
# Enterprise File Sharing & FTP Server

![Linux](https://img.shields.io/badge/Linux-CentOS%207-red)
![Samba](https://img.shields.io/badge/File%20Sharing-Samba-blue)
![FTP](https://img.shields.io/badge/FTP-vsftpd-green)
![Networking](https://img.shields.io/badge/Networking-TCP%2FIP-orange)
![Security](https://img.shields.io/badge/Security-SELinux%20%7C%20Firewall-purple)

## 📌 Project Overview

This project demonstrates the design, configuration, and administration of an enterprise-style **File Sharing and FTP Server environment** using **CentOS 7**.

The project was developed as part of a **System & Network Administration portfolio** to demonstrate practical skills in Linux server administration, user and group management, network file sharing, FTP services, permissions, firewall configuration, SELinux, client-server communication, and troubleshooting.

The CentOS server provides two primary file transfer and sharing services:

* **Samba** Network file sharing for authenticated users.
* **vsftpd** FTP service for file uploads and downloads.

The environment was tested using a client computer connected to the same network as the CentOS server.

---

# 🎯 Project Objectives

The main objectives of this project were to:

* Configure a CentOS 7 server for enterprise file sharing.
* Create and manage Linux users and groups.
* Configure Samba for network file sharing.
* Configure an FTP server using vsftpd.
* Implement user authentication.
* Configure Linux file and directory permissions.
* Configure Samba access control.
* Configure FTP user restrictions.
* Configure firewall rules.
* Configure SELinux policies.
* Test file sharing from a client computer.
* Test file uploads and downloads.
* Troubleshoot common Samba and FTP problems.
* Document the complete implementation process.

---

# 🏗️ Network Architecture

The project uses a simple client-server architecture.

```text
                         Lab Network
                     192.168.10.0/24
                             │
                 ┌───────────┴───────────┐
                 │                       │
                 │                       │
        ┌────────▼─────────┐    ┌────────▼─────────┐
        │   CentOS Server  │    │    Client PC     │
        │                   │    │                  │
        │  IP: 192.168.10.2 │    │  Same Network    │
        │                   │    │                  │
        │  Samba Server     │◄───┤  Samba Client    │
        │  vsftpd Server    │◄───┤  FTP Client      │
        │                   │    │                  │
        └───────────────────┘    └──────────────────┘
```

### Server Information

| Parameter        | Configuration       |
| ---------------- | ------------------- |
| Operating System | CentOS 7            |
| Server IP        | `192.168.10.2`      |
| Network          | `192.168.10.0/24`   |
| File Sharing     | Samba               |
| FTP Server       | vsftpd              |
| FTP Port         | `21`                |
| Samba Ports      | `139`, `445`        |
| Shared Directory | `/srv/samba/shared` |
| Samba Share      | `SharedFiles`       |
| User Group       | `fileshare`         |

---

# 👥 User and Group Management

The project uses a dedicated Linux group to control access to the Samba shared directory.

### Group

```text
fileshare
```

### Users

```text
hassan
ali
```

Both users were added to the `fileshare` group.

```text
fileshare
│
├── ahmad
└── ali
```

The group-based access model ensures that only authorized users can access the Samba shared directory.

---

# 📂 Samba File Sharing

Samba was configured to provide authenticated network file sharing.

### Shared Directory

```text
/srv/samba/shared
```

### Samba Share

```text
SharedFiles
```

### Client Access

From a Windows client:

```text
\\192.168.10.2\SharedFiles
```

The Samba share was configured with:

* Authenticated user access.
* Group-based authorization.
* Read and write permissions.
* `fileshare` group restriction.
* Linux file permissions.
* Samba access controls.

Example configuration:

```ini
[SharedFiles]
    path = /srv/samba/shared
    browseable = yes
    writable = yes
    read only = no
    valid users = @fileshare
    force group = fileshare
    create mask = 0660
    directory mask = 2770
```

---

# 📡 FTP Server

The project uses **vsftpd (Very Secure FTP Daemon)** to provide FTP-based file transfers.

The FTP server allows authenticated users to:

* Log in using Linux user credentials.
* Upload files.
* Download files.
* Access their FTP environment.

Anonymous FTP access was disabled.

### FTP Server

```text
ftp://192.168.10.2
```

### FTP Port

```text
21
```

Important security settings included:

```ini
anonymous_enable=NO
local_enable=YES
write_enable=YES
chroot_local_user=YES
allow_writeable_chroot=YES
```

---

# 🔐 Security and Permissions

Security was implemented at multiple levels.

## Linux Permissions

The Samba shared directory was configured with:

```text
2770
```

Ownership:

```text
root:fileshare
```

This ensures:

* Owner has full access.
* Members of `fileshare` have full access.
* Other users have no access.

---

## Samba Access Control

Samba access was restricted using:

```ini
valid users = @fileshare
```

Only users belonging to the `fileshare` group were authorized to access the shared directory.

---

## FTP Security

The FTP server was configured with:

```ini
anonymous_enable=NO
```

This prevents anonymous users from accessing the FTP server.

Authenticated local users were allowed to access the FTP service.

---

## Firewall

The CentOS firewall was configured to allow the required services.

Allowed services:

```text
samba
ftp
```

FTP uses:

```text
Port 21
```

Samba uses:

```text
Ports 139 and 445
```

---

## SELinux

SELinux was considered during the server configuration.

For Samba, the shared directory was assigned the appropriate SELinux context:

```text
samba_share_t
```

For FTP home-directory access:

```text
ftp_home_dir --> on
```

This ensured that SELinux security policies did not prevent legitimate Samba and FTP operations.

---

# 🧪 Testing and Verification

The project was tested from both the server and client sides.

### Samba Testing

* Samba service status verified.
* Samba configuration validated using `testparm`.
* Samba users verified.
* Samba authentication tested.
* Shared folder accessed from client.
* File read operation tested.
* File write operation tested.

### FTP Testing

* vsftpd service verified.
* FTP port 21 verified.
* FTP authentication tested.
* File upload tested.
* File download tested.

### Security Testing

* Linux permissions verified.
* Directory ownership verified.
* Samba group-based access verified.
* Unauthorized access tested.
* Firewall rules verified.
* SELinux configuration verified.

---

# 📊 Test Results

| Test                          | Result       |
| ----------------------------- | ------------ |
| Server Network Connectivity   | ✅ Successful |
| Samba Installation            | ✅ Successful |
| Samba Service                 | ✅ Successful |
| Samba Authentication          | ✅ Successful |
| Samba Read Test               | ✅ Successful |
| Samba Write Test              | ✅ Successful |
| FTP Installation              | ✅ Successful |
| FTP Service                   | ✅ Successful |
| FTP Authentication            | ✅ Successful |
| FTP Upload                    | ✅ Successful |
| FTP Download                  | ✅ Successful |
| User and Group Management     | ✅ Successful |
| Linux Permissions             | ✅ Successful |
| Samba Access Control          | ✅ Successful |
| FTP Restrictions              | ✅ Successful |
| Firewall Configuration        | ✅ Successful |
| SELinux Configuration         | ✅ Successful |
| Troubleshooting Documentation | ✅ Completed  |

---

# 🛠️ Troubleshooting

Common troubleshooting areas covered in this project include:

### Samba

* Samba service failures.
* Invalid Samba configuration.
* User authentication problems.
* Group membership issues.
* File permission problems.
* Firewall connectivity problems.
* SELinux restrictions.

### FTP

* vsftpd service failures.
* FTP authentication issues.
* Port 21 connectivity problems.
* File upload failures.
* File permission issues.
* Firewall restrictions.
* SELinux restrictions.

Detailed troubleshooting documentation is available in:

```text
10-Troubleshooting/
```

---

# 🧰 Technologies and Tools

* CentOS 7
* Linux
* Samba
* vsftpd
* VMware / Virtualization Environment
* Windows/Linux Client
* SSH
* systemd
* firewalld
* SELinux
* TCP/IP
* FTP
* SMB/CIFS

---

# 💡 Skills Demonstrated

This project demonstrates practical experience with:

* Linux Server Administration
* CentOS Server Configuration
* User and Group Management
* Samba File Sharing
* FTP Server Administration
* vsftpd Configuration
* File and Directory Permissions
* Linux Ownership Management
* Firewall Configuration
* SELinux Administration
* Client-Server Networking
* Authentication and Access Control
* File Transfer Testing
* Network Troubleshooting
* Service Monitoring
* Technical Documentation

---

# 📚 Key Commands Used

### System Administration

```bash
systemctl status
systemctl start
systemctl restart
systemctl enable
```

### User Management

```bash
useradd
passwd
usermod
id
groups
```

### Group Management

```bash
groupadd
getent group
```

### Samba

```bash
smbpasswd
pdbedit
testparm
smbclient
```

### FTP

```bash
ftp
systemctl status vsftpd
```

### Permissions

```bash
chmod
chown
ls -l
stat
getfacl
```

### Firewall

```bash
firewall-cmd
```

### SELinux

```bash
getenforce
getsebool
setsebool
semanage
restorecon
```

---

# 🚀 Future Improvements

The project can be further enhanced by implementing:

* Secure FTP using FTPS.
* SSH File Transfer Protocol (SFTP).
* Automated backups.
* Centralized authentication using Active Directory.
* Integration with LDAP.
* RAID-based storage.
* Storage quotas.
* Audit logging.
* Centralized monitoring.
* Integration with a NOC monitoring system.
* High availability and redundancy.

---

# 📄 Documentation

The complete project documentation includes:

* Project Overview
* Project Objectives
* IP Addressing Plan
* Network Topology
* Server Configuration
* User and Group Management
* Samba Configuration
* FTP Configuration
* Client Configuration
* File Access Testing
* Security and Permissions
* Troubleshooting Documentation
* Final Project Report

---

# 🏁 Conclusion

This project successfully implemented an enterprise-style **File Sharing and FTP Server environment using CentOS 7**.

The environment provided authenticated network file sharing through **Samba** and file transfer capabilities through **vsftpd**. Security was strengthened through Linux permissions, group-based access control, firewall rules, FTP restrictions, and SELinux policies.

The project demonstrates practical knowledge of **Linux system administration, network services, file sharing, FTP, security configuration, troubleshooting, and technical documentation**, making it a valuable addition to a **System and Network Administration portfolio**.

---

## 👨‍💻 Author

**Hassan Khan**

System & Network Administration Portfolio

Skills demonstrated through this project:

`Linux` • `CentOS` • `Samba` • `FTP` • `Networking` • `Firewall` • `SELinux` • `System Administration` • `Troubleshooting`
