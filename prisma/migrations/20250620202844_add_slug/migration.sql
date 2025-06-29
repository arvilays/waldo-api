/*
  Warnings:

  - You are about to drop the column `nameShort` on the `Map` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[slug]` on the table `Map` will be added. If there are existing duplicate values, this will fail.

*/
-- DropIndex
DROP INDEX "Map_nameShort_key";

-- AlterTable
ALTER TABLE "Map" DROP COLUMN "nameShort",
ADD COLUMN     "slug" TEXT;

-- CreateIndex
CREATE UNIQUE INDEX "Map_slug_key" ON "Map"("slug");
