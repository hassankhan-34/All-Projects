# Linux Server Administration & Web Services Lab

## Troubleshooting Report

---

## 1. Overview

This document records the troubleshooting process performed on the CentOS Linux server as part of the **Linux Server Administration & Web Services Lab**.

The purpose of this activity was to simulate a real-world web service failure, identify the cause of the problem, troubleshoot the issue using standard Linux administration commands, restore the affected service, and verify that the web services were functioning correctly.

---

## 2. Server Information

| Parameter         | Configuration      |
| ----------------- | ------------------ |
| Operating System  | CentOS 7           |
| Hostname          | linuxsrv           |
| Server IP Address | 192.168.10.2       |
| Web Server        | Apache HTTP Server |
| HTTP Port         | 80                 |
| Website 1         | site1.local        |
| Website 2         | site2.local        |

---

## 3. Troubleshooting Scenario

A service failure was intentionally simulated by stopping the Apache HTTP Server.

The Apache service was stopped using:

```bash
sudo systemctl stop httpd
```

After stopping the service, the hosted websites became inaccessible.

The purpose of this exercise was to demonstrate a complete troubleshooting workflow:

```text
Problem Occurs
      ↓
Identify the Problem
      ↓
Check Service Status
      ↓
Check Port Availability
      ↓
Test Configuration
      ↓
Determine Root Cause
      ↓
Restore Service
      ↓
Verify Recovery
```

---

## 4. Problem Identification

The first step was to check the status of the Apache web server.

Command used:

```bash
sudo systemctl status httpd
```

The service status showed that Apache was not running.

Expected status:

```text
Active: inactive (dead)
```

### Finding

The Apache HTTP Server service had been stopped.

This explained why the hosted websites were no longer accessible.

---

## 5. Website Connectivity Test

After the Apache service was stopped, the websites were tested from the client system.

The following websites were tested:

```text
http://site1.local
http://site2.local
```

Both websites failed to load.

The services were also tested from the Linux server using:

```bash
curl -H "Host: site1.local" http://192.168.10.2
```

and:

```bash
curl -H "Host: site2.local" http://192.168.10.2
```

The requests failed because Apache was not running and was therefore not accepting HTTP connections.

### Finding

The website failure was directly related to the Apache service being stopped.

---

## 6. Port 80 Investigation

The HTTP port was checked to determine whether any service was listening for web traffic.

Command used:

```bash
sudo ss -tulpn | grep :80
```

No active Apache listener was found on port 80.

Normally, Apache should listen on HTTP port 80.

### Finding

```text
Apache Service     → Stopped
Port 80            → Not Listening
Websites           → Inaccessible
```

This confirmed that the web service failure was caused by the Apache service being inactive.

---

## 7. Apache Configuration Test

Before restarting Apache, the configuration was checked to make sure there was no configuration error.

Command used:

```bash
sudo apachectl configtest
```

The configuration test returned:

```text
Syntax OK
```

### Finding

The Apache configuration was valid.

This ruled out a configuration syntax error as the cause of the failure.

The troubleshooting investigation therefore determined that the problem was the **Apache service being stopped**, rather than an invalid configuration.

---

## 8. Root Cause

### Identified Root Cause

The Apache HTTP Server service was intentionally stopped during the service failure test.

### Root Cause Analysis

```text
Apache Service Stopped
        ↓
Apache Not Running
        ↓
Port 80 Not Listening
        ↓
HTTP Requests Not Accepted
        ↓
Virtual Host Websites Inaccessible
```

The Apache configuration itself was valid, as confirmed by:

```bash
sudo apachectl configtest
```

Result:

```text
Syntax OK
```

---

## 9. Service Recovery

After identifying the root cause, the Apache service was started again.

Command used:

```bash
sudo systemctl start httpd
```

The service status was then checked:

```bash
sudo systemctl status httpd
```

The Apache service returned to a running state.

Expected result:

```text
Active: active (running)
```

---

## 10. Post-Recovery Verification

After starting Apache, the HTTP port was checked again:

```bash
sudo ss -tulpn | grep :80
```

Apache was confirmed to be listening on port 80.

The Apache configuration was also verified again:

```bash
sudo apachectl configtest
```

Result:

```text
Syntax OK
```

---

## 11. Website Verification

The two virtual hosts were tested again.

### Site 1

```bash
curl -H "Host: site1.local" http://192.168.10.2
```

The request successfully returned the Site 1 webpage content.

### Site 2

```bash
curl -H "Host: site2.local" http://192.168.10.2
```

The request successfully returned the Site 2 webpage content.

The websites were also verified from the client browser:

```text
http://site1.local
http://site2.local
```

Both websites were successfully restored.

---

## 12. Troubleshooting Commands Used

The following commands were used during the troubleshooting process:

### Check Apache Service

```bash
sudo systemctl status httpd
```

### Stop Apache

```bash
sudo systemctl stop httpd
```

### Start Apache

```bash
sudo systemctl start httpd
```

### Check HTTP Port

```bash
sudo ss -tulpn | grep :80
```

### Test Apache Configuration

```bash
sudo apachectl configtest
```

### Test Site 1

```bash
curl -H "Host: site1.local" http://192.168.10.2
```

### Test Site 2

```bash
curl -H "Host: site2.local" http://192.168.10.2
```

### Check Apache Logs

```bash
sudo tail -n 20 /var/log/httpd/error_log
```

### Check Apache System Logs

```bash
sudo journalctl -u httpd -n 20
```

---

## 13. Troubleshooting Summary

| Troubleshooting Step          | Result                     |
| ----------------------------- | -------------------------- |
| Apache Service Status Checked | Service was stopped        |
| Website Availability Tested   | Websites inaccessible      |
| Port 80 Checked               | No active listener         |
| Apache Configuration Tested   | Syntax OK                  |
| Root Cause Identified         | Apache service was stopped |
| Apache Service Started        | Successful                 |
| Port 80 Rechecked             | Listening                  |
| Site 1 Tested                 | Working                    |
| Site 2 Tested                 | Working                    |
| Final Verification            | Successful                 |

---

## 14. Final Result

The simulated Apache web service failure was successfully diagnosed and resolved.

The troubleshooting process confirmed that:

* The Apache service was not running.
* Port 80 was not accepting HTTP connections.
* The Apache configuration was valid.
* The virtual host configuration was not the cause of the failure.
* The Apache service was successfully restarted.
* Port 80 became available again.
* Site 1 was successfully restored.
* Site 2 was successfully restored.

### Final Status

```text
Apache Service       → RUNNING
Apache Configuration → VALID
HTTP Port 80         → LISTENING
Site 1               → WORKING
Site 2               → WORKING
Troubleshooting      → SUCCESSFUL
```

---

## 15. Skills Demonstrated

This troubleshooting exercise demonstrated practical skills in:

* Linux server troubleshooting
* Apache service management
* Systemd service administration
* Network port verification
* HTTP service testing
* Virtual host testing
* Apache configuration validation
* Log analysis
* Root cause identification
* Service recovery
* Post-recovery verification

---

## 16. Conclusion

This exercise demonstrated a structured approach to troubleshooting a Linux web server.

A controlled Apache service failure was introduced to simulate a real-world web service outage. The issue was investigated by checking the Apache service status, verifying port 80, testing the Apache configuration, and testing website availability.

The root cause was identified as the Apache HTTP Server service being stopped. The service was restarted successfully, and the HTTP port and hosted websites were tested again to confirm recovery.

The troubleshooting process was completed successfully, demonstrating the ability to identify, diagnose, resolve, and verify a Linux web service failure.
