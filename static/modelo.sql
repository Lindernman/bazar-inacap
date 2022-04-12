-- Adminer 4.8.1 PostgreSQL 14.2 (Debian 14.2-1.pgdg110+1) dump

DROP TABLE IF EXISTS "invoices";
DROP SEQUENCE IF EXISTS invoices_id_seq;
CREATE SEQUENCE invoices_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."invoices" (
    "id" integer DEFAULT nextval('invoices_id_seq') NOT NULL,
    "timestamp" timestamptz DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "type" character(1) NOT NULL,
    "is_paid" boolean DEFAULT false NOT NULL,
    CONSTRAINT "invoices_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

COMMENT ON COLUMN "public"."invoices"."type" IS '[1 = Boleta, 2 = Factura]';


DROP TABLE IF EXISTS "items";
CREATE TABLE "public"."items" (
    "sku" text NOT NULL,
    "name" text NOT NULL,
    "description" text NOT NULL,
    "price" integer NOT NULL,
    "weight" integer NOT NULL,
    "available" integer NOT NULL
) WITH (oids = false);


DROP TABLE IF EXISTS "sales";
DROP SEQUENCE IF EXISTS sales_id_seq;
CREATE SEQUENCE sales_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."sales" (
    "id" integer DEFAULT nextval('sales_id_seq') NOT NULL,
    "timestamp" timestamptz DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "is_completed" boolean NOT NULL,
    CONSTRAINT "sales_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "users";
CREATE TABLE "public"."users" (
    "id" uuid DEFAULT uuid_generate_v4() NOT NULL,
    "name" text NOT NULL,
    "email" text NOT NULL,
    "password" text NOT NULL,
    "registered_date" timestamptz DEFAULT now() NOT NULL,
    "last_login_date" timestamptz DEFAULT now() NOT NULL,
    "is_active" boolean DEFAULT true NOT NULL,
    "user_role" text DEFAULT 'Vendedor' NOT NULL,
    "passport_id" character(12) NOT NULL,
    CONSTRAINT "users_email" UNIQUE ("email"),
    CONSTRAINT "users_id" PRIMARY KEY ("id"),
    CONSTRAINT "users_passport_id" UNIQUE ("passport_id")
) WITH (oids = false);

INSERT INTO "users" ("id", "name", "email", "password", "registered_date", "last_login_date", "is_active", "user_role", "passport_id") VALUES
('c0553393-a51b-4b03-81c4-ca47b8e3b1b6',	'Ostap Demcenco',	'ostap@mail.com',	'$2a$10$h9meR.4IWa1RqWWPOtA.BOvO6FhYzPIRoB/WV3eJ4swGnNDrNavaK',	'2022-04-11 01:46:30.820371+00',	'2022-04-11 01:46:30.820371+00',	'1',	'Vendedor',	'11.111.111-1');

DROP TABLE IF EXISTS "work_shifts";
DROP SEQUENCE IF EXISTS work_shifts_id_seq;
CREATE SEQUENCE work_shifts_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."work_shifts" (
    "id" integer DEFAULT nextval('work_shifts_id_seq') NOT NULL,
    "start_time" timestamptz NOT NULL,
    "end_time" timestamptz,
    "is_active" boolean NOT NULL,
    "started_by" uuid NOT NULL,
    CONSTRAINT "work_shifts_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


-- 2022-04-12 01:22:08.208667+00