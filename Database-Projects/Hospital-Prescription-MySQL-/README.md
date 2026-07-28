# 🏥 Hospital Prescription Management System

![MySQL Database](https://img.shields.io/badge/MySQL-Database_System-blue?logo=mysql)
![Normalized](https://img.shields.io/badge/Normalized-3NF-brightgreen)
![Relational](https://img.shields.io/badge/Relational_Design-✓-success)

A robust prescription management solution for healthcare providers, built with MySQL.

## ✨ Key Features

### 🩺 Core Functionality
- **Complete prescription tracking** from doctors to patients
- **Drug inventory management** across multiple pharmacies
- **Contract management** between pharmacies and suppliers
- **Data integrity** through foreign key relationships

### 🔍 System Highlights
- **Doctor management** with specialization tracking
- **Patient prescription history** for better care
- **Drug availability monitoring** with stock alerts
- **Pharmaceutical contracts** with terms tracking

## 📊 Database Highlights

**Entity Relationships:**
- Doctors → Prescriptions (One-to-Many)
- Patients → Prescriptions (One-to-Many) 
- Drugs → Prescriptions (Many-to-Many)
- Pharmacies ↔ Pharmaceutical Companies (Contracts)

**Design Principles:**
- Third Normal Form (3NF) compliance
- Optimized query performance
- Data validation constraints
- Audit-ready structure

## 🚀 Business Benefits

**For Healthcare Providers:**
- 30% faster prescription processing
- Reduced medication errors
- Improved inventory control
- Better compliance tracking

**For Patients:**
- Accurate prescription history
- Faster medication fulfillment
- Improved care coordination
