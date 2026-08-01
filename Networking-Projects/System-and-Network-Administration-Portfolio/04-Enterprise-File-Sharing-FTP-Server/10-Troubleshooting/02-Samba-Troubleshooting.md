# Samba Troubleshooting Guide

## 1. Check Samba Service

Check whether the Samba service is running:

```bash
systemctl status smb
```

If the service is stopped, start it:

```bash
systemctl start smb
```

Enable it to start automatically:

```bash
systemctl enable smb
```

Restart the service after configuration changes:

```bash
systemctl restart smb
```

---

## 2. Check Samba Configuration

Validate the Samba configuration:

```bash
testparm
```

If the configuration is valid, the output should indicate that the configuration was loaded successfully.

To display the active configuration:

```bash
testparm -s
```

---

## 3. Check Samba Share Configuration

The configured share was:

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

Verify the configuration file:

```bash
cat /etc/samba/smb.conf
```

---

## 4. Check Samba Users

List Samba users:

```bash
pdbedit -L
```

The expected users were:

```text
hassan
ali
```

If a user was missing, add the user:

```bash
smbpasswd -a username
```

Enable the Samba account:

```bash
smbpasswd -e username
```

---

## 5. Check Linux Group Membership

Verify the `fileshare` group:

```bash
getent group fileshare
```

Verify the user:

```bash
id hassan
```

```bash
id ali
```

If a user was not a member of the group, add the user:

```bash
usermod -aG fileshare hassan
```

```bash
usermod -aG fileshare ali
```

---

## 6. Check Shared Directory Permissions

Check the directory:

```bash
ls -ld /srv/samba/shared
```

Expected ownership:

```text
root:fileshare
```

Expected permissions:

```text
2770
```

If required, correct the ownership:

```bash
chown -R root:fileshare /srv/samba/shared
```

Correct the permissions:

```bash
chmod -R 2770 /srv/samba/shared
```

---

## 7. Check Samba Firewall Access

Check firewall services:

```bash
firewall-cmd --list-services
```

If Samba is missing, add it:

```bash
firewall-cmd --permanent --add-service=samba
```

Reload the firewall:

```bash
firewall-cmd --reload
```

Verify:

```bash
firewall-cmd --query-service=samba
```

Expected:

```text
yes
```

---

## 8. Check SELinux

Check SELinux:

```bash
getenforce
```

Check the shared directory context:

```bash
ls -Zd /srv/samba/shared
```

Configure the Samba SELinux context:

```bash
semanage fcontext -a -t samba_share_t "/srv/samba/shared(/.*)?"
```

Apply the context:

```bash
restorecon -Rv /srv/samba/shared
```

Verify again:

```bash
ls -Zd /srv/samba/shared
```

---

## 9. Test Samba Locally

List available Samba shares:

```bash
smbclient -L localhost -U hassan
```

Connect to the shared directory:

```bash
smbclient //localhost/SharedFiles -U hassan
```

If successful, the following prompt should appear:

```text
smb: \>
```

---

## 10. Client Connectivity Test

From the client, test the server:

```text
\\192.168.10.2\SharedFiles
```

If the connection fails, verify:

```bash
systemctl status smb
```

Then check:

```bash
firewall-cmd --list-services
```

Finally, verify network connectivity from the client:

```text
ping 192.168.10.2
```

---

## Samba Troubleshooting Summary

| Problem                  | Verification                   | Solution                      |
| ------------------------ | ------------------------------ | ----------------------------- |
| Samba service stopped    | `systemctl status smb`         | Start/restart Samba           |
| Configuration error      | `testparm`                     | Correct `smb.conf`            |
| User cannot access share | `pdbedit -L`                   | Add Samba user                |
| User lacks permissions   | `id username`                  | Add user to `fileshare`       |
| Permission denied        | `ls -ld /srv/samba/shared`     | Correct ownership/permissions |
| Client cannot connect    | `firewall-cmd --list-services` | Allow Samba                   |
| SELinux denial           | `ls -Zd`                       | Configure `samba_share_t`     |
