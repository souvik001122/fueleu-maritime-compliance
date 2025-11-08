-- CreateTable
CREATE TABLE "routes" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "routeId" TEXT NOT NULL,
    "vesselType" TEXT NOT NULL,
    "fuelType" TEXT NOT NULL,
    "year" INTEGER NOT NULL,
    "ghgIntensity" REAL NOT NULL,
    "fuelConsumption" REAL NOT NULL,
    "distance" REAL NOT NULL,
    "totalEmissions" REAL NOT NULL,
    "isBaseline" BOOLEAN NOT NULL DEFAULT false
);

-- CreateTable
CREATE TABLE "ship_compliance" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "shipId" TEXT NOT NULL,
    "year" INTEGER NOT NULL,
    "cbGco2eq" REAL NOT NULL,
    "routeId" TEXT NOT NULL,
    CONSTRAINT "ship_compliance_routeId_fkey" FOREIGN KEY ("routeId") REFERENCES "routes" ("routeId") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "bank_entries" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "shipId" TEXT NOT NULL,
    "year" INTEGER NOT NULL,
    "amountGco2eq" REAL NOT NULL,
    "routeId" TEXT NOT NULL,
    CONSTRAINT "bank_entries_routeId_fkey" FOREIGN KEY ("routeId") REFERENCES "routes" ("routeId") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "pools" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "year" INTEGER NOT NULL,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- CreateTable
CREATE TABLE "pool_members" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "poolId" TEXT NOT NULL,
    "shipId" TEXT NOT NULL,
    "cbBefore" REAL NOT NULL,
    "cbAfter" REAL NOT NULL,
    "routeId" TEXT NOT NULL,
    CONSTRAINT "pool_members_poolId_fkey" FOREIGN KEY ("poolId") REFERENCES "pools" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "pool_members_routeId_fkey" FOREIGN KEY ("routeId") REFERENCES "routes" ("routeId") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateIndex
CREATE UNIQUE INDEX "routes_routeId_key" ON "routes"("routeId");

-- CreateIndex
CREATE UNIQUE INDEX "ship_compliance_shipId_year_key" ON "ship_compliance"("shipId", "year");

-- CreateIndex
CREATE UNIQUE INDEX "bank_entries_shipId_year_key" ON "bank_entries"("shipId", "year");

-- CreateIndex
CREATE UNIQUE INDEX "pool_members_poolId_shipId_key" ON "pool_members"("poolId", "shipId");
