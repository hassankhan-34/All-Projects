# Solutions and Verification

## 1. Samba Service Solution

### Problem

The Samba share was unavailable or inaccessible from the client.

### Solution

The Samba service was checked and started:

```bash
systemctl start smb
```

The service was enabled:

```bash
systemctl enable smb
```

The configuration was validated:

```bash
testparm
```

### Verification

The Samba service was confirmed to be running:

```bash
systemctl status smb
```

The client was able to access:

```text
\\192.168.10.2\SharedFiles
```

### Result

**Status: Resolved**

The Samba shared folder was successfully accessible to authorized users.

---

## 2. Samba Permission Solution

### Problem

Users were unable to create or modify files in the shared directory.

### Solution

The directory ownership was configured:

```bash
chown -R root:fileshare /srv/samba/shared
```

Permissions were configured:

```bash
chmod -R 2770 /srv/samba/shared
```

Users were added to the authorized group:

```bash
usermod -aG fileshare hassan
usermod -aG fileshare ali
```

### Verification

The group membership was checked:

```bash
id hassan
```

```bash
id ali
```

The directory permissions were checked:

```bash
ls -ld /srv/samba/shared
```

### Result

**Status: Resolved**

Authorized users were able to read and write files in the Samba shared directory.

---

## 3. Samba SELinux Solution

### Problem

SELinux could prevent Samba from accessing the shared directory.

### Solution

The correct SELinux context was configured:

```bash
semanage fcontext -a -t samba_share_t "/srv/samba/shared(/.*)?"
```

The context was applied:

```bash
restorecon -Rv /srv/samba/shared
```

### Verification

```bash
ls -Zd /srv/samba/shared
```

The directory was verified to have the appropriate Samba SELinux context.

### Result

**Status: Resolved**

SELinux was configured to allow Samba to access the shared directory.

---

## 4. FTP Service Solution

### Problem

The FTP service was unavailable or clients could not connect.

### Solution

The FTP service was started:

```bash
systemctl start vsftpd
```

The service was enabled:

```bash
systemctl enable vsftpd
```

The service was restarted after configuration:

```bash
systemctl restart vsftpd
```

### Verification

```bash
systemctl status vsftpd
```

Port `21` was checked:

```bash
ss -tulpn | grep :21
```

### Result

**Status: Resolved**

The FTP server was running and listening for client connections.

---

## 5. FTP Firewall Solution

### Problem

The FTP server was running, but clients could not connect.

### Solution

FTP was added to the firewall:

```bash
firewall-cmd --permanent --add-service=ftp
```

The firewall was reloaded:

```bash
firewall-cmd --reload
```

### Verification

```bash
firewall-cmd --query-service=ftp
```

Expected:

```text
yes
```

### Result

**Status: Resolved**

The firewall allowed FTP connections through port `21`.

---

## 6. Samba Firewall Solution

### Problem

The Samba service was running, but clients could not access the shared folder.

### Solution

Samba was allowed through the firewall:

```bash
firewall-cmd --permanent --add-service=samba
```

The firewall was reloaded:

```bash
firewall-cmd --reload
```

### Verification

```bash
firewall-cmd --query-service=samba
```

Expected:

```text
yes
```

### Result

**Status: Resolved**

The firewall allowed Samba client connections.

---

## 7. FTP SELinux Solution

### Problem

FTP users could log in but could have restricted access to their home directories due to SELinux.

### Solution

FTP home directory access was enabled:

```bash
setsebool -P ftp_home_dir on
```

### Verification

```bash
getsebool ftp_home_dir
```

Expected:

```text
ftp_home_dir --> on
```

### Result

**Status: Resolved**

SELinux was configured to permit FTP users to access their home directories.

---

## 8. FTP Upload Solution

### Problem

The FTP user could log in but could not upload files.

### Solution

FTP write access was enabled in `/etc/vsftpd/vsftpd.conf`:

```ini
write_enable=YES
```

The user's home directory ownership was verified:

```bash
chown -R hassan:hassan /home/hassan
```

### Verification

The user successfully uploaded a test file.

The server was checked with:

```bash
ls -l /home/hassan
```

### Result

**Status: Resolved**

The FTP user was able to upload and download files successfully.

---

# Final Verification

The completed Enterprise File Sharing and FTP Server project was verified through the following tests:

| Test                   | Result     |
| ---------------------- | ---------- |
| CentOS Server Network  | Successful |
| Samba Service          | Successful |
| Samba Authentication   | Successful |
| Samba Read Access      | Successful |
| Samba Write Access     | Successful |
| FTP Service            | Successful |
| FTP Authentication     | Successful |
| FTP Upload             | Successful |
| FTP Download           | Successful |
| Firewall Configuration | Successful |
| Linux Permissions      | Successful |
| Samba Access Control   | Successful |
| FTP User Restrictions  | Successful |
| SELinux Configuration  | Successful |

---

# Final Project Result

The CentOS server successfully provided two enterprise file-sharing services:

1. **Samba** for authenticated network file sharing.
2. **vsftpd** for authenticated FTP file transfers.

Users were authenticated using Linux and Samba accounts. Access was controlled through Linux permissions, group membership, Samba configuration, firewall rules, and SELinux policies.

The project demonstrated practical skills in:

* Linux server administration
* User and group management
* File and directory permissions
* Samba configuration
* FTP server configuration
* Firewall management
* SELinux configuration
* Client-server connectivity
* File transfer testing
* Troubleshooting and documentation

The final environment provided a functional and controlled file-sharing infrastructure suitable for a small enterprise lab environment.
