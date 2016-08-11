CREATE TABLE "warehouse" (
	"id" int NOT NULL,
	"id_ingredient" int NOT NULL,
	"quantity" int NOT NULL,
	"measure" int NOT NULL,
	CONSTRAINT warehouse_pk PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "dishes" (
	"id" serial NOT NULL,
	"name" varchar NOT NULL,
	"price" double NOT NULL,
	"weight" double NOT NULL,
	"measure" int NOT NULL,
	CONSTRAINT dishes_pk PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "employee" (
	"id" bigint NOT NULL,
	"second_name" varchar NOT NULL,
	"name" varchar NOT NULL,
	"birthday" DATE NOT NULL,
	"telephone" varchar NOT NULL,
	"position_id" int NOT NULL,
	"salary" real NOT NULL,
	CONSTRAINT employee_pk PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "positions" (
	"id" int NOT NULL,
	"position_name" varchar NOT NULL,
	CONSTRAINT positions_pk PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "ingredients" (
	"id" bigint NOT NULL,
	"name" varchar NOT NULL,
	CONSTRAINT ingredients_pk PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "list_of_ordered_dishes" (
	"id" serial NOT NULL,
	"id_order" int NOT NULL,
	"id_dish" int NOT NULL,
	CONSTRAINT list_of_ordered_dishes_pk PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "measures" (
	"id" serial NOT NULL,
	"name" varchar NOT NULL,
	CONSTRAINT measures_pk PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "menu" (
	"id" serial NOT NULL,
	"name" varchar NOT NULL,
	CONSTRAINT menu_pk PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "menu_set" (
	"id_menu" int NOT NULL,
	"id_dish" int NOT NULL,
	CONSTRAINT menu_set_pk PRIMARY KEY ("id_menu","id_dish")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "orders" (
	"id" serial NOT NULL,
	"id_waiter" int NOT NULL,
	"table_number" int NOT NULL,
	"order_date" DATE NOT NULL,
	CONSTRAINT orders_pk PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "prepared_dishes" (
	"id" serial NOT NULL,
	"id_dishes" int NOT NULL,
	"id_cooker" int NOT NULL,
	"id_order" int NOT NULL,
	"order_date" DATE NOT NULL,
	CONSTRAINT prepared_dishes_pk PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "recipe" (
	"id" serial NOT NULL,
	"id_dish" int NOT NULL,
	"id_ingredients" int NOT NULL,
	CONSTRAINT recipe_pk PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



ALTER TABLE "warehouse" ADD CONSTRAINT "warehouse_fk0" FOREIGN KEY ("id_ingredient") REFERENCES "ingredients"("id");
ALTER TABLE "warehouse" ADD CONSTRAINT "warehouse_fk1" FOREIGN KEY ("measure") REFERENCES "measures"("id");

ALTER TABLE "dishes" ADD CONSTRAINT "dishes_fk0" FOREIGN KEY ("measure") REFERENCES "measures"("id");

ALTER TABLE "employee" ADD CONSTRAINT "employee_fk0" FOREIGN KEY ("position_id") REFERENCES "positions"("id");



ALTER TABLE "list_of_ordered_dishes" ADD CONSTRAINT "list_of_ordered_dishes_fk0" FOREIGN KEY ("id_order") REFERENCES "orders"("id");
ALTER TABLE "list_of_ordered_dishes" ADD CONSTRAINT "list_of_ordered_dishes_fk1" FOREIGN KEY ("id_dish") REFERENCES "dishes"("id");



ALTER TABLE "menu_set" ADD CONSTRAINT "menu_set_fk0" FOREIGN KEY ("id_menu") REFERENCES "menu"("id");
ALTER TABLE "menu_set" ADD CONSTRAINT "menu_set_fk1" FOREIGN KEY ("id_dish") REFERENCES "dishes"("id");

ALTER TABLE "orders" ADD CONSTRAINT "orders_fk0" FOREIGN KEY ("id_waiter") REFERENCES "employee"("id");

ALTER TABLE "prepared_dishes" ADD CONSTRAINT "prepared_dishes_fk0" FOREIGN KEY ("id_dishes") REFERENCES "dishes"("id");
ALTER TABLE "prepared_dishes" ADD CONSTRAINT "prepared_dishes_fk1" FOREIGN KEY ("id_cooker") REFERENCES "employee"("id");
ALTER TABLE "prepared_dishes" ADD CONSTRAINT "prepared_dishes_fk2" FOREIGN KEY ("id_order") REFERENCES "orders"("id");

ALTER TABLE "recipe" ADD CONSTRAINT "recipe_fk0" FOREIGN KEY ("id_dish") REFERENCES "dishes"("id");
ALTER TABLE "recipe" ADD CONSTRAINT "recipe_fk1" FOREIGN KEY ("id_ingredients") REFERENCES "ingredients"("id");

