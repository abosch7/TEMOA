--  PARAMETRES INCOPORTARS A CUINA
CREATE TABLE 'parametres' (
   'params'    text,
   primary key('params')
);
INSERT INTO 'parametres' VALUES('PERHAB');   -- Persones per habitatge
INSERT INTO 'parametres' VALUES('PRESAP');   -- Presencia en àpats a habitatge 
INSERT INTO 'parametres' VALUES('CANVAP');   -- Canvis en els àpats
INSERT INTO 'parametres' VALUES('REND');     -- Rendiments tecnologies
INSERT INTO 'parametres' VALUES('REPFORM');  -- Repartiment de formes de tecnologia
INSERT INTO 'parametres' VALUES('CONGN');    -- Consum real GN per a cuina


--  INTERVALS TEMPORALS DE LES DADES INTRODUIDES
CREATE TABLE 'time_slices' (
   't_slices'    integer,
   primary key('t_slices')
);
INSERT INTO 'time_slices' VALUES (2010);
INSERT INTO 'time_slices' VALUES (2011);
INSERT INTO 'time_slices' VALUES (2012);
INSERT INTO 'time_slices' VALUES (2013);
INSERT INTO 'time_slices' VALUES (2014);
INSERT INTO 'time_slices' VALUES (2015);
INSERT INTO 'time_slices' VALUES (2016);
INSERT INTO 'time_slices' VALUES (2017);
INSERT INTO 'time_slices' VALUES (2018);
INSERT INTO 'time_slices' VALUES (2019);
INSERT INTO 'time_slices' VALUES (2020);
INSERT INTO 'time_slices' VALUES (2021);
INSERT INTO 'time_slices' VALUES (2022);
INSERT INTO 'time_slices' VALUES (2023);
INSERT INTO 'time_slices' VALUES (2024);
INSERT INTO 'time_slices' VALUES (2025);
INSERT INTO 'time_slices' VALUES (2026);
INSERT INTO 'time_slices' VALUES (2027);
INSERT INTO 'time_slices' VALUES (2028);
INSERT INTO 'time_slices' VALUES (2029);
INSERT INTO 'time_slices' VALUES (2030);
INSERT INTO 'time_slices' VALUES (2031);
INSERT INTO 'time_slices' VALUES (2032);
INSERT INTO 'time_slices' VALUES (2033);
INSERT INTO 'time_slices' VALUES (2034);
INSERT INTO 'time_slices' VALUES (2035);
INSERT INTO 'time_slices' VALUES (2036);
INSERT INTO 'time_slices' VALUES (2037);
INSERT INTO 'time_slices' VALUES (2038);
INSERT INTO 'time_slices' VALUES (2039);
INSERT INTO 'time_slices' VALUES (2040);
INSERT INTO 'time_slices' VALUES (2041);
INSERT INTO 'time_slices' VALUES (2042);
INSERT INTO 'time_slices' VALUES (2043);
INSERT INTO 'time_slices' VALUES (2044);
INSERT INTO 'time_slices' VALUES (2045);
INSERT INTO 'time_slices' VALUES (2046);
INSERT INTO 'time_slices' VALUES (2047);
INSERT INTO 'time_slices' VALUES (2048);
INSERT INTO 'time_slices' VALUES (2049);
INSERT INTO 'time_slices' VALUES (2050);

--  ESCENARIS 
CREATE TABLE 'escenaris' (
   'escenaris'  text,
   primary key('escenaris')
);
INSERT INTO 'escenaris' VALUES ('BASE'); -- ESCENARI BASE
INSERT INTO 'escenaris' VALUES ('APOSTA'); -- ESCENARI APOSTA

--  FONTS ENERGÈTIQUES
CREATE TABLE 'productes' (
   'productes'  text,
   primary key('productes')
);
INSERT INTO 'productes' VALUES ('GLP'); -- Gas Licuat del Petroli
INSERT INTO 'productes' VALUES ('ELE'); -- Electrcitat
INSERT INTO 'productes' VALUES ('BIO'); -- Biogas xarxa local
INSERT INTO 'productes' VALUES ('GN'); -- GN

