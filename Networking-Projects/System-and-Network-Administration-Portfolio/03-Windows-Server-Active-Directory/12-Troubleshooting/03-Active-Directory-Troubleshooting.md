# Active Directory Troubleshooting – Windows Server 2016

## 1. Problem Description

Active Directory Domain Services is responsible for centralized authentication, authorization, user management, computer management, and directory services.

Problems with Active Directory can affect:

* User authentication
* User and group management
* Domain Controller operations
* Group Policy
* Domain services
* DNS integration

---

## 2. Troubleshooting Steps

### Step 1 – Verify Active Directory Domain

Run:

```powershell
Get-ADDomain
```

Verify that the correct domain is displayed:

```text
lab.local
```

---

### Step 2 – Verify Domain Controller

Run:

```powershell
Get-ADDomainController
```

Verify that the Domain Controller is listed correctly.

Expected server:

```text
DC01
```

---

### Step 3 – Run Domain Controller Diagnostics

Run:

```cmd
dcdiag
```

Review the results for:

```text
PASS
FAIL
WARNING
```

Pay particular attention to:

* Connectivity
* DNS
* Services
* Advertising
* SystemLog

---

### Step 4 – Check Active Directory Services

Run:

```powershell
Get-Service NTDS,Netlogon,KDC,DNS
```

The required services should be running.

Important services include:

```text
NTDS
Netlogon
KDC
DNS
```

---

### Step 5 – Verify Active Directory Users

Run:

```powershell
Get-ADUser -Filter * | Select Name,SamAccountName
```

Verify that expected users are present.

Users should be organized in their appropriate Organizational Units.

---

### Step 6 – Verify Organizational Units

Run:

```powershell
Get-ADOrganizationalUnit -Filter * | Select Name
```

Verify that the required OUs exist.

Expected OUs include:

```text
IT
HR
Finance
Management
Workstations
Security-Groups
```

---

### Step 7 – Verify Security Groups

Run:

```powershell
Get-ADGroup -Filter * | Select Name,GroupScope,GroupCategory
```

Verify the required security groups.

Expected groups include:

```text
IT-Admins
IT-Users
HR-Users
Finance-Users
Management-Users
```

---

## 3. Common Causes of Active Directory Problems

Common causes include:

* DNS misconfiguration.
* NTDS service stopped.
* Netlogon service stopped.
* Incorrect server network configuration.
* Incorrect Domain Controller configuration.
* Missing Active Directory objects.
* Incorrect user permissions.
* Incorrect group membership.

---

## 4. Resolution

Recommended corrective actions include:

1. Verify DNS configuration.
2. Check required Active Directory services.
3. Run `dcdiag`.
4. Verify Domain Controller configuration.
5. Check Active Directory Users and Computers.
6. Verify users and groups.
7. Review Event Viewer for errors.

---

## 5. Event Viewer Investigation

Open:

```text
Event Viewer
→ Applications and Services Logs
→ Directory Service
```

Also check:

```text
Windows Logs
→ System
```

Review errors and warnings related to:

* Active Directory
* DNS
* Netlogon
* Kerberos
* System services

---

## 6. Verification

After troubleshooting, verify:

```cmd
dcdiag
```

Then run:

```powershell
Get-ADDomain
```

And:

```powershell
Get-ADDomainController
```

Confirm that the Domain Controller is operating normally.

---

## 7. Conclusion

Active Directory troubleshooting requires checking multiple components because AD DS depends on DNS, networking, authentication services, and Windows system services.

The troubleshooting process demonstrated practical skills in:

* Active Directory diagnostics
* PowerShell administration
* Domain Controller verification
* Service management
* Event Viewer investigation
* User and group verification
