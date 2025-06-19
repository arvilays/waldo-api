/*
  Warnings:

  - Made the column `nameShort` on table `Map` required. This step will fail if there are existing NULL values in that column.
  - Made the column `thumbnailURL` on table `Map` required. This step will fail if there are existing NULL values in that column.

*/
-- AlterTable
ALTER TABLE "Map" ALTER COLUMN "nameShort" SET NOT NULL,
ALTER COLUMN "thumbnailURL" SET NOT NULL;
