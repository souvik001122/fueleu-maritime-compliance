# AI Agent Workflow Log

A record of how AI agents were used to plan, generate, and refine the Fuel EU Compliance Dashboard.  
Focus areas: **architecture**, **database modeling**, **business logic (CB, banking, pooling)**, and **dev-loop efficiency**.

---

## 1) Agents Used

- **Grok (xAI)** — Initial project setup guidance, monorepo + Hexagonal architecture outline, early backend iterations.
- **ChatGPT (GPT-5)** — Architecture planning, complex code generation (e.g., pooling allocator), debugging, and refactoring.
- **GitHub Copilot** — Inline completions, syntax fixes, repetitive boilerplate in TypeScript/Prisma.
- **Cursor AI (Editor)** — Multi-file context, rapid iteration, cross-file refactors, and repository-wide consistency.

> Rationale: Grok/ChatGPT for high-level + complex logic; Copilot for speed on boilerplate; Cursor for tight feedback loop.

---

## 2) Prompts & Outputs

### Example 1 — Initial Project Setup (Grok)
**Prompt**

> “i am willing to work on the project. the project implements parts of Fuel EU Maritime Compliance platform. the frontend dashboard and backend APIs handling route data, compliance balance, banking and pooling. i want to use react (node.js's vite)+ TypeScript + Tailwind CSS for frontend and backend with Node.js + TypeScript + PostgreSQL (using package of node.js). for now, i have provided you a screenshot, give me procedure and codes to implement it.”

**AI Output (Summary)**  
- Step-by-step monorepo setup (frontend + backend).
- Initial Prisma schema, Express server, and React `App.tsx` with tab layout.
- Hexagonal Architecture directory structure and rationale.

**Result**  
Bootstrapped both apps quickly and consistently, providing a clear foundation to iterate on.

---

### Example 2 — Core Architecture & Prisma Schema (ChatGPT)
**Prompt**

> “Help me structure a TypeScript backend using Hexagonal Architecture for a Fuel EU Compliance Dashboard, with Prisma as ORM and Neon PostgreSQL as database... also write a Prisma schema and seed.ts script that stores routes, compliance data, and pooling relationships for multiple ships.”

**AI Output (Summary)**  
- Folder hierarchy for **core / application / ports / adapters / infrastructure**.
- Entities and ports (`ComplianceRepositoryPort`) and their DB adapters (`CompliancePostgresAdapter`).
- Prisma models: `Route`, `ShipCompliance`, `Pool`, `PoolMember`, `BankEntry`.
- Seed script outline to populate initial routes and related data.

**Result**  
Established clean separation of concerns and a working DB model that aligned with business rules.

---

### Example 3 — Iterative Schema Refinement (Grok)
**Prompt**

> “i think you had included extra columns in routes table. [attached schema image]. modify this with changes in required files.”

**AI Output (Summary)**  
- Reduced `Route` to minimal necessary columns; made certain fields optional to match seeds.
- Updated `seed/seed.ts` and CB calculation handler accordingly.

**Result**  
Schema drift eliminated quickly; data model aligned precisely with assignment dataset and logic.

---

### Example 4 — Pool Allocation Logic (ChatGPT)
**Prompt**

> “Write a function to allocate compliance balances among ships in a pool, transferring surplus to cover deficits.”

**AI Output (Summary)**  
- Sorted members by CB (surplus vs deficit).
- Iteratively transferred surplus to cover deficits (greedy approach).
- Returned `cbAfter` for each member.

**Result**  
Working allocator with manual enhancements: console tracing, year checks, and errors for invalid pools.

---

## 3) Validation & Corrections

- **Manual Testing:** Ran `npm run dev` and exercised endpoints via Postman/front-end. Checked backend logs for CB/Banking/Pooling flows.
- **Prisma Validation:** `npx prisma validate`, `npx prisma studio` to inspect tables; verified seed records and relations.
- **Math Checks:** Re-computed CB manually using `(Target − Actual) × (fuelConsumption × 41_000)` on sample routes.
- **Typical Fixes:**
  - Variable mismatches (e.g., `cbBefore` / `cb_after`) and missing year filters in queries.
  - Import path issues (e.g., `../../../shared/db` vs `../../shared/db`).
  - TypeScript strict mode errors around `Partial<Pick<...>>` and conditional query builders.

---

## 4) Observations

### Where AI Saved Time
- **Scaffolding:** Hexagonal folders, baseline server, Prisma schema in minutes.
- **Boilerplate:** Repetitive TypeScript/Prisma code with Copilot.
- **Debugging:** Quick identification of relationship constraints and typing issues.
- **Concepts:** Fast clarifications on design choices and patterns.

### Where AI Struggled / Hallucinated
- **Inconsistency:** Swapped column names (`shipId` vs `routeId`), mismatched signatures.
- **Context loss:** Forgot constraints (e.g., year filter) or optional fields between prompts.
- **Paths & Names:** Invented paths (`src/prisma`) or incorrect filenames occasionally.

### Effective Combination
- **Grok + ChatGPT:** High-level planning, complex algorithms, end-to-end code blocks.
- **Copilot:** Inline completions and repetitive changes.
- **Cursor:** REPL-like loop to test → error → prompt → fix, with repo-wide context.

---

## 5) Best Practices Followed

- **Iterative Refinement:** Start broad → drill down to specific files/functions.
- **Human-in-the-Loop:** Treat agents as pair programmers; manually review and test every block.
- **Error-First Debugging:** Use compiler/runtime errors as prompts for precise fixes.
- **Task Orientation:** Use micro-tasks (e.g., `tasks.md`) to keep prompts focused.
- **Context Preservation:** Supply diffs/snippets so the agent remains grounded.
- **Traceability:** Commit AI-generated changes with clear messages for auditability.

---

## 6) Quick Tips for Future Work

- **Lock the Schema Early:** Prevent churn by validating seeds and calculations against the dataset first.
- **Name Things Consistently:** Keep `shipId`, `routeId`, `cbBefore`, `cbAfter` consistent across ports/adapters.
- **Prefer Ports/Adapters:** Keep domain logic free from Express/Prisma details for testability.
- **Validate With Real Data:** Always run `npx prisma studio` to sanity-check assumptions after changes.

---

## 7) Appendix — Commands Used

```sh
# Prisma / DB
npx prisma migrate dev --name init_schema
npx prisma db seed
npx prisma studio

# Backend dev
npm run dev
npm run test

# Frontend dev
npm run dev
