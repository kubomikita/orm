INSERT INTO "eans" ("id", "code", "type") VALUES (1, '111', 2);
UPDATE "books" SET "ean_id" = 1 WHERE id = 1;
SELECT "books".* FROM "books" AS "books" WHERE "books"."id" = 1;
SELECT "eans".* FROM "eans" AS "eans" WHERE "eans"."id" = 1;
SELECT "eans".* FROM "eans" AS "eans" WHERE "eans"."id" IN (1);
INSERT INTO "eans" ("id", "code", "type") VALUES (2, '222', 2);
UPDATE "books" SET "ean_id" = 2 WHERE id = 1;
DELETE FROM "eans" WHERE id = 1;
SELECT "books".* FROM "books" AS "books" WHERE "books"."id" IN (1);
SELECT "eans".* FROM "eans" AS "eans" WHERE "eans"."id" IN (1);
SELECT "eans".* FROM "eans" AS "eans" WHERE "eans"."id" IN (2);
