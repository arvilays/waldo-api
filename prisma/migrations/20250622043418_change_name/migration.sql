/*
  Warnings:

  - You are about to drop the column `assignedFindables` on the `GameSession` table. All the data in the column will be lost.
  - You are about to drop the column `foundFindables` on the `GameSession` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "GameSession" DROP COLUMN "assignedFindables",
DROP COLUMN "foundFindables",
ADD COLUMN     "assignedFindableIds" TEXT[],
ADD COLUMN     "foundFindableIds" TEXT[];