-- Taula dels paràmetres de l'ús de cuina
CREATE TABLE 'cuina' (
   'param' text,
   'scen' text,
   't_slices' integer,
   'prod' text,
   'value' real,
   'unitats' text,
   'flag' integer, -- (0-imposat; 1-calculat)
   primary key('param','scen','t_slices', 'prod')
);

-- Persones per habitatge
INSERT INTO 'cuina' VALUES ('PERHAB','',2011,'', 2.517,'persones/habitatge',0);
INSERT INTO 'cuina' VALUES ('PERHAB','',2012,'', 2.514,'persones/habitatge',0);
INSERT INTO 'cuina' VALUES ('PERHAB','',2013,'', 2.510,'persones/habitatge',0);
INSERT INTO 'cuina' VALUES ('PERHAB','',2014,'', 2.507,'persones/habitatge',0);
INSERT INTO 'cuina' VALUES ('PERHAB','',2015,'', 2.504,'persones/habitatge',0);
INSERT INTO 'cuina' VALUES ('PERHAB','',2016,'', 2.501,'persones/habitatge',0);
INSERT INTO 'cuina' VALUES ('PERHAB','',2017,'', 2.498,'persones/habitatge',0);
INSERT INTO 'cuina' VALUES ('PERHAB','',2018,'', 2.491,'persones/habitatge',0);
INSERT INTO 'cuina' VALUES ('PERHAB','',2019,'', 2.484,'persones/habitatge',0);
INSERT INTO 'cuina' VALUES ('PERHAB','',2020,'', 2.477,'persones/habitatge',0);
INSERT INTO 'cuina' VALUES ('PERHAB','',2021,'', 2.469,'persones/habitatge',0);
INSERT INTO 'cuina' VALUES ('PERHAB','',2022,'', 2.462,'persones/habitatge',0);
INSERT INTO 'cuina' VALUES ('PERHAB','',2023,'', 2.454,'persones/habitatge',0);
INSERT INTO 'cuina' VALUES ('PERHAB','',2024,'', 2.446,'persones/habitatge',0);
INSERT INTO 'cuina' VALUES ('PERHAB','',2025,'', 2.437,'persones/habitatge',0);
INSERT INTO 'cuina' VALUES ('PERHAB','',2026,'', 2.428,'persones/habitatge',0);
INSERT INTO 'cuina' VALUES ('PERHAB','',2027,'', 2.420,'persones/habitatge',0);
INSERT INTO 'cuina' VALUES ('PERHAB','',2028,'', 2.411,'persones/habitatge',0);
INSERT INTO 'cuina' VALUES ('PERHAB','',2029,'', 2.403,'persones/habitatge',0);
INSERT INTO 'cuina' VALUES ('PERHAB','',2030,'', 2.395,'persones/habitatge',0);
INSERT INTO 'cuina' VALUES ('PERHAB','',2031,'', 2.387,'persones/habitatge',0);
INSERT INTO 'cuina' VALUES ('PERHAB','',2032,'', 2.380,'persones/habitatge',0);
INSERT INTO 'cuina' VALUES ('PERHAB','',2033,'', 2.373,'persones/habitatge',0);
INSERT INTO 'cuina' VALUES ('PERHAB','',2034,'', 2.366,'persones/habitatge',0);
INSERT INTO 'cuina' VALUES ('PERHAB','',2035,'', 2.359,'persones/habitatge',0);
INSERT INTO 'cuina' VALUES ('PERHAB','',2036,'', 2.353,'persones/habitatge',0);
INSERT INTO 'cuina' VALUES ('PERHAB','',2037,'', 2.346,'persones/habitatge',0);
INSERT INTO 'cuina' VALUES ('PERHAB','',2038,'', 2.340,'persones/habitatge',0);
INSERT INTO 'cuina' VALUES ('PERHAB','',2039,'', 2.335,'persones/habitatge',0);
INSERT INTO 'cuina' VALUES ('PERHAB','',2040,'', 2.330,'persones/habitatge',0);
INSERT INTO 'cuina' VALUES ('PERHAB','',2041,'', 2.325,'persones/habitatge',0);
INSERT INTO 'cuina' VALUES ('PERHAB','',2042,'', 2.320,'persones/habitatge',0);
INSERT INTO 'cuina' VALUES ('PERHAB','',2043,'', 2.316,'persones/habitatge',0);
INSERT INTO 'cuina' VALUES ('PERHAB','',2044,'', 2.313,'persones/habitatge',0);
INSERT INTO 'cuina' VALUES ('PERHAB','',2045,'', 2.310,'persones/habitatge',0);
INSERT INTO 'cuina' VALUES ('PERHAB','',2046,'', 2.307,'persones/habitatge',0);
INSERT INTO 'cuina' VALUES ('PERHAB','',2047,'', 2.305,'persones/habitatge',0);
INSERT INTO 'cuina' VALUES ('PERHAB','',2048,'', 2.304,'persones/habitatge',0);
INSERT INTO 'cuina' VALUES ('PERHAB','',2049,'', 2.303,'persones/habitatge',0);
INSERT INTO 'cuina' VALUES ('PERHAB','',2050,'', 2.303,'persones/habitatge',0);

