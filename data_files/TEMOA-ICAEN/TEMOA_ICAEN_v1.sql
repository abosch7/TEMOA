BEGIN TRANSACTION;

--  INTERVALS TEMPORALS DE LES DADES INTRODUIDES
CREATE TABLE "time_data" (
   "t_data"    integer,
   primary key("t_data")
);
INSERT INTO "time_data" VALUES (2010);
INSERT INTO "time_data" VALUES (2015);
INSERT INTO "time_data" VALUES (2020);
INSERT INTO "time_data" VALUES (2025);
INSERT INTO "time_data" VALUES (2030);
INSERT INTO "time_data" VALUES (2040);
INSERT INTO "time_data" VALUES (2050);

--  INTERVALS TEMPORALS DE LES DADES PROJECTADES
CREATE TABLE "time_projection" (
   "t_projection"    integer,
   primary key("t_projection")
);
INSERT INTO "time_projection" VALUES (2011);
INSERT INTO "time_projection" VALUES (2012);
INSERT INTO "time_projection" VALUES (2013);
INSERT INTO "time_projection" VALUES (2014);
INSERT INTO "time_projection" VALUES (2015);
INSERT INTO "time_projection" VALUES (2016);
INSERT INTO "time_projection" VALUES (2017);
INSERT INTO "time_projection" VALUES (2018);
INSERT INTO "time_projection" VALUES (2019);
INSERT INTO "time_projection" VALUES (2020);
INSERT INTO "time_projection" VALUES (2021);
INSERT INTO "time_projection" VALUES (2022);
INSERT INTO "time_projection" VALUES (2023);
INSERT INTO "time_projection" VALUES (2024);
INSERT INTO "time_projection" VALUES (2025);
INSERT INTO "time_projection" VALUES (2026);
INSERT INTO "time_projection" VALUES (2027);
INSERT INTO "time_projection" VALUES (2028);
INSERT INTO "time_projection" VALUES (2029);
INSERT INTO "time_projection" VALUES (2030);
INSERT INTO "time_projection" VALUES (2031);
INSERT INTO "time_projection" VALUES (2032);
INSERT INTO "time_projection" VALUES (2033);
INSERT INTO "time_projection" VALUES (2034);
INSERT INTO "time_projection" VALUES (2035);
INSERT INTO "time_projection" VALUES (2036);
INSERT INTO "time_projection" VALUES (2037);
INSERT INTO "time_projection" VALUES (2038);
INSERT INTO "time_projection" VALUES (2039);
INSERT INTO "time_projection" VALUES (2040);
INSERT INTO "time_projection" VALUES (2041);
INSERT INTO "time_projection" VALUES (2042);
INSERT INTO "time_projection" VALUES (2043);
INSERT INTO "time_projection" VALUES (2044);
INSERT INTO "time_projection" VALUES (2045);
INSERT INTO "time_projection" VALUES (2046);
INSERT INTO "time_projection" VALUES (2047);
INSERT INTO "time_projection" VALUES (2048);
INSERT INTO "time_projection" VALUES (2049);
INSERT INTO "time_projection" VALUES (2050);

--  ESCENARIS 
CREATE TABLE "escenaris" (
   "escenaris"  text,
   primary key("escenaris")
);
INSERT INTO "escenaris" VALUES ('BASE');
INSERT INTO "escenaris" VALUES ('APOSTA');

--  FONTS ENERGÈTIQUES
CREATE TABLE "productes" (
   "productes"  text,
   primary key("productes")
);
INSERT INTO "productes" VALUES ('GLP');
INSERT INTO "productes" VALUES ('electricitat');
INSERT INTO "productes" VALUES ('biogas_xarxa_local');
INSERT INTO "productes" VALUES ('gas_natural');

