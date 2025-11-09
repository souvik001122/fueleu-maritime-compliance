# Fuel EU Compliance Dashboard

The Fuel EU Compliance Dashboard is a full-stack web platform that helps maritime operators track and manage greenhouse gas (GHG) intensity under FuelEU regulations. It calculates Compliance Balance (CB) values, supports storing surpluses for future use, and enables pooling between ships to offset deficits. The system integrates a modern PostgreSQL backend with a modular architecture for high scalability and flexibility.

---

## 🔍 Overview

This project provides an end-to-end solution for evaluating ships' emission performance, comparing it against FuelEU targets, and managing surplus or deficit compliance credits. It features automated calculations, persistent data storage, and an intuitive frontend interface for ship managers.

### Main Features
- Automated Compliance Balance (CB) calculation
- Banking system to store surplus CB
- Pooling system to offset deficits across vessels
- PostgreSQL + Prisma ORM backend
- Modular architecture following the Hexagonal pattern

---

## ⚙️ Core Formulae

| Concept | Formula |
|----------|----------|
| Target Intensity (2025) | 89.3368 gCO₂e / MJ |
| Energy in Scope (MJ) | fuelConsumption × 41,000 |
| Compliance Balance (CB) | (TargetIntensity − ActualIntensity) × EnergyInScope |
| Meaning | Positive CB → Surplus, Negative CB → Deficit |

---

## 🏗️ Architecture Summary

This application follows Hexagonal Architecture (Ports and Adapters), enabling a clean separation between core business logic and framework-specific components.

| Layer | Description | Examples |
|--------|--------------|-----------|
| Domain Core | Defines entities, invariants, and business rules | Compliance, Route |
| Application Layer | Manages workflows and service logic | ComplianceService, PoolService |
| Ports | Define boundary interfaces | ComplianceRepositoryPort |
| Adapters | Implement ports and connect to frameworks | PrismaAdapter, ExpressAPI |
| Infrastructure | Environment, server, and DB configuration | Express, Prisma, NeonDB |

**Advantages**
- High modularity and maintainability  
- Business logic independent of framework or database  
- Easy to test and extend  

---

## 🚀 Backend Setup

### 1. Clone Repository
```bash
git clone https://github.com/<your-username>/fuel-eu-maritime-compliance.git
cd fuel-eu-maritime-compliance/backend
2. Install Dependencies
bash
Copy code
npm install
3. Configure Environment
Create a .env file in the /backend directory:

bash
Copy code
DATABASE_URL="postgresql://<user>:<password>@<neon-host>/<db>?sslmode=require"
4. Initialize Database
bash
Copy code
npx prisma migrate reset --force
npx prisma generate
5. Seed Sample Data
bash
Copy code
npm run seed
# or
npx tsx seed/seed.ts
6. Start Server
bash
Copy code
npm run dev
Backend runs at: http://localhost:5000

💻 Frontend Setup
1. Navigate to Frontend Directory
bash
Copy code
cd ../frontend
2. Install Packages
bash
Copy code
npm install
3. Run Application
bash
Copy code
npm run dev
Frontend runs at: http://localhost:5173

🧪 Testing Modules
Banking Module
Go to Banking section

Enter Ship ID and Year

View calculated CB and bank surplus CB for later use

Pooling Module
Open Pooling tab

Fetch yearly CB data for all ships

Execute pooling operation to redistribute credits

Observe adjusted CB values

Database Check
You can explore stored data using Prisma Studio:

bash
Copy code
npx prisma studio
🧭 Objective
The goal of this project is to simplify FuelEU maritime compliance management by offering an accurate, automated, and data-driven approach to calculate and monitor GHG intensity, while supporting credit storage and redistribution features.

🧱 Technology Stack
Frontend: React + TypeScript + Vite

Backend: Node.js + Express

Database: Neon PostgreSQL

ORM: Prisma

Architecture: Hexagonal (Ports and Adapters)

📜 License
Released under the MIT License — free to use, modify, and distribute for educational or professional purposes.

Author: Souvik Das
GitHub: github.com/souvik001122
