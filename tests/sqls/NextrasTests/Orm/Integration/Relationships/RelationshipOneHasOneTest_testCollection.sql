SELECT "authors".* FROM "public"."authors" AS "authors" WHERE "authors"."id" = 1;
SELECT "publishers".* FROM "publishers" AS "publishers" WHERE "publishers"."publisher_id" = 1;
START TRANSACTION;
INSERT INTO "eans" ("code", "type") VALUES ('GoTEAN', 2);
SELECT CURRVAL('public.eans_id_seq');
INSERT INTO "books" ("title", "author_id", "translator_id", "next_part", "ean_id", "publisher_id", "genre", "published_at", "printed_at", "price", "price_currency", "orig_price_cents", "orig_price_currency") VALUES ('GoT', 1, NULL, NULL, 1, 1, 'fantasy', '2021-12-31 23:59:59.000000'::timestamp, NULL, NULL, NULL, NULL, NULL);
SELECT CURRVAL('public.books_id_seq');
COMMIT;
SELECT
  COUNT(*) AS count
FROM
  (
    SELECT
      "eans"."id"
    FROM
      "eans" AS "eans"
      LEFT JOIN "books" AS "book" ON ("eans"."id" = "book"."ean_id")
    WHERE
      "book"."title" = 'GoT'
  ) temp;

SELECT
  "eans".*
FROM
  "eans" AS "eans"
  LEFT JOIN "books" AS "book" ON ("eans"."id" = "book"."ean_id")
WHERE
  "book"."title" = 'GoT'
ORDER BY
  "book"."title" ASC;
