# DNS Troubleshooting – Windows Server 2016 Active Directory

## 1. Problem Description

DNS is a critical component of Active Directory. Active Directory Domain Services relies on DNS to locate Domain Controllers and provide name resolution for domain resources.

Incorrect DNS configuration can cause problems with:

* Active Directory authentication
* Domain Controller discovery
* Domain joining
* Group Policy processing
* Name resolution
* Active Directory replication

---

## 2. Symptoms

Possible symptoms of DNS problems include:

* `dc01.lab.local` cannot be resolved.
* `lab.local` cannot be resolved.
* `nslookup` returns an error.
* Active Directory services do not work correctly.
* Domain clients cannot locate the Domain Controller.
* `dcdiag` reports DNS-related failures.

---

## 3. Troubleshooting Steps

### Step 1 – Check Server IP Configuration

Run:

```cmd
ipconfig /all
```

Verify:

* Static IP address is configured.
* Correct subnet mask is configured.
* Correct default gateway is configured.
* DNS server points to the correct DNS server.

---

### Step 2 – Test DNS Resolution

Run:

```cmd
nslookup dc01.lab.local
```

Then:

```cmd
nslookup lab.local
```

The DNS server should return the correct IP address for the Domain Controller.

---

### Step 3 – Test Reverse DNS

Run:

```cmd
nslookup <DC01-IP>
```

Replace `<DC01-IP>` with the actual IP address of DC01.

The result should resolve to the appropriate hostname.

---

### Step 4 – Check DNS Service

Open:

```text
Server Manager
→ Tools
→ Services
```

Locate:

```text
DNS Server
```

The service should be in the:

```text
Running
```

state.

PowerShell can also be used:

```powershell
Get-Service DNS
```

---

### Step 5 – Verify DNS Zones

Open:

```text
Server Manager
→ Tools
→ DNS
```

Check:

```text
Forward Lookup Zones
```

Verify that the Active Directory domain zone exists:

```text
lab.local
```

Also check:

```text
Reverse Lookup Zones
```

Verify that the appropriate reverse lookup zone exists.

---

## 4. Common Causes

Common DNS issues include:

* Incorrect DNS server address.
* DNS service stopped.
* Missing DNS records.
* Incorrect forward lookup zone.
* Missing reverse lookup zone.
* Incorrect server network configuration.
* Firewall restrictions.
* Incorrect DNS settings on clients.

---

## 5. Resolution

The following corrective actions can be performed:

1. Configure the correct DNS server IP.
2. Restart the DNS service.
3. Verify forward and reverse lookup zones.
4. Verify required DNS records.
5. Clear the DNS cache if necessary.

To clear the DNS cache:

```cmd
ipconfig /flushdns
```

Then test again:

```cmd
nslookup dc01.lab.local
```

---

## 6. Verification

After troubleshooting, verify:

```cmd
nslookup dc01.lab.local
```

```cmd
nslookup lab.local
```

```cmd
ping dc01.lab.local
```

The expected result is successful DNS resolution and connectivity to the Domain Controller.

---

## 7. Conclusion

DNS troubleshooting is an essential part of Active Directory administration.

A correctly configured DNS environment ensures that Domain Controllers and domain resources can be located reliably.

The troubleshooting process demonstrated the use of:

* `ipconfig`
* `nslookup`
* `ping`
* DNS Manager
* Services
* PowerShell
