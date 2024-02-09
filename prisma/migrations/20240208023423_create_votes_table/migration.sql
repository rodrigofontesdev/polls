-- CreateTable
CREATE TABLE "Votes" (
    "id" SERIAL NOT NULL,
    "pollOptionsId" TEXT NOT NULL,
    "pollsId" TEXT NOT NULL,
    "sessionId" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Votes_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Votes_sessionId_pollsId_key" ON "Votes"("sessionId", "pollsId");

-- AddForeignKey
ALTER TABLE "Votes" ADD CONSTRAINT "Votes_pollOptionsId_fkey" FOREIGN KEY ("pollOptionsId") REFERENCES "PollOptions"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Votes" ADD CONSTRAINT "Votes_pollsId_fkey" FOREIGN KEY ("pollsId") REFERENCES "Polls"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
