# Reflection on Building the Fuel EU Compliance Dashboard

## What I Learned Using AI Agents

Working on the Fuel EU Compliance Dashboard helped me understand how to use AI not just for “code generation,” but as a real collaborative development tool.  
Instead of writing everything manually, I treated the AI agents like pair-programmers who could:

- Propose clean architecture patterns (Hexagonal, ports & adapters)
- Generate Prisma schemas and fix relational constraints
- Scaffold TypeScript API layers much faster than I could alone
- Explain and optimize business rules like CB calculation, pooling transfers, and baseline comparison

One of the biggest lessons was learning how to **structure prompts**: vague prompts produced vague output, but precise, context-rich prompts generated high-quality code that plugged directly into the project.  
The more I treated the AI like a senior engineer ("give me the adapter for this port, using Prisma"), the more accurate and reusable the code became.

---

## Efficiency Gains vs Manual Coding

AI drastically improved development speed and lowered cognitive load:

| Area | Manual Effort | With AI |
|-------|--------------|---------|
| Backend folder structure | ~1–2 hrs | < 5 min (generated) |
| Prisma schema & seed data | ~3 hrs debugging relations | ~30 min including refinements |
| Banking + pooling logic | Several iterations & edge-cases | Generated workable first draft, then refined |
| Frontend UI scaffolding (tabs, pages) | 1–2 hrs | Built in minutes with AI + Copilot |
| Debugging Prisma + TS errors | Trial & error normally | AI suggested fixes based on compiler logs |

Instead of spending time wiring boilerplate, I was able to focus on:

- Validating compliance math `(Target − Actual) × EnergyInScope`
- Ensuring surplus/deficit logic matched regulation rules
- Testing banking & pooling flows against seed data
- Keeping domain logic independent of Express, Prisma, or UI

AI didn’t remove the need to think — it removed the time I would’ve wasted searching docs, writing repetitive code, or troubleshooting syntax.

---

## Improvements I Would Make in the Next Iteration

If I revisited this project with more time, I would:

1. **Add automated tests earlier**  
   - Use Vitest/Jest to test CB calculations, pool allocation, baseline comparison  
   - Mock repository ports so business logic can be tested without DB

2. **Deploy backend + frontend**  
   - Backend → Railway / Render  
   - Database → Neon production branch  
   - Frontend → Vercel with environment-based API URLs

3. **Improve data ingestion**  
   - Import real maritime fuel/emission datasets instead of hard-coded seeds  
   - Support CSV upload → route records → live CB projection

4. **Add real-time UI validation**  
   - Instead of waiting for API errors, use Zod + React to validate user input in the Banking/Pooling screens

5. **Extend pooling logic**  
   - Add UI preview of “before vs after allocation” before committing to DB  
   - Support multi-ship selection and rule enforcement (e.g., deficit ships cannot exit worse than before)

6. **Use AI for data sanity checks**  
   - Auto-detect unrealistic values (e.g., negative fuel, impossible GHG intensity) before insertion

Overall, the biggest improvement would be integrating **testing, deployment, and real datasets**, now that the core logic and architecture are solid.

---

