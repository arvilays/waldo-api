/*
  Warnings:

  - Made the column `thumbnailUrl` on table `Map` required. This step will fail if there are existing NULL values in that column.

*/
-- AlterTable
ALTER TABLE "Map" ALTER COLUMN "thumbnailUrl" SET NOT NULL;