-- Valors de les persones per habitatge
CREATE TABLE "persones_habitatge" (
   "t_projection" integer,
   "value" real,
   primary key("t_projection"),
   foreign key("t_projection") references "time_projection"("t_projection")
);
INSERT INTO "persones_habitatge" VALUES (2011, 2.517);
INSERT INTO "persones_habitatge" VALUES (2012, 2.514);
INSERT INTO "persones_habitatge" VALUES (2013, 2.510);
INSERT INTO "persones_habitatge" VALUES (2014, 2.507);
INSERT INTO "persones_habitatge" VALUES (2015, 2.504);
INSERT INTO "persones_habitatge" VALUES (2016, 2.501);
INSERT INTO "persones_habitatge" VALUES (2017, 2.498);
INSERT INTO "persones_habitatge" VALUES (2018, 2.491);
INSERT INTO "persones_habitatge" VALUES (2019, 2.484);
INSERT INTO "persones_habitatge" VALUES (2020, 2.477);
INSERT INTO "persones_habitatge" VALUES (2021, 2.469);
INSERT INTO "persones_habitatge" VALUES (2022, 2.462);
INSERT INTO "persones_habitatge" VALUES (2023, 2.454);
INSERT INTO "persones_habitatge" VALUES (2024, 2.446);
INSERT INTO "persones_habitatge" VALUES (2025, 2.437);
INSERT INTO "persones_habitatge" VALUES (2026, 2.428);
INSERT INTO "persones_habitatge" VALUES (2027, 2.420);
INSERT INTO "persones_habitatge" VALUES (2028, 2.411);
INSERT INTO "persones_habitatge" VALUES (2029, 2.403);
INSERT INTO "persones_habitatge" VALUES (2030, 2.395);
INSERT INTO "persones_habitatge" VALUES (2031, 2.387);
INSERT INTO "persones_habitatge" VALUES (2032, 2.380);
INSERT INTO "persones_habitatge" VALUES (2033, 2.373);
INSERT INTO "persones_habitatge" VALUES (2034, 2.366);
INSERT INTO "persones_habitatge" VALUES (2035, 2.359);
INSERT INTO "persones_habitatge" VALUES (2036, 2.353);
INSERT INTO "persones_habitatge" VALUES (2037, 2.346);
INSERT INTO "persones_habitatge" VALUES (2038, 2.340);
INSERT INTO "persones_habitatge" VALUES (2039, 2.335);
INSERT INTO "persones_habitatge" VALUES (2040, 2.330);
INSERT INTO "persones_habitatge" VALUES (2041, 2.325);
INSERT INTO "persones_habitatge" VALUES (2042, 2.320);
INSERT INTO "persones_habitatge" VALUES (2043, 2.316);
INSERT INTO "persones_habitatge" VALUES (2044, 2.313);
INSERT INTO "persones_habitatge" VALUES (2045, 2.310);
INSERT INTO "persones_habitatge" VALUES (2046, 2.307);
INSERT INTO "persones_habitatge" VALUES (2047, 2.305);
INSERT INTO "persones_habitatge" VALUES (2048, 2.304);
INSERT INTO "persones_habitatge" VALUES (2049, 2.303);
INSERT INTO "persones_habitatge" VALUES (2050, 2.303);

-- Valors del percentatge depresència en els àpats a l'habitatge
CREATE TABLE "presencia_apats" (
   "scen" text,
   "t_data" integer,
   "value" real,
   primary key("scen","t_data"),
   foreign key("scen") references "escenari"("scen"),
   foreign key("t_data") references "time_data"("t_data")
   
);
INSERT INTO "presencia_apats" VALUES ("BASE", 2010, 0.83);
INSERT INTO "presencia_apats" VALUES ("BASE", 2015, 0.83);
INSERT INTO "presencia_apats" VALUES ("BASE", 2020, 0.83);
INSERT INTO "presencia_apats" VALUES ("BASE", 2025, 0.822);
INSERT INTO "presencia_apats" VALUES ("BASE", 2030, 0.814);
INSERT INTO "presencia_apats" VALUES ("BASE", 2040, 0.804);
INSERT INTO "presencia_apats" VALUES ("BASE", 2050, 0.80);
INSERT INTO "presencia_apats" VALUES ("APOSTA", 2010, 0.83);
INSERT INTO "presencia_apats" VALUES ("APOSTA", 2015, 0.83);
INSERT INTO "presencia_apats" VALUES ("APOSTA", 2020, 0.83);
INSERT INTO "presencia_apats" VALUES ("APOSTA", 2025, 0.822);
INSERT INTO "presencia_apats" VALUES ("APOSTA", 2030, 0.814);
INSERT INTO "presencia_apats" VALUES ("APOSTA", 2040, 0.804);
INSERT INTO "presencia_apats" VALUES ("APOSTA", 2050, 0.80);

