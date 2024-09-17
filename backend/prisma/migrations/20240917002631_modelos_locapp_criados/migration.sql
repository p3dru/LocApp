-- CreateTable
CREATE TABLE "users" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "name" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "image" TEXT,
    "role" TEXT NOT NULL DEFAULT 'USER',
    "createdAt" DATETIME DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME
);

-- CreateTable
CREATE TABLE "dias" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "diaDaSemana" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "horarios" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "horario" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "categorias" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "categoria" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "atividades" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "atividade" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "Estabelecimento" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "nome" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "senha" TEXT NOT NULL,
    "descricao" TEXT NOT NULL,
    "valorLocacao" REAL NOT NULL,
    "endereco" TEXT NOT NULL,
    "cidade" TEXT NOT NULL,
    "estado" TEXT NOT NULL,
    "linkMaps" TEXT NOT NULL,
    "imagemPerfil" TEXT NOT NULL,
    "ativo" BOOLEAN NOT NULL DEFAULT false,
    "categoriaid" TEXT NOT NULL,
    CONSTRAINT "Estabelecimento_categoriaid_fkey" FOREIGN KEY ("categoriaid") REFERENCES "categorias" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "estabelecimento_imagens" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "url" TEXT NOT NULL,
    "estabelecimentoId" TEXT NOT NULL,
    CONSTRAINT "estabelecimento_imagens_estabelecimentoId_fkey" FOREIGN KEY ("estabelecimentoId") REFERENCES "Estabelecimento" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Locacao" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "userId" TEXT NOT NULL,
    "estabelecimentoId" TEXT NOT NULL,
    "ativo" BOOLEAN NOT NULL DEFAULT false,
    CONSTRAINT "Locacao_userId_fkey" FOREIGN KEY ("userId") REFERENCES "users" ("id") ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT "Locacao_estabelecimentoId_fkey" FOREIGN KEY ("estabelecimentoId") REFERENCES "Estabelecimento" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "_DiaToEstabelecimento" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL,
    CONSTRAINT "_DiaToEstabelecimento_A_fkey" FOREIGN KEY ("A") REFERENCES "dias" ("id") ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT "_DiaToEstabelecimento_B_fkey" FOREIGN KEY ("B") REFERENCES "Estabelecimento" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "_AtividadeToEstabelecimento" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL,
    CONSTRAINT "_AtividadeToEstabelecimento_A_fkey" FOREIGN KEY ("A") REFERENCES "atividades" ("id") ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT "_AtividadeToEstabelecimento_B_fkey" FOREIGN KEY ("B") REFERENCES "Estabelecimento" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "_EstabelecimentoToHorario" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL,
    CONSTRAINT "_EstabelecimentoToHorario_A_fkey" FOREIGN KEY ("A") REFERENCES "Estabelecimento" ("id") ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT "_EstabelecimentoToHorario_B_fkey" FOREIGN KEY ("B") REFERENCES "horarios" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);

-- CreateIndex
CREATE INDEX "users_name_email_password_idx" ON "users"("name", "email", "password");

-- CreateIndex
CREATE UNIQUE INDEX "_DiaToEstabelecimento_AB_unique" ON "_DiaToEstabelecimento"("A", "B");

-- CreateIndex
CREATE INDEX "_DiaToEstabelecimento_B_index" ON "_DiaToEstabelecimento"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_AtividadeToEstabelecimento_AB_unique" ON "_AtividadeToEstabelecimento"("A", "B");

-- CreateIndex
CREATE INDEX "_AtividadeToEstabelecimento_B_index" ON "_AtividadeToEstabelecimento"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_EstabelecimentoToHorario_AB_unique" ON "_EstabelecimentoToHorario"("A", "B");

-- CreateIndex
CREATE INDEX "_EstabelecimentoToHorario_B_index" ON "_EstabelecimentoToHorario"("B");
