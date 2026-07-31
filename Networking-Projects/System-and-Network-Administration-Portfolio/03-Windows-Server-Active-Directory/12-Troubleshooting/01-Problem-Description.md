# Troubleshooting Report – Windows Server & Active Directory Infrastructure Lab

## 1. Overview

During the implementation of the Windows Server 2016 and Active Directory Infrastructure Lab, several configuration and verification challenges were identified and investigated.

The purpose of this troubleshooting documentation is to record common issues that can occur in a Windows Server Active Directory environment and document the troubleshooting methodology used to identify and resolve them.

The troubleshooting process followed a structured approach:

1. Identify the problem.
2. Collect relevant information.
3. Check the configuration.
4. Test connectivity and services.
5. Identify the root cause.
6. Apply the appropriate solution.
7. Verify that the issue has been resolved.

---

## 2. Environment

| Component               | Configuration                              |
| ----------------------- | ------------------------------------------ |
| Operating System        | Windows Server 2016                        |
| Server Name             | DC01                                       |
| Domain                  | lab.local                                  |
| Server Role             | Domain Controller                          |
| Directory Service       | Active Directory Domain Services           |
| DNS Server              | Windows Server DNS                         |
| Virtualization Platform | VMware Workstation                         |
| Client Testing          | Not completed due to no Windows Client ISO |

---

## 3. Main Troubleshooting Areas

The following areas were reviewed during the project:

* DNS resolution
* Active Directory Domain Services
* Domain Controller health
* Active Directory users and groups
* Group Policy configuration
* Windows Server services
* Network connectivity
* Name resolution
* PowerShell-based verification

---

## 4. Troubleshooting Methodology

The following tools and commands were used or identified for troubleshooting:

```cmd
ipconfig /all
ping
nslookup
hostname
whoami
dcdiag
gpupdate /force
gpresult /r
```

PowerShell commands included:

```powershell
Get-Service
Get-ADDomain
Get-ADForest
Get-ADDomainController
Get-ADUser
Get-ADGroup
Get-ADOrganizationalUnit
```

Additional administrative tools included:

* Server Manager
* Active Directory Users and Computers
* DNS Manager
* Group Policy Management
* Event Viewer
* Services Console

---

## 5. Important Note

The Windows client domain-joining phase was not completed because a Windows 10/11 Pro client ISO was not available.

The server-side Active Directory infrastructure was configured and verified using the Windows Server 2016 Domain Controller.

The client domain-joining phase can be completed later by adding a Windows Pro client VM to the same VMware network and joining it to the `lab.local` domain.

---

## 6. Conclusion

The troubleshooting process helped verify the health and configuration of the Windows Server 2016 Active Directory environment.

The project demonstrated practical skills in:

* Windows Server administration
* Active Directory management
* DNS troubleshooting
* User and group management
* Group Policy administration
* Domain Controller diagnostics
* Service verification
* PowerShell-based system administration