-- Valors dels canvis en el consum mig per àpat (% anual)
CREATE TABLE "canvi_apats" (
   "scen" text,
   "t_data" integer,
   "value" real,
   primary key("scen","t_data"),
   foreign key("scen") references "escenari"("scen"),
   foreign key("t_data") references "time_data"("t_data")
);
INSERT INTO "canvi_apats" VALUES ("BASE", 2010, 0.0);
INSERT INTO "canvi_apats" VALUES ("BASE", 2015, 0.0);
INSERT INTO "canvi_apats" VALUES ("BASE", 2020, 0.0);
INSERT INTO "canvi_apats" VALUES ("BASE", 2025, -0.006);
INSERT INTO "canvi_apats" VALUES ("BASE", 2030, -0.006);
INSERT INTO "canvi_apats" VALUES ("BASE", 2040, -0.003);
INSERT INTO "canvi_apats" VALUES ("BASE", 2050, -0.002);
INSERT INTO "canvi_apats" VALUES ("APOSTA", 2010, 0.0);
INSERT INTO "canvi_apats" VALUES ("APOSTA", 2015, 0.0);
INSERT INTO "canvi_apats" VALUES ("APOSTA", 2020, 0.0);
INSERT INTO "canvi_apats" VALUES ("APOSTA", 2025, -0.006);
INSERT INTO "canvi_apats" VALUES ("APOSTA", 2030, -0.006);
INSERT INTO "canvi_apats" VALUES ("APOSTA", 2040, -0.003);
INSERT INTO "canvi_apats" VALUES ("APOSTA", 2050, -0.002);

-- Rendiments de cada tecnologia
CREATE TABLE "rendiments" (
   "scen" text,
   "prod" text,
   "t_data" integer,
   "value" real,
   primary key("scen","prod"),
   foreign key("scen") references "escenari"("scen"),
   foreign key("prod") references "productes"("prod")
);
INSERT INTO "rendiments" VALUES ("BASE", "GLP", 2010, 0.85);
INSERT INTO "rendiments" VALUES ("BASE", "Electricitat", 2010, 1.00);
INSERT INTO "rendiments" VALUES ("BASE", "Biogàs xarxa local", 2010, 0.85);
INSERT INTO "rendiments" VALUES ("BASE", "Gas natural", 2010, 0.85);
INSERT INTO "rendiments" VALUES ("APOSTA", "GLP", 2010, 0.85);
INSERT INTO "rendiments" VALUES ("APOSTA", "Electricitat", 2010, 1.00);
INSERT INTO "rendiments" VALUES ("APOSTA", "Biogàs xarxa local", 2010, 0.85);
INSERT INTO "rendiments" VALUES ("APOSTA", "Gas natural", 2010, 0.85);

-- Repartiment de formes
CREATE TABLE "repartiment_formes" (
   "scen" text,
   "t_data" integer,
   "prod" text,
   "value" real,
   primary key ("scen", "t_data", "prod"),
   foreign key("scen") references "escenari"("scen"),
   foreign key("prod") references "productes"("prod"),
   foreign key("t_data") references "time_data"("t_data")
);

