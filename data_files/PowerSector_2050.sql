
CREATE TABLE "regions" (
	"regions"	TEXT,
	"region_note"	TEXT,
	PRIMARY KEY("regions")
);
INSERT INTO "regions" VALUES ('IT','Italy');

CREATE TABLE "time_period_labels" (
	"t_period_labels"	text,
	"t_period_labels_desc"	text,
	PRIMARY KEY("t_period_labels")
);
INSERT INTO "time_period_labels" VALUES ('e','Existing vintages');
INSERT INTO "time_period_labels" VALUES ('f','Future vintages');

CREATE TABLE "time_periods" (
	"t_periods"	integer,
	"flag"	text,
	PRIMARY KEY("t_periods"),
	FOREIGN KEY("flag") REFERENCES "time_period_labels"("t_period_labels")
);
INSERT INTO "time_periods" VALUES (2006,'e');
--INSERT INTO "time_periods" VALUES (2007,'f');
--INSERT INTO "time_periods" VALUES (2008,'f');
--INSERT INTO "time_periods" VALUES (2010,'f');
--INSERT INTO "time_periods" VALUES (2012,'f');
--INSERT INTO "time_periods" VALUES (2014,'f');
--INSERT INTO "time_periods" VALUES (2016,'f');
--INSERT INTO "time_periods" VALUES (2018,'f');
--INSERT INTO "time_periods" VALUES (2020,'f');
--INSERT INTO "time_periods" VALUES (2022,'f');
--INSERT INTO "time_periods" VALUES (2025,'f');
--INSERT INTO "time_periods" VALUES (2030,'f');
--INSERT INTO "time_periods" VALUES (2035,'f');
--INSERT INTO "time_periods" VALUES (2040,'f');
--INSERT INTO "time_periods" VALUES (2045,'f');
INSERT INTO "time_periods" VALUES (2050,'f');
INSERT INTO "time_periods" VALUES (2055,'f');

CREATE TABLE "MyopicBaseyear" (
	"year"	real,
	"notes"	text
);

CREATE TABLE "time_season" (
	"t_season"	text,
	PRIMARY KEY("t_season")
);
INSERT INTO "time_season" VALUES ('winter'); --January/March
INSERT INTO "time_season" VALUES ('spring'); --April/June
INSERT INTO "time_season" VALUES ('summer'); --July/September
INSERT INTO "time_season" VALUES ('fall'); --October/December

CREATE TABLE "time_of_day" (
	"t_day"	text,
	PRIMARY KEY("t_day")
);
INSERT INTO "time_of_day" VALUES ('night'); --20:00/04:59
INSERT INTO "time_of_day" VALUES ('morning'); --05:00/10:59
INSERT INTO "time_of_day" VALUES ('noon'); --11:00/13:59
INSERT INTO "time_of_day" VALUES ('afternoon'); --14:00/19:59

CREATE TABLE "SegFrac" (
	"season_name"	text,
	"time_of_day_name"	text,
	"segfrac"	real CHECK("segfrac" >= 0 AND "segfrac" <= 1),
	"segfrac_notes"	text,
	PRIMARY KEY("season_name","time_of_day_name"),
	FOREIGN KEY("season_name") REFERENCES "time_season"("t_season"),
	FOREIGN KEY("time_of_day_name") REFERENCES "time_of_day"("t_day")
);
INSERT INTO "SegFrac" VALUES ('winter','night',0.0925,'');
INSERT INTO "SegFrac" VALUES ('winter','morning',0.0617,'');
INSERT INTO "SegFrac" VALUES ('winter','noon',0.0308,'');
INSERT INTO "SegFrac" VALUES ('winter','afternoon',0.0617,'');
INSERT INTO "SegFrac" VALUES ('spring','night',0.0935,'');
INSERT INTO "SegFrac" VALUES ('spring','morning',0.0623,'');
INSERT INTO "SegFrac" VALUES ('spring','noon',0.0312,'');
INSERT INTO "SegFrac" VALUES ('spring','afternoon',0.0623,'');
INSERT INTO "SegFrac" VALUES ('summer','night',0.0945,'');
INSERT INTO "SegFrac" VALUES ('summer','morning',0.0630,'');
INSERT INTO "SegFrac" VALUES ('summer','noon',0.0315,'');
INSERT INTO "SegFrac" VALUES ('summer','afternoon',0.0630,'');
INSERT INTO "SegFrac" VALUES ('fall','night',0.0945,'');
INSERT INTO "SegFrac" VALUES ('fall','morning',0.0630,'');
INSERT INTO "SegFrac" VALUES ('fall','noon',0.0315,'');
INSERT INTO "SegFrac" VALUES ('fall','afternoon',0.0630,'');

CREATE TABLE "sector_labels" (
	"sector"	text,
	PRIMARY KEY("sector")
);
INSERT INTO "sector_labels" VALUES ('AGR');
INSERT INTO "sector_labels" VALUES ('COM');
INSERT INTO "sector_labels" VALUES ('RES');
INSERT INTO "sector_labels" VALUES ('TRA');
INSERT INTO "sector_labels" VALUES ('IND');
INSERT INTO "sector_labels" VALUES ('ELC');
INSERT INTO "sector_labels" VALUES ('STG');
INSERT INTO "sector_labels" VALUES ('UPS');
INSERT INTO "sector_labels" VALUES ('H2');
INSERT INTO "sector_labels" VALUES ('CCUS');

CREATE TABLE "technology_labels" (
	"tech_labels"	text,
	"tech_labels_desc"	text,
	PRIMARY KEY("tech_labels")
);
INSERT INTO "technology_labels" VALUES ('r','Resource technology');
INSERT INTO "technology_labels" VALUES ('p','Production technology');
INSERT INTO "technology_labels" VALUES ('pb','Baseload production technology');
INSERT INTO "technology_labels" VALUES ('ps','Storage production technology');

