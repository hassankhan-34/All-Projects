# Group Policy Troubleshooting – Windows Server 2016

## 1. Problem Description

Group Policy provides centralized management of users and computers in an Active Directory environment.

A Group Policy Object may fail to apply because of:

* Incorrect GPO linking.
* Incorrect Organizational Unit placement.
* Group Policy processing problems.
* DNS problems.
* Permission issues.
* Conflicting policies.
* Policy configuration errors.

---

## 2. Troubleshooting Steps

### Step 1 – Verify GPO Exists

Open:

```text
Group Policy Management
→ Forest
→ Domains
→ lab.local
```

Verify that the required GPOs exist.

Expected GPOs:

```text
Domain-Security-Policy
Desktop-Restrictions
User-Restrictions
```

---

### Step 2 – Verify GPO Linking

Check that each GPO is linked to the correct domain or Organizational Unit.

Example:

```text
IT
└── Desktop-Restrictions

HR
└── User-Restrictions

Finance
└── User-Restrictions
```

---

### Step 3 – Force Group Policy Update

Run:

```cmd
gpupdate /force
```

Expected result:

```text
Computer Policy update has completed successfully.

User Policy update has completed successfully.
```

---

### Step 4 – Check Applied Policies

Run:

```cmd
gpresult /r
```

Review:

```text
Applied Group Policy Objects
```

Verify that the expected policies are listed.

---

### Step 5 – Generate Detailed GPO Report

Run:

```cmd
gpresult /h C:\gpresult.html
```

Open:

```text
C:\gpresult.html
```

Review:

* Applied GPOs
* Denied GPOs
* Security filtering
* Group Policy processing
* Computer configuration
* User configuration

---

## 3. Common Causes

### Incorrect OU Placement

If a user or computer is located in the wrong OU, the intended GPO may not apply.

### Incorrect GPO Link

A GPO may be created but not linked to the appropriate OU.

### DNS Problems

Incorrect DNS configuration can prevent proper communication with the Domain Controller.

### Security Filtering

Incorrect security permissions may prevent users or computers from applying a GPO.

### Conflicting Policies

Multiple GPOs may configure the same setting differently.

---

## 4. Resolution

Recommended troubleshooting actions:

1. Verify the user or computer's OU.
2. Verify the GPO link.
3. Run `gpupdate /force`.
4. Run `gpresult /r`.
5. Generate an HTML report.
6. Check GPO security filtering.
7. Verify DNS and Domain Controller connectivity.
8. Review Group Policy event logs.

---

## 5. Verification

Run:

```cmd
gpupdate /force
```

Then:

```cmd
gpresult /r
```

Confirm that the expected GPO appears under:

```text
Applied Group Policy Objects
```

---

## 6. Conclusion

Group Policy troubleshooting requires understanding the relationship between:

```text
User/Computer
      ↓
Organizational Unit
      ↓
GPO Link
      ↓
Security Filtering
      ↓
Policy Processing
```

The troubleshooting process demonstrated the use of:

* Group Policy Management
* `gpupdate`
* `gpresult`
* Active Directory Users and Computers
* DNS verification
* Group Policy security filtering