INSERT INTO "repartiment_formes" VALUES ("BASE", 2005, "GLP", 0.15);
INSERT INTO "repartiment_formes" VALUES ("BASE", 2010, "GLP", 0.15);
INSERT INTO "repartiment_formes" VALUES ("BASE", 2015, "GLP", 0.15);
INSERT INTO "repartiment_formes" VALUES ("BASE", 2020, "GLP", 0.15);
INSERT INTO "repartiment_formes" VALUES ("BASE", 2025, "GLP", 0.12);
INSERT INTO "repartiment_formes" VALUES ("BASE", 2030, "GLP", 0.085);
INSERT INTO "repartiment_formes" VALUES ("BASE", 2040, "GLP", 0.04);
INSERT INTO "repartiment_formes" VALUES ("BASE", 2050, "GLP", 0.03);

INSERT INTO "repartiment_formes" VALUES ("BASE", 2005, "Electricitat", 0.143);
INSERT INTO "repartiment_formes" VALUES ("BASE", 2010, "Electricitat", 0.20);
INSERT INTO "repartiment_formes" VALUES ("BASE", 2015, "Electricitat", 0.21);
INSERT INTO "repartiment_formes" VALUES ("BASE", 2020, "Electricitat", 0.22);
INSERT INTO "repartiment_formes" VALUES ("BASE", 2025, "Electricitat", 0.25);
INSERT INTO "repartiment_formes" VALUES ("BASE", 2030, "Electricitat", 0.35);
INSERT INTO "repartiment_formes" VALUES ("BASE", 2040, "Electricitat", 0.60);
INSERT INTO "repartiment_formes" VALUES ("BASE", 2050, "Electricitat", 0.70);

INSERT INTO "repartiment_formes" VALUES ("BASE", 2005, "Biogàs xarxa local", 0.0);
INSERT INTO "repartiment_formes" VALUES ("BASE", 2010, "Biogàs xarxa local", 0.0);
INSERT INTO "repartiment_formes" VALUES ("BASE", 2015, "Biogàs xarxa local", 0.0);
INSERT INTO "repartiment_formes" VALUES ("BASE", 2020, "Biogàs xarxa local", 0.0);
INSERT INTO "repartiment_formes" VALUES ("BASE", 2025, "Biogàs xarxa local", 0.0);
INSERT INTO "repartiment_formes" VALUES ("BASE", 2030, "Biogàs xarxa local", 0.0);
INSERT INTO "repartiment_formes" VALUES ("BASE", 2040, "Biogàs xarxa local", 0.0);
INSERT INTO "repartiment_formes" VALUES ("BASE", 2050, "Biogàs xarxa local", 0.0);

INSERT INTO "repartiment_formes" VALUES ("BASE", 2005, "Gas natural", 0.707);
INSERT INTO "repartiment_formes" VALUES ("BASE", 2010, "Gas natural", 0.65);
INSERT INTO "repartiment_formes" VALUES ("BASE", 2015, "Gas natural", 0.64);
INSERT INTO "repartiment_formes" VALUES ("BASE", 2020, "Gas natural", 0.63);
INSERT INTO "repartiment_formes" VALUES ("BASE", 2025, "Gas natural", 0.63);
INSERT INTO "repartiment_formes" VALUES ("BASE", 2030, "Gas natural", 0.565);
INSERT INTO "repartiment_formes" VALUES ("BASE", 2040, "Gas natural", 0.36);
INSERT INTO "repartiment_formes" VALUES ("BASE", 2050, "Gas natural", 0.27);

INSERT INTO "repartiment_formes" VALUES ("APOSTA", 2005, "GLP", 0.15);
INSERT INTO "repartiment_formes" VALUES ("APOSTA", 2010, "GLP", 0.15);
INSERT INTO "repartiment_formes" VALUES ("APOSTA", 2015, "GLP", 0.15);
INSERT INTO "repartiment_formes" VALUES ("APOSTA", 2020, "GLP", 0.15);
INSERT INTO "repartiment_formes" VALUES ("APOSTA", 2025, "GLP", 0.12);
INSERT INTO "repartiment_formes" VALUES ("APOSTA", 2030, "GLP", 0.075);
INSERT INTO "repartiment_formes" VALUES ("APOSTA", 2040, "GLP", 0.03);
INSERT INTO "repartiment_formes" VALUES ("APOSTA", 2050, "GLP", 0.0);