-- Presencia en àpats a habitatge 
INSERT INTO 'cuina' VALUES ('PRESAP','BASE', 2010, '', 0.83, 'tant per u', 0);
INSERT INTO 'cuina' VALUES ('PRESAP','BASE', 2015, '', 0.83, 'tant per u', 0);
INSERT INTO 'cuina' VALUES ('PRESAP','BASE', 2020, '', 0.83, 'tant per u', 0);
INSERT INTO 'cuina' VALUES ('PRESAP','BASE', 2025, '', 0.822, 'tant per u', 0);
INSERT INTO 'cuina' VALUES ('PRESAP','BASE', 2030, '', 0.814, 'tant per u', 0);
INSERT INTO 'cuina' VALUES ('PRESAP','BASE', 2040, '', 0.804, 'tant per u', 0);
INSERT INTO 'cuina' VALUES ('PRESAP','BASE', 2050, '', 0.80, 'tant per u', 0);
INSERT INTO 'cuina' VALUES ('PRESAP','APOSTA', 2010, '', 0.83, 'tant per u', 0);
INSERT INTO 'cuina' VALUES ('PRESAP','APOSTA', 2015, '', 0.83, 'tant per u', 0);
INSERT INTO 'cuina' VALUES ('PRESAP','APOSTA', 2020, '', 0.83, 'tant per u', 0);
INSERT INTO 'cuina' VALUES ('PRESAP','APOSTA', 2025, '', 0.822, 'tant per u', 0);
INSERT INTO 'cuina' VALUES ('PRESAP','APOSTA', 2030, '', 0.814, 'tant per u', 0);
INSERT INTO 'cuina' VALUES ('PRESAP','APOSTA', 2040, '', 0.804, 'tant per u', 0);
INSERT INTO 'cuina' VALUES ('PRESAP','APOSTA', 2050, '', 0.80, 'tant per u', 0);

-- Canvis en els àpats
INSERT INTO 'cuina' VALUES ('CANVAP','BASE', 2010, '', 0.0, 'tant per u', 0);
INSERT INTO 'cuina' VALUES ('CANVAP','BASE', 2015, '', 0.0, 'tant per u', 0);
INSERT INTO 'cuina' VALUES ('CANVAP','BASE', 2020, '', 0.0, 'tant per u', 0);
INSERT INTO 'cuina' VALUES ('CANVAP','BASE', 2025, '', -0.006, 'tant per u', 0);
INSERT INTO 'cuina' VALUES ('CANVAP','BASE', 2030, '', -0.006, 'tant per u', 0);
INSERT INTO 'cuina' VALUES ('CANVAP','BASE', 2040, '', -0.003, 'tant per u', 0);
INSERT INTO 'cuina' VALUES ('CANVAP','BASE', 2050, '', -0.002, 'tant per u', 0);
INSERT INTO 'cuina' VALUES ('CANVAP','APOSTA', 2010, '', 0.0, 'tant per u', 0);
INSERT INTO 'cuina' VALUES ('CANVAP','APOSTA', 2015, '', 0.0, 'tant per u', 0);
INSERT INTO 'cuina' VALUES ('CANVAP','APOSTA', 2020, '', 0.0, 'tant per u', 0);
INSERT INTO 'cuina' VALUES ('CANVAP','APOSTA', 2025, '', -0.006, 'tant per u', 0);
INSERT INTO 'cuina' VALUES ('CANVAP','APOSTA', 2030, '', -0.006, 'tant per u', 0);
INSERT INTO 'cuina' VALUES ('CANVAP','APOSTA', 2040, '', -0.003, 'tant per u', 0);
INSERT INTO 'cuina' VALUES ('CANVAP','APOSTA', 2050, '', -0.002, 'tant per u', 0);

