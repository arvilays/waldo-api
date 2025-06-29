/*
  Warnings:

  - You are about to drop the column `thumbnailImageUrl` on the `Map` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "Map" DROP COLUMN "thumbnailImageUrl",
ADD COLUMN     "nameShort" TEXT,
ADD COLUMN     "thumbnailURL" TEXT;