INSERT INTO "repartiment_formes" VALUES ("APOSTA", 2005, "Electricitat", 0.143);
INSERT INTO "repartiment_formes" VALUES ("APOSTA", 2010, "Electricitat", 0.20);
INSERT INTO "repartiment_formes" VALUES ("APOSTA", 2015, "Electricitat", 0.21);
INSERT INTO "repartiment_formes" VALUES ("APOSTA", 2020, "Electricitat", 0.22);
INSERT INTO "repartiment_formes" VALUES ("APOSTA", 2025, "Electricitat", 0.27);
INSERT INTO "repartiment_formes" VALUES ("APOSTA", 2030, "Electricitat", 0.525);
INSERT INTO "repartiment_formes" VALUES ("APOSTA", 2040, "Electricitat", 0.82);
INSERT INTO "repartiment_formes" VALUES ("APOSTA", 2050, "Electricitat", 0.99);

INSERT INTO "repartiment_formes" VALUES ("APOSTA", 2005, "Biogàs xarxa local", 0.0);
INSERT INTO "repartiment_formes" VALUES ("APOSTA", 2010, "Biogàs xarxa local", 0.0);
INSERT INTO "repartiment_formes" VALUES ("APOSTA", 2015, "Biogàs xarxa local", 0.0);
INSERT INTO "repartiment_formes" VALUES ("APOSTA", 2020, "Biogàs xarxa local", 0.0);
INSERT INTO "repartiment_formes" VALUES ("APOSTA", 2025, "Biogàs xarxa local", 0.0);
INSERT INTO "repartiment_formes" VALUES ("APOSTA", 2030, "Biogàs xarxa local", 0.0);
INSERT INTO "repartiment_formes" VALUES ("APOSTA", 2040, "Biogàs xarxa local", 0.004);
INSERT INTO "repartiment_formes" VALUES ("APOSTA", 2050, "Biogàs xarxa local", 0.01);

INSERT INTO "repartiment_formes" VALUES ("APOSTA", 2005, "Gas natural", 0.707);
INSERT INTO "repartiment_formes" VALUES ("APOSTA", 2010, "Gas natural", 0.65);
INSERT INTO "repartiment_formes" VALUES ("APOSTA", 2015, "Gas natural", 0.64);
INSERT INTO "repartiment_formes" VALUES ("APOSTA", 2020, "Gas natural", 0.63);
INSERT INTO "repartiment_formes" VALUES ("APOSTA", 2025, "Gas natural", 0.61);
INSERT INTO "repartiment_formes" VALUES ("APOSTA", 2030, "Gas natural", 0.40);
INSERT INTO "repartiment_formes" VALUES ("APOSTA", 2040, "Gas natural", 0.146);
INSERT INTO "repartiment_formes" VALUES ("APOSTA", 2050, "Gas natural", 0.0);

-- Consum real GN
CREATE TABLE "consum_real_GN" (
   "t_data" integer,
   "value" real,
   "unitats" text,
   primary key("t_data"),
   foreign key("t_data") references "time_data"("t_data")
);
INSERT INTO "consum_real_GN" VALUES (2011, 0.054, "tep/habitatge");
INSERT INTO "consum_real_GN" VALUES (2012, 0.050, "tep/habitatge");
INSERT INTO "consum_real_GN" VALUES (2013, 0.051, "tep/habitatge");
INSERT INTO "consum_real_GN" VALUES (2014, 0.052, "tep/habitatge");
INSERT INTO "consum_real_GN" VALUES (2015, 0.054, "tep/habitatge");
INSERT INTO "consum_real_GN" VALUES (2016, 0.051, "tep/habitatge");
INSERT INTO "consum_real_GN" VALUES (2017, 0.053, "tep/habitatge");
INSERT INTO "consum_real_GN" VALUES (2018, 0.059, "tep/habitatge");
INSERT INTO "consum_real_GN" VALUES (2019, 0.054, "tep/habitatge");

COMMIT;