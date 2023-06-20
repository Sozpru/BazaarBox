/*
  Warnings:

  - You are about to drop the column `inventory` on the `Item` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "Item" DROP COLUMN "inventory",
ADD COLUMN     "image_url" TEXT DEFAULT 'n',
ADD COLUMN     "price" DOUBLE PRECISION DEFAULT 0;