-- Rendiments tecnologies

INSERT INTO 'cuina' VALUES ('REND', 'BASE', 2010, 'GLP', 0.85, 'tant per u', 0);
INSERT INTO 'cuina' VALUES ('REND', 'BASE', 2010, 'ELE', 1.00, 'tant per u', 0);
INSERT INTO 'cuina' VALUES ('REND', 'BASE', 2010, 'BIO', 0.85, 'tant per u', 0);
INSERT INTO 'cuina' VALUES ('REND', 'BASE', 2010, 'GN', 0.85, 'tant per u', 0);
INSERT INTO 'cuina' VALUES ('REND', 'APOSTA', 2010, 'GLP', 0.85, 'tant per u', 0);
INSERT INTO 'cuina' VALUES ('REND', 'APOSTA', 2010, 'ELE', 1.00, 'tant per u', 0);
INSERT INTO 'cuina' VALUES ('REND', 'APOSTA', 2010, 'BIO', 0.85, 'tant per u', 0);
INSERT INTO 'cuina' VALUES ('REND', 'APOSTA', 2010, 'GN', 0.85, 'tant per u', 0);

-- Repartiment de formes de tecnologia

INSERT INTO 'cuina' VALUES ('REPFORM', 'BASE', 2005, 'GLP', 0.15, 'tant per u', 0);
INSERT INTO 'cuina' VALUES ('REPFORM', 'BASE', 2010, 'GLP', 0.15, 'tant per u', 0);
INSERT INTO 'cuina' VALUES ('REPFORM', 'BASE', 2015, 'GLP', 0.15, 'tant per u', 0);
INSERT INTO 'cuina' VALUES ('REPFORM', 'BASE', 2020, 'GLP', 0.15, 'tant per u', 0);
INSERT INTO 'cuina' VALUES ('REPFORM', 'BASE', 2025, 'GLP', 0.12, 'tant per u', 0);
INSERT INTO 'cuina' VALUES ('REPFORM', 'BASE', 2030, 'GLP', 0.085, 'tant per u', 0);
INSERT INTO 'cuina' VALUES ('REPFORM', 'BASE', 2040, 'GLP', 0.04, 'tant per u', 0);
INSERT INTO 'cuina' VALUES ('REPFORM', 'BASE', 2050, 'GLP', 0.03, 'tant per u', 0);

INSERT INTO 'cuina' VALUES ('REPFORM', 'BASE', 2005, 'ELE', 0.143, 'tant per u', 0);
INSERT INTO 'cuina' VALUES ('REPFORM', 'BASE', 2010, 'ELE', 0.20, 'tant per u', 0);
INSERT INTO 'cuina' VALUES ('REPFORM', 'BASE', 2015, 'ELE', 0.21, 'tant per u', 0);
INSERT INTO 'cuina' VALUES ('REPFORM', 'BASE', 2020, 'ELE', 0.22, 'tant per u', 0);
INSERT INTO 'cuina' VALUES ('REPFORM', 'BASE', 2025, 'ELE', 0.25, 'tant per u', 0);
INSERT INTO 'cuina' VALUES ('REPFORM', 'BASE', 2030, 'ELE', 0.35, 'tant per u', 0);
INSERT INTO 'cuina' VALUES ('REPFORM', 'BASE', 2040, 'ELE', 0.60, 'tant per u', 0);
INSERT INTO 'cuina' VALUES ('REPFORM', 'BASE', 2050, 'ELE', 0.70, 'tant per u', 0);

