/*
  Warnings:

  - You are about to drop the column `assignedFindableIds` on the `GameSession` table. All the data in the column will be lost.
  - You are about to drop the column `foundFindableIds` on the `GameSession` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "GameSession" DROP COLUMN "assignedFindableIds",
DROP COLUMN "foundFindableIds",
ADD COLUMN     "assignedFindables" TEXT[],
ADD COLUMN     "foundFindables" TEXT[];