CREATE TABLE "technologies" (
	"tech"	text,
	"flag"	text,
	"sector"	text,
	"tech_desc"	text,
	"tech_category"	text,
	PRIMARY KEY("tech"),
	FOREIGN KEY("flag") REFERENCES "technology_labels"("tech_labels"),
	FOREIGN KEY("sector") REFERENCES "sector_labels"("sector")
);
-- Storage
INSERT INTO "technologies" VALUES ('STG_ELC_CEN_BTT','ps','STG','Storage - Centralized Electricity - Lithium-Ion Battery','ATB 2022');
-- Electricity sector
-- New technologies
INSERT INTO "technologies" VALUES ('ELC_COA_N','pb','ELC','Coal steam cycle - New',''); --pb
INSERT INTO "technologies" VALUES ('ELC_NGA_N','p','ELC','Natural gas turbine/CC - New',''); --pb
INSERT INTO "technologies" VALUES ('ELC_WIN_ON_N','p','ELC','Wind plant - Onshore - New','');
INSERT INTO "technologies" VALUES ('ELC_WIN_OF_N','p','ELC','Wind plant - Offshore - New','');
INSERT INTO "technologies" VALUES ('ELC_BIO_N','p','ELC','Biomass plant - New','');
INSERT INTO "technologies" VALUES ('ELC_HYD_N','p','ELC','Hydroelectric - New','');
INSERT INTO "technologies" VALUES ('ELC_GEO_N','p','ELC','Geothermal plant - New','');
INSERT INTO "technologies" VALUES ('ELC_PV_N','p','ELC','Photovoltaic plant - New','');
INSERT INTO "technologies" VALUES ('ELC_H2_N','p','ELC','PEM fuel cell system running on hydrogen 100 kW based - New','');
INSERT INTO "technologies" VALUES ('ELC_NUC_N','pb','ELC','Nuclear fission - Light Water Reactor',''); --pb
INSERT INTO "technologies" VALUES ('ELC_IMP_DMY_N','p','ELC','Dummy to change name to ELC_IMP','');
-- Upstream sector
-- Import
INSERT INTO "technologies" VALUES ('UPS_IMP_BIO','p','UPS','','');
INSERT INTO "technologies" VALUES ('UPS_IMP_ELC','p','UPS','','');
INSERT INTO "technologies" VALUES ('UPS_IMP_COA','p','UPS','','');
INSERT INTO "technologies" VALUES ('UPS_IMP_NGA','p','UPS','','');
INSERT INTO "technologies" VALUES ('UPS_IMP_H2','p','UPS','','');
INSERT INTO "technologies" VALUES ('UPS_IMP_NUC','p','UPS','','');
--Material supply (#MaterialSR)
INSERT INTO "technologies" VALUES ('UPS_SUPPLY_ALUMINUM_BAUXITE','p','UPS','Supply of Aluminum_bauxite','');
INSERT INTO "technologies" VALUES ('UPS_SUPPLY_BORON','p','UPS','Supply of Boron','');
INSERT INTO "technologies" VALUES ('UPS_SUPPLY_COBALT','p','UPS','Supply of Cobalt','');
INSERT INTO "technologies" VALUES ('UPS_SUPPLY_COPPER','p','UPS','Supply of Copper','');
INSERT INTO "technologies" VALUES ('UPS_SUPPLY_DYSPROSIUM_HREE','p','UPS','Supply of Dysprosium (HREE)','');
INSERT INTO "technologies" VALUES ('UPS_SUPPLY_GALLIUM','p','UPS','Supply of Gallium','');
INSERT INTO "technologies" VALUES ('UPS_SUPPLY_HAFNIUM','p','UPS','Supply of Hafnium','');
INSERT INTO "technologies" VALUES ('UPS_SUPPLY_LITHIUM','p','UPS','Supply of Lithium','');
INSERT INTO "technologies" VALUES ('UPS_SUPPLY_MANGANESE','p','UPS','Supply of Manganese','');
INSERT INTO "technologies" VALUES ('UPS_SUPPLY_NEODYMIUM_LREE','p','UPS','Supply of Neodymium (LREE)','');
INSERT INTO "technologies" VALUES ('UPS_SUPPLY_NICKEL','p','UPS','Supply of Nickel','');
INSERT INTO "technologies" VALUES ('UPS_SUPPLY_NIOBIUM','p','UPS','Supply of Niobium','');
INSERT INTO "technologies" VALUES ('UPS_SUPPLY_PHOSPHORUS','p','UPS','Supply of Phosphorus','');
INSERT INTO "technologies" VALUES ('UPS_SUPPLY_PLATINUM','p','UPS','Supply of Platinum','');
INSERT INTO "technologies" VALUES ('UPS_SUPPLY_PRASEODYMIUM_LREE','p','UPS','Supply of Praseodymium (LREE)','');
INSERT INTO "technologies" VALUES ('UPS_SUPPLY_SILICON','p','UPS','Supply of Silicon','');
INSERT INTO "technologies" VALUES ('UPS_SUPPLY_TERBIUM_HREE','p','UPS','Supply of Terbium (HREE)','');
INSERT INTO "technologies" VALUES ('UPS_SUPPLY_TITANIUM','p','UPS','Supply of Titanium','');
INSERT INTO "technologies" VALUES ('UPS_SUPPLY_VANADIUM','p','UPS','Supply of Vanadium','');
INSERT INTO "technologies" VALUES ('UPS_SUPPLY_YTTRIUM_HREE','p','UPS','Supply of Yttrium (HREE)','');
-- Extraction of fossil fuels
INSERT INTO "technologies" VALUES ('UPS_MIN_COA','p','UPS','Extraction - Coal','');
INSERT INTO "technologies" VALUES ('UPS_MIN_NGA','p','UPS','Extraction - Natural gas','');
-- Renewables
INSERT INTO "technologies" VALUES ('UPS_RNW_HYD','p','UPS','Renewables - Hydroelectric potential','');
INSERT INTO "technologies" VALUES ('UPS_RNW_GEO','p','UPS','Renewables - Geothermal potential','');
INSERT INTO "technologies" VALUES ('UPS_RNW_SOL','p','UPS','Renewables - Solar potential','');
INSERT INTO "technologies" VALUES ('UPS_RNW_WIN','p','UPS','Renewables - Wind potential','');
INSERT INTO "technologies" VALUES ('UPS_RNW_BIO','p','UPS','Renewables - Production of biofuels','');
-- Dummy
INSERT INTO "technologies" VALUES ('DMY_ELC_TECH','p','UPS','Dummy technology to transform ','');
INSERT INTO "technologies" VALUES ('DMY_OUT_TECH','p','UPS','Dummy technology to produce DMY_OUT','');
INSERT INTO "technologies" VALUES ('DMY_DEM_NON_ANNUAL','p','UPS','Dummy import for demand commodities - Non annual','');
--INSERT INTO "technologies" VALUES ('DMY_PHY_NON_ANNUAL','p','UPS','Dummy import for physical commodities - Non annual','');
-- Hydrogen
INSERT INTO "technologies" VALUES ('H2_GEN','p','UPS','Generic H2 production','');
-- CCUS, Power
INSERT INTO "technologies" VALUES ('CCUS_ELC_OXY_NGA','p','CCUS','NGCC w/CCUS, oxyfueling','');
INSERT INTO "technologies" VALUES ('CCUS_ELC_OXY_NGA_LINKED','p','CCUS','LINKED tech for CCUS_ELC_OXY_NGA','');
-- CCUS, Capture
INSERT INTO "technologies" VALUES ('CCUS_DAC','p','CCUS','CO2 direct air capture','');
-- CCUS, Storage
INSERT INTO "technologies" VALUES ('CCUS_SNK','p','CCUS','CO2 physical storage/consumption','');

CREATE TABLE "tech_ramping" (
	"tech"	text,
	PRIMARY KEY("tech"),
	FOREIGN KEY("tech") REFERENCES "technologies"("tech")
);
CREATE TABLE "tech_reserve" (
	"tech"	text,
	"notes"	text,
	PRIMARY KEY("tech")
);
-- Storage
INSERT INTO "tech_reserve" VALUES ('STG_ELC_CEN_BTT','');
-- Electricity sector
INSERT INTO "tech_reserve" VALUES ('ELC_COA_N','');
INSERT INTO "tech_reserve" VALUES ('ELC_NGA_N','');
INSERT INTO "tech_reserve" VALUES ('ELC_WIN_ON_N','');
INSERT INTO "tech_reserve" VALUES ('ELC_WIN_OF_N','');
INSERT INTO "tech_reserve" VALUES ('ELC_BIO_N','');
INSERT INTO "tech_reserve" VALUES ('ELC_HYD_N','');
INSERT INTO "tech_reserve" VALUES ('ELC_GEO_N','');
INSERT INTO "tech_reserve" VALUES ('ELC_PV_N','');
INSERT INTO "tech_reserve" VALUES ('ELC_H2_N','');
INSERT INTO "tech_reserve" VALUES ('ELC_NUC_N','');
-- CCUS
INSERT INTO "tech_reserve" VALUES ('CCUS_ELC_OXY_NGA','');

--EnergySR
CREATE TABLE "tech_imports" (
	"tech"	text,
	"notes"	text,
	PRIMARY KEY("tech")
);
INSERT INTO "tech_imports" VALUES ('UPS_IMP_BIO','');
INSERT INTO "tech_imports" VALUES ('UPS_IMP_COA','');
INSERT INTO "tech_imports" VALUES ('UPS_IMP_NGA','');
INSERT INTO "tech_imports" VALUES ('UPS_IMP_H2','');
INSERT INTO "tech_imports" VALUES ('UPS_IMP_NUC','');
--EnergySR
CREATE TABLE "tech_exports" (
	"tech"	text,
	"notes"	text,
	PRIMARY KEY("tech")
);
--EnergySR
CREATE TABLE "tech_domestic" (
	"tech"	text,
	"notes"	text,
	PRIMARY KEY("tech")
);
INSERT INTO "tech_domestic" VALUES ('UPS_MIN_COA','');
INSERT INTO "tech_domestic" VALUES ('UPS_MIN_NGA','');
INSERT INTO "tech_domestic" VALUES ('UPS_RNW_BIO','');
INSERT INTO "tech_domestic" VALUES ('H2_GEN','');

CREATE TABLE "tech_exchange" (
	"tech"	text,
	"notes"	TEXT,
	PRIMARY KEY("tech"),
	FOREIGN KEY("tech") REFERENCES "technologies"("tech")
);
CREATE TABLE "tech_curtailment" (
	"tech"	text,
	"notes"	TEXT,
	PRIMARY KEY("tech"),
	FOREIGN KEY("tech") REFERENCES "technologies"("tech")
);
-- Electricity sector
INSERT INTO "tech_curtailment" VALUES ('ELC_PV_N','');
INSERT INTO "tech_curtailment" VALUES ('ELC_WIN_ON_N','');
INSERT INTO "tech_curtailment" VALUES ('ELC_WIN_OF_N','');

CREATE TABLE "tech_flex" (
	"tech"	text,
	"notes"	TEXT,
	PRIMARY KEY("tech"),
	FOREIGN KEY("tech") REFERENCES "technologies"("tech")
);

CREATE TABLE "tech_annual" (
	"tech"	text,
	"notes"	TEXT,
	PRIMARY KEY("tech"),
	FOREIGN KEY("tech") REFERENCES "technologies"("tech")
);

CREATE TABLE "commodity_labels" (
	"comm_labels"	text,
	"comm_labels_desc"	text,
	PRIMARY KEY("comm_labels")
);
INSERT INTO "commodity_labels" VALUES ('p','Physical commodity');
INSERT INTO "commodity_labels" VALUES ('e','Emissions commodity');
INSERT INTO "commodity_labels" VALUES ('d','Service demand commodity');

CREATE TABLE "commodities" (
	"comm_name"	text,
	"flag"	text,
	"comm_desc"	text,
	PRIMARY KEY("comm_name"),
	FOREIGN KEY("flag") REFERENCES "commodity_labels"("comm_labels")
);
-- Electricity sector commodities
INSERT INTO "commodities" VALUES('ELC_COA','p','Coal');
INSERT INTO "commodities" VALUES('ELC_NGA','p','Natural gas');
INSERT INTO "commodities" VALUES('ELC_WIN','p','Wind energy');
INSERT INTO "commodities" VALUES('ELC_BIO','p','Biofuels (generic)');
INSERT INTO "commodities" VALUES('ELC_GEO','p','Geothermal energy');
INSERT INTO "commodities" VALUES('ELC_HYD','p','Hydroelectric energy');
INSERT INTO "commodities" VALUES('ELC_SOL','p','Solar energy');
INSERT INTO "commodities" VALUES('ELC_H2','p','Hydrogen');
INSERT INTO "commodities" VALUES('ELC_NUC','p','Nuclear fuel');
INSERT INTO "commodities" VALUES('ELC_IMP','p','Electricity (import)');
INSERT INTO "commodities" VALUES('ELC_PROD','p','Electricity (production)');
INSERT INTO "commodities" VALUES('ELC_DEM','d','Electricity (demand)');
-- Emission commodities
INSERT INTO "commodities" VALUES('ELC_CH4','e','Power sector - CH4 emission');
INSERT INTO "commodities" VALUES('ELC_CO2','e','Power sector - CO2 emission');
INSERT INTO "commodities" VALUES('ELC_N2O','e','Power sector - N2O emission');
INSERT INTO "commodities" VALUES('ELC_CO2_PRC','e','Power sector - Process CO2 emission');
INSERT INTO "commodities" VALUES('ELC_CH4_PRC','e','Power sector - Process CH4 emission');
INSERT INTO "commodities" VALUES('TOT_CO2','e','Total CO2 emissions');
INSERT INTO "commodities" VALUES('TOT_CH4','e','Total CH4 emissions');
INSERT INTO "commodities" VALUES('TOT_N2O','e','Total N2O emissions');
INSERT INTO "commodities" VALUES('GWP_100','e','Total GHG emissions');
-- Upstream commodities
INSERT INTO "commodities" VALUES('ethos','p','Dummy input commodity for primary energy technologies');
-- CCUS commodities
INSERT INTO "commodities" VALUES('SNK_CO2','p','Captured CO2 for storage/utilization - Physical');
INSERT INTO "commodities" VALUES('SNK_CO2_EM','e','Captured CO2 for storage/utilization - Emission');
-- Demands
INSERT INTO "commodities" VALUES('DMY_OUT','d','Dummy output commodity');
-- Materials (#MaterialSR)
INSERT INTO "commodities" VALUES('Aluminum_bauxite','m','');
INSERT INTO "commodities" VALUES('Boron','m','');
INSERT INTO "commodities" VALUES('Cobalt','m','');
INSERT INTO "commodities" VALUES('Copper','m','');
INSERT INTO "commodities" VALUES('Dysprosium_HREE','m','');
INSERT INTO "commodities" VALUES('Gallium','m','');
INSERT INTO "commodities" VALUES('Hafnium','m','');
INSERT INTO "commodities" VALUES('Lithium','m','');
INSERT INTO "commodities" VALUES('Manganese','m','');
INSERT INTO "commodities" VALUES('Neodymium_LREE','m','');
INSERT INTO "commodities" VALUES('Nickel','m','');
INSERT INTO "commodities" VALUES('Niobium','m','');
INSERT INTO "commodities" VALUES('Phosphorus','m','');
INSERT INTO "commodities" VALUES('Platinum','m','');
INSERT INTO "commodities" VALUES('Praseodymium_LREE','m','');
INSERT INTO "commodities" VALUES('Silicon','m','');
INSERT INTO "commodities" VALUES('Terbium_HREE','m','');
INSERT INTO "commodities" VALUES('Titanium','m','');
INSERT INTO "commodities" VALUES('Vanadium','m','');
INSERT INTO "commodities" VALUES('Yttrium_HREE','m','');

--EmissionsMOO
--Define the emission commodities to be included in the f_CO2 objective function
CREATE TABLE "comm_emi_MOO" (
	"comm_name"	text,
	"notes"	text,
	PRIMARY KEY("comm_name")
);
INSERT INTO "comm_emi_MOO" VALUES ('TOT_CO2','');

--EnergySR
CREATE TABLE "EnergyCommodityConcentrationIndex" (
    "regions"                   text,
    "comm_name"                 text,
    "periods"                   integer,
    "concentration_index"       real,
    "concentration_index_units" text,
    "concentration_index_notes" text,
	PRIMARY KEY("regions","comm_name","periods"),
	FOREIGN KEY("comm_name") REFERENCES "commodities"("comm_name"),
	FOREIGN KEY("periods") REFERENCES "time_periods"("t_periods")
);
INSERT INTO "EnergyCommodityConcentrationIndex" VALUES ('IT','ELC_COA',2050,0.98,'[-]','');
INSERT INTO "EnergyCommodityConcentrationIndex" VALUES ('IT','ELC_NGA',2050,1.39,'[-]','');
INSERT INTO "EnergyCommodityConcentrationIndex" VALUES ('IT','ELC_H2',2050,0.94,'[-]','');
INSERT INTO "EnergyCommodityConcentrationIndex" VALUES ('IT','ELC_NUC',2050,1.11,'[-]','');
INSERT INTO "EnergyCommodityConcentrationIndex" VALUES ('IT','ELC_BIO',2050,0.71,'[-]','');

--MaterialSR
CREATE TABLE "TechnologyMaterialSupplyRisk" (
	"regions"	        text,
	"tech"	            text,
	"vintage"	        integer,
	"tech_msr"	        real,
	"tech_msr_units"	text,
	"tech_msr_notes"	text,
	PRIMARY KEY("regions","tech","vintage"),
	FOREIGN KEY("tech") REFERENCES "technologies"("tech"),
	FOREIGN KEY("vintage") REFERENCES "time_periods"("t_periods")
);
-- Storage
INSERT INTO "TechnologyMaterialSupplyRisk" VALUES ('IT','STG_ELC_CEN_BTT',2050,7.3E-01,'1/GW','');
-- Electricity sector
INSERT INTO "TechnologyMaterialSupplyRisk" VALUES ('IT','ELC_PV_N',2050,9.7E-03,'1/GW',''); --9.7E-03 (c-Si 95%), 9.5E-02 (CIGS 50%)
INSERT INTO "TechnologyMaterialSupplyRisk" VALUES ('IT','ELC_WIN_ON_N',2050,2.7E+00,'1/GW','');
INSERT INTO "TechnologyMaterialSupplyRisk" VALUES ('IT','ELC_WIN_OF_N',2050,9.2E+00,'1/GW','');
INSERT INTO "TechnologyMaterialSupplyRisk" VALUES ('IT','ELC_GEO_N',2050,5.1E-01,'1/GW','');
INSERT INTO "TechnologyMaterialSupplyRisk" VALUES ('IT','ELC_HYD_N',2050,2.1E-03,'1/GW','');
INSERT INTO "TechnologyMaterialSupplyRisk" VALUES ('IT','ELC_BIO_N',2050,4.7E-02,'1/GW','');
INSERT INTO "TechnologyMaterialSupplyRisk" VALUES ('IT','ELC_NUC_N',2050,8.1E-02,'1/GW','');
INSERT INTO "TechnologyMaterialSupplyRisk" VALUES ('IT','ELC_H2_N',2050,1.4E-03,'1/GW','');
INSERT INTO "TechnologyMaterialSupplyRisk" VALUES ('IT','ELC_COA_N',2050,7.2E-02,'1/GW','');
INSERT INTO "TechnologyMaterialSupplyRisk" VALUES ('IT','ELC_NGA_N',2050,3.3E-02,'1/GW','');
-- CCUS, Power
INSERT INTO "TechnologyMaterialSupplyRisk" VALUES ('IT','CCUS_ELC_OXY_NGA',2050,5.7E-02,'1/GW','');
-- Dummy
--INSERT INTO "TechnologyMaterialSupplyRisk" VALUES ('IT','DMY_PHY_NON_ANNUAL',2050,1.0E+10,'1/GW','');

--MaterialSR
CREATE TABLE "MaterialIntensity" (
	"regions"	    text,
	"comm_name"     text,
	"tech"	        text,
	"vintage"	    integer,
	"mat_int"	    real,
	"mat_int_units"	text,
	"mat_int_notes"	text,
	PRIMARY KEY("regions","tech","comm_name","vintage"),
	FOREIGN KEY("comm_name") REFERENCES "commodities"("comm_name"),
	FOREIGN KEY("tech") REFERENCES "technologies"("tech"),
	FOREIGN KEY("vintage") REFERENCES "time_periods"("t_periods")
);
INSERT INTO "MaterialIntensity" VALUES ('IT','Aluminum_bauxite','STG_ELC_CEN_BTT',2050,5796.00,'t/GW',''); --kg/MW = t/GW
INSERT INTO "MaterialIntensity" VALUES ('IT','Aluminum_bauxite','ELC_PV_N',2050,6750.00,'t/GW','');
INSERT INTO "MaterialIntensity" VALUES ('IT','Aluminum_bauxite','ELC_WIN_ON_N',2050,901.44,'t/GW','');
INSERT INTO "MaterialIntensity" VALUES ('IT','Aluminum_bauxite','ELC_WIN_OF_N',2050,478.80,'t/GW','');
INSERT INTO "MaterialIntensity" VALUES ('IT','Aluminum_bauxite','ELC_HYD_N',2050,3400.00,'t/GW','');
INSERT INTO "MaterialIntensity" VALUES ('IT','Aluminum_bauxite','ELC_BIO_N',2050,3900.00,'t/GW','');
INSERT INTO "MaterialIntensity" VALUES ('IT','Aluminum_bauxite','ELC_NGA_N',2050,4.80,'t/GW','');
INSERT INTO "MaterialIntensity" VALUES ('IT','Aluminum_bauxite','CCUS_ELC_OXY_NGA',2050,4.80,'t/GW','');
INSERT INTO "MaterialIntensity" VALUES ('IT','Boron','ELC_WIN_ON_N',2050,0.10,'t/GW','');
INSERT INTO "MaterialIntensity" VALUES ('IT','Boron','ELC_WIN_OF_N',2050,0.53,'t/GW','');
INSERT INTO "MaterialIntensity" VALUES ('IT','Cobalt','STG_ELC_CEN_BTT',2050,720.00,'t/GW','');
INSERT INTO "MaterialIntensity" VALUES ('IT','Cobalt','ELC_BIO_N',2050,2.00,'t/GW','');
INSERT INTO "MaterialIntensity" VALUES ('IT','Cobalt','ELC_COA_N',2050,201.46,'t/GW','');
INSERT INTO "MaterialIntensity" VALUES ('IT','Cobalt','ELC_NGA_N',2050,71.08,'t/GW','');
INSERT INTO "MaterialIntensity" VALUES ('IT','Cobalt','CCUS_ELC_OXY_NGA',2050,78.62,'t/GW','');
INSERT INTO "MaterialIntensity" VALUES ('IT','Copper','STG_ELC_CEN_BTT',2050,2616.00,'t/GW','');
INSERT INTO "MaterialIntensity" VALUES ('IT','Copper','ELC_PV_N',2050,4150.11,'t/GW',''); --4150.11 (c-Si 95%), 4155.25 (CIGS 50%)
INSERT INTO "MaterialIntensity" VALUES ('IT','Copper','ELC_WIN_ON_N',2050,1292.40,'t/GW','');
INSERT INTO "MaterialIntensity" VALUES ('IT','Copper','ELC_WIN_OF_N',2050,1938.60,'t/GW','');
INSERT INTO "MaterialIntensity" VALUES ('IT','Copper','ELC_GEO_N',2050,3605.00,'t/GW','');
INSERT INTO "MaterialIntensity" VALUES ('IT','Copper','ELC_HYD_N',2050,1050.00,'t/GW','');
INSERT INTO "MaterialIntensity" VALUES ('IT','Copper','ELC_BIO_N',2050,2270.00,'t/GW','');
INSERT INTO "MaterialIntensity" VALUES ('IT','Copper','ELC_NUC_N',2050,764.80,'t/GW','');
INSERT INTO "MaterialIntensity" VALUES ('IT','Copper','ELC_H2_N',2050,14.32,'t/GW','');
INSERT INTO "MaterialIntensity" VALUES ('IT','Copper','ELC_COA_N',2050,1150.00,'t/GW','');
INSERT INTO "MaterialIntensity" VALUES ('IT','Copper','ELC_NGA_N',2050,355.41,'t/GW','');
INSERT INTO "MaterialIntensity" VALUES ('IT','Copper','CCUS_ELC_OXY_NGA',2050,1047.41,'t/GW','');
INSERT INTO "MaterialIntensity" VALUES ('IT','Dysprosium_HREE','ELC_WIN_ON_N',2050,0.48,'t/GW','');
INSERT INTO "MaterialIntensity" VALUES ('IT','Dysprosium_HREE','ELC_WIN_OF_N',2050,1.56,'t/GW','');
INSERT INTO "MaterialIntensity" VALUES ('IT','Gallium','ELC_PV_N',2050,0.02,'t/GW',''); --0.02 (c-Si 95%), 0.75 (CIGS 50%)
INSERT INTO "MaterialIntensity" VALUES ('IT','Hafnium','ELC_NUC_N',2050,0.50,'t/GW','');
INSERT INTO "MaterialIntensity" VALUES ('IT','Lithium','STG_ELC_CEN_BTT',2050,438.00,'t/GW','');
INSERT INTO "MaterialIntensity" VALUES ('IT','Manganese','STG_ELC_CEN_BTT',2050,660.00,'t/GW','');
INSERT INTO "MaterialIntensity" VALUES ('IT','Manganese','ELC_WIN_ON_N',2050,564.48,'t/GW','');
INSERT INTO "MaterialIntensity" VALUES ('IT','Manganese','ELC_WIN_OF_N',2050,569.88,'t/GW','');
INSERT INTO "MaterialIntensity" VALUES ('IT','Manganese','ELC_GEO_N',2050,4325.00,'t/GW','');
INSERT INTO "MaterialIntensity" VALUES ('IT','Manganese','ELC_HYD_N',2050,200.00,'t/GW','');
INSERT INTO "MaterialIntensity" VALUES ('IT','Manganese','ELC_COA_N',2050,4.63,'t/GW','');
INSERT INTO "MaterialIntensity" VALUES ('IT','Manganese','ELC_NGA_N',2050,24.11,'t/GW','');
INSERT INTO "MaterialIntensity" VALUES ('IT','Manganese','CCUS_ELC_OXY_NGA',2050,3785.11,'t/GW','');
INSERT INTO "MaterialIntensity" VALUES ('IT','Neodymium_LREE','ELC_WIN_ON_N',2050,4.10,'t/GW','');
INSERT INTO "MaterialIntensity" VALUES ('IT','Neodymium_LREE','ELC_WIN_OF_N',2050,16.30,'t/GW','');
INSERT INTO "MaterialIntensity" VALUES ('IT','Nickel','STG_ELC_CEN_BTT',2050,2160.00,'t/GW','');
INSERT INTO "MaterialIntensity" VALUES ('IT','Nickel','ELC_WIN_ON_N',2050,287.28,'t/GW','');
INSERT INTO "MaterialIntensity" VALUES ('IT','Nickel','ELC_WIN_OF_N',2050,194.40,'t/GW','');
INSERT INTO "MaterialIntensity" VALUES ('IT','Nickel','ELC_GEO_N',2050,120155.00,'t/GW','');
INSERT INTO "MaterialIntensity" VALUES ('IT','Nickel','ELC_HYD_N',2050,215.00,'t/GW','');
INSERT INTO "MaterialIntensity" VALUES ('IT','Nickel','ELC_BIO_N',2050,20.00,'t/GW','');
INSERT INTO "MaterialIntensity" VALUES ('IT','Nickel','ELC_NUC_N',2050,778.00,'t/GW','');
INSERT INTO "MaterialIntensity" VALUES ('IT','Nickel','ELC_COA_N',2050,721.54,'t/GW','');
INSERT INTO "MaterialIntensity" VALUES ('IT','Nickel','ELC_NGA_N',2050,29.19,'t/GW','');
INSERT INTO "MaterialIntensity" VALUES ('IT','Nickel','CCUS_ELC_OXY_NGA',2050,1174.19,'t/GW','');
INSERT INTO "MaterialIntensity" VALUES ('IT','Niobium','ELC_NGA_N',2050,5.33,'t/GW','');
INSERT INTO "MaterialIntensity" VALUES ('IT','Niobium','CCUS_ELC_OXY_NGA',2050,5.33,'t/GW','');
INSERT INTO "MaterialIntensity" VALUES ('IT','Phosphorus','ELC_NGA_N',2050,0.93,'t/GW','');
INSERT INTO "MaterialIntensity" VALUES ('IT','Phosphorus','CCUS_ELC_OXY_NGA',2050,0.93,'t/GW','');
INSERT INTO "MaterialIntensity" VALUES ('IT','Platinum','ELC_H2_N',2050,0.04,'t/GW','');
INSERT INTO "MaterialIntensity" VALUES ('IT','Praseodymium_LREE','ELC_WIN_ON_N',2050,0.59,'t/GW','');
INSERT INTO "MaterialIntensity" VALUES ('IT','Praseodymium_LREE','ELC_WIN_OF_N',2050,3.08,'t/GW','');
INSERT INTO "MaterialIntensity" VALUES ('IT','Silicon','ELC_PV_N',2050,1900.00,'t/GW',''); --1900.00 (c-Si 95%), 1000.00 (c-Si 50%)
INSERT INTO "MaterialIntensity" VALUES ('IT','Silicon','ELC_NGA_N',2050,17.32,'t/GW','');
INSERT INTO "MaterialIntensity" VALUES ('IT','Silicon','CCUS_ELC_OXY_NGA',2050,17.32,'t/GW','');
INSERT INTO "MaterialIntensity" VALUES ('IT','Terbium_HREE','ELC_WIN_ON_N',2050,0.12,'t/GW','');
INSERT INTO "MaterialIntensity" VALUES ('IT','Terbium_HREE','ELC_WIN_OF_N',2050,0.62,'t/GW','');
INSERT INTO "MaterialIntensity" VALUES ('IT','Titanium','ELC_GEO_N',2050,1634.00,'t/GW','');
INSERT INTO "MaterialIntensity" VALUES ('IT','Titanium','ELC_BIO_N',2050,400.00,'t/GW','');
INSERT INTO "MaterialIntensity" VALUES ('IT','Titanium','ELC_NUC_N',2050,1.50,'t/GW','');
INSERT INTO "MaterialIntensity" VALUES ('IT','Titanium','ELC_COA_N',2050,22.98,'t/GW','');
INSERT INTO "MaterialIntensity" VALUES ('IT','Titanium','ELC_NGA_N',2050,4.80,'t/GW','');
INSERT INTO "MaterialIntensity" VALUES ('IT','Titanium','CCUS_ELC_OXY_NGA',2050,4.80,'t/GW','');
INSERT INTO "MaterialIntensity" VALUES ('IT','Vanadium','ELC_NUC_N',2050,0.60,'t/GW','');
INSERT INTO "MaterialIntensity" VALUES ('IT','Vanadium','ELC_NGA_N',2050,8.24,'t/GW','');
INSERT INTO "MaterialIntensity" VALUES ('IT','Vanadium','CCUS_ELC_OXY_NGA',2050,8.24,'t/GW','');
INSERT INTO "MaterialIntensity" VALUES ('IT','Yttrium_HREE','ELC_NUC_N',2050,0.50,'t/GW','');

--MaterialSR
CREATE TABLE "MaxMaterialReserve" (
	"regions"	text,
	"tech"	text,
	"maxres"	real,
	"maxres_units"	text,
	"maxres_notes"	text,
	FOREIGN KEY("tech") REFERENCES "technologies"("tech"),
	PRIMARY KEY("regions","tech")
);
INSERT INTO "MaxMaterialReserve" VALUES ('IT','UPS_SUPPLY_ALUMINUM_BAUXITE',3.1E+10,'t','');
INSERT INTO "MaxMaterialReserve" VALUES ('IT','UPS_SUPPLY_BORON',1.1E+09,'t','');
INSERT INTO "MaxMaterialReserve" VALUES ('IT','UPS_SUPPLY_COBALT',8.3E+06,'t','');
INSERT INTO "MaxMaterialReserve" VALUES ('IT','UPS_SUPPLY_COPPER',8.9E+08,'t','');
INSERT INTO "MaxMaterialReserve" VALUES ('IT','UPS_SUPPLY_DYSPROSIUM_HREE',3.1E+06,'t','');
INSERT INTO "MaxMaterialReserve" VALUES ('IT','UPS_SUPPLY_GALLIUM',6.3E+04,'t','');
INSERT INTO "MaxMaterialReserve" VALUES ('IT','UPS_SUPPLY_HAFNIUM',1.0E+06,'t','');
INSERT INTO "MaxMaterialReserve" VALUES ('IT','UPS_SUPPLY_LITHIUM',2.6E+07,'t','');
INSERT INTO "MaxMaterialReserve" VALUES ('IT','UPS_SUPPLY_MANGANESE',1.7E+09,'t','');
INSERT INTO "MaxMaterialReserve" VALUES ('IT','UPS_SUPPLY_NEODYMIUM_LREE',2.2E+07,'t','');
INSERT INTO "MaxMaterialReserve" VALUES ('IT','UPS_SUPPLY_NICKEL',1.0E+08,'t','');
INSERT INTO "MaxMaterialReserve" VALUES ('IT','UPS_SUPPLY_NIOBIUM',1.7E+07,'t','');
INSERT INTO "MaxMaterialReserve" VALUES ('IT','UPS_SUPPLY_PHOSPHORUS',7.2E+07,'t','');
INSERT INTO "MaxMaterialReserve" VALUES ('IT','UPS_SUPPLY_PLATINUM',3.2E+04,'t','');
INSERT INTO "MaxMaterialReserve" VALUES ('IT','UPS_SUPPLY_PRASEODYMIUM_LREE',5.6E+06,'t','');
INSERT INTO "MaxMaterialReserve" VALUES ('IT','UPS_SUPPLY_SILICON',1.0E+10,'t',''); --No mining issues
INSERT INTO "MaxMaterialReserve" VALUES ('IT','UPS_SUPPLY_TERBIUM_HREE',5.5E+05,'t','');
INSERT INTO "MaxMaterialReserve" VALUES ('IT','UPS_SUPPLY_TITANIUM',2.5E+08,'t','');
INSERT INTO "MaxMaterialReserve" VALUES ('IT','UPS_SUPPLY_VANADIUM',2.6E+07,'t','');
INSERT INTO "MaxMaterialReserve" VALUES ('IT','UPS_SUPPLY_YTTRIUM_HREE',1.6E+07,'t','');

CREATE TABLE "TechOutputSplit" (
	"regions"	TEXT,
	"periods"	integer,
	"tech"	TEXT,
	"output_comm"	text,
	"to_split"	real,
	"to_split_notes"	text,
	PRIMARY KEY("regions","periods","tech","output_comm"),
	FOREIGN KEY("output_comm") REFERENCES "commodities"("comm_name"),
	FOREIGN KEY("periods") REFERENCES "time_periods"("t_periods"),
	FOREIGN KEY("tech") REFERENCES "technologies"("tech")
);

CREATE TABLE "TechInputSplit" (
	"regions"	TEXT,
	"periods"	integer,
	"input_comm"	text,
	"tech"	text,
	"ti_split"	real,
	"ti_split_notes"	text,
	PRIMARY KEY("regions","periods","input_comm","tech"),
	FOREIGN KEY("tech") REFERENCES "technologies"("tech"),
	FOREIGN KEY("input_comm") REFERENCES "commodities"("comm_name"),
	FOREIGN KEY("periods") REFERENCES "time_periods"("t_periods")
);

CREATE TABLE "StorageDuration" (
	"regions"	text,
	"tech"	text,
	"duration"	real,
	"duration_notes"	text,
	PRIMARY KEY("regions","tech")
);
-- Storage
INSERT INTO "StorageDuration" VALUES ('IT','STG_ELC_CEN_BTT',6,'ATB 2022');

CREATE TABLE "PlanningReserveMargin" (
	"regions"	text,
	"reserve_margin"	REAL,
	PRIMARY KEY("regions"),
	FOREIGN KEY("regions") REFERENCES "regions"("regions")
);
INSERT INTO "PlanningReserveMargin" VALUES ('IT',0.35);

CREATE TABLE "tech_groups" (
	"tech"	text,
	"notes"	text,
	PRIMARY KEY("tech")
);
-- H2
INSERT INTO "tech_groups" VALUES ('UPS_IMP_H2','');
INSERT INTO "tech_groups" VALUES ('H2_GEN','');

CREATE TABLE "groups" (
	"group_name"	text,
	"notes"	text,
	PRIMARY KEY("group_name")
);
-- H2
INSERT INTO "groups" VALUES ('H2_SUPPLY_GRP','');

CREATE TABLE "TechGroupWeight" (
	"tech"		        text,
	"group_name"	    text,
	"weight"	        real,
	"tech_desc"	        text,
	PRIMARY KEY("tech","group_name")
);
-- H2
INSERT INTO "TechGroupWeight" VALUES ('UPS_IMP_H2','H2_SUPPLY_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('H2_GEN','H2_SUPPLY_GRP',1.0,'');

CREATE TABLE "MinActivityGroup" (
	"regions"	text,
	"periods"	integer,
	"group_name"	text,
	"min_act_g"	real,
	"notes"	text,
	PRIMARY KEY("periods","group_name")
);

CREATE TABLE "MaxActivityGroup" (
	"regions"	text,
	"periods"	integer,
	"group_name"	text,
	"max_act_g"	real,
	"notes"	text,
	PRIMARY KEY("periods","group_name")
);
-- H2
INSERT INTO "MaxActivityGroup" VALUES ('IT',2050,'H2_SUPPLY_GRP',1000,'PJ');

CREATE TABLE "MinCapacityGroup" (
	"regions"	text,
	"periods"	integer,
	"group_name"	text,
	"min_cap_g"	real,
	"notes"	text,
	PRIMARY KEY("periods","group_name")
);

CREATE TABLE "MaxCapacityGroup" (
	"regions"	text,
	"periods"	integer,
	"group_name"	text,
	"max_cap_g"	real,
	"notes"	text,
	PRIMARY KEY("periods","group_name")
);

CREATE TABLE "MinInputGroup" (
	"regions"	      text,
	"periods"	      integer,
	"input_comm"	  text,
	"group_name" 	  text,
	"gi_min"	      real,
	"gi_min_notes"    text,
	FOREIGN KEY("group_name") REFERENCES "groups"("group_name"),
	FOREIGN KEY("input_comm") REFERENCES "commodities"("comm_name"),
	FOREIGN KEY("periods") REFERENCES "time_periods"("t_periods"),
	PRIMARY KEY("regions","periods","input_comm","group_name")
);

CREATE TABLE "MaxInputGroup" (
	"regions"	      text,
	"periods"	      integer,
	"input_comm"	  text,
	"group_name" 	  text,
	"gi_max"	      real,
	"gi_max_notes"    text,
	FOREIGN KEY("group_name") REFERENCES "groups"("group_name"),
	FOREIGN KEY("input_comm") REFERENCES "commodities"("comm_name"),
	FOREIGN KEY("periods") REFERENCES "time_periods"("t_periods"),
	PRIMARY KEY("regions","periods","input_comm","group_name")
);

CREATE TABLE "MinOutputGroup" (
	"regions"	      text,
	"periods"	      integer,
	"output_comm"	  text,
	"group_name" 	  text,
	"go_max"	      real,
	"go_max_notes"    text,
	FOREIGN KEY("group_name") REFERENCES "groups"("group_name"),
	FOREIGN KEY("output_comm") REFERENCES "commodities"("comm_name"),
	FOREIGN KEY("periods") REFERENCES "time_periods"("t_periods"),
	PRIMARY KEY("regions","periods","output_comm","group_name")
);

CREATE TABLE "MaxOutputGroup" (
	"regions"	      text,
	"periods"	      integer,
	"output_comm"	  text,
	"group_name" 	  text,
	"go_max"	      real,
	"go_max_notes"    text,
	FOREIGN KEY("group_name") REFERENCES "groups"("group_name"),
	FOREIGN KEY("output_comm") REFERENCES "commodities"("comm_name"),
	FOREIGN KEY("periods") REFERENCES "time_periods"("t_periods"),
	PRIMARY KEY("regions","periods","output_comm","group_name")
);

CREATE TABLE "MinCapacity" (
	"regions"	text,
	"periods"	integer,
	"tech"	text,
	"mincap"	real,
	"mincap_units"	text,
	"mincap_notes"	text,
	PRIMARY KEY("regions","periods","tech"),
	FOREIGN KEY("tech") REFERENCES "technologies"("tech"),
	FOREIGN KEY("periods") REFERENCES "time_periods"("t_periods")
);
CREATE TABLE "MinActivity" (
	"regions"	text,
	"periods"	integer,
	"tech"	text,
	"minact"	real,
	"minact_units"	text,
	"minact_notes"	text,
	PRIMARY KEY("regions","periods","tech"),
	FOREIGN KEY("tech") REFERENCES "technologies"("tech"),
	FOREIGN KEY("periods") REFERENCES "time_periods"("t_periods")
);

CREATE TABLE "MaxCapacity" (
	"regions"	text,
	"periods"	integer,
	"tech"	text,
	"maxcap"	real,
	"maxcap_units"	text,
	"maxcap_notes"	text,
	PRIMARY KEY("regions","periods","tech"),
	FOREIGN KEY("periods") REFERENCES "time_periods"("t_periods"),
	FOREIGN KEY("tech") REFERENCES "technologies"("tech")
);
--INSERT INTO "MaxCapacity" VALUES ('IT',2050,'ELC_NUC_N',10,'GW','');

CREATE TABLE "MaxActivity" (
	"regions"	text,
	"periods"	integer,
	"tech"	text,
	"maxact"	real,
	"maxact_units"	text,
	"maxact_notes"	text,
	PRIMARY KEY("regions","periods","tech"),
	FOREIGN KEY("periods") REFERENCES "time_periods"("t_periods"),
	FOREIGN KEY("tech") REFERENCES "technologies"("tech")
);
-- Upstream
-- Import/Export prices
INSERT INTO "MaxActivity" VALUES ('IT',2050,'UPS_IMP_ELC',0.00,'PJ',''); --241.49
-- Extraction of fossil fuels
INSERT INTO "MaxActivity" VALUES ('IT',2050,'UPS_MIN_COA',5.02,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2050,'UPS_MIN_NGA',69.80,'PJ','');
-- Renewables
INSERT INTO "MaxActivity" VALUES ('IT',2050,'UPS_RNW_HYD',216.00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2050,'UPS_RNW_GEO',438.36,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2050,'UPS_RNW_SOL',4043.00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2050,'UPS_RNW_WIN',1376.00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2050,'UPS_RNW_BIO',1672.00,'PJ','');
-- Storage
--INSERT INTO "MaxActivity" VALUES ('IT',2050,'STG_ELC_CEN_BTT',0.00,'PJ','');
-- CO2 storage
--INSERT INTO "MaxActivity" VALUES ('IT',2050,'CCUS_SNK',50000,'kt','');

CREATE TABLE "LifetimeTech" (
	"regions"	text,
	"tech"	text,
	"life"	real,
	"life_notes"	text,
	PRIMARY KEY("regions","tech"),
	FOREIGN KEY("tech") REFERENCES "technologies"("tech")
);
-- Storage
INSERT INTO "LifetimeTech" VALUES ('IT','STG_ELC_CEN_BTT',15,'ATB 2022');
-- Electricity sector
-- New technologies
INSERT INTO "LifetimeTech" VALUES ('IT','ELC_COA_N',30,'');
INSERT INTO "LifetimeTech" VALUES ('IT','ELC_NGA_N',30,'');
INSERT INTO "LifetimeTech" VALUES ('IT','ELC_WIN_ON_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','ELC_WIN_OF_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','ELC_BIO_N',12,'');
INSERT INTO "LifetimeTech" VALUES ('IT','ELC_HYD_N',30,'');
INSERT INTO "LifetimeTech" VALUES ('IT','ELC_GEO_N',15,'');
INSERT INTO "LifetimeTech" VALUES ('IT','ELC_PV_N',30,'');
INSERT INTO "LifetimeTech" VALUES ('IT','ELC_H2_N',15,'');
INSERT INTO "LifetimeTech" VALUES ('IT','ELC_NUC_N',60,'');
-- Upstream sector
-- Renewables
INSERT INTO "LifetimeTech" VALUES ('IT','UPS_RNW_BIO',20,'');
-- Hydrogen
INSERT INTO "LifetimeTech" VALUES ('IT','H2_GEN',20,'');
-- CCUS, Power
INSERT INTO "LifetimeTech" VALUES ('IT','CCUS_ELC_OXY_NGA',30,'');
INSERT INTO "LifetimeTech" VALUES ('IT','CCUS_ELC_OXY_NGA_LINKED',30,'');
-- CCUS, Capture
INSERT INTO "LifetimeTech" VALUES ('IT','CCUS_DAC',25,'');
-- CCUS, Storage
INSERT INTO "LifetimeTech" VALUES ('IT','CCUS_SNK',10,'');

CREATE TABLE "LifetimeProcess" (
	"regions"	text,
	"tech"	text,
	"vintage"	integer,
	"life_process"	real,
	"life_process_notes"	text,
	PRIMARY KEY("regions","tech","vintage"),
	FOREIGN KEY("vintage") REFERENCES "time_periods"("t_periods"),
	FOREIGN KEY("tech") REFERENCES "technologies"("tech")
);

CREATE TABLE "LifetimeLoanTech" (
	"regions"	text,
	"tech"	text,
	"loan"	real,
	"loan_notes"	text,
	PRIMARY KEY("regions","tech"),
	FOREIGN KEY("tech") REFERENCES "technologies"("tech")
);
CREATE TABLE "GrowthRateSeed" (
	"regions"	text,
	"tech"	text,
	"growthrate_seed"	real,
	"growthrate_seed_units"	text,
	"growthrate_seed_notes"	text,
	PRIMARY KEY("regions","tech"),
	FOREIGN KEY("tech") REFERENCES "technologies"("tech")
);
CREATE TABLE "GrowthRateMax" (
	"regions"	text,
	"tech"	text,
	"growthrate_max"	real,
	"growthrate_max_notes"	text,
	PRIMARY KEY("regions","tech"),
	FOREIGN KEY("tech") REFERENCES "technologies"("tech")
);
CREATE TABLE "GlobalDiscountRate" (
	"rate"	real
);
INSERT INTO "GlobalDiscountRate" VALUES (0.05);

CREATE TABLE "ExistingCapacity" (
	"regions"	text,
	"tech"	text,
	"vintage"	integer,
	"exist_cap"	real,
	"exist_cap_units"	text,
	"exist_cap_notes"	text,
	PRIMARY KEY("regions","tech","vintage"),
	FOREIGN KEY("tech") REFERENCES "technologies"("tech"),
	FOREIGN KEY("vintage") REFERENCES "time_periods"("t_periods")
);

CREATE TABLE "EmissionLimit" (
	"regions"	text,
	"periods"	integer,
	"emis_comm"	text,
	"emis_limit"	real,
	"emis_limit_units"	text,
	"emis_limit_notes"	text,
	PRIMARY KEY("periods","emis_comm"),
	FOREIGN KEY("periods") REFERENCES "time_periods"("t_periods"),
	FOREIGN KEY("emis_comm") REFERENCES "commodities"("comm_name")
);

CREATE TABLE "EmissionActivity" (
	"regions"	text,
	"emis_comm"	text,
	"input_comm"	text,
	"tech"	text,
	"vintage"	integer,
	"output_comm"	text,
	"emis_act"	real,
	"emis_act_units"	text,
	"emis_act_notes"	text,
	PRIMARY KEY("regions","emis_comm","input_comm","tech","vintage","output_comm"),
	FOREIGN KEY("input_comm") REFERENCES "commodities"("comm_name"),
	FOREIGN KEY("tech") REFERENCES "technologies"("tech"),
	FOREIGN KEY("vintage") REFERENCES "time_periods"("t_periods"),
	FOREIGN KEY("output_comm") REFERENCES "commodities"("comm_name"),
	FOREIGN KEY("emis_comm") REFERENCES "commodities"("comm_name")
);
-- CCUS, Power
INSERT INTO "EmissionActivity" VALUES ('IT','ELC_CO2','ELC_NGA','CCUS_ELC_OXY_NGA',2050,'ELC_PROD',-96.73,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('IT','SNK_CO2_EM','ELC_NGA','CCUS_ELC_OXY_NGA',2050,'ELC_PROD',96.73,'kt/PJ','');
-- CCUS, Capture
INSERT INTO "EmissionActivity" VALUES ('IT','ELC_CO2','ethos','CCUS_DAC',2050,'SNK_CO2',-1.0,'kt/kt','');

CREATE TABLE "CommodityEmissionFactor" (
	"input_comm"    text,
	"emis_comm"     text,
	"ef"            real,
	"emis_unit"     text,
	"ef_notes"      text,
	PRIMARY KEY("input_comm","ef","emis_comm"),
	FOREIGN KEY("input_comm") REFERENCES "commodities"("comm_name"),
	FOREIGN KEY("emis_comm") REFERENCES "commodities"("comm_name")
);
-- Electricity sector
INSERT INTO "CommodityEmissionFactor" VALUES ('ELC_COA','ELC_CO2',101.16,'[kt/PJ]','');
INSERT INTO "CommodityEmissionFactor" VALUES ('ELC_NGA','ELC_CO2',56.10,'[kt/PJ]','');
INSERT INTO "CommodityEmissionFactor" VALUES ('ELC_BIO','ELC_CO2',0.00,'[kt/PJ]','');
INSERT INTO "CommodityEmissionFactor" VALUES ('ELC_COA','ELC_CH4',1.15,'[t/PJ]','');
INSERT INTO "CommodityEmissionFactor" VALUES ('ELC_NGA','ELC_CH4',0.13,'[t/PJ]','');
INSERT INTO "CommodityEmissionFactor" VALUES ('ELC_BIO','ELC_CH4',30.00,'[t/PJ]','');
INSERT INTO "CommodityEmissionFactor" VALUES ('ELC_COA','ELC_N2O',1.91,'[t/PJ]','');
INSERT INTO "CommodityEmissionFactor" VALUES ('ELC_NGA','ELC_N2O',0.54,'[t/PJ]','');
INSERT INTO "CommodityEmissionFactor" VALUES ('ELC_BIO','ELC_N2O',4.00,'[t/PJ]','');

CREATE TABLE "EmissionAggregation" (
	"emis_comm"	        text,
    "emis_agg"          text,
    "emis_agg_weight"   real,
    "emis_agg_units"     text,
    "emis_agg_notes"    text,
    PRIMARY KEY("emis_comm","emis_agg","emis_agg_weight")
);
-- Electricity sector
INSERT INTO "EmissionAggregation" VALUES ('ELC_CO2','TOT_CO2',1.00,'[kt/act]','');
INSERT INTO "EmissionAggregation" VALUES ('ELC_CO2_PRC','TOT_CO2',1.00,'[kt/act]','');
INSERT INTO "EmissionAggregation" VALUES ('ELC_CH4','TOT_CH4',1.00E-03,'[kt/act]','');
INSERT INTO "EmissionAggregation" VALUES ('ELC_CH4_PRC','TOT_CH4',1.00E-03,'[kt/act]','');
INSERT INTO "EmissionAggregation" VALUES ('ELC_N2O','TOT_N2O',1.00E-03,'[kt/act]','');
INSERT INTO "EmissionAggregation" VALUES ('ELC_CO2','GWP_100',1.000,'[kt/act]','');
INSERT INTO "EmissionAggregation" VALUES ('ELC_CO2_PRC','GWP_100',1.000,'[kt/act]','');
INSERT INTO "EmissionAggregation" VALUES ('ELC_CH4','GWP_100',0.021,'[kt/act]','');
INSERT INTO "EmissionAggregation" VALUES ('ELC_CH4_PRC','GWP_100',0.021,'[kt/act]','');
INSERT INTO "EmissionAggregation" VALUES ('ELC_N2O','GWP_100',0.310,'[kt/act]','');

CREATE TABLE "Efficiency" (
	"regions"	text,
	"input_comm"	text,
	"tech"	text,
	"vintage"	integer,
	"output_comm"	text,
	"efficiency"	real CHECK("efficiency" > 0),
	"eff_notes"	text,
	PRIMARY KEY("regions","input_comm","tech","vintage","output_comm"),
	FOREIGN KEY("output_comm") REFERENCES "commodities"("comm_name"),
	FOREIGN KEY("tech") REFERENCES "technologies"("tech"),
	FOREIGN KEY("vintage") REFERENCES "time_periods"("t_periods"),
	FOREIGN KEY("input_comm") REFERENCES "commodities"("comm_name")
);
-- Storage
INSERT INTO "Efficiency" VALUES ('IT','ELC_PROD','STG_ELC_CEN_BTT',2050,'ELC_PROD',0.85,'ATB 2022');
-- Electricity sector
-- New technologies
INSERT INTO "Efficiency" VALUES ('IT','ELC_COA','ELC_COA_N',2050,'ELC_PROD',0.44,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','ELC_NGA_N',2050,'ELC_PROD',0.54,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_WIN','ELC_WIN_ON_N',2050,'ELC_PROD',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_WIN','ELC_WIN_OF_N',2050,'ELC_PROD',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_BIO','ELC_BIO_N',2050,'ELC_PROD',0.40,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_HYD','ELC_HYD_N',2050,'ELC_PROD',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_GEO','ELC_GEO_N',2050,'ELC_PROD',0.10,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_SOL','ELC_PV_N',2050,'ELC_PROD',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_H2','ELC_H2_N',2050,'ELC_PROD',0.47,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NUC','ELC_NUC_N',2050,'ELC_PROD',0.33,''); --1/10.44 MWh/MMbtu
INSERT INTO "Efficiency" VALUES ('IT','ELC_IMP','ELC_IMP_DMY_N',2050,'ELC_PROD',1.00,'');
-- Upstream sector
-- Import/export prices
INSERT INTO "Efficiency" VALUES ('IT','ethos','UPS_IMP_BIO',2050,'ELC_BIO',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','UPS_IMP_ELC',2050,'ELC_IMP',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','UPS_IMP_COA',2050,'ELC_COA',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','UPS_IMP_NGA',2050,'ELC_NGA',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','UPS_IMP_H2',2050,'ELC_H2',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','UPS_IMP_NUC',2050,'ELC_NUC',1.00,'');
-- Material supply (#MaterialSR)
INSERT INTO "Efficiency" VALUES ('IT','ethos','UPS_SUPPLY_ALUMINUM_BAUXITE',2050,'Aluminum_bauxite',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','UPS_SUPPLY_BORON',2050,'Boron',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','UPS_SUPPLY_COBALT',2050,'Cobalt',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','UPS_SUPPLY_COPPER',2050,'Copper',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','UPS_SUPPLY_DYSPROSIUM_HREE',2050,'Dysprosium_HREE',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','UPS_SUPPLY_GALLIUM',2050,'Gallium',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','UPS_SUPPLY_HAFNIUM',2050,'Hafnium',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','UPS_SUPPLY_LITHIUM',2050,'Lithium',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','UPS_SUPPLY_MANGANESE',2050,'Manganese',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','UPS_SUPPLY_NEODYMIUM_LREE',2050,'Neodymium_LREE',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','UPS_SUPPLY_NICKEL',2050,'Nickel',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','UPS_SUPPLY_NIOBIUM',2050,'Niobium',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','UPS_SUPPLY_PHOSPHORUS',2050,'Phosphorus',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','UPS_SUPPLY_PLATINUM',2050,'Platinum',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','UPS_SUPPLY_PRASEODYMIUM_LREE',2050,'Praseodymium_LREE',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','UPS_SUPPLY_SILICON',2050,'Silicon',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','UPS_SUPPLY_TERBIUM_HREE',2050,'Terbium_HREE',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','UPS_SUPPLY_TITANIUM',2050,'Titanium',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','UPS_SUPPLY_VANADIUM',2050,'Vanadium',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','UPS_SUPPLY_YTTRIUM_HREE',2050,'Yttrium_HREE',1.00,'');
-- Extraction of fossil fuels
INSERT INTO "Efficiency" VALUES ('IT','ethos','UPS_MIN_COA',2050,'ELC_COA',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','UPS_MIN_NGA',2050,'ELC_NGA',1.00,'');
-- Renewables
INSERT INTO "Efficiency" VALUES ('IT','ethos','UPS_RNW_HYD',2050,'ELC_HYD',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','UPS_RNW_GEO',2050,'ELC_GEO',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','UPS_RNW_SOL',2050,'ELC_SOL',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','UPS_RNW_WIN',2050,'ELC_WIN',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','UPS_RNW_BIO',2050,'ELC_BIO',1.00,'');
-- Dummy
INSERT INTO "Efficiency" VALUES ('IT','ethos','DMY_OUT_TECH',2050,'DMY_OUT',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','DMY_DEM_NON_ANNUAL',2050,'DMY_OUT',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_PROD','DMY_ELC_TECH',2050,'ELC_DEM',1.00,'');
--INSERT INTO "Efficiency" VALUES ('IT','ethos','DMY_PHY_NON_ANNUAL',2050,'ELC_PROD',1.00,'');
--INSERT INTO "Efficiency" VALUES ('IT','ethos','DMY_PHY_NON_ANNUAL',2050,'ELC_COA',1.00,'');
--INSERT INTO "Efficiency" VALUES ('IT','ethos','DMY_PHY_NON_ANNUAL',2050,'ELC_NGA',1.00,'');
--INSERT INTO "Efficiency" VALUES ('IT','ethos','DMY_PHY_NON_ANNUAL',2050,'ELC_WIN',1.00,'');
--INSERT INTO "Efficiency" VALUES ('IT','ethos','DMY_PHY_NON_ANNUAL',2050,'ELC_BIO',1.00,'');
--INSERT INTO "Efficiency" VALUES ('IT','ethos','DMY_PHY_NON_ANNUAL',2050,'ELC_HYD',1.00,'');
--INSERT INTO "Efficiency" VALUES ('IT','ethos','DMY_PHY_NON_ANNUAL',2050,'ELC_GEO',1.00,'');
--INSERT INTO "Efficiency" VALUES ('IT','ethos','DMY_PHY_NON_ANNUAL',2050,'ELC_SOL',1.00,'');
--INSERT INTO "Efficiency" VALUES ('IT','ethos','DMY_PHY_NON_ANNUAL',2050,'ELC_H2',1.00,'');
--INSERT INTO "Efficiency" VALUES ('IT','ethos','DMY_PHY_NON_ANNUAL',2050,'ELC_NUC',1.00,'');
-- Hydrogen
INSERT INTO "Efficiency" VALUES ('IT','ethos','H2_GEN',2050,'ELC_H2',1.00,'');
-- CCUS, Power
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','CCUS_ELC_OXY_NGA',2050,'ELC_PROD',0.55,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','CCUS_ELC_OXY_NGA_LINKED',2050,'SNK_CO2',1.00,'');
-- CCUS, Capture
INSERT INTO "Efficiency" VALUES ('IT','ethos','CCUS_DAC',2050,'SNK_CO2',1.00,'kt/kt');
-- CCUS, Storage
INSERT INTO "Efficiency" VALUES ('IT','SNK_CO2','CCUS_SNK',2050,'DMY_OUT',1.00,'');

CREATE TABLE "LinkedTechs" (
	"primary_region"	text,
	"primary_tech"	text,
	"emis_comm" text,
 	"LINKED_tech"	text,
	"tech_LINKED_notes"	text,
	FOREIGN KEY("primary_tech") REFERENCES "technologies"("tech"),
	FOREIGN KEY("LINKED_tech") REFERENCES "technologies"("tech"),
	FOREIGN KEY("emis_comm") REFERENCES "commodities"("comm_name"),
	PRIMARY KEY("primary_region","primary_tech", "emis_comm")
);
-- CCUS
INSERT INTO "LinkedTechs" VALUES('IT','CCUS_ELC_OXY_NGA','SNK_CO2_EM','CCUS_ELC_OXY_NGA_LINKED','');

CREATE TABLE "DiscountRate" (
	"regions"	text,
	"tech"	text,
	"vintage"	integer,
	"tech_rate"	real,
	"tech_rate_notes"	text,
	PRIMARY KEY("regions","tech","vintage"),
	FOREIGN KEY("tech") REFERENCES "technologies"("tech"),
	FOREIGN KEY("vintage") REFERENCES "time_periods"("t_periods")
);
-- Storage
INSERT INTO "DiscountRate" VALUES ('IT','STG_ELC_CEN_BTT',2050,0.080,'Assumption');
-- Electricity sector
-- New technologies
INSERT INTO "DiscountRate" VALUES ('IT','ELC_COA_N',2050,0.062,'');
INSERT INTO "DiscountRate" VALUES ('IT','ELC_NGA_N',2050,0.027,'');
INSERT INTO "DiscountRate" VALUES ('IT','ELC_WIN_ON_N',2050,0.076,'');
INSERT INTO "DiscountRate" VALUES ('IT','ELC_WIN_OF_N',2050,0.086,'');
INSERT INTO "DiscountRate" VALUES ('IT','ELC_BIO_N',2050,0.067,'');
INSERT INTO "DiscountRate" VALUES ('IT','ELC_HYD_N',2050,0.052,'');
INSERT INTO "DiscountRate" VALUES ('IT','ELC_GEO_N',2050,0.052,'');
INSERT INTO "DiscountRate" VALUES ('IT','ELC_PV_N',2050,0.057,'');
INSERT INTO "DiscountRate" VALUES ('IT','ELC_H2_N',2050,0.08,'');
INSERT INTO "DiscountRate" VALUES ('IT','ELC_NUC_N',2050,0.10,'');
-- CCUS
INSERT INTO "DiscountRate" VALUES ('IT','CCUS_ELC_OXY_NGA',2050,0.027,'');

CREATE TABLE "DemandSpecificDistribution" (
	"regions"	text,
	"season_name"	text,
	"time_of_day_name"	text,
	"demand_name"	text,
	"dds"	real CHECK("dds" >= 0 AND "dds" <= 1),
	"dds_notes"	text,
	PRIMARY KEY("regions","season_name","time_of_day_name","demand_name"),
	FOREIGN KEY("season_name") REFERENCES "time_season"("t_season"),
	FOREIGN KEY("time_of_day_name") REFERENCES "time_of_day"("t_day"),
	FOREIGN KEY("demand_name") REFERENCES "commodities"("comm_name")
);
INSERT INTO "DemandSpecificDistribution" VALUES ('IT','winter','night','ELC_DEM',0.10,'');
INSERT INTO "DemandSpecificDistribution" VALUES ('IT','winter','morning','ELC_DEM',0.06,'');
INSERT INTO "DemandSpecificDistribution" VALUES ('IT','winter','noon','ELC_DEM',0.03,'');
INSERT INTO "DemandSpecificDistribution" VALUES ('IT','winter','afternoon','ELC_DEM',0.06,'');
INSERT INTO "DemandSpecificDistribution" VALUES ('IT','spring','night','ELC_DEM',0.08,'');
INSERT INTO "DemandSpecificDistribution" VALUES ('IT','spring','morning','ELC_DEM',0.06,'');
INSERT INTO "DemandSpecificDistribution" VALUES ('IT','spring','noon','ELC_DEM',0.03,'');
INSERT INTO "DemandSpecificDistribution" VALUES ('IT','spring','afternoon','ELC_DEM',0.06,'');
INSERT INTO "DemandSpecificDistribution" VALUES ('IT','summer','night','ELC_DEM',0.10,'');
INSERT INTO "DemandSpecificDistribution" VALUES ('IT','summer','morning','ELC_DEM',0.07,'');
INSERT INTO "DemandSpecificDistribution" VALUES ('IT','summer','noon','ELC_DEM',0.04,'');
INSERT INTO "DemandSpecificDistribution" VALUES ('IT','summer','afternoon','ELC_DEM',0.07,'');
INSERT INTO "DemandSpecificDistribution" VALUES ('IT','fall','night','ELC_DEM',0.09,'');
INSERT INTO "DemandSpecificDistribution" VALUES ('IT','fall','morning','ELC_DEM',0.06,'');
INSERT INTO "DemandSpecificDistribution" VALUES ('IT','fall','noon','ELC_DEM',0.03,'');
INSERT INTO "DemandSpecificDistribution" VALUES ('IT','fall','afternoon','ELC_DEM',0.06,'');

CREATE TABLE "Driver" (
    "regions"       text,
    "periods"   	integer,
	"driver_name"	text,
	"driver"        real,
	"driver_notes"  text,
	PRIMARY KEY("regions", "periods", "driver_name"),
	FOREIGN KEY("regions") REFERENCES "regions"("regions"),
	FOREIGN KEY("periods") REFERENCES "time_periods"("t_periods")
);

CREATE TABLE "Allocation" (
    "regions"       text,
	"demand_comm"	text,
	"driver_name"	text,
	"allocation_notes"  text,
	PRIMARY KEY("regions", "demand_comm", "driver_name"),
	FOREIGN KEY("regions") REFERENCES "regions"("regions"),
	FOREIGN KEY("demand_comm") REFERENCES "commodities"("comm_name")
);

CREATE TABLE "Elasticity" (
    "regions"       text,
    "periods"   	integer,
	"demand_comm"	text,
	"elasticity"    real,
	"elaticity_notes"  text,
	PRIMARY KEY("regions", "periods", "demand_comm"),
	FOREIGN KEY("regions") REFERENCES "regions"("regions"),
	FOREIGN KEY("periods") REFERENCES "time_periods"("t_periods"),
	FOREIGN KEY("demand_comm") REFERENCES "commodities"("comm_name")
);

CREATE TABLE "Demand" (
	"regions"	text,
	"periods"	integer,
	"demand_comm"	text,
	"demand"	real,
	"demand_units"	text,
	"demand_notes"	text,
	PRIMARY KEY("regions","periods","demand_comm"),
	FOREIGN KEY("periods") REFERENCES "time_periods"("t_periods"),
	FOREIGN KEY("demand_comm") REFERENCES "commodities"("comm_name")
);
-- Electricity sector
--INSERT INTO "Demand" VALUES ('IT',2006,'ELC_DEM',1.494E+02,'PJ','');
--INSERT INTO "Demand" VALUES ('IT',2007,'ELC_DEM',1.677E+02,'PJ','');
--INSERT INTO "Demand" VALUES ('IT',2008,'ELC_DEM',1.790E+02,'PJ','');
--INSERT INTO "Demand" VALUES ('IT',2010,'ELC_DEM',2.036E+02,'PJ','');
--INSERT INTO "Demand" VALUES ('IT',2012,'ELC_DEM',2.246E+02,'PJ','');
--INSERT INTO "Demand" VALUES ('IT',2014,'ELC_DEM',2.506E+02,'PJ','');
--INSERT INTO "Demand" VALUES ('IT',2016,'ELC_DEM',2.664E+02,'PJ','');
--INSERT INTO "Demand" VALUES ('IT',2018,'ELC_DEM',2.737E+02,'PJ','');
--INSERT INTO "Demand" VALUES ('IT',2020,'ELC_DEM',1000,'PJ','');
--INSERT INTO "Demand" VALUES ('IT',2022,'ELC_DEM',2.773E+02,'PJ','');
--INSERT INTO "Demand" VALUES ('IT',2025,'ELC_DEM',2.837E+02,'PJ','');
--INSERT INTO "Demand" VALUES ('IT',2030,'ELC_DEM',2.970E+02,'PJ','');
--INSERT INTO "Demand" VALUES ('IT',2035,'ELC_DEM',3.124E+02,'PJ','');
--INSERT INTO "Demand" VALUES ('IT',2040,'ELC_DEM',3.257E+02,'PJ','');
--INSERT INTO "Demand" VALUES ('IT',2045,'ELC_DEM',3.473E+02,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2050,'ELC_DEM',1589,'PJ','');
-- Upstream sector
--INSERT INTO "Demand" VALUES ('IT',2007,'DMY_OUT',1E6,'','');
--INSERT INTO "Demand" VALUES ('IT',2008,'DMY_OUT',1E6,'','');
--INSERT INTO "Demand" VALUES ('IT',2010,'DMY_OUT',1E6,'','');
--INSERT INTO "Demand" VALUES ('IT',2012,'DMY_OUT',1E6,'','');
--INSERT INTO "Demand" VALUES ('IT',2014,'DMY_OUT',1E6,'','');
--INSERT INTO "Demand" VALUES ('IT',2016,'DMY_OUT',1E6,'','');
--INSERT INTO "Demand" VALUES ('IT',2018,'DMY_OUT',1E6,'','');
--INSERT INTO "Demand" VALUES ('IT',2020,'DMY_OUT',1E6,'','');
--INSERT INTO "Demand" VALUES ('IT',2022,'DMY_OUT',1E6,'','');
--INSERT INTO "Demand" VALUES ('IT',2025,'DMY_OUT',1E6,'','');
--INSERT INTO "Demand" VALUES ('IT',2030,'DMY_OUT',1E6,'','');
--INSERT INTO "Demand" VALUES ('IT',2035,'DMY_OUT',1E6,'','');
--INSERT INTO "Demand" VALUES ('IT',2040,'DMY_OUT',1E6,'','');
--INSERT INTO "Demand" VALUES ('IT',2045,'DMY_OUT',1E6,'','');
INSERT INTO "Demand" VALUES ('IT',2050,'DMY_OUT',1E6,'','');

CREATE TABLE "CostVariable" (
	"regions"	text NOT NULL,
	"periods"	integer NOT NULL,
	"tech"	text NOT NULL,
	"vintage"	integer NOT NULL,
	"cost_variable"	real,
	"cost_variable_units"	text,
	"cost_variable_notes"	text,
	PRIMARY KEY("regions","periods","tech","vintage"),
	FOREIGN KEY("tech") REFERENCES "technologies"("tech"),
	FOREIGN KEY("vintage") REFERENCES "time_periods"("t_periods"),
	FOREIGN KEY("periods") REFERENCES "time_periods"("t_periods")
);
-- Electricity sector
-- New technologies
INSERT INTO "CostVariable" VALUES ('IT',2050,'ELC_COA_N',2050,2.22,'M$2020/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2050,'ELC_NGA_N',2050,0.98,'M$2020/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2050,'ELC_BIO_N',2050,1.42,'M€2009/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2050,'ELC_H2_N',2050,8.33,'M€2013/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2050,'ELC_NUC_N',2050,0.93,'M$2020/PJ','');
-- Upstream sector
-- Import/export prices
INSERT INTO "CostVariable" VALUES ('IT',2050,'UPS_IMP_BIO',2050,43.46,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2050,'UPS_IMP_ELC',2050,25.09,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2050,'UPS_IMP_COA',2050,2.84,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2050,'UPS_IMP_NGA',2050,7.09,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2050,'UPS_IMP_H2',2050,37.00,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2050,'UPS_IMP_NUC',2050,1.96,'M€/PJ',''); --8 USD/MWh
-- Extraction of fossil fuels
INSERT INTO "CostVariable" VALUES ('IT',2050,'UPS_MIN_NGA',2050,2.40,'M€/PJ','');
-- Renewables
INSERT INTO "CostVariable" VALUES ('IT',2050,'UPS_RNW_HYD',2050,1.00E-04,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2050,'UPS_RNW_GEO',2050,1.00E-04,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2050,'UPS_RNW_SOL',2050,1.00E-04,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2050,'UPS_RNW_WIN',2050,1.00E-04,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2050,'UPS_RNW_BIO',2050,14.4,'M€/PJ','');
-- Dummy
INSERT INTO "CostVariable" VALUES ('IT',2050,'DMY_DEM_NON_ANNUAL',2050,5E6,'M€/PJ','');
--INSERT INTO "CostVariable" VALUES ('IT',2050,'DMY_PHY_NON_ANNUAL',2050,5E4,'M€/PJ','');
-- Hydrogen
INSERT INTO "CostVariable" VALUES ('IT',2050,'H2_GEN',2050,27,'M€/PJ','');
-- CCUS, Power
INSERT INTO "CostVariable" VALUES ('IT',2050,'CCUS_ELC_OXY_NGA',2050,0.56,'M€2010/PJ','');
-- CCUS, Capture
INSERT INTO "CostVariable" VALUES ('IT',2050,'CCUS_DAC',2050,0.3,'M€/kt','');
-- CCUS, Storage (CO2 transportation costs are included)
INSERT INTO "CostVariable" VALUES ('IT',2050,'CCUS_SNK',2050,7.76E-03,'M€/kt','');

CREATE TABLE "CostInvest" (
	"regions"	text,
	"tech"	text,
	"vintage"	integer,
	"cost_invest"	real,
	"cost_invest_units"	text,
	"cost_invest_notes"	text,
	PRIMARY KEY("regions","tech","vintage"),
	FOREIGN KEY("tech") REFERENCES "technologies"("tech"),
	FOREIGN KEY("vintage") REFERENCES "time_periods"("t_periods")
);
-- Storage
INSERT INTO "CostInvest" VALUES ('IT','STG_ELC_CEN_BTT',2050,908,'M$/GW','ATB 2022');
-- Electricity sector
-- New technologies
INSERT INTO "CostInvest" VALUES ('IT','ELC_COA_N',2050,2240,'M$2020/GW','');
INSERT INTO "CostInvest" VALUES ('IT','ELC_NGA_N',2050,771,'M$2020/GW','');
INSERT INTO "CostInvest" VALUES ('IT','ELC_WIN_ON_N',2050,765,'M$2020/GW','');
INSERT INTO "CostInvest" VALUES ('IT','ELC_WIN_OF_N',2050,2905,'M$2020/GW','');
INSERT INTO "CostInvest" VALUES ('IT','ELC_BIO_N',2050,2263,'M$2020/GW','');
INSERT INTO "CostInvest" VALUES ('IT','ELC_HYD_N',2050,3375,'M€2009/GW','');
INSERT INTO "CostInvest" VALUES ('IT','ELC_GEO_N',2050,3840,'M€2009/GW','');
INSERT INTO "CostInvest" VALUES ('IT','ELC_PV_N',2050,686,'M$2020/GW','');
INSERT INTO "CostInvest" VALUES ('IT','ELC_H2_N',2050,1000,'M€2013/GW','');
INSERT INTO "CostInvest" VALUES ('IT','ELC_NUC_N',2050,5250,'M$2020/GW','');
-- CCUS, Power
INSERT INTO "CostInvest" VALUES ('IT','CCUS_ELC_OXY_NGA',2050,1330,'M€2010/GW','');
-- Dummy
--INSERT INTO "CostInvest" VALUES ('IT','DMY_PHY_NON_ANNUAL',2050,5E+04,'M€/GW','');

CREATE TABLE "CostFixed" (
	"regions"	text NOT NULL,
	"periods"	integer NOT NULL,
	"tech"	text NOT NULL,
	"vintage"	integer NOT NULL,
	"cost_fixed"	real,
	"cost_fixed_units"	text,
	"cost_fixed_notes"	text,
	PRIMARY KEY("regions","periods","tech","vintage"),
	FOREIGN KEY("tech") REFERENCES "technologies"("tech"),
	FOREIGN KEY("vintage") REFERENCES "time_periods"("t_periods"),
	FOREIGN KEY("periods") REFERENCES "time_periods"("t_periods")
);
-- Storage
INSERT INTO "CostFixed" VALUES ('IT',2050,'STG_ELC_CEN_BTT',2050,23,'M$/GW','ATB 2022');
-- Electricity sector
-- New technologies
INSERT INTO "CostFixed" VALUES ('IT',2050,'ELC_COA_N',2050,74.00,'M$2020/GW','');
INSERT INTO "CostFixed" VALUES ('IT',2050,'ELC_NGA_N',2050,25.00,'M$2020/GW','');
INSERT INTO "CostFixed" VALUES ('IT',2050,'ELC_WIN_ON_N',2050,33.00,'M$2020/GW','');
INSERT INTO "CostFixed" VALUES ('IT',2050,'ELC_WIN_OF_N',2050,64.00,'M$2020/GW','');
INSERT INTO "CostFixed" VALUES ('IT',2050,'ELC_BIO_N',2050,96.00,'M$2020/GW','');
INSERT INTO "CostFixed" VALUES ('IT',2050,'ELC_HYD_N',2050,56.00,'M€2009/GW','');
INSERT INTO "CostFixed" VALUES ('IT',2050,'ELC_GEO_N',2050,60.00,'M€2009/GW','');
INSERT INTO "CostFixed" VALUES ('IT',2050,'ELC_PV_N',2050,12.00,'M$2020/GW','');
INSERT INTO "CostFixed" VALUES ('IT',2050,'ELC_H2_N',2050,56.00,'M€2013/GW','');
INSERT INTO "CostFixed" VALUES ('IT',2050,'ELC_NUC_N',2050,130.48,'M$2020/GW','');
-- CCUS, Power
INSERT INTO "CostFixed" VALUES ('IT',2050,'CCUS_ELC_OXY_NGA',2050,38.00,'M€2010/GW','');

CREATE TABLE "Currency" (
	"curr"	text,
	"value"	real,
	"ref"   text,
	PRIMARY KEY("curr","value")
);
INSERT INTO "Currency" VALUES ('EUR00',1.45,'');
INSERT INTO "Currency" VALUES ('EUR01',1.40,'');
INSERT INTO "Currency" VALUES ('EUR02',1.36,'');
INSERT INTO "Currency" VALUES ('EUR03',1.33,'');
INSERT INTO "Currency" VALUES ('EUR04',1.30,'');
INSERT INTO "Currency" VALUES ('EUR05',1.27,'');
INSERT INTO "Currency" VALUES ('EUR06',1.24,'');
INSERT INTO "Currency" VALUES ('EUR07',1.21,'');
INSERT INTO "Currency" VALUES ('EUR08',1.17,'');
INSERT INTO "Currency" VALUES ('EUR09',1.16,'');
INSERT INTO "Currency" VALUES ('EUR10',1.14,'');
INSERT INTO "Currency" VALUES ('EUR11',1.11,'');
INSERT INTO "Currency" VALUES ('EUR12',1.08,'');
INSERT INTO "Currency" VALUES ('EUR13',1.06,'');
INSERT INTO "Currency" VALUES ('EUR14',1.06,'');
INSERT INTO "Currency" VALUES ('EUR15',1.06,'');
INSERT INTO "Currency" VALUES ('EUR16',1.06,'');
INSERT INTO "Currency" VALUES ('EUR17',1.04,'');
INSERT INTO "Currency" VALUES ('EUR18',1.02,'');
INSERT INTO "Currency" VALUES ('EUR19',1.01,'');
INSERT INTO "Currency" VALUES ('EUR20',1.00,'REF');
INSERT INTO "Currency" VALUES ('EUR21',0.97,'');
INSERT INTO "Currency" VALUES ('EUR22',0.92,'');
INSERT INTO "Currency" VALUES ('USD00',1.57,'');
INSERT INTO "Currency" VALUES ('USD01',1.55,'');
INSERT INTO "Currency" VALUES ('USD02',1.43,'');
INSERT INTO "Currency" VALUES ('USD03',1.07,'');
INSERT INTO "Currency" VALUES ('USD04',1.03,'');
INSERT INTO "Currency" VALUES ('USD05',0.93,'');
INSERT INTO "Currency" VALUES ('USD06',0.98,'');
INSERT INTO "Currency" VALUES ('USD07',0.88,'');
INSERT INTO "Currency" VALUES ('USD08',0.79,'');
INSERT INTO "Currency" VALUES ('USD09',0.83,'');
INSERT INTO "Currency" VALUES ('USD10',0.85,'');
INSERT INTO "Currency" VALUES ('USD11',0.80,'');
INSERT INTO "Currency" VALUES ('USD12',0.83,'');
INSERT INTO "Currency" VALUES ('USD13',0.80,'');
INSERT INTO "Currency" VALUES ('USD14',0.80,'');
INSERT INTO "Currency" VALUES ('USD15',0.95,'');
INSERT INTO "Currency" VALUES ('USD16',0.95,'');
INSERT INTO "Currency" VALUES ('USD17',0.92,'');
INSERT INTO "Currency" VALUES ('USD18',0.87,'');
INSERT INTO "Currency" VALUES ('USD19',0.90,'');
INSERT INTO "Currency" VALUES ('USD20',0.88,'');
INSERT INTO "Currency" VALUES ('USD21',0.82,'');
INSERT INTO "Currency" VALUES ('USD22',0.86,'');

CREATE TABLE "CurrencyTech" (
	"tech"	text,
	"curr"	text,
	PRIMARY KEY("tech","curr")
);
INSERT INTO "CurrencyTech" VALUES ('STG_ELC_CEN_BTT','USD20');
INSERT INTO "CurrencyTech" VALUES ('ELC_COA_N','USD20');
INSERT INTO "CurrencyTech" VALUES ('ELC_NGA_N','USD20');
INSERT INTO "CurrencyTech" VALUES ('ELC_WIN_ON_N','USD20');
INSERT INTO "CurrencyTech" VALUES ('ELC_WIN_OF_N','USD20');
INSERT INTO "CurrencyTech" VALUES ('ELC_BIO_N','USD20');
INSERT INTO "CurrencyTech" VALUES ('ELC_PV_N','USD20');
INSERT INTO "CurrencyTech" VALUES ('ELC_NUC_N','USD20');
INSERT INTO "CurrencyTech" VALUES ('ELC_HYD_N','EUR09');
INSERT INTO "CurrencyTech" VALUES ('ELC_GEO_N','EUR09');
INSERT INTO "CurrencyTech" VALUES ('CCUS_ELC_OXY_NGA','EUR10');
INSERT INTO "CurrencyTech" VALUES ('ELC_H2_N','EUR13');

CREATE TABLE "CapacityToActivity" (
	"regions"	text,
	"tech"	text,
	"c2a"	real,
	"c2a_notes"	TEXT,
	PRIMARY KEY("regions","tech"),
	FOREIGN KEY("tech") REFERENCES "technologies"("tech")
);
-- Storage
INSERT INTO "CapacityToActivity" VALUES ('IT','STG_ELC_CEN_BTT',31.536,'PJ/GW');
-- Electricity sector
INSERT INTO "CapacityToActivity" VALUES ('IT','ELC_COA_N',31.536,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('IT','ELC_NGA_N',31.536,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('IT','ELC_WIN_ON_N',31.536,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('IT','ELC_WIN_OF_N',31.536,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('IT','ELC_BIO_N',31.536,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('IT','ELC_HYD_N',31.536,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('IT','ELC_GEO_N',31.536,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('IT','ELC_PV_N',31.536,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('IT','ELC_H2_N',31.536,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('IT','ELC_NUC_N',31.536,'PJ/GW');
-- CCUS
INSERT INTO "CapacityToActivity" VALUES ('IT','CCUS_ELC_OXY_NGA',31.536,'PJ/GW');

CREATE TABLE "CapacityFactor" (
	"regions"	text,
	"tech"	text,
	"vintage"	integer,
	"cf"	real,
	"cf_notes"	text,
	PRIMARY KEY("regions","tech","vintage"),
	FOREIGN KEY("tech") REFERENCES "technologies"("tech"),
	FOREIGN KEY("vintage") REFERENCES "time_periods"("t_periods")
);
-- Electricity sector
INSERT INTO "CapacityFactor" VALUES ('IT','ELC_COA_N',2050,0.76,'');
INSERT INTO "CapacityFactor" VALUES ('IT','ELC_NGA_N',2050,0.93,'');
--INSERT INTO "CapacityFactor" VALUES ('IT','ELC_WIN_ON_N',2050,0.17,'');
--INSERT INTO "CapacityFactor" VALUES ('IT','ELC_WIN_OF_N',2050,0.17,'');
INSERT INTO "CapacityFactor" VALUES ('IT','ELC_BIO_N',2050,0.60,'');
--INSERT INTO "CapacityFactor" VALUES ('IT','ELC_HYD_N',2050,0.23,'');
INSERT INTO "CapacityFactor" VALUES ('IT','ELC_GEO_N',2050,0.88,'');
--INSERT INTO "CapacityFactor" VALUES ('IT','ELC_PV_N',2050,0.14,'');
INSERT INTO "CapacityFactor" VALUES ('IT','ELC_H2_N',2050,0.90,'');
INSERT INTO "CapacityFactor" VALUES ('IT','ELC_NUC_N',2050,0.94,'');
-- Hydrogen
INSERT INTO "CapacityFactor" VALUES ('IT','H2_GEN',2050,0.90,'');
-- CCUS, Power
INSERT INTO "CapacityFactor" VALUES ('IT','CCUS_ELC_OXY_NGA',2050,0.90,'');
-- CCUS, Capture
INSERT INTO "CapacityFactor" VALUES ('IT','CCUS_DAC',2050,0.90,'');

CREATE TABLE "CapacityFactorTech" (
	"regions"	text,
	"season_name"	text,
	"time_of_day_name"	text,
	"tech"	text,
	"cf_tech"	real CHECK("cf_tech" >= 0 AND "cf_tech" <= 1),
	"cf_tech_notes"	text,
	PRIMARY KEY("regions","season_name","time_of_day_name","tech"),
	FOREIGN KEY("season_name") REFERENCES "time_season"("t_season"),
	FOREIGN KEY("time_of_day_name") REFERENCES "time_of_day"("t_day"),
	FOREIGN KEY("tech") REFERENCES "technologies"("tech")
);
-- Electricity sector
INSERT INTO "CapacityFactorTech" VALUES ('IT','winter','night','ELC_HYD_N',0.190,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','winter','morning','ELC_HYD_N',0.190,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','winter','noon','ELC_HYD_N',0.190,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','winter','afternoon','ELC_HYD_N',0.190,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','spring','night','ELC_HYD_N',0.289,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','spring','morning','ELC_HYD_N',0.289,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','spring','noon','ELC_HYD_N',0.289,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','spring','afternoon','ELC_HYD_N',0.289,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','summer','night','ELC_HYD_N',0.257,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','summer','morning','ELC_HYD_N',0.257,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','summer','noon','ELC_HYD_N',0.257,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','summer','afternoon','ELC_HYD_N',0.257,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','fall','night','ELC_HYD_N',0.201,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','fall','morning','ELC_HYD_N',0.201,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','fall','noon','ELC_HYD_N',0.201,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','fall','afternoon','ELC_HYD_N',0.201,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','winter','night','ELC_WIN_ON_N',0.226,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','winter','morning','ELC_WIN_ON_N',0.228,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','winter','noon','ELC_WIN_ON_N',0.257,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','winter','afternoon','ELC_WIN_ON_N',0.227,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','spring','night','ELC_WIN_ON_N',0.123,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','spring','morning','ELC_WIN_ON_N',0.132,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','spring','noon','ELC_WIN_ON_N',0.170,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','spring','afternoon','ELC_WIN_ON_N',0.147,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','summer','night','ELC_WIN_ON_N',0.087,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','summer','morning','ELC_WIN_ON_N',0.092,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','summer','noon','ELC_WIN_ON_N',0.123,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','summer','afternoon','ELC_WIN_ON_N',0.117,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','fall','night','ELC_WIN_ON_N',0.203,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','fall','morning','ELC_WIN_ON_N',0.206,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','fall','noon','ELC_WIN_ON_N',0.224,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','fall','afternoon','ELC_WIN_ON_N',0.200,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','winter','night','ELC_WIN_OF_N',0.226,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','winter','morning','ELC_WIN_OF_N',0.228,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','winter','noon','ELC_WIN_OF_N',0.257,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','winter','afternoon','ELC_WIN_OF_N',0.227,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','spring','night','ELC_WIN_OF_N',0.123,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','spring','morning','ELC_WIN_OF_N',0.132,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','spring','noon','ELC_WIN_OF_N',0.170,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','spring','afternoon','ELC_WIN_OF_N',0.147,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','summer','night','ELC_WIN_OF_N',0.087,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','summer','morning','ELC_WIN_OF_N',0.092,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','summer','noon','ELC_WIN_OF_N',0.123,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','summer','afternoon','ELC_WIN_OF_N',0.117,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','fall','night','ELC_WIN_OF_N',0.203,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','fall','morning','ELC_WIN_OF_N',0.206,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','fall','noon','ELC_WIN_OF_N',0.224,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','fall','afternoon','ELC_WIN_OF_N',0.200,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','winter','night','ELC_PV_N',0.000,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','winter','morning','ELC_PV_N',0.168,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','winter','noon','ELC_PV_N',0.452,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','winter','afternoon','ELC_PV_N',0.120,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','spring','night','ELC_PV_N',0.000,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','spring','morning','ELC_PV_N',0.302,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','spring','noon','ELC_PV_N',0.546,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','spring','afternoon','ELC_PV_N',0.177,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','summer','night','ELC_PV_N',0.000,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','summer','morning','ELC_PV_N',0.307,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','summer','noon','ELC_PV_N',0.589,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','summer','afternoon','ELC_PV_N',0.185,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','fall','night','ELC_PV_N',0.000,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','fall','morning','ELC_PV_N',0.148,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','fall','noon','ELC_PV_N',0.363,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','fall','afternoon','ELC_PV_N',0.070,'');

CREATE TABLE "CapacityFactorProcess" (
	"regions"	text,
	"season_name"	text,
	"time_of_day_name"	text,
	"tech"	text,
	"vintage"	integer,
	"cf_process"	real CHECK("cf_process" >= 0 AND "cf_process" <= 1),
	"cf_process_notes"	text,
	PRIMARY KEY("regions","season_name","time_of_day_name","tech","vintage"),
	FOREIGN KEY("tech") REFERENCES "technologies"("tech"),
	FOREIGN KEY("season_name") REFERENCES "time_season"("t_season"),
	FOREIGN KEY("time_of_day_name") REFERENCES "time_of_day"("t_day")
);

CREATE TABLE "CapacityCredit" (
	"regions"	text,
	"periods"	integer,
	"tech"	text,
	"vintage" integer,
	"cf_tech"	real CHECK("cf_tech" >= 0 AND "cf_tech" <= 1),
	"cf_tech_notes"	text,
	PRIMARY KEY("regions","periods","tech","vintage")
);
-- Storage
INSERT INTO "CapacityCredit" VALUES ('IT',2050,'STG_ELC_CEN_BTT',2050,0.70,'Assumption');
-- Electricity sector
INSERT INTO "CapacityCredit" VALUES ('IT',2050,'ELC_NGA_N',2050,0.70,'');
INSERT INTO "CapacityCredit" VALUES ('IT',2050,'ELC_WIN_ON_N',2050,0.30,'');
INSERT INTO "CapacityCredit" VALUES ('IT',2050,'ELC_WIN_OF_N',2050,0.30,'');
INSERT INTO "CapacityCredit" VALUES ('IT',2050,'ELC_BIO_N',2050,0.70,'');
INSERT INTO "CapacityCredit" VALUES ('IT',2050,'ELC_HYD_N',2050,0.30,'');
INSERT INTO "CapacityCredit" VALUES ('IT',2050,'ELC_PV_N',2050,0.18,'');
INSERT INTO "CapacityCredit" VALUES ('IT',2050,'ELC_NUC_N',2050,1.00,'');

CREATE TABLE "MaxResource" (
	"regions"	text,
	"tech"	text,
	"maxres"	real,
	"maxres_units"	text,
	"maxres_notes"	text,
	FOREIGN KEY("tech") REFERENCES "technologies"("tech"),
	PRIMARY KEY("regions","tech")
);
-- Upstream sector
INSERT INTO "MaxResource" VALUES ('IT','UPS_MIN_NGA',6393,'PJ','');
-- CCUS
INSERT INTO "MaxResource" VALUES ('IT','CCUS_SNK',3E+07,'kt','');

CREATE TABLE "Output_V_Capacity" (
	"regions"	text,
	"scenario"	text,
	"sector"	text,
	"tech"	text,
	"vintage"	integer,
	"capacity"	real,
	PRIMARY KEY("regions","scenario","tech","vintage"),
	FOREIGN KEY("sector") REFERENCES "sector_labels"("sector"),
	FOREIGN KEY("tech") REFERENCES "technologies"("tech"),
	FOREIGN KEY("vintage") REFERENCES "time_periods"("t_periods")
);
CREATE TABLE "Output_VFlow_Out" (
	"regions"	text,
	"scenario"	text,
	"sector"	text,
	"t_periods"	integer,
	"t_season"	text,
	"t_day"	text,
	"input_comm"	text,
	"tech"	text,
	"vintage"	integer,
	"output_comm"	text,
	"vflow_out"	real,
	PRIMARY KEY("regions","scenario","t_periods","t_season","t_day","input_comm","tech","vintage","output_comm"),
	FOREIGN KEY("output_comm") REFERENCES "commodities"("comm_name"),
	FOREIGN KEY("t_periods") REFERENCES "time_periods"("t_periods"),
	FOREIGN KEY("vintage") REFERENCES "time_periods"("t_periods"),
	FOREIGN KEY("t_season") REFERENCES "time_periods"("t_periods"),
	FOREIGN KEY("tech") REFERENCES "technologies"("tech"),
	FOREIGN KEY("sector") REFERENCES "sector_labels"("sector"),
	FOREIGN KEY("t_day") REFERENCES "time_of_day"("t_day"),
	FOREIGN KEY("input_comm") REFERENCES "commodities"("comm_name")
);
CREATE TABLE "Output_VFlow_In" (
	"regions"	text,
	"scenario"	text,
	"sector"	text,
	"t_periods"	integer,
	"t_season"	text,
	"t_day"	text,
	"input_comm"	text,
	"tech"	text,
	"vintage"	integer,
	"output_comm"	text,
	"vflow_in"	real,
	PRIMARY KEY("regions","scenario","t_periods","t_season","t_day","input_comm","tech","vintage","output_comm"),
	FOREIGN KEY("vintage") REFERENCES "time_periods"("t_periods"),
	FOREIGN KEY("output_comm") REFERENCES "commodities"("comm_name"),
	FOREIGN KEY("t_periods") REFERENCES "time_periods"("t_periods"),
	FOREIGN KEY("sector") REFERENCES "sector_labels"("sector"),
	FOREIGN KEY("t_season") REFERENCES "time_periods"("t_periods"),
	FOREIGN KEY("t_day") REFERENCES "time_of_day"("t_day"),
	FOREIGN KEY("input_comm") REFERENCES "commodities"("comm_name"),
	FOREIGN KEY("tech") REFERENCES "technologies"("tech")
);
--MaterialSR
CREATE TABLE "Output_VMat_Cons" (
	"regions"	text,
	"scenario"	text,
	"sector"	text,
	"material_comm"	text,
	"tech"      text,
	"vintage"	integer,
	"vmat_cons"	real,
	PRIMARY KEY("regions","scenario","material_comm","tech","vintage"),
	FOREIGN KEY("vintage") REFERENCES "time_periods"("t_periods"),
	FOREIGN KEY("sector") REFERENCES "sector_labels"("sector"),
	FOREIGN KEY("material_comm") REFERENCES "commodities"("comm_name"),
	FOREIGN KEY("tech") REFERENCES "technologies"("tech")
);
--In case of MOO, Objective = f1* = f1 - s*c/o(f2)
CREATE TABLE "Output_Objective" (
	"scenario"	text,
	"objective_name"	text,
	"objective_value"	real
);
--MOO
CREATE TABLE "Output_Slack_MOO" (
	"scenario"	text,
	"slack_variable_MOO"	real,
	PRIMARY KEY("scenario")
);
--CostMOO
CREATE TABLE "Output_TotalCosts" (
    "regions"   text,
	"scenario"	text,
	"t_periods" integer,
	"total_costs"	real,
	PRIMARY KEY("regions","scenario","t_periods"),
	FOREIGN KEY("t_periods") REFERENCES "time_periods"("t_periods")
	FOREIGN KEY("regions") REFERENCES "regions"("regions")
);

--EmissionsMOO
CREATE TABLE "Output_TotalEmissions" (
    "regions"   text,
	"scenario"	text,
	"t_periods" integer,
	"total_emissions"	real,
	PRIMARY KEY("regions","scenario","t_periods"),
	FOREIGN KEY("t_periods") REFERENCES "time_periods"("t_periods")
	FOREIGN KEY("regions") REFERENCES "regions"("regions")
);
--EnergySR
CREATE TABLE "Output_EnergySupplyRisk" (
    "regions"   text,
	"scenario"	text,
	"t_periods" integer,
	"energySR"	real,
	PRIMARY KEY("regions","scenario","t_periods"),
	FOREIGN KEY("t_periods") REFERENCES "time_periods"("t_periods")
	FOREIGN KEY("regions") REFERENCES "regions"("regions")
);

--MaterialSR
CREATE TABLE "Output_MaterialSupplyRisk" (
    "regions"   text,
	"scenario"	text,
	"t_periods" integer,
	"materialSR"	real,
	PRIMARY KEY("regions","scenario","t_periods"),
	FOREIGN KEY("t_periods") REFERENCES "time_periods"("t_periods")
	FOREIGN KEY("regions") REFERENCES "regions"("regions")
);

CREATE TABLE "Output_Emissions" (
	"regions"	text,
	"scenario"	text,
	"sector"	text,
	"t_periods"	integer,
	"emissions_comm"	text,
	"tech"	text,
	"vintage"	integer,
	"emissions"	real,
	PRIMARY KEY("regions","scenario","t_periods","emissions_comm","tech","vintage"),
	FOREIGN KEY("vintage") REFERENCES "time_periods"("t_periods"),
	FOREIGN KEY("emissions_comm") REFERENCES "EmissionActivity"("emis_comm"),
	FOREIGN KEY("tech") REFERENCES "technologies"("tech"),
	FOREIGN KEY("sector") REFERENCES "sector_labels"("sector"),
	FOREIGN KEY("t_periods") REFERENCES "time_periods"("t_periods")
);
CREATE TABLE "Output_Curtailment" (
	"regions"	text,
	"scenario"	text,
	"sector"	text,
	"t_periods"	integer,
	"t_season"	text,
	"t_day"	text,
	"input_comm"	text,
	"tech"	text,
	"vintage"	integer,
	"output_comm"	text,
	"curtailment"	real,
	PRIMARY KEY("regions","scenario","t_periods","t_season","t_day","input_comm","tech","vintage","output_comm"),
	FOREIGN KEY("tech") REFERENCES "technologies"("tech"),
	FOREIGN KEY("vintage") REFERENCES "time_periods"("t_periods"),
	FOREIGN KEY("input_comm") REFERENCES "commodities"("comm_name"),
	FOREIGN KEY("output_comm") REFERENCES "commodities"("comm_name"),
	FOREIGN KEY("t_periods") REFERENCES "time_periods"("t_periods"),
	FOREIGN KEY("t_season") REFERENCES "time_periods"("t_periods"),
	FOREIGN KEY("t_day") REFERENCES "time_of_day"("t_day")
);
CREATE TABLE "Output_Costs" (
	"regions"	text,
	"scenario"	text,
	"sector"	text,
	"output_name"	text,
	"tech"	text,
	"vintage"	integer,
	"output_cost"	real,
	PRIMARY KEY("regions","scenario","output_name","tech","vintage"),
	FOREIGN KEY("vintage") REFERENCES "time_periods"("t_periods"),
	FOREIGN KEY("sector") REFERENCES "sector_labels"("sector"),
	FOREIGN KEY("tech") REFERENCES "technologies"("tech")
);
CREATE TABLE "Output_Duals" (
	"constraint_name"	text,
	"scenario"	text,
	"dual"	real,
	PRIMARY KEY("constraint_name","scenario")
);
CREATE TABLE "Output_CapacityByPeriodAndTech" (
	"regions"	text,
	"scenario"	text,
	"sector"	text,
	"t_periods"	integer,
	"tech"	text,
	"capacity"	real,
	PRIMARY KEY("regions","scenario","t_periods","tech"),
	FOREIGN KEY("sector") REFERENCES "sector_labels"("sector"),
	FOREIGN KEY("t_periods") REFERENCES "time_periods"("t_periods"),
	FOREIGN KEY("tech") REFERENCES "technologies"("tech")
);