INSERT INTO 'cuina' VALUES ('REPFORM', 'BASE', 2005, 'BIO', 0.0, 'tant per u', 0);
INSERT INTO 'cuina' VALUES ('REPFORM', 'BASE', 2010, 'BIO', 0.0, 'tant per u', 0);
INSERT INTO 'cuina' VALUES ('REPFORM', 'BASE', 2015, 'BIO', 0.0, 'tant per u', 0);
INSERT INTO 'cuina' VALUES ('REPFORM', 'BASE', 2020, 'BIO', 0.0, 'tant per u', 0);
INSERT INTO 'cuina' VALUES ('REPFORM', 'BASE', 2025, 'BIO', 0.0, 'tant per u', 0);
INSERT INTO 'cuina' VALUES ('REPFORM', 'BASE', 2030, 'BIO', 0.0, 'tant per u', 0);
INSERT INTO 'cuina' VALUES ('REPFORM', 'BASE', 2040, 'BIO', 0.0, 'tant per u', 0);
INSERT INTO 'cuina' VALUES ('REPFORM', 'BASE', 2050, 'BIO', 0.0, 'tant per u', 0);

INSERT INTO 'cuina' VALUES ('REPFORM', 'BASE', 2005, 'GN', 0.707, 'tant per u', 0);
INSERT INTO 'cuina' VALUES ('REPFORM', 'BASE', 2010, 'GN', 0.65, 'tant per u', 0);
INSERT INTO 'cuina' VALUES ('REPFORM', 'BASE', 2015, 'GN', 0.64, 'tant per u', 0);
INSERT INTO 'cuina' VALUES ('REPFORM', 'BASE', 2020, 'GN', 0.63, 'tant per u', 0);
INSERT INTO 'cuina' VALUES ('REPFORM', 'BASE', 2025, 'GN', 0.63, 'tant per u', 0);
INSERT INTO 'cuina' VALUES ('REPFORM', 'BASE', 2030, 'GN', 0.565, 'tant per u', 0);
INSERT INTO 'cuina' VALUES ('REPFORM', 'BASE', 2040, 'GN', 0.36, 'tant per u', 0);
INSERT INTO 'cuina' VALUES ('REPFORM', 'BASE', 2050, 'GN', 0.27, 'tant per u', 0);

INSERT INTO 'cuina' VALUES ('REPFORM', 'APOSTA', 2005, 'GLP', 0.15, 'tant per u', 0);
INSERT INTO 'cuina' VALUES ('REPFORM', 'APOSTA', 2010, 'GLP', 0.15, 'tant per u', 0);
INSERT INTO 'cuina' VALUES ('REPFORM', 'APOSTA', 2015, 'GLP', 0.15, 'tant per u', 0);
INSERT INTO 'cuina' VALUES ('REPFORM', 'APOSTA', 2020, 'GLP', 0.15, 'tant per u', 0);
INSERT INTO 'cuina' VALUES ('REPFORM', 'APOSTA', 2025, 'GLP', 0.12, 'tant per u', 0);
INSERT INTO 'cuina' VALUES ('REPFORM', 'APOSTA', 2030, 'GLP', 0.075, 'tant per u', 0);
INSERT INTO 'cuina' VALUES ('REPFORM', 'APOSTA', 2040, 'GLP', 0.03, 'tant per u', 0);
INSERT INTO 'cuina' VALUES ('REPFORM', 'APOSTA', 2050, 'GLP', 0.0, 'tant per u', 0);

