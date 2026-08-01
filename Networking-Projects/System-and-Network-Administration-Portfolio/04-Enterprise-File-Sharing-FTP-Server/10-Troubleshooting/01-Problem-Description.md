# Problem Description

## Project

**Enterprise File Sharing & FTP Server**

## Environment

* Operating System: CentOS 7
* File Sharing Service: Samba
* FTP Service: vsftpd
* Server IP Address: `192.168.10.2`
* Samba Share: `SharedFiles`
* Samba Shared Directory: `/srv/samba/shared`
* FTP Port: `21`
* Samba Ports: `139`, `445`

---

## 1. Samba Service Access Problem

### Problem

The client was unable to access the Samba shared folder hosted on the CentOS server.

The client attempted to access:

```text
\\192.168.10.2\SharedFiles
```

The connection was unsuccessful.

### Symptoms

* Shared folder was not accessible.
* Client could not connect to the Samba server.
* Authentication could fail or the share could be unavailable.

### Possible Causes

* Samba service was not running.
* Firewall was blocking Samba traffic.
* Samba configuration contained errors.
* User was not authorized to access the share.
* Incorrect directory permissions.
* SELinux was preventing Samba from accessing the shared directory.

---

## 2. FTP Login Problem

### Problem

The FTP client was unable to log in to the CentOS FTP server.

The client attempted to connect to:

```text
ftp://192.168.10.2
```

### Symptoms

* FTP connection failed.
* User authentication failed.
* FTP service was unavailable.

### Possible Causes

* `vsftpd` service was not running.
* Incorrect username or password.
* Firewall was blocking FTP port `21`.
* Anonymous FTP configuration was incorrect.
* SELinux was preventing FTP access.
* User account was not properly configured.

---

## 3. FTP File Upload Problem

### Problem

The FTP user could log in successfully but could not upload files to the FTP server.

### Symptoms

* FTP login was successful.
* File download worked.
* File upload failed.

### Possible Causes

* `write_enable` was disabled.
* Incorrect directory permissions.
* User did not have write permission.
* SELinux restrictions.
* FTP configuration was incorrect.

---

## 4. Samba File Write Problem

### Problem

The client could access the Samba shared directory but could not create or modify files.

### Symptoms

* Samba share was accessible.
* Existing files could be read.
* New files could not be created.

### Possible Causes

* Incorrect Linux file permissions.
* Incorrect directory ownership.
* User was not a member of the `fileshare` group.
* Samba `read only` setting was enabled.
* Samba `writeable` setting was disabled.

---

## 5. Permission Denied Problem

### Problem

An unauthorized user attempted to access the Samba shared directory.

### Symptoms

* User was denied access.
* Authentication failed.
* Shared folder could not be opened.

### Possible Causes

* User was not a member of the `fileshare` group.
* Samba `valid users` restriction was working correctly.
* Incorrect Samba credentials were provided.

---

## 6. SELinux Access Problem

### Problem

Samba or FTP services were running, but users were unable to access files.

### Possible Causes

SELinux was enforcing security policies that prevented the services from accessing the required directories.

### Verification

Check SELinux status:

```bash
getenforce
```

Check Samba directory context:

```bash
ls -Zd /srv/samba/shared
```

Check FTP home directory policy:

```bash
getsebool ftp_home_dir
```

---

## 7. Firewall Connectivity Problem

### Problem

The Samba or FTP service was running on the server, but the client could not connect.

### Possible Causes

* Firewall was blocking FTP.
* Firewall was blocking Samba.
* Required services were not added to the firewall.

### Verification

```bash
firewall-cmd --list-services
```

The expected services were:

```text
ftp
samba
```

---

## Troubleshooting Approach

The troubleshooting process followed these steps:

1. Identify the problem.
2. Check service status.
3. Verify network connectivity.
4. Check firewall configuration.
5. Verify service configuration.
6. Check user authentication.
7. Check file and directory permissions.
8. Check SELinux configuration.
9. Apply the required solution.
10. Retest the service.
11. Document the result.
