# ⚓ FuelEU Maritime Compliance Dashboard

A full-stack web application for monitoring and managing **FuelEU Maritime compliance**.  
It automates the calculation of **Greenhouse Gas (GHG) intensity**, evaluates **Compliance Balance (CB)** for ships, and supports **Banking** and **Pooling** of surplus/deficit balances — ensuring efficiency and transparency.

---

## 🧠 Core Features
| Feature | Description |
|----------|-------------|
| **CB Calculation** | Calculates GHG intensity deviation and annual compliance balance for ships. |
| **Banking** | Stores surplus balance for future use (carry-forward). |
| **Pooling** | Allows grouping of multiple ships to share surplus among deficit ships. |
| **Data Validation** | Prisma ORM ensures accurate and consistent database records. |
| **Hexagonal Architecture** | Clean separation of business logic from external dependencies. |

---

## ⚙️ System Overview

### Backend (Node.js + Express + Prisma)
- Provides REST APIs for ships, routes, compliance, banking, and pooling.
- Uses Neon PostgreSQL with Prisma ORM.
- Follows **Hexagonal (Ports & Adapters)** architecture.

### Frontend (React + TypeScript + Vite)
- Interactive dashboard for users to visualize, bank, and pool compliance data.
- Fetches real-time backend data through REST APIs.

---

## 📊 Compliance Formulas

| Parameter | Formula |
|------------|----------|
| **GHG Intensity (GI)** | `(Emission Factor × Fuel Consumed) / Energy Output` |
| **Compliance Balance (CB)** | `GI_actual - GI_target` |
| **Pooling Redistribution** | `∑(Surplus) distributed proportionally to deficits` |

---

## 🧩 Architecture Diagram
```
Frontend (React + Vite)
        ↓ API Calls (REST)
Backend (Node.js + Express)
        ↓ ORM
Database (PostgreSQL via Prisma)
```

---

## 🛠️ Backend Setup

```bash
# 1️⃣ Move to backend folder
cd backend

# 2️⃣ Install Packages
npm install

# 3️⃣ Create Environment File
# inside /backend/.env
DATABASE_URL="postgresql://<user>:<password>@<neon-host>/<db>?sslmode=require"

# 4️⃣ Build Schema and Generate Client
npx prisma migrate reset --force
npx prisma generate

# 5️⃣ Seed Demo Data
npm run seed
# or
npx tsx seed/seed.ts

# 6️⃣ Launch the API Server
npm run dev
```

📍 Default backend endpoint → [http://localhost:5000](http://localhost:5000)

---

## 💻 Frontend Deployment Steps

```bash
# 1️⃣ Move to Frontend Folder
cd ../frontend

# 2️⃣ Install Node Modules
npm install

# 3️⃣ Start the Dev Server
npm run dev
```

🖥️ React (Vite) interface available at → [http://localhost:5173](http://localhost:5173)

---

## 🧪 Functional Walk-Through

### 🔹 Banking Module
1. Open the **Banking Tab**.  
2. Enter **Ship ID + Year**, then click **Load CB**.  
3. Press **Bank** to save any surplus into the ledger.

### 🔹 Pooling Module
1. Go to the **Pooling Tab**.  
2. Click **Fetch Adjusted CBs** to list all ships.  
3. Select **Create & Allocate Pool** to automatically transfer surpluses.  
4. Check “CB After” or backend logs to confirm redistribution.

### 🔹 Database Review
```bash
npx prisma studio
```
Opens interactive GUI to inspect routes, balances, banks, and pools.

---

## 🧰 Verification & Testing

| Area | Validation Method |
|------|-------------------|
| **Backend** | Postman or `curl` API testing |
| **Frontend** | Perform form actions → real DB updates |
| **Database** | Inspect via `npx prisma studio` |
| **Math Accuracy** | Cross-check with manual CB calculations |

---

## 🧩 Developer Notes
- **TypeScript strict-mode** enabled for strong type safety.  
- **Prisma ORM** ensures referential integrity between ships, routes, banks, and pools.  
- **Greedy algorithm** optimizes pooling redistribution (largest surplus → largest deficit).  
- **Modular services** allow isolated and scalable testing.

---

## 🪄 Useful Commands

```bash
# Database Management
npx prisma migrate dev --name init
npx prisma db seed
npx prisma studio

# Run Servers
npm run dev        # backend
npm run test       # backend tests
npm run dev        # frontend (vite)
```

---

## 🚢 Summary

**FuelEU Maritime Tracker** streamlines **emission compliance tracking** for vessels under the FuelEU Maritime Regulation.  
It merges precise greenhouse gas computations with modern full-stack engineering — providing an automated, auditable, and scalable compliance workflow.

---

## 🧾 Technology Stack

| Layer | Technology |
|--------|-------------|
| **Frontend** | React, TypeScript, Vite |
| **Backend** | Node.js, Express |
| **Database** | PostgreSQL (Neon) |
| **ORM** | Prisma |
| **Architecture** | Hexagonal (Ports & Adapters) |


---

## 👨‍💻 Author
**Souvik Das**  
GitHub: [github.com/souvik001122](https://github.com/souvik001122)  
Email: 231210104@nitdelhi.ac.in  
B.Tech CSE, NIT Delhi
