/*
  Warnings:

  - You are about to drop the column `thumbnailURL` on the `Map` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "Map" DROP COLUMN "thumbnailURL",
ADD COLUMN     "thumbnailUrl" TEXT;
