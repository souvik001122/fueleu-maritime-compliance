# Fuel EU Compliance Dashboard

A full-stack web application that calculates and manages **Fuel EU compliance metrics** for ships based on greenhouse gas (GHG) intensity and energy consumption.  
It supports:

- ✅ Compliance Balance (CB) calculation per ship and year  
- ✅ Banking of surplus CB for future usage  
- ✅ Pooling between ships to balance deficits with surpluses  
- ✅ Persistent storage using Neon PostgreSQL + Prisma ORM  

---

## 🔍 Overview

The **Fuel EU Compliance Dashboard** enables monitoring of maritime vessel emissions against the target GHG intensity mandated by the FuelEU regulation.

The platform provides:

| Module | Purpose |
|--------|---------|
| **Compliance Calculation** | Computes CB (surplus/deficit) per ship per year |
| **Banking** | Stores surplus CB for later usage |
| **Pooling** | Allows multiple ships to redistribute surplus CB |
| **Database-backed Storage** | Fully persistent via Neon PostgreSQL and Prisma |

---

## 🧠 Core Compliance Formulas

| Metric | Formula |
|--------|---------|
| **Target GHG Intensity (2025)** | `89.3368 gCO₂e / MJ` |
| **Energy in Scope (MJ)** | `fuelConsumption × 41,000` |
| **Compliance Balance (CB)** | `(Target − ActualIntensity) × EnergyInScope` |
| **Interpretation** | Positive CB → Surplus, Negative CB → Deficit |

---

## 🏗️ Architecture Summary (Hexagonal)

This project follows **Hexagonal Architecture (Ports & Adapters)** for modularity, testability, and decoupled logic.

| Layer | Responsibility | Example Components |
|--------|---------------|--------------------|
| **Core Domain** | Business entities + invariants | `Route`, `Compliance` |
| **Application Layer** | Use cases & business workflows | `ComplianceService`, `PoolService` |
| **Ports (Interfaces)** | Defines boundary contracts | `ComplianceRepositoryPort` |
| **Adapters (Implementations)** | Connects ports to DB, HTTP, UI | `CompliancePostgresAdapter` |
| **Infrastructure** | Server, DB connection, framework config | `Express`, `Prisma`, `TSX` |

✅ Benefits: Loose coupling, replaceable adapters, testable core logic, framework-independent domain.

## 🚀 Backend Setup

### 1. Clone the Repository
```sh
git clone https://github.com/<your-username>/fuel-eu-maritime-compliance.git
cd fuel-eu-maritime-compliance/backend
```

### 2.Install Dependencies
```sh
npm install
```

### 3.Configure Environment Variables
   Create a .env file inside /backend:
```sh
DATABASE_URL="postgresql://<user>:<password>@<neon-host>/<db>?sslmode=require"
```
### 4.Apply Database Schema

```sh
npx prisma migrate reset --force
npx prisma generate
```

### 5.Seed the Database

```sh
npm run seed
```
(or if running script directly)
```sh
npx tsx seed/seed.ts
```

### 6. Start the Backend Server
```sh
npm run dev
```
✅ Server will start at http://localhost:5000




### ✅ Here is the **Frontend Setup Section** in the same format:


### 1. Navigate to Frontend Directory
```sh
cd ../frontend
```

### 2.Install Dependencies
```sh
npm install
```

### 3. Start Frontend App
```sh
npm run dev
```

✅ App runs at: http://localhost:5173

### How to Execute Tests

You can test different modules via the frontend dashboard or directly through backend APIs.

## 🧪 Functional Tests

### 1. Banking

- Navigate to the **Banking** tab.
- Enter **Ship ID** and **Year**.
- Click **Load CB** → View current Compliance Balance (CB) and adjustment preview.
- Click **Bank** → Stores surplus CB into the banking ledger.

---

### 2. Pooling

- Navigate to the **Pooling** tab.
- Click **Fetch Adjusted CBs** → Loads all ships’ CB values for the selected year.
- Click **Create & Allocate Pool** → Automatically redistributes surplus among deficit ships.
- Verify results in the **CB After** column OR check backend logs.

---

### 3. Database Verification

You can visually verify all database records (routes, CB, banking, pools) using Prisma Studio:

```sh
npx prisma studio
```

### Screenshots & Sample Outputs
1.Routes Tab
<img width="1609" height="667" alt="image" src="https://github.com/user-attachments/assets/559af23a-ba7f-4006-8ad9-815863dc48d5" />

2.Compare Tab
<img width="1289" height="803" alt="image" src="https://github.com/user-attachments/assets/3d62d149-d531-4d45-8946-b400d80aa0bf" />

3.Banking Tab
<img width="1286" height="517" alt="image" src="https://github.com/user-attachments/assets/fb876c5a-a888-43bd-95b6-f78f66912807" />

4.Pooling Tab
<img width="1290" height="508" alt="image" src="https://github.com/user-attachments/assets/ab983f47-f367-4cfe-9fc6-c2088f46e96f" />