INSERT INTO 'cuina' VALUES ('REPFORM', 'APOSTA', 2005, 'ELE', 0.143, 'tant per u', 0);
INSERT INTO 'cuina' VALUES ('REPFORM', 'APOSTA', 2010, 'ELE', 0.20, 'tant per u', 0);
INSERT INTO 'cuina' VALUES ('REPFORM', 'APOSTA', 2015, 'ELE', 0.21, 'tant per u', 0);
INSERT INTO 'cuina' VALUES ('REPFORM', 'APOSTA', 2020, 'ELE', 0.22, 'tant per u', 0);
INSERT INTO 'cuina' VALUES ('REPFORM', 'APOSTA', 2025, 'ELE', 0.27, 'tant per u', 0);
INSERT INTO 'cuina' VALUES ('REPFORM', 'APOSTA', 2030, 'ELE', 0.525, 'tant per u', 0);
INSERT INTO 'cuina' VALUES ('REPFORM', 'APOSTA', 2040, 'ELE', 0.82, 'tant per u', 0);
INSERT INTO 'cuina' VALUES ('REPFORM', 'APOSTA', 2050, 'ELE', 0.99, 'tant per u', 0);

INSERT INTO 'cuina' VALUES ('REPFORM', 'APOSTA', 2005, 'BIO', 0.0, 'tant per u', 0);
INSERT INTO 'cuina' VALUES ('REPFORM', 'APOSTA', 2010, 'BIO', 0.0, 'tant per u', 0);
INSERT INTO 'cuina' VALUES ('REPFORM', 'APOSTA', 2015, 'BIO', 0.0, 'tant per u', 0);
INSERT INTO 'cuina' VALUES ('REPFORM', 'APOSTA', 2020, 'BIO', 0.0, 'tant per u', 0);
INSERT INTO 'cuina' VALUES ('REPFORM', 'APOSTA', 2025, 'BIO', 0.0, 'tant per u', 0);
INSERT INTO 'cuina' VALUES ('REPFORM', 'APOSTA', 2030, 'BIO', 0.0, 'tant per u', 0);
INSERT INTO 'cuina' VALUES ('REPFORM', 'APOSTA', 2040, 'BIO', 0.004, 'tant per u', 0);
INSERT INTO 'cuina' VALUES ('REPFORM', 'APOSTA', 2050, 'BIO', 0.01, 'tant per u', 0);

INSERT INTO 'cuina' VALUES ('REPFORM', 'APOSTA', 2005, 'GN', 0.707, 'tant per u', 0);
INSERT INTO 'cuina' VALUES ('REPFORM', 'APOSTA', 2010, 'GN', 0.65, 'tant per u', 0);
INSERT INTO 'cuina' VALUES ('REPFORM', 'APOSTA', 2015, 'GN', 0.64, 'tant per u', 0);
INSERT INTO 'cuina' VALUES ('REPFORM', 'APOSTA', 2020, 'GN', 0.63, 'tant per u', 0);
INSERT INTO 'cuina' VALUES ('REPFORM', 'APOSTA', 2025, 'GN', 0.61, 'tant per u', 0);
INSERT INTO 'cuina' VALUES ('REPFORM', 'APOSTA', 2030, 'GN', 0.40, 'tant per u', 0);
INSERT INTO 'cuina' VALUES ('REPFORM', 'APOSTA', 2040, 'GN', 0.146, 'tant per u', 0);
INSERT INTO 'cuina' VALUES ('REPFORM', 'APOSTA', 2050, 'GN', 0.0, 'tant per u', 0);

-- Consum real GN per a cuina

INSERT INTO 'cuina' VALUES ('CONGN', '', 2012, '',0.050, 'tep/habitatge', 0);
INSERT INTO 'cuina' VALUES ('CONGN', '', 2013, '',0.051, 'tep/habitatge', 0);
INSERT INTO 'cuina' VALUES ('CONGN', '', 2014, '',0.052, 'tep/habitatge', 0);
INSERT INTO 'cuina' VALUES ('CONGN', '', 2015, '',0.054, 'tep/habitatge', 0);
INSERT INTO 'cuina' VALUES ('CONGN', '', 2016, '',0.051, 'tep/habitatge', 0);
INSERT INTO 'cuina' VALUES ('CONGN', '', 2017, '',0.053, 'tep/habitatge', 0);
INSERT INTO 'cuina' VALUES ('CONGN', '', 2018, '',0.059, 'tep/habitatge', 0);
INSERT INTO 'cuina' VALUES ('CONGN', '', 2019, '',0.054, 'tep/habitatge', 0);


