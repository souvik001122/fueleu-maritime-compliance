# Fuel EU Compliance Dashboard

The **Fuel EU Compliance Dashboard** is a full-stack web application that calculates and manages maritime compliance metrics under the **FuelEU regulation**. It computes Greenhouse Gas (GHG) intensity for ships, evaluates the **Compliance Balance (CB)**, and supports **banking** (saving surplus credits) and **pooling** (redistributing credits between ships). The platform connects to a **PostgreSQL** database via **Prisma ORM** and follows a **Hexagonal (Ports and Adapters) architecture** for modular scalability and testability.

---

## 🚢 Overview

This project simplifies GHG monitoring for maritime operators by comparing actual fuel-based intensity with FuelEU targets. It offers:
- Automated **CB calculations**
- **Surplus banking** across years
- **Pooling** of compliance balances between ships
- Persistent **Neon PostgreSQL** integration
- Modular and testable design for future scaling

---

## ⚙️ Key Features

- Automatic **Compliance Balance (CB)** computation  
- **Banking** of surplus for future compliance years  
- **Pooling** of credits across ships  
- Persistent database storage via Prisma  
- **Hexagonal architecture** (clean separation of layers)  
- Transparent and traceable GHG computation

---

## 📊 Core Calculations

| Metric | Formula |
|---------|----------|
| **Target GHG Intensity (2025)** | 89.3368 gCO₂e / MJ |
| **Energy in Scope (MJ)** | fuelConsumption × 41,000 |
| **Compliance Balance (CB)** | (TargetIntensity − ActualIntensity) × EnergyInScope |
| **Interpretation** | Positive CB = Surplus; Negative CB = Deficit |

---

## 🧩 Architecture Summary

The project adopts a **Hexagonal Architecture** (Ports and Adapters) that separates business logic from framework and I/O dependencies.

| Layer | Description | Examples |
|--------|--------------|-----------|
| **Core Domain** | Core entities and business rules | Compliance, Route |
| **Application Layer** | Implements workflows | ComplianceService, PoolService |
| **Ports** | Define input/output interfaces | ComplianceRepositoryPort |
| **Adapters** | Connect system to external layers | PostgresAdapter, ExpressAdapter |
| **Infrastructure** | Server setup & DB configuration | Express.js, Prisma, NeonDB |

### ✅ Advantages
- Decoupled and maintainable codebase  
- Independent, testable business logic  
- Easy to modify or extend without rewriting core logic  

---

## 🖥️ Backend Setup

```bash
# 1. Clone the repository
git clone https://github.com/<your-username>/fuel-eu-maritime-compliance.git
cd fuel-eu-maritime-compliance/backend

# 2. Install dependencies
npm install

# 3. Create .env file
DATABASE_URL="postgresql://<user>:<password>@<neon-host>/<db>?sslmode=require"

# 4. Apply migrations and generate Prisma client
npx prisma migrate reset --force
npx prisma generate

# 5. Seed the database (optional)
npm run seed
# or
npx tsx seed/seed.ts

# 6. Start the backend server
npm run dev
# Runs on http://localhost:5000
💻 Frontend Setup

Copy code
# 1. Move to frontend directory
cd ../frontend

# 2. Install dependencies
npm install

# 3. Start frontend server
npm run dev
# App runs at http://localhost:5173
🧪 Testing & Verification
✅ Banking Functionality
Open the Banking Module in the dashboard.

Enter a Ship ID and Year.

View the calculated CB and store surplus for future use.

✅ Pooling Functionality
Open the Pooling Module.

Load all ships’ data for a specific year.

Run pooling to distribute surplus among deficit vessels.

✅ Database Validation
Use Prisma Studio for easy DB inspection:


npx prisma studio
🎯 Objective
The primary goal is to create an automated and transparent tool for managing FuelEU maritime compliance.
It ensures accurate CB computation, supports surplus banking, enables pooling redistribution, and provides data traceability across compliance periods.

🧱 Technology Stack
Layer	Technology
Frontend	React, TypeScript, Vite
Backend	Node.js, Express
Database	Neon PostgreSQL
ORM	Prisma
Architecture	Hexagonal (Ports and Adapters)

⚖️ License
This project is released under the MIT License.
You are free to use, modify, and distribute it for educational, research, or commercial applications.

👤 Author
Souvik Das

B.Tech in Computer Science & Engineering, NIT Delhi

GitHub: github.com/souvik001122

Email: 231210104@nitdelhi.ac.in
