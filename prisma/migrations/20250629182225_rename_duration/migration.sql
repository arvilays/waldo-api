/*
  Warnings:

  - You are about to drop the column `durationSeconds` on the `GameSession` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "GameSession" DROP COLUMN "durationSeconds",
ADD COLUMN     "durationMilliseconds" INTEGER;
