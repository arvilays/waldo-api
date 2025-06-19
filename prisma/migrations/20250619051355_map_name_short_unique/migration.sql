/*
  Warnings:

  - A unique constraint covering the columns `[nameShort]` on the table `Map` will be added. If there are existing duplicate values, this will fail.

*/
-- CreateIndex
CREATE UNIQUE INDEX "Map_nameShort_key" ON "Map"("nameShort");
