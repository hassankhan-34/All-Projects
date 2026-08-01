# FTP Troubleshooting Guide

## 1. Check FTP Service

Check the status of vsftpd:

```bash
systemctl status vsftpd
```

If the service is stopped:

```bash
systemctl start vsftpd
```

Enable it at system startup:

```bash
systemctl enable vsftpd
```

Restart after configuration changes:

```bash
systemctl restart vsftpd
```

---

## 2. Check FTP Configuration

View the active configuration:

```bash
grep -v '^#' /etc/vsftpd/vsftpd.conf | grep -v '^$'
```

Important configuration settings:

```ini
anonymous_enable=NO
local_enable=YES
write_enable=YES
chroot_local_user=YES
allow_writeable_chroot=YES
```

### Configuration Purpose

| Setting                      | Purpose                                  |
| ---------------------------- | ---------------------------------------- |
| `anonymous_enable=NO`        | Disables anonymous FTP                   |
| `local_enable=YES`           | Allows local Linux users                 |
| `write_enable=YES`           | Enables file uploads                     |
| `chroot_local_user=YES`      | Restricts users to their FTP environment |
| `allow_writeable_chroot=YES` | Allows writable user environment         |

---

## 3. Check FTP Port

Verify that FTP is listening on port `21`:

```bash
ss -tulpn | grep :21
```

If port `21` is not listening, check:

```bash
systemctl status vsftpd
```

Then restart:

```bash
systemctl restart vsftpd
```

---

## 4. Check FTP Firewall

Check firewall services:

```bash
firewall-cmd --list-services
```

If FTP is missing:

```bash
firewall-cmd --permanent --add-service=ftp
```

Reload:

```bash
firewall-cmd --reload
```

Verify:

```bash
firewall-cmd --query-service=ftp
```

Expected:

```text
yes
```

---

## 5. Check FTP User

Verify that the user exists:

```bash
id hassan
```

Check the user's home directory:

```bash
ls -ld /home/hassan
```

Verify the user account:

```bash
grep '^hassan:' /etc/passwd
```

If the user does not exist, create the user:

```bash
useradd -m hassan
```

Set a password:

```bash
passwd hassan
```

---

## 6. Check FTP Login

Test FTP locally:

```bash
ftp localhost
```

Log in using:

```text
Username: hassan
Password: <FTP password>
```

A successful login should display:

```text
230 Login successful.
```

---

## 7. Check FTP Upload Permissions

If login works but uploading fails, verify:

```bash
grep '^write_enable' /etc/vsftpd/vsftpd.conf
```

Expected:

```text
write_enable=YES
```

Check directory permissions:

```bash
ls -ld /home/hassan
```

Check file ownership:

```bash
ls -l /home/hassan
```

If necessary:

```bash
chown -R hassan:hassan /home/hassan
```

---

## 8. Check SELinux

Check SELinux status:

```bash
getenforce
```

Check FTP home directory access:

```bash
getsebool ftp_home_dir
```

If disabled:

```bash
setsebool -P ftp_home_dir on
```

Verify:

```bash
getsebool ftp_home_dir
```

Expected:

```text
ftp_home_dir --> on
```

---

## 9. Check FTP Logs

Check the FTP service log:

```bash
journalctl -u vsftpd
```

View recent FTP service messages:

```bash
journalctl -u vsftpd --since "1 hour ago"
```

These logs can help identify:

* Authentication failures
* Service startup errors
* Configuration problems
* Connection issues

---

## 10. Test FTP File Transfer

Connect:

```bash
ftp 192.168.10.2
```

Download a file:

```text
get filename
```

Upload a file:

```text
put filename
```

List files:

```text
ls
```

Exit:

```text
bye
```

---

## FTP Troubleshooting Summary

| Problem                 | Verification                   | Solution               |
| ----------------------- | ------------------------------ | ---------------------- |
| FTP service stopped     | `systemctl status vsftpd`      | Start/restart vsftpd   |
| Port 21 unavailable     | `ss -tulpn \| grep :21`        | Restart vsftpd         |
| Login failure           | `id username`                  | Verify user/password   |
| Upload failure          | `write_enable`                 | Enable writing         |
| Permission denied       | `ls -ld /home/user`            | Correct ownership      |
| Firewall blocking FTP   | `firewall-cmd --list-services` | Allow FTP              |
| SELinux blocking access | `getsebool ftp_home_dir`       | Enable FTP home access |
| Configuration error     | `journalctl -u vsftpd`         | Correct configuration  |
