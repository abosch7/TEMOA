BEGIN TRANSACTION;

--  NOTE: this database contains the BASELINE scenario of the TEMOA_Piedmont Model without comments
--  last modified (28.02.2024)
--  last run (04.02.2025)

CREATE TABLE "time_season" (
   "t_season" text,
   primary key("t_season")
);
INSERT INTO "time_season" VALUES ('summer');
INSERT INTO "time_season" VALUES ('fall');
INSERT INTO "time_season" VALUES ('winter');
INSERT INTO "time_season" VALUES ('spring');

CREATE TABLE "time_periods" (
   "t_periods"    integer,
   "flag" text,
   primary key("t_periods"),
   foreign key("flag") references "time_period_labels"("t_period_labels")
);
INSERT INTO "time_periods" VALUES (2011,'e');
INSERT INTO "time_periods" VALUES (2012,'f');
INSERT INTO "time_periods" VALUES (2013,'f');
INSERT INTO "time_periods" VALUES (2014,'f');
INSERT INTO "time_periods" VALUES (2015,'f');
INSERT INTO "time_periods" VALUES (2017,'f');
INSERT INTO "time_periods" VALUES (2019,'f');
INSERT INTO "time_periods" VALUES (2020,'f');
INSERT INTO "time_periods" VALUES (2021,'f');
INSERT INTO "time_periods" VALUES (2023,'f');
INSERT INTO "time_periods" VALUES (2025,'f');
INSERT INTO "time_periods" VALUES (2030,'f');
INSERT INTO "time_periods" VALUES (2035,'f');
INSERT INTO "time_periods" VALUES (2040,'f');
INSERT INTO "time_periods" VALUES (2050,'f');
INSERT INTO "time_periods" VALUES (2060,'f');

CREATE TABLE "time_period_labels" (
   "t_period_labels"  text,
   "t_period_labels_desc" text,
   primary key("t_period_labels")
);
INSERT INTO "time_period_labels" VALUES ('e','existing vintages');
INSERT INTO "time_period_labels" VALUES ('f','future vintages');

CREATE TABLE "time_of_day" (
   "t_day"    text,
   primary key("t_day")
);

INSERT INTO "time_of_day" VALUES ('night');
INSERT INTO "time_of_day" VALUES ('morning');
INSERT INTO "time_of_day" VALUES ('noon');
INSERT INTO "time_of_day" VALUES ('afternoon');

CREATE TABLE "technology_labels" (
   "tech_labels"  text,
   "tech_labels_desc" text,
   primary key("tech_labels")
);
INSERT INTO "technology_labels" VALUES ('r','resource technology');
INSERT INTO "technology_labels" VALUES ('p','production technology');
INSERT INTO "technology_labels" VALUES ('pb','baseload production technology');
INSERT INTO "technology_labels" VALUES ('ps','storage production technology');

CREATE TABLE "technologies" (
   "tech" text,
   "flag" text,
   "sector"   text,
   "tech_desc"    text,
   "tech_category"    text,
   primary key("tech"),
   foreign key("flag") references "technology_labels"("tech_labels"),
   foreign key("sector") references "sector_labels"("sector")
);


-- Dummy technologies - to account for energy-water demand, Temporary
INSERT INTO "technologies" VALUES ('DMY_WAT_TECH','p','IND','Dummy technology to produce DMY_WAT_OUT','');
INSERT INTO "technologies" VALUES ('UPS_DMY_HET','p','UPS','Dummy technology to produce HET','');
-- Transport sector
-- Fuel technologies
INSERT INTO "technologies" VALUES ('TRA_FT_DST_E','p','TRA','Fuel technology - Diesel - Existing','');
INSERT INTO "technologies" VALUES ('TRA_FT_DST_N','p','TRA','Fuel technology - Diesel - New','');
INSERT INTO "technologies" VALUES ('TRA_FT_ELC','p','TRA','Fuel technology - Electricity','');
INSERT INTO "technologies" VALUES ('TRA_FT_GSL_E','p','TRA','Fuel technology - Gasoline - Existing','');
INSERT INTO "technologies" VALUES ('TRA_FT_GSL_N','p','TRA','Fuel technology - Gasoline - New','');
INSERT INTO "technologies" VALUES ('TRA_FT_JTK_E','p','TRA','Fuel technology - Jet kerosene - Existing','');
INSERT INTO "technologies" VALUES ('TRA_FT_JTK_N','p','TRA','Fuel technology - Jet kerosene - New','');
INSERT INTO "technologies" VALUES ('TRA_FT_LPG_E','p','TRA','Fuel technology - LPG - Existing','');
INSERT INTO "technologies" VALUES ('TRA_FT_LPG_N','p','TRA','Fuel technology - Liquified Petroleum Gas - New','');
INSERT INTO "technologies" VALUES ('TRA_FT_NGA_E','p','TRA','Fuel technology - Natural gas - Existing','');
INSERT INTO "technologies" VALUES ('TRA_FT_NGA_N','p','TRA','Fuel technology - Natural gas - New','');
INSERT INTO "technologies" VALUES ('TRA_FT_BIO_DST_E','p','TRA','Fuel technology - Biodiesel - Existing','');
INSERT INTO "technologies" VALUES ('TRA_FT_BIO_DST_N','p','TRA','Fuel technology - Biodiesel - New','');
INSERT INTO "technologies" VALUES ('TRA_DSL_BLN','p','TRA','Fuel technology -Diesel Road and Biodiesel Blending - Existing','');
INSERT INTO "technologies" VALUES ('TRA_ELC_DIV','p','TRA','Fuel technology -Electricity devisor for ROA, RAIL and OTH transport technologies - Existing','');
-- Base year technologies
INSERT INTO "technologies" VALUES ('TRA_AVI_EN','p','TRA', 'Aircraft - Existing and New','');
INSERT INTO "technologies" VALUES ('TRA_OTH_ELC_EN','p','TRA','Other electric uses - Existing and New','');
INSERT INTO "technologies" VALUES ('TRA_RAIL_ELC_EN','p','TRA','Electric Trains - Existing and New','');
INSERT INTO "technologies" VALUES ('TRA_RAIL_DSL_EN','p','TRA','Diesel Trains - Existing and New','');
INSERT INTO "technologies" VALUES ('TRA_ROA_BUS_DST_E','p','TRA','Buses - Diesel - Existing','');
INSERT INTO "technologies" VALUES ('TRA_ROA_CAR_DST_E','p','TRA','Cars - Diesel - Existing','');
INSERT INTO "technologies" VALUES ('TRA_ROA_CAR_GSL_E','p','TRA','Cars - Gasoline - Existing','');
INSERT INTO "technologies" VALUES ('TRA_ROA_CAR_LPG_E','p','TRA','Cars - LPG - Existing','');
INSERT INTO "technologies" VALUES ('TRA_ROA_CAR_NGA_E','p','TRA','Cars - Natural gas - Existing','');
INSERT INTO "technologies" VALUES ('TRA_ROA_MTR_DST_E','p','TRA','Medium trucks - Diesel - Existing','');
INSERT INTO "technologies" VALUES ('TRA_ROA_HTR_DST_E','p','TRA','Heavy trucks - Diesel - Existing','');
INSERT INTO "technologies" VALUES ('TRA_ROA_LCV_DST_E','p','TRA','Light commercial vehicle - Diesel - Existing','');
INSERT INTO "technologies" VALUES ('TRA_ROA_LCV_GSL_E','p','TRA','Light commercial vehicle - Gasoline - Existing','');
INSERT INTO "technologies" VALUES ('TRA_ROA_MCY_GSL_E','p','TRA','Motorcycles - Gasoline - Existing','');
INSERT INTO "technologies" VALUES ('TRA_ROA_MOP_GSL_E','p','TRA','Mopeds - Gasoline - Existing','');
-- New technologies
INSERT INTO "technologies" VALUES ('TRA_ROA_2WH_DST_N','p','TRA','Two-wheelers - Diesel - New','');
INSERT INTO "technologies" VALUES ('TRA_ROA_2WH_ELC_N','p','TRA','Two-wheelers - Full-electric - New','');
INSERT INTO "technologies" VALUES ('TRA_ROA_2WH_GSL_N','p','TRA','Two-wheelers - Gasoline - New','');
INSERT INTO "technologies" VALUES ('TRA_ROA_2WH_HYBG_N','p','TRA','Two-wheelers - Gasoline hybrid - New','');
INSERT INTO "technologies" VALUES ('TRA_ROA_BUS_DST_N','p','TRA','Buses - Diesel - New','');
INSERT INTO "technologies" VALUES ('TRA_ROA_BUS_ELC_N','p','TRA','Buses - Full-electric - New','');
INSERT INTO "technologies" VALUES ('TRA_ROA_BUS_NGA_N','p','TRA','Buses - Natural Gas - New','');
INSERT INTO "technologies" VALUES ('TRA_ROA_BUS_FCELL_N','p','TRA','Buses - Fuel cell - New','');
INSERT INTO "technologies" VALUES ('TRA_ROA_BUS_GSL_N','p','TRA','Buses - Gasoline - New','');
INSERT INTO "technologies" VALUES ('TRA_ROA_BUS_HYBD_N','p','TRA','Buses -Diesel hybrid - New','');
INSERT INTO "technologies" VALUES ('TRA_ROA_BUS_LPG_N','p','TRA','Buses - LPG - New','');
INSERT INTO "technologies" VALUES ('TRA_ROA_CAR_DST_N','p','TRA','Cars - Diesel - New','');
INSERT INTO "technologies" VALUES ('TRA_ROA_CAR_ELC_N','p','TRA','Cars - Full-electric - New','');
INSERT INTO "technologies" VALUES ('TRA_ROA_CAR_FCELL_N','p','TRA','Cars - Fuel cell - New','');
INSERT INTO "technologies" VALUES ('TRA_ROA_CAR_GSL_N','p','TRA','Cars - Gasoline - New','');
INSERT INTO "technologies" VALUES ('TRA_ROA_CAR_HYBG_N','p','TRA','Cars - Gasoline hybrid - New','');
INSERT INTO "technologies" VALUES ('TRA_ROA_CAR_LPG_N','p','TRA','Cars - LPG - New','');
INSERT INTO "technologies" VALUES ('TRA_ROA_CAR_NGA_N','p','TRA','Cars - Natural gas - New','');
INSERT INTO "technologies" VALUES ('TRA_ROA_CAR_PIHYB_N','p','TRA','Cars - Plug-in hybrid - New','');
INSERT INTO "technologies" VALUES ('TRA_ROA_HTR_DST_N','p','TRA','Heavy trucks - Diesel - New','');
INSERT INTO "technologies" VALUES ('TRA_ROA_HTR_ELC_N','p','TRA','Heavy trucks - Full-electric - New','');
INSERT INTO "technologies" VALUES ('TRA_ROA_HTR_FCELL_N','p','TRA','Heavy trucks - Fuel cell - New','');
INSERT INTO "technologies" VALUES ('TRA_ROA_HTR_GSL_N','p','TRA','Heavy trucks - Gasoline - New','');
INSERT INTO "technologies" VALUES ('TRA_ROA_HTR_HYBD_N','p','TRA','Heavy trucks - Diesel hybrid - New','');
INSERT INTO "technologies" VALUES ('TRA_ROA_HTR_LPG_N','p','TRA','Heavy trucks - LPG - New','');
INSERT INTO "technologies" VALUES ('TRA_ROA_HTR_NGA_N','p','TRA','Heavy trucks - Natural gas - New','');
INSERT INTO "technologies" VALUES ('TRA_ROA_LCV_DST_N','p','TRA','Light commercial vehicles - Diesel - New','');
INSERT INTO "technologies" VALUES ('TRA_ROA_LCV_ELC_N','p','TRA','Light commercial vehicles - Full-electric - New','');
INSERT INTO "technologies" VALUES ('TRA_ROA_LCV_FCELL_N','p','TRA','Light commercial vehicles - Fuel cell - New','');
INSERT INTO "technologies" VALUES ('TRA_ROA_LCV_GSL_N','p','TRA','Light commercial vehicles - Gasoline - New','');
INSERT INTO "technologies" VALUES ('TRA_ROA_LCV_HYBD_N','p','TRA','Light commercial vehicles - Diesel hybrid - New','');
INSERT INTO "technologies" VALUES ('TRA_ROA_LCV_LPG_N','p','TRA','Light commercial vehicles - LPG - New','');
INSERT INTO "technologies" VALUES ('TRA_ROA_LCV_NGA_N','p','TRA','Light commercial vehicles - Natural gas - New','');
INSERT INTO "technologies" VALUES ('TRA_ROA_LCV_PIHYB_N','p','TRA','Light commercial vehicles - Plug-in hybrid - New','');
INSERT INTO "technologies" VALUES ('TRA_ROA_MTR_DST_N','p','TRA','Medium trucks - Diesel - New','');
INSERT INTO "technologies" VALUES ('TRA_ROA_MTR_ELC_N','p','TRA','Medium trucks - Full-electric - New','');
INSERT INTO "technologies" VALUES ('TRA_ROA_MTR_FCELL_N','p','TRA','Medium trucks - Fuel cell - New','');
INSERT INTO "technologies" VALUES ('TRA_ROA_MTR_GSL_N','p','TRA','Medium trucks - Gasoline - New','');
INSERT INTO "technologies" VALUES ('TRA_ROA_MTR_HYBD_N','p','TRA','Medium trucks - Diesel hybrid - New','');
INSERT INTO "technologies" VALUES ('TRA_ROA_MTR_LPG_N','p','TRA','Medium trucks - LPG - New','');
INSERT INTO "technologies" VALUES ('TRA_ROA_MTR_NGA_N','p','TRA','Medium trucks - Natural gas - New','');
-- Electricity sector
-- Fuel technologies
INSERT INTO "technologies" VALUES ('ELC_FT_NGA','p','ELC','Fuel technology - Natural gas','');
INSERT INTO "technologies" VALUES ('ELC_FT_BMU','p','ELC','Fuel technology - Municipal waste','');
INSERT INTO "technologies" VALUES ('ELC_FT_SLB','p','ELC','Fuel technology - Solid biomass','');
INSERT INTO "technologies" VALUES ('ELC_FT_BGS','p','ELC','Fuel technology - Biogas','');
INSERT INTO "technologies" VALUES ('ELC_FT_ELC_IMP','p','ELC','Fuel technology - Imported electricity','');
INSERT INTO "technologies" VALUES ('ELC_FT_HYD','p','ELC','Fuel technology - Hydroelectric','');
INSERT INTO "technologies" VALUES ('ELC_FT_SOL','p','ELC','Fuel technology - Solar','');
INSERT INTO "technologies" VALUES ('ELC_FT_WIN','p','ELC','Fuel technology - Wind','');
INSERT INTO "technologies" VALUES ('ELC_FT_BLQ','p','ELC','Fuel technology - Bioliquids','');
-- Base year technologies
INSERT INTO "technologies" VALUES ('ELC_NGA_CC_E','pb','ELC','Cogeneration natural gas combined cycle - Existing','');
INSERT INTO "technologies" VALUES ('ELC_NGA_STM_REP_E','pb','ELC','Repowered natural gas steam cycle - Existing','');
INSERT INTO "technologies" VALUES ('ELC_NGA_TURB_E','pb','ELC','Natural gas turbine - Existing','');
INSERT INTO "technologies" VALUES ('ELC_CHP_NGA_CC_E','p','ELC','Cogeneration natural gas combined cycle - Existing','');
INSERT INTO "technologies" VALUES ('ELC_CHP_NGA_TURB_E','p','ELC','Cogeneration natural gas turbine - Existing','');
INSERT INTO "technologies" VALUES ('ELC_CHP_NGA_STM_COND_E','p','ELC','Cogeneration natural gas condensation steam cycle - Existing','');
INSERT INTO "technologies" VALUES ('ELC_CHP_BMU_E','p','ELC','Cogeneration municipal waste plant - Existing','');
INSERT INTO "technologies" VALUES ('ELC_CHP_BIO_E','p','ELC','Cogeneration biomass plant - Existing','');
INSERT INTO "technologies" VALUES ('ELC_BGS_E','pb','ELC','Biogas plant - Existing','');
INSERT INTO "technologies" VALUES ('ELC_BIO_E','pb','ELC','Biomass plant - Existing','');
INSERT INTO "technologies" VALUES ('ELC_SOL_E','p','ELC','Solar plant - Existing','');
INSERT INTO "technologies" VALUES ('ELC_WIN_E','p','ELC','Wind plant - Existing','');
INSERT INTO "technologies" VALUES ('ELC_HYD_FLO_E','p','ELC','Flowing water hydroelectric plant - Existing','');
INSERT INTO "technologies" VALUES ('ELC_HYD_RES_E','p','ELC','Reservoir hydroelectric plant - Existing','');
INSERT INTO "technologies" VALUES ('ELC_HYD_PUM_E','p','ELC','Pumping hydroelectric plant - Existing','');
-- Planned technologies
INSERT INTO "technologies" VALUES ('ELC_NGA_CC_P','pb','ELC','Natural gas combined cycle - New (planned)','');
INSERT INTO "technologies" VALUES ('ELC_CHP_NGA_CC_P','p','ELC','Cogeneration natural gas combined cycle - New (planned)','');
INSERT INTO "technologies" VALUES ('ELC_CHP_NGA_TURB_P','p','ELC','Cogeneration natural gas turbine - New (planned)','');

-- New technologies
INSERT INTO "technologies" VALUES ('ELC_NGA_TURB_L80MW_N','pb','ELC','Natural gas turbine (< 80 MW) - New','');
INSERT INTO "technologies" VALUES ('ELC_BLQ_N','p','ELC','Bioliquid plant - New','');
INSERT INTO "technologies" VALUES ('ELC_BIO_5C_N','p','ELC','Biomass (5 cent) plant - New','');
INSERT INTO "technologies" VALUES ('ELC_HYD_MICRO_N','p','ELC','Micro hydroelectric (< 1MW) - New','');
INSERT INTO "technologies" VALUES ('ELC_HYD_MINI_N','p','ELC','Mini hydroelectric (> 1MW) - New','');
INSERT INTO "technologies" VALUES ('ELC_BIOGS_AGR_N','p','ELC','Agriculture and farming biogas plant - New','');
INSERT INTO "technologies" VALUES ('ELC_CHP_BMU_N','p','ELC','Cogeneration municipal waste plant - New','');
INSERT INTO "technologies" VALUES ('ELC_CHP_NGA_TURB_N','p','ELC','Cogeneration natural gas turbine - New','');
INSERT INTO "technologies" VALUES ('ELC_CHP_NGA_CC_N','p','ELC','Cogeneration natural gas combined cycle - New','');
INSERT INTO "technologies" VALUES ('ELC_CHP_NGA_CP_N','p','ELC','Cogeneration natural gas cycle in counter pressure - New','');
INSERT INTO "technologies" VALUES ('ELC_CHP_NGA_TAP_N','p','ELC','Cogeneration natural gas cycle with steam tapping - New','');
INSERT INTO "technologies" VALUES ('ELC_WIN_N','p','ELC','Wind plant - New','');
INSERT INTO "technologies" VALUES ('ELC_PV_GRO_N','p','ELC','Photovoltaic ground plant - Northwest Italy - New','');
INSERT INTO "technologies" VALUES ('ELC_PV_ROOF_N','p','ELC','Photovoltaic roof plant - Northwest Italy - New','');

-- Grouping
INSERT INTO "technologies" VALUES ('ELC_FT_BIO','p','ELC','Grouping Bio-energies','');
-- Importation prices
INSERT INTO "technologies" VALUES ('UPS_IMP_OIL_NSP','p','UPS','Importation price of non specified oil','');
INSERT INTO "technologies" VALUES ('UPS_IMP_OIL_CRD','p','UPS','Importation price of crude oil','');
INSERT INTO "technologies" VALUES ('UPS_IMP_GAS_NGA','p','UPS','Importation price of natural gas','');
INSERT INTO "technologies" VALUES ('UPS_IMP_COA_COC','p','UPS','Importation price of coke oven coke','');
INSERT INTO "technologies" VALUES ('UPS_IMP_COA_HCO','p','UPS','Importation price of hard coal','');
INSERT INTO "technologies" VALUES ('UPS_IMP_ELC_CEN','p','UPS','Importation price of electricity (centralized)','');
INSERT INTO "technologies" VALUES ('UPS_IMP_BIO_DST','p','UPS','Importation price of biodiesel','');
INSERT INTO "technologies" VALUES ('UPS_IMP_WOD','p','UPS','Import of Wood','');
INSERT INTO "technologies" VALUES ('UPS_IMP_OIL_PTC','p','UPS','Import of Petroluem coke','');

-- Fuel technologies
-- Base year technologies
-- Extraction of fossil fuels
INSERT INTO "technologies" VALUES ('UPS_MIN_RES_HOIL','p','UPS','Extraction - Located reserves (ground) - Heavy oil','');
INSERT INTO "technologies" VALUES ('UPS_MIN_RES_NGA','p','UPS','Extraction - Located reserves (ground) - Natural gas','');
INSERT INTO "technologies" VALUES ('UPS_MIN_GRO_HOIL','p','UPS','Extraction - Reserves growth (ground) - Heavy oil','');
INSERT INTO "technologies" VALUES ('UPS_MIN_DSC_HOIL','p','UPS','Extraction - New discovery (ground) - Heavy oil','');
INSERT INTO "technologies" VALUES ('UPS_MIN_GRO_NGA','p','UPS','Extraction - Reserves growth (ground) - Natural gas','');
INSERT INTO "technologies" VALUES ('UPS_MIN_DSC_NGA','p','UPS','Extraction - New discovery (ground) - Natural gas','');
-- Primary production
INSERT INTO "technologies" VALUES ('UPS_PRI_OIL','p','UPS','Primary regional production - Heavy oil','Grouping all Regional oil productions');
INSERT INTO "technologies" VALUES ('UPS_PRI_NGA','p','UPS','Primary regional production - Natural gas','Grouping all regional natural gas productions');
-- Grouping
INSERT INTO "technologies" VALUES ('UPS_GRO_OIL','p','UPS','Grouping imported and extracted Crude Oil','');
INSERT INTO "technologies" VALUES ('UPS_GRO_NGAS','p','UPS','Grouping imported and extracted Natural Gas','');
INSERT INTO "technologies" VALUES ('UPS_REG_OIL_NSP','p','UPS','Re-grouping of non-specified oil','');
-- Secondary transformation
INSERT INTO "technologies" VALUES ('UPS_SEC_REF','p','UPS','Secondary transformation - Refinery','');
INSERT INTO "technologies" VALUES ('UPS_SEC_BFG_OXY','p','UPS','Secondary transformation - Production of blast furnace gas and oxygen steel furnace gas','');
INSERT INTO "technologies" VALUES ('UPS_SEC_OVC_COG','p','UPS','Secondary transformation - Production of coke oven coke and coke oven gas','');
INSERT INTO "technologies" VALUES ('UPS_COA_HCO','p','UPS','Fuel Technology - Hard coal','');
INSERT INTO "technologies" VALUES ('UPS_IMP_COA_OVC','p','UPS','Fuel Technology - Imported OVC ','');
-- Renewables
INSERT INTO "technologies" VALUES ('UPS_RNW_HYD','p','UPS','Renewables - Hydroelectric potential','');
INSERT INTO "technologies" VALUES ('UPS_RNW_SOL','p','UPS','Renewables - Solar potential','');
INSERT INTO "technologies" VALUES ('UPS_RNW_WIN','p','UPS','Renewables - Wind potential','');
INSERT INTO "technologies" VALUES ('UPS_RNW_SLB','p','UPS','Renewables - Production of solid biomass','');
INSERT INTO "technologies" VALUES ('UPS_RNW_BMU','p','UPS','Renewables - Production of municipal wastes','');
INSERT INTO "technologies" VALUES ('UPS_RNW_BGS','p','UPS','Renewables - Production of gas from biomass (landfill gas)','');
INSERT INTO "technologies" VALUES ('UPS_RNW_BLQ','p','UPS','Renewables - Bioliquids','');
INSERT INTO "technologies" VALUES ('UPS_RNW_BIN','p','UPS','Renewables - Production of industrial wastes','');
INSERT INTO "technologies" VALUES ('UPS_RNW_WOD','p','UPS','Extraction – Wood','');

-- Residential sector
-- Fuel technologies
INSERT INTO "technologies" VALUES ('RES_FT_NGA_E','p','RES','Fuel technology - Natural gas mix - Existing','');
INSERT INTO "technologies" VALUES ('RES_FT_DST_E','p','RES','Fuel technology - Diesel - Existing','');
INSERT INTO "technologies" VALUES ('RES_FT_HFO_E','p','RES','Fuel technology - Heavy fuel oil - Existing','');
INSERT INTO "technologies" VALUES ('RES_FT_LPG_E','p','RES','Fuel technology - LPG - Existing','');
INSERT INTO "technologies" VALUES ('RES_FT_BIO_E','p','RES','Fuel technology - Biofuels - Existing','');
INSERT INTO "technologies" VALUES ('RES_FT_HET_E','p','RES','Fuel technology - Heat - Existing','');
INSERT INTO "technologies" VALUES ('RES_FT_ELC_E','p','RES','Fuel technology - Electricity - Existing','');
INSERT INTO "technologies" VALUES ('RES_FT_NGA_N','p','RES','Fuel technology - Natural gas mix - New ','');
INSERT INTO "technologies" VALUES ('RES_FT_DST_N','p','RES','Fuel technology - Diesel - New ','');
INSERT INTO "technologies" VALUES ('RES_FT_HFO_N','p','RES','Fuel technology - Heavy fuel oil - New ','');
INSERT INTO "technologies" VALUES ('RES_FT_LPG_N','p','RES','Fuel technology - Liquefied Petroleum Gas - New ','');
INSERT INTO "technologies" VALUES ('RES_FT_BIO_N','p','RES','Fuel technology - Biofuels - New ','');
INSERT INTO "technologies" VALUES ('RES_FT_HET_N','p','RES','Fuel technology - Heat - New ','');
INSERT INTO "technologies" VALUES ('RES_FT_ELC_N','p','RES','Fuel technology - Electricity - Existing','');
INSERT INTO "technologies" VALUES ('RES_FT_SOL_E','p','RES','Fuel technology - Solar energy - New ','');
INSERT INTO "technologies" VALUES ('RES_FT_SOL_N','p','RES','Fuel technology - Solar energy - New ','');

-- Base year technologies
INSERT INTO "technologies" VALUES ('RES_SH_BUR_NGA_LC_E','p','RES','Space heating - Burner - Natural gas - Low consuming - Existing','');
INSERT INTO "technologies" VALUES ('RES_SH_AHP_NGA_LC_E','p','RES','Space heating - Air-coupled heat pump - Natural gas - Low consuming - Existing','');
INSERT INTO "technologies" VALUES ('RES_SH_BUR_DST_LC_E','p','RES','Space heating - Burner - Diesel - Low consuming - Existing','');
INSERT INTO "technologies" VALUES ('RES_SH_BUR_HFO_LC_E','p','RES','Space heating - Burner - Heavy fuel oil - Low consuming - Existing','');
INSERT INTO "technologies" VALUES ('RES_SH_BUR_LPG_LC_E','p','RES','Space heating - Burner - LPG - Low consuming - Existing','');
INSERT INTO "technologies" VALUES ('RES_SH_HT_ELC_LC_E','p','RES','Space heating - Electric heater  - Low consuming - Existing','');
INSERT INTO "technologies" VALUES ('RES_SH_HP_ELC_LC_E','p','RES','Space heating - Air-coupled heat pump - Electricity - Low consuming - Existing','');
INSERT INTO "technologies" VALUES ('RES_SH_HEX_HET_LC_E','p','RES','Space heating - Heat exchanger - heat - Electricity - Low consuming - Existing','');
INSERT INTO "technologies" VALUES ('RES_SH_WST_BIO_LC_E','p','RES','Space heating - Wood stove - Biomass - Low consuming - Existing','');
INSERT INTO "technologies" VALUES ('RES_SH_BUR_NGA_MC_E','p','RES','Space heating - Burner - Natural gas - Medium consuming - Existing','');
INSERT INTO "technologies" VALUES ('RES_SH_AHP_NGA_MC_E','p','RES','Space heating - Air-coupled heat pump - Natural gas - Medium consuming - Existing','');
INSERT INTO "technologies" VALUES ('RES_SH_BUR_DST_MC_E','p','RES','Space heating - Burner - Diesel - Medium consuming - Existing','');
INSERT INTO "technologies" VALUES ('RES_SH_BUR_HFO_MC_E','p','RES','Space heating - Burner - Heavy fuel oil - Medium consuming - Existing','');
INSERT INTO "technologies" VALUES ('RES_SH_BUR_LPG_MC_E','p','RES','Space heating - Burner - LPG - Medium consuming - Existing','');
INSERT INTO "technologies" VALUES ('RES_SH_HT_ELC_MC_E','p','RES','Space heating - Electric heater - Medium consuming - Existing','');
INSERT INTO "technologies" VALUES ('RES_SH_HP_ELC_MC_E','p','RES','Space heating - Air-coupled heat pump - Electricity - Medium consuming - Existing','');
INSERT INTO "technologies" VALUES ('RES_SH_HEX_HET_MC_E','p','RES','Space heating - Heat exchanger - heat - Medium consuming - Existing','');
INSERT INTO "technologies" VALUES ('RES_SH_WST_BIO_MC_E','p','RES','Space heating - Wood stove - Biomass - Medium consuming - Existing','');
INSERT INTO "technologies" VALUES ('RES_SH_BUR_NGA_HC_E','p','RES','Space heating - Burner - Natural gas - High consuming - Existing','');
INSERT INTO "technologies" VALUES ('RES_SH_AHP_NGA_HC_E','p','RES','Space heating - Air-coupled heat pump - Natural gas - High consuming - Existing','');
INSERT INTO "technologies" VALUES ('RES_SH_BUR_DST_HC_E','p','RES','Space heating - Burner - Diesel - High consuming - Existing','');
INSERT INTO "technologies" VALUES ('RES_SH_BUR_HFO_HC_E','p','RES','Space heating - Burner - Heavy fuel oil - High consuming - Existing','');
INSERT INTO "technologies" VALUES ('RES_SH_BUR_LPG_HC_E','p','RES','Space heating - Burner - LPG - High consuming - Existing','');
INSERT INTO "technologies" VALUES ('RES_SH_HT_ELC_HC_E','p','RES','Space heating - Electric heater  - High consuming - Existing','');
INSERT INTO "technologies" VALUES ('RES_SH_HP_ELC_HC_E','p','RES','Space heating - Air-coupled heat pump - Electricity - High consuming - Existing','');
INSERT INTO "technologies" VALUES ('RES_SH_HEX_HET_HC_E','p','RES','Space heating - Heat exchanger - heat - High consuming - Existing','');
INSERT INTO "technologies" VALUES ('RES_SH_WST_BIO_HC_E','p','RES','Space heating - Wood stove - Biomass - High consuming - Existing','');
INSERT INTO "technologies" VALUES ('RES_SC_CEN_E','p','RES','Space cooling - Central cooling - Electricity - Existing','');
INSERT INTO "technologies" VALUES ('RES_SC_EHP_E','p','RES','Space cooling - Air-coupled heat pump - Electricity - Existing','');
INSERT INTO "technologies" VALUES ('RES_SC_ROOM_E','p','RES','Space cooling - Room cooling - Electricity - Existing','');
INSERT INTO "technologies" VALUES ('RES_WH_NGA_E','p','RES','Water heating - Natural gas - Existing','');
INSERT INTO "technologies" VALUES ('RES_WH_DST_E','p','RES','Water heating - Heavy fuel oil - Existing','');
INSERT INTO "technologies" VALUES ('RES_WH_HFO_E','p','RES','Water heating - Diesel - Existing','');
INSERT INTO "technologies" VALUES ('RES_WH_LPG_E','p','RES','Water heating - LPG - Existing','');
INSERT INTO "technologies" VALUES ('RES_WH_ELC_E','p','RES','Water heating - Biomass - Existing','');
INSERT INTO "technologies" VALUES ('RES_WH_HET_E','p','RES','Water heating - Electricity - Existing','');
INSERT INTO "technologies" VALUES ('RES_WH_BIO_E','p','RES','Water heating - Heat - Existing','');
INSERT INTO "technologies" VALUES ('RES_RF_RFG_ELC_E','p','RES','Refrigeration - Refrigerator - Electricity - Existing','');
INSERT INTO "technologies" VALUES ('RES_RF_FRZ_ELC_E','p','RES','Refrigeration - Freezer - Electricity - Existing','');
INSERT INTO "technologies" VALUES ('RES_CW_ELC_E','p','RES','Cloth washing - Electricity - Existing','');
INSERT INTO "technologies" VALUES ('RES_CD_ELC_E','p','RES','Cloth drying - Electricity - Existing','');
INSERT INTO "technologies" VALUES ('RES_DW_ELC_E','p','RES','Dish washing - Electricity - Existing','');
INSERT INTO "technologies" VALUES ('RES_CK_NGA_E','p','RES','Cooking - Natural gas - Existing','');
INSERT INTO "technologies" VALUES ('RES_CK_LPG_E','p','RES','Cooking - LPG - Existing','');
INSERT INTO "technologies" VALUES ('RES_CK_ELC_E','p','RES','Cooking - Electricity - Existing','');
INSERT INTO "technologies" VALUES ('RES_OE_EQP_E','p','RES','Other electric - Electricity - Existing','');
INSERT INTO "technologies" VALUES ('RES_LG_LFL_E','p','RES','Lighting - Large fluorescent light - Electricity - Existing','');
INSERT INTO "technologies" VALUES ('RES_LG_SFL_E','p','RES','Lighting - Small fluorescent light - Electricity - Existing','');
INSERT INTO "technologies" VALUES ('RES_LG_LHAL_E','p','RES','Lighting - Large halogen light - Electricity - Existing','');
INSERT INTO "technologies" VALUES ('RES_LG_SHAL_IMP_E','p','RES','Lighting - Small improved halogen light - Electricity - Existing','');
INSERT INTO "technologies" VALUES ('RES_LG_SHAL_E','p','RES','Lighting - Small halogen light - Electricity - Existing','');
INSERT INTO "technologies" VALUES ('RES_LG_MIN_E','p','RES','Lighting - Medium incandescence light - Electricity - Existing','');
INSERT INTO "technologies" VALUES ('RES_LG_SIN_E','p','RES','Lighting - Small incandescence light - Electricity - Existing','');
-- New technologies

INSERT INTO "technologies" VALUES ('RES_SH_ROOF_INS_HC_N','p','RES','Space heating - Roof insulation - SF-old - New','');
INSERT INTO "technologies" VALUES ('RES_SH_INT_INS_HC_N','p','RES','Space heating - Internal insulation - SF-old - New','');
INSERT INTO "technologies" VALUES ('RES_SH_BASE_INS_HC_N','p','RES','Space heating - Base floor insulation - SF-old - New','');
INSERT INTO "technologies" VALUES ('RES_SH_WIN_INS_HC_N','p','RES','Space heating - Windows insulation - SF-old - New','');

INSERT INTO "technologies" VALUES ('RES_RF_CLB_N','p','RES','Refrigeration - Class B refrigerator - Electricity - New','');
INSERT INTO "technologies" VALUES ('RES_RF_CLA_N','p','RES','Refrigeration - Class A refrigerator - Electricity - New','');
INSERT INTO "technologies" VALUES ('RES_RF_CLA+_N','p','RES','Refrigeration - Class A+ refrigerator - Electricity - New','');
INSERT INTO "technologies" VALUES ('RES_RF_CLA++_N','p','RES','Refrigeration - Class A++ refrigerator - Electricity - New','');
INSERT INTO "technologies" VALUES ('RES_RF_RFG_2020_N','p','RES','Refrigeration - New refrigerator 2020 - Electricity - New','');
INSERT INTO "technologies" VALUES ('RES_RF_FRZ_CLB_N','p','RES','Refrigeration - Class B freezer - Electricity - New','');
INSERT INTO "technologies" VALUES ('RES_RF_FRZ_CLA_N','p','RES','Refrigeration - Class A freezer - Electricity - New','');
INSERT INTO "technologies" VALUES ('RES_RF_FRZ_CLA++_N','p','RES','Refrigeration - Class A++ freezer - Electricity - New','');
INSERT INTO "technologies" VALUES ('RES_RF_FRZ_2020_N','p','RES','Refrigeration - New freezer 2020 - Electricity - New','');
INSERT INTO "technologies" VALUES ('RES_WH_DST_N','p','RES','Water heating - Diesel - New','');
INSERT INTO "technologies" VALUES ('RES_WH_DST_COND_N','p','RES','Water heating - Diesel (condensing) - New','');
INSERT INTO "technologies" VALUES ('RES_WH_NGA_N','p','RES','Water heating - Natural gas - New','');
INSERT INTO "technologies" VALUES ('RES_WH_NGA_COND_N','p','RES','Water heating - Natural gas (condensing) - New','');
INSERT INTO "technologies" VALUES ('RES_WH_LPG_N','p','RES','Water heating - LPG - New','');
INSERT INTO "technologies" VALUES ('RES_WH_HFO_N','p','RES','Water heating - HFO - New','');
INSERT INTO "technologies" VALUES ('RES_WH_LPG_COND_N','p','RES','Water heating - LPG (condensing) - New','');
INSERT INTO "technologies" VALUES ('RES_WH_WPL_BIO_N','p','RES','Water heating - Biomass wood pellet water heater - New','');
INSERT INTO "technologies" VALUES ('RES_WH_ELC_RES_N','p','RES','Water heating - Resistance - Electricity - New','');
INSERT INTO "technologies" VALUES ('RES_WH_AHP_ELC_N','p','RES','Water heating - Air-coupled heat pump - Electricity - New','');
INSERT INTO "technologies" VALUES ('RES_WH_HNS_ELC_N','p','RES','Water heating - Heat pump coupled near surface - Electricity  - New','');
INSERT INTO "technologies" VALUES ('RES_WH_SOL_N','p','RES','Water heating - Solar energy - New','');
INSERT INTO "technologies" VALUES ('RES_WH_PDC_ACS_N','p','RES','Water heating - Heat pump sanitary water- Heat pump','');
INSERT INTO "technologies" VALUES ('RES_CW_ELC_N','p','RES','Cloth washing - Electricity - New','');
INSERT INTO "technologies" VALUES ('RES_CW_ELC_IMP_N','p','RES','Cloth washing - Electricity (improved) - New','');
INSERT INTO "technologies" VALUES ('RES_CW_ELC_ADV_N','p','RES','Cloth washing - Electricity (advanced) - New','');
INSERT INTO "technologies" VALUES ('RES_CW_2020_ELC_N','p','RES','Cloth washing - New electric cloth washing machine 2020 - Electricity - New','');
INSERT INTO "technologies" VALUES ('RES_CD_ELC_N','p','RES','Cloth drying - Electricity (standard) - New','');
INSERT INTO "technologies" VALUES ('RES_CD_ELC_ADV_N','p','RES','Cloth drying - Electricity (advanced) - New','');
INSERT INTO "technologies" VALUES ('RES_CD_ELC_NEW_N','p','RES','Cloth drying - Electricity (new) - New','');
INSERT INTO "technologies" VALUES ('RES_DW_ELC_STD_N','p','RES','Dish washing - Electricity (standard) - New','');
INSERT INTO "technologies" VALUES ('RES_DW_ELC_IMP_N','p','RES','Dish washing - Electricity (improved) - New','');
INSERT INTO "technologies" VALUES ('RES_DW_ELC_ADV_N','p','RES','Dish washing - Electricity (advanced) - New','');
INSERT INTO "technologies" VALUES ('RES_DW_2020_ELC_N','p','RES','Dish washing - New dish washer 2020 - Electricity - New','');
INSERT INTO "technologies" VALUES ('RES_CK_NGA_N','p','RES','Cooking - Natural gas - New','');
INSERT INTO "technologies" VALUES ('RES_CK_LPG_N','p','RES','Cooking - LPG - New','');
INSERT INTO "technologies" VALUES ('RES_CK_ELC_N','p','RES','Cooking - Electricity - New','');
INSERT INTO "technologies" VALUES ('RES_CK_BIO_N','p','RES','Cooking - Biomass - New','');
INSERT INTO "technologies" VALUES ('RES_LG_BFL_IMP_N','p','RES','Lighting - Big fluorescent compact energy-saver light - Electricity  - New','');
INSERT INTO "technologies" VALUES ('RES_LG_SFL_IMP_N','p','RES','Lighting - Small fluorescent compact energy-saver light - Electricity - New','');
INSERT INTO "technologies" VALUES ('RES_LG_EFL_N','p','RES','Lighting - Electrodeless fluorescent induction light - Electricity - New','');
INSERT INTO "technologies" VALUES ('RES_LG_LFL_N','p','RES','Lighting - Large fluorescent light - Electricity - New','');
INSERT INTO "technologies" VALUES ('RES_LG_SFL_N','p','RES','Lighting - Small fluorescent light - Electricity - New','');
INSERT INTO "technologies" VALUES ('RES_LG_LHAL_N','p','RES','Lighting - Large standard halogen light 220 V - Electricity - New','');
INSERT INTO "technologies" VALUES ('RES_LG_SHAL_IMP_N','p','RES','Lighting - Small improved halogen 12 V - Electricity - New','');
INSERT INTO "technologies" VALUES ('RES_LG_SHAL_N','p','RES','Lighting - Small standard halogen 12 V - Electricity - New','');
INSERT INTO "technologies" VALUES ('RES_LG_MIN_N','p','RES','Lighting - Incandescent medium light - Electricity - New','');
INSERT INTO "technologies" VALUES ('RES_LG_SIN_N','p','RES','Lighting - Incandescent small light - Electricity - New','');
INSERT INTO "technologies" VALUES ('RES_LG_LED_ELC_N','p','RES','Lighting - LED lamp - Electricity - New','');

INSERT INTO "technologies" VALUES ('RES_SH_DST_LC_N','p','RES','Space heating - Diesel - Low Consuming - New','');
INSERT INTO "technologies" VALUES ('RES_SH_DST_COND_LC_N','p','RES','Space heating - Diesel (condensing) - Low Consuming - New','');
INSERT INTO "technologies" VALUES ('RES_SH_NGA_LC_N','p','RES','Space heating - Natural gas - Low Consuming - New','');
INSERT INTO "technologies" VALUES ('RES_SH_NGA_COND_LC_N','p','RES','Space heating - Natural gas (condensing) - Low Consuming - New','');
INSERT INTO "technologies" VALUES ('RES_SH_LPG_LC_N','p','RES','Space heating - LPG - Low Consuming - New','');
INSERT INTO "technologies" VALUES ('RES_SH_LPG_COND_LC_N','p','RES','Space heating - LPG (condensing) - Lowh Consuming - New','');
INSERT INTO "technologies" VALUES ('RES_SH_WST_BIO_LC_N','p','RES','Space heating - Wood stove - Biomass - Low Consuming - New','');
INSERT INTO "technologies" VALUES ('RES_SH_WPL_BIO_LC_N','p','RES','Space heating - Wood pellet - Biomass - Low Consuming - New','');
INSERT INTO "technologies" VALUES ('RES_SH_AHP_ELC_LC_N','p','RES','Space heating - Air-coupled heat pump heating - Electricity - Low Consuming - New','');
INSERT INTO "technologies" VALUES ('RES_SH_HNS_ELC_LC_N','p','RES','Space heating - Heat pump coupled near surface - Electricity - Low Consuming - New','');
INSERT INTO "technologies" VALUES ('RES_SH_HPP_ELC_LC_N','p','RES','Space heating - Heat pump coupled with probe - Electricity - Low Consuming - New','');
INSERT INTO "technologies" VALUES ('RES_SH_HEX_HET_LC_N','p','RES','Space heating - Heat exchanger - Heat - Low Consuming - New','');
INSERT INTO "technologies" VALUES ('RES_SH_HP_HET_LC_N','p','RES','Space heating - Heat pump - Heat - Low Consuming - New','');
INSERT INTO "technologies" VALUES ('RES_SH_HPTS_LC_N','p','RES','Space heating - Heat-pump electricity-to-service transformation - Low Consuming - New','');
INSERT INTO "technologies" VALUES ('RES_SH_SOL_DST_LC_N','p','RES','Space heating - Solar + Diesel - Low Consuming - New','');
INSERT INTO "technologies" VALUES ('RES_SH_SOL_LPG_LC_N','p','RES','Space heating - Solar + LPG heating - Low Consuming - New','');
INSERT INTO "technologies" VALUES ('RES_SH_SOL_NGA_LC_N','p','RES','Space heating - Solar + NGA heating - Low Consuming - New','');
INSERT INTO "technologies" VALUES ('RES_SH_DST_MC_N','p','RES','Space heating - Diesel - Medium Consuming - New','');
INSERT INTO "technologies" VALUES ('RES_SH_DST_COND_MC_N','p','RES','Space heating - Diesel (condensing) - Medium Consuming - New','');
INSERT INTO "technologies" VALUES ('RES_SH_NGA_MC_N','p','RES','Space heating - Natural gas - Medium Consuming - New','');
INSERT INTO "technologies" VALUES ('RES_SH_NGA_COND_MC_N','p','RES','Space heating - Natural gas (condensing) - Medium Consuming - New','');
INSERT INTO "technologies" VALUES ('RES_SH_LPG_MC_N','p','RES','Space heating - LPG - Medium Consuming - New','');
INSERT INTO "technologies" VALUES ('RES_SH_LPG_COND_MC_N','p','RES','Space heating - LPG (condensing) - Mediumh Consuming - New','');
INSERT INTO "technologies" VALUES ('RES_SH_WST_BIO_MC_N','p','RES','Space heating - Wood stove - Biomass - Medium Consuming - New','');
INSERT INTO "technologies" VALUES ('RES_SH_WPL_BIO_MC_N','p','RES','Space heating - Wood pellet - Biomass - Medium Consuming - New','');
INSERT INTO "technologies" VALUES ('RES_SH_AHP_ELC_MC_N','p','RES','Space heating - Air-coupled heat pump heating - Electricity - Medium Consuming - New','');
INSERT INTO "technologies" VALUES ('RES_SH_HNS_ELC_MC_N','p','RES','Space heating - Heat pump coupled near surface - Electricity - Medium Consuming - New','');
INSERT INTO "technologies" VALUES ('RES_SH_HPP_ELC_MC_N','p','RES','Space heating - Heat pump coupled with probe - Electricity - Medium Consuming - New','');
INSERT INTO "technologies" VALUES ('RES_SH_HEX_HET_MC_N','p','RES','Space heating - Heat exchanger - Heat - Medium Consuming - New','');
INSERT INTO "technologies" VALUES ('RES_SH_HP_HET_MC_N','p','RES','Space heating - Heat pump - Heat - Medium Consuming - New','');
INSERT INTO "technologies" VALUES ('RES_SH_HPTS_MC_N','p','RES','Space heating - Heat-pump electricity-to-service transformation - Medium Consuming - New','');
INSERT INTO "technologies" VALUES ('RES_SH_SOL_DST_MC_N','p','RES','Space heating - Solar + Diesel - Medium Consuming - New','');
INSERT INTO "technologies" VALUES ('RES_SH_SOL_LPG_MC_N','p','RES','Space heating - Solar + LPG heating - Medium Consuming - New','');
INSERT INTO "technologies" VALUES ('RES_SH_SOL_NGA_MC_N','p','RES','Space heating - Solar + NGA heating - Medium Consuming - New','');
INSERT INTO "technologies" VALUES ('RES_SH_DST_HC_N','p','RES','Space heating - Diesel - High Consuming - New','');
INSERT INTO "technologies" VALUES ('RES_SH_DST_COND_HC_N','p','RES','Space heating - Diesel (condensing) - High Consuming - New','');
INSERT INTO "technologies" VALUES ('RES_SH_NGA_HC_N','p','RES','Space heating - Natural gas - High Consuming - New','');
INSERT INTO "technologies" VALUES ('RES_SH_NGA_COND_HC_N','p','RES','Space heating - Natural gas (condensing) - High Consuming - New','');
INSERT INTO "technologies" VALUES ('RES_SH_LPG_HC_N','p','RES','Space heating - LPG - High Consuming - New','');
INSERT INTO "technologies" VALUES ('RES_SH_LPG_COND_HC_N','p','RES','Space heating - LPG (condensing) - High Consuming - New','');
INSERT INTO "technologies" VALUES ('RES_SH_WST_BIO_HC_N','p','RES','Space heating - Wood stove - Biomass - High Consuming - New','');
INSERT INTO "technologies" VALUES ('RES_SH_WPL_BIO_HC_N','p','RES','Space heating - Wood pellet - Biomass - High Consuming - New','');
INSERT INTO "technologies" VALUES ('RES_SH_AHP_ELC_HC_N','p','RES','Space heating - Air-coupled heat pump heating - Electricity - High Consuming - New','');
INSERT INTO "technologies" VALUES ('RES_SH_HNS_ELC_HC_N','p','RES','Space heating - Heat pump coupled near surface - Electricity - High Consuming - New','');
INSERT INTO "technologies" VALUES ('RES_SH_HPP_ELC_HC_N','p','RES','Space heating - Heat pump coupled with probe - Electricity - High Consuming - New','');
INSERT INTO "technologies" VALUES ('RES_SH_HEX_HET_HC_N','p','RES','Space heating - Heat exchanger - Heat - High Consuming - New','');
INSERT INTO "technologies" VALUES ('RES_SH_HP_HET_HC_N','p','RES','Space heating - Heat pump - Heat - High Consuming - New','');
INSERT INTO "technologies" VALUES ('RES_SH_HPTS_HC_N','p','RES','Space heating - Heat-pump electricity-to-service transformation - High Consuming - New','');

INSERT INTO "technologies" VALUES ('RES_SH_ROOF_INS_MC_N','p','RES','Space heating - Roof insulation - SF-old - New','');
INSERT INTO "technologies" VALUES ('RES_SH_INT_INS_MC_N','p','RES','Space heating - Internal insulation - SF-old - New','');
INSERT INTO "technologies" VALUES ('RES_SH_BASE_INS_MC_N','p','RES','Space heating - Base floor insulation - SF-old - New','');
INSERT INTO "technologies" VALUES ('RES_SH_WIN_INS_MC_N','p','RES','Space heating - Windows insulation - SF-old - New','');

INSERT INTO "technologies" VALUES ('RES_SC_AHP_ELC_STD_N','p','RES','Space cooling - Air-coupled heat pump cooling - Electricity (standard) - New','');
INSERT INTO "technologies" VALUES ('RES_SC_AHP_ELC_IMP_N','p','RES','Space cooling - Air-coupled heat pump cooling - Electricity (improved) - New','');
INSERT INTO "technologies" VALUES ('RES_SC_ROOM_N','p','RES','Space cooling - Room - New','');
INSERT INTO "technologies" VALUES ('RES_SC_AHP_ELC_ADV_N','p','RES','Space cooling - Air-coupled heat pump - Electricity (advanced) - New','');
INSERT INTO "technologies" VALUES ('RES_SC_ROOM_ELC_NEW_N','p','RES','Space cooling - Room - Electricity (new) - New','');
INSERT INTO "technologies" VALUES ('RES_SC_AHP_NGA_ADV_N','p','RES','Space cooling - Air-coupled heat pump - Natural gas (advanced) - New','');
INSERT INTO "technologies" VALUES ('RES_SC_CEN_NGA_N','p','RES','Space cooling - Central - Natural gas - New','');
INSERT INTO "technologies" VALUES ('RES_SC_AHP_NGA_N','p','RES','Space cooling - Air-coupled heat pump - Natural gas (new) - New','');
INSERT INTO "technologies" VALUES ('RES_SC_HP_N','p','RES','Space cooling - Heat pump - New','');
INSERT INTO "technologies" VALUES ('RES_MISC_EQP_N','p','RES','Miscellaneous equipment - New','');
-- Micro-CHP
INSERT INTO "technologies" VALUES ('RES_CHP_NGA_CI_N','p','RES','mCHP - Residential - Internal combustion engine - Natural gas','');
INSERT INTO "technologies" VALUES ('RES_CHP_NGA_MICRO_N','p','RES','mCHP - Residential - Cogenerative microturbine - Natural gas','');
INSERT INTO "technologies" VALUES ('RES_CHP_NGA_CC_N','p','RES','mCHP - Residential - Combined cycle - Natural gas','');
INSERT INTO "technologies" VALUES ('RES_CHP_NGA_STR_N','p','RES','mCHP - Residential - Stirling engine - Natural gas','');
INSERT INTO "technologies" VALUES ('RES_SC_CEN_N','p','RES','Space cooling - Central - New','');
-- Commercial sector
-- Fuel technologies
INSERT INTO "technologies" VALUES ('COM_FT_NGA_E','p','COM','Fuel technology - Natural gas - Existing','');
INSERT INTO "technologies" VALUES ('COM_FT_DST_E','p','COM','Fuel technology - Diesel - Existing','');
INSERT INTO "technologies" VALUES ('COM_FT_ELC_EN','p','COM','Fuel technology - Electricity - Existing and New','');
INSERT INTO "technologies" VALUES ('COM_FT_NGA_N','p','COM','Fuel technology - Natural gas - New','');
INSERT INTO "technologies" VALUES ('COM_FT_DST_N','p','COM','Fuel technology - Diesel - New','');
INSERT INTO "technologies" VALUES ('COM_FT_LPG_EN','p','COM','Fuel technology - Liquified petroleum gas - Exisitng and New','');
INSERT INTO "technologies" VALUES ('COM_FT_BIO_N','p','COM','Fuel technology - Biomass - New','');
INSERT INTO "technologies" VALUES ('COM_FT_HET_EN','p','COM','Fuel technology - Heat - New','');
-- Base year technologies
INSERT INTO "technologies" VALUES ('COM_SH_HT_NGA_E','p','COM','Space heating - Heater - Natural gas - Existing','');
INSERT INTO "technologies" VALUES ('COM_SH_HP_NGA_E','p','COM','Space heating - Heat pump - Natural gas - Existing','');
INSERT INTO "technologies" VALUES ('COM_SH_HT_DST_E','p','COM','Space heating - Heater - Diesel - Existing','');
INSERT INTO "technologies" VALUES ('COM_SH_HT_LPG_E','p','COM','Space heating - Heater - LPG - Existing','');
INSERT INTO "technologies" VALUES ('COM_SH_RES_ELC_E','p','COM','Space heating - Electric resistance - Electricity - Existing','');
INSERT INTO "technologies" VALUES ('COM_SH_HP_ELC_E','p','COM','Space heating - Heat pump - Electricity - Existing','');
INSERT INTO "technologies" VALUES ('COM_SH_HEX_HET_E','p','COM','Space heating - Heat exchanger - Heat - Existing','');
INSERT INTO "technologies" VALUES ('COM_SC_ABS_NGA_E','p','COM','Space cooling - Absorption chiller - Natural gas - Existing','');
INSERT INTO "technologies" VALUES ('COM_SC_CHL_DST_E','p','COM','Space cooling - Chiller - Diesel - Existing','');
INSERT INTO "technologies" VALUES ('COM_SC_CCL_ELC_CNT_E','p','COM','Space cooling - Centralized cooler - Electricity - Existing','');
INSERT INTO "technologies" VALUES ('COM_SC_AHP_ELC_E','p','COM','Space cooling - Air-coupled heat pump - Electricity - Existing','');
INSERT INTO "technologies" VALUES ('COM_SC_ROOM_ELC_E','p','COM','Space cooling - Room cooler - Electricity - Existing','');
INSERT INTO "technologies" VALUES ('COM_SC_ROOF_ELC_E','p','COM','Space cooling - Rooftop cooler- Electricity - Existing','');
INSERT INTO "technologies" VALUES ('COM_WH_NGA_E','p','COM','Water heating - Electricity - Existing','');
INSERT INTO "technologies" VALUES ('COM_WH_DST_E','p','COM','Water heating - Diesel - Existing','');
INSERT INTO "technologies" VALUES ('COM_WH_LPG_E','p','COM','Water heating - LPG - Existing','');
INSERT INTO "technologies" VALUES ('COM_WH_ELC_E','p','COM','Water heating - Electricity - Existing','');
INSERT INTO "technologies" VALUES ('COM_WH_HET_E','p','COM','Water heating - Heat exchanger - Heat - Existing','');
INSERT INTO "technologies" VALUES ('COM_LG_INC_E','p','COM','Lighting - Incandescent lamp - Electricity - Existing','');
INSERT INTO "technologies" VALUES ('COM_LG_SHAL_E','p','COM','Lighting - Small halogen lamp - Electricity - Existing','');
INSERT INTO "technologies" VALUES ('COM_LG_IRCHAL_E','p','COM','Lighting - IRC halogen lamp - Electricity - Existing','');
INSERT INTO "technologies" VALUES ('COM_LG_SFL_E','p','COM','Lighting - Small fluorescent lamp - Electricity - Existing','');
INSERT INTO "technologies" VALUES ('COM_LG_LFL_E','p','COM','Lighting - Large fluorescent lamp - Electricity - Existing','');
INSERT INTO "technologies" VALUES ('COM_LG_CFL_C_E','p','COM','Lighting - Compact fluorescent lamp - Electricity - Existing','');
INSERT INTO "technologies" VALUES ('COM_LG_MER_E','p','COM','Lighting - Mercury lamp - Electricity - Existing','');
INSERT INTO "technologies" VALUES ('COM_LG_SOD_E','p','COM','Lighting - Sodium lamp - Electricity - Existing','');
INSERT INTO "technologies" VALUES ('COM_CK_NGA_E','p','COM','Cooking - Natural gas - Existing','');
INSERT INTO "technologies" VALUES ('COM_CK_LPG_E','p','COM','Cooking - LPG - Existing','');
INSERT INTO "technologies" VALUES ('COM_CK_ELC_E','p','COM','Cooking - Electricity - Existing','');
INSERT INTO "technologies" VALUES ('COM_RF_RFR_ELC_E','p','COM','Refrigerator - Electricity - Existing','');
INSERT INTO "technologies" VALUES ('COM_OE_OFF_ELC_E','p','COM','Other electric - Office equipment - Electricity - Existing','');
-- New technologies
INSERT INTO "technologies" VALUES ('COM_LG_INC_N','p','COM','Lighting - Incandescence light - Electricity - New','');
INSERT INTO "technologies" VALUES ('COM_LG_SHAL_STD_N','p','COM','Lighting - Standard small halogen light - Electricity - New','');
INSERT INTO "technologies" VALUES ('COM_LG_HAL_IMP_N','p','COM','Lighting - Improved small halogen light - Electricity - New','');
INSERT INTO "technologies" VALUES ('COM_LG_SFL_N','p','COM','Lighting - Small fluorescent light - Electricity - New','');
INSERT INTO "technologies" VALUES ('COM_LG_LFL_N','p','COM','Lighting - Large fluorescent light - Electricity - New','');
INSERT INTO "technologies" VALUES ('COM_LG_CFL_N','p','COM','Lighting - Compact fluorescent light - Electricity - New','');
INSERT INTO "technologies" VALUES ('COM_LG_MER_N','p','COM','Lighting - Mercury lamp - Electricity - New','');
INSERT INTO "technologies" VALUES ('COM_LG_SOD_N','p','COM','Lighting - Sodium lamp - Electricity - New','');
INSERT INTO "technologies" VALUES ('COM_WH_COND_DST_N','p','COM','Water heating - Diesel (condensing) - New','');
INSERT INTO "technologies" VALUES ('COM_WH_NGA_N','p','COM','Water heating - Natural gas - New','');
INSERT INTO "technologies" VALUES ('COM_WH_COND_NGA_N','p','COM','Water heating - Natural gas (condensing) - New','');
INSERT INTO "technologies" VALUES ('COM_WH_LPG_N','p','COM','Water heating - LPG - New','');
INSERT INTO "technologies" VALUES ('COM_WH_COND_LPG_N','p','COM','Water heating - LPG (condensing) - New','');
INSERT INTO "technologies" VALUES ('COM_WH_WPEL_BIO_N','p','COM','Water heating - Wood pellet - Biomass - New','');
INSERT INTO "technologies" VALUES ('COM_WH_ELC_N','p','COM','Water heating - Electricity - New','');
INSERT INTO "technologies" VALUES ('COM_WH_AHP_ELC_N','p','COM','Water heating - Air-coupled heat pump-based - Electricity - New','');
INSERT INTO "technologies" VALUES ('COM_WH_HEX_HET_N','p','COM','Water heating - Heat exchanger - Heat - New','');
INSERT INTO "technologies" VALUES ('COM_SH_NGA_N','p','COM','Space heating - Heater - Natural gas - New','');
INSERT INTO "technologies" VALUES ('COM_SH_COND_NGA_N','p','COM','Space heating - Heater - Natural gas (condensing) - New','');
INSERT INTO "technologies" VALUES ('COM_SH_LPG_N','p','COM','Space heating - Heater - LPG - New','');
INSERT INTO "technologies" VALUES ('COM_SH_COND_LPG_N','p','COM','Space heating - Heater - LPG (condensing) - New','');
INSERT INTO "technologies" VALUES ('COM_SH_HEX_HET_N','p','COM','Space heating - Heat exchanger - Heat - New','');
INSERT INTO "technologies" VALUES ('COM_SH_HP_AIR_N','p','COM','Space heating - Air-coupled heat pump - Electricity - New','');
INSERT INTO "technologies" VALUES ('COM_SH_HP_PRB_N','p','COM','Space heating - Heat pump coupled with probe - Electricity - New','');
INSERT INTO "technologies" VALUES ('COM_SH_HP_N','p','COM','Space heating - Heat pump - Electricity - New','');
INSERT INTO "technologies" VALUES ('COM_SH_WPEL_N','p','COM','Space heating - Wood pellet - Biomass - New','');
INSERT INTO "technologies" VALUES ('COM_SC_HP_STD_N','p','COM','Space cooling - Heat pump (standard) - Electricity - New','');
INSERT INTO "technologies" VALUES ('COM_SC_HP_IMP_N','p','COM','Space cooling - Heat pump (improved) - Electricity - New','');
INSERT INTO "technologies" VALUES ('COM_SC_ROOF_STD_N','p','COM','Space cooling - Rooftop (standard) - Electricity - New','');
INSERT INTO "technologies" VALUES ('COM_SC_ROOF_ADV_N','p','COM','Space cooling - Rooftop (advanced) - Electricity - New','');
INSERT INTO "technologies" VALUES ('COM_SC_REC_N','p','COM','Space cooling - Reciprocating - Electricity - New','');
INSERT INTO "technologies" VALUES ('COM_SC_REC_IMP_N','p','COM','Space cooling - Reciprocating (improved) - Electricity - New','');
INSERT INTO "technologies" VALUES ('COM_SC_CNF_N','p','COM','Space cooling - Centrifugal - Electricity - New','');
INSERT INTO "technologies" VALUES ('COM_SC_CNF_IMP_N','p','COM','Space cooling - Centrifugal (improved) - Electricity - New','');
INSERT INTO "technologies" VALUES ('COM_SC_CNT_N','p','COM','Space cooling - Central - Electricity - New','');
INSERT INTO "technologies" VALUES ('COM_SC_ROOM_N','p','COM','Space cooling - Room - Electricity - New','');
INSERT INTO "technologies" VALUES ('COM_SC_ABS_NGA_N','p','COM','Space cooling - Absorption - Natural gas - New','');
INSERT INTO "technologies" VALUES ('COM_SC_NGA_STD_N','p','COM','Space cooling - Natural gas (standard) - New','');
INSERT INTO "technologies" VALUES ('COM_SC_NGA_IMP_N','p','COM','Space cooling - Natural gas (improved) - New','');
INSERT INTO "technologies" VALUES ('COM_CK_NGA_N','p','COM','Cooking - Natural gas - New','');
INSERT INTO "technologies" VALUES ('COM_CK_LPG_N','p','COM','Cooking - LPG - New','');
INSERT INTO "technologies" VALUES ('COM_CK_ELC_N','p','COM','Cooking - Electricity - New','');
INSERT INTO "technologies" VALUES ('COM_CK_BIO_N','p','COM','Cooking - Biomass - New','');
INSERT INTO "technologies" VALUES ('COM_OE_OFF_ELC_STD_N','p','COM','Other electric - Office equipment (standard) - Electricity - New','');
INSERT INTO "technologies" VALUES ('COM_OE_OFF_ELC_IMP_N','p','COM','Other electric - Office equipment (improved) - Electricity - New','');
INSERT INTO "technologies" VALUES ('COM_OE_OFF_ADV_N','p','COM','Other electric - Office equipment (advanced) - Electricity - New','');
INSERT INTO "technologies" VALUES ('COM_RF_STD_N','p','COM','Refrigeration - Electricity (standard) - New','');
INSERT INTO "technologies" VALUES ('COM_RF_IMP_N','p','COM','Refrigeration - Electricity (improved) - New','');
INSERT INTO "technologies" VALUES ('COM_RF_N','p','COM','Refrigeration - Electricity - New','');
INSERT INTO "technologies" VALUES ('COM_H2G_C1','p','H2','Fuel Tech - H2 Delivery from centralized production (COMP+TR+DP - Commercial)','');
INSERT INTO "technologies" VALUES ('COM_H2G_C2','p','H2','Fuel Tech - H2 Delivery from centralized production (COMP+USTOR+TR+DP - Commercial)','');

-- Micro-CHP
INSERT INTO "technologies" VALUES ('COM_CHP_NGA_CI_N','p','COM','mCHP - Commercial - Internal combustion engine - Natural gas','');
INSERT INTO "technologies" VALUES ('COM_CHP_NGA_MICRO_N','p','COM','mCHP - Commercial - Cogenerative microturbine - Natural gas','');
INSERT INTO "technologies" VALUES ('COM_CHP_NGA_CC_N','p','COM','mCHP - Commercial - Combined cycle - Natural gas','');
INSERT INTO "technologies" VALUES ('COM_CHP_NGA_SOFC_N','p','COM','mCHP - Commercial - Solid oxide fuel cell - Natural gas','');
INSERT INTO "technologies" VALUES ('COM_CHP_HH2_PEMFC_N','p','COM','mCHP - Commercial - Solid oxide fuel cell - Hydrogen','');
-- Agriculture sector technologies
-- Fuel technologies
INSERT INTO "technologies" VALUES ('AGR_FT_NGA_E','p','AGR','Fuel technology - Natural gas - Existing','');
INSERT INTO "technologies" VALUES ('AGR_FT_DST_E','p','AGR','Fuel technology - Diesel - Existing','');
INSERT INTO "technologies" VALUES ('AGR_FT_GSL_E','p','AGR','Fuel technology - Gasoline - Existing','');
INSERT INTO "technologies" VALUES ('AGR_FT_LPG_E','p','AGR','Fuel technology - Liquified petroleum gas - Existing','');
INSERT INTO "technologies" VALUES ('AGR_FT_ELC_E','p','AGR','Fuel technology - Electricity - Existing','');
--Base year technologies
INSERT INTO "technologies" VALUES ('AGR_TECH','p','AGR','Agriculture - Existing technology','');
-- Industrial sector
-- Fuel technologies
INSERT INTO "technologies" VALUES ('IND_FT_COA_E','p','IND','Fuel Technology - Coal  - Existing','');
INSERT INTO "technologies" VALUES ('IND_FT_COA_N','p','IND','Fuel Technology - Coal  - New','');
INSERT INTO "technologies" VALUES ('IND_FT_BFG_E','p','IND','Fuel Technology - Blast furnace gas - Existing','');
INSERT INTO "technologies" VALUES ('IND_FT_BFG_N','p','IND','Fuel Technology - Blast furnace gas - New','');
INSERT INTO "technologies" VALUES ('IND_FT_BIO_E','p','IND','Fuel Technology - Biofuels - Existing','');
INSERT INTO "technologies" VALUES ('IND_FT_BIO_N','p','IND','Fuel Technology - Biofuels - New','');
INSERT INTO "technologies" VALUES ('IND_FT_COG_EN','p','IND','Fuel Technology - Coke oven gas  - New ','');
INSERT INTO "technologies" VALUES ('IND_FT_COK_E','p','IND','Fuel Technology - Oven coke - Existing','');
INSERT INTO "technologies" VALUES ('IND_FT_COK_N','p','IND','Fuel Technology - Oven coke  - New ','');
INSERT INTO "technologies" VALUES ('IND_FT_ELC_EN','p','IND','Fuel Technology - Electricity - Existing','');
INSERT INTO "technologies" VALUES ('IND_FT_ETH_E','p','IND','Fuel Technology - Ethane - Existing','');
INSERT INTO "technologies" VALUES ('IND_FT_ETH_N','p','IND','Fuel Technology - Ethane - New','');
INSERT INTO "technologies" VALUES ('IND_FT_HET_E','p','IND','Fuel Technology - Heat - Existing','');
INSERT INTO "technologies" VALUES ('IND_FT_HET_N','p','IND','Fuel Technology - Heat - New ','');
INSERT INTO "technologies" VALUES ('IND_FT_HFO_E','p','IND','Fuel Technology - Heavy fuel oil - Existing','');
INSERT INTO "technologies" VALUES ('IND_FT_HFO_N','p','IND','Fuel Technology - Heavy fuel oil  - New ','');
INSERT INTO "technologies" VALUES ('IND_FT_LPG_E','p','IND','Fuel Technology - LPG - Existing','');
INSERT INTO "technologies" VALUES ('IND_FT_LPG_N','p','IND','Fuel Technology - LPG - New','');
INSERT INTO "technologies" VALUES ('IND_FT_NGA_E','p','IND','Fuel Technology - Natural gas mix - Existing','');
INSERT INTO "technologies" VALUES ('IND_FT_NGA_N','p','IND','Fuel Technology - Natural gas mix  - New ','');
INSERT INTO "technologies" VALUES ('IND_FT_OIL_E','p','IND','Fuel Technology - Refined petroleum products - Existing','');
INSERT INTO "technologies" VALUES ('IND_FT_OIL_N','p','IND','Fuel Technology - Refined petroleum products - New ','');
INSERT INTO "technologies" VALUES ('IND_FT_PTC_E','p','IND','Fuel Technology - Petroleum coke - Existing','');
INSERT INTO "technologies" VALUES ('IND_FT_PTC_N','p','IND','Fuel Technology - Petroleum coke - New ','');
INSERT INTO "technologies" VALUES ('IND_FT_MET_SYN_N','p','IND','Synthetic methanol','');
INSERT INTO "technologies" VALUES ('IND_FT_NAP_E','p','IND','Fuel Technology - Naphtha - Existing ','');
INSERT INTO "technologies" VALUES ('IND_FT_NAP_N','p','IND','Fuel Technology - Naphtha - New ','');

-- Base year technologies
-- Machine drive and steam
INSERT INTO "technologies" VALUES ('IND_MD_TECH','p','IND','Technology to produce sector-specific Machine Drive','');
INSERT INTO "technologies" VALUES ('IND_MD_ELC_E','p','IND','Machine Drive - Electricity - Existing','');
INSERT INTO "technologies" VALUES ('IND_STM_TECH','p','IND','Technology to produce sector-specific steam','');
INSERT INTO "technologies" VALUES ('IND_STM_DST_E','p','IND','Steam - Distillate oil - Existing','');
INSERT INTO "technologies" VALUES ('IND_STM_HET_E','p','IND','Steam - Heat - Existing','');
INSERT INTO "technologies" VALUES ('IND_STM_HFO_E','p','IND','Steam - Heavy fuel oil - Existing','');
INSERT INTO "technologies" VALUES ('IND_STM_LPG_E','p','IND','Steam - LPG - Existing','');
INSERT INTO "technologies" VALUES ('IND_STM_NGA_E','p','IND','Steam - Natural gas - Existing','');
INSERT INTO "technologies" VALUES ('IND_STM_BIO_E','p','IND','Steam - Biomass - Existing','');
INSERT INTO "technologies" VALUES ('IND_STM_COA_E','p','IND','Steam - Coal - Existing','');
-- Chemicals
INSERT INTO "technologies" VALUES ('IND_CH_TECH','p','IND','Chemical demand production','');
INSERT INTO "technologies" VALUES ('IND_CH_OLF_E','p','IND','Olefins – Existing','');
INSERT INTO "technologies" VALUES ('IND_CH_BTX_E','p','IND','Aromatics – Existing','');
INSERT INTO "technologies" VALUES ('IND_CH_AMM_E','p','IND','Ammonia – Existing','');
INSERT INTO "technologies" VALUES ('IND_CH_MTH_E','p','IND','Methanol – Existing','');
INSERT INTO "technologies" VALUES ('IND_CH_CHL_E','p','IND','Chlorine – Existing','');
INSERT INTO "technologies" VALUES ('IND_CH_OTH_E','p','IND','Other chemicals – Existing','');
INSERT INTO "technologies" VALUES ('IND_CH_FS_NAP_E','p','IND','Technology to convert naphtha to non-energy petrochemical feedstock - Existing','');
INSERT INTO "technologies" VALUES ('IND_CH_FS_KER_E','p','IND','Technology to convert kerosene to non-energy petrochemical feedstock - Existing','');
INSERT INTO "technologies" VALUES ('IND_CH_FS_DST_E','p','IND','Technology to convert distillate to non-energy petrochemical feedstock - Existing','');
INSERT INTO "technologies" VALUES ('IND_CH_FS_GSL_E','p','IND','Technology to convert gasoline to non-energy petrochemical feedstock - Existing','');
INSERT INTO "technologies" VALUES ('IND_CH_FS_HFO_E','p','IND','Technology to convert heavy fuel oil to non-energy petrochemical feedstock - Existing','');
INSERT INTO "technologies" VALUES ('IND_CH_FS_LPG_E','p','IND','Technology to convert LPG to non-energy petrochemical feedstock - Existing','');
INSERT INTO "technologies" VALUES ('IND_CH_FS_NGA_E','p','IND','Technology to convert natural gas to non-energy petrochemical feedstock - Existing','');
INSERT INTO "technologies" VALUES ('IND_CH_FS_NSP_E','p','IND','Technology to convert oil non-specified to non-energy petrochemical feedstock - Existing','');
INSERT INTO "technologies" VALUES ('IND_CH_FS_RFG_E','p','IND','Technology to convert refinery gas to non-energy petrochemical feedstock - Existing','');
INSERT INTO "technologies" VALUES ('IND_CH_EC_E','p','IND','Electro-chemical process for Chemicals - Existing','');
INSERT INTO "technologies" VALUES ('IND_CH_OTH_COK_E','p','IND','Other energy use for Chemicals - Coke - Existing','');
INSERT INTO "technologies" VALUES ('IND_CH_OTH_DST_E','p','IND','Other energy use for Chemicals - Distillate Oil - Existing','');
INSERT INTO "technologies" VALUES ('IND_CH_OTH_ELC_E','p','IND','Other energy use for Chemicals - Electric - Existing','');
INSERT INTO "technologies" VALUES ('IND_CH_OTH_ETH_E','p','IND','Other energy use for Chemicals - Ethane - Existing','');
INSERT INTO "technologies" VALUES ('IND_CH_OTH_HFO_E','p','IND','Other energy use for Chemicals - Heavy fuel oil - Existing','');
INSERT INTO "technologies" VALUES ('IND_CH_OTH_NGA_E','p','IND','Other energy use for Chemicals - Natural gas - Existing','');
INSERT INTO "technologies" VALUES ('IND_CH_OTH_PTC_E','p','IND','Other energy use for Chemicals - Petroleum coke - Existing','');
-- Iron and steel
INSERT INTO "technologies" VALUES ('IND_IS_TECH','p','IND','Iron and steel demand production','');
INSERT INTO "technologies" VALUES ('IND_IS_BOF_E','p','IND','Basic oxygen furnace - Existing','');
INSERT INTO "technologies" VALUES ('IND_IS_EAF_E','p','IND','EAF - Existing','');
INSERT INTO "technologies" VALUES ('IND_IS_FS_PTC_E','p','IND','Petroleum coke consumption in Iron and Steel - Existing','');
INSERT INTO "technologies" VALUES ('IND_IS_FS_COK_E','p','IND','Coke consumption in Iron and Steel - Existing','');
INSERT INTO "technologies" VALUES ('IND_IS_OTH_ELC_E','p','IND','Other energy use for Iron and Steel - Electricity - Existing','');
-- Non-ferrous metals
INSERT INTO "technologies" VALUES ('IND_NF_TECH','p','IND','Non-ferrous metals demand production','');
INSERT INTO "technologies" VALUES ('IND_NF_ALU_E','p','IND','Aluminum - Existing','');
INSERT INTO "technologies" VALUES ('IND_NF_COP_E','p','IND','Copper - Existing','');
INSERT INTO "technologies" VALUES ('IND_NF_ZNC_E','p','IND','Zinc - Existing','');
INSERT INTO "technologies" VALUES ('IND_NF_OTH_E','p','IND','Other Non-ferrous metals- Existing','');
INSERT INTO "technologies" VALUES ('IND_NF_EC_E','p','IND','Electro-chemical process for Non-ferrous metals - Existing','');
INSERT INTO "technologies" VALUES ('IND_NF_OTH_ELC_E','p','IND','Other energy use for Non-ferrous metals - Electricity - Existing','');
INSERT INTO "technologies" VALUES ('IND_NF_OTH_DST_E','p','IND','Other energy use for Non-ferrous metals - Distillate Oil - Existing','');
INSERT INTO "technologies" VALUES ('IND_NF_OTH_NGA_E','p','IND','Other energy use for Non-ferrous metals - Natural gas - Existing','');
INSERT INTO "technologies" VALUES ('IND_NF_OTH_LPG_E','p','IND','Other energy use for Non-ferrous metals - LPG - Existing','');
-- Non-metallic minerals
INSERT INTO "technologies" VALUES ('IND_NM_TECH','p','IND','Non-metallic minerals demand production','');
INSERT INTO "technologies" VALUES ('IND_NM_CLK_DRY_E','p','IND','Clinker - Dry process - Existing','');
INSERT INTO "technologies" VALUES ('IND_NM_CLK_WET_E','p','IND','Clinker - Wet process - Existing','');
INSERT INTO "technologies" VALUES ('IND_NM_CRM_E','p','IND','Ceramics - Existing','');
INSERT INTO "technologies" VALUES ('IND_NM_GLS_E','p','IND','Glass - Existing','');
INSERT INTO "technologies" VALUES ('IND_NM_LIM_E','p','IND','Lime - Existing','');
INSERT INTO "technologies" VALUES ('IND_NM_OTH_COK_E','p','IND','Other energy use for Non-metallic minerals - Coke - Existing','');
INSERT INTO "technologies" VALUES ('IND_NM_OTH_DST_E','p','IND','Other energy use for Non-metallic minerals - Distillate oil - Existing','');
INSERT INTO "technologies" VALUES ('IND_NM_OTH_ELC_E','p','IND','Other energy use for Non-metallic minerals - Electricity - Existing','');
INSERT INTO "technologies" VALUES ('IND_NM_OTH_LPG_E','p','IND','Other energy use for Non-metallic minerals - LPG - Existing','');
INSERT INTO "technologies" VALUES ('IND_NM_OTH_NGA_E','p','IND','Other energy use for Non-metallic minerals - Natural gas - Existing','');
-- Pulp and paper
INSERT INTO "technologies" VALUES ('IND_PP_TECH','p','IND','Pulp and paper demand production','');
INSERT INTO "technologies" VALUES ('IND_PP_PUL_TECH','p','IND','Pulp commodities collection','');
INSERT INTO "technologies" VALUES ('IND_PP_PAP_E','p','IND','Paper mill - Existing','');
INSERT INTO "technologies" VALUES ('IND_PP_PUL_CHEM_E','p','IND','Chemical pulping - Existing','');
INSERT INTO "technologies" VALUES ('IND_PP_PUL_MEC_E','p','IND','Mechanical pulping - Existing','');
INSERT INTO "technologies" VALUES ('IND_PP_PUL_REC_E','p','IND','Recycled fiber pulping - Existing','');
INSERT INTO "technologies" VALUES ('IND_PP_PH_DST_E','p','IND','Process Heat for Pulp and Paper - Distillate oil - Existing','');
INSERT INTO "technologies" VALUES ('IND_PP_PH_ELC_E','p','IND','Process Heat for Pulp and Paper - Electricity - Existing','');
INSERT INTO "technologies" VALUES ('IND_PP_PH_HFO_E','p','IND','Process Heat for Pulp and Paper - Heavy fuel oil - Existing','');
INSERT INTO "technologies" VALUES ('IND_PP_PH_NGA_E','p','IND','Process Heat for Pulp and Paper - Natural gas - Existing','');
INSERT INTO "technologies" VALUES ('IND_PP_OTH_DST_E','p','IND','Other energy use for Pulp and Paper - Distillate oil - Existing','');
INSERT INTO "technologies" VALUES ('IND_PP_OTH_ELC_E','p','IND','Other energy use for Pulp and Paper - Electric - Existing','');
INSERT INTO "technologies" VALUES ('IND_PP_OTH_LPG_E','p','IND','Other energy use for Pulp and Paper - LPG - Existing','');
-- Other industries
INSERT INTO "technologies" VALUES ('IND_OTH_TECH','p','IND','Other industries demand production','');
INSERT INTO "technologies" VALUES ('IND_OTH_PH_DST_E','p','IND','Process Heat for Other Industry Distillate oil - Existing','');
INSERT INTO "technologies" VALUES ('IND_OTH_PH_HFO_E','p','IND','Process Heat for Other Industry Heavy fuel oil - Existing','');
INSERT INTO "technologies" VALUES ('IND_OTH_PH_LPG_E','p','IND','Process Heat for Other Industry LPG - Existing','');
INSERT INTO "technologies" VALUES ('IND_OTH_PH_NGA_E','p','IND','Process Heat for Other Industry Natural gas - Existing','');
INSERT INTO "technologies" VALUES ('IND_OTH_OTH_ELC_E','p','IND','Other energy use for Other Industry - Electricity - Existing','');
INSERT INTO "technologies" VALUES ('IND_NEU_TECH','p','IND','Other non-energy uses demand production','');
INSERT INTO "technologies" VALUES ('IND_ONS_TECH','p','IND','Other non-specified industrial demand production','');
-- New technologies
-- Machine and steam

INSERT INTO "technologies" VALUES ('IND_MD_LPG_N','p','IND','Machine drive - LPG - New','');
INSERT INTO "technologies" VALUES ('IND_MD_NGA_N','p','IND','Machine drive - Natural gas - New','');
INSERT INTO "technologies" VALUES ('IND_MD_ELC_N','p','IND','Machine drive - Electricity - New','');
INSERT INTO "technologies" VALUES ('IND_STM_BIO_N','p','IND','Steam - Biomass - New','');
INSERT INTO "technologies" VALUES ('IND_STM_BFG_N','p','IND','Steam - Blast furnace gas - New','');
INSERT INTO "technologies" VALUES ('IND_STM_DST_N','p','IND','Steam - Distillate oil - New','');
INSERT INTO "technologies" VALUES ('IND_STM_ETH_N','p','IND','Steam - Ethane - New','');
INSERT INTO "technologies" VALUES ('IND_STM_HET_N','p','IND','Steam - Heat - New','');
INSERT INTO "technologies" VALUES ('IND_STM_LPG_N','p','IND','Steam - LPG - New','');
INSERT INTO "technologies" VALUES ('IND_STM_NGA_N','p','IND','Steam - Natural gas - New','');
INSERT INTO "technologies" VALUES ('IND_STM_PTC_N','p','IND','Steam - Petroleum coke - New','');
-- Chemicals
INSERT INTO "technologies" VALUES ('IND_CH_HVC_NAPSC_N','p','IND','HVC - Naphtha steam cracking','');
INSERT INTO "technologies" VALUES ('IND_CH_HVC_ETHSC_N','p','IND','HVC - Ethane steam cracking','');
INSERT INTO "technologies" VALUES ('IND_CH_HVC_GSOSC_N','p','IND','HVC - Gas oil steam cracking','');
INSERT INTO "technologies" VALUES ('IND_CH_HVC_LPGSC_N','p','IND','HVC - LPG steam cracking','');
INSERT INTO "technologies" VALUES ('IND_CH_HVC_NCC_N','p','IND','HVC - Naphtha catalytic cracking','');
INSERT INTO "technologies" VALUES ('IND_CH_HVC_BDH_N','p','IND','HVC - Bioethanol dehydration','');
INSERT INTO "technologies" VALUES ('IND_CH_HVC_N','p','IND','HVC - Olefins and BTX production','');
INSERT INTO "technologies" VALUES ('IND_CH_OLF_PDH_N','p','IND','Olefins - Prophane dehydrogenation','');
INSERT INTO "technologies" VALUES ('IND_CH_OLF_MTO_N','p','IND','Olefins - Methanol-to-olefins','');
INSERT INTO "technologies" VALUES ('IND_CH_AMM_NGASR_N','p','IND','Ammonia - Natural gas steam reforming','');
INSERT INTO "technologies" VALUES ('IND_CH_AMM_NAPPOX_N','p','IND','Ammonia - Naphtha partial oxidation','');
INSERT INTO "technologies" VALUES ('IND_CH_AMM_COAGSF_N','p','IND','Ammonia - Coal gasification','');
INSERT INTO "technologies" VALUES ('IND_CH_AMM_BIOGSF_N','p','IND','Ammonia - Biomass gasification','');
INSERT INTO "technologies" VALUES ('IND_CH_AMM_ELCSYS_N','p','IND','Ammonia - Synthesis via electrolysis','');
INSERT INTO "technologies" VALUES ('IND_CH_MTH_NGASR_N','p','IND','Methanol - Natural gas steam reforming','');
INSERT INTO "technologies" VALUES ('IND_CH_MTH_COGSR_N','p','IND','Methanol - Coke oven gas steam reforming','');
INSERT INTO "technologies" VALUES ('IND_CH_MTH_LPGSR_N','p','IND','Methanol - LPG partial oxidation','');
INSERT INTO "technologies" VALUES ('IND_CH_MTH_COAGSF_N','p','IND','Methanol - Coal gasification','');
INSERT INTO "technologies" VALUES ('IND_CH_MTH_BIOGSF_N','p','IND','Methanol - Biomass gasification','');
INSERT INTO "technologies" VALUES ('IND_CH_MTH_ELCSYS_N','p','IND','Methanol - Synthesis via electrolysis','');
INSERT INTO "technologies" VALUES ('IND_CH_CHL_MERC_N','p','IND','Chlorine - Mercury cell','');
INSERT INTO "technologies" VALUES ('IND_CH_CHL_DIAP_N','p','IND','Chlorine - Diaphragm cell','');
INSERT INTO "technologies" VALUES ('IND_CH_CHL_MEMB_N','p','IND','Chlorine - Membrane cell','');
INSERT INTO "technologies" VALUES ('IND_CH_EC_N','p','IND','Electro-chemical process for Chemicals - New','');
INSERT INTO "technologies" VALUES ('IND_CH_FS_BIO_N','p','IND','Feedstock for Chemicals - Biomass - New','');
INSERT INTO "technologies" VALUES ('IND_CH_FS_COA_N','p','IND','Feedstock for Chemicals - Coal - New','');
INSERT INTO "technologies" VALUES ('IND_CH_FS_DST_N','p','IND','Feedstock for Chemicals - Distillate oil - New','');
INSERT INTO "technologies" VALUES ('IND_CH_FS_ETH_N','p','IND','Feedstock for Chemicals - Ethane - New','');
INSERT INTO "technologies" VALUES ('IND_CH_FS_LPG_N','p','IND','Feedstock for Chemicals - LPG - New','');
INSERT INTO "technologies" VALUES ('IND_CH_FS_MTH_N','p','IND','Feedstock for Chemicals - Methanol - New','');
INSERT INTO "technologies" VALUES ('IND_CH_FS_NAP_N','p','IND','Feedstock for Chemicals - Naphtha - New','');
INSERT INTO "technologies" VALUES ('IND_CH_FS_NGA_N','p','IND','Feedstock for Chemicals - Natural gas - New','');
INSERT INTO "technologies" VALUES ('IND_CH_OTH_COK_N','p','IND','Other energy use for Chemicals - Coke - New','');
INSERT INTO "technologies" VALUES ('IND_CH_OTH_DST_N','p','IND','Other energy use for Chemicals - Distillate Oil - New','');
INSERT INTO "technologies" VALUES ('IND_CH_OTH_ELC_N','p','IND','Other energy use for Chemicals - Electric - New','');
INSERT INTO "technologies" VALUES ('IND_CH_OTH_ETH_N','p','IND','Other energy use for Chemicals - Ethane - New','');
INSERT INTO "technologies" VALUES ('IND_CH_OTH_NGA_N','p','IND','Other energy use for Chemicals - Natural gas - New','');
-- Iron and steel
INSERT INTO "technologies" VALUES ('IND_IS_BOF_BFBOF_N','p','IND','Blast furnace-Basic oxygen furnace (BF-BOF)','');
INSERT INTO "technologies" VALUES ('IND_IS_DRI_DRIEAF_N','p','IND','Direct reduced iron-Electric arc furnace (DRI-EAF)','');
INSERT INTO "technologies" VALUES ('IND_IS_DRI_HDREAF_N','p','IND','Hydrogen direct reduction (HDR)-EAF','');
INSERT INTO "technologies" VALUES ('IND_IS_BOF_HISBOF_N','p','IND','HIsarna-BOF ','');
INSERT INTO "technologies" VALUES ('IND_IS_BOF_ULCOWIN_N','p','IND','Ulcowin','');
INSERT INTO "technologies" VALUES ('IND_IS_BOF_ULCOLYSIS_N','p','IND','Ulcolysis','');
-- Non-ferrous metals
INSERT INTO "technologies" VALUES ('IND_NF_AMN_BAY_N','p','IND','Alumina - Bayer process','');
INSERT INTO "technologies" VALUES ('IND_NF_ALU_HLH_N','p','IND','Primary aluminum - Hall-Héroult process','');
INSERT INTO "technologies" VALUES ('IND_NF_ALU_SEC_N','p','IND','Secondary aluminum - Production from scrap','');
INSERT INTO "technologies" VALUES ('IND_NF_ALU_HLHIA_N','p','IND','Primary aluminum - Hall-Héroult with inert anodes','');
INSERT INTO "technologies" VALUES ('IND_NF_ALU_CBT_N','p','IND','Aluminum - Carbothermic reduction of alumina','');
INSERT INTO "technologies" VALUES ('IND_NF_ALU_KAO_N','p','IND','Aluminum - Kaolinite reduction','');
INSERT INTO "technologies" VALUES ('IND_NF_COP_N','p','IND','Copper - New','');
INSERT INTO "technologies" VALUES ('IND_NF_ZNC_N','p','IND','Zinc - New','');
INSERT INTO "technologies" VALUES ('IND_NF_EC_N','p','IND','Electro-chemical process for Non-ferrous metals - New','');
INSERT INTO "technologies" VALUES ('IND_NF_OTH_ELC_N','p','IND','Other energy use for Non-ferrous metals - Electricity - New','');
INSERT INTO "technologies" VALUES ('IND_NF_OTH_DST_N','p','IND','Other energy use for Non-ferrous metals - Distillate Oil - New','');
INSERT INTO "technologies" VALUES ('IND_NF_OTH_NGA_N','p','IND','Other energy use for Non-ferrous metals - Natural gas - New','');
-- Non-metallic minerals
INSERT INTO "technologies" VALUES ('IND_NM_CLK_DRY_N','p','IND','Clinker - Dry process','');
INSERT INTO "technologies" VALUES ('IND_NM_CLK_WET_N','p','IND','Clinker - Wet process','');
INSERT INTO "technologies" VALUES ('IND_NM_CEM_BLN_N','p','IND','Cement blending','');
INSERT INTO "technologies" VALUES ('IND_NM_CLK_DRYCL_PCCS_N','p','IND','Clinker - Dry process with post-combustion CCS','');
INSERT INTO "technologies" VALUES ('IND_NM_CLK_DRYCL_OCCS_N','p','IND','Clinker - Dry process with oxy-fuel CCS','');
INSERT INTO "technologies" VALUES ('IND_NM_CEM_AAC_N','p','IND','Alkali-activated cement-based binders (AAC)','');
INSERT INTO "technologies" VALUES ('IND_NM_CEM_BEL_N','p','IND','Belite cement','');
INSERT INTO "technologies" VALUES ('IND_NM_LIM_LRK_N','p','IND','Lime - Long rotary kiln','');
INSERT INTO "technologies" VALUES ('IND_NM_GLS_FOSS_N','p','IND','Glass - Fossil fuel-fired furnace','');
INSERT INTO "technologies" VALUES ('IND_NM_GLS_ELEC_N','p','IND','Glass - All-electric furnace','');
INSERT INTO "technologies" VALUES ('IND_NM_CRM_N','p','IND','Ceramics production','');
INSERT INTO "technologies" VALUES ('IND_NM_EC_N','p','IND','Electro-chemical process for Non-metallic minerals - New','');
-- Pulp and paper
INSERT INTO "technologies" VALUES ('IND_PP_PUL_KRF_N','p','IND','Chemical pulping - Kraft process','');
INSERT INTO "technologies" VALUES ('IND_PP_PUL_SUL_N','p','IND','Chemical pulping - Sulfite process','');
INSERT INTO "technologies" VALUES ('IND_PP_PUL_MEC_N','p','IND','Mechanical pulping','');
INSERT INTO "technologies" VALUES ('IND_PP_PUL_SCH_N','p','IND','Semi-chemical pulping','');
INSERT INTO "technologies" VALUES ('IND_PP_PUL_REC_N','p','IND','Recycled fiber pulping','');
INSERT INTO "technologies" VALUES ('IND_PP_PAP_N','p','IND','Paper production and printing','');
INSERT INTO "technologies" VALUES ('IND_PP_PH_HFO_N','p','IND','Process heat for Pulp and Paper - Heavy fuel oil','');
INSERT INTO "technologies" VALUES ('IND_PP_PH_NGA_N','p','IND','Process heat for Pulp and Paper - Natural gas','');
-- Other industries
INSERT INTO "technologies" VALUES ('IND_OTH_PH_DST_N','p','IND','Process Heat for Other Industry Distillate oil - New','');
INSERT INTO "technologies" VALUES ('IND_OTH_PH_HFO_N','p','IND','Process Heat for Other Industry Heavy fuel oil - New','');
INSERT INTO "technologies" VALUES ('IND_OTH_PH_LPG_N','p','IND','Process Heat for Other Industry LPG - New','');
INSERT INTO "technologies" VALUES ('IND_OTH_PH_NGA_N','p','IND','Process Heat for Other Industry Natural gas - New','');
INSERT INTO "technologies" VALUES ('IND_OTH_OTH_ELC_N','p','IND','Other energy use for Other Industry - Electricity','');
-- Micro-CHP
INSERT INTO "technologies" VALUES ('IND_CHP_NGA_CI_N','p','IND','mCHP - Industry - Internal combustion engine - Natural gas','');
INSERT INTO "technologies" VALUES ('IND_CHP_NGA_TG_N','p','IND','mCHP - Industry - Simple cycle gas turbine - Natural gas','');
INSERT INTO "technologies" VALUES ('IND_CHP_NGA_TV_N','p','IND','mCHP - Industry - Steam turbine - Natural gas','');
INSERT INTO "technologies" VALUES ('IND_CHP_BLQ_CI_N','p','IND','mCHP - Industry - Internal combustion engine - Bioliquid','');
INSERT INTO "technologies" VALUES ('UPS_FT_BIO_REC_N','p','UPS','Fuel technology - Biomass recycling - New','To absorb the MAT_BSW output from Pulp and Paper');


-- Hydrogen
INSERT INTO "technologies" VALUES ('IND_H2G_DE','p','H2','Fuel Tech - H2 Delivery from local production through electrolysis (Local production - Industrial)','');
INSERT INTO "technologies" VALUES ('H2_SMR_CL','p','H2','Natural gas steam reforming, centralized, large','');
INSERT INTO "technologies" VALUES ('H2_SMR_CS','p','H2','Natural gas steam reforming, centralized, small','');
INSERT INTO "technologies" VALUES ('H2_SMR_DS','p','H2','Natural gas steam reforming, decentralized, small','');
INSERT INTO "technologies" VALUES ('H2_HOPO','p','H2','Heavy oil partial oxidation','');
INSERT INTO "technologies" VALUES ('H2_TRA_FT_GC1','p','H2','Fuel Tech - H2 Delivery from centralized production (COMP+USTOR+TR+LIQ+LSTORB+RTS+REFLG(large))','');
INSERT INTO "technologies" VALUES ('H2_TRA_FT_GC2','p','H2','Fuel Tech - H2 Delivery from centralized production (COMP+TR+LIQ+LSTORB+RTS+REFLG(large))','');
INSERT INTO "technologies" VALUES ('H2_TRA_FT_GC3','p','H2','Fuel Tech - H2 Delivery from centralized production (COMP+TR+DP+REFGG(large))','');
INSERT INTO "technologies" VALUES ('H2_TRA_FT_GC4','p','H2','Fuel Tech - H2 Delivery from centralized production (COMP+USTOR+TR+GSTORB+RTS+REFGG (small))','');
INSERT INTO "technologies" VALUES ('H2_TRA_FT_GC5','p','H2','Fuel Tech - H2 Delivery from centralized production (COMP+USTOR+TR+DP+REFGG(large))','');

--test
INSERT INTO "technologies" VALUES ('UPS_DMYDMY_BIO','p','UPS','Dummy technology to produce UPS_BIO_DMY','');
CREATE TABLE "tech_mga" (
	"tech"	text,
	"notes"	text,
	PRIMARY KEY("tech")
);
CREATE TABLE "tech_imports" (
	"tech"	text,
	"notes"	text,
	PRIMARY KEY("tech")
);
CREATE TABLE "tech_exports" (
	"tech"	text,
	"notes"	text,
	PRIMARY KEY("tech")
);
CREATE TABLE "tech_domestic" (
	"tech"	text,
	"notes"	text,
	PRIMARY KEY("tech")
);
CREATE TABLE "tech_reserve" (
   "tech" text,
   "notes"    text,
   primary key("tech")
);
INSERT INTO "tech_reserve" VALUES ('ELC_WIN_N','');
INSERT INTO "tech_reserve" VALUES ('ELC_PV_GRO_N','');
INSERT INTO "tech_reserve" VALUES ('ELC_PV_ROOF_N','');

CREATE TABLE "tech_exchange" (
   "tech" text,
   "notes"    text,
   primary key("tech"),
   foreign key("tech") references "technologies"("tech")
);
CREATE TABLE "tech_curtailment" (
   "tech" text,
   "notes"    text,
   primary key("tech"),
   foreign key("tech") references "technologies"("tech")

);
--Power sector
INSERT INTO "tech_curtailment" VALUES ('ELC_WIN_N','');
INSERT INTO "tech_curtailment" VALUES ('ELC_PV_GRO_N','');
INSERT INTO "tech_curtailment" VALUES ('ELC_PV_ROOF_N','');


CREATE TABLE "tech_annual" (
   "tech" text,
   "notes"    text,
   primary key("tech"),
   foreign key("tech") references "technologies"("tech")
);

-- Industrial sector
-- Fuel technologies

INSERT INTO "tech_annual" VALUES ('IND_FT_LPG_E','');
INSERT INTO "tech_annual" VALUES ('IND_FT_LPG_N','');
INSERT INTO "tech_annual" VALUES ('IND_FT_NAP_E','');
INSERT INTO "tech_annual" VALUES ('IND_FT_NAP_N','');
INSERT INTO "tech_annual" VALUES ('IND_FT_PTC_E','');
INSERT INTO "tech_annual" VALUES ('IND_FT_PTC_N','');
INSERT INTO "tech_annual" VALUES ('IND_FT_ELC_EN','');
INSERT INTO "tech_annual" VALUES ('IND_FT_BFG_E','');
INSERT INTO "tech_annual" VALUES ('IND_FT_BFG_N','');
INSERT INTO "tech_annual" VALUES ('IND_FT_BIO_E','');
INSERT INTO "tech_annual" VALUES ('IND_FT_BIO_N','');
INSERT INTO "tech_annual" VALUES ('IND_FT_COA_E','');
INSERT INTO "tech_annual" VALUES ('IND_FT_COA_N','');
INSERT INTO "tech_annual" VALUES ('IND_FT_COG_EN','');
INSERT INTO "tech_annual" VALUES ('IND_FT_COK_E','');
INSERT INTO "tech_annual" VALUES ('IND_FT_COK_N','');
INSERT INTO "tech_annual" VALUES ('IND_FT_ETH_E','');
INSERT INTO "tech_annual" VALUES ('IND_FT_ETH_N','');
INSERT INTO "tech_annual" VALUES ('IND_FT_HFO_E','');
INSERT INTO "tech_annual" VALUES ('IND_FT_HFO_N','');
INSERT INTO "tech_annual" VALUES ('IND_FT_OIL_E','');
INSERT INTO "tech_annual" VALUES ('IND_FT_OIL_N','');
INSERT INTO "tech_annual" VALUES ('IND_FT_NGA_E','');
INSERT INTO "tech_annual" VALUES ('IND_FT_NGA_N','');
-- Upstream
INSERT INTO "tech_annual" VALUES ('UPS_IMP_WOD','');
INSERT INTO "tech_annual" VALUES ('UPS_SEC_BFG_OXY','');
INSERT INTO "tech_annual" VALUES ('UPS_RNW_WOD','');
INSERT INTO "tech_annual" VALUES ('UPS_RNW_BIN','');
INSERT INTO "tech_annual" VALUES ('UPS_FT_BIO_REC_N','');
INSERT INTO "tech_annual" VALUES ('UPS_RNW_BMU','');
INSERT INTO "tech_annual" VALUES ('UPS_IMP_OIL_PTC','');


---- Fictitious technologies
-- Transport Sector
-- Fuel technologies
INSERT INTO "tech_annual" VALUES ('TRA_FT_NGA_E','');
INSERT INTO "tech_annual" VALUES ('TRA_FT_NGA_N','');
-- Base year technologies
INSERT INTO "tech_annual" VALUES ('TRA_OTH_ELC_EN','');
INSERT INTO "tech_annual" VALUES ('TRA_ROA_BUS_DST_E','');
INSERT INTO "tech_annual" VALUES ('TRA_ROA_CAR_DST_E','');
INSERT INTO "tech_annual" VALUES ('TRA_ROA_CAR_GSL_E','');
INSERT INTO "tech_annual" VALUES ('TRA_ROA_CAR_LPG_E','');
INSERT INTO "tech_annual" VALUES ('TRA_ROA_CAR_NGA_E','');
INSERT INTO "tech_annual" VALUES ('TRA_ROA_HTR_DST_E','');
INSERT INTO "tech_annual" VALUES ('TRA_ROA_MTR_DST_E','');
INSERT INTO "tech_annual" VALUES ('TRA_ROA_LCV_DST_E','');
INSERT INTO "tech_annual" VALUES ('TRA_ROA_LCV_GSL_E','');
INSERT INTO "tech_annual" VALUES ('TRA_ROA_MCY_GSL_E','');
INSERT INTO "tech_annual" VALUES ('TRA_ROA_MOP_GSL_E','');
-- New technologies
INSERT INTO "tech_annual" VALUES ('TRA_ROA_2WH_DST_N','');
INSERT INTO "tech_annual" VALUES ('TRA_ROA_2WH_ELC_N','');
INSERT INTO "tech_annual" VALUES ('TRA_ROA_2WH_GSL_N','');
INSERT INTO "tech_annual" VALUES ('TRA_ROA_2WH_HYBG_N','');
INSERT INTO "tech_annual" VALUES ('TRA_ROA_BUS_DST_N','');
INSERT INTO "tech_annual" VALUES ('TRA_ROA_BUS_ELC_N','');
INSERT INTO "tech_annual" VALUES ('TRA_ROA_BUS_FCELL_N','');
INSERT INTO "tech_annual" VALUES ('TRA_ROA_BUS_GSL_N','');
INSERT INTO "tech_annual" VALUES ('TRA_ROA_BUS_HYBD_N','');
INSERT INTO "tech_annual" VALUES ('TRA_ROA_BUS_LPG_N','');
INSERT INTO "tech_annual" VALUES ('TRA_ROA_CAR_DST_N','');
INSERT INTO "tech_annual" VALUES ('TRA_ROA_CAR_ELC_N','');
INSERT INTO "tech_annual" VALUES ('TRA_ROA_CAR_FCELL_N','');
INSERT INTO "tech_annual" VALUES ('TRA_ROA_CAR_GSL_N','');
INSERT INTO "tech_annual" VALUES ('TRA_ROA_CAR_HYBG_N','');
INSERT INTO "tech_annual" VALUES ('TRA_ROA_CAR_LPG_N','');
INSERT INTO "tech_annual" VALUES ('TRA_ROA_CAR_NGA_N','');
INSERT INTO "tech_annual" VALUES ('TRA_ROA_CAR_PIHYB_N','');
INSERT INTO "tech_annual" VALUES ('TRA_ROA_HTR_DST_N','');
INSERT INTO "tech_annual" VALUES ('TRA_ROA_HTR_ELC_N','');
INSERT INTO "tech_annual" VALUES ('TRA_ROA_HTR_FCELL_N','');
INSERT INTO "tech_annual" VALUES ('TRA_ROA_HTR_GSL_N','');
INSERT INTO "tech_annual" VALUES ('TRA_ROA_HTR_HYBD_N','');
INSERT INTO "tech_annual" VALUES ('TRA_ROA_HTR_LPG_N','');
INSERT INTO "tech_annual" VALUES ('TRA_ROA_HTR_NGA_N','');
INSERT INTO "tech_annual" VALUES ('TRA_ROA_LCV_DST_N','');
INSERT INTO "tech_annual" VALUES ('TRA_ROA_LCV_ELC_N','');
INSERT INTO "tech_annual" VALUES ('TRA_ROA_LCV_FCELL_N','');
INSERT INTO "tech_annual" VALUES ('TRA_ROA_LCV_GSL_N','');
INSERT INTO "tech_annual" VALUES ('TRA_ROA_LCV_HYBD_N','');
INSERT INTO "tech_annual" VALUES ('TRA_ROA_LCV_LPG_N','');
INSERT INTO "tech_annual" VALUES ('TRA_ROA_LCV_NGA_N','');
INSERT INTO "tech_annual" VALUES ('TRA_ROA_LCV_PIHYB_N','');
INSERT INTO "tech_annual" VALUES ('TRA_ROA_MTR_DST_N','');
INSERT INTO "tech_annual" VALUES ('TRA_ROA_MTR_ELC_N','');
INSERT INTO "tech_annual" VALUES ('TRA_ROA_MTR_FCELL_N','');
INSERT INTO "tech_annual" VALUES ('TRA_ROA_MTR_GSL_N','');
INSERT INTO "tech_annual" VALUES ('TRA_ROA_MTR_HYBD_N','');
INSERT INTO "tech_annual" VALUES ('TRA_ROA_MTR_LPG_N','');
INSERT INTO "tech_annual" VALUES ('TRA_ROA_MTR_NGA_N','');
-- Residential sector
-- Base year technologies
INSERT INTO "tech_annual" VALUES ('RES_SH_BUR_NGA_LC_E','');
INSERT INTO "tech_annual" VALUES ('RES_SH_AHP_NGA_LC_E','');
INSERT INTO "tech_annual" VALUES ('RES_SH_BUR_DST_LC_E','');
INSERT INTO "tech_annual" VALUES ('RES_SH_BUR_HFO_LC_E','');
INSERT INTO "tech_annual" VALUES ('RES_SH_BUR_LPG_LC_E','');
INSERT INTO "tech_annual" VALUES ('RES_SH_HT_ELC_LC_E','');
INSERT INTO "tech_annual" VALUES ('RES_SH_HP_ELC_LC_E','');
INSERT INTO "tech_annual" VALUES ('RES_SH_HEX_HET_LC_E','');
INSERT INTO "tech_annual" VALUES ('RES_SH_WST_BIO_LC_E','');
INSERT INTO "tech_annual" VALUES ('RES_SH_BUR_NGA_MC_E','');
INSERT INTO "tech_annual" VALUES ('RES_SH_AHP_NGA_MC_E','');
INSERT INTO "tech_annual" VALUES ('RES_SH_BUR_DST_MC_E','');
INSERT INTO "tech_annual" VALUES ('RES_SH_BUR_HFO_MC_E','');
INSERT INTO "tech_annual" VALUES ('RES_SH_BUR_LPG_MC_E','');
INSERT INTO "tech_annual" VALUES ('RES_SH_HT_ELC_MC_E','');
INSERT INTO "tech_annual" VALUES ('RES_SH_HP_ELC_MC_E','');
INSERT INTO "tech_annual" VALUES ('RES_SH_HEX_HET_MC_E','');
INSERT INTO "tech_annual" VALUES ('RES_SH_WST_BIO_MC_E','');
INSERT INTO "tech_annual" VALUES ('RES_SH_BUR_NGA_HC_E','');
INSERT INTO "tech_annual" VALUES ('RES_SH_AHP_NGA_HC_E','');
INSERT INTO "tech_annual" VALUES ('RES_SH_BUR_DST_HC_E','');
INSERT INTO "tech_annual" VALUES ('RES_SH_BUR_HFO_HC_E','');
INSERT INTO "tech_annual" VALUES ('RES_SH_BUR_LPG_HC_E','');
INSERT INTO "tech_annual" VALUES ('RES_SH_HT_ELC_HC_E','');
INSERT INTO "tech_annual" VALUES ('RES_SH_HP_ELC_HC_E','');
INSERT INTO "tech_annual" VALUES ('RES_SH_HEX_HET_HC_E','');
INSERT INTO "tech_annual" VALUES ('RES_SH_WST_BIO_HC_E','');
INSERT INTO "tech_annual" VALUES ('RES_SC_CEN_E','');
INSERT INTO "tech_annual" VALUES ('RES_SC_EHP_E','');
INSERT INTO "tech_annual" VALUES ('RES_SC_ROOM_E','');
INSERT INTO "tech_annual" VALUES ('RES_WH_NGA_E','');
INSERT INTO "tech_annual" VALUES ('RES_WH_DST_E','');
INSERT INTO "tech_annual" VALUES ('RES_WH_HFO_E','');
INSERT INTO "tech_annual" VALUES ('RES_WH_LPG_E','');
INSERT INTO "tech_annual" VALUES ('RES_WH_ELC_E','');
INSERT INTO "tech_annual" VALUES ('RES_WH_HET_E','');
INSERT INTO "tech_annual" VALUES ('RES_WH_BIO_E','');
INSERT INTO "tech_annual" VALUES ('RES_RF_RFG_ELC_E','');
INSERT INTO "tech_annual" VALUES ('RES_RF_FRZ_ELC_E','');
INSERT INTO "tech_annual" VALUES ('RES_CW_ELC_E','');
INSERT INTO "tech_annual" VALUES ('RES_CD_ELC_E','');
INSERT INTO "tech_annual" VALUES ('RES_DW_ELC_E','');
INSERT INTO "tech_annual" VALUES ('RES_CK_NGA_E','');
INSERT INTO "tech_annual" VALUES ('RES_CK_LPG_E','');
INSERT INTO "tech_annual" VALUES ('RES_CK_ELC_E','');
INSERT INTO "tech_annual" VALUES ('RES_OE_EQP_E','');
INSERT INTO "tech_annual" VALUES ('RES_LG_LFL_E','');
INSERT INTO "tech_annual" VALUES ('RES_LG_SFL_E','');
INSERT INTO "tech_annual" VALUES ('RES_LG_LHAL_E','');
INSERT INTO "tech_annual" VALUES ('RES_LG_SHAL_IMP_E','');
INSERT INTO "tech_annual" VALUES ('RES_LG_SHAL_E','');
INSERT INTO "tech_annual" VALUES ('RES_LG_MIN_E','');
INSERT INTO "tech_annual" VALUES ('RES_LG_SIN_E','');
-- New technologies
INSERT INTO "tech_annual" VALUES ('RES_RF_CLB_N','');
INSERT INTO "tech_annual" VALUES ('RES_RF_CLA_N','');
INSERT INTO "tech_annual" VALUES ('RES_RF_CLA+_N','');
INSERT INTO "tech_annual" VALUES ('RES_RF_CLA++_N','');
INSERT INTO "tech_annual" VALUES ('RES_RF_RFG_2020_N','');
INSERT INTO "tech_annual" VALUES ('RES_RF_FRZ_CLB_N','');
INSERT INTO "tech_annual" VALUES ('RES_RF_FRZ_CLA_N','');
INSERT INTO "tech_annual" VALUES ('RES_RF_FRZ_CLA++_N','');
INSERT INTO "tech_annual" VALUES ('RES_RF_FRZ_2020_N','');
INSERT INTO "tech_annual" VALUES ('RES_WH_DST_N','');
INSERT INTO "tech_annual" VALUES ('RES_WH_DST_COND_N','');
INSERT INTO "tech_annual" VALUES ('RES_WH_NGA_N','');
INSERT INTO "tech_annual" VALUES ('RES_WH_NGA_COND_N','');
INSERT INTO "tech_annual" VALUES ('RES_WH_LPG_N','');
INSERT INTO "tech_annual" VALUES ('RES_WH_HFO_N','');
INSERT INTO "tech_annual" VALUES ('RES_WH_LPG_COND_N','');
INSERT INTO "tech_annual" VALUES ('RES_WH_WPL_BIO_N','');
INSERT INTO "tech_annual" VALUES ('RES_WH_ELC_RES_N','');
INSERT INTO "tech_annual" VALUES ('RES_WH_AHP_ELC_N','');
INSERT INTO "tech_annual" VALUES ('RES_WH_HNS_ELC_N','');
INSERT INTO "tech_annual" VALUES ('RES_WH_SOL_N','');
INSERT INTO "tech_annual" VALUES ('RES_CW_ELC_N','');
INSERT INTO "tech_annual" VALUES ('RES_CW_ELC_IMP_N','');
INSERT INTO "tech_annual" VALUES ('RES_CW_ELC_ADV_N','');
INSERT INTO "tech_annual" VALUES ('RES_CW_2020_ELC_N','');
INSERT INTO "tech_annual" VALUES ('RES_CD_ELC_N','');
INSERT INTO "tech_annual" VALUES ('RES_CD_ELC_ADV_N','');
INSERT INTO "tech_annual" VALUES ('RES_CD_ELC_NEW_N','');
INSERT INTO "tech_annual" VALUES ('RES_DW_ELC_STD_N','');
INSERT INTO "tech_annual" VALUES ('RES_DW_ELC_IMP_N','');
INSERT INTO "tech_annual" VALUES ('RES_DW_ELC_ADV_N','');
INSERT INTO "tech_annual" VALUES ('RES_DW_2020_ELC_N','');
INSERT INTO "tech_annual" VALUES ('RES_CK_NGA_N','');
INSERT INTO "tech_annual" VALUES ('RES_CK_LPG_N','');
INSERT INTO "tech_annual" VALUES ('RES_CK_ELC_N','');
INSERT INTO "tech_annual" VALUES ('RES_CK_BIO_N','');
INSERT INTO "tech_annual" VALUES ('RES_LG_BFL_IMP_N','');
INSERT INTO "tech_annual" VALUES ('RES_LG_SFL_IMP_N','');
INSERT INTO "tech_annual" VALUES ('RES_LG_EFL_N','');
INSERT INTO "tech_annual" VALUES ('RES_LG_LFL_N','');
INSERT INTO "tech_annual" VALUES ('RES_LG_SFL_N','');
INSERT INTO "tech_annual" VALUES ('RES_LG_LHAL_N','');
INSERT INTO "tech_annual" VALUES ('RES_LG_SHAL_IMP_N','');
INSERT INTO "tech_annual" VALUES ('RES_LG_SHAL_N','');
INSERT INTO "tech_annual" VALUES ('RES_LG_MIN_N','');
INSERT INTO "tech_annual" VALUES ('RES_LG_SIN_N','');
INSERT INTO "tech_annual" VALUES ('RES_LG_LED_ELC_N','');
INSERT INTO "tech_annual" VALUES ('RES_SH_HP_HET_HC_N','');
INSERT INTO "tech_annual" VALUES ('RES_SH_HPTS_HC_N','');
INSERT INTO "tech_annual" VALUES ('RES_SH_DST_HC_N','');
INSERT INTO "tech_annual" VALUES ('RES_SH_DST_COND_MC_N','');
INSERT INTO "tech_annual" VALUES ('RES_SH_NGA_COND_MC_N','');
INSERT INTO "tech_annual" VALUES ('RES_SH_LPG_COND_MC_N','');
INSERT INTO "tech_annual" VALUES ('RES_SH_WST_BIO_MC_N','');
INSERT INTO "tech_annual" VALUES ('RES_SH_HP_HET_MC_N','');
INSERT INTO "tech_annual" VALUES ('RES_SH_DST_LC_N','');
INSERT INTO "tech_annual" VALUES ('RES_SH_DST_COND_LC_N','');
INSERT INTO "tech_annual" VALUES ('RES_SH_NGA_LC_N','');
INSERT INTO "tech_annual" VALUES ('RES_SH_NGA_COND_LC_N','');
INSERT INTO "tech_annual" VALUES ('RES_SH_LPG_LC_N','');
INSERT INTO "tech_annual" VALUES ('RES_SH_WST_BIO_LC_N','');
INSERT INTO "tech_annual" VALUES ('RES_SH_WPL_BIO_LC_N','');
INSERT INTO "tech_annual" VALUES ('RES_SH_AHP_ELC_LC_N','');
INSERT INTO "tech_annual" VALUES ('RES_SH_HNS_ELC_LC_N','');
INSERT INTO "tech_annual" VALUES ('RES_SH_HPP_ELC_LC_N','');
INSERT INTO "tech_annual" VALUES ('RES_SH_HEX_HET_LC_N','');
INSERT INTO "tech_annual" VALUES ('RES_SH_LPG_COND_LC_N','');
INSERT INTO "tech_annual" VALUES ('RES_SC_AHP_ELC_IMP_N','');
INSERT INTO "tech_annual" VALUES ('RES_SC_AHP_ELC_STD_N','');
INSERT INTO "tech_annual" VALUES ('RES_SC_HP_N','');
INSERT INTO "tech_annual" VALUES ('RES_MISC_EQP_N','');
-- Commercial sector
-- Base year technologies
INSERT INTO "tech_annual" VALUES ('COM_SH_HT_NGA_E','');
INSERT INTO "tech_annual" VALUES ('COM_SH_HP_NGA_E','');
INSERT INTO "tech_annual" VALUES ('COM_SH_HT_DST_E','');
INSERT INTO "tech_annual" VALUES ('COM_SH_HT_LPG_E','');
INSERT INTO "tech_annual" VALUES ('COM_SH_RES_ELC_E','');
INSERT INTO "tech_annual" VALUES ('COM_SH_HP_ELC_E','');
INSERT INTO "tech_annual" VALUES ('COM_SH_HEX_HET_E','');
INSERT INTO "tech_annual" VALUES ('COM_SC_ABS_NGA_E','');
INSERT INTO "tech_annual" VALUES ('COM_SC_CHL_DST_E','');
INSERT INTO "tech_annual" VALUES ('COM_SC_CCL_ELC_CNT_E','');
INSERT INTO "tech_annual" VALUES ('COM_SC_AHP_ELC_E','');
INSERT INTO "tech_annual" VALUES ('COM_SC_ROOM_ELC_E','');
INSERT INTO "tech_annual" VALUES ('COM_SC_ROOF_ELC_E','');
INSERT INTO "tech_annual" VALUES ('COM_WH_NGA_E','');
INSERT INTO "tech_annual" VALUES ('COM_WH_DST_E','');
INSERT INTO "tech_annual" VALUES ('COM_WH_LPG_E','');
INSERT INTO "tech_annual" VALUES ('COM_WH_ELC_E','');
INSERT INTO "tech_annual" VALUES ('COM_LG_INC_E','');
INSERT INTO "tech_annual" VALUES ('COM_LG_SHAL_E','');
INSERT INTO "tech_annual" VALUES ('COM_LG_IRCHAL_E','');
INSERT INTO "tech_annual" VALUES ('COM_LG_SFL_E','');
INSERT INTO "tech_annual" VALUES ('COM_LG_LFL_E','');
INSERT INTO "tech_annual" VALUES ('COM_LG_CFL_C_E','');
INSERT INTO "tech_annual" VALUES ('COM_LG_MER_E','');
INSERT INTO "tech_annual" VALUES ('COM_LG_SOD_E','');
INSERT INTO "tech_annual" VALUES ('COM_CK_NGA_E','');
INSERT INTO "tech_annual" VALUES ('COM_CK_LPG_E','');
INSERT INTO "tech_annual" VALUES ('COM_CK_ELC_E','');
INSERT INTO "tech_annual" VALUES ('COM_RF_RFR_ELC_E','');
INSERT INTO "tech_annual" VALUES ('COM_OE_OFF_ELC_E','');
-- New technologies
INSERT INTO "tech_annual" VALUES ('COM_LG_INC_N','');
INSERT INTO "tech_annual" VALUES ('COM_LG_SHAL_STD_N','');
INSERT INTO "tech_annual" VALUES ('COM_LG_HAL_IMP_N','');
INSERT INTO "tech_annual" VALUES ('COM_LG_SFL_N','');
INSERT INTO "tech_annual" VALUES ('COM_LG_LFL_N','');
INSERT INTO "tech_annual" VALUES ('COM_LG_CFL_N','');
INSERT INTO "tech_annual" VALUES ('COM_LG_MER_N','');
INSERT INTO "tech_annual" VALUES ('COM_LG_SOD_N','');
INSERT INTO "tech_annual" VALUES ('COM_WH_WPEL_BIO_N','');
INSERT INTO "tech_annual" VALUES ('COM_WH_ELC_N','');
INSERT INTO "tech_annual" VALUES ('COM_WH_AHP_ELC_N','');
INSERT INTO "tech_annual" VALUES ('COM_WH_HEX_HET_N','');
INSERT INTO "tech_annual" VALUES ('COM_SH_HEX_HET_N','');
INSERT INTO "tech_annual" VALUES ('COM_SH_HP_AIR_N','');
INSERT INTO "tech_annual" VALUES ('COM_SH_HP_PRB_N','');
INSERT INTO "tech_annual" VALUES ('COM_SH_WPEL_N','');
INSERT INTO "tech_annual" VALUES ('COM_SC_HP_STD_N','');
INSERT INTO "tech_annual" VALUES ('COM_SC_HP_IMP_N','');
INSERT INTO "tech_annual" VALUES ('COM_SC_ROOF_STD_N','');
INSERT INTO "tech_annual" VALUES ('COM_SC_ROOF_ADV_N','');
INSERT INTO "tech_annual" VALUES ('COM_SC_REC_N','');
INSERT INTO "tech_annual" VALUES ('COM_SC_REC_IMP_N','');
INSERT INTO "tech_annual" VALUES ('COM_SC_CNF_N','');
INSERT INTO "tech_annual" VALUES ('COM_SC_CNF_IMP_N','');
INSERT INTO "tech_annual" VALUES ('COM_SC_CNT_N','');
INSERT INTO "tech_annual" VALUES ('COM_SC_ROOM_N','');
INSERT INTO "tech_annual" VALUES ('COM_SC_ABS_NGA_N','');
INSERT INTO "tech_annual" VALUES ('COM_SC_NGA_STD_N','');
INSERT INTO "tech_annual" VALUES ('COM_SC_NGA_IMP_N','');
INSERT INTO "tech_annual" VALUES ('COM_CK_NGA_N','');
INSERT INTO "tech_annual" VALUES ('COM_CK_LPG_N','');
INSERT INTO "tech_annual" VALUES ('COM_CK_ELC_N','');
INSERT INTO "tech_annual" VALUES ('COM_CK_BIO_N','');
INSERT INTO "tech_annual" VALUES ('COM_OE_OFF_ELC_STD_N','');
INSERT INTO "tech_annual" VALUES ('COM_OE_OFF_ELC_IMP_N','');
INSERT INTO "tech_annual" VALUES ('COM_OE_OFF_ADV_N','');
INSERT INTO "tech_annual" VALUES ('COM_RF_STD_N','');
INSERT INTO "tech_annual" VALUES ('COM_RF_IMP_N','');
INSERT INTO "tech_annual" VALUES ('COM_RF_N','');
-- Agriculture sector
-- Fuel technologies
INSERT INTO "tech_annual" VALUES ('AGR_FT_GSL_E','');
INSERT INTO "tech_annual" VALUES ('AGR_FT_LPG_E','');
INSERT INTO "tech_annual" VALUES ('AGR_FT_DST_E','');
INSERT INTO "tech_annual" VALUES ('AGR_FT_NGA_E','');
INSERT INTO "tech_annual" VALUES ('AGR_FT_ELC_E','');
-- Industrial Sector
-- Machine drive and steam
INSERT INTO "tech_annual" VALUES ('IND_MD_TECH','');
INSERT INTO "tech_annual" VALUES ('IND_MD_ELC_E','');
INSERT INTO "tech_annual" VALUES ('IND_STM_TECH','');
INSERT INTO "tech_annual" VALUES ('IND_STM_BIO_E','');
INSERT INTO "tech_annual" VALUES ('IND_STM_COA_E','');
INSERT INTO "tech_annual" VALUES ('IND_STM_DST_E','');
INSERT INTO "tech_annual" VALUES ('IND_STM_HET_E','');
INSERT INTO "tech_annual" VALUES ('IND_STM_HFO_E','');
INSERT INTO "tech_annual" VALUES ('IND_STM_LPG_E','');
INSERT INTO "tech_annual" VALUES ('IND_STM_NGA_E','');
-- Chemicals
INSERT INTO "tech_annual" VALUES ('IND_CH_TECH','');
INSERT INTO "tech_annual" VALUES ('IND_CH_OLF_E','');
INSERT INTO "tech_annual" VALUES ('IND_CH_BTX_E','');
INSERT INTO "tech_annual" VALUES ('IND_CH_AMM_E','');
INSERT INTO "tech_annual" VALUES ('IND_CH_MTH_E','');
INSERT INTO "tech_annual" VALUES ('IND_CH_CHL_E','');
INSERT INTO "tech_annual" VALUES ('IND_CH_OTH_E','');
INSERT INTO "tech_annual" VALUES ('IND_CH_FS_DST_E','');
INSERT INTO "tech_annual" VALUES ('IND_CH_FS_GSL_E','');
INSERT INTO "tech_annual" VALUES ('IND_CH_FS_HFO_E','');
INSERT INTO "tech_annual" VALUES ('IND_CH_FS_KER_E','');
INSERT INTO "tech_annual" VALUES ('IND_CH_FS_LPG_E','');
INSERT INTO "tech_annual" VALUES ('IND_CH_FS_NAP_E','');
INSERT INTO "tech_annual" VALUES ('IND_CH_FS_NGA_E','');
INSERT INTO "tech_annual" VALUES ('IND_CH_FS_NSP_E','');
INSERT INTO "tech_annual" VALUES ('IND_CH_FS_RFG_E','');
INSERT INTO "tech_annual" VALUES ('IND_CH_EC_E','');
INSERT INTO "tech_annual" VALUES ('IND_CH_OTH_COK_E','');
INSERT INTO "tech_annual" VALUES ('IND_CH_OTH_DST_E','');
INSERT INTO "tech_annual" VALUES ('IND_CH_OTH_ELC_E','');
INSERT INTO "tech_annual" VALUES ('IND_CH_OTH_ETH_E','');
INSERT INTO "tech_annual" VALUES ('IND_CH_OTH_HFO_E','');
INSERT INTO "tech_annual" VALUES ('IND_CH_OTH_NGA_E','');
INSERT INTO "tech_annual" VALUES ('IND_CH_OTH_PTC_E','');
-- Iron and steel
INSERT INTO "tech_annual" VALUES ('IND_IS_TECH','');
INSERT INTO "tech_annual" VALUES ('IND_IS_BOF_E','');
INSERT INTO "tech_annual" VALUES ('IND_IS_EAF_E','');
INSERT INTO "tech_annual" VALUES ('IND_IS_FS_PTC_E','');
INSERT INTO "tech_annual" VALUES ('IND_IS_FS_COK_E','');
INSERT INTO "tech_annual" VALUES ('IND_IS_OTH_ELC_E','');
-- Non-ferrous metals
INSERT INTO "tech_annual" VALUES ('IND_NF_TECH','');
INSERT INTO "tech_annual" VALUES ('IND_NF_ALU_E','');
INSERT INTO "tech_annual" VALUES ('IND_NF_COP_E','');
INSERT INTO "tech_annual" VALUES ('IND_NF_ZNC_E','');
INSERT INTO "tech_annual" VALUES ('IND_NF_OTH_E','');
INSERT INTO "tech_annual" VALUES ('IND_NF_EC_E','');
INSERT INTO "tech_annual" VALUES ('IND_NF_OTH_ELC_E','');
INSERT INTO "tech_annual" VALUES ('IND_NF_OTH_DST_E','');
INSERT INTO "tech_annual" VALUES ('IND_NF_OTH_NGA_E','');
INSERT INTO "tech_annual" VALUES ('IND_NF_OTH_LPG_E','');
-- Non-metallic minerals
INSERT INTO "tech_annual" VALUES ('IND_NM_TECH','');
INSERT INTO "tech_annual" VALUES ('IND_NM_CLK_DRY_E','');
INSERT INTO "tech_annual" VALUES ('IND_NM_CLK_WET_E','');
INSERT INTO "tech_annual" VALUES ('IND_NM_CRM_E','');
INSERT INTO "tech_annual" VALUES ('IND_NM_GLS_E','');
INSERT INTO "tech_annual" VALUES ('IND_NM_LIM_E','');
INSERT INTO "tech_annual" VALUES ('IND_NM_OTH_COK_E','');
INSERT INTO "tech_annual" VALUES ('IND_NM_OTH_DST_E','');
INSERT INTO "tech_annual" VALUES ('IND_NM_OTH_ELC_E','');
INSERT INTO "tech_annual" VALUES ('IND_NM_OTH_LPG_E','');
INSERT INTO "tech_annual" VALUES ('IND_NM_OTH_NGA_E','');
-- Pulp and paper
INSERT INTO "tech_annual" VALUES ('IND_PP_TECH','');
INSERT INTO "tech_annual" VALUES ('IND_PP_PUL_TECH','');
INSERT INTO "tech_annual" VALUES ('IND_PP_PAP_E','');
INSERT INTO "tech_annual" VALUES ('IND_PP_PUL_CHEM_E','');
INSERT INTO "tech_annual" VALUES ('IND_PP_PUL_MEC_E','');
INSERT INTO "tech_annual" VALUES ('IND_PP_PUL_REC_E','');
INSERT INTO "tech_annual" VALUES ('IND_PP_PH_DST_E','');
INSERT INTO "tech_annual" VALUES ('IND_PP_PH_ELC_E','');
INSERT INTO "tech_annual" VALUES ('IND_PP_PH_HFO_E','');
INSERT INTO "tech_annual" VALUES ('IND_PP_PH_NGA_E','');
INSERT INTO "tech_annual" VALUES ('IND_PP_OTH_DST_E','');
INSERT INTO "tech_annual" VALUES ('IND_PP_OTH_ELC_E','');
INSERT INTO "tech_annual" VALUES ('IND_PP_OTH_LPG_E','');

-- Other industries
INSERT INTO "tech_annual" VALUES ('IND_OTH_TECH','');
INSERT INTO "tech_annual" VALUES ('IND_OTH_PH_DST_E','');
INSERT INTO "tech_annual" VALUES ('IND_OTH_PH_HFO_E','');
INSERT INTO "tech_annual" VALUES ('IND_OTH_PH_LPG_E','');
INSERT INTO "tech_annual" VALUES ('IND_OTH_PH_NGA_E','');
INSERT INTO "tech_annual" VALUES ('IND_OTH_OTH_ELC_E','');
INSERT INTO "tech_annual" VALUES ('IND_NEU_TECH','');
INSERT INTO "tech_annual" VALUES ('IND_ONS_TECH','');
-- New tech_annual
-- Machine and steam
INSERT INTO "tech_annual" VALUES ('IND_STM_BIO_N','');

INSERT INTO "tech_annual" VALUES ('IND_MD_LPG_N','');
INSERT INTO "tech_annual" VALUES ('IND_MD_NGA_N','');
INSERT INTO "tech_annual" VALUES ('IND_MD_ELC_N','');
INSERT INTO "tech_annual" VALUES ('IND_STM_BFG_N','');
INSERT INTO "tech_annual" VALUES ('IND_STM_DST_N','');
INSERT INTO "tech_annual" VALUES ('IND_STM_ETH_N','');
INSERT INTO "tech_annual" VALUES ('IND_STM_HET_N','');
INSERT INTO "tech_annual" VALUES ('IND_STM_LPG_N','');
INSERT INTO "tech_annual" VALUES ('IND_STM_NGA_N','');
INSERT INTO "tech_annual" VALUES ('IND_STM_PTC_N','');
-- Chemicals
INSERT INTO "tech_annual" VALUES ('IND_CH_HVC_NAPSC_N','');
INSERT INTO "tech_annual" VALUES ('IND_CH_HVC_ETHSC_N','');
INSERT INTO "tech_annual" VALUES ('IND_CH_HVC_GSOSC_N','');
INSERT INTO "tech_annual" VALUES ('IND_CH_HVC_LPGSC_N','');
INSERT INTO "tech_annual" VALUES ('IND_CH_HVC_NCC_N','');
INSERT INTO "tech_annual" VALUES ('IND_CH_HVC_BDH_N','');
INSERT INTO "tech_annual" VALUES ('IND_CH_HVC_N','');
INSERT INTO "tech_annual" VALUES ('IND_CH_OLF_PDH_N','');
INSERT INTO "tech_annual" VALUES ('IND_CH_OLF_MTO_N','');
INSERT INTO "tech_annual" VALUES ('IND_CH_AMM_NGASR_N','');
INSERT INTO "tech_annual" VALUES ('IND_CH_AMM_NAPPOX_N','');
INSERT INTO "tech_annual" VALUES ('IND_CH_AMM_COAGSF_N','');
INSERT INTO "tech_annual" VALUES ('IND_CH_AMM_BIOGSF_N','');
INSERT INTO "tech_annual" VALUES ('IND_CH_AMM_ELCSYS_N','');
INSERT INTO "tech_annual" VALUES ('IND_CH_MTH_NGASR_N','');
INSERT INTO "tech_annual" VALUES ('IND_CH_MTH_COGSR_N','');
INSERT INTO "tech_annual" VALUES ('IND_CH_MTH_LPGSR_N','');
INSERT INTO "tech_annual" VALUES ('IND_CH_MTH_COAGSF_N','');
INSERT INTO "tech_annual" VALUES ('IND_CH_MTH_BIOGSF_N','');
INSERT INTO "tech_annual" VALUES ('IND_CH_MTH_ELCSYS_N','');
INSERT INTO "tech_annual" VALUES ('IND_CH_CHL_MERC_N','');
INSERT INTO "tech_annual" VALUES ('IND_CH_CHL_DIAP_N','');
INSERT INTO "tech_annual" VALUES ('IND_CH_CHL_MEMB_N','');
INSERT INTO "tech_annual" VALUES ('IND_CH_EC_N','');
INSERT INTO "tech_annual" VALUES ('IND_CH_FS_BIO_N','');
INSERT INTO "tech_annual" VALUES ('IND_CH_FS_COA_N','');
INSERT INTO "tech_annual" VALUES ('IND_CH_FS_DST_N','');
INSERT INTO "tech_annual" VALUES ('IND_CH_FS_ETH_N','');
INSERT INTO "tech_annual" VALUES ('IND_CH_FS_LPG_N','');
INSERT INTO "tech_annual" VALUES ('IND_CH_FS_MTH_N','');
INSERT INTO "tech_annual" VALUES ('IND_CH_FS_NAP_N','');
INSERT INTO "tech_annual" VALUES ('IND_CH_FS_NGA_N','');
INSERT INTO "tech_annual" VALUES ('IND_CH_OTH_COK_N','');
INSERT INTO "tech_annual" VALUES ('IND_CH_OTH_DST_N','');
INSERT INTO "tech_annual" VALUES ('IND_CH_OTH_ELC_N','');
INSERT INTO "tech_annual" VALUES ('IND_CH_OTH_ETH_N','');
INSERT INTO "tech_annual" VALUES ('IND_CH_OTH_NGA_N','');
-- Iron and steel
INSERT INTO "tech_annual" VALUES ('IND_IS_BOF_BFBOF_N','');
INSERT INTO "tech_annual" VALUES ('IND_IS_DRI_DRIEAF_N','');
INSERT INTO "tech_annual" VALUES ('IND_IS_DRI_HDREAF_N','');
INSERT INTO "tech_annual" VALUES ('IND_IS_BOF_HISBOF_N','');
INSERT INTO "tech_annual" VALUES ('IND_IS_BOF_ULCOWIN_N','');
INSERT INTO "tech_annual" VALUES ('IND_IS_BOF_ULCOLYSIS_N','');
-- Non-ferrous metals
INSERT INTO "tech_annual" VALUES ('IND_NF_AMN_BAY_N','');
INSERT INTO "tech_annual" VALUES ('IND_NF_ALU_HLH_N','');
INSERT INTO "tech_annual" VALUES ('IND_NF_ALU_SEC_N','');
INSERT INTO "tech_annual" VALUES ('IND_NF_ALU_HLHIA_N','');
INSERT INTO "tech_annual" VALUES ('IND_NF_ALU_CBT_N','');
INSERT INTO "tech_annual" VALUES ('IND_NF_ALU_KAO_N','');
INSERT INTO "tech_annual" VALUES ('IND_NF_COP_N','');
INSERT INTO "tech_annual" VALUES ('IND_NF_ZNC_N','');
INSERT INTO "tech_annual" VALUES ('IND_NF_EC_N','');
INSERT INTO "tech_annual" VALUES ('IND_NF_OTH_ELC_N','');
INSERT INTO "tech_annual" VALUES ('IND_NF_OTH_DST_N','');
INSERT INTO "tech_annual" VALUES ('IND_NF_OTH_NGA_N','');
-- Non-metallic minerals
INSERT INTO "tech_annual" VALUES ('IND_NM_CLK_DRY_N','');
INSERT INTO "tech_annual" VALUES ('IND_NM_CLK_WET_N','');
INSERT INTO "tech_annual" VALUES ('IND_NM_CEM_BLN_N','');
INSERT INTO "tech_annual" VALUES ('IND_NM_CLK_DRYCL_PCCS_N','');
INSERT INTO "tech_annual" VALUES ('IND_NM_CLK_DRYCL_OCCS_N','');
INSERT INTO "tech_annual" VALUES ('IND_NM_CEM_AAC_N','');
INSERT INTO "tech_annual" VALUES ('IND_NM_CEM_BEL_N','');
INSERT INTO "tech_annual" VALUES ('IND_NM_LIM_LRK_N','');
INSERT INTO "tech_annual" VALUES ('IND_NM_GLS_FOSS_N','');
INSERT INTO "tech_annual" VALUES ('IND_NM_GLS_ELEC_N','');
INSERT INTO "tech_annual" VALUES ('IND_NM_CRM_N','');
INSERT INTO "tech_annual" VALUES ('IND_NM_EC_N','');
-- Pulp and paper
INSERT INTO "tech_annual" VALUES ('IND_PP_PUL_KRF_N','');
INSERT INTO "tech_annual" VALUES ('IND_PP_PUL_SUL_N','');
INSERT INTO "tech_annual" VALUES ('IND_PP_PUL_MEC_N','');
INSERT INTO "tech_annual" VALUES ('IND_PP_PUL_SCH_N','');
INSERT INTO "tech_annual" VALUES ('IND_PP_PUL_REC_N','');
INSERT INTO "tech_annual" VALUES ('IND_PP_PAP_N','');
INSERT INTO "tech_annual" VALUES ('IND_PP_PH_HFO_N','');
INSERT INTO "tech_annual" VALUES ('IND_PP_PH_NGA_N','');
-- Other industries
INSERT INTO "tech_annual" VALUES ('IND_OTH_PH_DST_N','');
INSERT INTO "tech_annual" VALUES ('IND_OTH_PH_HFO_N','');
INSERT INTO "tech_annual" VALUES ('IND_OTH_PH_LPG_N','');
INSERT INTO "tech_annual" VALUES ('IND_OTH_PH_NGA_N','');
INSERT INTO "tech_annual" VALUES ('IND_OTH_OTH_ELC_N','');



CREATE TABLE "sector_labels" (
   "sector"   text,
   primary key("sector")
);
INSERT INTO "sector_labels" VALUES('AGR');
INSERT INTO "sector_labels" VALUES('COM');
INSERT INTO "sector_labels" VALUES('RES');
INSERT INTO "sector_labels" VALUES('TRA');
INSERT INTO "sector_labels" VALUES('IND');
INSERT INTO "sector_labels" VALUES('ELC');
INSERT INTO "sector_labels" VALUES('UPS');
INSERT INTO "sector_labels" VALUES('MAT');

CREATE TABLE "regions" (
   "regions"  text,
   "region_note"  text,
   primary key("regions")
);
INSERT INTO "regions" VALUES ('PIE','Piedmont');

CREATE TABLE "commodity_labels" (
   "comm_labels"  text,
   "comm_labels_desc" text,
   primary key("comm_labels")
);
INSERT INTO "commodity_labels" VALUES ('p','physical commodity');
INSERT INTO "commodity_labels" VALUES ('e','emissions commodity');
INSERT INTO "commodity_labels" VALUES ('d','service demand commodity');
INSERT INTO "commodity_labels" VALUES ('m','material commodity');


CREATE TABLE "commodities" (
   "comm_name"    text,
   "flag" text,
   "comm_desc"    text,
   primary key("comm_name"),
   foreign key("flag") references "commodity_labels"("comm_labels")
);
-- Transport sector
INSERT INTO "commodities" VALUES('TRA_AVI','d','Aviation [PJ]');
INSERT INTO "commodities" VALUES('TRA_ROA_BUS','d','Buses [Bvkm]');
INSERT INTO "commodities" VALUES('TRA_ROA_LCV','d','Light commercial vehicles [Bvkm]');
INSERT INTO "commodities" VALUES('TRA_OTH','d','Others [PJ]');
INSERT INTO "commodities" VALUES('TRA_ROA_HTR','d','Heavy trucks [Bvkm]');
INSERT INTO "commodities" VALUES('TRA_ROA_MTR','d','Medium trucks [Bvkm]');
INSERT INTO "commodities" VALUES('TRA_ROA_CAR','d','Cars [Bvkm]');
INSERT INTO "commodities" VALUES('TRA_ROA_2WH','d','Two-Wheelers [Bvkm]');
INSERT INTO "commodities" VALUES('TRA_RAIL','d','Rail [PJ]');
INSERT INTO "commodities" VALUES('TRA_ELC','p','Electricity going to Transport sector');
INSERT INTO "commodities" VALUES('TRA_ELC_ROA','p','Electricity going to ROAD Transport technologies');
INSERT INTO "commodities" VALUES('TRA_ELC_RAIL','p','Electricity going to RAIL Transport technologies');
INSERT INTO "commodities" VALUES('TRA_ELC_OTH','p','Electricity going to OTHER Transport electricity uses');
INSERT INTO "commodities" VALUES('TRA_NGA','p','Natural gas');
INSERT INTO "commodities" VALUES('TRA_DST','p','Diesel blended with Biodiesel');
INSERT INTO "commodities" VALUES('TRA_BIO_DST','p','Bio Diesel');
INSERT INTO "commodities" VALUES('TRA_DSL','p','Diesel ');
INSERT INTO "commodities" VALUES('TRA_GSL','p','Gasoline');
INSERT INTO "commodities" VALUES('TRA_JTK','p','Jet kerosene');
INSERT INTO "commodities" VALUES('TRA_LPG','p','Liquified petroleum gas');
INSERT INTO "commodities" VALUES('TRA_H2G','p','Hydrogen - Gas');
INSERT INTO "commodities" VALUES('TRA_CH4','e','CH4');
INSERT INTO "commodities" VALUES('TRA_CO2','e','CO2');
INSERT INTO "commodities" VALUES('TRA_N2O','e','N2O');

-- Electricity sector commodities
INSERT INTO "commodities" VALUES('ELC_BGS','p','Biogas');
INSERT INTO "commodities" VALUES('ELC_BLQ','p','Bioliquids');
INSERT INTO "commodities" VALUES('ELC_BMU','p','Municipal waste');
INSERT INTO "commodities" VALUES('ELC_HYD','p','Hydroelectric energy');
INSERT INTO "commodities" VALUES('ELC_IMP','p','Electricity (imported)');
INSERT INTO "commodities" VALUES('ELC_NGA','p','Natural gas');
INSERT INTO "commodities" VALUES('ELC_SLB','p',' Solid biomass');
INSERT INTO "commodities" VALUES('ELC_SOL','p','Solar energy');
INSERT INTO "commodities" VALUES('ELC_WIN','p','Wind energy');
INSERT INTO "commodities" VALUES('ELC_CEN','p','Electricity (centralized)');
INSERT INTO "commodities" VALUES('ELC_DST','p','Electricity (distributed)');
INSERT INTO "commodities" VALUES('HET','p','Heat');
-- Grouping commodities
INSERT INTO "commodities" VALUES('ELC_BIO','p','Electricity (Electricity of all bioenergies)');
-- Emission commodities
INSERT INTO "commodities" VALUES('ELC_CH4','e','CH4');
INSERT INTO "commodities" VALUES('ELC_CO2','e','CO2');
INSERT INTO "commodities" VALUES('ELC_N2O','e','N2O');
INSERT INTO "commodities" VALUES('ELC_CO2_PRC','e','Process CO2');
INSERT INTO "commodities" VALUES('ELC_CH4_PRC','e','Process CH4');
-- Upstream sector commodities
INSERT INTO "commodities" VALUES('ethos','p','Dummy input commodity for primary energy technologies');
INSERT INTO "commodities" VALUES('SOL','p','Solar energy');
INSERT INTO "commodities" VALUES('GAS_NGA','p','Natural gas (imported and extracted)');
INSERT INTO "commodities" VALUES('HYD','p','Hydroelectric energy');
INSERT INTO "commodities" VALUES('WIN','p','Wind energy');
INSERT INTO "commodities" VALUES('BIO_BMU','p','Municipal wastes');
INSERT INTO "commodities" VALUES('BIO_SLB','p','Solid biomass');
INSERT INTO "commodities" VALUES('BIO_GAS','p','Biogas');
INSERT INTO "commodities" VALUES('BIO_DST','p','Bioliquids (Biodiesel)');
INSERT INTO "commodities" VALUES('OIL_LPG','p','Liquid petroleum gas');
INSERT INTO "commodities" VALUES('OIL_DST','p','Diesel');
INSERT INTO "commodities" VALUES('OIL_GSL','p','Gasoline');
INSERT INTO "commodities" VALUES('OIL_HFO','p','Heavy fuel oil');
INSERT INTO "commodities" VALUES('OIL_NSP','p','Non specified oil');
INSERT INTO "commodities" VALUES('OIL_PTC','p','Petroleum coke');
INSERT INTO "commodities" VALUES('OIL_JTK','p','Jet kerosene');
INSERT INTO "commodities" VALUES('OIL_FEE','p','Refinery feeDSTock');
INSERT INTO "commodities" VALUES('OIL_CRD','p','All crude petroleum extractions');
INSERT INTO "commodities" VALUES('GAS_NGA_PRI','p','Natural gas (all primary regional extraction)');
INSERT INTO "commodities" VALUES('OIL_CRD_RES','p','Regional petrolium from located reserves');
INSERT INTO "commodities" VALUES('OIL_CRD_GRO','p','Regional petrolium from Reserves growth');
INSERT INTO "commodities" VALUES('OIL_CRD_DSC','p','Regional petrolium from new discoveries');
INSERT INTO "commodities" VALUES('GAS_NGA_RES','p','Regional natural gas from located reserves');
INSERT INTO "commodities" VALUES('GAS_NGA_GRO','p','Regional natural gas from Reserves growth');
INSERT INTO "commodities" VALUES('GAS_NGA_DSC','p','Regional natural gas from new discoveries');
-- Imported commodities
INSERT INTO "commodities" VALUES('IMP_OIL_NSP','p','Non specified oil - Imported');
INSERT INTO "commodities" VALUES('IMP_COA_OVC','p','Imported oven coke');
INSERT INTO "commodities" VALUES('IMP_COA_HCO','p','Imported hard coal');
INSERT INTO "commodities" VALUES('OIL_CRD_IMP','p','Imported crude oil');
INSERT INTO "commodities" VALUES('GAS_NGA_IMP','p','Imported natural gas');
INSERT INTO "commodities" VALUES('UPS_BIO_DMY','p','Municipal wastes');
-- Emission commodities
INSERT INTO "commodities" VALUES('UPS_CO2','e','Upstream - CO2 emission');
INSERT INTO "commodities" VALUES('UPS_CO2_PRC','e','Upstream - Process CO2 emission');
INSERT INTO "commodities" VALUES('UPS_CH4','e','Upstream - CH4 emission');
INSERT INTO "commodities" VALUES('UPS_N2O','e','Upstream - N2O emission');
INSERT INTO "commodities" VALUES('TOT_CH4','e','Total CH4 emission');
INSERT INTO "commodities" VALUES('TOT_CO2','e','Total CO2 emission');
INSERT INTO "commodities" VALUES('TOT_N2O','e','Total N2O emission');
INSERT INTO "commodities" VALUES('GWP_100','e','Global warming potential - 100 years');
-- Residential sector commodities
INSERT INTO "commodities" VALUES('RES_CD','d','Clothes drying');
INSERT INTO "commodities" VALUES('RES_CK','d','Cooking');
INSERT INTO "commodities" VALUES('RES_CW','d','Clothes washing');
INSERT INTO "commodities" VALUES('RES_DW','d','Dish washing');
INSERT INTO "commodities" VALUES('RES_LG','d','Lighting');
INSERT INTO "commodities" VALUES('RES_OE','d','Other electric');
INSERT INTO "commodities" VALUES('RES_RF','d','Refrigeration');
INSERT INTO "commodities" VALUES('RES_SC','d','Space cooling');
INSERT INTO "commodities" VALUES('RES_SH_LC','d','Space heating - Low Consuming');
INSERT INTO "commodities" VALUES('RES_SH_MC','d','Space heating - Medium Consuming');
INSERT INTO "commodities" VALUES('RES_SH_HC','d','Space heating - High Consuming');
INSERT INTO "commodities" VALUES('RES_WH','d','Water heating');
INSERT INTO "commodities" VALUES('RES_ELC','p','Electricity');
INSERT INTO "commodities" VALUES('RES_NGA','p','Natural gas');
INSERT INTO "commodities" VALUES('RES_DST','p','Diesel');
INSERT INTO "commodities" VALUES('RES_HFO','p','Heavy fuel oil');
INSERT INTO "commodities" VALUES('RES_LPG','p','LPG');
INSERT INTO "commodities" VALUES('RES_BIO','p','Biomass');
INSERT INTO "commodities" VALUES('RES_SOL','p','Solar energy');
INSERT INTO "commodities" VALUES('RES_HET','p','Heat');
INSERT INTO "commodities" VALUES('RES_PH_LC','p','Heating from heat pump - Low Consuming Buildings');
INSERT INTO "commodities" VALUES('RES_PH_MC','p','Heating from heat pump - Medium Consuming Buildings');
INSERT INTO "commodities" VALUES('RES_PH_HC','p','Heating from heat pump - High Consuming Buildings');
INSERT INTO "commodities" VALUES('RES_PC_LC','p','Cooling from heat pump - Low Consuming Buildings');
INSERT INTO "commodities" VALUES('RES_PC_MC','p','Cooling from heat pump - Medium Consuming Buildings');
INSERT INTO "commodities" VALUES('RES_PC_HC','p','Cooling from heat pump - High Consuming Buildings');
INSERT INTO "commodities" VALUES('RES_CH4','e','CH4');
INSERT INTO "commodities" VALUES('RES_CO2','e','CO2');
INSERT INTO "commodities" VALUES('RES_N2O','e','N2O');
INSERT INTO "commodities" VALUES('RES_PW_HC','p','Hot water from heat pump - High Consuming Buildings');
INSERT INTO "commodities" VALUES('RES_PW_MC','p','Hot water from heat pump - Medium Consuming Buildings');
INSERT INTO "commodities" VALUES('RES_PW_LC','p','Hot water from heat pump - Low Consuming Buildings');
INSERT INTO "commodities" VALUES('RES_INS_HC','p','Insulation - Low Consuming Buildings');
INSERT INTO "commodities" VALUES('RES_INS_MC','p','Insulation - Medium Consuming Buildings');
INSERT INTO "commodities" VALUES('CRT_EFF','p','Energy efficiency certificates');
INSERT INTO "commodities" VALUES('RES_INS_C','p','Insulation - High Consuming Buildings');
-- Commercial sector
INSERT INTO "commodities" VALUES('COM_SC','d','Space cooling [PJ]');
INSERT INTO "commodities" VALUES('COM_CK','d','Cooking [PJ]');
INSERT INTO "commodities" VALUES('COM_SH','d','Space heating [PJ]');
INSERT INTO "commodities" VALUES('COM_WH','d','Water heating [PJ]');
INSERT INTO "commodities" VALUES('COM_LG','d','Lighting [PJ]');
INSERT INTO "commodities" VALUES('COM_OE','d','Other electricity use [PJ]');
INSERT INTO "commodities" VALUES('COM_RF','d','Refrigeration [PJ]');
INSERT INTO "commodities" VALUES('COM_BIO','p','Biomass');
INSERT INTO "commodities" VALUES('COM_DST','p','Diesel');
INSERT INTO "commodities" VALUES('COM_ELC','p','Electricity');
INSERT INTO "commodities" VALUES('COM_HET','p','Heat');
INSERT INTO "commodities" VALUES('COM_LPG','p','Liquified petroleum gas');
INSERT INTO "commodities" VALUES('COM_NGA','p','Natural gas');
INSERT INTO "commodities" VALUES('COM_H2','p','Hydrogen');
INSERT INTO "commodities" VALUES('COM_CH4','e','CH4');
INSERT INTO "commodities" VALUES('COM_CO2','e','CO2');
INSERT INTO "commodities" VALUES('COM_N2O','e','N2O');
-- Agriculture sector
INSERT INTO "commodities" VALUES('AGR_DEM','d','Agriculture demand [PJ]');
INSERT INTO "commodities" VALUES('AGR_ELC','p','Electricity');
INSERT INTO "commodities" VALUES('AGR_NGA','p','Natural gas');
INSERT INTO "commodities" VALUES('AGR_DST','p','Diesel');
INSERT INTO "commodities" VALUES('AGR_GSL','p','Gasoline');
INSERT INTO "commodities" VALUES('AGR_LPG','p','Liquified petroleum gas');
INSERT INTO "commodities" VALUES('AGR_CH4','e','CH4');
INSERT INTO "commodities" VALUES('AGR_CO2','e','CO2');
INSERT INTO "commodities" VALUES('AGR_N2O','e','N2O');

-- Industrial sector
-- Demands
INSERT INTO "commodities" VALUES('IND_CH','d','Chemicals [PJ]');
INSERT INTO "commodities" VALUES('IND_IS','d','Iron and steel [Mt]');
INSERT INTO "commodities" VALUES('IND_PP','d','Pulp and paper [Mt]');
INSERT INTO "commodities" VALUES('IND_NF','d','Non-ferrous metals [Mt]');
INSERT INTO "commodities" VALUES('IND_NM','d','Non-metallic minerals [Mt]');
INSERT INTO "commodities" VALUES('IND_OTH','d','Other industries [PJ]');
INSERT INTO "commodities" VALUES('IND_OTH_NEU','d','Industrial and other non-energy uses [PJ]');
INSERT INTO "commodities" VALUES('IND_OTH_NSP','d','Other non-specified [PJ]');
-- Sector-specific commodities
INSERT INTO "commodities" VALUES('IND_MD','p','Machine drive');
INSERT INTO "commodities" VALUES('IND_SB','p','Steam boiler');
INSERT INTO "commodities" VALUES('IND_BFG','p','Blast furnace gas');
INSERT INTO "commodities" VALUES('IND_BIO','p','Biofuels');
INSERT INTO "commodities" VALUES('IND_COA','p','Coal');
INSERT INTO "commodities" VALUES('IND_COG','p','Coke oven gas');
INSERT INTO "commodities" VALUES('IND_COK','p','Coke oven coke');
INSERT INTO "commodities" VALUES('IND_ELC','p','Electricity');
INSERT INTO "commodities" VALUES('IND_ETH','p','Ethane');
INSERT INTO "commodities" VALUES('IND_HET','p','Heat');
INSERT INTO "commodities" VALUES('IND_HFO','p','Heavy fuel oil');
INSERT INTO "commodities" VALUES('IND_H2','p','Hydrogen');
INSERT INTO "commodities" VALUES('IND_H2E','p','Hydrogen from electrolysis');
INSERT INTO "commodities" VALUES('IND_LPG','p','Liquified petroleum gas');
INSERT INTO "commodities" VALUES('IND_NAP','p','Naphtha');
INSERT INTO "commodities" VALUES('IND_NGA','p','Natural gas');
INSERT INTO "commodities" VALUES('IND_OIL','p','Refined petroleum products');
INSERT INTO "commodities" VALUES('IND_PTC','p','Petroleum coke');
-- Chemicals
INSERT INTO "commodities" VALUES('IND_CH_HVC','p','HVC - Olefins and BTX production');
INSERT INTO "commodities" VALUES('IND_CH_BTX','p','Aromatics');
INSERT INTO "commodities" VALUES('IND_CH_OLF','p','Olefins');
INSERT INTO "commodities" VALUES('IND_CH_AMM','p','Ammonia');
INSERT INTO "commodities" VALUES('IND_CH_MTH','p','Methanol');
INSERT INTO "commodities" VALUES('IND_CH_CHL','p','Chlorine');
INSERT INTO "commodities" VALUES('IND_CH_OTH_PROD','p','Other chemical products');
INSERT INTO "commodities" VALUES('IND_CH_EC','p','Chemical - Electro-chemical process');
INSERT INTO "commodities" VALUES('IND_CH_MD','p','Chemical - Machine drive');
INSERT INTO "commodities" VALUES('IND_CH_FS','p','Chemical - Feedstock');
INSERT INTO "commodities" VALUES('IND_CH_FS_BIO','p','Chemical - Feedstock - Biomass');
INSERT INTO "commodities" VALUES('IND_CH_FS_DST','p','Chemical - Feedstock - Gas oil');
INSERT INTO "commodities" VALUES('IND_CH_FS_ETH','p','Chemical - Feedstock - Ethane');
INSERT INTO "commodities" VALUES('IND_CH_FS_HCO','p','Chemical - Feedstock - Hard coal');
INSERT INTO "commodities" VALUES('IND_CH_FS_LPG','p','Chemical - Feedstock - LPG');
INSERT INTO "commodities" VALUES('IND_CH_FS_MTH','p','Chemical - Feedstock - Methanol');
INSERT INTO "commodities" VALUES('IND_CH_FS_NAP','p','Chemical - Feedstock - Naphtha');
INSERT INTO "commodities" VALUES('IND_CH_FS_NGA','p','Chemical - Feedstock - Natural gas');
INSERT INTO "commodities" VALUES('IND_CH_OTH','p','Chemical - Other energy use');
INSERT INTO "commodities" VALUES('IND_CH_SB','p','Chemical - Steam boiler');
-- Iron and steel
INSERT INTO "commodities" VALUES('IND_IS_BOF','p','BOF steel');
INSERT INTO "commodities" VALUES('IND_IS_EAF','p','EAF steel');
INSERT INTO "commodities" VALUES('MAT_BFS','p','Blast furnace slag');
INSERT INTO "commodities" VALUES('MAT_WOD','p','Wood');
INSERT INTO "commodities" VALUES('MAT_BSW','p','Biomass-based solid waste');
INSERT INTO "commodities" VALUES('IND_IS_FS','p','Iron and steel - Feedstock');
INSERT INTO "commodities" VALUES('IND_IS_MD','p','Iron and steel - Machine drive');
INSERT INTO "commodities" VALUES('IND_IS_OTH','p','Iron and steel - Other energy use');
INSERT INTO "commodities" VALUES('IND_IS_SB','p','Iron and steel - Steam boiler');
-- Non-ferrous metals
INSERT INTO "commodities" VALUES('IND_NF_AMN','p','Alumina');
INSERT INTO "commodities" VALUES('IND_NF_ALU','p','Aluminum');
INSERT INTO "commodities" VALUES('IND_NF_COP','p','Copper');
INSERT INTO "commodities" VALUES('IND_NF_ZNC','p','Zinc');
INSERT INTO "commodities" VALUES('IND_NF_OTH_PROD','p','Other non-ferrous metals');
INSERT INTO "commodities" VALUES('IND_NF_EC','p','Non-ferrous metals - Electro-chemical process');
INSERT INTO "commodities" VALUES('IND_NF_MD','p','Non-ferrous metals - Machine drive');
INSERT INTO "commodities" VALUES('IND_NF_OTH','p','Non-ferrous metals - Other');
INSERT INTO "commodities" VALUES('IND_NF_SB','p','Non-ferrous metals - Steam boiler');
-- Non-metallic minerals
INSERT INTO "commodities" VALUES('IND_NM_CMT','p','Cement');
INSERT INTO "commodities" VALUES('IND_NM_CLK','p','Clinker');
INSERT INTO "commodities" VALUES('IND_NM_LIM','p','Lime');
INSERT INTO "commodities" VALUES('IND_NM_GLS','p','Glass');
INSERT INTO "commodities" VALUES('IND_NM_CRM','p','Ceramics');
INSERT INTO "commodities" VALUES('IND_NM_EC','p','Non-metallic minerals - Electro-chemical process');
INSERT INTO "commodities" VALUES('IND_NM_MD','p','Non-metallic minerals - Machine drive');
INSERT INTO "commodities" VALUES('IND_NM_OTH','p','Non-metallic minerals - Other');
INSERT INTO "commodities" VALUES('IND_NM_SB','p','Non-metallic minerals - Steam boiler');
-- Pulp and paper
INSERT INTO "commodities" VALUES('IND_PP_PUL','p','Pulp for paper and paperboard');
INSERT INTO "commodities" VALUES('IND_PP_PUC','p','Chemical pulp for paper and paperboard');
INSERT INTO "commodities" VALUES('IND_PP_PUM','p','Mechanical pulp for paper and paperboard');
INSERT INTO "commodities" VALUES('IND_PP_PUR','p','Recycled pulp for paper and paperboard');
INSERT INTO "commodities" VALUES('IND_PP_PAP','p','Paper and paperboard');
INSERT INTO "commodities" VALUES('IND_PP_MD','p','Pulp and paper - Machine drive');
INSERT INTO "commodities" VALUES('IND_PP_OTH','p','Pulp and paper - Other energy use');
INSERT INTO "commodities" VALUES('IND_PP_PH','p','Pulp and paper - Process heat');
INSERT INTO "commodities" VALUES('IND_PP_DH','p','Pulp and paper - Direct heat');
INSERT INTO "commodities" VALUES('IND_PP_SB','p','Pulp and paper - Steam boiler');
-- Other industries
INSERT INTO "commodities" VALUES('IND_OTH_MD','p','Other industries - Machine drive');
INSERT INTO "commodities" VALUES('IND_OTH_OTH','p','Other industries - Other');
INSERT INTO "commodities" VALUES('IND_OTH_PH','p','Other industries - Process heat');
INSERT INTO "commodities" VALUES('IND_OTH_SB','p','Other industries - Steam boiler');
-- Emission commodities
INSERT INTO "commodities" VALUES('IND_CH4','e','CH4');
INSERT INTO "commodities" VALUES('IND_CO2','e','CO2');
INSERT INTO "commodities" VALUES('IND_N2O','e','N2O');
INSERT INTO "commodities" VALUES('IND_SOX','e','SOX');
INSERT INTO "commodities" VALUES('IND_CO2_PRC','e','Industry - Process CO2 emission');
-- Input commodities
INSERT INTO "commodities" VALUES('GAS_BFG','p','Blast furnace gas');
INSERT INTO "commodities" VALUES('BIO_BIN','p','Industrial wastes');
INSERT INTO "commodities" VALUES('COA_HCO','p','Hard coal');
INSERT INTO "commodities" VALUES('COA_OVC','p','Coke oven coke');
INSERT INTO "commodities" VALUES('UPS_COG','p','Coke oven gas');
INSERT INTO "commodities" VALUES('GAS_ETH','p','Ethane');
INSERT INTO "commodities" VALUES('MTH_SYN','p','Chemical methanol');
INSERT INTO "commodities" VALUES('OIL_KER','p','Other kerosene');
INSERT INTO "commodities" VALUES('OIL_NAP','p','Naphtha');
INSERT INTO "commodities" VALUES('OIL_RFG','p','Refinery gas');
-- Hydrogen
INSERT INTO "commodities" VALUES('H2_CT','p','Hydrogen, centralized production, tank storage');
INSERT INTO "commodities" VALUES('H2_CU','p','Hydrogen, centralized production, underground storage');
INSERT INTO "commodities" VALUES('H2_DT','p','Hydrogen, decentralized production, tank storage');

-- Dummy - to account for energy-water demand, Temporary
INSERT INTO "commodities" VALUES('DMY_WAT_OUT','d','Demand commodity to model water-energy demand');

CREATE TABLE "commodities_e_moo" (
	"comm_name"	text,
	"notes"		text,
	PRIMARY KEY("comm_name"),
	FOREIGN KEY("comm_name") REFERENCES "commodities"("comm_name")
);
CREATE TABLE "MultiObjectiveSlacked" (
	"objective_name"		text,
	"objective_slack"		real,
	"notes"					text
);
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
CREATE TABLE "TechOutputSplit" (
   "regions"  text,
   "periods"  integer,
   "tech" text,
   "output_comm"  text,
   "to_split" real,
   "to_split_notes"   text,
   primary key("regions","periods","tech","output_comm"),
   foreign key("output_comm") references "commodities"("comm_name"),
   foreign key("periods") references "time_periods"("t_periods"),
   foreign key("tech") references "technologies"("tech")
);

-- Electricity sector
-- Base year technologies
INSERT INTO "TechOutputSplit" VALUES ('PIE',2012,'ELC_CHP_NGA_CC_E','ELC_CEN',0.92,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2012,'ELC_CHP_NGA_CC_E','HET',0.08,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2012,'ELC_CHP_NGA_TURB_E','ELC_CEN',0.52,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2012,'ELC_CHP_NGA_TURB_E','HET',0.48,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2012,'ELC_CHP_NGA_STM_COND_E','ELC_CEN',0.50,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2012,'ELC_CHP_NGA_STM_COND_E','HET',0.50,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2012,'ELC_CHP_BMU_E','ELC_DST',0.80,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2012,'ELC_CHP_BMU_E','HET',0.20,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2012,'ELC_CHP_BIO_E','ELC_DST',0.80,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2012,'ELC_CHP_BIO_E','HET',0.20,'');
---- Planned technologies
INSERT INTO "TechOutputSplit" VALUES ('PIE',2012,'ELC_CHP_NGA_CC_P','ELC_CEN',0.90,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2012,'ELC_CHP_NGA_CC_P','HET',0.10,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2050,'ELC_CHP_NGA_CC_P','ELC_CEN',0.25,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2050,'ELC_CHP_NGA_CC_P','HET',0.75,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2012,'ELC_CHP_NGA_TURB_P','ELC_CEN',0.52,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2012,'ELC_CHP_NGA_TURB_P','HET',0.48,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2050,'ELC_CHP_NGA_TURB_P','ELC_CEN',0.25,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2050,'ELC_CHP_NGA_TURB_P','HET',0.75,'');
---- New technologies
INSERT INTO "TechOutputSplit" VALUES ('PIE',2012,'ELC_CHP_BMU_N','ELC_CEN',0.67,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2012,'ELC_CHP_BMU_N','HET',0.33,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2012,'ELC_CHP_NGA_TURB_N','ELC_CEN',0.42,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2012,'ELC_CHP_NGA_TURB_N','HET',0.58,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2040,'ELC_CHP_NGA_TURB_N','ELC_CEN',0.45,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2040,'ELC_CHP_NGA_TURB_N','HET',0.55,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2012,'ELC_CHP_NGA_CC_N','ELC_CEN',0.62,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2012,'ELC_CHP_NGA_CC_N','HET',0.38,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2040,'ELC_CHP_NGA_CC_N','ELC_CEN',0.71,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2040,'ELC_CHP_NGA_CC_N','HET',0.29,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2012,'ELC_CHP_NGA_CP_N','ELC_CEN',0.20,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2012,'ELC_CHP_NGA_CP_N','HET',0.80,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2012,'ELC_CHP_NGA_TAP_N','ELC_CEN',0.28,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2012,'ELC_CHP_NGA_TAP_N','HET',0.72,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2040,'ELC_CHP_NGA_TAP_N','ELC_CEN',0.30,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2040,'ELC_CHP_NGA_TAP_N','HET',0.70,'');
---- Residential sector
---- New technologies
INSERT INTO "TechOutputSplit" VALUES ('PIE',2012,'RES_SH_HPTS_LC_N','RES_PH_LC',0.50,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2012,'RES_SH_HPTS_LC_N','RES_PC_LC',0.30,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2012,'RES_SH_HPTS_LC_N','RES_PW_LC',0.20,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2012,'RES_SH_HPTS_MC_N','RES_PH_MC',0.50,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2012,'RES_SH_HPTS_MC_N','RES_PC_MC',0.30,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2012,'RES_SH_HPTS_MC_N','RES_PW_MC',0.20,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2012,'RES_SH_HPTS_HC_N','RES_PH_HC',0.50,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2012,'RES_SH_HPTS_HC_N','RES_PC_HC',0.30,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2012,'RES_SH_HPTS_HC_N','RES_PW_HC',0.20,'');
------ Micro-CHP
INSERT INTO "TechOutputSplit" VALUES ('PIE',2012,'RES_CHP_NGA_CI_N','ELC_DST',4.375E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2019,'RES_CHP_NGA_CI_N','ELC_DST',4.545E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2025,'RES_CHP_NGA_CI_N','ELC_DST',4.767E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2035,'RES_CHP_NGA_CI_N','ELC_DST',5.102E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2012,'RES_CHP_NGA_CI_N','RES_HET',5.625E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2019,'RES_CHP_NGA_CI_N','RES_HET',5.455E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2025,'RES_CHP_NGA_CI_N','RES_HET',5.233E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2035,'RES_CHP_NGA_CI_N','RES_HET',4.898E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2012,'RES_CHP_NGA_MICRO_N','ELC_DST',3.500E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2019,'RES_CHP_NGA_MICRO_N','ELC_DST',3.780E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2025,'RES_CHP_NGA_MICRO_N','ELC_DST',4.186E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2035,'RES_CHP_NGA_MICRO_N','ELC_DST',4.783E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2012,'RES_CHP_NGA_MICRO_N','RES_HET',6.500E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2019,'RES_CHP_NGA_MICRO_N','RES_HET',6.220E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2025,'RES_CHP_NGA_MICRO_N','RES_HET',5.814E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2035,'RES_CHP_NGA_MICRO_N','RES_HET',5.217E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2012,'RES_CHP_NGA_CC_N','ELC_DST',0.5,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2012,'RES_CHP_NGA_CC_N','RES_HET',0.5,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2030,'RES_CHP_NGA_STR_N','ELC_DST',0.80,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2030,'RES_CHP_NGA_STR_N','RES_HET',0.20,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2035,'RES_CHP_NGA_STR_N','ELC_DST',0.75,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2035,'RES_CHP_NGA_STR_N','RES_HET',0.25,'');
---- Upstream sector
---- Secondary transformation
INSERT INTO "TechOutputSplit" VALUES ('PIE',2012,'UPS_SEC_REF','OIL_GSL',0.20,'share proposed by Matte');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2012,'UPS_SEC_REF','OIL_DST',0.50,'share proposed by Matte');
---- Commercial sector
---- New technologies
INSERT INTO "TechOutputSplit" VALUES ('PIE',2012,'COM_SH_HP_N','COM_SH',0.50,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2012,'COM_SH_HP_N','COM_WH',0.20,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2012,'COM_SH_HP_N','COM_SC',0.30,'');
---- Micro-CHP
INSERT INTO "TechOutputSplit" VALUES ('PIE',2012,'COM_CHP_NGA_CI_N','ELC_DST',4.375E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2012,'COM_CHP_NGA_CI_N','COM_HET',5.625E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2014,'COM_CHP_NGA_CI_N','ELC_DST',4.545E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2014,'COM_CHP_NGA_CI_N','COM_HET',5.455E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2012,'COM_CHP_NGA_MICRO_N','ELC_DST',3.500E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2012,'COM_CHP_NGA_MICRO_N','COM_HET',6.500E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2014,'COM_CHP_NGA_MICRO_N','ELC_DST',3.780E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2014,'COM_CHP_NGA_MICRO_N','COM_HET',6.220E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2012,'COM_CHP_NGA_CC_N','ELC_DST',5.000E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2012,'COM_CHP_NGA_CC_N','COM_HET',5.000E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2014,'COM_CHP_NGA_CC_N','ELC_DST',5.000E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2014,'COM_CHP_NGA_CC_N','COM_HET',5.000E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2023,'COM_CHP_NGA_CC_N','ELC_DST',5.000E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2023,'COM_CHP_NGA_CC_N','COM_HET',5.000E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2030,'COM_CHP_NGA_CC_N','ELC_DST',5.000E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2030,'COM_CHP_NGA_CC_N','COM_HET',5.000E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2030,'COM_CHP_NGA_SOFC_N','COM_ELC',0.75,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2030,'COM_CHP_NGA_SOFC_N','COM_HET',0.25,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2030,'COM_CHP_HH2_PEMFC_N','COM_ELC',0.52,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2030,'COM_CHP_HH2_PEMFC_N','COM_HET',0.48,'');

-- Industrial sector
-- Pulp and paper
INSERT INTO "TechOutputSplit" VALUES ('PIE',2012,'IND_PP_PUL_MEC_E','IND_PP_SB',0.69,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2012,'IND_PP_PUL_MEC_E','IND_PP_PUM',0.31,'');
-- New technologies
-- Chemicals
INSERT INTO "TechOutputSplit" VALUES ('PIE',2012,'IND_CH_HVC_NAPSC_N','IND_CH_SB',0.58,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2012,'IND_CH_HVC_NAPSC_N','IND_CH_HVC',0.42,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2030,'IND_CH_HVC_NAPSC_N','IND_CH_SB',0.68,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2030,'IND_CH_HVC_NAPSC_N','IND_CH_HVC',0.32,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2012,'IND_CH_HVC_ETHSC_N','IND_CH_SB',0.58,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2012,'IND_CH_HVC_ETHSC_N','IND_CH_HVC',0.42,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2030,'IND_CH_HVC_ETHSC_N','IND_CH_SB',0.75,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2030,'IND_CH_HVC_ETHSC_N','IND_CH_HVC',0.25,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2012,'IND_CH_HVC_GSOSC_N','IND_CH_SB',0.58,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2012,'IND_CH_HVC_GSOSC_N','IND_CH_HVC',0.42,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2012,'IND_CH_HVC_LPGSC_N','IND_CH_SB',0.58,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2012,'IND_CH_HVC_LPGSC_N','IND_CH_HVC',0.42,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2030,'IND_CH_HVC_LPGSC_N','IND_CH_SB',0.74,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2030,'IND_CH_HVC_LPGSC_N','IND_CH_HVC',0.26,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2020,'IND_CH_HVC_NCC_N','IND_CH_SB',0.545,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2020,'IND_CH_HVC_NCC_N','IND_CH_HVC',0.455,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2012,'IND_CH_OLF_MTO_N','IND_CH_OLF',0.48,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2012,'IND_CH_OLF_MTO_N','IND_CH_SB',0.52,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2012,'IND_CH_AMM_NGASR_N','IND_CH_AMM',0.10,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2012,'IND_CH_AMM_NGASR_N','IND_CH_SB',0.90,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2030,'IND_CH_AMM_NGASR_N','IND_CH_AMM',0.08,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2030,'IND_CH_AMM_NGASR_N','IND_CH_SB',0.92,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2012,'IND_CH_AMM_NAPPOX_N','IND_CH_AMM',0.11,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2012,'IND_CH_AMM_NAPPOX_N','IND_CH_SB',0.89,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2030,'IND_CH_AMM_NAPPOX_N','IND_CH_AMM',0.09,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2030,'IND_CH_AMM_NAPPOX_N','IND_CH_SB',0.91,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2012,'IND_CH_AMM_COAGSF_N','IND_CH_AMM',0.40,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2012,'IND_CH_AMM_COAGSF_N','IND_CH_SB',0.60,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2030,'IND_CH_AMM_COAGSF_N','IND_CH_AMM',0.345,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2030,'IND_CH_AMM_COAGSF_N','IND_CH_SB',0.655,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2025,'IND_CH_AMM_BIOGSF_N','IND_CH_AMM',0.37,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2025,'IND_CH_AMM_BIOGSF_N','IND_CH_SB',0.63,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2012,'IND_CH_MTH_NGASR_N','IND_CH_MTH',0.26,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2012,'IND_CH_MTH_NGASR_N','IND_CH_SB',0.74,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2030,'IND_CH_MTH_NGASR_N','IND_CH_MTH',0.25,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2030,'IND_CH_MTH_NGASR_N','IND_CH_SB',0.75,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2012,'IND_CH_MTH_COGSR_N','IND_CH_MTH',0.15,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2012,'IND_CH_MTH_COGSR_N','IND_CH_SB',0.85,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2012,'IND_CH_MTH_LPGSR_N','IND_CH_MTH',0.26,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2012,'IND_CH_MTH_LPGSR_N','IND_CH_SB',0.74,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2012,'IND_CH_MTH_COAGSF_N','IND_CH_MTH',0.15,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2012,'IND_CH_MTH_COAGSF_N','IND_CH_SB',0.85,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2025,'IND_CH_MTH_BIOGSF_N','IND_CH_MTH',0.145,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2025,'IND_CH_MTH_BIOGSF_N','IND_CH_SB',0.855,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2012,'IND_CH_CHL_MERC_N','IND_CH_CHL',0.70,'No TechOutputSplit for UPS_HGN_BEF_DST to avoid forced H2 consumption');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2030,'IND_CH_CHL_MERC_N','IND_CH_CHL',0.54,'No TechOutputSplit for UPS_HGN_BEF_DST to avoid forced H2 consumption');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2012,'IND_CH_CHL_DIAP_N','IND_CH_CHL',0.70,'No TechOutputSplit for UPS_HGN_BEF_DST to avoid forced H2 consumption');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2030,'IND_CH_CHL_DIAP_N','IND_CH_CHL',0.54,'No TechOutputSplit for UPS_HGN_BEF_DST to avoid forced H2 consumption');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2012,'IND_CH_CHL_MEMB_N','IND_CH_CHL',0.70,'No TechOutputSplit for UPS_HGN_BEF_DST to avoid forced H2 consumption');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2030,'IND_CH_CHL_MEMB_N','IND_CH_CHL',0.54,'No TechOutputSplit for UPS_HGN_BEF_DST to avoid forced H2 consumption');
---- Iron and steel
INSERT INTO "TechOutputSplit" VALUES ('PIE',2012,'IND_IS_BOF_BFBOF_N','GAS_BFG',0.78,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2012,'IND_IS_BOF_BFBOF_N','IND_IS_BOF',0.22,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2012,'IND_IS_DRI_DRIEAF_N','IND_IS_EAF',0.83,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2012,'IND_IS_DRI_DRIEAF_N','IND_SB',0.17,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2030,'IND_IS_DRI_HDREAF_N','IND_IS_EAF',0.83,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2030,'IND_IS_DRI_HDREAF_N','IND_SB',0.17,'');
---- Pulp and paper
INSERT INTO "TechOutputSplit" VALUES ('PIE',2012,'IND_PP_PUL_KRF_N','MAT_BSW',0.77,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2012,'IND_PP_PUL_KRF_N','IND_ELC',0.20,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2012,'IND_PP_PUL_KRF_N','IND_PP_PUC',0.03,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2012,'IND_PP_PUL_SUL_N','MAT_BSW',0.76,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2012,'IND_PP_PUL_SUL_N','IND_ELC',0.18,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2012,'IND_PP_PUL_SUL_N','IND_PP_PUC',0.06,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2012,'IND_PP_PUL_MEC_N','IND_PP_PUM',0.27,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2012,'IND_PP_PUL_MEC_N','IND_PP_SB',0.73,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2030,'IND_PP_PUL_MEC_N','IND_PP_PUM',0.15,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2030,'IND_PP_PUL_MEC_N','IND_PP_SB',0.85,'');
---- Micro-CHP
INSERT INTO "TechOutputSplit" VALUES ('PIE',2012,'IND_CHP_NGA_CI_N','ELC_DST',0.438,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2014,'IND_CHP_NGA_CI_N','ELC_DST',0.455,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2025,'IND_CHP_NGA_CI_N','ELC_DST',0.477,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2030,'IND_CHP_NGA_CI_N','ELC_DST',0.511,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2050,'IND_CHP_NGA_CI_N','ELC_DST',0.518,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2012,'IND_CHP_NGA_TG_N','ELC_DST',0.392,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2014,'IND_CHP_NGA_TG_N','ELC_DST',0.400,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2025,'IND_CHP_NGA_TG_N','ELC_DST',0.414,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2030,'IND_CHP_NGA_TG_N','ELC_DST',0.438,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2012,'IND_CHP_NGA_TV_N','ELC_DST',0.200,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2014,'IND_CHP_NGA_TV_N','ELC_DST',0.211,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2025,'IND_CHP_NGA_TV_N','ELC_DST',0.225,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2030,'IND_CHP_NGA_TV_N','ELC_DST',0.241,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2014,'IND_CHP_BLQ_CI_N','ELC_DST',0.431,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2025,'IND_CHP_BLQ_CI_N','ELC_DST',0.453,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2030,'IND_CHP_BLQ_CI_N','ELC_DST',0.466,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2050,'IND_CHP_BLQ_CI_N','ELC_DST',0.483,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2012,'IND_CHP_NGA_CI_N','IND_HET',0.562,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2014,'IND_CHP_NGA_CI_N','IND_HET',0.545,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2025,'IND_CHP_NGA_CI_N','IND_HET',0.523,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2030,'IND_CHP_NGA_CI_N','IND_HET',0.489,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2050,'IND_CHP_NGA_CI_N','IND_HET',0.482,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2012,'IND_CHP_NGA_TG_N','IND_HET',0.608,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2014,'IND_CHP_NGA_TG_N','IND_HET',0.600,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2025,'IND_CHP_NGA_TG_N','IND_HET',0.586,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2030,'IND_CHP_NGA_TG_N','IND_HET',0.562,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2012,'IND_CHP_NGA_TV_N','IND_HET',0.800,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2014,'IND_CHP_NGA_TV_N','IND_HET',0.789,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2025,'IND_CHP_NGA_TV_N','IND_HET',0.775,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2030,'IND_CHP_NGA_TV_N','IND_HET',0.759,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2014,'IND_CHP_BLQ_CI_N','IND_HET',0.569,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2025,'IND_CHP_BLQ_CI_N','IND_HET',0.547,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2030,'IND_CHP_BLQ_CI_N','IND_HET',0.534,'');
INSERT INTO "TechOutputSplit" VALUES ('PIE',2050,'IND_CHP_BLQ_CI_N','IND_HET',0.517,'');

CREATE TABLE "TechInputSplit" (
   "regions"  text,
   "periods"  integer,
   "input_comm"   text,
   "tech" text,
   "ti_split" real,
   "ti_split_notes"   text,
   primary key("regions","periods","input_comm","tech"),
   foreign key("tech") references "technologies"("tech"),
   foreign key("input_comm") references "commodities"("comm_name"),
   foreign key("periods") references "time_periods"("t_periods")
);
-- Transport sector
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'ELC_CEN','TRA_FT_ELC',0.92,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'ELC_DST','TRA_FT_ELC',0.08,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2050,'ELC_CEN','TRA_FT_ELC',0.50,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2050,'ELC_DST','TRA_FT_ELC',0.50,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'TRA_DSL','TRA_DSL_BLN',0.85,'TEMOA-Italy');
INSERT INTO "TechInputSplit" VALUES ('PIE',2050,'TRA_DSL','TRA_DSL_BLN',0.70,'TEMOA-Italy');

-- Electricity sector
-- Grouping technologies
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'ELC_SLB','ELC_FT_BIO',0.26,'GSE - Rapporto monitoraggio 2012-2019');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'ELC_BMU','ELC_FT_BIO',0.14,'GSE - Rapporto monitoraggio 2012-2019');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'ELC_BGS','ELC_FT_BIO',0.60,'GSE - Rapporto monitoraggio 2012-2019');
INSERT INTO "TechInputSplit" VALUES ('PIE',2015,'ELC_SLB','ELC_FT_BIO',0.30,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2015,'ELC_BMU','ELC_FT_BIO',0.20,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2015,'ELC_BGS','ELC_FT_BIO',0.25,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2015,'ELC_BLQ','ELC_FT_BIO',0.25,'');

-- Residential sector
-- Fuel technologies
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'BIO_SLB','RES_FT_BIO_E',0.98,'GSE rapporto monitoraggio');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'BIO_GAS','RES_FT_BIO_E',0.02,'GSE rapporto monitoraggio');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'ELC_CEN','RES_FT_ELC_E',0.70,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'ELC_DST','RES_FT_ELC_E',0.00,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2019,'ELC_CEN','RES_FT_ELC_E',0.65,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2019,'ELC_DST','RES_FT_ELC_E',0.05,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2050,'ELC_CEN','RES_FT_ELC_E',0.35,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2050,'ELC_DST','RES_FT_ELC_E',0.14,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'ELC_CEN','RES_FT_ELC_N',0.70,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'ELC_DST','RES_FT_ELC_N',0.00,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2019,'ELC_CEN','RES_FT_ELC_N',0.65,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2019,'ELC_DST','RES_FT_ELC_N',0.05,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2050,'ELC_CEN','RES_FT_ELC_N',0.35,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2050,'ELC_DST','RES_FT_ELC_N',0.14,'');
-- New technologies
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'RES_DST','RES_SH_DST_HC_N',0.44,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'RES_DST','RES_SH_DST_COND_HC_N',0.44,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'RES_NGA','RES_SH_NGA_HC_N',0.54,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'RES_NGA','RES_SH_NGA_COND_HC_N',0.54,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'RES_LPG','RES_SH_LPG_HC_N',0.54,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'RES_LPG','RES_SH_LPG_COND_HC_N',0.54,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'RES_BIO','RES_SH_WST_BIO_HC_N',0.54,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'RES_BIO','RES_SH_WPL_BIO_HC_N',0.54,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'RES_ELC','RES_SH_AHP_ELC_HC_N',0.54,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'RES_ELC','RES_SH_HNS_ELC_HC_N',0.54,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'RES_ELC','RES_SH_HPP_ELC_HC_N',0.54,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'RES_HET','RES_SH_HEX_HET_HC_N',0.54,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'RES_DST','RES_SH_DST_MC_N',0.41,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'RES_DST','RES_SH_DST_COND_MC_N',0.41,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'RES_NGA','RES_SH_NGA_MC_N',0.51,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'RES_NGA','RES_SH_NGA_COND_MC_N',0.51,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'RES_LPG','RES_SH_LPG_MC_N',0.51,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'RES_LPG','RES_SH_LPG_COND_MC_N',0.51,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'RES_BIO','RES_SH_WST_BIO_MC_N',0.51,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'RES_BIO','RES_SH_WPL_BIO_MC_N',0.51,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'RES_ELC','RES_SH_AHP_ELC_MC_N',0.51,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'RES_ELC','RES_SH_HNS_ELC_MC_N',0.51,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'RES_ELC','RES_SH_HPP_ELC_MC_N',0.51,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'RES_HET','RES_SH_HEX_HET_MC_N',0.51,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'RES_SOL','RES_SH_SOL_DST_MC_N',0.40,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'RES_SOL','RES_SH_SOL_LPG_MC_N',0.40,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'RES_SOL','RES_SH_SOL_NGA_MC_N',0.40,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'RES_DST','RES_SH_SOL_DST_MC_N',0.50,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'RES_LPG','RES_SH_SOL_LPG_MC_N',0.60,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'RES_NGA','RES_SH_SOL_NGA_MC_N',0.60,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'RES_SOL','RES_SH_SOL_LPG_LC_N',0.40,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'RES_LPG','RES_SH_SOL_LPG_LC_N',0.60,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'RES_ELC','RES_SC_AHP_ELC_STD_N',0.50,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'RES_ELC','RES_SC_AHP_ELC_IMP_N',0.50,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'RES_ELC','RES_SC_CEN_N',0.50,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'RES_ELC','RES_SC_ROOM_N',0.50,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'RES_ELC','RES_SC_AHP_ELC_ADV_N',0.50,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'RES_ELC','RES_SC_ROOM_ELC_NEW_N',0.50,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'RES_NGA','RES_SC_AHP_NGA_ADV_N',0.50,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'RES_NGA','RES_SC_CEN_NGA_N',0.50,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2015,'RES_NGA','RES_SC_AHP_NGA_N',0.50,'');
-- Upstream sector
-- Secondary transformation
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'GAS_NGA','UPS_SEC_REF',0.05,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'OIL_FEE','UPS_SEC_REF',0.90,'');
-- Commercial sector
-- Fuel technologies
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'OIL_DST','COM_FT_DST_E',6.03E-01,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'OIL_HFO','COM_FT_DST_E',3.97E-01,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2021,'OIL_DST','COM_FT_DST_E',5.71E-01,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2021,'OIL_HFO','COM_FT_DST_E',4.29E-01,'');

INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'ELC_CEN','COM_FT_ELC_EN',0.70,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'ELC_DST','COM_FT_ELC_EN',0.00,'');
-- Hydrogen in commercial
INSERT INTO "TechInputSplit" VALUES ('PIE',2030,'H2_CT','COM_H2G_C1',0.93,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2030,'ELC_CEN','COM_H2G_C1',0.06,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2030,'H2_CU','COM_H2G_C2',0.93,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2030,'ELC_CEN','COM_H2G_C2',0.06,'');
-- Agriculture sector
-- Fuel technologies
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'OIL_DST','AGR_FT_DST_E',1.0,'');

-- Industrial sector
-- Chemicals
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_CH_OLF','IND_CH_TECH',0.1419,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_CH_BTX','IND_CH_TECH',0.0386,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_CH_AMM','IND_CH_TECH',0.0308,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_CH_MTH','IND_CH_TECH',0.0024,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_CH_CHL','IND_CH_TECH',0.0103,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_CH_OTH_PROD','IND_CH_TECH',0.7760,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_CH_EC','IND_CH_OLF_E',0.030,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_NGA','IND_CH_OLF_E',0.074,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_LPG','IND_CH_OLF_E',0.005,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_HFO','IND_CH_OLF_E',0.009,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_OIL','IND_CH_OLF_E',0.023,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_ETH','IND_CH_OLF_E',0.014,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_CH_FS','IND_CH_OLF_E',0.200,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_CH_SB','IND_CH_OLF_E',0.144,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_CH_MD','IND_CH_OLF_E',0.501,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_CH_EC','IND_CH_BTX_E',0.008,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_NGA','IND_CH_BTX_E',0.044,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_LPG','IND_CH_BTX_E',0.004,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_HFO','IND_CH_BTX_E',0.023,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_OIL','IND_CH_BTX_E',0.019,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_ETH','IND_CH_BTX_E',0.022,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_CH_FS','IND_CH_BTX_E',0.022,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_CH_SB','IND_CH_BTX_E',0.156,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_CH_MD','IND_CH_BTX_E',0.502,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_CH_EC','IND_CH_AMM_E',0.01,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_NGA','IND_CH_AMM_E',0.47,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_CH_FS','IND_CH_AMM_E',0.21,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_CH_SB','IND_CH_AMM_E',0.29,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_CH_MD','IND_CH_AMM_E',0.01,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_CH_EC','IND_CH_MTH_E',0.01,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_NGA','IND_CH_MTH_E',0.34,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_CH_FS','IND_CH_MTH_E',0.31,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_CH_SB','IND_CH_MTH_E',0.11,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_CH_MD','IND_CH_MTH_E',0.23,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2017,'IND_CH_EC','IND_CH_MTH_E',0.01,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2017,'IND_NGA','IND_CH_MTH_E',0.34,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2017,'IND_CH_FS','IND_CH_MTH_E',0.31,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2017,'IND_CH_SB','IND_CH_MTH_E',0.31,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2017,'IND_CH_MD','IND_CH_MTH_E',0.03,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_CH_EC','IND_CH_CHL_E',0.83,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_CH_SB','IND_CH_CHL_E',0.15,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_CH_MD','IND_CH_CHL_E',0.02,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_CH_EC','IND_CH_OTH_E',0.12,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_CH_FS','IND_CH_OTH_E',0.24,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_CH_SB','IND_CH_OTH_E',0.05,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_CH_MD','IND_CH_OTH_E',0.33,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_CH_OTH','IND_CH_OTH_E',0.26,'');
-- Iron and steel
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_IS_BOF','IND_IS_TECH',0.37,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2015,'IND_IS_BOF','IND_IS_TECH',0.34,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2020,'IND_IS_BOF','IND_IS_TECH',0.18,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_IS_EAF','IND_IS_TECH',0.63,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2015,'IND_IS_EAF','IND_IS_TECH',0.66,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2020,'IND_IS_EAF','IND_IS_TECH',0.82,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_IS_SB','IND_IS_BOF_E',0.0339,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_IS_MD','IND_IS_BOF_E',0.0621,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_IS_OTH','IND_IS_BOF_E',0.0247,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_IS_FS','IND_IS_BOF_E',0.4111,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_NGA','IND_IS_BOF_E',0.3964,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_COA','IND_IS_BOF_E',0.0251,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_BFG','IND_IS_BOF_E',0.0012,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_HFO','IND_IS_BOF_E',0.0194,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_LPG','IND_IS_BOF_E',0.0061,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2015,'IND_IS_SB','IND_IS_BOF_E',0.0224,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2015,'IND_IS_MD','IND_IS_BOF_E',0.0690,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2015,'IND_IS_OTH','IND_IS_BOF_E',0.0431,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2015,'IND_IS_FS','IND_IS_BOF_E',0.3722,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2015,'IND_NGA','IND_IS_BOF_E',0.4180,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2015,'IND_COA','IND_IS_BOF_E',0.0646,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2015,'IND_BFG','IND_IS_BOF_E',0.0011,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2015,'IND_HFO','IND_IS_BOF_E',0.0029,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2015,'IND_LPG','IND_IS_BOF_E',0.0053,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_IS_SB','IND_IS_EAF_E',0.0217,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_IS_MD','IND_IS_EAF_E',0.2539,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_IS_OTH','IND_IS_EAF_E',0.0731,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_IS_FS','IND_IS_EAF_E',0.0769,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_NGA','IND_IS_EAF_E',0.0760,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_COA','IND_IS_EAF_E',0.0300,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_ELC','IND_IS_EAF_E',0.4646,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_OIL','IND_IS_EAF_E',0.0038,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2015,'IND_IS_SB','IND_IS_EAF_E',0.0705,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2015,'IND_IS_MD','IND_IS_EAF_E',0.2498,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2015,'IND_IS_OTH','IND_IS_EAF_E',0.0719,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2015,'IND_IS_FS','IND_IS_EAF_E',0.0680,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2015,'IND_NGA','IND_IS_EAF_E',0.0785,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2015,'IND_COA','IND_IS_EAF_E',0.0983,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2015,'IND_ELC','IND_IS_EAF_E',0.3586,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2015,'IND_OIL','IND_IS_EAF_E',0.0033,'');
-- Non-ferrous metals
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_NF_ALU','IND_NF_TECH',0.4903,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_NF_COP','IND_NF_TECH',0.0923,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_NF_ZNC','IND_NF_TECH',0.0881,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_NF_OTH_PROD','IND_NF_TECH',0.3293,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_HFO','IND_NF_ALU_E',0.0311,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_NGA','IND_NF_ALU_E',0.8618,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_NF_EC','IND_NF_ALU_E',0.1071,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_NF_EC','IND_NF_COP_E',0.5226,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_NGA','IND_NF_COP_E',0.2602,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_COA','IND_NF_COP_E',0.0040,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_COK','IND_NF_COP_E',0.0467,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_HFO','IND_NF_COP_E',0.0209,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_NF_SB','IND_NF_COP_E',0.1456,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_NF_EC','IND_NF_ZNC_E',0.6788,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_NGA','IND_NF_ZNC_E',0.1346,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_HFO','IND_NF_ZNC_E',0.0234,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_NF_SB','IND_NF_ZNC_E',0.0864,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_NF_MD','IND_NF_ZNC_E',0.0768,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_NF_MD','IND_NF_OTH_E',0.09+0.40,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_NF_OTH','IND_NF_OTH_E',0.91-0.40,'');
-- Non-metallic minerals
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_NGA','IND_NM_CLK_DRY_E',0.0023,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_COA','IND_NM_CLK_DRY_E',0.0170,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_HFO','IND_NM_CLK_DRY_E',0.0034,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_BIO','IND_NM_CLK_DRY_E',0.0942,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_ELC','IND_NM_CLK_DRY_E',0.0342,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_LPG','IND_NM_CLK_DRY_E',0.0011,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_NM_SB','IND_NM_CLK_DRY_E',0.0015,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_NM_MD','IND_NM_CLK_DRY_E',0.1214,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_NM_OTH','IND_NM_CLK_DRY_E',0.0087,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_NGA','IND_NM_CLK_WET_E',0.0127,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_COA','IND_NM_CLK_WET_E',0.1056,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_HFO','IND_NM_CLK_WET_E',0.0554,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_PTC','IND_NM_CLK_WET_E',0.6824,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_ELC','IND_NM_CLK_WET_E',0.0247,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_OIL','IND_NM_CLK_WET_E',0.0120,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_LPG','IND_NM_CLK_WET_E',0.0078,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_NM_SB','IND_NM_CLK_WET_E',0.0054,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_NM_MD','IND_NM_CLK_WET_E',0.0877,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_NM_OTH','IND_NM_CLK_WET_E',0.0063,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_NGA','IND_NM_LIM_E',0.1872,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_COA','IND_NM_LIM_E',0.2990,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_HFO','IND_NM_LIM_E',0.0586,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_ELC','IND_NM_LIM_E',0.0111,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_LPG','IND_NM_LIM_E',0.1499,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_NM_SB','IND_NM_LIM_E',0.1136,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_NM_MD','IND_NM_LIM_E',0.0485,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_NM_OTH','IND_NM_LIM_E',0.1321,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_NGA','IND_NM_GLS_E',0.6750,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_HFO','IND_NM_GLS_E',0.0425,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_ELC','IND_NM_GLS_E',0.0181,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_NM_SB','IND_NM_GLS_E',0.0862,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_NM_MD','IND_NM_GLS_E',0.0706,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_NM_OTH','IND_NM_GLS_E',0.1076,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_NGA','IND_NM_CRM_E',0.6734,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_COA','IND_NM_CRM_E',0.0173,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_HFO','IND_NM_CRM_E',0.0159,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_OIL','IND_NM_CRM_E',0.0020,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_ELC','IND_NM_CRM_E',0.0827,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_NM_SB','IND_NM_CRM_E',0.0969,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_NM_MD','IND_NM_CRM_E',0.0881,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_NM_OTH','IND_NM_CRM_E',0.0237,'');

-- Pulp and paper
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_PP_PUC','IND_PP_PUL_TECH',0.025,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_PP_PUM','IND_PP_PUL_TECH',0.057,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2050,'IND_PP_PUC','IND_PP_PUL_TECH',0.020,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2050,'IND_PP_PUM','IND_PP_PUL_TECH',0.045,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_PP_SB','IND_PP_PUL_CHEM_E',0.7406,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_PP_PH','IND_PP_PUL_CHEM_E',0.1144,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_PP_MD','IND_PP_PUL_CHEM_E',0.1450,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_PP_SB','IND_PP_PUL_REC_E',0.1395,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_PP_DH','IND_PP_PUL_REC_E',0.0337,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_PP_MD','IND_PP_PUL_REC_E',0.7905,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_PP_OTH','IND_PP_PUL_REC_E',0.0363,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_PP_SB','IND_PP_PAP_E',0.1566,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_PP_DH','IND_PP_PAP_E',0.0375,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_PP_MD','IND_PP_PAP_E',0.7335,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_PP_OTH','IND_PP_PAP_E',0.0097,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_PP_PUL','IND_PP_PAP_E',0.0627,'');
-- Other industries
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_OTH_SB','IND_OTH_TECH',0.12,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_OTH_PH','IND_OTH_TECH',0.4833,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_OTH_MD','IND_OTH_TECH',0.3167,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_OTH_OTH','IND_OTH_TECH',0.08,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2015,'IND_OTH_SB','IND_OTH_TECH',0.1493,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2015,'IND_OTH_PH','IND_OTH_TECH',0.4693,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2015,'IND_OTH_MD','IND_OTH_TECH',0.3088,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2015,'IND_OTH_OTH','IND_OTH_TECH',0.0715,'');
-- Other non-specified consumption
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_ELC','IND_ONS_TECH',0.559,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_NGA','IND_ONS_TECH',0.232,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_LPG','IND_ONS_TECH',0.008,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_HFO','IND_ONS_TECH',0.007,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_OIL','IND_ONS_TECH',0.011,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_BIO','IND_ONS_TECH',0.019,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_HET','IND_ONS_TECH',0.164,'');
-- Industrial non-energy uses
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'COA_HCO','IND_NEU_TECH',0.04,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'OIL_NSP','IND_NEU_TECH',0.96,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2050,'COA_HCO','IND_NEU_TECH',0.10,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2050,'OIL_NSP','IND_NEU_TECH',0.80,'');
-- New technologies
-- Chemicals
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_NAP','IND_CH_HVC_NAPSC_N',0.139,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_CH_MD','IND_CH_HVC_NAPSC_N',0.003,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_CH_FS_NAP','IND_CH_HVC_NAPSC_N',0.858,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_ETH','IND_CH_HVC_ETHSC_N',0.193,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_CH_MD','IND_CH_HVC_ETHSC_N',0.004,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_CH_FS_ETH','IND_CH_HVC_ETHSC_N',0.803,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_OIL','IND_CH_HVC_GSOSC_N',0.117,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_CH_MD','IND_CH_HVC_GSOSC_N',0.003,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_CH_FS_DST','IND_CH_HVC_GSOSC_N',0.880,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_LPG','IND_CH_HVC_LPGSC_N',0.145,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_CH_MD','IND_CH_HVC_LPGSC_N',0.003,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_CH_FS_LPG','IND_CH_HVC_LPGSC_N',0.852,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2020,'IND_NAP','IND_CH_HVC_NCC_N',0.147,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2020,'IND_CH_MD','IND_CH_HVC_NCC_N',0.004,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2020,'IND_CH_FS_NAP','IND_CH_HVC_NCC_N',0.849,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2020,'IND_BIO','IND_CH_HVC_BDH_N',0.017,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2020,'IND_CH_MD','IND_CH_HVC_BDH_N',0.020,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2020,'IND_CH_SB','IND_CH_HVC_BDH_N',0.479,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2020,'IND_CH_FS_BIO','IND_CH_HVC_BDH_N',0.484,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2015,'IND_LPG','IND_CH_OLF_PDH_N',0.154,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2015,'IND_CH_SB','IND_CH_OLF_PDH_N',0.039,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2015,'IND_CH_MD','IND_CH_OLF_PDH_N',0.001,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2015,'IND_CH_FS_LPG','IND_CH_OLF_PDH_N',0.805,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2030,'IND_LPG','IND_CH_OLF_PDH_N',0.145,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2030,'IND_CH_SB','IND_CH_OLF_PDH_N',0.036,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2030,'IND_CH_MD','IND_CH_OLF_PDH_N',0.001,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2030,'IND_CH_FS_LPG','IND_CH_OLF_PDH_N',0.818,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_NGA','IND_CH_OLF_MTO_N',0.089,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_CH_FS_MTH','IND_CH_OLF_MTO_N',0.907,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_CH_MD','IND_CH_OLF_MTO_N',0.003,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_NGA','IND_CH_AMM_NGASR_N',0.57,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_CH_FS_NGA','IND_CH_AMM_NGASR_N',0.42,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_CH_EC','IND_CH_AMM_NGASR_N',0.01,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2030,'IND_NGA','IND_CH_AMM_NGASR_N',0.44,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2030,'IND_CH_FS_NGA','IND_CH_AMM_NGASR_N',0.55,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2030,'IND_CH_EC','IND_CH_AMM_NGASR_N',0.01,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_NAP','IND_CH_AMM_NAPPOX_N',0.58-0.50,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_CH_FS_NAP','IND_CH_AMM_NAPPOX_N',0.38,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_CH_EC','IND_CH_AMM_NAPPOX_N',0.04+0.50,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2030,'IND_NAP','IND_CH_AMM_NAPPOX_N',0.50-0.48,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2030,'IND_CH_FS_NAP','IND_CH_AMM_NAPPOX_N',0.45,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2030,'IND_CH_EC','IND_CH_AMM_NAPPOX_N',0.05+0.48,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_COA','IND_CH_AMM_COAGSF_N',0.52-0.40,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_CH_FS_HCO','IND_CH_AMM_COAGSF_N',0.40,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_CH_EC','IND_CH_AMM_COAGSF_N',0.08+0.40,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2030,'IND_COA','IND_CH_AMM_COAGSF_N',0.47-0.40,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2030,'IND_CH_FS_HCO','IND_CH_AMM_COAGSF_N',0.44,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2030,'IND_CH_EC','IND_CH_AMM_COAGSF_N',0.09+0.40,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2025,'IND_BIO','IND_CH_AMM_BIOGSF_N',0.45,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2025,'IND_CH_FS_BIO','IND_CH_AMM_BIOGSF_N',0.46,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2025,'IND_CH_EC','IND_CH_AMM_BIOGSF_N',0.09,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2025,'IND_H2E','IND_CH_AMM_ELCSYS_N',0.89,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2025,'IND_CH_MD','IND_CH_AMM_ELCSYS_N',0.11,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2013,'IND_NGA','IND_CH_MTH_NGASR_N',0.41,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2013,'IND_CH_FS_NGA','IND_CH_MTH_NGASR_N',0.58,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2013,'IND_CH_MD','IND_CH_MTH_NGASR_N',0.01,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2020,'IND_NGA','IND_CH_MTH_NGASR_N',0.38,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2020,'IND_CH_FS_NGA','IND_CH_MTH_NGASR_N',0.61,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2020,'IND_CH_MD','IND_CH_MTH_NGASR_N',0.01,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_COG','IND_CH_MTH_COGSR_N',0.51,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_CH_FS_NGA','IND_CH_MTH_COGSR_N',0.42,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_CH_MD','IND_CH_MTH_COGSR_N',0.07,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_LPG','IND_CH_MTH_LPGSR_N',0.39,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_CH_FS_LPG','IND_CH_MTH_LPGSR_N',0.56,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_CH_MD','IND_CH_MTH_LPGSR_N',0.05,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_COA','IND_CH_MTH_COAGSF_N',0.54,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_CH_FS_HCO','IND_CH_MTH_COAGSF_N',0.39,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_CH_MD','IND_CH_MTH_COAGSF_N',0.07,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2025,'IND_BIO','IND_CH_MTH_BIOGSF_N',0.46,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2025,'IND_CH_FS_BIO','IND_CH_MTH_BIOGSF_N',0.46,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2025,'IND_CH_MD','IND_CH_MTH_BIOGSF_N',0.08,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2025,'IND_H2E','IND_CH_MTH_ELCSYS_N',0.94,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2025,'IND_CH_MD','IND_CH_MTH_ELCSYS_N',0.06,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_CH_EC','IND_CH_CHL_MERC_N',0.85,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_CH_SB','IND_CH_CHL_MERC_N',0.09,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_CH_MD','IND_CH_CHL_MERC_N',0.06,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_CH_EC','IND_CH_CHL_DIAP_N',0.81,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_CH_SB','IND_CH_CHL_DIAP_N',0.11,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_CH_MD','IND_CH_CHL_DIAP_N',0.07,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_CH_EC','IND_CH_CHL_MEMB_N',0.80,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_CH_SB','IND_CH_CHL_MEMB_N',0.12,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_CH_MD','IND_CH_CHL_MEMB_N',0.08,'');
-- Iron and steel
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_BFG','IND_IS_BOF_BFBOF_N',0.01,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_IS_FS','IND_IS_BOF_BFBOF_N',0.58,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_IS_MD','IND_IS_BOF_BFBOF_N',0.05,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_COA','IND_IS_BOF_BFBOF_N',0.36,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_ELC','IND_IS_DRI_DRIEAF_N',0.70,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_IS_FS','IND_IS_DRI_DRIEAF_N',0.22,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_NGA','IND_IS_DRI_DRIEAF_N',0.07,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2030,'IND_ELC','IND_IS_DRI_HDREAF_N',0.22,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2030,'IND_H2','IND_IS_DRI_HDREAF_N',0.60,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2030,'IND_NGA','IND_IS_DRI_HDREAF_N',0.05,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2030,'IND_IS_MD','IND_IS_DRI_HDREAF_N',0.13,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2025,'IND_NGA','IND_IS_BOF_HISBOF_N',0.01,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2025,'IND_ELC','IND_IS_BOF_HISBOF_N',0.05,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2025,'IND_COA','IND_IS_BOF_HISBOF_N',0.94,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2030,'IND_COA','IND_IS_BOF_ULCOWIN_N',0.06,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2030,'IND_NGA','IND_IS_BOF_ULCOWIN_N',0.14,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2030,'IND_ELC','IND_IS_BOF_ULCOWIN_N',0.80,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2030,'IND_ELC','IND_IS_BOF_ULCOLYSIS_N',0.92,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2030,'IND_NGA','IND_IS_BOF_ULCOLYSIS_N',0.08,'');
-- Non-ferrous metals
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_COA','IND_NF_AMN_BAY_N',0.58,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_HFO','IND_NF_AMN_BAY_N',0.08,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_NGA','IND_NF_AMN_BAY_N',0.27,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_NF_EC','IND_NF_AMN_BAY_N',0.07,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_NF_AMN','IND_NF_ALU_HLH_N',0.04,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_NGA','IND_NF_ALU_HLH_N',0.05,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_NF_EC','IND_NF_ALU_HLH_N',0.91,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_HFO','IND_NF_ALU_SEC_N',0.03,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_NGA','IND_NF_ALU_SEC_N',0.86,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_NF_EC','IND_NF_ALU_SEC_N',0.11,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2030,'IND_NF_AMN','IND_NF_ALU_HLHIA_N',0.05,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2030,'IND_NGA','IND_NF_ALU_HLHIA_N',0.05,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2030,'IND_NF_EC','IND_NF_ALU_HLHIA_N',0.90,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2050,'IND_NF_AMN','IND_NF_ALU_CBT_N',0.05,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2050,'IND_NGA','IND_NF_ALU_CBT_N',0.05,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2050,'IND_NF_EC','IND_NF_ALU_CBT_N',0.90,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_HFO','IND_NF_COP_N',0.03,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_NGA','IND_NF_COP_N',0.20,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_COA','IND_NF_COP_N',0.02,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_OIL','IND_NF_COP_N',0.08,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_NF_EC','IND_NF_COP_N',0.67,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_NF_EC','IND_NF_ZNC_N',0.76,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_NF_SB','IND_NF_ZNC_N',0.19,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_NF_MD','IND_NF_ZNC_N',0.05,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2015,'IND_NF_EC','IND_NF_ZNC_N',0.76,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2015,'IND_NF_SB','IND_NF_ZNC_N',0.19,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2015,'IND_NF_MD','IND_NF_ZNC_N',0.05,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2030,'IND_NF_EC','IND_NF_ZNC_N',0.77,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2030,'IND_NF_SB','IND_NF_ZNC_N',0.18,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2030,'IND_NF_MD','IND_NF_ZNC_N',0.05,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2040,'IND_NF_EC','IND_NF_ZNC_N',0.77,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2040,'IND_NF_SB','IND_NF_ZNC_N',0.17,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2040,'IND_NF_MD','IND_NF_ZNC_N',0.06,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2050,'IND_NF_EC','IND_NF_ZNC_N',0.79,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2050,'IND_NF_SB','IND_NF_ZNC_N',0.15,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2050,'IND_NF_MD','IND_NF_ZNC_N',0.06,'');
-- Non-metallic minerals
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_COA','IND_NM_CLK_DRY_N',0.62,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_HFO','IND_NM_CLK_DRY_N',0.16,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_NGA','IND_NM_CLK_DRY_N',0.08,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_BIO','IND_NM_CLK_DRY_N',0.05,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_NM_EC','IND_NM_CLK_DRY_N',0.09,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_COA','IND_NM_CLK_WET_N',0.64,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_HFO','IND_NM_CLK_WET_N',0.16,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_NGA','IND_NM_CLK_WET_N',0.08,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_BIO','IND_NM_CLK_WET_N',0.05,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_NM_EC','IND_NM_CLK_WET_N',0.06,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_NM_CLK','IND_NM_CEM_BLN_N',0.66,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'MAT_BFS','IND_NM_CEM_BLN_N',0.34,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2020,'IND_COA','IND_NM_CLK_DRYCL_PCCS_N',0.36,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2020,'IND_HFO','IND_NM_CLK_DRYCL_PCCS_N',0.09,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2020,'IND_NGA','IND_NM_CLK_DRYCL_PCCS_N',0.05,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2020,'IND_BIO','IND_NM_CLK_DRYCL_PCCS_N',0.03,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2020,'IND_NM_SB','IND_NM_CLK_DRYCL_PCCS_N',0.36,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2020,'IND_NM_EC','IND_NM_CLK_DRYCL_PCCS_N',0.05,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2020,'IND_NM_MD','IND_NM_CLK_DRYCL_PCCS_N',0.06,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2030,'IND_COA','IND_NM_CLK_DRYCL_OCCS_N',0.57,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2030,'IND_HFO','IND_NM_CLK_DRYCL_OCCS_N',0.14,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2030,'IND_NGA','IND_NM_CLK_DRYCL_OCCS_N',0.07,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2030,'IND_BIO','IND_NM_CLK_DRYCL_OCCS_N',0.05,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2030,'IND_NM_EC','IND_NM_CLK_DRYCL_OCCS_N',0.17,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2030,'IND_COA','IND_NM_CEM_AAC_N',0.62,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2030,'IND_HFO','IND_NM_CEM_AAC_N',0.16,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2030,'IND_NGA','IND_NM_CEM_AAC_N',0.08,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2030,'IND_BIO','IND_NM_CEM_AAC_N',0.05,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2030,'IND_NM_EC','IND_NM_CEM_AAC_N',0.09,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2030,'IND_COA','IND_NM_CEM_BEL_N',0.61,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2030,'IND_HFO','IND_NM_CEM_BEL_N',0.15,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2030,'IND_NGA','IND_NM_CEM_BEL_N',0.08,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2030,'IND_BIO','IND_NM_CEM_BEL_N',0.05,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2030,'IND_NM_EC','IND_NM_CEM_BEL_N',0.11,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_COA','IND_NM_LIM_LRK_N',0.81,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_HFO','IND_NM_LIM_LRK_N',0.01,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_NGA','IND_NM_LIM_LRK_N',0.03,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_BIO','IND_NM_LIM_LRK_N',0.14,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_NM_EC','IND_NM_LIM_LRK_N',0.01,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_NGA','IND_NM_GLS_FOSS_N',0.32,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_OIL','IND_NM_GLS_FOSS_N',0.63,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_NM_EC','IND_NM_GLS_FOSS_N',0.05,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_NM_EC','IND_NM_GLS_ELEC_N',0.31,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_OIL','IND_NM_GLS_ELEC_N',0.69,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_NGA','IND_NM_CRM_N',0.88,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_NM_EC','IND_NM_CRM_N',0.12,'');
-- Pulp and paper
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_PP_PH','IND_PP_PUL_KRF_N',0.41,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_PP_MD','IND_PP_PUL_KRF_N',0.09,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_PP_SB','IND_PP_PUL_KRF_N',0.42,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'MAT_WOD','IND_PP_PUL_KRF_N',0.08,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2030,'IND_PP_PH','IND_PP_PUL_KRF_N',0.41,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2030,'IND_PP_MD','IND_PP_PUL_KRF_N',0.09,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2030,'IND_PP_SB','IND_PP_PUL_KRF_N',0.41,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2030,'MAT_WOD','IND_PP_PUL_KRF_N',0.09,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_PP_PH','IND_PP_PUL_SUL_N',0.38,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_PP_MD','IND_PP_PUL_SUL_N',0.17,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_PP_SB','IND_PP_PUL_SUL_N',0.35,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'MAT_WOD','IND_PP_PUL_SUL_N',0.10,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_PP_MD','IND_PP_PUL_MEC_N',0.86,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'MAT_WOD','IND_PP_PUL_MEC_N',0.14,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2030,'IND_PP_MD','IND_PP_PUL_MEC_N',0.85,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2030,'MAT_WOD','IND_PP_PUL_MEC_N',0.15,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_PP_MD','IND_PP_PUL_SCH_N',0.31,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_PP_SB','IND_PP_PUL_SCH_N',0.45,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'MAT_WOD','IND_PP_PUL_SCH_N',0.24,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2030,'IND_PP_MD','IND_PP_PUL_SCH_N',0.30,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2030,'IND_PP_SB','IND_PP_PUL_SCH_N',0.44,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2030,'MAT_WOD','IND_PP_PUL_SCH_N',0.26,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_PP_MD','IND_PP_PUL_REC_N',0.38,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_PP_SB','IND_PP_PUL_REC_N',0.62,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_PP_PUL','IND_PP_PAP_N',0.08,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_PP_MD','IND_PP_PAP_N',0.35,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2012,'IND_PP_SB','IND_PP_PAP_N',0.57,'');
-- Hydrogen
INSERT INTO "TechInputSplit" VALUES ('PIE',2020,'GAS_NGA','H2_SMR_CL',0.98,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2020,'ELC_CEN','H2_SMR_CL',0.01,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2020,'GAS_NGA','H2_SMR_CS',0.98,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2020,'ELC_CEN','H2_SMR_CS',0.01,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2025,'GAS_NGA','H2_SMR_DS',0.96,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2025,'ELC_DST','H2_SMR_DS',0.03,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2020,'OIL_HFO','H2_HOPO',0.95,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2020,'ELC_CEN','H2_HOPO',0.04,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2020,'H2_CU','H2_TRA_FT_GC1',0.78,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2020,'ELC_CEN','H2_TRA_FT_GC1',0.20,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2020,'TRA_GSL','H2_TRA_FT_GC1',0.01,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2020,'H2_CT','H2_TRA_FT_GC2',0.78,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2020,'ELC_CEN','H2_TRA_FT_GC2',0.20,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2020,'TRA_GSL','H2_TRA_FT_GC2',0.01,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2020,'H2_CT','H2_TRA_FT_GC3',0.91,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2020,'ELC_CEN','H2_TRA_FT_GC3',0.08,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2020,'H2_CU','H2_TRA_FT_GC4',0.92,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2020,'ELC_CEN','H2_TRA_FT_GC4',0.06,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2020,'TRA_GSL','H2_TRA_FT_GC4',0.01,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2020,'H2_CU','H2_TRA_FT_GC5',0.91,'');
INSERT INTO "TechInputSplit" VALUES ('PIE',2020,'ELC_CEN','H2_TRA_FT_GC5',0.08,'');

CREATE TABLE "StorageDuration" (
   "regions"  text,
   "tech" text,
   "duration" real,
   "duration_notes"   text,
   primary key("regions","tech")
);
CREATE TABLE "SegFrac" (
   "season_name"  text,
   "time_of_day_name" text,
   "segfrac"  real check("segfrac" >= 0 and "segfrac" <= 1),
   "segfrac_notes"    text,
   primary key("season_name","time_of_day_name"),
   foreign key("season_name") references "time_season"("t_season"),
   foreign key("time_of_day_name") references "time_of_day"("t_day")
);

INSERT INTO "SegFrac" VALUES ('winter','night',8.22E-02,'');
INSERT INTO "SegFrac" VALUES ('winter','morning',5.14E-02,'');
INSERT INTO "SegFrac" VALUES ('winter','noon',6.16E-02,'');
INSERT INTO "SegFrac" VALUES ('winter','afternoon',5.14E-02,'');
INSERT INTO "SegFrac" VALUES ('spring','night',8.31E-02,'');
INSERT INTO "SegFrac" VALUES ('spring','morning',5.19E-02,'');
INSERT INTO "SegFrac" VALUES ('spring','noon',6.23E-02,'');
INSERT INTO "SegFrac" VALUES ('spring','afternoon',5.19E-02,'');
INSERT INTO "SegFrac" VALUES ('summer','night',8.40E-02,'');
INSERT INTO "SegFrac" VALUES ('summer','morning',5.25E-02,'');
INSERT INTO "SegFrac" VALUES ('summer','noon',6.30E-02,'');
INSERT INTO "SegFrac" VALUES ('summer','afternoon',5.25E-02,'');
INSERT INTO "SegFrac" VALUES ('fall','night',8.40E-02,'');
INSERT INTO "SegFrac" VALUES ('fall','morning',5.25E-02,'');
INSERT INTO "SegFrac" VALUES ('fall','noon',6.30E-02,'');
INSERT INTO "SegFrac" VALUES ('fall','afternoon',5.25E-02,'');


CREATE TABLE "PlanningReserveMargin" (
   "regions"  text,
   "reserve_margin"   real,
   primary key(regions),
   foreign key("regions") references regions
);

CREATE TABLE "MyopicBaseyear" (
   "year" real,
   "notes"    text
);


CREATE TABLE "tech_groups" (
   "tech" text,
   "notes"    text,
   primary key(tech)
);
-- Transport sector
-- Fuel technologies
INSERT INTO "tech_groups" VALUES ('TRA_FT_NGA_E','');
INSERT INTO "tech_groups" VALUES ('TRA_FT_NGA_N','');
INSERT INTO "tech_groups" VALUES ('TRA_FT_GSL_E','');
INSERT INTO "tech_groups" VALUES ('TRA_FT_GSL_N','');
INSERT INTO "tech_groups" VALUES ('TRA_FT_DST_E','');
INSERT INTO "tech_groups" VALUES ('TRA_FT_DST_N','');
-- Technologies
INSERT INTO "tech_groups" VALUES ('TRA_FT_LPG_E','');
INSERT INTO "tech_groups" VALUES ('TRA_FT_LPG_N','');
INSERT INTO "tech_groups" VALUES ('TRA_RAIL_ELC_EN','');
INSERT INTO "tech_groups" VALUES ('TRA_RAIL_DSL_EN','');
INSERT INTO "tech_groups" VALUES ('TRA_ROA_CAR_DST_E','');
INSERT INTO "tech_groups" VALUES ('TRA_ROA_CAR_GSL_E','');
INSERT INTO "tech_groups" VALUES ('TRA_ROA_CAR_LPG_E','');
INSERT INTO "tech_groups" VALUES ('TRA_ROA_CAR_NGA_E','');
INSERT INTO "tech_groups" VALUES ('TRA_ROA_CAR_DST_N','');
INSERT INTO "tech_groups" VALUES ('TRA_ROA_CAR_ELC_N','');
INSERT INTO "tech_groups" VALUES ('TRA_ROA_CAR_GSL_N','');
INSERT INTO "tech_groups" VALUES ('TRA_ROA_CAR_LPG_N','');
INSERT INTO "tech_groups" VALUES ('TRA_ROA_CAR_NGA_N','');
INSERT INTO "tech_groups" VALUES ('TRA_ROA_CAR_FCELL_N','');
INSERT INTO "tech_groups" VALUES ('TRA_ROA_CAR_HYBG_N','');
INSERT INTO "tech_groups" VALUES ('TRA_ROA_CAR_PIHYB_N','');
INSERT INTO "tech_groups" VALUES ('TRA_ROA_HTR_DST_E','');
INSERT INTO "tech_groups" VALUES ('TRA_ROA_HTR_DST_N','');
INSERT INTO "tech_groups" VALUES ('TRA_ROA_HTR_NGA_N','');
INSERT INTO "tech_groups" VALUES ('TRA_ROA_LCV_NGA_N','');
INSERT INTO "tech_groups" VALUES ('TRA_ROA_MTR_NGA_N','');
INSERT INTO "tech_groups" VALUES ('TRA_ROA_BUS_NGA_N','');
INSERT INTO "tech_groups" VALUES ('TRA_ELC_DIV','');
INSERT INTO "tech_groups" VALUES ('TRA_FT_BIO_DST_E','');
INSERT INTO "tech_groups" VALUES ('TRA_FT_BIO_DST_N','');

INSERT INTO "tech_groups" VALUES ('TRA_FT_JTK_E','');
INSERT INTO "tech_groups" VALUES ('TRA_FT_JTK_N','');
-- Electricity sector
-- Technologies
INSERT INTO "tech_groups" VALUES ('ELC_WIN_E','');
INSERT INTO "tech_groups" VALUES ('ELC_WIN_N','');
INSERT INTO "tech_groups" VALUES ('ELC_CHP_BMU_E','');
INSERT INTO "tech_groups" VALUES ('ELC_CHP_BIO_E','');
INSERT INTO "tech_groups" VALUES ('ELC_BIO_E','');
INSERT INTO "tech_groups" VALUES ('ELC_BGS_E','');
INSERT INTO "tech_groups" VALUES ('ELC_BLQ_N','');
INSERT INTO "tech_groups" VALUES ('ELC_BIO_5C_N','');
INSERT INTO "tech_groups" VALUES ('ELC_BIOGS_AGR_N','');
INSERT INTO "tech_groups" VALUES ('ELC_CHP_BMU_N','');
INSERT INTO "tech_groups" VALUES ('ELC_HYD_FLO_E','');
INSERT INTO "tech_groups" VALUES ('ELC_HYD_RES_E','');
INSERT INTO "tech_groups" VALUES ('ELC_HYD_PUM_E','');
INSERT INTO "tech_groups" VALUES ('ELC_HYD_MICRO_N','');
INSERT INTO "tech_groups" VALUES ('ELC_HYD_MINI_N','');
INSERT INTO "tech_groups" VALUES ('ELC_SOL_E','');
INSERT INTO "tech_groups" VALUES ('ELC_PV_GRO_N','');
INSERT INTO "tech_groups" VALUES ('ELC_PV_ROOF_N','');
INSERT INTO "tech_groups" VALUES ('ELC_NGA_CC_E','');
INSERT INTO "tech_groups" VALUES ('ELC_NGA_STM_REP_E','');
INSERT INTO "tech_groups" VALUES ('ELC_NGA_TURB_E','');
INSERT INTO "tech_groups" VALUES ('ELC_CHP_NGA_CC_E','');
INSERT INTO "tech_groups" VALUES ('ELC_CHP_NGA_TURB_E','');
INSERT INTO "tech_groups" VALUES ('ELC_CHP_NGA_STM_COND_E','');
INSERT INTO "tech_groups" VALUES ('ELC_NGA_CC_P','');
INSERT INTO "tech_groups" VALUES ('ELC_CHP_NGA_CC_P','');
INSERT INTO "tech_groups" VALUES ('ELC_CHP_NGA_TURB_P','');
INSERT INTO "tech_groups" VALUES ('ELC_NGA_TURB_L80MW_N','');
INSERT INTO "tech_groups" VALUES ('ELC_CHP_NGA_TURB_N','');
INSERT INTO "tech_groups" VALUES ('ELC_CHP_NGA_CC_N','');
INSERT INTO "tech_groups" VALUES ('ELC_CHP_NGA_CP_N','');
INSERT INTO "tech_groups" VALUES ('ELC_CHP_NGA_TAP_N','');

-- Residential sector
-- Fuel technologies
INSERT INTO "tech_groups" VALUES ('RES_FT_BIO_E','');
INSERT INTO "tech_groups" VALUES ('RES_FT_BIO_N','');
INSERT INTO "tech_groups" VALUES ('RES_FT_DST_E','');
INSERT INTO "tech_groups" VALUES ('RES_FT_DST_N','');
INSERT INTO "tech_groups" VALUES ('RES_FT_ELC_E','');
INSERT INTO "tech_groups" VALUES ('RES_FT_ELC_N','');
INSERT INTO "tech_groups" VALUES ('RES_FT_HET_E','');
INSERT INTO "tech_groups" VALUES ('RES_FT_HET_N','');
INSERT INTO "tech_groups" VALUES ('RES_FT_HFO_E','');
INSERT INTO "tech_groups" VALUES ('RES_FT_HFO_N','');
INSERT INTO "tech_groups" VALUES ('RES_FT_LPG_E','');
INSERT INTO "tech_groups" VALUES ('RES_FT_LPG_N','');
INSERT INTO "tech_groups" VALUES ('RES_FT_NGA_E','');
INSERT INTO "tech_groups" VALUES ('RES_FT_NGA_N','');
INSERT INTO "tech_groups" VALUES ('RES_FT_SOL_E','');
INSERT INTO "tech_groups" VALUES ('RES_FT_SOL_N','');
-- Technologies
INSERT INTO "tech_groups" VALUES ('RES_SH_BUR_NGA_LC_E','');
INSERT INTO "tech_groups" VALUES ('RES_SH_AHP_NGA_LC_E','');
INSERT INTO "tech_groups" VALUES ('RES_SH_BUR_DST_LC_E','');
INSERT INTO "tech_groups" VALUES ('RES_SH_BUR_HFO_LC_E','');
INSERT INTO "tech_groups" VALUES ('RES_SH_BUR_LPG_LC_E','');
INSERT INTO "tech_groups" VALUES ('RES_SH_HT_ELC_LC_E','');
INSERT INTO "tech_groups" VALUES ('RES_SH_HP_ELC_LC_E','');
INSERT INTO "tech_groups" VALUES ('RES_SH_HEX_HET_LC_E','');
INSERT INTO "tech_groups" VALUES ('RES_SH_AHP_NGA_MC_E','');
INSERT INTO "tech_groups" VALUES ('RES_SH_HP_ELC_MC_E','');
INSERT INTO "tech_groups" VALUES ('RES_SH_HP_ELC_HC_E','');
INSERT INTO "tech_groups" VALUES ('RES_SH_HT_ELC_HC_E','');
INSERT INTO "tech_groups" VALUES ('RES_SH_BUR_NGA_MC_E','');
INSERT INTO "tech_groups" VALUES ('RES_SH_BUR_DST_MC_E','');
INSERT INTO "tech_groups" VALUES ('RES_SH_BUR_HFO_MC_E','');
INSERT INTO "tech_groups" VALUES ('RES_SH_BUR_LPG_MC_E','');
INSERT INTO "tech_groups" VALUES ('RES_SH_HEX_HET_MC_E','');
INSERT INTO "tech_groups" VALUES ('RES_SH_BUR_NGA_HC_E','');
INSERT INTO "tech_groups" VALUES ('RES_SH_AHP_NGA_HC_E','');
INSERT INTO "tech_groups" VALUES ('RES_SH_BUR_DST_HC_E','');
INSERT INTO "tech_groups" VALUES ('RES_SH_BUR_HFO_HC_E','');
INSERT INTO "tech_groups" VALUES ('RES_SH_BUR_LPG_HC_E','');
INSERT INTO "tech_groups" VALUES ('RES_SH_HEX_HET_HC_E','');
INSERT INTO "tech_groups" VALUES ('RES_SH_DST_LC_N','');
INSERT INTO "tech_groups" VALUES ('RES_SH_DST_COND_LC_N','');
INSERT INTO "tech_groups" VALUES ('RES_SH_NGA_LC_N','');
INSERT INTO "tech_groups" VALUES ('RES_SH_NGA_COND_LC_N','');
INSERT INTO "tech_groups" VALUES ('RES_SH_LPG_LC_N','');
INSERT INTO "tech_groups" VALUES ('RES_SH_LPG_COND_LC_N','');
INSERT INTO "tech_groups" VALUES ('RES_SH_WST_BIO_LC_N','');
INSERT INTO "tech_groups" VALUES ('RES_SH_WPL_BIO_LC_N','');
INSERT INTO "tech_groups" VALUES ('RES_SH_AHP_ELC_LC_N','');
INSERT INTO "tech_groups" VALUES ('RES_SH_HNS_ELC_LC_N','');
INSERT INTO "tech_groups" VALUES ('RES_SH_HPP_ELC_LC_N','');
INSERT INTO "tech_groups" VALUES ('RES_SH_HEX_HET_LC_N','');
INSERT INTO "tech_groups" VALUES ('RES_SH_HP_HET_LC_N','');
INSERT INTO "tech_groups" VALUES ('RES_SH_HPTS_LC_N','');
INSERT INTO "tech_groups" VALUES ('RES_SH_SOL_DST_LC_N','');
INSERT INTO "tech_groups" VALUES ('RES_SH_SOL_LPG_LC_N','');
INSERT INTO "tech_groups" VALUES ('RES_SH_SOL_NGA_LC_N','');
INSERT INTO "tech_groups" VALUES ('RES_SH_DST_MC_N','');
INSERT INTO "tech_groups" VALUES ('RES_SH_DST_COND_MC_N','');
INSERT INTO "tech_groups" VALUES ('RES_SH_NGA_MC_N','');
INSERT INTO "tech_groups" VALUES ('RES_SH_NGA_COND_MC_N','');
INSERT INTO "tech_groups" VALUES ('RES_SH_LPG_MC_N','');
INSERT INTO "tech_groups" VALUES ('RES_SH_LPG_COND_MC_N','');
INSERT INTO "tech_groups" VALUES ('RES_SH_WST_BIO_MC_N','');
INSERT INTO "tech_groups" VALUES ('RES_SH_WPL_BIO_MC_N','');
INSERT INTO "tech_groups" VALUES ('RES_SH_AHP_ELC_MC_N','');
INSERT INTO "tech_groups" VALUES ('RES_SH_HNS_ELC_MC_N','');
INSERT INTO "tech_groups" VALUES ('RES_SH_HPP_ELC_MC_N','');
INSERT INTO "tech_groups" VALUES ('RES_SH_HEX_HET_MC_N','');
INSERT INTO "tech_groups" VALUES ('RES_SH_HP_HET_MC_N','');
INSERT INTO "tech_groups" VALUES ('RES_SH_HPTS_MC_N','');
INSERT INTO "tech_groups" VALUES ('RES_SH_SOL_DST_MC_N','');
INSERT INTO "tech_groups" VALUES ('RES_SH_SOL_LPG_MC_N','');
INSERT INTO "tech_groups" VALUES ('RES_SH_SOL_NGA_MC_N','');
INSERT INTO "tech_groups" VALUES ('RES_SH_DST_HC_N','');
INSERT INTO "tech_groups" VALUES ('RES_SH_DST_COND_HC_N','');
INSERT INTO "tech_groups" VALUES ('RES_SH_NGA_HC_N','');
INSERT INTO "tech_groups" VALUES ('RES_SH_NGA_COND_HC_N','');
INSERT INTO "tech_groups" VALUES ('RES_SH_LPG_HC_N','');
INSERT INTO "tech_groups" VALUES ('RES_SH_LPG_COND_HC_N','');
INSERT INTO "tech_groups" VALUES ('RES_SH_WST_BIO_HC_N','');
INSERT INTO "tech_groups" VALUES ('RES_SH_WPL_BIO_HC_N','');
INSERT INTO "tech_groups" VALUES ('RES_SH_AHP_ELC_HC_N','');
INSERT INTO "tech_groups" VALUES ('RES_SH_HNS_ELC_HC_N','');
INSERT INTO "tech_groups" VALUES ('RES_SH_HPP_ELC_HC_N','');
INSERT INTO "tech_groups" VALUES ('RES_SH_HEX_HET_HC_N','');
INSERT INTO "tech_groups" VALUES ('RES_SH_HP_HET_HC_N','');
INSERT INTO "tech_groups" VALUES ('RES_SH_HPTS_HC_N','');
INSERT INTO "tech_groups" VALUES ('RES_WH_NGA_E','');
INSERT INTO "tech_groups" VALUES ('RES_WH_HFO_E','');
INSERT INTO "tech_groups" VALUES ('RES_WH_DST_E','');
INSERT INTO "tech_groups" VALUES ('RES_WH_LPG_E','');
INSERT INTO "tech_groups" VALUES ('RES_WH_BIO_E','');
INSERT INTO "tech_groups" VALUES ('RES_WH_ELC_E','');
INSERT INTO "tech_groups" VALUES ('RES_WH_HET_E','');
INSERT INTO "tech_groups" VALUES ('RES_WH_DST_N','');
INSERT INTO "tech_groups" VALUES ('RES_WH_DST_COND_N','');
INSERT INTO "tech_groups" VALUES ('RES_WH_NGA_N','');
INSERT INTO "tech_groups" VALUES ('RES_WH_NGA_COND_N','');
INSERT INTO "tech_groups" VALUES ('RES_WH_LPG_N','');
INSERT INTO "tech_groups" VALUES ('RES_WH_HFO_N','');
INSERT INTO "tech_groups" VALUES ('RES_WH_LPG_COND_N','');
INSERT INTO "tech_groups" VALUES ('RES_WH_WPL_BIO_N','');
INSERT INTO "tech_groups" VALUES ('RES_WH_ELC_RES_N','');
INSERT INTO "tech_groups" VALUES ('RES_WH_AHP_ELC_N','');
INSERT INTO "tech_groups" VALUES ('RES_WH_HNS_ELC_N','');
INSERT INTO "tech_groups" VALUES ('RES_WH_SOL_N','');
INSERT INTO "tech_groups" VALUES ('RES_WH_PDC_ACS_N','');
INSERT INTO "tech_groups" VALUES ('RES_CK_NGA_E','');
INSERT INTO "tech_groups" VALUES ('RES_CK_LPG_E','');
INSERT INTO "tech_groups" VALUES ('RES_CK_ELC_E','');
INSERT INTO "tech_groups" VALUES ('RES_CK_NGA_N','');
INSERT INTO "tech_groups" VALUES ('RES_CK_LPG_N','');
INSERT INTO "tech_groups" VALUES ('RES_CK_ELC_N','');
INSERT INTO "tech_groups" VALUES ('RES_CK_BIO_N','');
-- Upstream sector
INSERT INTO "tech_groups" VALUES ('UPS_SEC_REF','');
-- Commercial sector
-- Fuel technologies
INSERT INTO "tech_groups" VALUES ('COM_FT_DST_E','');
INSERT INTO "tech_groups" VALUES ('COM_FT_DST_N','');

INSERT INTO "tech_groups" VALUES ('COM_FT_ELC_EN','');
INSERT INTO "tech_groups" VALUES ('COM_FT_LPG_EN','');
INSERT INTO "tech_groups" VALUES ('COM_FT_NGA_E','');
INSERT INTO "tech_groups" VALUES ('COM_FT_NGA_N','');
-- Technologies
INSERT INTO "tech_groups" VALUES ('COM_SH_HT_NGA_E','');
INSERT INTO "tech_groups" VALUES ('COM_SH_HP_NGA_E','');
INSERT INTO "tech_groups" VALUES ('COM_SH_HT_DST_E','');
INSERT INTO "tech_groups" VALUES ('COM_SH_HT_LPG_E','');
INSERT INTO "tech_groups" VALUES ('COM_SH_RES_ELC_E','');
INSERT INTO "tech_groups" VALUES ('COM_SH_HP_ELC_E','');
INSERT INTO "tech_groups" VALUES ('COM_SH_HEX_HET_E','');
INSERT INTO "tech_groups" VALUES ('COM_SH_NGA_N','');
INSERT INTO "tech_groups" VALUES ('COM_SH_COND_NGA_N','');
INSERT INTO "tech_groups" VALUES ('COM_SH_LPG_N','');
INSERT INTO "tech_groups" VALUES ('COM_SH_COND_LPG_N','');
INSERT INTO "tech_groups" VALUES ('COM_SH_HEX_HET_N','');
INSERT INTO "tech_groups" VALUES ('COM_SH_HP_AIR_N','');
INSERT INTO "tech_groups" VALUES ('COM_SH_HP_PRB_N','');
INSERT INTO "tech_groups" VALUES ('COM_SH_HP_N','');
INSERT INTO "tech_groups" VALUES ('COM_SH_WPEL_N','');
INSERT INTO "tech_groups" VALUES ('COM_WH_NGA_E','');
INSERT INTO "tech_groups" VALUES ('COM_WH_DST_E','');
INSERT INTO "tech_groups" VALUES ('COM_WH_LPG_E','');
INSERT INTO "tech_groups" VALUES ('COM_WH_ELC_E','');
INSERT INTO "tech_groups" VALUES ('COM_WH_HET_E','');
INSERT INTO "tech_groups" VALUES ('COM_WH_COND_DST_N','');
INSERT INTO "tech_groups" VALUES ('COM_WH_NGA_N','');
INSERT INTO "tech_groups" VALUES ('COM_WH_COND_NGA_N','');
INSERT INTO "tech_groups" VALUES ('COM_WH_LPG_N','');
INSERT INTO "tech_groups" VALUES ('COM_WH_COND_LPG_N','');
INSERT INTO "tech_groups" VALUES ('COM_WH_WPEL_BIO_N','');
INSERT INTO "tech_groups" VALUES ('COM_WH_ELC_N','');
INSERT INTO "tech_groups" VALUES ('COM_WH_AHP_ELC_N','');
INSERT INTO "tech_groups" VALUES ('COM_WH_HEX_HET_N','');
INSERT INTO "tech_groups" VALUES ('COM_CK_NGA_E','');
INSERT INTO "tech_groups" VALUES ('COM_CK_LPG_E','');
INSERT INTO "tech_groups" VALUES ('COM_CK_ELC_E','');
INSERT INTO "tech_groups" VALUES ('COM_CK_NGA_N','');
INSERT INTO "tech_groups" VALUES ('COM_CK_LPG_N','');
INSERT INTO "tech_groups" VALUES ('COM_CK_ELC_N','');
INSERT INTO "tech_groups" VALUES ('COM_CK_BIO_N','');
INSERT INTO "tech_groups" VALUES ('COM_SC_ABS_NGA_E','');
INSERT INTO "tech_groups" VALUES ('COM_SC_ABS_NGA_N','');

INSERT INTO "tech_groups" VALUES ('COM_SC_HP_STD_N','');
INSERT INTO "tech_groups" VALUES ('COM_SC_HP_IMP_N','');
INSERT INTO "tech_groups" VALUES ('COM_SC_ROOF_STD_N','');
INSERT INTO "tech_groups" VALUES ('COM_SC_ROOF_ADV_N','');
INSERT INTO "tech_groups" VALUES ('COM_SC_REC_N','');
INSERT INTO "tech_groups" VALUES ('COM_SC_REC_IMP_N','');
INSERT INTO "tech_groups" VALUES ('COM_SC_CNF_N','');
INSERT INTO "tech_groups" VALUES ('COM_SC_CNF_IMP_N','');
INSERT INTO "tech_groups" VALUES ('COM_SC_CNT_N','');
INSERT INTO "tech_groups" VALUES ('COM_SC_ROOM_N','');
INSERT INTO "tech_groups" VALUES ('COM_SC_NGA_STD_N','');
INSERT INTO "tech_groups" VALUES ('COM_SC_NGA_IMP_N','');
INSERT INTO "tech_groups" VALUES ('COM_SC_CHL_DST_E','');
INSERT INTO "tech_groups" VALUES ('COM_SC_CCL_ELC_CNT_E','');
INSERT INTO "tech_groups" VALUES ('COM_SC_AHP_ELC_E','');
INSERT INTO "tech_groups" VALUES ('COM_SC_ROOM_ELC_E','');
INSERT INTO "tech_groups" VALUES ('COM_SC_ROOF_ELC_E','');

--Agriculture sector
INSERT INTO "tech_groups"  VALUES ('AGR_TECH','');
-- Industrial sector
-- Fuel technologies
INSERT INTO "tech_groups" VALUES ('IND_FT_NGA_E','');
INSERT INTO "tech_groups" VALUES ('IND_FT_NGA_N','');
INSERT INTO "tech_groups" VALUES ('IND_FT_COA_E','');
INSERT INTO "tech_groups" VALUES ('IND_FT_COA_N','');
INSERT INTO "tech_groups" VALUES ('IND_FT_COK_E','');
INSERT INTO "tech_groups" VALUES ('IND_FT_COK_N','');
INSERT INTO "tech_groups" VALUES ('IND_FT_ETH_E','');
INSERT INTO "tech_groups" VALUES ('IND_FT_ETH_N','');
INSERT INTO "tech_groups" VALUES ('IND_FT_OIL_E','');
INSERT INTO "tech_groups" VALUES ('IND_FT_OIL_N','');
INSERT INTO "tech_groups" VALUES ('IND_FT_PTC_E','');
INSERT INTO "tech_groups" VALUES ('IND_FT_PTC_N','');
INSERT INTO "tech_groups" VALUES ('IND_FT_LPG_E','');
INSERT INTO "tech_groups" VALUES ('IND_FT_LPG_N','');
INSERT INTO "tech_groups" VALUES ('IND_FT_HFO_E','');
INSERT INTO "tech_groups" VALUES ('IND_FT_HFO_N','');
INSERT INTO "tech_groups" VALUES ('IND_FT_HET_E','');
INSERT INTO "tech_groups" VALUES ('IND_FT_HET_N','');
INSERT INTO "tech_groups" VALUES ('IND_FT_BIO_E','');
INSERT INTO "tech_groups" VALUES ('IND_FT_BIO_N','');
-- Technologies
INSERT INTO "tech_groups" VALUES ('IND_STM_BIO_E','');
INSERT INTO "tech_groups" VALUES ('IND_STM_BIO_N','');
INSERT INTO "tech_groups" VALUES ('IND_STM_COA_E','');
INSERT INTO "tech_groups" VALUES ('IND_STM_DST_E','');
INSERT INTO "tech_groups" VALUES ('IND_STM_HET_E','');
INSERT INTO "tech_groups" VALUES ('IND_STM_HFO_E','');
INSERT INTO "tech_groups" VALUES ('IND_STM_LPG_E','');
INSERT INTO "tech_groups" VALUES ('IND_STM_NGA_E','');
INSERT INTO "tech_groups" VALUES ('IND_STM_BFG_N','');
INSERT INTO "tech_groups" VALUES ('IND_STM_DST_N','');
INSERT INTO "tech_groups" VALUES ('IND_STM_ETH_N','');
INSERT INTO "tech_groups" VALUES ('IND_STM_HET_N','');
INSERT INTO "tech_groups" VALUES ('IND_STM_LPG_N','');
INSERT INTO "tech_groups" VALUES ('IND_STM_NGA_N','');
INSERT INTO "tech_groups" VALUES ('IND_STM_PTC_N','');
INSERT INTO "tech_groups" VALUES ('IND_CH_FS_DST_E','');
INSERT INTO "tech_groups" VALUES ('IND_CH_FS_GSL_E','');
INSERT INTO "tech_groups" VALUES ('IND_CH_FS_HFO_E','');
INSERT INTO "tech_groups" VALUES ('IND_CH_FS_KER_E','');
INSERT INTO "tech_groups" VALUES ('IND_CH_FS_LPG_E','');
INSERT INTO "tech_groups" VALUES ('IND_CH_FS_NAP_E','');
INSERT INTO "tech_groups" VALUES ('IND_CH_FS_NGA_E','');
INSERT INTO "tech_groups" VALUES ('IND_CH_FS_NSP_E','');
INSERT INTO "tech_groups" VALUES ('IND_CH_FS_RFG_E','');
INSERT INTO "tech_groups" VALUES ('IND_CH_FS_BIO_N','');
INSERT INTO "tech_groups" VALUES ('IND_CH_FS_COA_N','');
INSERT INTO "tech_groups" VALUES ('IND_CH_FS_DST_N','');
INSERT INTO "tech_groups" VALUES ('IND_CH_FS_ETH_N','');
INSERT INTO "tech_groups" VALUES ('IND_CH_FS_LPG_N','');
INSERT INTO "tech_groups" VALUES ('IND_CH_FS_MTH_N','');
INSERT INTO "tech_groups" VALUES ('IND_CH_FS_NAP_N','');
INSERT INTO "tech_groups" VALUES ('IND_CH_FS_NGA_N','');
INSERT INTO "tech_groups" VALUES ('IND_CH_OTH_COK_E','');
INSERT INTO "tech_groups" VALUES ('IND_CH_OTH_DST_E','');
INSERT INTO "tech_groups" VALUES ('IND_CH_OTH_ELC_E','');
INSERT INTO "tech_groups" VALUES ('IND_CH_OTH_ETH_E','');
INSERT INTO "tech_groups" VALUES ('IND_CH_OTH_HFO_E','');
INSERT INTO "tech_groups" VALUES ('IND_CH_OTH_NGA_E','');
INSERT INTO "tech_groups" VALUES ('IND_CH_OTH_PTC_E','');
INSERT INTO "tech_groups" VALUES ('IND_CH_OTH_COK_N','');
INSERT INTO "tech_groups" VALUES ('IND_CH_OTH_DST_N','');
INSERT INTO "tech_groups" VALUES ('IND_CH_OTH_ELC_N','');
INSERT INTO "tech_groups" VALUES ('IND_CH_OTH_ETH_N','');
INSERT INTO "tech_groups" VALUES ('IND_CH_OTH_NGA_N','');
INSERT INTO "tech_groups" VALUES ('IND_IS_FS_COK_E','');
INSERT INTO "tech_groups" VALUES ('IND_IS_FS_PTC_E','');
INSERT INTO "tech_groups" VALUES ('IND_NF_OTH_ELC_E','');
INSERT INTO "tech_groups" VALUES ('IND_NF_OTH_DST_E','');
INSERT INTO "tech_groups" VALUES ('IND_NF_OTH_NGA_E','');
INSERT INTO "tech_groups" VALUES ('IND_NF_OTH_LPG_E','');
INSERT INTO "tech_groups" VALUES ('IND_NF_OTH_ELC_N','');
INSERT INTO "tech_groups" VALUES ('IND_NF_OTH_DST_N','');
INSERT INTO "tech_groups" VALUES ('IND_NF_OTH_NGA_N','');
INSERT INTO "tech_groups" VALUES ('IND_NM_CLK_DRY_E','');
INSERT INTO "tech_groups" VALUES ('IND_NM_CLK_DRY_N','');
INSERT INTO "tech_groups" VALUES ('IND_NM_CLK_DRYCL_PCCS_N','');
INSERT INTO "tech_groups" VALUES ('IND_NM_CLK_DRYCL_OCCS_N','');
INSERT INTO "tech_groups" VALUES ('IND_NM_OTH_COK_E','');
INSERT INTO "tech_groups" VALUES ('IND_NM_OTH_DST_E','');
INSERT INTO "tech_groups" VALUES ('IND_NM_OTH_ELC_E','');
INSERT INTO "tech_groups" VALUES ('IND_NM_OTH_LPG_E','');
INSERT INTO "tech_groups" VALUES ('IND_NM_OTH_NGA_E','');
INSERT INTO "tech_groups" VALUES ('IND_PP_PH_DST_E','');
INSERT INTO "tech_groups" VALUES ('IND_PP_PH_ELC_E','');
INSERT INTO "tech_groups" VALUES ('IND_PP_PH_HFO_E','');
INSERT INTO "tech_groups" VALUES ('IND_PP_PH_NGA_E','');
INSERT INTO "tech_groups" VALUES ('IND_PP_PH_HFO_N','');
INSERT INTO "tech_groups" VALUES ('IND_PP_PH_NGA_N','');
INSERT INTO "tech_groups" VALUES ('IND_OTH_PH_DST_E','');
INSERT INTO "tech_groups" VALUES ('IND_OTH_PH_HFO_E','');
INSERT INTO "tech_groups" VALUES ('IND_OTH_PH_LPG_E','');
INSERT INTO "tech_groups" VALUES ('IND_OTH_PH_NGA_E','');
INSERT INTO "tech_groups" VALUES ('IND_OTH_PH_DST_N','');
INSERT INTO "tech_groups" VALUES ('IND_OTH_PH_HFO_N','');
INSERT INTO "tech_groups" VALUES ('IND_OTH_PH_LPG_N','');
INSERT INTO "tech_groups" VALUES ('IND_OTH_PH_NGA_N','');


CREATE TABLE "groups" (
   "group_name"   text,
   "notes"    text,
   primary key("group_name")
);


-- Electricity sector
INSERT INTO "groups" VALUES ('ELC_FT_NGA_GRP','');
INSERT INTO "groups" VALUES ('ELC_BIOGS_GRP','');
INSERT INTO "groups" VALUES ('ELC_BIO_GRP','');
INSERT INTO "groups" VALUES ('ELC_SOL_GRP','');
INSERT INTO "groups" VALUES ('ELC_BMU_GRP','');
INSERT INTO "groups" VALUES ('ELC_NGA_GRP','');
INSERT INTO "groups" VALUES ('ELC_HYD_GRP','');
INSERT INTO "groups" VALUES ('ELC_WIN_GRP','');

-- Transport sector
INSERT INTO "groups" VALUES ('TRA_FT_JTK_GRP','');
INSERT INTO "groups" VALUES ('TRA_FT_NGA_GRP','');
INSERT INTO "groups" VALUES ('TRA_FT_DST_GRP','');
INSERT INTO "groups" VALUES ('TRA_FT_GSL_GRP','');
INSERT INTO "groups" VALUES ('TRA_RAIL_GRP','');
INSERT INTO "groups" VALUES ('TRA_ROA_CAR_GRP','');
INSERT INTO "groups" VALUES ('TRA_ROA_HTR_DST_GRP','');
INSERT INTO "groups" VALUES ('TRA_FT_LPG_GRP','');

INSERT INTO "groups" VALUES ('TRA_NGA_GRP','');
INSERT INTO "groups" VALUES ('TRA_FT_BIODST_GRP','');
-- Residential sector
INSERT INTO "groups" VALUES ('RES_FT_BIO_GRP','');
INSERT INTO "groups" VALUES ('RES_FT_DST_GRP','');
INSERT INTO "groups" VALUES ('RES_FT_LPG_GRP','');
INSERT INTO "groups" VALUES ('RES_FT_NGA_GRP','');
INSERT INTO "groups" VALUES ('RES_FT_ELC_GRP','');
INSERT INTO "groups" VALUES ('RES_FT_HFO_GRP','');
INSERT INTO "groups" VALUES ('RES_FT_SOL_GRP','');
INSERT INTO "groups" VALUES ('RES_WH_GRP','');
INSERT INTO "groups" VALUES ('RES_CK_GRP','');
INSERT INTO "groups" VALUES ('RES_LPG_GRP','');
INSERT INTO "groups" VALUES ('RES_WH_LPG_GRP','');

-- Commercial sector
INSERT INTO "groups" VALUES ('COM_FT_DST_GRP','');
INSERT INTO "groups" VALUES ('COM_FT_ELC_GRP','');
INSERT INTO "groups" VALUES ('COM_FT_NGA_GRP','');
INSERT INTO "groups" VALUES ('COM_FT_SOL_GRP','');
INSERT INTO "groups" VALUES ('COM_SH_GRP','');
INSERT INTO "groups" VALUES ('COM_WH_GRP','');
INSERT INTO "groups" VALUES ('COM_CK_GRP','');
INSERT INTO "groups" VALUES ('COM_WH_NGA_GRP','');
INSERT INTO "groups" VALUES ('COM_SC_GRP','');
INSERT INTO "groups" VALUES ('COM_SC_ABS_NGA_GRP','');

-- Agriculture sector
INSERT INTO "groups" VALUES ('AGR_GRP','');
-- Industrial sector
INSERT INTO "groups" VALUES ('IND_FT_NGA_GRP','');

INSERT INTO "groups" VALUES ('IND_FT_PTC_GRP','');
INSERT INTO "groups" VALUES ('IND_FT_BIO_GRP','');
INSERT INTO "groups" VALUES ('IND_FT_LPG_GRP','Industry sector, LPG fuel technolgies');
INSERT INTO "groups" VALUES ('IND_FT_HFO_GRP','Industry sector, HFO fuel technolgies');
INSERT INTO "groups" VALUES ('IND_FT_HET_GRP','Industry sector, HFO fuel technolgies');
INSERT INTO "groups" VALUES ('IND_STM_GRP','');
INSERT INTO "groups" VALUES ('IND_STM_BIO_GRP','');

INSERT INTO "groups" VALUES ('IND_CH_FS_GRP','');
INSERT INTO "groups" VALUES ('IND_CH_OTH_GRP','');
INSERT INTO "groups" VALUES ('IND_IS_FS_GRP','');
INSERT INTO "groups" VALUES ('IND_NF_OTH_GRP','');
INSERT INTO "groups" VALUES ('IND_NM_CLK_DRY_GRP','');
INSERT INTO "groups" VALUES ('IND_NM_OTH_GRP','');
INSERT INTO "groups" VALUES ('IND_PP_PH_GRP','');
INSERT INTO "groups" VALUES ('IND_OTH_PH_GRP','');
INSERT INTO "groups" VALUES ('IND_HET_GRP','');
INSERT INTO "groups" VALUES ('IND_CH_OTH_HFO_GRP','');

CREATE TABLE "TechGroupWeight" (
   "tech"            text,
   "group_name"       text,
   "gi_min_fraction"  real,
   "tech_desc"            text,
   primary key("tech","group_name")
);
-- Power sector
INSERT INTO "TechGroupWeight" VALUES ('ELC_WIN_E','ELC_WIN_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_WIN_N','ELC_WIN_GRP',1.0,'');

INSERT INTO "TechGroupWeight" VALUES ('ELC_CHP_BMU_E','ELC_BIO_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_CHP_BIO_E','ELC_BIO_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_BIO_E','ELC_BIO_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_BGS_E','ELC_BIO_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_BLQ_N','ELC_BIO_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_BIO_5C_N','ELC_BIO_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_BIOGS_AGR_N','ELC_BIO_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_CHP_BMU_N','ELC_BIO_GRP',1.0,'');

INSERT INTO "TechGroupWeight" VALUES ('ELC_HYD_FLO_E','ELC_HYD_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_HYD_RES_E','ELC_HYD_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_HYD_PUM_E','ELC_HYD_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_HYD_MICRO_N','ELC_HYD_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_HYD_MINI_N','ELC_HYD_GRP',1.0,'');

INSERT INTO "TechGroupWeight" VALUES ('ELC_NGA_CC_E','ELC_NGA_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_NGA_STM_REP_E','ELC_NGA_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_NGA_TURB_E','ELC_NGA_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_CHP_NGA_CC_E','ELC_NGA_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_CHP_NGA_TURB_E','ELC_NGA_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_CHP_NGA_STM_COND_E','ELC_NGA_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_NGA_CC_P','ELC_NGA_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_CHP_NGA_CC_P','ELC_NGA_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_CHP_NGA_TURB_P','ELC_NGA_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_NGA_TURB_L80MW_N','ELC_NGA_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_CHP_NGA_TURB_N','ELC_NGA_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_CHP_NGA_CC_N','ELC_NGA_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_CHP_NGA_CP_N','ELC_NGA_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_CHP_NGA_TAP_N','ELC_NGA_GRP',1.0,'');

INSERT INTO "TechGroupWeight" VALUES ('ELC_SOL_E','ELC_SOL_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_PV_GRO_N','ELC_SOL_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_PV_ROOF_N','ELC_SOL_GRP',1.0,'');

-- Residential sector
--Fuel Technologies
INSERT INTO "TechGroupWeight" VALUES ('RES_FT_HFO_E','RES_FT_HFO_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('RES_FT_HFO_N','RES_FT_HFO_GRP',1.0,'');

INSERT INTO "TechGroupWeight" VALUES ('RES_FT_LPG_E','RES_FT_LPG_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('RES_FT_LPG_N','RES_FT_LPG_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('RES_FT_BIO_E','RES_FT_BIO_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('RES_FT_BIO_N','RES_FT_BIO_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('RES_FT_DST_E','RES_FT_DST_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('RES_FT_DST_N','RES_FT_DST_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('RES_FT_NGA_E','RES_FT_NGA_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('RES_FT_NGA_N','RES_FT_NGA_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('RES_FT_ELC_E','RES_FT_ELC_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('RES_FT_ELC_N','RES_FT_ELC_GRP',1.0,'');

INSERT INTO "TechGroupWeight" VALUES ('RES_FT_SOL_E','RES_FT_SOL_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('RES_FT_SOL_N','RES_FT_SOL_GRP',1.0,'');
--Technolgoies

INSERT INTO "TechGroupWeight" VALUES ('RES_WH_LPG_E','RES_WH_LPG_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('RES_WH_LPG_N','RES_WH_LPG_GRP',1.0,'');

INSERT INTO "TechGroupWeight" VALUES ('RES_SH_BUR_LPG_LC_E','RES_LPG_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('RES_SH_BUR_LPG_MC_E','RES_LPG_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('RES_SH_BUR_LPG_HC_E','RES_LPG_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('RES_WH_LPG_E','RES_LPG_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('RES_CK_LPG_E','RES_LPG_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('RES_WH_LPG_N','RES_LPG_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('RES_WH_LPG_COND_N','RES_LPG_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('RES_CK_LPG_N','RES_LPG_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('RES_SH_LPG_LC_N','RES_LPG_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('RES_SH_LPG_COND_LC_N','RES_LPG_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('RES_SH_SOL_LPG_LC_N','RES_LPG_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('RES_SH_LPG_MC_N','RES_LPG_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('RES_SH_LPG_COND_MC_N','RES_LPG_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('RES_SH_SOL_LPG_MC_N','RES_LPG_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('RES_SH_LPG_HC_N','RES_LPG_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('RES_SH_LPG_COND_HC_N','RES_LPG_GRP',1.0,'');

INSERT INTO "TechGroupWeight" VALUES ('RES_WH_NGA_E','RES_WH_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('RES_WH_HFO_E','RES_WH_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('RES_WH_HFO_N','RES_WH_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('RES_WH_DST_E','RES_WH_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('RES_WH_LPG_E','RES_WH_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('RES_WH_BIO_E','RES_WH_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('RES_WH_ELC_E','RES_WH_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('RES_WH_HET_E','RES_WH_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('RES_WH_DST_N','RES_WH_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('RES_WH_DST_COND_N','RES_WH_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('RES_WH_NGA_N','RES_WH_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('RES_WH_NGA_COND_N','RES_WH_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('RES_WH_LPG_N','RES_WH_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('RES_WH_LPG_COND_N','RES_WH_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('RES_WH_WPL_BIO_N','RES_WH_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('RES_WH_ELC_RES_N','RES_WH_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('RES_WH_AHP_ELC_N','RES_WH_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('RES_WH_HNS_ELC_N','RES_WH_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('RES_WH_SOL_N','RES_WH_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('RES_WH_PDC_ACS_N','RES_WH_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('RES_CK_NGA_E','RES_CK_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('RES_CK_LPG_E','RES_CK_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('RES_CK_ELC_E','RES_CK_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('RES_CK_NGA_N','RES_CK_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('RES_CK_LPG_N','RES_CK_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('RES_CK_ELC_N','RES_CK_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('RES_CK_BIO_N','RES_CK_GRP',1.0,'');

-- Commercial sector
INSERT INTO "TechGroupWeight" VALUES ('COM_SC_CHL_DST_E','COM_SC_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('COM_SC_CCL_ELC_CNT_E','COM_SC_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('COM_SC_AHP_ELC_E','COM_SC_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('COM_SC_ROOM_ELC_E','COM_SC_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('COM_SC_ROOF_ELC_E','COM_SC_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('COM_SC_ABS_NGA_E','COM_SC_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('COM_SC_HP_STD_N','COM_SC_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('COM_SC_HP_IMP_N','COM_SC_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('COM_SC_ROOF_STD_N','COM_SC_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('COM_SC_ROOF_ADV_N','COM_SC_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('COM_SC_REC_N','COM_SC_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('COM_SC_REC_IMP_N','COM_SC_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('COM_SC_CNF_N','COM_SC_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('COM_SC_CNF_IMP_N','COM_SC_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('COM_SC_CNT_N','COM_SC_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('COM_SC_ROOM_N','COM_SC_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('COM_SC_NGA_STD_N','COM_SC_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('COM_SC_NGA_IMP_N','COM_SC_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('COM_SC_ABS_NGA_N','COM_SC_GRP',1.0,'');


INSERT INTO "TechGroupWeight" VALUES ('COM_SC_ABS_NGA_E','COM_SC_ABS_NGA_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('COM_SC_ABS_NGA_N','COM_SC_ABS_NGA_GRP',1.0,'');

INSERT INTO "TechGroupWeight" VALUES ('COM_FT_DST_E','COM_FT_DST_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('COM_FT_DST_N','COM_FT_DST_GRP',1.0,'');

INSERT INTO "TechGroupWeight" VALUES ('COM_FT_NGA_E','COM_FT_NGA_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('COM_FT_NGA_N','COM_FT_NGA_GRP',1.0,'');

INSERT INTO "TechGroupWeight" VALUES ('COM_SH_HT_NGA_E','COM_SH_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('COM_SH_HP_NGA_E','COM_SH_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('COM_SH_HT_DST_E','COM_SH_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('COM_SH_HT_LPG_E','COM_SH_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('COM_SH_RES_ELC_E','COM_SH_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('COM_SH_HP_ELC_E','COM_SH_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('COM_SH_HEX_HET_E','COM_SH_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('COM_SH_NGA_N','COM_SH_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('COM_SH_COND_NGA_N','COM_SH_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('COM_SH_LPG_N','COM_SH_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('COM_SH_COND_LPG_N','COM_SH_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('COM_SH_HEX_HET_N','COM_SH_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('COM_SH_HP_AIR_N','COM_SH_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('COM_SH_HP_PRB_N','COM_SH_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('COM_SH_HP_N','COM_SH_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('COM_SH_WPEL_N','COM_SH_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('COM_WH_NGA_E','COM_WH_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('COM_WH_DST_E','COM_WH_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('COM_WH_LPG_E','COM_WH_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('COM_WH_ELC_E','COM_WH_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('COM_WH_COND_DST_N','COM_WH_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('COM_WH_NGA_N','COM_WH_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('COM_WH_COND_NGA_N','COM_WH_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('COM_WH_LPG_N','COM_WH_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('COM_WH_COND_LPG_N','COM_WH_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('COM_WH_WPEL_BIO_N','COM_WH_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('COM_WH_ELC_N','COM_WH_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('COM_WH_AHP_ELC_N','COM_WH_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('COM_WH_HEX_HET_N','COM_WH_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('COM_CK_NGA_E','COM_CK_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('COM_CK_LPG_E','COM_CK_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('COM_CK_ELC_E','COM_CK_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('COM_CK_NGA_N','COM_CK_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('COM_CK_LPG_N','COM_CK_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('COM_CK_ELC_N','COM_CK_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('COM_CK_BIO_N','COM_CK_GRP',1.0,'');

INSERT INTO "TechGroupWeight" VALUES ('COM_WH_NGA_E','COM_WH_NGA_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('COM_WH_NGA_N','COM_WH_NGA_GRP',1.0,'');

-- Industrial sector
-- Fuel technologies

INSERT INTO "TechGroupWeight" VALUES ('IND_FT_BIO_E','IND_FT_BIO_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IND_FT_BIO_N','IND_FT_BIO_GRP',1.0,'');

INSERT INTO "TechGroupWeight" VALUES ('IND_FT_PTC_E','IND_FT_PTC_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IND_FT_PTC_N','IND_FT_PTC_GRP',1.0,'');

INSERT INTO "TechGroupWeight" VALUES ('IND_FT_NGA_E','IND_FT_NGA_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IND_FT_NGA_N','IND_FT_NGA_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IND_CH_OTH_HFO_E','IND_CH_OTH_HFO_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IND_FT_HET_E','IND_HET_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IND_FT_HET_N','IND_HET_GRP',1.0,'');


INSERT INTO "TechGroupWeight" VALUES ('IND_FT_HFO_E','IND_FT_HFO_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IND_FT_HFO_N','IND_FT_HFO_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IND_FT_LPG_E','IND_FT_LPG_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IND_FT_LPG_N','IND_FT_LPG_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IND_STM_BIO_E','IND_STM_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IND_STM_BIO_N','IND_STM_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IND_STM_COA_E','IND_STM_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IND_STM_DST_E','IND_STM_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IND_STM_HET_E','IND_STM_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IND_STM_HFO_E','IND_STM_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IND_STM_LPG_E','IND_STM_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IND_STM_NGA_E','IND_STM_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IND_STM_BFG_N','IND_STM_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IND_STM_DST_N','IND_STM_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IND_STM_ETH_N','IND_STM_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IND_STM_HET_N','IND_STM_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IND_STM_LPG_N','IND_STM_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IND_STM_NGA_N','IND_STM_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IND_STM_PTC_N','IND_STM_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IND_CH_OTH_COK_E','IND_CH_OTH_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IND_CH_OTH_DST_E','IND_CH_OTH_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IND_CH_OTH_ELC_E','IND_CH_OTH_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IND_CH_OTH_ETH_E','IND_CH_OTH_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IND_CH_OTH_HFO_E','IND_CH_OTH_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IND_CH_OTH_NGA_E','IND_CH_OTH_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IND_CH_OTH_PTC_E','IND_CH_OTH_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IND_CH_OTH_COK_N','IND_CH_OTH_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IND_CH_OTH_DST_N','IND_CH_OTH_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IND_CH_OTH_ELC_N','IND_CH_OTH_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IND_CH_OTH_ETH_N','IND_CH_OTH_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IND_CH_OTH_NGA_N','IND_CH_OTH_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IND_NF_OTH_ELC_E','IND_NF_OTH_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IND_NF_OTH_DST_E','IND_NF_OTH_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IND_NF_OTH_NGA_E','IND_NF_OTH_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IND_NF_OTH_LPG_E','IND_NF_OTH_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IND_NF_OTH_ELC_N','IND_NF_OTH_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IND_NF_OTH_DST_N','IND_NF_OTH_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IND_NF_OTH_NGA_N','IND_NF_OTH_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IND_NM_OTH_COK_E','IND_NM_OTH_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IND_NM_OTH_DST_E','IND_NM_OTH_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IND_NM_OTH_ELC_E','IND_NM_OTH_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IND_NM_OTH_LPG_E','IND_NM_OTH_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IND_NM_OTH_NGA_E','IND_NM_OTH_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IND_OTH_PH_DST_E','IND_OTH_PH_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IND_OTH_PH_HFO_E','IND_OTH_PH_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IND_OTH_PH_LPG_E','IND_OTH_PH_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IND_OTH_PH_NGA_E','IND_OTH_PH_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IND_OTH_PH_DST_N','IND_OTH_PH_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IND_OTH_PH_HFO_N','IND_OTH_PH_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IND_OTH_PH_LPG_N','IND_OTH_PH_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IND_OTH_PH_NGA_N','IND_OTH_PH_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IND_STM_BIO_E','IND_STM_BIO_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IND_STM_BIO_N','IND_STM_BIO_GRP',1.0,'');
-- Transport sector
INSERT INTO "TechGroupWeight" VALUES ('TRA_FT_JTK_E','TRA_FT_JTK_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('TRA_FT_JTK_N','TRA_FT_JTK_GRP',1.0,'');

INSERT INTO "TechGroupWeight" VALUES ('TRA_FT_NGA_E','TRA_FT_NGA_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('TRA_FT_NGA_N','TRA_FT_NGA_GRP',1.0,'');

INSERT INTO "TechGroupWeight" VALUES ('TRA_FT_DST_E','TRA_FT_DST_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('TRA_FT_DST_N','TRA_FT_DST_GRP',1.0,'');

INSERT INTO "TechGroupWeight" VALUES ('TRA_FT_GSL_E','TRA_FT_GSL_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('TRA_FT_GSL_N','TRA_FT_GSL_GRP',1.0,'');

INSERT INTO "TechGroupWeight" VALUES ('TRA_FT_LPG_E','TRA_FT_LPG_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('TRA_FT_LPG_N','TRA_FT_LPG_GRP',1.0,'');

INSERT INTO "TechGroupWeight" VALUES ('TRA_ROA_HTR_DST_E','TRA_ROA_HTR_DST_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('TRA_ROA_HTR_DST_N','TRA_ROA_HTR_DST_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('TRA_RAIL_DSL_EN','TRA_RAIL_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('TRA_RAIL_ELC_EN','TRA_RAIL_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('TRA_ROA_CAR_DST_E','TRA_ROA_CAR_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('TRA_ROA_CAR_GSL_E','TRA_ROA_CAR_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('TRA_ROA_CAR_LPG_E','TRA_ROA_CAR_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('TRA_ROA_CAR_NGA_E','TRA_ROA_CAR_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('TRA_ROA_CAR_DST_N','TRA_ROA_CAR_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('TRA_ROA_CAR_GSL_N','TRA_ROA_CAR_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('TRA_ROA_CAR_LPG_N','TRA_ROA_CAR_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('TRA_ROA_CAR_ELC_N','TRA_ROA_CAR_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('TRA_ROA_CAR_NGA_N','TRA_ROA_CAR_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('TRA_ROA_CAR_HYBG_N','TRA_ROA_CAR_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('TRA_ROA_CAR_FCELL_N','TRA_ROA_CAR_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('TRA_ROA_CAR_PIHYB_N','TRA_ROA_CAR_GRP',1.0,'');

INSERT INTO "TechGroupWeight" VALUES ('TRA_ROA_CAR_NGA_E','TRA_NGA_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('TRA_ROA_CAR_NGA_N','TRA_NGA_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('TRA_ROA_HTR_NGA_N','TRA_NGA_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('TRA_ROA_LCV_NGA_N','TRA_NGA_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('TRA_ROA_MTR_NGA_N','TRA_NGA_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('TRA_ROA_BUS_NGA_N','TRA_NGA_GRP',1.0,'');

INSERT INTO "TechGroupWeight" VALUES ('TRA_FT_BIO_DST_E','TRA_FT_BIODST_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('TRA_FT_BIO_DST_N','TRA_FT_BIODST_GRP',1.0,'');
-- Agriculture sector
INSERT INTO "TechGroupWeight" VALUES ('AGR_TECH','AGR_GRP',1.0,'');


CREATE TABLE "MinInputGroup" (
   "regions"        text,
   "periods"        integer,
   "input_comm"     text,
   "group_name"     text,
   "gi_min"         real,
   "gi_min_notes"    text,
   foreign key("group_name") references "groups"("group_name"),
   foreign key("input_comm") references "commodities"("comm_name"),
   foreign key("periods") references "time_periods"("t_periods"),
   primary key("regions","periods","input_comm","group_name")
);
-- Commercial sector
INSERT INTO "MinInputGroup" VALUES ('PIE',2014,'COM_ELC','COM_SH_GRP',0.05,'');
INSERT INTO "MinInputGroup" VALUES ('PIE',2012,'COM_ELC','COM_WH_GRP',0.30,'');
INSERT INTO "MinInputGroup" VALUES ('PIE',2012,'COM_BIO','COM_CK_GRP',0.00,'');
INSERT INTO "MinInputGroup" VALUES ('PIE',2012,'COM_ELC','COM_CK_GRP',0.15,'');


INSERT INTO "MinInputGroup" VALUES ('PIE',2021,'IND_NGA','IND_STM_GRP',0.85,'');
INSERT INTO "MinInputGroup" VALUES ('PIE',2021,'IND_NGA','IND_OTH_PH_GRP',0.90,'');

CREATE TABLE "MinOutputGroup" (
	"regions"	      text,
	"periods"	      integer,
	"output_comm"	text,
	"group_name" 	text,
	"go_min"	      real,
	"go_min_notes"    text,
	FOREIGN KEY("group_name") REFERENCES "groups"("group_name"),
	FOREIGN KEY("output_comm") REFERENCES "commodities"("comm_name"),
	FOREIGN KEY("periods") REFERENCES "time_periods"("t_periods"),
	PRIMARY KEY("regions","periods","output_comm","group_name")
);

CREATE TABLE "MaxOutputGroup" (
   "regions"        text,
   "periods"        integer,
   "output_comm"    text,
   "group_name"     text,
   "go_max"         real,
   "go_max_notes"    text,
   foreign key("group_name") references "groups"("group_name"),
   foreign key("output_comm") references "commodities"("comm_name"),
   foreign key("periods") references "time_periods"("t_periods"),
   primary key("regions","periods","output_comm","group_name")
);


CREATE TABLE "MaxInputGroup" (
   "regions"        text,
   "periods"        integer,
   "input_comm"     text,
   "group_name"     text,
   "gi_max"         real,
   "gi_max_notes"    text,
   foreign key("group_name") references "groups"("group_name"),
   foreign key("input_comm") references "commodities"("comm_name"),
   foreign key("periods") references "time_periods"("t_periods"),
   primary key("regions","periods","input_comm","group_name")
);

-- Commercial sector
INSERT INTO "MaxInputGroup" VALUES ('PIE',2012,'COM_NGA','COM_SH_GRP',0.91,'');
INSERT INTO "MaxInputGroup" VALUES ('PIE',2012,'COM_HET','COM_SH_GRP',0.05,'');
INSERT INTO "MaxInputGroup" VALUES ('PIE',2050,'COM_HET','COM_SH_GRP',0.15,'');
INSERT INTO "MaxInputGroup" VALUES ('PIE',2012,'COM_BIO','COM_SH_GRP',0.00,'');
INSERT INTO "MaxInputGroup" VALUES ('PIE',2050,'COM_BIO','COM_SH_GRP',0.05,'');

INSERT INTO "MaxInputGroup" VALUES ('PIE',2012,'COM_HET','COM_WH_GRP',0.10,'');
INSERT INTO "MaxInputGroup" VALUES ('PIE',2050,'COM_HET','COM_WH_GRP',0.15,'');
INSERT INTO "MaxInputGroup" VALUES ('PIE',2012,'COM_BIO','COM_CK_GRP',0.05,'');
INSERT INTO "MaxInputGroup" VALUES ('PIE',2050,'COM_BIO','COM_CK_GRP',0.07,'');
INSERT INTO "MaxInputGroup" VALUES ('PIE',2050,'COM_DST','COM_CK_GRP',0.07,'');

INSERT INTO "MaxInputGroup" VALUES ('PIE',2023,'COM_DST','COM_SC_GRP',0.01,'');

-- Agriculture sector

INSERT INTO "MaxInputGroup" VALUES ('PIE',2013,'AGR_NGA','AGR_GRP',0.789,'');
INSERT INTO "MaxInputGroup" VALUES ('PIE',2013,'AGR_ELC','AGR_GRP',0.035,'');
INSERT INTO "MaxInputGroup" VALUES ('PIE',2013,'AGR_DST','AGR_GRP',0.163,'');
INSERT INTO "MaxInputGroup" VALUES ('PIE',2013,'AGR_LPG','AGR_GRP',0.014,'');
INSERT INTO "MaxInputGroup" VALUES ('PIE',2013,'AGR_GSL','AGR_GRP',0.0,'');

INSERT INTO "MaxInputGroup" VALUES ('PIE',2014,'AGR_NGA','AGR_GRP',0.789,'');
INSERT INTO "MaxInputGroup" VALUES ('PIE',2014,'AGR_ELC','AGR_GRP',0.035,'');
INSERT INTO "MaxInputGroup" VALUES ('PIE',2014,'AGR_DST','AGR_GRP',0.163,'');
INSERT INTO "MaxInputGroup" VALUES ('PIE',2014,'AGR_LPG','AGR_GRP',0.014,'');
INSERT INTO "MaxInputGroup" VALUES ('PIE',2014,'AGR_GSL','AGR_GRP',0.0,'');

INSERT INTO "MaxInputGroup" VALUES ('PIE',2015,'AGR_NGA','AGR_GRP',0.80,'');
INSERT INTO "MaxInputGroup" VALUES ('PIE',2015,'AGR_ELC','AGR_GRP',0.04,'');
INSERT INTO "MaxInputGroup" VALUES ('PIE',2015,'AGR_DST','AGR_GRP',0.15,'');
INSERT INTO "MaxInputGroup" VALUES ('PIE',2015,'AGR_LPG','AGR_GRP',0.02,'');
INSERT INTO "MaxInputGroup" VALUES ('PIE',2015,'AGR_GSL','AGR_GRP',0.00,'');

INSERT INTO "MaxInputGroup" VALUES ('PIE',2019,'AGR_NGA','AGR_GRP',0.81,'');
INSERT INTO "MaxInputGroup" VALUES ('PIE',2019,'AGR_ELC','AGR_GRP',0.04,'');
INSERT INTO "MaxInputGroup" VALUES ('PIE',2019,'AGR_DST','AGR_GRP',0.14,'');
INSERT INTO "MaxInputGroup" VALUES ('PIE',2019,'AGR_LPG','AGR_GRP',0.02,'');
INSERT INTO "MaxInputGroup" VALUES ('PIE',2019,'AGR_GSL','AGR_GRP',0.00,'');

INSERT INTO "MaxInputGroup" VALUES ('PIE',2020,'AGR_NGA','AGR_GRP',0.85,'');
INSERT INTO "MaxInputGroup" VALUES ('PIE',2020,'AGR_DST','AGR_GRP',0.13,'');
INSERT INTO "MaxInputGroup" VALUES ('PIE',2020,'AGR_LPG','AGR_GRP',0.02,'');
INSERT INTO "MaxInputGroup" VALUES ('PIE',2020,'AGR_ELC','AGR_GRP',0.04,'');
INSERT INTO "MaxInputGroup" VALUES ('PIE',2020,'AGR_GSL','AGR_GRP',0.00,'');

INSERT INTO "MaxInputGroup" VALUES ('PIE',2021,'AGR_NGA','AGR_GRP',0.85,'');
INSERT INTO "MaxInputGroup" VALUES ('PIE',2021,'AGR_DST','AGR_GRP',0.13,'');
INSERT INTO "MaxInputGroup" VALUES ('PIE',2021,'AGR_LPG','AGR_GRP',0.02,'');
INSERT INTO "MaxInputGroup" VALUES ('PIE',2021,'AGR_ELC','AGR_GRP',0.11,'');
INSERT INTO "MaxInputGroup" VALUES ('PIE',2021,'AGR_GSL','AGR_GRP',0.00,'');

INSERT INTO "MaxInputGroup" VALUES ('PIE',2023,'AGR_NGA','AGR_GRP',0.85,'');
INSERT INTO "MaxInputGroup" VALUES ('PIE',2023,'AGR_DST','AGR_GRP',0.12,'');
INSERT INTO "MaxInputGroup" VALUES ('PIE',2023,'AGR_LPG','AGR_GRP',0.02,'');
INSERT INTO "MaxInputGroup" VALUES ('PIE',2023,'AGR_ELC','AGR_GRP',0.11,'');
INSERT INTO "MaxInputGroup" VALUES ('PIE',2023,'AGR_GSL','AGR_GRP',0.00,'');

INSERT INTO "MaxInputGroup" VALUES ('PIE',2025,'AGR_NGA','AGR_GRP',0.85,'');
INSERT INTO "MaxInputGroup" VALUES ('PIE',2025,'AGR_DST','AGR_GRP',0.12,'');
INSERT INTO "MaxInputGroup" VALUES ('PIE',2025,'AGR_LPG','AGR_GRP',0.02,'');
INSERT INTO "MaxInputGroup" VALUES ('PIE',2025,'AGR_ELC','AGR_GRP',0.06,'');
INSERT INTO "MaxInputGroup" VALUES ('PIE',2025,'AGR_GSL','AGR_GRP',0.00,'');

INSERT INTO "MaxInputGroup" VALUES ('PIE',2030,'AGR_NGA','AGR_GRP',0.85,'');
INSERT INTO "MaxInputGroup" VALUES ('PIE',2030,'AGR_DST','AGR_GRP',0.12,'');
INSERT INTO "MaxInputGroup" VALUES ('PIE',2030,'AGR_LPG','AGR_GRP',0.02,'');
INSERT INTO "MaxInputGroup" VALUES ('PIE',2030,'AGR_ELC','AGR_GRP',0.06,'');
INSERT INTO "MaxInputGroup" VALUES ('PIE',2030,'AGR_GSL','AGR_GRP',0.00,'');

INSERT INTO "MaxInputGroup" VALUES ('PIE',2040,'AGR_NGA','AGR_GRP',0.85,'');
INSERT INTO "MaxInputGroup" VALUES ('PIE',2040,'AGR_DST','AGR_GRP',0.12,'');
INSERT INTO "MaxInputGroup" VALUES ('PIE',2040,'AGR_LPG','AGR_GRP',0.02,'');
INSERT INTO "MaxInputGroup" VALUES ('PIE',2040,'AGR_ELC','AGR_GRP',0.20,'');
INSERT INTO "MaxInputGroup" VALUES ('PIE',2040,'AGR_GSL','AGR_GRP',0.00,'');

--Residential sector


CREATE TABLE "MinActivityGroup" (
   "regions" text,
   "periods"  integer,
   "group_name"   text,
   "min_act_g"    real,
   "notes"    text,
   primary key("regions","periods","group_name")
);
--Commercial sector

INSERT INTO "MinActivityGroup" VALUES ('PIE',2012,'COM_FT_DST_GRP',0.98*7.97E-01,'PJ');

INSERT INTO "MinActivityGroup" VALUES ('PIE',2012,'COM_FT_NGA_GRP',4.37E+01,'PJ');
INSERT INTO "MinActivityGroup" VALUES ('PIE',2017,'COM_FT_NGA_GRP',4.11E+01,'PJ');
INSERT INTO "MinActivityGroup" VALUES ('PIE',2019,'COM_FT_NGA_GRP',0.98*3.92E+01,'PJ');
INSERT INTO "MinActivityGroup" VALUES ('PIE',2021,'COM_FT_NGA_GRP',0.98*4.13E+01,'PJ');


--Residential sector
--Fuel technologies
INSERT INTO "MinActivityGroup" VALUES ('PIE',2012,'RES_FT_SOL_GRP',1.02*6.83E-01,'PJ');
INSERT INTO "MinActivityGroup" VALUES ('PIE',2015,'RES_FT_SOL_GRP',1.02*7.94E-01,'PJ');
INSERT INTO "MinActivityGroup" VALUES ('PIE',2019,'RES_FT_SOL_GRP',1.02*8.86E-01,'PJ');
INSERT INTO "MinActivityGroup" VALUES ('PIE',2023,'RES_FT_SOL_GRP',1.1E+00,'PJ');

INSERT INTO "MinActivityGroup" VALUES ('PIE',2012,'RES_FT_LPG_GRP',0.90*3.60E+00,'PJ');
INSERT INTO "MinActivityGroup" VALUES ('PIE',2013,'RES_FT_LPG_GRP',0.90*3.46E+00,'PJ');
INSERT INTO "MinActivityGroup" VALUES ('PIE',2017,'RES_FT_LPG_GRP',1.05*3.38E+00,'PJ');
INSERT INTO "MinActivityGroup" VALUES ('PIE',2023,'RES_FT_LPG_GRP',4.26E+00,'PJ');
INSERT INTO "MinActivityGroup" VALUES ('PIE',2025,'RES_FT_LPG_GRP',4.26E+00,'PJ');
INSERT INTO "MinActivityGroup" VALUES ('PIE',2050,'RES_FT_LPG_GRP',4.26E+00,'PJ');

INSERT INTO "MinActivityGroup" VALUES ('PIE',2012,'RES_FT_BIO_GRP',0.98*2.63E+01,'PJ');
INSERT INTO "MinActivityGroup" VALUES ('PIE',2014,'RES_FT_BIO_GRP',0.95*2.45E+01,'PJ');
INSERT INTO "MinActivityGroup" VALUES ('PIE',2021,'RES_FT_BIO_GRP',2.73E+01,'PJ');
INSERT INTO "MinActivityGroup" VALUES ('PIE',2023,'RES_FT_BIO_GRP',2.73E+01,'PJ');
INSERT INTO "MinActivityGroup" VALUES ('PIE',2025,'RES_FT_BIO_GRP',2.73E+01,'PJ');
INSERT INTO "MinActivityGroup" VALUES ('PIE',2030,'RES_FT_BIO_GRP',2.73E+01,'PJ');

INSERT INTO "MinActivityGroup" VALUES ('PIE',2020,'RES_FT_DST_GRP',1.44E+00,'PJ');
INSERT INTO "MinActivityGroup" VALUES ('PIE',2021,'RES_FT_DST_GRP',1.21E+00,'PJ');
INSERT INTO "MinActivityGroup" VALUES ('PIE',2050,'RES_FT_DST_GRP',0.00,'PJ');

INSERT INTO "MinActivityGroup" VALUES ('PIE',2012,'RES_FT_NGA_GRP',7.28E+01,'PJ');
INSERT INTO "MinActivityGroup" VALUES ('PIE',2015,'RES_FT_NGA_GRP',6.73E+01,'PJ');
INSERT INTO "MinActivityGroup" VALUES ('PIE',2019,'RES_FT_NGA_GRP',6.53E+01,'PJ');
INSERT INTO "MinActivityGroup" VALUES ('PIE',2020,'RES_FT_NGA_GRP',1.01*6.37E+01,'PJ');
INSERT INTO "MinActivityGroup" VALUES ('PIE',2021,'RES_FT_NGA_GRP',6.88E+01,'PJ');
INSERT INTO "MinActivityGroup" VALUES ('PIE',2023,'RES_FT_NGA_GRP',1.01*68.7635,'PJ');
INSERT INTO "MinActivityGroup" VALUES ('PIE',2025,'RES_FT_NGA_GRP',1.03*68.7635,'PJ');

INSERT INTO "MinActivityGroup" VALUES ('PIE',2012,'RES_FT_ELC_GRP',1.77E+01,'PJ');
INSERT INTO "MinActivityGroup" VALUES ('PIE',2013,'RES_FT_ELC_GRP',1.72E+01,'PJ');
INSERT INTO "MinActivityGroup" VALUES ('PIE',2014,'RES_FT_ELC_GRP',1.65E+01,'PJ');
INSERT INTO "MinActivityGroup" VALUES ('PIE',2019,'RES_FT_ELC_GRP',1.64E+01,'PJ');
INSERT INTO "MinActivityGroup" VALUES ('PIE',2021,'RES_FT_ELC_GRP',1.63E+01,'PJ');
INSERT INTO "MinActivityGroup" VALUES ('PIE',2023,'RES_FT_ELC_GRP',1.59E+01,'PJ');
INSERT INTO "MinActivityGroup" VALUES ('PIE',2023,'RES_LPG_GRP',1.03*1.17E+01,'PJ');
INSERT INTO "MinActivityGroup" VALUES ('PIE',2021,'RES_WH_LPG_GRP',1.03*2.58E-01,'PJ');



-- Electricity sector
INSERT INTO "MinActivityGroup" VALUES ('PIE',2017,'ELC_WIN_GRP',0.97*1.03E-01,'PJ');
INSERT INTO "MinActivityGroup" VALUES ('PIE',2019,'ELC_WIN_GRP',0.97*1.05E-01,'PJ');
INSERT INTO "MinActivityGroup" VALUES ('PIE',2021,'ELC_WIN_GRP',0.97*9.97E-02,'PJ');
INSERT INTO "MinActivityGroup" VALUES ('PIE',2050,'ELC_WIN_GRP',0.00E00,'PJ');

INSERT INTO "MinActivityGroup" VALUES ('PIE',2012,'ELC_SOL_GRP',0.98*5.07E+00,'PJ');
INSERT INTO "MinActivityGroup" VALUES ('PIE',2019,'ELC_SOL_GRP',0.98*6.21E+00,'PJ');
INSERT INTO "MinActivityGroup" VALUES ('PIE',2021,'ELC_SOL_GRP',0.98*6.67E+00,'PJ');
INSERT INTO "MinActivityGroup" VALUES ('PIE',2050,'ELC_SOL_GRP',0.00E+00,'PJ');

INSERT INTO "MinActivityGroup" VALUES ('PIE',2012,'ELC_BIO_GRP',0.98*3.32E+00,'PJ');
INSERT INTO "MinActivityGroup" VALUES ('PIE',2014,'ELC_BIO_GRP',0.98*6.23E+00,'PJ');
INSERT INTO "MinActivityGroup" VALUES ('PIE',2021,'ELC_BIO_GRP',6.70E+00,'PJ');
INSERT INTO "MinActivityGroup" VALUES ('PIE',2023,'ELC_BIO_GRP',0.98*6.70E+00,'PJ');
INSERT INTO "MinActivityGroup" VALUES ('PIE',2050,'ELC_BIO_GRP',0.00E+00,'PJ');

INSERT INTO "MinActivityGroup" VALUES ('PIE',2019,'ELC_HYD_GRP',0.98*2.91E+01,'PJ');

INSERT INTO "MinActivityGroup" VALUES ('PIE',2019,'ELC_NGA_GRP',0.98*7.26E+01,'PJ');
INSERT INTO "MinActivityGroup" VALUES ('PIE',2021,'ELC_NGA_GRP',0.98*7.56E+01,'PJ');

-- Transport sector
INSERT INTO "MinActivityGroup" VALUES ('PIE',2015,'TRA_FT_LPG_GRP',0.98*4.38E+00,'PJ');
INSERT INTO "MinActivityGroup" VALUES ('PIE',2017,'TRA_FT_LPG_GRP',0.98*4.57E+00,'PJ');
INSERT INTO "MinActivityGroup" VALUES ('PIE',2019,'TRA_FT_LPG_GRP',0.98*4.64E+00,'PJ');
INSERT INTO "MinActivityGroup" VALUES ('PIE',2021,'TRA_FT_LPG_GRP',0.98*3.94E+00,'PJ');
INSERT INTO "MinActivityGroup" VALUES ('PIE',2040,'TRA_FT_LPG_GRP',0.00,'PJ');

INSERT INTO "MinActivityGroup" VALUES ('PIE',2012,'TRA_FT_DST_GRP',0.98*7.17E+01,'PJ');
INSERT INTO "MinActivityGroup" VALUES ('PIE',2014,'TRA_FT_DST_GRP',0.98*6.98E+01,'PJ');
INSERT INTO "MinActivityGroup" VALUES ('PIE',2019,'TRA_FT_DST_GRP',0.98*7.31E+01,'PJ');

INSERT INTO "MinActivityGroup" VALUES ('PIE',2014,'TRA_FT_NGA_GRP',0.98*7.23E-01,'PJ');
INSERT INTO "MinActivityGroup" VALUES ('PIE',2017,'TRA_FT_NGA_GRP',0.98*9.55E-01,'PJ');
INSERT INTO "MinActivityGroup" VALUES ('PIE',2020,'TRA_FT_NGA_GRP',0.98*8.81E-01,'PJ');
INSERT INTO "MinActivityGroup" VALUES ('PIE',2021,'TRA_FT_NGA_GRP',0.98*9.53E-01,'PJ');
INSERT INTO "MinActivityGroup" VALUES ('PIE',2040,'TRA_FT_NGA_GRP',0.00,'PJ');


-- Industrial sector
-- Fuel technologies
INSERT INTO "MinActivityGroup" VALUES ('PIE',2012,'IND_FT_NGA_GRP',0.99*4.08E+01,'PJ');
INSERT INTO "MinActivityGroup" VALUES ('PIE',2014,'IND_FT_NGA_GRP',0.99*4.03E+01,'PJ');
INSERT INTO "MinActivityGroup" VALUES ('PIE',2015,'IND_FT_NGA_GRP',0.98*4.14E+01,'PJ');
INSERT INTO "MinActivityGroup" VALUES ('PIE',2017,'IND_FT_NGA_GRP',0.98*5.10E+01,'PJ');
INSERT INTO "MinActivityGroup" VALUES ('PIE',2020,'IND_FT_NGA_GRP',0.99*4.40E+01,'PJ');
INSERT INTO "MinActivityGroup" VALUES ('PIE',2021,'IND_FT_NGA_GRP',0.99*4.73E+01,'PJ');
INSERT INTO "MinActivityGroup" VALUES ('PIE',2013,'IND_FT_LPG_GRP',0.95*4.95E-01,'PJ');
INSERT INTO "MinActivityGroup" VALUES ('PIE',2014,'IND_FT_LPG_GRP',0.95*4.28E-01,'PJ');
INSERT INTO "MinActivityGroup" VALUES ('PIE',2017,'IND_FT_LPG_GRP',0.97*4.83E-01,'PJ');
INSERT INTO "MinActivityGroup" VALUES ('PIE',2019,'IND_FT_LPG_GRP',0.97*4.78E-01,'PJ');
INSERT INTO "MinActivityGroup" VALUES ('PIE',2020,'IND_FT_LPG_GRP',0.97*5.70E-01,'PJ');
INSERT INTO "MinActivityGroup" VALUES ('PIE',2021,'IND_FT_LPG_GRP',0.97*6.09E-01,'PJ');
INSERT INTO "MinActivityGroup" VALUES ('PIE',2050,'IND_FT_NGA_GRP',0.00,'PJ');

CREATE TABLE "MaxActivityGroup" (
   "regions" text,
   "periods"  integer,
   "group_name"   text,
   "max_act_g"    real,
   "notes"    text,
   primary key("regions","periods","group_name")
);

-- Transport sector
INSERT INTO "MaxActivityGroup" VALUES ('PIE',2012,'TRA_FT_LPG_GRP',1.05*4.04E+00,'PJ');
INSERT INTO "MaxActivityGroup" VALUES ('PIE',2013,'TRA_FT_LPG_GRP',1.05*4.21E+00,'PJ');
INSERT INTO "MaxActivityGroup" VALUES ('PIE',2019,'TRA_FT_LPG_GRP',1.05*4.64E+00,'PJ');
INSERT INTO "MaxActivityGroup" VALUES ('PIE',2021,'TRA_FT_LPG_GRP',1.05*3.94E+00,'PJ');

INSERT INTO "MaxActivityGroup" VALUES ('PIE',2012,'TRA_FT_NGA_GRP',1.05*9.07E-01,'PJ');
INSERT INTO "MaxActivityGroup" VALUES ('PIE',2013,'TRA_FT_NGA_GRP',1.05*8.75E-01,'PJ');
INSERT INTO "MaxActivityGroup" VALUES ('PIE',2014,'TRA_FT_NGA_GRP',1.05*7.23E-01,'PJ');
INSERT INTO "MaxActivityGroup" VALUES ('PIE',2017,'TRA_FT_NGA_GRP',1.03*9.55E-01,'PJ');
INSERT INTO "MaxActivityGroup" VALUES ('PIE',2021,'TRA_FT_NGA_GRP',1.02*9.53E-01,'PJ');


INSERT INTO "MaxActivityGroup" VALUES ('PIE',2012,'TRA_FT_DST_GRP',1.03*7.17E+01,'PJ');
INSERT INTO "MaxActivityGroup" VALUES ('PIE',2013,'TRA_FT_DST_GRP',1.03*6.94E+01,'PJ');
INSERT INTO "MaxActivityGroup" VALUES ('PIE',2015,'TRA_FT_DST_GRP',1.03*7.09E+01,'PJ');
INSERT INTO "MaxActivityGroup" VALUES ('PIE',2019,'TRA_FT_DST_GRP',1.03*7.31E+01,'PJ');
INSERT INTO "MaxActivityGroup" VALUES ('PIE',2020,'TRA_FT_DST_GRP',1.03*5.67E+01,'PJ');
INSERT INTO "MaxActivityGroup" VALUES ('PIE',2021,'TRA_FT_DST_GRP',1.03*6.25E+01,'PJ');

INSERT INTO "MaxActivityGroup" VALUES ('PIE',2012,'TRA_FT_BIODST_GRP',1.03*3.79E+00,'PJ');

INSERT INTO "MaxActivityGroup" VALUES ('PIE',2012,'TRA_FT_GSL_GRP',1.02*2.61E+01,'PJ');
INSERT INTO "MaxActivityGroup" VALUES ('PIE',2013,'TRA_FT_GSL_GRP',1.02*2.40E+01,'PJ');
INSERT INTO "MaxActivityGroup" VALUES ('PIE',2017,'TRA_FT_GSL_GRP',1.02*2.35E+01,'PJ');
INSERT INTO "MaxActivityGroup" VALUES ('PIE',2019,'TRA_FT_GSL_GRP',1.02*2.38E+01,'PJ');
INSERT INTO "MaxActivityGroup" VALUES ('PIE',2020,'TRA_FT_GSL_GRP',1.05*1.86E+01,'PJ');
INSERT INTO "MaxActivityGroup" VALUES ('PIE',2021,'TRA_FT_GSL_GRP',2.22E+01,'PJ');

-- Residential sector
INSERT INTO "MaxActivityGroup" VALUES ('PIE',2012,'RES_FT_DST_GRP',1.05*1.51E+00,'PJ');
INSERT INTO "MaxActivityGroup" VALUES ('PIE',2017,'RES_FT_DST_GRP',1.05*1.16E+00,'PJ');

INSERT INTO "MaxActivityGroup" VALUES ('PIE',2012,'RES_FT_SOL_GRP',1.05*6.83E-01,'PJ');
INSERT INTO "MaxActivityGroup" VALUES ('PIE',2013,'RES_FT_SOL_GRP',1.05*7.65E-01,'PJ');
INSERT INTO "MaxActivityGroup" VALUES ('PIE',2015,'RES_FT_SOL_GRP',1.05*7.94E-01,'PJ');

INSERT INTO "MaxActivityGroup" VALUES ('PIE',2012,'RES_FT_LPG_GRP',1.05*3.60E+00,'PJ');
INSERT INTO "MaxActivityGroup" VALUES ('PIE',2013,'RES_FT_LPG_GRP',1.05*3.46E+00,'PJ');
INSERT INTO "MaxActivityGroup" VALUES ('PIE',2017,'RES_FT_LPG_GRP',1.05*3.38E+00,'PJ');
INSERT INTO "MaxActivityGroup" VALUES ('PIE',2012,'RES_FT_HFO_GRP',1.05*3.17E-01,'PJ');

INSERT INTO "MaxActivityGroup" VALUES ('PIE',2012,'RES_FT_BIO_GRP',1.05*2.63E+01,'PJ');
INSERT INTO "MaxActivityGroup" VALUES ('PIE',2014,'RES_FT_BIO_GRP',1.05*2.45E+01,'PJ');

INSERT INTO "MaxActivityGroup" VALUES ('PIE',2012,'RES_FT_NGA_GRP',7.32E+01,'PJ');
INSERT INTO "MaxActivityGroup" VALUES ('PIE',2017,'RES_FT_NGA_GRP',6.72E+01,'PJ');
-- Fuel technologies
-- Electricity sector
INSERT INTO "MaxActivityGroup" VALUES ('PIE',2014,'ELC_BIO_GRP',1.05*6.23E+00,'PJ');
INSERT INTO "MaxActivityGroup" VALUES ('PIE',2015,'ELC_BIO_GRP',1.05*6.88E+00,'PJ');
INSERT INTO "MaxActivityGroup" VALUES ('PIE',2019,'ELC_BIO_GRP',1.05*6.42E+00,'PJ');

INSERT INTO "MaxActivityGroup" VALUES ('PIE',2012,'ELC_SOL_GRP',1.03*5.07E+00,'PJ');
INSERT INTO "MaxActivityGroup" VALUES ('PIE',2014,'ELC_SOL_GRP',5.81E+00,'PJ');
INSERT INTO "MaxActivityGroup" VALUES ('PIE',2015,'ELC_SOL_GRP',6.16E+00,'PJ');

INSERT INTO "MaxActivityGroup" VALUES ('PIE',2012,'ELC_HYD_GRP',2.53E+01,'PJ');
INSERT INTO "MaxActivityGroup" VALUES ('PIE',2013,'ELC_HYD_GRP',2.99E+01,'PJ');
INSERT INTO "MaxActivityGroup" VALUES ('PIE',2017,'ELC_HYD_GRP',2.42E+01,'PJ');
INSERT INTO "MaxActivityGroup" VALUES ('PIE',2019,'ELC_HYD_GRP',2.91E+01,'PJ');
INSERT INTO "MaxActivityGroup" VALUES ('PIE',2021,'ELC_HYD_GRP',2.29E+01,'PJ');

INSERT INTO "MaxActivityGroup" VALUES ('PIE',2012,'ELC_WIN_GRP',1.02*7.31E-02,'PJ');
INSERT INTO "MaxActivityGroup" VALUES ('PIE',2017,'ELC_WIN_GRP',1.02*1.03E-01,'PJ');
INSERT INTO "MaxActivityGroup" VALUES ('PIE',2019,'ELC_WIN_GRP',1.02*1.05E-01,'PJ');
INSERT INTO "MaxActivityGroup" VALUES ('PIE',2021,'ELC_WIN_GRP',1.02*9.97E-02,'PJ');
INSERT INTO "MaxActivityGroup" VALUES ('PIE',2012,'ELC_NGA_GRP',1.02*5.97E+01,'PJ');
INSERT INTO "MaxActivityGroup" VALUES ('PIE',2014,'ELC_NGA_GRP',1.05*4.46E+01,'PJ');
INSERT INTO "MaxActivityGroup" VALUES ('PIE',2017,'ELC_NGA_GRP',1.02*6.78E+01,'PJ');

---- Industrial sector
INSERT INTO "MaxActivityGroup" VALUES ('PIE',2012,'IND_FT_NGA_GRP',1.02*4.08E+01,'PJ');
INSERT INTO "MaxActivityGroup" VALUES ('PIE',2014,'IND_FT_NGA_GRP',1.03*4.03E+01,'PJ');
INSERT INTO "MaxActivityGroup" VALUES ('PIE',2017,'IND_FT_NGA_GRP',1.03*5.10E+01,'PJ');
INSERT INTO "MaxActivityGroup" VALUES ('PIE',2020,'IND_FT_NGA_GRP',1.03*4.40E+01,'PJ');
INSERT INTO "MaxActivityGroup" VALUES ('PIE',2021,'IND_FT_NGA_GRP',1.03*4.73E+01,'PJ');
INSERT INTO "MaxActivityGroup" VALUES ('PIE',2013,'IND_FT_LPG_GRP',4.95E-01,'PJ');
INSERT INTO "MaxActivityGroup" VALUES ('PIE',2017,'IND_FT_LPG_GRP',4.83E-01,'PJ');
INSERT INTO "MaxActivityGroup" VALUES ('PIE',2012,'IND_FT_HFO_GRP',1.02*2.53E+00,'PJ');
INSERT INTO "MaxActivityGroup" VALUES ('PIE',2012,'IND_FT_PTC_GRP',1.05*3.85E+00,'PJ');
INSERT INTO "MaxActivityGroup" VALUES ('PIE',2015,'IND_FT_PTC_GRP',1.05*2.72E+00	,'PJ');
INSERT INTO "MaxActivityGroup" VALUES ('PIE',2017,'IND_FT_PTC_GRP',1.05*1.99E+00	,'PJ');

--Commercial sector
INSERT INTO "MaxActivityGroup" VALUES ('PIE',2012,'COM_FT_DST_GRP',1.02*7.97E-01,'PJ');
INSERT INTO "MaxActivityGroup" VALUES ('PIE',2015,'COM_FT_DST_GRP',1.02*5.62E-01,'PJ');
INSERT INTO "MaxActivityGroup" VALUES ('PIE',2020,'COM_FT_DST_GRP',0.5355,'PJ');
INSERT INTO "MaxActivityGroup" VALUES ('PIE',2021,'COM_FT_DST_GRP',1.02*6.77E-01,'PJ');


CREATE TABLE "MinCapacityGroup" (
	"regions" text,
   "periods"	integer,
	"group_name"	text,
	"min_cap_g"	real,
	"notes"	text,
	PRIMARY KEY("regions","periods","group_name")
);
CREATE TABLE "MaxCapacityGroup" (
	"regions" text,
   "periods"	integer,
	"group_name"	text,
	"max_cap_g"	real,
	"notes"	text,
	PRIMARY KEY("regions","periods","group_name")
);
-- Electricity sector
INSERT INTO "MaxCapacityGroup" VALUES ('PIE',2012,'ELC_NGA_GRP',6.15,'GW');


CREATE TABLE "MinActivity" (
   "regions"  text,
   "periods"  integer,
   "tech" text,
   "minact"   real,
   "minact_units" text,
   "minact_notes" text,
   primary key("regions","periods","tech"),
   foreign key("tech") references "technologies"("tech"),
   foreign key("periods") references "time_periods"("t_periods")
);
--Agricultire sector

INSERT INTO "MinActivity" VALUES ('PIE',2020,'AGR_FT_LPG_E',0.98*5.70E-01,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2021,'AGR_FT_NGA_E',0.98*2.75E+01,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2021,'AGR_FT_LPG_E',0.98*6.09E-01,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2012,'AGR_FT_ELC_E',1.19E+00,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2015,'AGR_FT_ELC_E',1.26E+00,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2020,'AGR_FT_ELC_E',1.37E+00,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2021,'AGR_FT_ELC_E',1.62E+00,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2023,'AGR_FT_ELC_E',1.08*1.62E+00,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2021,'AGR_FT_DST_E',0.98*4.17E+00,'PJ','');

-- Upstream sector

INSERT INTO "MinActivity" VALUES ('PIE',2020,'UPS_IMP_OIL_PTC',0.10*24.93,'PJ','10% of TEMOA_IT');
INSERT INTO "MinActivity" VALUES ('PIE',2050,'UPS_IMP_OIL_PTC',0.00,'PJ','10% of TEMOA_IT');

-- Electricity sector
INSERT INTO "MinActivity" VALUES ('PIE',2012,'ELC_NGA_CC_E',1.52E+01,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2012,'ELC_NGA_STM_REP_E',1.30E+00,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2012,'ELC_NGA_TURB_E',2.49E-02,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2012,'ELC_CHP_NGA_CC_E',3.00E+01,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2012,'ELC_CHP_NGA_TURB_E',2.09E+00,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2012,'ELC_CHP_NGA_STM_COND_E',4.41E+00,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2012,'ELC_CHP_BMU_E',3.49E-01,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2012,'ELC_CHP_BIO_E',3.72E-01,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2012,'ELC_BGS_E',1.47E+00,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2012,'ELC_BIO_E',2.53E-01,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2012,'ELC_SOL_E',2.66E+00,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2012,'ELC_HYD_FLO_E',1.18E+01,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2012,'ELC_HYD_RES_E',9.18E+00,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2012,'ELC_HYD_PUM_E',1.33E+00,'PJ','');

INSERT INTO "MinActivity" VALUES ('PIE',2015,'ELC_NGA_CC_E',1.35E+01,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2015,'ELC_NGA_STM_REP_E',1.15E+00,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2015,'ELC_NGA_TURB_E',2.22E-02,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2015,'ELC_CHP_NGA_TURB_E',1.86E+00,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2015,'ELC_CHP_NGA_STM_COND_E',3.92E+00,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2015,'ELC_CHP_BMU_E',3.10E-01,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2015,'ELC_CHP_BIO_E',3.31E-01,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2015,'ELC_BGS_E',1.30E+00,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2015,'ELC_BIO_E',2.25E-01,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2015,'ELC_SOL_E',2.36E+00,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2015,'ELC_HYD_FLO_E',1.05E+01,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2015,'ELC_HYD_RES_E',8.16E+00,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2015,'ELC_HYD_PUM_E',1.18E+00,'PJ','');

INSERT INTO "MinActivity" VALUES ('PIE',2025,'ELC_NGA_CC_E',0.00,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2025,'ELC_NGA_STM_REP_E',0.00,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2025,'ELC_NGA_TURB_E',0.00,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2025,'ELC_CHP_NGA_CC_E',0.00,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2035,'ELC_CHP_NGA_TURB_E',0.00,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2025,'ELC_CHP_NGA_STM_COND_E',0.00,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2025,'ELC_CHP_BMU_E',0.00,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2025,'ELC_CHP_BIO_E',0.00,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2025,'ELC_BGS_E',0.00,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2025,'ELC_BIO_E',0.00,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2035,'ELC_SOL_E',0.00,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2040,'ELC_HYD_FLO_E',0.00,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2040,'ELC_HYD_RES_E',0.00,'PJ','');

-- Transport sector
-- Fuel technologies
INSERT INTO "MinActivity" VALUES ('PIE',2012,'TRA_FT_ELC',0.95*3.07E+00,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2013,'TRA_FT_ELC',0.98*3.02E+00,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2014,'TRA_FT_ELC',0.98*2.93E+00,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2017,'TRA_FT_ELC',0.98*3.22E+00,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2021,'TRA_FT_ELC',0.95*2.54E+00,'PJ','');

-- Technologies
INSERT INTO "MinActivity" VALUES ('PIE',2012,'TRA_ROA_CAR_GSL_E',0.95*6.89E+00,'Bvkm','90% of base year');
INSERT INTO "MinActivity" VALUES ('PIE',2012,'TRA_ROA_CAR_DST_E',1.22E+01,'Bvkm','90% of base year');
INSERT INTO "MinActivity" VALUES ('PIE',2012,'TRA_ROA_CAR_NGA_E',0.90*2.503E-01,'Bvkm','90% of base year');
INSERT INTO "MinActivity" VALUES ('PIE',2021,'TRA_ROA_CAR_NGA_E',0.00,'Bvkm','90% of base year');
INSERT INTO "MinActivity" VALUES ('PIE',2021,'TRA_ROA_CAR_GSL_E',0.0,'Bvkm','');
INSERT INTO "MinActivity" VALUES ('PIE',2021,'TRA_ROA_CAR_DST_E',0.0,'Bvkm','');

--New Technologies
-- Commercial sector
-- Fuel technologies

INSERT INTO "MinActivity" VALUES ('PIE',2012,'COM_FT_ELC_EN',0.99*2.61E+01,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2013,'COM_FT_ELC_EN',0.99*2.62E+01,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2015,'COM_FT_ELC_EN',0.98*2.70E+01,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2017,'COM_FT_ELC_EN',0.99*2.76E+01,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2019,'COM_FT_ELC_EN',0.98*2.67E+01,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2017,'COM_FT_LPG_EN',0.98*4.83E-01,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2019,'COM_FT_LPG_EN',0.98*4.78E-01,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2020,'COM_FT_LPG_EN',0.98*5.70E-01,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2021,'COM_FT_NGA_N',0.98*5.39E+00,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2012,'COM_FT_HET_EN',0.90*1.61E+00,'PJ','');

-- Base year technologies
INSERT INTO "MinActivity" VALUES ('PIE',2012,'COM_SH_HEX_HET_E',0.90*1.46E+00,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2025,'COM_SH_HEX_HET_E',0.00,'PJ','');


INSERT INTO "MinActivity" VALUES ('PIE',2012,'COM_SH_HT_NGA_E',2.39E+01,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2012,'COM_SH_HP_NGA_E',6.57E-01,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2012,'COM_SH_HT_DST_E',3.39E-01,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2012,'COM_SH_HT_LPG_E',2.02E-01,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2012,'COM_SH_RES_ELC_E',4.07E-01,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2012,'COM_SH_HP_ELC_E',2.71E+00,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2035,'COM_SH_HT_NGA_E',0.00,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2035,'COM_SH_HP_NGA_E',0.00,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2035,'COM_SH_HT_DST_E',0.00,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2035,'COM_SH_HT_LPG_E',0.00,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2030,'COM_SH_RES_ELC_E',0.00,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2035,'COM_SH_HP_ELC_E',0.00,'PJ','');

INSERT INTO "MinActivity" VALUES ('PIE',2012,'COM_SC_ABS_NGA_E',2.36E+00,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2012,'COM_SC_CHL_DST_E',3.97E-02,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2012,'COM_SC_CCL_ELC_CNT_E',5.76E+00,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2012,'COM_SC_AHP_ELC_E',3.28E-02,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2012,'COM_SC_ROOM_ELC_E',1.20E+00,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2012,'COM_SC_ROOF_ELC_E',3.72E+00,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2035,'COM_SC_ABS_NGA_E',0.00,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2035,'COM_SC_CHL_DST_E',0.00,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2035,'COM_SC_CCL_ELC_CNT_E',0.00,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2030,'COM_SC_AHP_ELC_E',0.00,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2030,'COM_SC_ROOM_ELC_E',0.00,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2035,'COM_SC_ROOF_ELC_E',0.00,'PJ','');

INSERT INTO "MinActivity" VALUES ('PIE',2012,'COM_WH_NGA_E',7.66E-01,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2012,'COM_WH_DST_E',3.84E-02,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2012,'COM_WH_LPG_E',7.55E-02,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2012,'COM_WH_ELC_E',1.03E+00,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2035,'COM_WH_NGA_E',0.00,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2035,'COM_WH_DST_E',0.00,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2035,'COM_WH_LPG_E',0.00,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2035,'COM_WH_ELC_E',0.00,'PJ','');

INSERT INTO "MinActivity" VALUES ('PIE',2012,'COM_LG_INC_E',2.38E-01,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2012,'COM_LG_SHAL_E',1.08E-01,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2012,'COM_LG_IRCHAL_E',1.42E-01,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2012,'COM_LG_SFL_E',1.43E+01,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2012,'COM_LG_LFL_E',0.90*1.55E+01,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2012,'COM_LG_CFL_C_E',3.62E+00,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2012,'COM_LG_MER_E',2.17E+00,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2012,'COM_LG_SOD_E',5.43E-01,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2017,'COM_LG_INC_E',0.00,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2017,'COM_LG_SHAL_E',0.00,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2017,'COM_LG_IRCHAL_E',0.00,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2017,'COM_LG_SFL_E',0.00,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2015,'COM_LG_LFL_E',0.00,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2017,'COM_LG_CFL_C_E',0.00,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2017,'COM_LG_MER_E',0.00,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2017,'COM_LG_SOD_E',0.00,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2012,'COM_CK_NGA_E',7.85E-01,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2012,'COM_CK_LPG_E',2.01E-02,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2012,'COM_CK_ELC_E',2.13E-01,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2035,'COM_CK_NGA_E',0.00,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2025,'COM_CK_LPG_E',0.00,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2025,'COM_CK_ELC_E',0.00,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2012,'COM_RF_RFR_ELC_E',1.58E+00,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2023,'COM_RF_RFR_ELC_E',0.00,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2012,'COM_OE_OFF_ELC_E',8.14E+00,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2025,'COM_OE_OFF_ELC_E',0.0E+00,'PJ','');

-- Residential sector
-- Fuel technologies

INSERT INTO "MinActivity" VALUES ('PIE',2012,'RES_FT_SOL_E',0.90*6.83E-01,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2030,'RES_FT_SOL_E',0.0,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2012,'RES_FT_NGA_E',0.95*7.28E+01,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2012,'RES_FT_LPG_E',0.94*3.60E+00,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2012,'RES_FT_HFO_E',0.95*3.17E-01,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2012,'RES_FT_DST_E',0.95*1.51E+00,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2020,'RES_FT_SOL_N',4.30E-01,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2030,'RES_FT_NGA_E',0.0,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2030,'RES_FT_LPG_E',0.0,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2030,'RES_FT_HFO_E',0.0,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2030,'RES_FT_DST_E',0.0,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2030,'RES_FT_ELC_E',0.0,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2021,'RES_FT_NGA_N',1.43E+01,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2020,'RES_FT_ELC_N',2.44E+00,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2021,'RES_FT_ELC_N',3.63E+00,'PJ','');

---- Base year technologies
INSERT INTO "MinActivity" VALUES ('PIE',2012,'RES_SH_HP_ELC_LC_E',0.90*7.927*0.18*3.20E-03,'Mm2','');
INSERT INTO "MinActivity" VALUES ('PIE',2012,'RES_SH_HT_ELC_LC_E',0.95*7.927*0.18*1.25E-02,'Mm2','');
INSERT INTO "MinActivity" VALUES ('PIE',2012,'RES_SH_AHP_NGA_LC_E',0.85*9.18E-02,'Mm2','');
INSERT INTO "MinActivity" VALUES ('PIE',2012,'RES_SH_BUR_NGA_LC_E',6.09E-01,'Mm2','');
INSERT INTO "MinActivity" VALUES ('PIE',2012,'RES_SH_BUR_DST_LC_E',1.85E-02,'Mm2','');
INSERT INTO "MinActivity" VALUES ('PIE',2012,'RES_SH_WST_BIO_LC_E',0.85*7.927*0.18*6.76E-02,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2012,'RES_SH_HEX_HET_LC_E',9.18E-02,'Mm2','');
INSERT INTO "MinActivity" VALUES ('PIE',2025,'RES_SH_HP_ELC_LC_E',0.00,'Mm2','');
INSERT INTO "MinActivity" VALUES ('PIE',2025,'RES_SH_HT_ELC_LC_E',0.00,'Mm2','');
INSERT INTO "MinActivity" VALUES ('PIE',2020,'RES_SH_AHP_NGA_LC_E',0.00,'Mm2','');
INSERT INTO "MinActivity" VALUES ('PIE',2025,'RES_SH_BUR_NGA_LC_E',0.00,'Mm2','');
INSERT INTO "MinActivity" VALUES ('PIE',2025,'RES_SH_BUR_DST_LC_E',0.00,'Mm2','');
INSERT INTO "MinActivity" VALUES ('PIE',2025,'RES_SH_WST_BIO_LC_E',0.00,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2025,'RES_SH_HEX_HET_LC_E',0.00,'Mm2','');

INSERT INTO "MinActivity" VALUES ('PIE',2012,'RES_SH_HP_ELC_MC_E',0.90*3.356*0.18*0.025,'Mm2','');
INSERT INTO "MinActivity" VALUES ('PIE',2012,'RES_SH_HT_ELC_MC_E',1.00E-02,'Mm2','');
INSERT INTO "MinActivity" VALUES ('PIE',2012,'RES_SH_AHP_NGA_MC_E',4.19E-02,'Mm2','');
INSERT INTO "MinActivity" VALUES ('PIE',2012,'RES_SH_BUR_NGA_MC_E',0.85*3.356*0.18*8.53E+00,'Mm2','');
INSERT INTO "MinActivity" VALUES ('PIE',2012,'RES_SH_BUR_LPG_MC_E',1.67E-01,'Mm2','');
INSERT INTO "MinActivity" VALUES ('PIE',2012,'RES_SH_BUR_DST_MC_E',0.80*3.356*0.18*2.75E+00,'Mm2','');
INSERT INTO "MinActivity" VALUES ('PIE',2012,'RES_SH_BUR_HFO_MC_E',0.80*3.356*0.18*8.00E-02,'Mm2','');
INSERT INTO "MinActivity" VALUES ('PIE',2012,'RES_SH_WST_BIO_MC_E',4.59E-02,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2012,'RES_SH_HEX_HET_MC_E',1.95E-01,'Mm2','');
INSERT INTO "MinActivity" VALUES ('PIE',2020,'RES_SH_HP_ELC_MC_E',0.00,'Mm2','');
INSERT INTO "MinActivity" VALUES ('PIE',2025,'RES_SH_HT_ELC_MC_E',0.00,'Mm2','');
INSERT INTO "MinActivity" VALUES ('PIE',2020,'RES_SH_AHP_NGA_MC_E',0.00,'Mm2','');
INSERT INTO "MinActivity" VALUES ('PIE',2025,'RES_SH_BUR_NGA_MC_E',0.00,'Mm2','');
INSERT INTO "MinActivity" VALUES ('PIE',2025,'RES_SH_BUR_LPG_MC_E',0.00,'Mm2','');
INSERT INTO "MinActivity" VALUES ('PIE',2025,'RES_SH_BUR_DST_MC_E',0.00,'Mm2','');
INSERT INTO "MinActivity" VALUES ('PIE',2035,'RES_SH_BUR_HFO_MC_E',0.00,'Mm2','');
INSERT INTO "MinActivity" VALUES ('PIE',2025,'RES_SH_WST_BIO_MC_E',0.00,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2025,'RES_SH_HEX_HET_MC_E',0.00,'Mm2','');

INSERT INTO "MinActivity" VALUES ('PIE',2012,'RES_SH_HP_ELC_HC_E',2.36E-01,'Mm2','');
INSERT INTO "MinActivity" VALUES ('PIE',2012,'RES_SH_BUR_LPG_HC_E',4.69E+00,'Mm2','');
INSERT INTO "MinActivity" VALUES ('PIE',2012,'RES_SH_HT_ELC_HC_E',1.24E+00,'Mm2','');
INSERT INTO "MinActivity" VALUES ('PIE',2012,'RES_SH_WST_BIO_HC_E',0.90*2.273*0.18*6.40E+00,'Mm2','');
INSERT INTO "MinActivity" VALUES ('PIE',2012,'RES_SH_BUR_HFO_HC_E',4.68E-01,'Mm2','');
INSERT INTO "MinActivity" VALUES ('PIE',2012,'RES_SH_BUR_DST_HC_E',1.21E+00,'Mm2','');
INSERT INTO "MinActivity" VALUES ('PIE',2025,'RES_SH_HP_ELC_HC_E',0.00,'Mm2','');
INSERT INTO "MinActivity" VALUES ('PIE',2025,'RES_SH_BUR_LPG_HC_E',0.00,'Mm2','');
INSERT INTO "MinActivity" VALUES ('PIE',2025,'RES_SH_HT_ELC_HC_E',0.00,'Mm2','');
INSERT INTO "MinActivity" VALUES ('PIE',2025,'RES_SH_WST_BIO_HC_E',0.00,'Mm2','');
INSERT INTO "MinActivity" VALUES ('PIE',2035,'RES_SH_BUR_HFO_HC_E',0.00,'Mm2','');
INSERT INTO "MinActivity" VALUES ('PIE',2025,'RES_SH_BUR_DST_HC_E',0.00,'Mm2','');


INSERT INTO "MinActivity" VALUES ('PIE',2012,'RES_WH_NGA_E',1.02*2.77E+00,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2012,'RES_WH_DST_E',1.02*8.85E-02,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2012,'RES_WH_LPG_E',0.90*3.23E-01,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2012,'RES_WH_ELC_E',1.02*2.41E+00,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2012,'RES_WH_HET_E',0.95*1.29E-01,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2012,'RES_WH_BIO_E',0.90*5.10E-01,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2030,'RES_WH_NGA_E',0.00,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2030,'RES_WH_DST_E',0.00,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2030,'RES_WH_LPG_E',0.00,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2030,'RES_WH_ELC_E',0.00,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2030,'RES_WH_HET_E',0.00,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2030,'RES_WH_BIO_E',0.00,'PJ','');

INSERT INTO "MinActivity" VALUES ('PIE',2012,'RES_DW_ELC_E',0.90*2.04E-01,'Glav','');
INSERT INTO "MinActivity" VALUES ('PIE',2020,'RES_DW_ELC_E',0.00,'Glav','');

INSERT INTO "MinActivity" VALUES ('PIE',2012,'RES_CK_ELC_E',0.90*8.78E-01,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2020,'RES_CK_ELC_E',0.00,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2012,'RES_CK_LPG_E',1.72E-01,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2020,'RES_CK_LPG_E',0.00,'PJ','');

INSERT INTO "MinActivity" VALUES ('PIE',2012,'RES_RF_FRZ_ELC_E',0.90*1.35E-01,'Gl','');
INSERT INTO "MinActivity" VALUES ('PIE',2012,'RES_RF_RFG_ELC_E',4.96E-01,'Gl','');
INSERT INTO "MinActivity" VALUES ('PIE',2020,'RES_RF_FRZ_ELC_E',0.00,'Gl','');
INSERT INTO "MinActivity" VALUES ('PIE',2020,'RES_RF_RFG_ELC_E',0.00,'Gl','');

INSERT INTO "MinActivity" VALUES ('PIE',2012,'RES_LG_LHAL_E',0.90*3.20E-01,'Glm','');
INSERT INTO "MinActivity" VALUES ('PIE',2012,'RES_LG_SHAL_IMP_E',0.90*4.89E-01,'Glm','');
INSERT INTO "MinActivity" VALUES ('PIE',2012,'RES_LG_SHAL_E',0.90*6.77E-01,'Glm','');
INSERT INTO "MinActivity" VALUES ('PIE',2012,'RES_LG_LFL_E',0.90*2.08E+01,'Glm','');
INSERT INTO "MinActivity" VALUES ('PIE',2012,'RES_LG_SFL_E',0.90*1.20E+01,'Glm','');
INSERT INTO "MinActivity" VALUES ('PIE',2012,'RES_LG_MIN_E',0.90*9.79E+00,'Glm','');
INSERT INTO "MinActivity" VALUES ('PIE',2012,'RES_LG_SIN_E',0.90*8.28E+00,'Glm','');
INSERT INTO "MinActivity" VALUES ('PIE',2020,'RES_LG_LHAL_E',0.00,'Glm','');
INSERT INTO "MinActivity" VALUES ('PIE',2020,'RES_LG_SHAL_IMP_E',0.00,'Glm','');
INSERT INTO "MinActivity" VALUES ('PIE',2020,'RES_LG_SHAL_E',0.00,'Glm','');
INSERT INTO "MinActivity" VALUES ('PIE',2020,'RES_LG_LFL_E',0.00,'Glm','');
INSERT INTO "MinActivity" VALUES ('PIE',2020,'RES_LG_SFL_E',0.00,'Glm','');
INSERT INTO "MinActivity" VALUES ('PIE',2020,'RES_LG_MIN_E',0.00,'Glm','');
INSERT INTO "MinActivity" VALUES ('PIE',2020,'RES_LG_SIN_E',0.00,'Glm','');

-- Industrial sector
-- Fuel technologies
INSERT INTO "MinActivity" VALUES ('PIE',2012,'IND_FT_ELC_EN',0.99*4.40E+01,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2014,'IND_FT_ELC_EN',0.98*4.22E+01,'PJ','consumo elettrico nel 2014');
INSERT INTO "MinActivity" VALUES ('PIE',2015,'IND_FT_ELC_EN',0.99*4.30E+01,'PJ','99% of 2015 consumption');
INSERT INTO "MinActivity" VALUES ('PIE',2019,'IND_FT_ELC_EN',0.99*4.14E+01,'PJ','99% of 2019 consumption');
INSERT INTO "MinActivity" VALUES ('PIE',2021,'IND_FT_ELC_EN',0.99*4.38E+01,'PJ','99% of 2021 consumption');
INSERT INTO "MinActivity" VALUES ('PIE',2012,'IND_FT_NGA_E',3.67E+01,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2035,'IND_FT_NGA_E',0.00,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2012,'IND_FT_BFG_E',0.92*1.43E-02,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2035,'IND_FT_BFG_E',0.00,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2012,'IND_FT_BIO_E',0.92*9.22E-01,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2035,'IND_FT_BIO_E',0.00,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2012,'IND_FT_COA_E',0.92*3.11E+00,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2035,'IND_FT_COA_E',0.00,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2012,'IND_FT_ETH_E',0.92*2.04E+00,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2035,'IND_FT_ETH_E',0.00,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2012,'IND_FT_HFO_E',0.90*2.53E+00,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2012,'IND_FT_PTC_E',9.12E-01,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2035,'IND_FT_HFO_E',0.00,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2012,'IND_FT_OIL_E',0.96*1.31E+00,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2019,'IND_FT_OIL_E',0.96*8.54E-01,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2020,'IND_FT_OIL_E',0.96*1.25E+00,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2035,'IND_FT_OIL_E',0.00,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2012,'IND_FT_LPG_E',0.95*5.14E-01,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2035,'IND_FT_LPG_E',0.00,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2012,'IND_FT_HET_E',0.90*2.81E+00,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2035,'IND_FT_HET_E',0.00,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2035,'IND_FT_PTC_E',0.0,'PJ','');
 -- Base year technologies
 -- Machine drive and steam
INSERT INTO "MinActivity" VALUES ('PIE',2012,'IND_STM_NGA_E',0.85*1.43E+00,'PJ','85% of base year');
INSERT INTO "MinActivity" VALUES ('PIE',2012,'IND_STM_LPG_E',0.90*1.31E-02,'PJ','90% of base year');
INSERT INTO "MinActivity" VALUES ('PIE',2012,'IND_STM_DST_E',0.90*6.38E-02,'PJ','90% of base year');
INSERT INTO "MinActivity" VALUES ('PIE',2012,'IND_STM_BIO_E',0.90*7.07E-02,'PJ','90% of base year');
INSERT INTO "MinActivity" VALUES ('PIE',2012,'IND_STM_COA_E',0.60*1.02E-03,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2012,'IND_STM_HFO_E',0.019922681,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2030,'IND_STM_NGA_E',0.0,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2035,'IND_STM_LPG_E',0.0,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2035,'IND_STM_DST_E',0.0,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2040,'IND_STM_BIO_E',0.0,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2035,'IND_STM_COA_E',0.0,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2035,'IND_STM_HFO_E',0.0,'PJ','');

-- Chemicals
INSERT INTO "MinActivity" VALUES ('PIE',2012,'IND_CH_MTH_E',0.90*3.56E-03,'Mt','90% of base year');
INSERT INTO "MinActivity" VALUES ('PIE',2035,'IND_CH_MTH_E',0.0,'Mt','');
INSERT INTO "MinActivity" VALUES ('PIE',2012,'IND_CH_FS_DST_E',0.90*1.97E-02,'PJ','95% of base year');
INSERT INTO "MinActivity" VALUES ('PIE',2012,'IND_CH_FS_GSL_E',0.90*4.52E-01,'PJ','92% of base year');
INSERT INTO "MinActivity" VALUES ('PIE',2012,'IND_CH_FS_HFO_E',0.85*0.6*1.25E+00,'PJ','92% of base year');
INSERT INTO "MinActivity" VALUES ('PIE',2012,'IND_CH_FS_LPG_E',0.9*4.65E-02,'PJ','90% of exisitn capacity');
INSERT INTO "MinActivity" VALUES ('PIE',2012,'IND_CH_FS_NAP_E',0.90*9.02E-02,'PJ','90% of base year');
INSERT INTO "MinActivity" VALUES ('PIE',2012,'IND_CH_FS_NGA_E',0.9*2.86E-02,'PJ','90% of exisitng capacity');
INSERT INTO "MinActivity" VALUES ('PIE',2012,'IND_CH_FS_NSP_E',0.90*8.38E-02,'PJ','90% of base year');
INSERT INTO "MinActivity" VALUES ('PIE',2012,'IND_CH_FS_RFG_E',0.90*1.40E-02,'PJ','90% of base year');
INSERT INTO "MinActivity" VALUES ('PIE',2012,'IND_CH_OTH_ELC_E',0.80*1.03E-01,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2012,'IND_CH_OLF_E',1.60E-02,'PJ','95% of base year');
INSERT INTO "MinActivity" VALUES ('PIE',2012,'IND_CH_EC_E',0.95*1.31E+00,'PJ','95% of base year');
INSERT INTO "MinActivity" VALUES ('PIE',2012,'IND_CH_AMM_E',0.40*3.64E-02,'Mt','');
INSERT INTO "MinActivity" VALUES ('PIE',2012,'IND_CH_CHL_E',0.95*1.22E-02,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2012,'IND_CH_OTH_DST_E',0.80*3.58E-01,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2012,'IND_CH_OTH_HFO_E',0.95*3.22E-02,'PJ','95% of base year');
INSERT INTO "MinActivity" VALUES ('PIE',2012,'IND_CH_OTH_NGA_E',5.86E-03,'PJ','95% of base year');
INSERT INTO "MinActivity" VALUES ('PIE',2035,'IND_CH_OTH_NGA_E',0.0,'PJ','');

INSERT INTO "MinActivity" VALUES ('PIE',2035,'IND_CH_FS_DST_E',0.0,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2035,'IND_CH_FS_GSL_E',0.0,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2035,'IND_CH_FS_HFO_E',0.0,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2035,'IND_CH_FS_LPG_E',0.0,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2035,'IND_CH_FS_NAP_E',0.0,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2035,'IND_CH_FS_NGA_E',0.0,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2035,'IND_CH_FS_NSP_E',0.0,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2035,'IND_CH_FS_RFG_E',0.0,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2035,'IND_CH_OTH_ELC_E',0.0,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2030,'IND_CH_OLF_E',0.0,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2030,'IND_CH_EC_E',0.0,'Mt','');
INSERT INTO "MinActivity" VALUES ('PIE',2035,'IND_CH_AMM_E',0.0,'Mt','');
INSERT INTO "MinActivity" VALUES ('PIE',2035,'IND_CH_CHL_E',0.0,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2030,'IND_CH_OTH_DST_E',0.0,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2035,'IND_CH_OTH_HFO_E',0.0,'PJ','');
 -- Non metalic minerals
INSERT INTO "MinActivity" VALUES ('PIE',2012,'IND_NM_OTH_ELC_E',0.90*2.69E-01,'PJ','90% of existing capacity');
INSERT INTO "MinActivity" VALUES ('PIE',2012,'IND_NM_GLS_E',2.56E-01,'Mt','');
INSERT INTO "MinActivity" VALUES ('PIE',2012,'IND_NM_CRM_E',2.56E-01,'Mt','');
INSERT INTO "MinActivity" VALUES ('PIE',2012,'IND_NM_OTH_NGA_E',0.90*5.64E-01,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2012,'IND_NM_OTH_LPG_E',0.80*3.31E-02,'PJ','');

INSERT INTO "MinActivity" VALUES ('PIE',2030,'IND_NM_OTH_ELC_E',0.00,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2030,'IND_NM_GLS_E',0.00,'Mt','');
INSERT INTO "MinActivity" VALUES ('PIE',2030,'IND_NM_CRM_E',0.00,'Mt','');
INSERT INTO "MinActivity" VALUES ('PIE',2030,'IND_NM_OTH_NGA_E',0.00,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2030,'IND_NM_OTH_LPG_E',0.00,'PJ','');
-- Pulp and paper
INSERT INTO "MinActivity" VALUES ('PIE',2012,'IND_PP_PH_NGA_E',0.90*2.01E-01,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2012,'IND_PP_PH_ELC_E',8.86E-04,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2012,'IND_PP_PUL_MEC_E',5.97E-04,'PJ','');

INSERT INTO "MinActivity" VALUES ('PIE',2030,'IND_PP_PUL_MEC_E',0.0,'Mt','');
INSERT INTO "MinActivity" VALUES ('PIE',2030,'IND_PP_PH_NGA_E',0.0,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2035,'IND_PP_PH_ELC_E',0.0,'Mt','');

-- Other industries
INSERT INTO "MinActivity" VALUES ('PIE',2012,'IND_OTH_PH_NGA_E',1.13E+01,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2012,'IND_OTH_PH_HFO_E',0.95*3.69E-01,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2012,'IND_OTH_PH_LPG_E',0.0128,'PJ','95% of base year');
INSERT INTO "MinActivity" VALUES ('PIE',2012,'IND_OTH_OTH_ELC_E',1.06E+00,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2012,'IND_OTH_PH_DST_E',4.77E-03,'PJ','');

INSERT INTO "MinActivity" VALUES ('PIE',2030,'IND_OTH_PH_NGA_E',0.0,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2030,'IND_OTH_PH_HFO_E',0.0,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2030,'IND_OTH_PH_LPG_E',0.0,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2035,'IND_OTH_OTH_ELC_E',0.0,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2020,'IND_OTH_PH_DST_E',0.0,'PJ','');
-- Non-ferrous metals
INSERT INTO "MinActivity" VALUES ('PIE',2012,'IND_NF_EC_E',1.32E+00,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2012,'IND_NF_OTH_NGA_E',0.90*9.04E-01,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2012,'IND_NF_OTH_DST_E',0.80*7.45E-02,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2012,'IND_NF_ALU_E',5.12E-04,'PJ','');

INSERT INTO "MinActivity" VALUES ('PIE',2030,'IND_NF_OTH_NGA_E',0.0,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2035,'IND_NF_EC_E',0.0,'Mt','');
INSERT INTO "MinActivity" VALUES ('PIE',2030,'IND_NF_OTH_DST_E',0.0,'PJ','');
INSERT INTO "MinActivity" VALUES ('PIE',2035,'IND_NF_ALU_E',0.0,'PJ','');

-- Iron as steel
INSERT INTO "MinActivity" VALUES ('PIE',2012,'IND_IS_OTH_ELC_E',3.03E-04,'PJ','95% of base year');
INSERT INTO "MinActivity" VALUES ('PIE',2030,'IND_IS_OTH_ELC_E',0.0,'PJ','');

CREATE TABLE "MinCapacity" (
   "regions"  text,
   "periods"  integer,
   "tech" text,
   "mincap"   real,
   "mincap_units" text,
   "mincap_notes" text,
   primary key("regions","periods","tech"),
   foreign key("tech") references "technologies"("tech"),
   foreign key("periods") references "time_periods"("t_periods")
);


CREATE TABLE "MaxCapacity" (
   "regions"  text,
   "periods"  integer,
   "tech" text,
   "maxcap"   real,
   "maxcap_units" text,
   "maxcap_notes" text,
   primary key("regions","periods","tech"),
   foreign key("periods") references "time_periods"("t_periods"),
   foreign key("tech") references "technologies"("tech")
);
--Residential sector
INSERT INTO "MaxCapacity" VALUES ('PIE',2012,'RES_SH_ROOF_INS_HC_N',0.00,'PJ','');
INSERT INTO "MaxCapacity" VALUES ('PIE',2012,'RES_SH_INT_INS_HC_N',0.00,'PJ','');
INSERT INTO "MaxCapacity" VALUES ('PIE',2012,'RES_SH_BASE_INS_HC_N',0.00,'PJ','');
INSERT INTO "MaxCapacity" VALUES ('PIE',2012,'RES_SH_WIN_INS_HC_N',0.00,'PJ','');
INSERT INTO "MaxCapacity" VALUES ('PIE',2012,'RES_SH_ROOF_INS_MC_N',0.00,'PJ','');
INSERT INTO "MaxCapacity" VALUES ('PIE',2012,'RES_SH_INT_INS_MC_N',0.00,'PJ','');
INSERT INTO "MaxCapacity" VALUES ('PIE',2012,'RES_SH_BASE_INS_MC_N',0.00,'PJ','');
INSERT INTO "MaxCapacity" VALUES ('PIE',2012,'RES_SH_WIN_INS_MC_N',0.00,'PJ','');

--Transport sector
INSERT INTO "MaxCapacity" VALUES ('PIE',2030,'TRA_FT_DST_E',0.00E+00,'PJ','');
INSERT INTO "MaxCapacity" VALUES ('PIE',2035,'TRA_FT_DST_E',0.00E+00,'PJ','');
INSERT INTO "MaxCapacity" VALUES ('PIE',2012,'TRA_ELC_DIV',4.58E+00,'PJ','');
INSERT INTO "MaxCapacity" VALUES ('PIE',2012,'TRA_FT_ELC',6.09E+00,'PJ','');

INSERT INTO "MaxCapacity" VALUES ('PIE',2012,'TRA_ROA_CAR_DST_E',2.60E+01,'PJ','');

CREATE TABLE "DiscreteCapacity" (
	"tech"			text,
	"dsccap"		real,
	"dsccap_units"	text,
	"dsccap_notes"	text,
	PRIMARY KEY("tech"),
	FOREIGN KEY("tech") REFERENCES "technologies"("tech")
);
CREATE TABLE "MaxActivity" (
   "regions"  text,
   "periods"  integer,
   "tech" text,
   "maxact"   real,
   "maxact_units" text,
   "maxact_notes" text,
   primary key("regions","periods","tech"),
   foreign key("periods") references "time_periods"("t_periods"),
   foreign key("tech") references "technologies"("tech")
);

-- Transport sector
-- Fuel technologies
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'TRA_DSL_BLN',1.03*8.58E+01,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2017,'TRA_DSL_BLN',1.03*8.03E+01,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'TRA_FT_DST_E',0.95*7.172E+01,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2025,'TRA_FT_DST_E',0.0,'PJ','phased out');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'TRA_FT_GSL_E',0.8*2.61E+01,'PJ','80% of 2012 consumption');
INSERT INTO "MaxActivity" VALUES ('PIE',2025,'TRA_FT_GSL_E',0.0,'PJ','phased out');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'TRA_FT_LPG_E',0.98*4.04E+00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2030,'TRA_FT_LPG_E',0.0,'PJ','phased out');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'TRA_FT_NGA_E',1.05*9.07E-01,'PJ','phased out');
INSERT INTO "MaxActivity" VALUES ('PIE',2025,'TRA_FT_NGA_E',0.0,'PJ','phased out');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'TRA_FT_JTK_E',2.066E+00,'PJ','92.86% of base year');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'TRA_FT_BIO_DST_E',0.90*3.79E+00,'PJ','92.86% of base year');
INSERT INTO "MaxActivity" VALUES ('PIE',2025,'TRA_FT_JTK_E',0.0,'PJ','phased out');
INSERT INTO "MaxActivity" VALUES ('PIE',2025,'TRA_FT_BIO_DST_E',0.0,'PJ','phased out');
INSERT INTO "MaxActivity" VALUES ('PIE',2014,'TRA_FT_ELC',1.03*2.93E+00,'PJ','3xlast 2022 value');
INSERT INTO "MaxActivity" VALUES ('PIE',2017,'TRA_FT_ELC',1.05*3.22E+00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2021,'TRA_FT_ELC',1.05*2.54E+00,'PJ','');

INSERT INTO "MaxActivity" VALUES ('PIE',2035,'TRA_FT_DST_N',2*6.25E+01,'PJ','2xlast 2021 value');
INSERT INTO "MaxActivity" VALUES ('PIE',2035,'TRA_FT_NGA_N',2*9.53E-01,'PJ','2xlast 2021 value');
INSERT INTO "MaxActivity" VALUES ('PIE',2035,'TRA_FT_GSL_N',2*2.22E+01,'PJ','2xlast 2021 value');
INSERT INTO "MaxActivity" VALUES ('PIE',2035,'TRA_FT_LPG_N',2*3.94E+00,'PJ','2xlast 2021 value');

INSERT INTO "MaxActivity" VALUES ('PIE',2050,'TRA_FT_GSL_N',3*2.22E+01,'PJ','3x2021 value');
INSERT INTO "MaxActivity" VALUES ('PIE',2050,'TRA_FT_LPG_N',3*3.94E+00,'PJ','3x2021 value');
INSERT INTO "MaxActivity" VALUES ('PIE',2050,'TRA_FT_NGA_N',3*9.53E-01,'PJ','3x2021 value');
INSERT INTO "MaxActivity" VALUES ('PIE',2050,'TRA_FT_DST_N',3*6.25E+01,'PJ','3x2021 value');
INSERT INTO "MaxActivity" VALUES ('PIE',2050,'TRA_FT_ELC',3*2.51E+00,'PJ','3x 2022 value');

-- Base year technologies
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'TRA_ROA_CAR_NGA_E',0.95*2.503E-01,'Bvkm','91.67% of base year');
INSERT INTO "MaxActivity" VALUES ('PIE',2013,'TRA_ROA_CAR_NGA_E',0.95*2.38E-01,'Bvkm','91.67% of base year');
INSERT INTO "MaxActivity" VALUES ('PIE',2025,'TRA_ROA_CAR_NGA_E',0.00E00,'Bvkm','91.67% of base year');

INSERT INTO "MaxActivity" VALUES ('PIE',2012,'TRA_ROA_CAR_GSL_E',7.018E+00,'Bvkm','91.67% of base year');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'TRA_ROA_CAR_DST_E',1.244E+01,'Bvkm','91.67% of base year');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'TRA_ROA_CAR_LPG_E',0.85*1.089E+00,'Bvkm','91.67% of base year');
INSERT INTO "MaxActivity" VALUES ('PIE',2023,'TRA_ROA_CAR_GSL_E',0.0,'Bvkm','');
INSERT INTO "MaxActivity" VALUES ('PIE',2023,'TRA_ROA_CAR_DST_E',0.0,'Bvkm','');
INSERT INTO "MaxActivity" VALUES ('PIE',2023,'TRA_ROA_CAR_LPG_E',0.0,'Bvkm','');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'TRA_ROA_MCY_GSL_E',1.06E+00,'Bvkm','91.67% of base year');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'TRA_ROA_MOP_GSL_E',2.89E+00,'Bvkm','91.67% of base year');
INSERT INTO "MaxActivity" VALUES ('PIE',2025,'TRA_ROA_MCY_GSL_E',0.0,'Bvkm','');
INSERT INTO "MaxActivity" VALUES ('PIE',2025,'TRA_ROA_MOP_GSL_E',0.0,'Bvkm','');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'TRA_ROA_BUS_DST_E',9.996E-02,'Bvkm','92.86% of base year');
INSERT INTO "MaxActivity" VALUES ('PIE',2025,'TRA_ROA_BUS_DST_E',0.0,'Bvkm','');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'TRA_ROA_HTR_DST_E',5.719E-01,'Bvkm','92.86% of base year');
INSERT INTO "MaxActivity" VALUES ('PIE',2025,'TRA_ROA_HTR_DST_E',0.0,'Bvkm','');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'TRA_ROA_LCV_DST_E',4.490E+00,'Bvkm','92.86% of base year');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'TRA_ROA_LCV_GSL_E',2.102E-01,'Bvkm','92.86% of base year');
INSERT INTO "MaxActivity" VALUES ('PIE',2025,'TRA_ROA_LCV_DST_E',0.0,'Bvkm','');
INSERT INTO "MaxActivity" VALUES ('PIE',2025,'TRA_ROA_LCV_GSL_E',0.0,'Bvkm','');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'TRA_ROA_MTR_DST_E',5.00E-01,'Bvkm','92.86% of base year');
INSERT INTO "MaxActivity" VALUES ('PIE',2025,'TRA_ROA_MTR_DST_E',0.0,'Bvkm','');

-- Electricity sector
-- Base year technologies
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'ELC_NGA_CC_E',1.62E+01,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'ELC_NGA_STM_REP_E',1.38E+00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'ELC_NGA_TURB_E',2.66E-02,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'ELC_CHP_NGA_CC_E',3.30E+01,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'ELC_CHP_NGA_TURB_E',2.23E+00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'ELC_CHP_NGA_STM_COND_E',4.70E+00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'ELC_CHP_BMU_E',3.71E-01,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'ELC_CHP_BIO_E',3.96E-01,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'ELC_BGS_E',1.56E+00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'ELC_BIO_E',2.70E-01,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'ELC_SOL_E',3.04E+00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'ELC_HYD_FLO_E',1.26E+01,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'ELC_HYD_RES_E',9.78E+00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'ELC_HYD_PUM_E',1.42E+00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'ELC_WIN_E',1.05*7.31E-02,'PJ','');

INSERT INTO "MaxActivity" VALUES ('PIE',2015,'ELC_NGA_CC_E',1.41E+01,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2015,'ELC_NGA_STM_REP_E',1.20E+00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2015,'ELC_NGA_TURB_E',2.31E-02,'PJ','');

INSERT INTO "MaxActivity" VALUES ('PIE',2015,'ELC_CHP_NGA_TURB_E',1.94E+00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2015,'ELC_CHP_NGA_STM_COND_E',4.09E+00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2015,'ELC_CHP_BMU_E',3.23E-01,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2015,'ELC_CHP_BIO_E',3.45E-01,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2015,'ELC_BGS_E',1.36E+00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2015,'ELC_BIO_E',2.34E-01,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2015,'ELC_SOL_E',2.46E+00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2015,'ELC_HYD_FLO_E',1.09E+01,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2015,'ELC_HYD_RES_E',8.50E+00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2015,'ELC_HYD_PUM_E',1.23E+00,'PJ','');

INSERT INTO "MaxActivity" VALUES ('PIE',2035,'ELC_NGA_CC_E',0.00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2035,'ELC_NGA_STM_REP_E',0.00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2035,'ELC_NGA_TURB_E',0.00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2035,'ELC_CHP_NGA_CC_E',0.00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2040,'ELC_CHP_NGA_TURB_E',0.00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2035,'ELC_CHP_NGA_STM_COND_E',0.00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2030,'ELC_CHP_BMU_E',0.00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2030,'ELC_CHP_BIO_E',0.00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2030,'ELC_BGS_E',0.00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2030,'ELC_BIO_E',0.00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2040,'ELC_SOL_E',0.00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2035,'ELC_WIN_E',0.00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2050,'ELC_HYD_FLO_E',0.00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2050,'ELC_HYD_RES_E',0.00,'PJ','');

-- Upstream sector
-- Importation prices
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'UPS_IMP_ELC_CEN',6.62E+00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2013,'UPS_IMP_ELC_CEN',8.68E-01,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2015,'UPS_IMP_ELC_CEN',3.02E+00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2017,'UPS_IMP_ELC_CEN',0.00E+00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'UPS_IMP_OIL_CRD',1.52E+02,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2015,'UPS_IMP_OIL_CRD',1.71E+02,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2019,'UPS_IMP_OIL_CRD',1.52E+02,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2050,'UPS_IMP_OIL_CRD',0.10*3479.19,'PJ','1/10 of TEMOA_IT');
INSERT INTO "MaxActivity" VALUES ('PIE',2013,'UPS_IMP_GAS_NGA',3.82E+02,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2021,'UPS_IMP_GAS_NGA',3.34E+02,'PJ','+5% of the 2021 consumption - Bollettino gas');
INSERT INTO "MaxActivity" VALUES ('PIE',2050,'UPS_IMP_GAS_NGA',3*3.34E+02,'PJ','x3 of the 2021 consumption - Bollettino gas');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'UPS_IMP_BIO_DST',1.10*3.79E+00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2014,'UPS_IMP_BIO_DST',1.10*3.27,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2020,'UPS_IMP_BIO_DST',1.10*3.49,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2050,'UPS_IMP_BIO_DST',12.27,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'UPS_IMP_OIL_NSP',0.3*37.02,'PJ','30% of interpolation between 2007 and 2050 - TEMOA_IT');
INSERT INTO "MaxActivity" VALUES ('PIE',2050,'UPS_IMP_OIL_NSP',0.2*66.32,'PJ','20% of TEMOA_IT');

-- Extraction of fossil fuels
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'UPS_PRI_OIL',6.22E+00,'PJ','100% of regional extraction in 2012');
INSERT INTO "MaxActivity" VALUES ('PIE',2015,'UPS_PRI_OIL',1.48E+00,'PJ','100% of regional extraction in 2015');
INSERT INTO "MaxActivity" VALUES ('PIE',2017,'UPS_PRI_OIL',1.55E-01,'PJ','100% of regional extraction in 2017');
INSERT INTO "MaxActivity" VALUES ('PIE',2019,'UPS_PRI_OIL',7.33E-01,'PJ','100% of regional extraction in 2019');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'UPS_PRI_NGA',1.13E+00,'PJ','100% of regional extraction in 2012');
INSERT INTO "MaxActivity" VALUES ('PIE',2015,'UPS_PRI_NGA',4.59E-01,'PJ','100% of regional extraction in 2015');
INSERT INTO "MaxActivity" VALUES ('PIE',2017,'UPS_PRI_NGA',2.35E-02,'PJ','100% of regional extraction in 2017');
INSERT INTO "MaxActivity" VALUES ('PIE',2019,'UPS_PRI_NGA',3.47E-01,'PJ','100% of regional extraction in 2019');

INSERT INTO "MaxActivity" VALUES ('PIE',2012,'UPS_SEC_BFG_OXY',0.00,'PJ','GSE Rapporto monitoraggio');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'UPS_SEC_OVC_COG',0.00,'PJ','GSE Rapporto monitoraggio');
INSERT INTO "MaxActivity" VALUES ('PIE',2025,'UPS_IMP_COA_OVC',0.00,'PJ','');

INSERT INTO "MaxActivity" VALUES ('PIE',2020,'UPS_IMP_OIL_PTC',0.10*30.47,'PJ','10% of TEMOA_IT');
INSERT INTO "MaxActivity" VALUES ('PIE',2050,'UPS_IMP_OIL_PTC',0.10*30.47,'PJ','10% of TEMOA_IT');
-- Renewables
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'UPS_RNW_HYD',2.68E+01,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'UPS_RNW_SOL',1.61E+01,'PJ','10% of TEMOA_Italy in 2012');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'UPS_RNW_WIN',2.33E-01,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'UPS_RNW_SLB',1.19E+01,'PJ','10% of TEMOA_Italy in 2012');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'UPS_RNW_BMU',1.03E+01,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'UPS_RNW_BGS',6.76E+00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2015,'UPS_RNW_BLQ',1.53E+00,'PJ','GSE Report');
INSERT INTO "MaxActivity" VALUES ('PIE',2020,'UPS_RNW_BLQ',3.85E+00,'PJ','GSE Report');
INSERT INTO "MaxActivity" VALUES ('PIE',2020,'UPS_RNW_HYD',1.05*2.68E+01,'PJ','+5% of TERNA statistics');
INSERT INTO "MaxActivity" VALUES ('PIE',2020,'UPS_RNW_SOL',2.47*1.61E+01,'PJ','TEMOA_Italy trend between 2012 and 2020');
INSERT INTO "MaxActivity" VALUES ('PIE',2020,'UPS_RNW_WIN',3.03E-01,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2020,'UPS_RNW_BGS',4.78E+01,'PJ','10% of TEMOA_Italy in 2020');
INSERT INTO "MaxActivity" VALUES ('PIE',2050,'UPS_RNW_HYD',1.05*2.81E+01,'PJ','TEMOA_Italy trend between 2020 and 2050');
INSERT INTO "MaxActivity" VALUES ('PIE',2050,'UPS_RNW_SOL',10.2*3.98E+01,'PJ','TEMOA_Italy trend between 2020 and 2050');
INSERT INTO "MaxActivity" VALUES ('PIE',2050,'UPS_RNW_WIN',17.2*3.03E-01,'PJ','TEMOA_Italy trend between 2020 and 2050');
INSERT INTO "MaxActivity" VALUES ('PIE',2050,'UPS_RNW_SLB',1.6*1.19E+01,'PJ','TEMOA_Italy trend between 2012 and 2050');
INSERT INTO "MaxActivity" VALUES ('PIE',2050,'UPS_RNW_BMU',1.4*1.03E+01,'PJ','TEMOA_Italy trend between 2020 and 2050');
INSERT INTO "MaxActivity" VALUES ('PIE',2050,'UPS_RNW_BGS',1.6*4.78E+01,'PJ','TEMOA_Italy trend between 2020 and 2050');
INSERT INTO "MaxActivity" VALUES ('PIE',2050,'UPS_RNW_BLQ',2.6*3.85E+00,'PJ','TEMOA_Italy trend between 2020 and 2050');
INSERT INTO "MaxActivity" VALUES ('PIE',2030,'UPS_RNW_BIN',0.10*25.87,'PJ','10% of TEMOA_Italy');
INSERT INTO "MaxActivity" VALUES ('PIE',2050,'UPS_RNW_BIN',0.10*64.69,'PJ','10% of TEMOA_Italy');

-- Residential sector
-- Fuel technologies
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'RES_FT_SOL_E',0.95*6.83E-01,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'RES_FT_LPG_E',0.98*3.60E+00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'RES_FT_HFO_E',1.02*3.17E-01,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'RES_FT_DST_E',1.02*1.51E+00,'PJ','');

INSERT INTO "MaxActivity" VALUES ('PIE',2012,'RES_FT_BIO_E',0.95*2.63E+01,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'RES_FT_HET_E',0.98*7.61E+00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2035,'RES_FT_NGA_E',0.0,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2035,'RES_FT_DST_E',0.0,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2035,'RES_FT_HFO_E',0.0,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2035,'RES_FT_LPG_E',0.0,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2030,'RES_FT_BIO_E',0.0,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2035,'RES_FT_SOL_E',0.0,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2035,'RES_FT_HET_E',0.0,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'RES_FT_HET_N',0.0,'PJ','');

INSERT INTO "MaxActivity" VALUES ('PIE',2050,'RES_FT_NGA_N',3*6.88E+01,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2050,'RES_FT_ELC_N',3*1.63E+01,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2050,'RES_FT_LPG_N',3*4.26E+00,'PJ','');

---- Base year technologies--
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'RES_SH_BUR_NGA_LC_E',0.95*7.927*0.18*4.44E+00,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'RES_SH_AHP_NGA_LC_E',0.95*7.927*0.18*6.77E-02,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'RES_SH_BUR_DST_LC_E',0.95*7.927*0.18*3.41E-01,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'RES_SH_BUR_HFO_LC_E',0.00E+00,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'RES_SH_BUR_LPG_LC_E',0.95*7.927*0.18*1.76E-01,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'RES_SH_HT_ELC_LC_E',0.95*7.927*0.18*1.25E-02,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'RES_SH_HP_ELC_LC_E',0.95*7.927*0.18*3.20E-03,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'RES_SH_HEX_HET_LC_E',0.95*7.927*0.18*7.17E-02,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'RES_SH_WST_BIO_LC_E',0.95*7.927*0.18*6.76E-02,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('PIE',2030,'RES_SH_BUR_NGA_LC_E',0.00,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('PIE',2025,'RES_SH_AHP_NGA_LC_E',0.00,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('PIE',2030,'RES_SH_BUR_DST_LC_E',0.00,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('PIE',2050,'RES_SH_BUR_HFO_LC_E',0.00,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('PIE',2030,'RES_SH_BUR_LPG_LC_E',0.00,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('PIE',2030,'RES_SH_HT_ELC_LC_E',0.00,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('PIE',2030,'RES_SH_HP_ELC_LC_E',0.00,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('PIE',2030,'RES_SH_HEX_HET_LC_E',0.00,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('PIE',2030,'RES_SH_WST_BIO_LC_E',0.00,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'RES_SH_BUR_NGA_MC_E',0.95*3.356*0.18*8.53E+00,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'RES_SH_AHP_NGA_MC_E',0.95*3.356*0.18*1.81E-01,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'RES_SH_BUR_DST_MC_E',0.95*3.356*0.18*2.75E+00,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'RES_SH_BUR_HFO_MC_E',0.95*3.356*0.18*8.00E-02,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'RES_SH_BUR_LPG_MC_E',0.95*3.356*0.18*7.15E-01,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'RES_SH_HT_ELC_MC_E',0.95*3.356*0.18*3.41E-02,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'RES_SH_HP_ELC_MC_E',0.95*3.356*0.18*2.50E-02,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'RES_SH_HEX_HET_MC_E',0.95*3.356*0.18*3.40E-01,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'RES_SH_WST_BIO_MC_E',0.95*3.356*0.18*3.22E-01,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('PIE',2030,'RES_SH_BUR_NGA_MC_E',0.00,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('PIE',2025,'RES_SH_AHP_NGA_MC_E',0.00,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('PIE',2030,'RES_SH_BUR_DST_MC_E',0.00,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('PIE',2040,'RES_SH_BUR_HFO_MC_E',0.00,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('PIE',2030,'RES_SH_BUR_LPG_MC_E',0.00,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('PIE',2030,'RES_SH_HT_ELC_MC_E',0.00,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('PIE',2030,'RES_SH_HP_ELC_MC_E',0.00,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('PIE',2030,'RES_SH_HEX_HET_MC_E',0.00,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('PIE',2030,'RES_SH_WST_BIO_MC_E',0.00,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'RES_SH_BUR_NGA_HC_E',0.90*2.273*0.18*1.70E+02,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'RES_SH_AHP_NGA_HC_E',0.90*2.273*0.18*2.92E+00,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'RES_SH_BUR_DST_HC_E',0.90*2.273*0.18*5.16E+01,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'RES_SH_BUR_HFO_HC_E',0.90*2.273*0.18*2.54E+00,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'RES_SH_BUR_LPG_HC_E',0.90*2.273*0.18*1.54E+01,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'RES_SH_HT_ELC_HC_E',0.90*2.273*0.18*4.88E+00,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'RES_SH_HP_ELC_HC_E',0.95*2.273*0.18*6.40E-01,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'RES_SH_HEX_HET_HC_E',0.90*2.273*0.18*4.70E-01,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'RES_SH_WST_BIO_HC_E',0.95*2.273*0.18*6.40E+00,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('PIE',2030,'RES_SH_BUR_NGA_HC_E',0.00,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('PIE',2025,'RES_SH_AHP_NGA_HC_E',0.00,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('PIE',2030,'RES_SH_BUR_DST_HC_E',0.00,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('PIE',2040,'RES_SH_BUR_HFO_HC_E',0.00,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('PIE',2030,'RES_SH_BUR_LPG_HC_E',0.00,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('PIE',2030,'RES_SH_HT_ELC_HC_E',0.00,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('PIE',2030,'RES_SH_HP_ELC_HC_E',0.00,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('PIE',2030,'RES_SH_HEX_HET_HC_E',0.00,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('PIE',2030,'RES_SH_WST_BIO_HC_E',0.00,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'RES_SC_CEN_E',0.94*1.37E+01,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'RES_SC_EHP_E',0.94*1.18E+00,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'RES_SC_ROOM_E',0.94*1.06E+01,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('PIE',2025,'RES_SC_CEN_E',0.00,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('PIE',2025,'RES_SC_EHP_E',0.00,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('PIE',2025,'RES_SC_ROOM_E',0.00,'Mm2','');

INSERT INTO "MaxActivity" VALUES ('PIE',2012,'RES_WH_NGA_E',1.08*2.77E+00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'RES_WH_DST_E',1.08*8.85E-02,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'RES_WH_HFO_E',0.95*1.67E-01,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'RES_WH_LPG_E',0.95*3.23E-01,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'RES_WH_ELC_E',1.08*2.41E+00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'RES_WH_HET_E',0.95*7.05E00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'RES_WH_BIO_E',0.95*5.10E-01,'PJ','');

INSERT INTO "MaxActivity" VALUES ('PIE',2035,'RES_WH_NGA_E',0.00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2035,'RES_WH_DST_E',0.00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2040,'RES_WH_HFO_E',0.00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2035,'RES_WH_LPG_E',0.00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2035,'RES_WH_ELC_E',0.00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2035,'RES_WH_HET_E',0.00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2035,'RES_WH_BIO_E',0.00,'PJ','');

INSERT INTO "MaxActivity" VALUES ('PIE',2012,'RES_WH_DST_N',0.00,'PJ','');

INSERT INTO "MaxActivity" VALUES ('PIE',2012,'RES_RF_RFG_ELC_E',0.94*5.28E-01,'Gl','');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'RES_RF_FRZ_ELC_E',0.94*1.35E-01,'Gl','');
INSERT INTO "MaxActivity" VALUES ('PIE',2025,'RES_RF_RFG_ELC_E',0.00,'Gl','');
INSERT INTO "MaxActivity" VALUES ('PIE',2025,'RES_RF_FRZ_ELC_E',0.00,'Gl','');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'RES_CW_ELC_E',0.94*4.42E-01,'Glav','');
INSERT INTO "MaxActivity" VALUES ('PIE',2025,'RES_CW_ELC_E',0.00,'Glav','');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'RES_CD_ELC_E',0.94*6.27E-03,'Glav','');
INSERT INTO "MaxActivity" VALUES ('PIE',2025,'RES_CD_ELC_E',0.00,'Glav','');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'RES_DW_ELC_E',0.94*2.04E-01,'Glav','');
INSERT INTO "MaxActivity" VALUES ('PIE',2025,'RES_DW_ELC_E',0.00,'Glav','');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'RES_CK_NGA_E',0.94*1.09E+00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'RES_CK_LPG_E',0.94*2.94E-01,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'RES_CK_ELC_E',0.94*8.78E-01,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2025,'RES_CK_NGA_E',0.00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2025,'RES_CK_LPG_E',0.00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2025,'RES_CK_ELC_E',0.00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'RES_OE_EQP_E',0.94*5.03E+00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2020,'RES_OE_EQP_E',0.00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'RES_LG_LFL_E',0.95*2.08E+01,'Glm','');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'RES_LG_SFL_E',0.95*1.20E+01,'Glm','');

INSERT INTO "MaxActivity" VALUES ('PIE',2012,'RES_LG_LHAL_E',0.95*3.20E-01,'Glm','');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'RES_LG_SHAL_IMP_E',0.95*4.89E-01,'Glm','');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'RES_LG_SHAL_E',0.95*6.77E-01,'Glm','');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'RES_LG_MIN_E',0.95*9.79E+00,'Glm','');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'RES_LG_SIN_E',0.95*8.28E+00,'Glm','');
INSERT INTO "MaxActivity" VALUES ('PIE',2025,'RES_LG_LFL_E',0.00,'Glm','');
INSERT INTO "MaxActivity" VALUES ('PIE',2025,'RES_LG_SFL_E',0.00,'Glm','');
INSERT INTO "MaxActivity" VALUES ('PIE',2025,'RES_LG_LHAL_E',0.00,'Glm','');
INSERT INTO "MaxActivity" VALUES ('PIE',2025,'RES_LG_SHAL_IMP_E',0.00,'Glm','');
INSERT INTO "MaxActivity" VALUES ('PIE',2025,'RES_LG_SHAL_E',0.00,'Glm','');
INSERT INTO "MaxActivity" VALUES ('PIE',2025,'RES_LG_MIN_E',0.00,'Glm','');
INSERT INTO "MaxActivity" VALUES ('PIE',2025,'RES_LG_SIN_E',0.00,'Glm','');
-- New technologies
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'RES_SH_HEX_HET_HC_N',0.10*5.0,'PJ','10% of TEMOA-Italy value');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'RES_SH_HEX_HET_MC_N',0.10*0.3,'PJ','10% of TEMOA-Italy value');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'RES_SH_HEX_HET_LC_N',0.10*0.1,'PJ','10% of TEMOA_Italy value');

INSERT INTO "MaxActivity" VALUES ('PIE',2030,'RES_SH_LPG_LC_N',5.92E-01,'','10% of TEMOA_Italy value');
INSERT INTO "MaxActivity" VALUES ('PIE',2030,'RES_SH_LPG_HC_N',2.43E-01,'PJ','10% of TEMOA_Italy value');
INSERT INTO "MaxActivity" VALUES ('PIE',2030,'RES_SH_LPG_MC_N',1.98E+00,'PJ','10% of TEMOA_Italy value');
INSERT INTO "MaxActivity" VALUES ('PIE',2030,'RES_SH_LPG_COND_MC_N',4.05E-01,'','10% of TEMOA_Italy value');

-- Commercial sector
-- Fuel technologies
INSERT INTO "MaxActivity" VALUES ('PIE',2021,'COM_FT_ELC_EN',1.10*2.38E+01,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2025,'COM_FT_ELC_EN',2.62E+01,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2025,'COM_FT_NGA_E',0.00E+00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2025,'COM_FT_DST_E',0.00E+00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'COM_FT_NGA_N',0.10*6.08E+01,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'COM_FT_LPG_EN',1.03*5.14E-01,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'COM_FT_BIO_N',0.10*1.85E+00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2050,'COM_FT_NGA_N',3*5.00E+01,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2050,'COM_FT_LPG_EN',3*6.09E-01,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2050,'COM_FT_ELC_EN',3*2.38E+01,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2050,'COM_FT_DST_N',3*4.45E-01,'PJ','');
-- Base year technologies
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'COM_SH_HT_NGA_E',2.53E+01,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'COM_SH_HP_NGA_E',6.93E-01,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'COM_SH_HT_DST_E',3.58E-01,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2020,'COM_SH_HT_DST_E',0.9*2.9E-01,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'COM_SH_HT_LPG_E',2.14E-01,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'COM_SH_RES_ELC_E',4.30E-01,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'COM_SH_HP_ELC_E',2.86E+00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'COM_SC_CHL_DST_E',4.19E-02,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'COM_SC_CCL_ELC_CNT_E',6.08E+00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'COM_SC_AHP_ELC_E',3.46E-02,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'COM_SC_ROOM_ELC_E',1.26E+00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'COM_SC_ROOF_ELC_E',3.92E+00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'COM_SC_ABS_NGA_E',0.90*1.62E+01,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2040,'COM_SC_ABS_NGA_E',0.00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2035,'COM_SC_CHL_DST_E',0.00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2035,'COM_SC_CCL_ELC_CNT_E',0.00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2030,'COM_SC_AHP_ELC_E',0.00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2040,'COM_SH_HT_NGA_E',0.00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2040,'COM_SH_HP_NGA_E',0.00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2040,'COM_SH_HT_DST_E',0.00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2040,'COM_SH_HT_LPG_E',0.00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2035,'COM_SH_RES_ELC_E',0.00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2040,'COM_SH_HP_ELC_E',0.00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2030,'COM_SC_ROOM_ELC_E',0.00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2035,'COM_SC_ROOF_ELC_E',0.00,'PJ','');

INSERT INTO "MaxActivity" VALUES ('PIE',2012,'COM_WH_NGA_E',8.08E-01,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'COM_WH_DST_E',4.05E-02,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'COM_WH_LPG_E',7.97E-02,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'COM_WH_ELC_E',1.09E+00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2035,'COM_WH_NGA_E',0.00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2035,'COM_WH_DST_E',0.00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2035,'COM_WH_LPG_E',0.00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2035,'COM_WH_ELC_E',0.00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'COM_LG_INC_E',2.51E-01,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'COM_LG_SHAL_E',1.14E-01,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'COM_LG_IRCHAL_E',1.49E-01,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'COM_LG_SFL_E',1.51E+01,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'COM_LG_LFL_E',0.95*1.55E+01,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'COM_LG_CFL_C_E',3.82E+00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'COM_LG_MER_E',2.29E+00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'COM_LG_SOD_E',5.73E-01,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2017,'COM_LG_INC_E',0.00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2017,'COM_LG_SHAL_E',0.00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2017,'COM_LG_IRCHAL_E',0.00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2017,'COM_LG_SFL_E',0.00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2017,'COM_LG_LFL_E',0.00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2017,'COM_LG_CFL_C_E',0.00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2017,'COM_LG_MER_E',0.00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2017,'COM_LG_SOD_E',0.00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'COM_CK_NGA_E',8.29E-01,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'COM_CK_LPG_E',2.13E-02,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'COM_CK_ELC_E',2.19E-01,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2040,'COM_CK_NGA_E',0.00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2025,'COM_CK_LPG_E',0.00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2025,'COM_CK_ELC_E',0.00,'PJ','');

INSERT INTO "MaxActivity" VALUES ('PIE',2012,'COM_RF_RFR_ELC_E',1.67E+00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'COM_OE_OFF_ELC_E',8.59E+00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2023,'COM_RF_RFR_ELC_E',0.00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2025,'COM_OE_OFF_ELC_E',0.00,'PJ','');

-- Industrial sector
-- Base year technologies
-- Fuel technologies

INSERT INTO "MaxActivity" VALUES ('PIE',2012,'IND_FT_NGA_E',3.88E+01,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'IND_FT_LPG_E',5.14E-01,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'IND_FT_COA_E',3.11E+00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'IND_FT_COK_E',5.63E+00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'IND_FT_BFG_E',1.43E-02,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'IND_FT_OIL_E',1.02*1.31E+00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2019,'IND_FT_OIL_E',1.02*8.54E-01,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2020,'IND_FT_OIL_E',1.02*1.25E+00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'IND_FT_ETH_E',2.04E+00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'IND_FT_NAP_E',9.91E+00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'IND_FT_HET_E',0.95*2.81E+00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'IND_FT_HFO_E',0.95*2.53E+00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'IND_FT_BIO_E',9.22E-01,'PJ','');

INSERT INTO "MaxActivity" VALUES ('PIE',2015,'IND_FT_ELC_EN',1.15*4.30E+01,'PJ',' consumo elettrico medio IND nel 2015 e 2016');
INSERT INTO "MaxActivity" VALUES ('PIE',2019,'IND_FT_ELC_EN',1.10*4.14E+01,'PJ',' consumo elettrico IND nel 2019');
INSERT INTO "MaxActivity" VALUES ('PIE',2021,'IND_FT_ELC_EN',1.10*4.38E+01,'PJ',' consumo elettrico IND nel 2021');

INSERT INTO "MaxActivity" VALUES ('PIE',2040,'IND_FT_NGA_E',0.0,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2040,'IND_FT_LPG_E',0.0,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2040,'IND_FT_COA_E',0.0,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2040,'IND_FT_COK_E',0.0,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2040,'IND_FT_BFG_E',0.0,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2040,'IND_FT_HFO_E',0.00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'IND_FT_PTC_E',1.07*9.12E-01,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2040,'IND_FT_ETH_E',0.0,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2040,'IND_FT_NAP_E',0.0,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2040,'IND_FT_PTC_E',0.0,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2040,'IND_FT_BIO_E',0.0,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2040,'IND_FT_HET_E',0.00,'PJ','');

INSERT INTO "MaxActivity" VALUES ('PIE',2012,'IND_FT_HET_N',0.00,'PJ','Assumption');
INSERT INTO "MaxActivity" VALUES ('PIE',2050,'IND_FT_HET_N',5.00,'PJ','Assumption');
INSERT INTO "MaxActivity" VALUES ('PIE',2050,'IND_FT_NGA_N',0.07*3719.69,'PJ','7% of TEMOA_IT');
INSERT INTO "MaxActivity" VALUES ('PIE',2050,'IND_FT_BIO_N',0.07*118.93,'PJ','7% of TEMOA_IT');
INSERT INTO "MaxActivity" VALUES ('PIE',2050,'IND_FT_PTC_N',0.07*549.28,'PJ','7% of TEMOA_IT');
-- Non metalic minerals
-- New FTs
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'IND_FT_OIL_N',0.0,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2050,'IND_FT_OIL_N',0.0,'PJ','');
------ Base year technologies
------ Machine drive and steam
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'IND_STM_NGA_E',0.95*1.43E+00,'PJ','95% of base year');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'IND_STM_COA_E',0.95*1.02E-03,'PJ','95% of base year');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'IND_STM_HFO_E',0.08*3.66E-01,'PJ','95% of base year');
INSERT INTO "MaxActivity" VALUES ('PIE',2013,'IND_STM_HFO_E',0.07*3.66E-01,'PJ','95% of base year');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'IND_STM_HET_E',0.95*9.21E+00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'IND_STM_BIO_E',0.95*7.07E-02,'PJ','95% of base year');
INSERT INTO "MaxActivity" VALUES ('PIE',2040,'IND_STM_NGA_E',0.0,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2040,'IND_STM_COA_E',0.0,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2040,'IND_STM_HFO_E',0.0,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2040,'IND_STM_HET_E',0.0,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2040,'IND_STM_BIO_E',0.0,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'IND_STM_TECH',1.476E01,'PJ','');
-- New technologies
-- Machine drive
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'IND_MD_ELC_E',0.95*2.90E+01,'PJ','95% of base year');
INSERT INTO "MaxActivity" VALUES ('PIE',2035,'IND_MD_ELC_E',0.0,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2013,'IND_MD_LPG_N',0.03*5.14E-01,'PJ','');

INSERT INTO "MaxActivity" VALUES ('PIE',2012,'IND_OTH_OTH_ELC_E',0.95*3.11E+01,'PJ','95% of base year');
INSERT INTO "MaxActivity" VALUES ('PIE',2040,'IND_OTH_OTH_ELC_E',0.0,'PJ','');

---- Chemicals
---- Base year technologies
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'IND_CH_FS_NAP_E',0.95*9.02E-02,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'IND_CH_FS_LPG_E',0.95*4.65E-02,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'IND_CH_OTH_DST_E',0.95*3.58E-01,'PJ','95% of base year');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'IND_CH_OTH_ELC_E',0.95*1.03E-01,'PJ','95% of base year');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'IND_CH_OTH_HFO_E',0.95*3.39E-02,'PJ','95% of base year');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'IND_CH_OTH_NGA_E',0.95*6.21E-01,'PJ','95% of base year');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'IND_CH_OTH_PTC_E',0.95*3.08E-02,'PJ','95% of base year');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'IND_CH_FS_DST_E',0.95*1.97E-02,'PJ','95% of base year');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'IND_CH_FS_NSP_E',0.95*8.38E-02,'PJ','95% of base year');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'IND_CH_FS_RFG_E',0.90*1.40E-02,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'IND_CH_FS_GSL_E',0.95*4.52E-01,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'IND_CH_CHL_E',0.95*1.54E-02,'PJ','95% of base year');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'IND_CH_OTH_COK_E',0.90*2.07E-01,'PJ','95% of base year');


INSERT INTO "MaxActivity" VALUES ('PIE',2040,'IND_CH_FS_NAP_E',0.00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2040,'IND_CH_FS_LPG_E',0.00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2040,'IND_CH_OTH_DST_E',0.0,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2040,'IND_CH_OTH_ELC_E',0.0,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2040,'IND_CH_OTH_HFO_E',0.0,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2040,'IND_CH_OTH_NGA_E',0.0,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2040,'IND_CH_OTH_PTC_E',0.0,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2040,'IND_CH_FS_DST_E',0.0,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2040,'IND_CH_FS_NSP_E',0.0,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2040,'IND_CH_FS_RFG_E',0.0,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2040,'IND_CH_FS_GSL_E',0.0,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2040,'IND_CH_CHL_E',0.0,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2035,'IND_CH_OTH_COK_E',0.0,'PJ','');


-- Feedstock
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'IND_CH_FS_KER_E',0.95*6.28E-01,'PJ','95% of base year');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'IND_CH_FS_HFO_E',0.90*0.6*1.25E+00,'PJ','95% of base year');
INSERT INTO "MaxActivity" VALUES ('PIE',2040,'IND_CH_FS_KER_E',0.00,'PJ','95% of base year');
INSERT INTO "MaxActivity" VALUES ('PIE',2040,'IND_CH_FS_HFO_E',0.00,'PJ','95% of base year');
-- Iron and steel
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'IND_IS_OTH_ELC_E',0.95*3.03E-01,'PJ','95% of base year');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'IND_IS_FS_COK_E',0.95*6.93E-01,'PJ','95% of base year');

INSERT INTO "MaxActivity" VALUES ('PIE',2035,'IND_IS_OTH_ELC_E',0.0,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2035,'IND_IS_FS_COK_E',0.0,'PJ','');

-- Non-ferrous metals
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'IND_NF_ALU_E',0.95*6.11E-01,'Mt','95% of base year');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'IND_NF_COP_E',0.95*1.15E-01,'Mt','95% of base year');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'IND_NF_ZNC_E',0.95*0.80*1.10E-01,'Mt','95% of base year');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'IND_NF_EC_E',1.05*2.64E+00,'PJ','95% of base year');
INSERT INTO "MaxActivity" VALUES ('PIE',2040,'IND_NF_ALU_E',0.0,'Mt','');
INSERT INTO "MaxActivity" VALUES ('PIE',2040,'IND_NF_COP_E',0.0,'Mt','');
INSERT INTO "MaxActivity" VALUES ('PIE',2040,'IND_NF_ZNC_E',0.0,'Mt','');
INSERT INTO "MaxActivity" VALUES ('PIE',2040,'IND_NF_EC_E',0.0,'Mt','');

INSERT INTO "MaxActivity" VALUES ('PIE',2012,'IND_NF_OTH_ELC_E',0.97*8.80E-01,'PJ','95% of base year');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'IND_NF_OTH_DST_E',0.97*7.45E-02,'PJ','95% of base year');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'IND_NF_OTH_NGA_E',0.97*9.04E-01,'PJ','95% of base year');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'IND_NF_OTH_LPG_E',0.1*0.85,'PJ','80% of 2012 activity');
INSERT INTO "MaxActivity" VALUES ('PIE',2035,'IND_NF_OTH_ELC_E',0.0,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2035,'IND_NF_OTH_DST_E',0.0,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2035,'IND_NF_OTH_NGA_E',0.0,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2035,'IND_NF_OTH_LPG_E',0.0,'PJ','');
------ Non-metallic minerals
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'IND_NM_CLK_DRY_E',0.95*6.92E-01,'Mt','95% of base year');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'IND_NM_LIM_E',0.95*4.02E-01,'Mt','95% of base year');
INSERT INTO "MaxActivity" VALUES ('PIE',2014,'IND_NM_LIM_E',5.00E-02,'Mt','');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'IND_NM_GLS_E',0.95*2.82E-01,'Mt','95% of base year');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'IND_NM_CRM_E',0.96*7.00E-01,'Mt','95% of base year');

INSERT INTO "MaxActivity" VALUES ('PIE',2035,'IND_NM_CLK_DRY_E',0.00E+00,'Mt','');
INSERT INTO "MaxActivity" VALUES ('PIE',2035,'IND_NM_LIM_E',0.00E+00,'Mt','');
INSERT INTO "MaxActivity" VALUES ('PIE',2035,'IND_NM_GLS_E',0.00E+00,'Mt','');
INSERT INTO "MaxActivity" VALUES ('PIE',2035,'IND_NM_CRM_E',0.00E+00,'Mt','');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'IND_NM_OTH_DST_E',0.95*1.66E-02,'PJ','95% of base year');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'IND_NM_OTH_NGA_E',0.95*5.64E-01,'PJ','95% of base year');

INSERT INTO "MaxActivity" VALUES ('PIE',2012,'IND_NM_OTH_ELC_E',0.95*2.69E-01,'PJ','95% of base year');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'IND_NM_OTH_LPG_E',0.95*5.08E-02,'PJ','95% of base year');
INSERT INTO "MaxActivity" VALUES ('PIE',2035,'IND_NM_OTH_DST_E',0.00E+00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2035,'IND_NM_OTH_NGA_E',0.00E+00,'PJ','');

INSERT INTO "MaxActivity" VALUES ('PIE',2035,'IND_NM_OTH_ELC_E',0.00E+00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2035,'IND_NM_OTH_LPG_E',0.00E+00,'PJ','');

-- Pulp and paper
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'IND_PP_PUL_CHEM_E',0.95*1.35E-02,'Mt','95% of base year');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'IND_PP_PUL_MEC_E',0.95*9.80E-02,'Mt','95.83% of base year');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'IND_PP_PUL_REC_E',0.95*5.35E+00,'Mt','95.83% of base year');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'IND_PP_PAP_E',0.7*8.72E-01,'Mt','95% of base year');
INSERT INTO "MaxActivity" VALUES ('PIE',2035,'IND_PP_PUL_CHEM_E',0.0,'Mt','');
INSERT INTO "MaxActivity" VALUES ('PIE',2035,'IND_PP_PUL_MEC_E',0.0,'Mt','');
INSERT INTO "MaxActivity" VALUES ('PIE',2035,'IND_PP_PUL_REC_E',0.0,'Mt','');
INSERT INTO "MaxActivity" VALUES ('PIE',2035,'IND_PP_PAP_E',0.0,'Mt','');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'IND_PP_PH_HFO_E',0.035,'PJ','95% of base year');
INSERT INTO "MaxActivity" VALUES ('PIE',2013,'IND_PP_PH_HFO_E',0.035,'PJ','95% of base year');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'IND_PP_PH_DST_E',0.95*3.68E-03,'PJ','95% of base year');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'IND_PP_PH_NGA_E',0.95*2.01E-01,'PJ','95% of base year');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'IND_PP_PH_ELC_E',0.95*8.86E-02,'PJ','95% of base year');

INSERT INTO "MaxActivity" VALUES ('PIE',2035,'IND_PP_PH_HFO_E',0.0,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2035,'IND_PP_PH_DST_E',0.0,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2035,'IND_PP_PH_NGA_E',0.0,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2040,'IND_PP_PH_ELC_E',0.0,'Mt','');

INSERT INTO "MaxActivity" VALUES ('PIE',2012,'IND_PP_OTH_DST_E',0.95*4.49E-02,'PJ','95% of base year');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'IND_PP_OTH_ELC_E',0.95*8.86E-02,'PJ','95% of base year');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'IND_PP_OTH_LPG_E',0.95*4.87E-03,'PJ','95% of base year');
INSERT INTO "MaxActivity" VALUES ('PIE',2035,'IND_PP_OTH_DST_E',0.0,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2035,'IND_PP_OTH_ELC_E',0.0,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2035,'IND_PP_OTH_LPG_E',0.0,'PJ','');

------ Other industries
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'IND_OTH_PH_DST_E',0.95*9.54E-02,'PJ','95% of base year');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'IND_OTH_PH_HFO_E',0.95*3.88E-01,'PJ','95% of base year');
INSERT INTO "MaxActivity" VALUES ('PIE',2012,'IND_OTH_PH_LPG_E',0.95*6.09E-02,'PJ','95% of base year');

INSERT INTO "MaxActivity" VALUES ('PIE',2025,'IND_OTH_PH_DST_E',0.00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2035,'IND_OTH_PH_LPG_E',0.00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('PIE',2035,'IND_OTH_PH_HFO_E',0.00,'PJ','');

CREATE TABLE "LifetimeTech" (
   "regions"  text,
   "tech" text,
   "life" real,
   "life_notes"   text,
   primary key("regions","tech"),
   foreign key("tech") references "technologies"("tech")
);

-- Upstream sector
INSERT INTO "LifetimeTech" VALUES ('PIE','UPS_SEC_OVC_COG',50,'');
-- Transport sector
-- Fuel technologies
INSERT INTO "LifetimeTech" VALUES ('PIE','TRA_FT_DST_E',15,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','TRA_FT_GSL_E',15,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','TRA_FT_JTK_E',15,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','TRA_FT_LPG_E',15,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','TRA_FT_NGA_E',15,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','TRA_FT_BIO_DST_E',15,'');

INSERT INTO "LifetimeTech" VALUES ('PIE','TRA_DSL_BLN',50,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','TRA_FT_DST_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','TRA_FT_JTK_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','TRA_FT_LPG_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','TRA_FT_NGA_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','TRA_FT_GSL_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','TRA_FT_BIO_DST_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','TRA_ELC_DIV',50,'');

-- Base year technologies
INSERT INTO "LifetimeTech" VALUES ('PIE','TRA_ROA_BUS_DST_E',15,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','TRA_ROA_CAR_DST_E',12,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','TRA_ROA_CAR_GSL_E',12,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','TRA_ROA_CAR_LPG_E',12,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','TRA_ROA_CAR_NGA_E',12,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','TRA_ROA_HTR_DST_E',15,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','TRA_ROA_LCV_DST_E',15,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','TRA_ROA_LCV_GSL_E',15,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','TRA_ROA_MTR_DST_E',15,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','TRA_ROA_MCY_GSL_E',15,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','TRA_ROA_MOP_GSL_E',15,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','TRA_RAIL_DSL_EN',50,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','TRA_RAIL_ELC_EN',50,'');
-- New technologies
INSERT INTO "LifetimeTech" VALUES ('PIE','TRA_ROA_2WH_DST_N',12,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','TRA_ROA_2WH_ELC_N',12,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','TRA_ROA_2WH_GSL_N',12,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','TRA_ROA_2WH_HYBG_N',12,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','TRA_ROA_BUS_DST_N',15,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','TRA_ROA_BUS_ELC_N',12,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','TRA_ROA_BUS_FCELL_N',12,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','TRA_ROA_BUS_GSL_N',15,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','TRA_ROA_BUS_HYBD_N',15,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','TRA_ROA_BUS_LPG_N',15,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','TRA_ROA_BUS_NGA_N',15,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','TRA_ROA_CAR_DST_N',12,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','TRA_ROA_CAR_ELC_N',12,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','TRA_ROA_CAR_FCELL_N',12,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','TRA_ROA_CAR_GSL_N',12,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','TRA_ROA_CAR_HYBG_N',12,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','TRA_ROA_CAR_LPG_N',12,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','TRA_ROA_CAR_NGA_N',12,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','TRA_ROA_CAR_PIHYB_N',12,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','TRA_ROA_HTR_DST_N',15,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','TRA_ROA_HTR_ELC_N',12,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','TRA_ROA_HTR_FCELL_N',12,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','TRA_ROA_HTR_GSL_N',15,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','TRA_ROA_HTR_HYBD_N',15,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','TRA_ROA_HTR_LPG_N',15,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','TRA_ROA_HTR_NGA_N',15,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','TRA_ROA_LCV_DST_N',12,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','TRA_ROA_LCV_ELC_N',12,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','TRA_ROA_LCV_FCELL_N',12,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','TRA_ROA_LCV_GSL_N',12,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','TRA_ROA_LCV_HYBD_N',12,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','TRA_ROA_LCV_LPG_N',12,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','TRA_ROA_LCV_NGA_N',12,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','TRA_ROA_LCV_PIHYB_N',12,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','TRA_ROA_MTR_DST_N',15,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','TRA_ROA_MTR_ELC_N',12,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','TRA_ROA_MTR_FCELL_N',12,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','TRA_ROA_MTR_GSL_N',15,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','TRA_ROA_MTR_HYBD_N',15,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','TRA_ROA_MTR_LPG_N',15,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','TRA_ROA_MTR_NGA_N',15,'');

-- Electricity sector
-- Fuel technologies
INSERT INTO "LifetimeTech" VALUES ('PIE','ELC_FT_NGA',60,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','ELC_FT_HYD',60,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','ELC_FT_SOL',60,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','ELC_FT_WIN',60,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','ELC_FT_BMU',60,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','ELC_FT_SLB',60,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','ELC_FT_BGS',60,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','ELC_FT_ELC_IMP',60,'');

INSERT INTO "LifetimeTech" VALUES ('PIE','ELC_FT_BLQ',60,'');
-- Planned technologies
INSERT INTO "LifetimeTech" VALUES ('PIE','ELC_NGA_CC_P',25,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','ELC_CHP_NGA_CC_P',25,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','ELC_CHP_NGA_TURB_P',30,'');

-- New technologies
INSERT INTO "LifetimeTech" VALUES ('PIE','ELC_NGA_TURB_L80MW_N',25,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','ELC_BLQ_N',15,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','ELC_BIO_5C_N',15,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','ELC_HYD_MICRO_N',30,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','ELC_HYD_MINI_N',30,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','ELC_PV_GRO_N',20,'NREL');
INSERT INTO "LifetimeTech" VALUES ('PIE','ELC_PV_ROOF_N',20,'NREL');
INSERT INTO "LifetimeTech" VALUES ('PIE','ELC_BIOGS_AGR_N',9,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','ELC_WIN_N',20,'NREL');
INSERT INTO "LifetimeTech" VALUES ('PIE','ELC_CHP_BMU_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','ELC_CHP_NGA_TURB_N',25,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','ELC_CHP_NGA_CC_N',30,'');
-- Primary production
INSERT INTO "LifetimeTech" VALUES ('PIE','UPS_PRI_OIL',20,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','UPS_PRI_NGA',50,'');
-- Secondary transformation
INSERT INTO "LifetimeTech" VALUES ('PIE','UPS_SEC_BFG_OXY',50,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','UPS_SEC_REF',50,'');
-- Residential sector
-- Fuel technologies
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_FT_NGA_E',20,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_FT_DST_E',20,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_FT_HFO_E',20,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_FT_LPG_E',20,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_FT_BIO_E',20,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_FT_SOL_E',20,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_FT_NGA_N',50,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_FT_DST_N',100,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_FT_HFO_N',100,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_FT_LPG_N',100,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_FT_BIO_N',100,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_FT_HET_N',100,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_FT_SOL_N',100,'');
-- Base year
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_SH_BUR_NGA_LC_E',20,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_SH_AHP_NGA_LC_E',15,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_SH_BUR_DST_LC_E',20,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_SH_BUR_HFO_LC_E',50,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_SH_BUR_LPG_LC_E',20,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_SH_HT_ELC_LC_E',20,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_SH_HP_ELC_LC_E',20,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_SH_HEX_HET_LC_E',20,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_SH_WST_BIO_LC_E',20,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_SH_BUR_NGA_MC_E',20,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_SH_AHP_NGA_MC_E',15,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_SH_BUR_DST_MC_E',20,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_SH_BUR_HFO_MC_E',50,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_SH_BUR_LPG_MC_E',30,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_SH_HT_ELC_MC_E',20,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_SH_HP_ELC_MC_E',20,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_SH_HEX_HET_MC_E',20,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_SH_WST_BIO_MC_E',20,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_SH_BUR_NGA_HC_E',20,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_SH_AHP_NGA_HC_E',15,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_SH_BUR_DST_HC_E',20,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_SH_BUR_HFO_HC_E',50,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_SH_BUR_LPG_HC_E',20,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_SH_HT_ELC_HC_E',20,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_SH_HP_ELC_HC_E',20,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_SH_HEX_HET_HC_E',20,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_SH_WST_BIO_HC_E',20,'');

INSERT INTO "LifetimeTech" VALUES ('PIE','RES_SC_CEN_E',15,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_SC_EHP_E',15,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_SC_ROOM_E',15,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_WH_NGA_E',20,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_WH_DST_E',20,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_WH_HFO_E',50,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_WH_LPG_E',20,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_WH_ELC_E',20,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_WH_HET_E',20,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_RF_RFG_ELC_E',15,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_RF_FRZ_ELC_E',15,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_CW_ELC_E',15,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_CD_ELC_E',15,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_DW_ELC_E',10,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_CK_NGA_E',15,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_CK_LPG_E',15,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_CK_ELC_E',15,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_OE_EQP_E',5,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_LG_LFL_E',10,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_LG_SFL_E',10,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_LG_LHAL_E',10,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_LG_SHAL_IMP_E',10,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_LG_SHAL_E',10,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_LG_MIN_E',10,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_LG_SIN_E',10,'');
-- New technologies
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_RF_CLB_N',15,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_RF_CLA_N',15,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_RF_CLA+_N',15,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_RF_CLA++_N',15,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_RF_RFG_2020_N',15,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_RF_FRZ_CLB_N',15,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_RF_FRZ_CLA_N',15,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_RF_FRZ_CLA++_N',15,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_RF_FRZ_2020_N',15,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_WH_DST_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_WH_DST_COND_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_WH_NGA_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_WH_NGA_COND_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_WH_LPG_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_WH_HFO_N',50,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_WH_LPG_COND_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_WH_WPL_BIO_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_WH_ELC_RES_N',15,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_WH_AHP_ELC_N',15,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_WH_HNS_ELC_N',30,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_WH_SOL_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_WH_PDC_ACS_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_CW_ELC_N',15,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_CW_ELC_IMP_N',15,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_CW_ELC_ADV_N',15,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_CW_2020_ELC_N',15,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_CD_ELC_N',15,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_CD_ELC_ADV_N',15,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_CD_ELC_NEW_N',15,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_DW_ELC_STD_N',10,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_DW_ELC_IMP_N',10,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_DW_ELC_ADV_N',10,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_DW_2020_ELC_N',10,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_CK_NGA_N',17,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_CK_LPG_N',17,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_CK_ELC_N',17,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_CK_BIO_N',17,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_LG_BFL_IMP_N',10,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_LG_SFL_IMP_N',10,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_LG_EFL_N',10,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_LG_LFL_N',10,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_LG_SFL_N',10,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_LG_LHAL_N',10,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_LG_SHAL_IMP_N',10,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_LG_SHAL_N',10,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_LG_MIN_N',10,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_LG_SIN_N',10,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_LG_LED_ELC_N',10,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_SH_DST_HC_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_SH_DST_COND_HC_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_SH_NGA_HC_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_SH_NGA_COND_HC_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_SH_LPG_HC_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_SH_LPG_COND_HC_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_SH_WST_BIO_HC_N',15,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_SH_WPL_BIO_HC_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_SH_AHP_ELC_HC_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_SH_HNS_ELC_HC_N',30,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_SH_HPP_ELC_HC_N',50,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_SH_HEX_HET_HC_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_SH_HP_HET_HC_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_SH_HPTS_HC_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_SH_DST_MC_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_SH_DST_COND_MC_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_SH_NGA_MC_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_SH_NGA_COND_MC_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_SH_LPG_MC_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_SH_LPG_COND_MC_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_SH_WST_BIO_MC_N',15,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_SH_WPL_BIO_MC_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_SH_AHP_ELC_MC_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_SH_HNS_ELC_MC_N',30,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_SH_HPP_ELC_MC_N',50,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_SH_HEX_HET_MC_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_SH_HP_HET_MC_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_SH_HPTS_MC_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_SH_SOL_DST_MC_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_SH_SOL_LPG_MC_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_SH_SOL_NGA_MC_N',20,'');

INSERT INTO "LifetimeTech" VALUES ('PIE','RES_SH_DST_LC_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_SH_NGA_LC_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_SH_LPG_LC_N',20,'');

INSERT INTO "LifetimeTech" VALUES ('PIE','RES_SH_DST_COND_LC_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_SH_NGA_COND_LC_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_SH_LPG_COND_LC_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_SH_WST_BIO_LC_N',15,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_SH_WPL_BIO_LC_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_SH_AHP_ELC_LC_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_SH_HNS_ELC_LC_N',30,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_SH_HPP_ELC_LC_N',50,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_SH_HEX_HET_LC_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_SH_HP_HET_LC_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_SH_HPTS_LC_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_SH_SOL_DST_LC_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_SH_SOL_LPG_LC_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_SH_SOL_NGA_LC_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_SC_AHP_ELC_STD_N',15,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_SC_AHP_ELC_IMP_N',15,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_SC_CEN_N',15,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_SC_ROOM_N',15,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_SC_AHP_ELC_ADV_N',15,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_SC_ROOM_ELC_NEW_N',15,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_SC_AHP_NGA_ADV_N',15,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_SC_CEN_NGA_N',15,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_SC_AHP_NGA_N',15,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_SC_HP_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_MISC_EQP_N',10,'');

INSERT INTO "LifetimeTech" VALUES ('PIE','RES_SH_ROOF_INS_HC_N',50,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_SH_INT_INS_HC_N',50,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_SH_BASE_INS_HC_N',50,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_SH_WIN_INS_HC_N',20,'');

INSERT INTO "LifetimeTech" VALUES ('PIE','RES_SH_ROOF_INS_MC_N',50,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_SH_INT_INS_MC_N',50,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_SH_BASE_INS_MC_N',50,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_SH_WIN_INS_MC_N',20,'');
-- Micro-CHP
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_CHP_NGA_CI_N',15,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','RES_CHP_NGA_STR_N',15,'');
-- Commercial sector
-- Fuel technologies
INSERT INTO "LifetimeTech" VALUES ('PIE','COM_FT_NGA_N',50,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','COM_FT_DST_N',50,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','COM_FT_LPG_EN',100,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','COM_FT_BIO_N',100,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','COM_FT_HET_EN',100,'');
-- Base year technologies
INSERT INTO "LifetimeTech" VALUES ('PIE','COM_SH_HT_NGA_E',20,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','COM_SH_HP_NGA_E',20,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','COM_SH_HT_DST_E',20,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','COM_SH_HT_LPG_E',20,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','COM_SH_RES_ELC_E',20,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','COM_SH_HP_ELC_E',15,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','COM_SH_HEX_HET_E',20,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','COM_SC_ABS_NGA_E',20,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','COM_SC_CHL_DST_E',20,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','COM_SC_CCL_ELC_CNT_E',20,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','COM_SC_AHP_ELC_E',15,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','COM_SC_ROOM_ELC_E',15,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','COM_SC_ROOF_ELC_E',20,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','COM_WH_NGA_E',20,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','COM_WH_DST_E',20,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','COM_WH_LPG_E',20,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','COM_WH_ELC_E',20,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','COM_LG_INC_E',5,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','COM_LG_SHAL_E',5,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','COM_LG_IRCHAL_E',5,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','COM_LG_SFL_E',5,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','COM_LG_LFL_E',5,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','COM_LG_CFL_C_E',5,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','COM_LG_MER_E',5,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','COM_LG_SOD_E',5,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','COM_CK_NGA_E',15,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','COM_CK_LPG_E',15,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','COM_CK_ELC_E',15,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','COM_RF_RFR_ELC_E',10,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','COM_OE_OFF_ELC_E',15,'');
-- New technologies
INSERT INTO "LifetimeTech" VALUES ('PIE','COM_LG_INC_N',5,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','COM_LG_SHAL_STD_N',5,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','COM_LG_HAL_IMP_N',5,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','COM_LG_SFL_N',5,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','COM_LG_LFL_N',5,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','COM_LG_CFL_N',5,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','COM_LG_MER_N',5,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','COM_LG_SOD_N',5,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','COM_WH_COND_DST_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','COM_WH_NGA_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','COM_WH_COND_NGA_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','COM_WH_LPG_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','COM_WH_COND_LPG_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','COM_WH_WPEL_BIO_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','COM_WH_ELC_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','COM_WH_AHP_ELC_N',30,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','COM_WH_HEX_HET_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','COM_SH_NGA_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','COM_SH_COND_NGA_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','COM_SH_LPG_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','COM_SH_COND_LPG_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','COM_SH_HEX_HET_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','COM_SH_HP_AIR_N',30,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','COM_SH_HP_PRB_N',50,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','COM_SH_HP_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','COM_SH_WPEL_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','COM_SC_HP_STD_N',15,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','COM_SC_HP_IMP_N',15,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','COM_SC_ROOF_STD_N',15,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','COM_SC_ROOF_ADV_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','COM_SC_REC_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','COM_SC_REC_IMP_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','COM_SC_CNF_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','COM_SC_CNF_IMP_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','COM_SC_CNT_N',15,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','COM_SC_ROOM_N',15,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','COM_SC_ABS_NGA_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','COM_SC_NGA_STD_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','COM_SC_NGA_IMP_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','COM_CK_NGA_N',15,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','COM_CK_LPG_N',15,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','COM_CK_ELC_N',15,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','COM_CK_BIO_N',17,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','COM_OE_OFF_ELC_STD_N',10,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','COM_OE_OFF_ELC_IMP_N',10,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','COM_OE_OFF_ADV_N',10,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','COM_RF_STD_N',10,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','COM_RF_IMP_N',10,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','COM_RF_N',10,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','COM_H2G_C1',20,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','COM_H2G_C2',20,'');

-- Micro-CHP
INSERT INTO "LifetimeTech" VALUES ('PIE','COM_CHP_NGA_CI_N',15,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','COM_CHP_NGA_SOFC_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','COM_CHP_HH2_PEMFC_N',20,'');

-- Industrial sector
-- New technologies
-- Fuel technologies
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_FT_NGA_N',50,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_FT_COA_N',100,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_FT_COK_N',100,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_FT_COG_EN',100,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_FT_BFG_N',100,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_FT_ETH_N',100,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_FT_HFO_N',100,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_FT_OIL_N',100,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_FT_NAP_N',100,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_FT_PTC_N',100,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_FT_BIO_N',100,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_FT_HET_N',100,'');
-- Base year technologies
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_MD_TECH',100,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_MD_ELC_E',20,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_STM_TECH',100,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_STM_DST_E',25,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_STM_HET_E',25,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_STM_HFO_E',25,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_STM_LPG_E',25,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_STM_NGA_E',25,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_STM_COA_E',25,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_STM_BIO_E',25,'');
-- Chemicals
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_CH_TECH',100,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_CH_OLF_E',30,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_CH_BTX_E',30,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_CH_AMM_E',30,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_CH_MTH_E',30,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_CH_CHL_E',30,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_CH_OTH_E',30,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_CH_FS_NGA_E',30,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_CH_FS_LPG_E',30,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_CH_FS_KER_E',30,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_CH_FS_HFO_E',30,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_CH_FS_DST_E',30,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_CH_FS_NSP_E',30,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_CH_FS_GSL_E',30,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_CH_FS_NAP_E',30,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_CH_FS_RFG_E',30,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_CH_EC_E',30,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_CH_OTH_COK_E',30,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_CH_OTH_DST_E',30,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_CH_OTH_ELC_E',30,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_CH_OTH_ETH_E',30,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_CH_OTH_HFO_E',30,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_CH_OTH_NGA_E',30,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_CH_OTH_PTC_E',30,'');
-- Iron and steel
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_IS_TECH',100,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_IS_BOF_E',30,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_IS_EAF_E',30,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_IS_FS_PTC_E',30,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_IS_FS_COK_E',30,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_IS_OTH_ELC_E',30,'');
-- Non-ferrous metals
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_NF_TECH',100,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_NF_ALU_E',30,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_NF_COP_E',30,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_NF_ZNC_E',30,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_NF_OTH_E',30,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_NF_EC_E',30,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_NF_OTH_ELC_E',30,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_NF_OTH_DST_E',30,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_NF_OTH_NGA_E',30,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_NF_OTH_LPG_E',30,'');
-- Non-metallic minerals
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_NM_TECH',100,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_NM_CLK_DRY_E',30,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_NM_CLK_WET_E',30,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_NM_CRM_E',30,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_NM_GLS_E',30,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_NM_LIM_E',30,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_NM_OTH_COK_E',30,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_NM_OTH_DST_E',30,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_NM_OTH_ELC_E',30,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_NM_OTH_LPG_E',30,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_NM_OTH_NGA_E',30,'');
-- Pulp and paper
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_PP_TECH',100,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_PP_PAP_E',30,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_PP_PUL_CHEM_E',30,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_PP_PUL_MEC_E',30,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_PP_PUL_REC_E',30,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_PP_PH_DST_E',30,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_PP_PH_ELC_E',30,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_PP_PH_HFO_E',30,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_PP_PH_NGA_E',30,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_PP_OTH_DST_E',30,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_PP_OTH_ELC_E',30,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_PP_OTH_LPG_E',30,'');
-- Other industries
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_OTH_TECH',100,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_OTH_OTH_ELC_E',30,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_OTH_PH_DST_E',30,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_OTH_PH_HFO_E',30,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_OTH_PH_LPG_E',30,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_OTH_PH_NGA_E',30,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_NEU_TECH',100,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_ONS_TECH',100,'');
-- New technologies
-- Machine drive and steam

INSERT INTO "LifetimeTech" VALUES ('PIE','IND_MD_LPG_N',15,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_MD_NGA_N',15,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_MD_ELC_N',15,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_STM_BFG_N',30,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_STM_BIO_N',30,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_STM_DST_N',30,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_STM_ETH_N',30,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_STM_HET_N',30,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_STM_LPG_N',30,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_STM_NGA_N',30,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_STM_PTC_N',30,'');
-- Chemicals
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_CH_HVC_NAPSC_N',30,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_CH_HVC_ETHSC_N',30,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_CH_HVC_GSOSC_N',30,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_CH_HVC_LPGSC_N',30,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_CH_HVC_NCC_N',30,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_CH_HVC_BDH_N',30,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_CH_HVC_N',30,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_CH_OLF_PDH_N',30,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_CH_OLF_MTO_N',30,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_CH_AMM_NGASR_N',25,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_CH_AMM_NAPPOX_N',25,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_CH_AMM_COAGSF_N',25,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_CH_AMM_BIOGSF_N',25,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_CH_AMM_ELCSYS_N',25,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_CH_MTH_NGASR_N',30,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_CH_MTH_COGSR_N',30,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_CH_MTH_LPGSR_N',30,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_CH_MTH_COAGSF_N',30,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_CH_MTH_BIOGSF_N',30,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_CH_MTH_ELCSYS_N',30,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_CH_CHL_MERC_N',30,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_CH_CHL_DIAP_N',30,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_CH_CHL_MEMB_N',30,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_CH_EC_N',30,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_CH_FS_BIO_N',30,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_CH_FS_COA_N',30,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_CH_FS_DST_N',30,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_CH_FS_ETH_N',30,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_CH_FS_LPG_N',30,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_CH_FS_MTH_N',30,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_CH_FS_NAP_N',30,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_CH_FS_NGA_N',30,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_CH_OTH_COK_N',30,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_CH_OTH_DST_N',30,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_CH_OTH_ELC_N',30,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_CH_OTH_ETH_N',30,'');

INSERT INTO "LifetimeTech" VALUES ('PIE','IND_CH_OTH_NGA_N',30,'');
-- Iron and steel
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_IS_BOF_BFBOF_N',30,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_IS_DRI_DRIEAF_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_IS_DRI_HDREAF_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_IS_BOF_HISBOF_N',30,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_IS_BOF_ULCOWIN_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_IS_BOF_ULCOLYSIS_N',20,'');
-- Non-ferrous metals
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_NF_AMN_BAY_N',40,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_NF_ALU_HLH_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_NF_ALU_SEC_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_NF_ALU_HLHIA_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_NF_ALU_CBT_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_NF_ALU_KAO_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_NF_COP_N',30,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_NF_ZNC_N',30,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_NF_EC_N',30,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_NF_OTH_ELC_N',30,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_NF_OTH_DST_N',30,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_NF_OTH_NGA_N',30,'');
-- Non-metallic minerals
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_NM_CLK_DRY_N',30,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_NM_CLK_WET_N',30,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_NM_CEM_BLN_N',25,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_NM_CLK_DRYCL_PCCS_N',25,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_NM_CLK_DRYCL_OCCS_N',25,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_NM_CEM_AAC_N',25,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_NM_CEM_BEL_N',25,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_NM_LIM_LRK_N',25,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_NM_GLS_FOSS_N',25,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_NM_GLS_ELEC_N',25,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_NM_CRM_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_NM_EC_N',30,'');
-- Pulp and paper
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_PP_PUL_KRF_N',30,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_PP_PUL_SUL_N',30,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_PP_PUL_MEC_N',30,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_PP_PUL_SCH_N',30,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_PP_PUL_REC_N',30,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_PP_PAP_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_PP_PH_HFO_N',30,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_PP_PH_NGA_N',30,'');
-- Other industries
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_OTH_OTH_ELC_N',25,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_OTH_PH_DST_N',25,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_OTH_PH_HFO_N',25,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_OTH_PH_LPG_N',25,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_OTH_PH_NGA_N',30,'');
-- Micro-CHP
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_CHP_NGA_CI_N',15,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_CHP_NGA_TV_N',30,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_CHP_BLQ_CI_N',15,'');

-- Hydrogen
INSERT INTO "LifetimeTech" VALUES ('PIE','IND_H2G_DE',100,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','H2_SMR_CL',20,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','H2_SMR_CS',20,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','H2_HOPO',25,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','H2_TRA_FT_GC1',20,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','H2_TRA_FT_GC2',20,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','H2_TRA_FT_GC3',20,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','H2_TRA_FT_GC4',20,'');
INSERT INTO "LifetimeTech" VALUES ('PIE','H2_TRA_FT_GC5',20,'');

CREATE TABLE "LifetimeProcess" (
   "regions"  text,
   "tech" text,
   "vintage"  integer,
   "life_process" real,
   "life_process_notes"   text,
   primary key("regions","tech","vintage"),
   foreign key("vintage") references "time_periods"("t_periods"),
   foreign key("tech") references "technologies"("tech")
);

-- Commercial sector
-- Micro-CHP
INSERT INTO "LifetimeProcess" VALUES ('PIE','COM_CHP_NGA_MICRO_N',2012,12,'');
INSERT INTO "LifetimeProcess" VALUES ('PIE','COM_CHP_NGA_MICRO_N',2014,13,'');
INSERT INTO "LifetimeProcess" VALUES ('PIE','COM_CHP_NGA_MICRO_N',2023,16,'');
INSERT INTO "LifetimeProcess" VALUES ('PIE','COM_CHP_NGA_MICRO_N',2030,20,'');
INSERT INTO "LifetimeProcess" VALUES ('PIE','COM_CHP_NGA_CC_N',2012,15,'');
INSERT INTO "LifetimeProcess" VALUES ('PIE','COM_CHP_NGA_CC_N',2014,18,'');
INSERT INTO "LifetimeProcess" VALUES ('PIE','COM_CHP_NGA_CC_N',2023,20,'');
INSERT INTO "LifetimeProcess" VALUES ('PIE','COM_CHP_NGA_CC_N',2030,20,'');
-- Industry sector
-- Micro-CHP
INSERT INTO "LifetimeProcess" VALUES ('PIE','IND_CHP_NGA_TG_N',2012,20,'');
INSERT INTO "LifetimeProcess" VALUES ('PIE','IND_CHP_NGA_TG_N',2014,22,'');
INSERT INTO "LifetimeProcess" VALUES ('PIE','IND_CHP_NGA_TG_N',2030,25,'');

CREATE TABLE "LifetimeLoanTech" (
   "regions"  text,
   "tech" text,
   "loan" real,
   "loan_notes"   text,
   primary key("regions","tech"),
   foreign key("tech") references "technologies"("tech")
);


CREATE TABLE "GrowthRateSeed" (
   "regions"  text,
   "tech" text,
   "growthrate_seed"  real,
   "growthrate_seed_units"    text,
   "growthrate_seed_notes"    text,
   primary key("regions","tech"),
   foreign key("tech") references "technologies"("tech")
);


CREATE TABLE "GrowthRateMax" (
   "regions"  text,
   "tech" text,
   "growthrate_max"   real,
   "growthrate_max_notes" text,
   primary key("regions","tech"),
   foreign key("tech") references "technologies"("tech")
);


CREATE TABLE "GlobalDiscountRate" (
   "rate" real
);
INSERT INTO "GlobalDiscountRate" VALUES (0.05);

CREATE TABLE "ExistingCapacity" (
   "regions"  text,
   "tech" text,
   "vintage"  integer,
   "exist_cap"    real,
   "exist_cap_units"  text,
   "exist_cap_notes"  text,
   primary key("regions","tech","vintage"),
   foreign key("tech") references "technologies"("tech"),
   foreign key("vintage") references "time_periods"("t_periods")
);
-- Transport sector
-- Fuel technologies

INSERT INTO "ExistingCapacity" VALUES ('PIE','TRA_FT_NGA_E',2011,9.150E-01,'','0.3% of the total NG consumption in 2011');
INSERT INTO "ExistingCapacity" VALUES ('PIE','TRA_FT_LPG_E',2011,3.960E+00,'','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','TRA_FT_GSL_E',2011,3.009E+01,'','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','TRA_FT_JTK_E',2011,2.225E+00,'','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','TRA_FT_DST_E',2011,8.186E+01,'','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','TRA_FT_ELC',2011,3.08E+00,'','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','TRA_DSL_BLN',2011,8.186E+01,'','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','TRA_FT_BIO_DST_E',2011,1.02*3.98E+00,'','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','TRA_ELC_DIV',2011,3.08E+00,'','');
-- Base year technologies
INSERT INTO "ExistingCapacity" VALUES ('PIE','TRA_ROA_CAR_GSL_E',2011,7.656E+00,'','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','TRA_ROA_CAR_DST_E',2011,1.357E+01,'','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','TRA_ROA_CAR_LPG_E',2011,1.188E+00,'','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','TRA_ROA_CAR_NGA_E',2011,2.503E-01,'','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','TRA_ROA_MCY_GSL_E',2011,1.16E+00,'','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','TRA_ROA_MOP_GSL_E',2011,3.15E+00,'','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','TRA_ROA_HTR_DST_E',2011,6.16E-01,'','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','TRA_ROA_LCV_GSL_E',2011,2.26E-01,'','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','TRA_ROA_LCV_DST_E',2011,4.83E+00,'','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','TRA_ROA_MTR_DST_E',2011,5.384E-01,'','');

INSERT INTO "ExistingCapacity" VALUES ('PIE','TRA_AVI_EN',2011,3.225E+00,'','updated based on GSE Report');
INSERT INTO "ExistingCapacity" VALUES ('PIE','TRA_RAIL_DSL_EN',2011,5.78E-01,'','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','TRA_RAIL_ELC_EN',2011,1.51E+00,'','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','TRA_OTH_ELC_EN',2011,1.53E+00,'','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','TRA_ROA_BUS_DST_E',2011,1.08E-01,'','');
-- Electricity sector
-- Fuel technologies
INSERT INTO "ExistingCapacity" VALUES ('PIE','ELC_FT_NGA',2011,1.15E+02,'PJ','Bollettino Gas');

-- Base year technologies
INSERT INTO "ExistingCapacity" VALUES ('PIE','ELC_NGA_CC_E',2011,2.705E+00,'GW','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','ELC_NGA_STM_REP_E',2011,9.28E-02,'GW','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','ELC_NGA_TURB_E',2011,1.76E-01,'GW','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','ELC_CHP_NGA_CC_E',2011,2.203E+00,'GW','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','ELC_CHP_NGA_TURB_E',2011,1.68E-01,'GW','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','ELC_CHP_NGA_STM_COND_E',2011,5.198E-01,'GW','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','ELC_CHP_BMU_E',2011,2.03E-02,'GW','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','ELC_CHP_BIO_E',2011,3.13E-02,'GW','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','ELC_BGS_E',2011,9.32E-02,'GW','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','ELC_BIO_E',2011,2.13E-02,'GW','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','ELC_SOL_E',2011,1.071E+00,'GW','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','ELC_WIN_E',2011,1.44E-02,'GW','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','ELC_HYD_FLO_E',2011,1.89E00,'GW','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','ELC_HYD_RES_E',2011,1.56E00,'GW','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','ELC_HYD_PUM_E',2011,1.01E00,'GW','');
-- Upstream sector
-- Importation
INSERT INTO "ExistingCapacity" VALUES ('PIE','UPS_IMP_OIL_CRD',2011,1.45E+02,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','UPS_IMP_GAS_NGA',2011,3.20E+02,'PJ','+5% of 2011 data, Bollettino gas');
INSERT INTO "ExistingCapacity" VALUES ('PIE','UPS_IMP_COA_COC',2011,4.20E00,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','UPS_IMP_COA_HCO',2011,1.13E00,'PJ','GSE Report');
INSERT INTO "ExistingCapacity" VALUES ('PIE','UPS_SEC_OVC_COG',2011,0.10*151.70,'PJ','10% of TEMOA-Italy');
INSERT INTO "ExistingCapacity" VALUES ('PIE','UPS_COA_HCO',2011,1.28E+00,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','UPS_IMP_COA_OVC',2011,1.28E+00,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','UPS_IMP_OIL_PTC',2011,7.83E+00,'PJ','');
-- Fuel technologies
-- Grouping Technologies 'UPS_PRI_NGA'
INSERT INTO "ExistingCapacity" VALUES ('PIE','UPS_GRO_NGAS',2011,3.051E+02,'PJ','');
-- Primary production (Extraction of fossil fuels)
INSERT INTO "ExistingCapacity" VALUES ('PIE','UPS_PRI_NGA',2011,1.80E+00,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','UPS_PRI_OIL',2011,1.04E+01,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','UPS_MIN_RES_HOIL',2011,2.46E+01,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','UPS_MIN_RES_NGA',2011,1.79E+01,'PJ','');
-- Secondary transformation
INSERT INTO "ExistingCapacity" VALUES ('PIE','UPS_SEC_BFG_OXY',2011,4.475,'PJ','MaxAct is zero, GSE rapportomonitoraggio');
INSERT INTO "ExistingCapacity" VALUES ('PIE','UPS_SEC_REF',2011,10*376.81,'PJ','');
-- Residential sector
-- Fuel technologies
INSERT INTO "ExistingCapacity" VALUES ('PIE','RES_FT_NGA_E',2011,8.10E+01,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','RES_FT_DST_E',2011,2.06E+00,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','RES_FT_HFO_E',2011,3.72E-01,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','RES_FT_LPG_E',2011,3.92E+00,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','RES_FT_BIO_E',2011,2.53E+01,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','RES_FT_HET_E',2011,7.61E+00,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','RES_FT_ELC_E',2011,2.13E+01,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','RES_FT_SOL_E',2011,3.98E-01,'PJ','');

-- Base year technologies
INSERT INTO "ExistingCapacity" VALUES ('PIE','RES_SH_BUR_NGA_LC_E',2011,4.44E+00,'Mm2','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','RES_SH_AHP_NGA_LC_E',2011,6.77E-02,'Mm2','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','RES_SH_BUR_DST_LC_E',2011,3.41E-01,'Mm2','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','RES_SH_BUR_HFO_LC_E',2011,1.47E-02,'Mm2','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','RES_SH_BUR_LPG_LC_E',2011,1.76E-01,'Mm2','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','RES_SH_HT_ELC_LC_E',2011,1.25E-02,'Mm2','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','RES_SH_HP_ELC_LC_E',2011,3.20E-03,'Mm2','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','RES_SH_HEX_HET_LC_E',2011,7.17E-02,'Mm2','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','RES_SH_WST_BIO_LC_E',2011,6.76E-02,'Mm2','');

INSERT INTO "ExistingCapacity" VALUES ('PIE','RES_SH_BUR_NGA_MC_E',2011,8.53E+00,'Mm2','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','RES_SH_AHP_NGA_MC_E',2011,1.81E-01,'Mm2','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','RES_SH_BUR_DST_MC_E',2011,2.75E+00,'Mm2','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','RES_SH_BUR_HFO_MC_E',2011,8.00E-02,'Mm2','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','RES_SH_BUR_LPG_MC_E',2011,7.15E-01,'Mm2','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','RES_SH_HT_ELC_MC_E',2011,3.41E-02,'Mm2','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','RES_SH_HP_ELC_MC_E',2011,2.50E-02,'Mm2','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','RES_SH_HEX_HET_MC_E',2011,3.40E-01,'Mm2','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','RES_SH_WST_BIO_MC_E',2011,3.22E-01,'Mm2','');

INSERT INTO "ExistingCapacity" VALUES ('PIE','RES_SH_BUR_NGA_HC_E',2011,1.70E+02,'Mm2','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','RES_SH_AHP_NGA_HC_E',2011,2.92E+00,'Mm2','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','RES_SH_BUR_DST_HC_E',2011,5.16E+01,'Mm2','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','RES_SH_BUR_HFO_HC_E',2011,2.54E+00,'Mm2','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','RES_SH_BUR_LPG_HC_E',2011,1.54E+01,'Mm2','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','RES_SH_HT_ELC_HC_E',2011,4.88E+00,'Mm2','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','RES_SH_HP_ELC_HC_E',2011,6.40E-01,'Mm2','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','RES_SH_HEX_HET_HC_E',2011,4.70E-01,'Mm2','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','RES_SH_WST_BIO_HC_E',2011,6.40E+00,'Mm2','');

INSERT INTO "ExistingCapacity" VALUES ('PIE','RES_SC_CEN_E',2011,1.45E+01,'Mm2','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','RES_SC_EHP_E',2011,1.32E00,'Mm2','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','RES_SC_ROOM_E',2011,1.14E+01,'Mm2','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','RES_WH_NGA_E',2011,3.48E+01,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','RES_WH_DST_E',2011,4.57E00,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','RES_WH_HFO_E',2011,1.67E-01,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','RES_WH_LPG_E',2011,3.23E-01,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','RES_WH_ELC_E',2011,2.52E+01,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','RES_WH_HET_E',2011,7.05E00,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','RES_WH_BIO_E',2011,5.10E-01,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','RES_RF_RFG_ELC_E',2011,7.19E-01,'Gl','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','RES_RF_FRZ_ELC_E',2011,1.83E-01,'Gl','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','RES_CW_ELC_E',2011,6.02E-01,'Glav','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','RES_CD_ELC_E',2011,8.29E-03,'Glav','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','RES_DW_ELC_E',2011,2.77E00,'Glav','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','RES_CK_NGA_E',2011,1.07E+00,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','RES_CK_LPG_E',2011,6.40E-01,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','RES_CK_ELC_E',2011,8.78E-01,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','RES_OE_EQP_E',2011,6.85E+00,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','RES_LG_LFL_E',2011,1.16E+01,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','RES_LG_SFL_E',2011,1.20E+01,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','RES_LG_LHAL_E',2011,3.20E-01,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','RES_LG_SHAL_IMP_E',2011,4.89E-01,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','RES_LG_SHAL_E',2011,6.77E-01,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','RES_LG_MIN_E',2011,9.79E+00,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','RES_LG_SIN_E',2011,8.28E+00,'PJ','');
-- Commercial sector
-- Fuel technologies
INSERT INTO "ExistingCapacity" VALUES ('PIE','COM_FT_ELC_EN',2011,2.20E+01,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','COM_FT_NGA_E',2011,4.36E+01,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','COM_FT_DST_E',2011,1.03E+00,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','COM_FT_LPG_EN',2011,5.60E-01,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','COM_FT_HET_EN',2011,1.61E+00,'PJ','');
-- Base year technologies
INSERT INTO "ExistingCapacity" VALUES ('PIE','COM_SH_HT_NGA_E',2011,7.21E+01,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','COM_SH_HP_NGA_E',2011,1.96E-02,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','COM_SH_HT_DST_E',2011,2.40E+00,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','COM_SH_HT_LPG_E',2011,8.21E-03,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','COM_SH_RES_ELC_E',2011,1.11E+00,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','COM_SH_HP_ELC_E',2011,7.42E+00,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','COM_SH_HEX_HET_E',2011,1.46E+00,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','COM_SC_ABS_NGA_E',2011,1.62E+01,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','COM_SC_CHL_DST_E',2011,6.50E-01,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','COM_SC_CCL_ELC_CNT_E',2011,3.76E+01,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','COM_SC_AHP_ELC_E',2011,2.34E-01,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','COM_SC_ROOM_ELC_E',2011,7.78E+00,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','COM_SC_ROOF_ELC_E',2011,2.43E+01,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','COM_WH_NGA_E',2011,6.85E+00,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','COM_WH_DST_E',2011,8.17E-01,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','COM_WH_LPG_E',2011,9.19E-03,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','COM_WH_ELC_E',2011,8.10E+00,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','COM_WH_HET_E',2011,0.7*8.33E-01,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','COM_LG_INC_E',2011,2.08E-01,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','COM_LG_SHAL_E',2011,9.47E-02,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','COM_LG_IRCHAL_E',2011,1.24E-01,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','COM_LG_SFL_E',2011,1.25E+01,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','COM_LG_LFL_E',2011,1.55E+01,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','COM_LG_CFL_C_E',2011,3.17E+00,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','COM_LG_MER_E',2011,1.90E+00,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','COM_LG_SOD_E',2011,4.75E-01,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','COM_CK_NGA_E',2011,6.32E-01,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','COM_CK_LPG_E',2011,2.45E-04,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','COM_CK_ELC_E',2011,2.11E-01,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','COM_RF_RFR_ELC_E',2011,9.90E+00,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','COM_OE_OFF_ELC_E',2011,7.44E+00,'PJ','');
-- Agriculture sector
-- Fuel technologies
INSERT INTO "ExistingCapacity" VALUES ('PIE','AGR_FT_NGA_E',2011,2.96E+01,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','AGR_FT_DST_E',2011,5.23E+00,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','AGR_FT_GSL_E',2011,2.08E-01,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','AGR_FT_LPG_E',2011,5.14E-01,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','AGR_FT_ELC_E',2011,1.19E+00,'PJ','');
-- Base year technologies
INSERT INTO "ExistingCapacity" VALUES ('PIE','AGR_TECH',2011,8.58E+00,'PJ','');
-- Industrial sector
-- Fuel technologies
INSERT INTO "ExistingCapacity" VALUES ('PIE','IND_FT_NGA_E',2011,5.24E+01,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','IND_FT_LPG_E',2011,1.49E+00,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','IND_FT_COA_E',2011,3.11E+00,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','IND_FT_COK_E',2011,5.63E+00,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','IND_FT_BFG_E',2011,1.43E-02,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','IND_FT_HFO_E',2011,1.08E+01,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','IND_FT_OIL_E',2011,5.81E+00,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','IND_FT_ETH_E',2011,2.04E+00,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','IND_FT_NAP_E',2011,9.91E+00,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','IND_FT_PTC_E',2011,8.52E+00,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','IND_FT_BIO_E',2011,9.22E-01,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','IND_FT_HET_E',2011,2.81E+00,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','IND_FT_ELC_EN',2011,6.35E+01,'PJ','');

-- Base year technologies
-- Machine drive and steam
INSERT INTO "ExistingCapacity" VALUES ('PIE','IND_MD_TECH',2011,0.08*2.44E+01,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','IND_MD_ELC_E',2011,2.90E+01,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','IND_STM_TECH',2011,0.08*2.030E+01,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','IND_STM_NGA_E',2011,1.43E+00,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','IND_STM_LPG_E',2011,1.31E-02,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','IND_STM_COA_E',2011,1.02E-03,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','IND_STM_HFO_E',2011,3.66E-02,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','IND_STM_BIO_E',2011,7.07E-02,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','IND_STM_DST_E',2011,6.38E-02,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','IND_STM_HET_E',2011,9.21E+00,'PJ','');

-- Chemicals
INSERT INTO "ExistingCapacity" VALUES ('PIE','IND_CH_TECH',2011,1.50E+00,'Mt','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','IND_CH_OLF_E',2011,2.12E-01,'Mt','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','IND_CH_BTX_E',2011,5.77E-02,'Mt','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','IND_CH_AMM_E',2011,4.62E-02,'Mt','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','IND_CH_MTH_E',2011,3.56E-03,'Mt','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','IND_CH_CHL_E',2011,1.54E-02,'Mt','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','IND_CH_OTH_E',2011,1.16E+00,'Mt','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','IND_CH_FS_NGA_E',2011,2.86E-02,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','IND_CH_FS_LPG_E',2011,4.65E-02,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','IND_CH_FS_KER_E',2011,6.28E-02,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','IND_CH_FS_HFO_E',2011,0.6*1.25E+00,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','IND_CH_FS_DST_E',2011,1.97E-02,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','IND_CH_FS_NSP_E',2011,8.38E-02,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','IND_CH_FS_GSL_E',2011,4.52E-01,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','IND_CH_FS_NAP_E',2011,9.02E-02,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','IND_CH_FS_RFG_E',2011,1.40E-02,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','IND_CH_EC_E',2011,1.22E+00,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','IND_CH_OTH_COK_E',2011,2.07E-01,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','IND_CH_OTH_DST_E',2011,3.58E-01,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','IND_CH_OTH_ELC_E',2011,1.03E-01,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','IND_CH_OTH_ETH_E',2011,1.35E-01,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','IND_CH_OTH_HFO_E',2011,3.39E-02,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','IND_CH_OTH_NGA_E',2011,6.21E-01,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','IND_CH_OTH_PTC_E',2011,3.08E-02,'PJ','');
-- Iron and steel
INSERT INTO "ExistingCapacity" VALUES ('PIE','IND_IS_TECH',2011,2.98E+00,'Mt','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','IND_IS_BOF_E',2011,1.11E+00,'Mt','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','IND_IS_EAF_E',2011,1.87E+00,'Mt','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','IND_IS_OTH_ELC_E',2011,3.03E-01,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','IND_IS_FS_PTC_E',2011,1.24E-02,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','IND_IS_FS_COK_E',2011,6.93E-01,'PJ','');
-- Non-ferrous metals
INSERT INTO "ExistingCapacity" VALUES ('PIE','IND_NF_TECH',2011,1.25E+00,'Mt','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','IND_NF_ALU_E',2011,6.11E-01,'Mt','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','IND_NF_COP_E',2011,1.15E-01,'Mt','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','IND_NF_ZNC_E',2011,0.80*1.10E-01,'Mt','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','IND_NF_OTH_E',2011,4.10E-01,'Mt','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','IND_NF_EC_E',2011,0.6*1.00E+00,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','IND_NF_OTH_ELC_E',2011,0.6*8.80E-01,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','IND_NF_OTH_DST_E',2011,7.45E-02,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','IND_NF_OTH_NGA_E',2011,9.04E-01,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','IND_NF_OTH_LPG_E',2011,0.05*8.83E-01,'PJ','');
-- Non-metallic minerals
INSERT INTO "ExistingCapacity" VALUES ('PIE','IND_NM_TECH',2011,1.88E+00,'Mt','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','IND_NM_CLK_DRY_E',2011,6.92E-01,'Mt','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','IND_NM_CLK_WET_E',2011,2.76E-01,'Mt','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','IND_NM_LIM_E',2011,2.62E-01,'Mt','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','IND_NM_GLS_E',2011,1.84E-01,'Mt','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','IND_NM_CRM_E',2011,4.00E-01,'Mt','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','IND_NM_OTH_DST_E',2011,1.09E-02,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','IND_NM_OTH_NGA_E',2011,3.68E-01,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','IND_NM_OTH_COK_E',2011,8.70E-03,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','IND_NM_OTH_ELC_E',2011,2.69E-01,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','IND_NM_OTH_LPG_E',2011,3.31E-02,'PJ','');

-- Pulp and paper
INSERT INTO "ExistingCapacity" VALUES ('PIE','IND_PP_TECH',2011,8.72E-01,'Mt','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','IND_PP_PUL_CHEM_E',2011,1.35E-02,'Mt','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','IND_PP_PUL_MEC_E',2011,9.80E-02,'Mt','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','IND_PP_PUL_REC_E',2011,4.86E-01,'Mt','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','IND_PP_PAP_E',2011,0.1*8.72E-01,'Mt','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','IND_PP_PH_HFO_E',2011,3.17E-02,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','IND_PP_PH_DST_E',2011,3.68E-03,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','IND_PP_PH_NGA_E',2011,2.01E-01,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','IND_PP_PH_ELC_E',2011,8.86E-02,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','IND_PP_OTH_DST_E',2011,3.68E-03,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','IND_PP_OTH_ELC_E',2011,8.86E-02,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','IND_PP_OTH_LPG_E',2011,4.87E-03,'PJ','');
-- Other energy use
INSERT INTO "ExistingCapacity" VALUES ('PIE','IND_OTH_TECH',2011,0.08*3.90E+01,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','IND_OTH_PH_DST_E',2011,9.54E-02,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','IND_OTH_PH_HFO_E',2011,3.88E-01,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','IND_OTH_PH_LPG_E',2011,6.09E-02,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','IND_OTH_PH_NGA_E',2011,0.08*1.49E+01,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','IND_OTH_OTH_ELC_E',2011,3.11E+01,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','IND_ONS_TECH',2011,0.08*1.38E+00,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('PIE','IND_NEU_TECH',2011,0.08*1.60E+00,'PJ','');

-- Dummy water-energy techs
INSERT INTO "ExistingCapacity" VALUES ('PIE','DMY_WAT_TECH',2011,1.20*5.62E+00,'PJ','');
CREATE TABLE "EmissionLimit" (
   "regions"  text,
   "periods"  integer,
   "emis_comm"    text,
   "emis_limit"   real,
   "emis_limit_units" text,
   "emis_limit_notes" text,
   primary key("periods","emis_comm"),
   foreign key("periods") references "time_periods"("t_periods"),
   foreign key("emis_comm") references "commodities"("comm_name")
);


CREATE TABLE "EmissionActivity" (
   "regions"  text,
   "emis_comm"    text,
   "input_comm"   text,
   "tech" text,
   "vintage"  integer,
   "output_comm"  text,
   "emis_act" real,
   "emis_act_units"   text,
   "emis_act_notes"   text,
   primary key("regions","emis_comm","input_comm","tech","vintage","output_comm"),
   foreign key("input_comm") references "commodities"("comm_name"),
   foreign key("tech") references "technologies"("tech"),
   foreign key("vintage") references "time_periods"("t_periods"),
   foreign key("output_comm") references "commodities"("comm_name"),
   foreign key("emis_comm") references "commodities"("comm_name")
);
-- Upstream
INSERT INTO "EmissionActivity" VALUES ('PIE','UPS_CO2_PRC','OIL_FEE','UPS_SEC_REF',2011,'OIL_LPG',1.60,'[kt/PJ]','');
INSERT INTO "EmissionActivity" VALUES ('PIE','UPS_CO2_PRC','GAS_NGA','UPS_SEC_REF',2011,'OIL_LPG',1.60,'[kt/PJ]','');
INSERT INTO "EmissionActivity" VALUES ('PIE','UPS_CO2_PRC','ELC_CEN','UPS_SEC_REF',2011,'OIL_LPG',1.60,'[kt/PJ]','');
INSERT INTO "EmissionActivity" VALUES ('PIE','UPS_CO2_PRC','HET','UPS_SEC_REF',2011,'OIL_LPG',1.60,'[kt/PJ]','');
INSERT INTO "EmissionActivity" VALUES ('PIE','UPS_CO2_PRC','OIL_FEE','UPS_SEC_REF',2011,'OIL_GSL',1.60,'[kt/PJ]','');
INSERT INTO "EmissionActivity" VALUES ('PIE','UPS_CO2_PRC','GAS_NGA','UPS_SEC_REF',2011,'OIL_GSL',1.60,'[kt/PJ]','');
INSERT INTO "EmissionActivity" VALUES ('PIE','UPS_CO2_PRC','ELC_CEN','UPS_SEC_REF',2011,'OIL_GSL',1.60,'[kt/PJ]','');
INSERT INTO "EmissionActivity" VALUES ('PIE','UPS_CO2_PRC','HET','UPS_SEC_REF',2011,'OIL_GSL',1.60,'[kt/PJ]','');
INSERT INTO "EmissionActivity" VALUES ('PIE','UPS_CO2_PRC','OIL_FEE','UPS_SEC_REF',2011,'OIL_JTK',1.60,'[kt/PJ]','');
INSERT INTO "EmissionActivity" VALUES ('PIE','UPS_CO2_PRC','GAS_NGA','UPS_SEC_REF',2011,'OIL_JTK',1.60,'[kt/PJ]','');
INSERT INTO "EmissionActivity" VALUES ('PIE','UPS_CO2_PRC','ELC_CEN','UPS_SEC_REF',2011,'OIL_JTK',1.60,'[kt/PJ]','');
INSERT INTO "EmissionActivity" VALUES ('PIE','UPS_CO2_PRC','HET','UPS_SEC_REF',2011,'OIL_JTK',1.60,'[kt/PJ]','');
INSERT INTO "EmissionActivity" VALUES ('PIE','UPS_CO2_PRC','OIL_FEE','UPS_SEC_REF',2011,'OIL_KER',1.60,'[kt/PJ]','');
INSERT INTO "EmissionActivity" VALUES ('PIE','UPS_CO2_PRC','GAS_NGA','UPS_SEC_REF',2011,'OIL_KER',1.60,'[kt/PJ]','');
INSERT INTO "EmissionActivity" VALUES ('PIE','UPS_CO2_PRC','ELC_CEN','UPS_SEC_REF',2011,'OIL_KER',1.60,'[kt/PJ]','');
INSERT INTO "EmissionActivity" VALUES ('PIE','UPS_CO2_PRC','HET','UPS_SEC_REF',2011,'OIL_KER',1.60,'[kt/PJ]','');
INSERT INTO "EmissionActivity" VALUES ('PIE','UPS_CO2_PRC','OIL_FEE','UPS_SEC_REF',2011,'OIL_DST',1.60,'[kt/PJ]','');
INSERT INTO "EmissionActivity" VALUES ('PIE','UPS_CO2_PRC','GAS_NGA','UPS_SEC_REF',2011,'OIL_DST',1.60,'[kt/PJ]','');
INSERT INTO "EmissionActivity" VALUES ('PIE','UPS_CO2_PRC','ELC_CEN','UPS_SEC_REF',2011,'OIL_DST',1.60,'[kt/PJ]','');
INSERT INTO "EmissionActivity" VALUES ('PIE','UPS_CO2_PRC','HET','UPS_SEC_REF',2011,'OIL_DST',1.60,'[kt/PJ]','');
INSERT INTO "EmissionActivity" VALUES ('PIE','UPS_CO2_PRC','OIL_FEE','UPS_SEC_REF',2011,'OIL_HFO',1.60,'[kt/PJ]','');
INSERT INTO "EmissionActivity" VALUES ('PIE','UPS_CO2_PRC','GAS_NGA','UPS_SEC_REF',2011,'OIL_HFO',1.60,'[kt/PJ]','');
INSERT INTO "EmissionActivity" VALUES ('PIE','UPS_CO2_PRC','ELC_CEN','UPS_SEC_REF',2011,'OIL_HFO',1.60,'[kt/PJ]','');
INSERT INTO "EmissionActivity" VALUES ('PIE','UPS_CO2_PRC','HET','UPS_SEC_REF',2011,'OIL_HFO',1.60,'[kt/PJ]','');
INSERT INTO "EmissionActivity" VALUES ('PIE','UPS_CO2_PRC','OIL_FEE','UPS_SEC_REF',2011,'OIL_NAP',1.60,'[kt/PJ]','');
INSERT INTO "EmissionActivity" VALUES ('PIE','UPS_CO2_PRC','GAS_NGA','UPS_SEC_REF',2011,'OIL_NAP',1.60,'[kt/PJ]','');
INSERT INTO "EmissionActivity" VALUES ('PIE','UPS_CO2_PRC','ELC_CEN','UPS_SEC_REF',2011,'OIL_NAP',1.60,'[kt/PJ]','');
INSERT INTO "EmissionActivity" VALUES ('PIE','UPS_CO2_PRC','HET','UPS_SEC_REF',2011,'OIL_NAP',1.60,'[kt/PJ]','');
INSERT INTO "EmissionActivity" VALUES ('PIE','UPS_CO2_PRC','OIL_FEE','UPS_SEC_REF',2011,'OIL_RFG',1.60,'[kt/PJ]','');
INSERT INTO "EmissionActivity" VALUES ('PIE','UPS_CO2_PRC','GAS_NGA','UPS_SEC_REF',2011,'OIL_RFG',1.60,'[kt/PJ]','');
INSERT INTO "EmissionActivity" VALUES ('PIE','UPS_CO2_PRC','ELC_CEN','UPS_SEC_REF',2011,'OIL_RFG',1.60,'[kt/PJ]','');
INSERT INTO "EmissionActivity" VALUES ('PIE','UPS_CO2_PRC','HET','UPS_SEC_REF',2011,'OIL_RFG',1.60,'[kt/PJ]','');
INSERT INTO "EmissionActivity" VALUES ('PIE','UPS_CO2_PRC','OIL_FEE','UPS_SEC_REF',2011,'GAS_ETH',1.60,'[kt/PJ]','');
INSERT INTO "EmissionActivity" VALUES ('PIE','UPS_CO2_PRC','GAS_NGA','UPS_SEC_REF',2011,'GAS_ETH',1.60,'[kt/PJ]','');
INSERT INTO "EmissionActivity" VALUES ('PIE','UPS_CO2_PRC','ELC_CEN','UPS_SEC_REF',2011,'GAS_ETH',1.60,'[kt/PJ]','');
INSERT INTO "EmissionActivity" VALUES ('PIE','UPS_CO2_PRC','HET','UPS_SEC_REF',2011,'GAS_ETH',1.60,'[kt/PJ]','');

-- Non-metallic minerals
INSERT INTO "EmissionActivity" VALUES ('PIE','IND_CO2_PRC','IND_NGA','IND_NM_CLK_DRY_E',2011,'IND_NM_CMT',484.50,'[kt/Mt]','');
INSERT INTO "EmissionActivity" VALUES ('PIE','IND_CO2_PRC','IND_COA','IND_NM_CLK_DRY_E',2011,'IND_NM_CMT',484.50,'[kt/Mt]','');
INSERT INTO "EmissionActivity" VALUES ('PIE','IND_CO2_PRC','IND_HFO','IND_NM_CLK_DRY_E',2011,'IND_NM_CMT',484.50,'[kt/Mt]','');
INSERT INTO "EmissionActivity" VALUES ('PIE','IND_CO2_PRC','IND_PTC','IND_NM_CLK_DRY_E',2011,'IND_NM_CMT',484.50,'[kt/Mt]','');
INSERT INTO "EmissionActivity" VALUES ('PIE','IND_CO2_PRC','IND_BIO','IND_NM_CLK_DRY_E',2011,'IND_NM_CMT',484.50,'[kt/Mt]','');
INSERT INTO "EmissionActivity" VALUES ('PIE','IND_CO2_PRC','IND_ELC','IND_NM_CLK_DRY_E',2011,'IND_NM_CMT',484.50,'[kt/Mt]','');
INSERT INTO "EmissionActivity" VALUES ('PIE','IND_CO2_PRC','IND_LPG','IND_NM_CLK_DRY_E',2011,'IND_NM_CMT',484.50,'[kt/Mt]','');
INSERT INTO "EmissionActivity" VALUES ('PIE','IND_CO2_PRC','IND_NM_SB','IND_NM_CLK_DRY_E',2011,'IND_NM_CMT',484.50,'[kt/Mt]','');
INSERT INTO "EmissionActivity" VALUES ('PIE','IND_CO2_PRC','IND_NM_MD','IND_NM_CLK_DRY_E',2011,'IND_NM_CMT',484.50,'[kt/Mt]','');
INSERT INTO "EmissionActivity" VALUES ('PIE','IND_CO2_PRC','IND_NM_OTH','IND_NM_CLK_DRY_E',2011,'IND_NM_CMT',484.50,'[kt/Mt]','');
INSERT INTO "EmissionActivity" VALUES ('PIE','IND_CO2_PRC','IND_NGA','IND_NM_CLK_WET_E',2011,'IND_NM_CMT',484.50,'[kt/Mt]','');
INSERT INTO "EmissionActivity" VALUES ('PIE','IND_CO2_PRC','IND_COA','IND_NM_CLK_WET_E',2011,'IND_NM_CMT',484.50,'[kt/Mt]','');
INSERT INTO "EmissionActivity" VALUES ('PIE','IND_CO2_PRC','IND_HFO','IND_NM_CLK_WET_E',2011,'IND_NM_CMT',484.50,'[kt/Mt]','');
INSERT INTO "EmissionActivity" VALUES ('PIE','IND_CO2_PRC','IND_PTC','IND_NM_CLK_WET_E',2011,'IND_NM_CMT',484.50,'[kt/Mt]','');
INSERT INTO "EmissionActivity" VALUES ('PIE','IND_CO2_PRC','IND_ELC','IND_NM_CLK_WET_E',2011,'IND_NM_CMT',484.50,'[kt/Mt]','');
INSERT INTO "EmissionActivity" VALUES ('PIE','IND_CO2_PRC','IND_OIL','IND_NM_CLK_WET_E',2011,'IND_NM_CMT',484.50,'[kt/Mt]','');
INSERT INTO "EmissionActivity" VALUES ('PIE','IND_CO2_PRC','IND_LPG','IND_NM_CLK_WET_E',2011,'IND_NM_CMT',484.50,'[kt/Mt]','');
INSERT INTO "EmissionActivity" VALUES ('PIE','IND_CO2_PRC','IND_NM_SB','IND_NM_CLK_WET_E',2011,'IND_NM_CMT',484.50,'[kt/Mt]','');
INSERT INTO "EmissionActivity" VALUES ('PIE','IND_CO2_PRC','IND_NM_MD','IND_NM_CLK_WET_E',2011,'IND_NM_CMT',484.50,'[kt/Mt]','');
INSERT INTO "EmissionActivity" VALUES ('PIE','IND_CO2_PRC','IND_NM_OTH','IND_NM_CLK_WET_E',2011,'IND_NM_CMT',484.50,'[kt/Mt]','');
INSERT INTO "EmissionActivity" VALUES ('PIE','IND_CO2_PRC','IND_NGA','IND_NM_LIM_E',2011,'IND_NM_LIM',392.50,'[kt/Mt]','');
INSERT INTO "EmissionActivity" VALUES ('PIE','IND_CO2_PRC','IND_COA','IND_NM_LIM_E',2011,'IND_NM_LIM',392.50,'[kt/Mt]','');
INSERT INTO "EmissionActivity" VALUES ('PIE','IND_CO2_PRC','IND_HFO','IND_NM_LIM_E',2011,'IND_NM_LIM',392.50,'[kt/Mt]','');
INSERT INTO "EmissionActivity" VALUES ('PIE','IND_CO2_PRC','IND_ELC','IND_NM_LIM_E',2011,'IND_NM_LIM',392.50,'[kt/Mt]','');
INSERT INTO "EmissionActivity" VALUES ('PIE','IND_CO2_PRC','IND_LPG','IND_NM_LIM_E',2011,'IND_NM_LIM',392.50,'[kt/Mt]','');
INSERT INTO "EmissionActivity" VALUES ('PIE','IND_CO2_PRC','IND_NM_SB','IND_NM_LIM_E',2011,'IND_NM_LIM',392.50,'[kt/Mt]','');
INSERT INTO "EmissionActivity" VALUES ('PIE','IND_CO2_PRC','IND_NM_MD','IND_NM_LIM_E',2011,'IND_NM_LIM',392.50,'[kt/Mt]','');
INSERT INTO "EmissionActivity" VALUES ('PIE','IND_CO2_PRC','IND_NM_OTH','IND_NM_LIM_E',2011,'IND_NM_LIM',392.50,'[kt/Mt]','');

INSERT INTO "EmissionActivity" VALUES ('PIE','IND_CO2','GAS_NGA','IND_CH_FS_NGA_E',2011,'IND_CH_FS',56.10,'[kt/PJ]','');
INSERT INTO "EmissionActivity" VALUES ('PIE','IND_CH4','GAS_NGA','IND_CH_FS_NGA_E',2011,'IND_CH_FS',1.10,'[t/PJ]','');
INSERT INTO "EmissionActivity" VALUES ('PIE','IND_N2O','GAS_NGA','IND_CH_FS_NGA_E',2011,'IND_CH_FS',1.00,'[t/PJ]','');
INSERT INTO "EmissionActivity" VALUES ('PIE','IND_CO2','OIL_LPG','IND_CH_FS_LPG_E',2011,'IND_CH_FS',63.07,'[kt/PJ]','');
INSERT INTO "EmissionActivity" VALUES ('PIE','IND_CH4','OIL_LPG','IND_CH_FS_LPG_E',2011,'IND_CH_FS',5.00,'[t/PJ]','');
INSERT INTO "EmissionActivity" VALUES ('PIE','IND_N2O','OIL_LPG','IND_CH_FS_LPG_E',2011,'IND_CH_FS',0.10,'[t/PJ]','');
INSERT INTO "EmissionActivity" VALUES ('PIE','IND_CO2','OIL_KER','IND_CH_FS_KER_E',2011,'IND_CH_FS',98.27,'[kt/PJ]','');
INSERT INTO "EmissionActivity" VALUES ('PIE','IND_CH4','OIL_KER','IND_CH_FS_KER_E',2011,'IND_CH_FS',0.54,'[t/PJ]','');
INSERT INTO "EmissionActivity" VALUES ('PIE','IND_N2O','OIL_KER','IND_CH_FS_KER_E',2011,'IND_CH_FS',1.81,'[t/PJ]','');
INSERT INTO "EmissionActivity" VALUES ('PIE','IND_CO2','OIL_HFO','IND_CH_FS_HFO_E',2011,'IND_CH_FS',77.37,'[kt/PJ]','');
INSERT INTO "EmissionActivity" VALUES ('PIE','IND_CH4','OIL_HFO','IND_CH_FS_HFO_E',2011,'IND_CH_FS',0.72,'[t/PJ]','');
INSERT INTO "EmissionActivity" VALUES ('PIE','IND_N2O','OIL_HFO','IND_CH_FS_HFO_E',2011,'IND_CH_FS',3.11,'[t/PJ]','');
INSERT INTO "EmissionActivity" VALUES ('PIE','IND_CO2','OIL_DST','IND_CH_FS_DST_E',2011,'IND_CH_FS',74.07,'[kt/PJ]','');
INSERT INTO "EmissionActivity" VALUES ('PIE','IND_CH4','OIL_DST','IND_CH_FS_DST_E',2011,'IND_CH_FS',1.32,'[t/PJ]','');
INSERT INTO "EmissionActivity" VALUES ('PIE','IND_N2O','OIL_DST','IND_CH_FS_DST_E',2011,'IND_CH_FS',3.36,'[t/PJ]','');
INSERT INTO "EmissionActivity" VALUES ('PIE','IND_CO2','OIL_NSP','IND_CH_FS_NSP_E',2011,'IND_CH_FS',61.60,'[kt/PJ]','');
INSERT INTO "EmissionActivity" VALUES ('PIE','IND_CH4','OIL_NSP','IND_CH_FS_NSP_E',2011,'IND_CH_FS',1.10,'[t/PJ]','');
INSERT INTO "EmissionActivity" VALUES ('PIE','IND_N2O','OIL_NSP','IND_CH_FS_NSP_E',2011,'IND_CH_FS',1.00,'[t/PJ]','');
INSERT INTO "EmissionActivity" VALUES ('PIE','IND_CO2','OIL_GSL','IND_CH_FS_GSL_E',2011,'IND_CH_FS',69.30,'[kt/PJ]','');
INSERT INTO "EmissionActivity" VALUES ('PIE','IND_CH4','OIL_GSL','IND_CH_FS_GSL_E',2011,'IND_CH_FS',6.92,'[t/PJ]','');
INSERT INTO "EmissionActivity" VALUES ('PIE','IND_N2O','OIL_GSL','IND_CH_FS_GSL_E',2011,'IND_CH_FS',6.60,'[t/PJ]','');
INSERT INTO "EmissionActivity" VALUES ('PIE','IND_CO2','OIL_NAP','IND_CH_FS_NAP_E',2011,'IND_CH_FS',73.33,'[kt/PJ]','');
INSERT INTO "EmissionActivity" VALUES ('PIE','IND_CH4','OIL_NAP','IND_CH_FS_NAP_E',2011,'IND_CH_FS',0.72,'[t/PJ]','');
INSERT INTO "EmissionActivity" VALUES ('PIE','IND_N2O','OIL_NAP','IND_CH_FS_NAP_E',2011,'IND_CH_FS',0.60,'[t/PJ]','');
INSERT INTO "EmissionActivity" VALUES ('PIE','IND_CO2','OIL_RFG','IND_CH_FS_RFG_E',2011,'IND_CH_FS',56.10,'[kt/PJ]','');
INSERT INTO "EmissionActivity" VALUES ('PIE','IND_CH4','OIL_RFG','IND_CH_FS_RFG_E',2011,'IND_CH_FS',1.10,'[t/PJ]','');
INSERT INTO "EmissionActivity" VALUES ('PIE','IND_N2O','OIL_RFG','IND_CH_FS_RFG_E',2011,'IND_CH_FS',1.00,'[t/PJ]','');
-- Non-metallic minerals
-- New technologies
INSERT INTO "EmissionActivity" VALUES ('PIE','IND_CO2_PRC','IND_COA','IND_NM_CLK_DRY_N',2012,'IND_NM_CLK',505.20,'[kt/Mt]','');
INSERT INTO "EmissionActivity" VALUES ('PIE','IND_CO2_PRC','IND_HFO','IND_NM_CLK_DRY_N',2012,'IND_NM_CLK',505.20,'[kt/Mt]','');
INSERT INTO "EmissionActivity" VALUES ('PIE','IND_CO2_PRC','IND_NGA','IND_NM_CLK_DRY_N',2012,'IND_NM_CLK',505.20,'[kt/Mt]','');
INSERT INTO "EmissionActivity" VALUES ('PIE','IND_CO2_PRC','IND_BIO','IND_NM_CLK_DRY_N',2012,'IND_NM_CLK',505.20,'[kt/Mt]','');
INSERT INTO "EmissionActivity" VALUES ('PIE','IND_CO2_PRC','IND_NM_EC','IND_NM_CLK_DRY_N',2012,'IND_NM_CLK',505.20,'[kt/Mt]','');
INSERT INTO "EmissionActivity" VALUES ('PIE','IND_CO2_PRC','IND_COA','IND_NM_CLK_WET_N',2012,'IND_NM_CLK',505.20,'[kt/Mt]','');
INSERT INTO "EmissionActivity" VALUES ('PIE','IND_CO2_PRC','IND_HFO','IND_NM_CLK_WET_N',2012,'IND_NM_CLK',505.20,'[kt/Mt]','');
INSERT INTO "EmissionActivity" VALUES ('PIE','IND_CO2_PRC','IND_NGA','IND_NM_CLK_WET_N',2012,'IND_NM_CLK',505.20,'[kt/Mt]','');
INSERT INTO "EmissionActivity" VALUES ('PIE','IND_CO2_PRC','IND_BIO','IND_NM_CLK_WET_N',2012,'IND_NM_CLK',505.20,'[kt/Mt]','');
INSERT INTO "EmissionActivity" VALUES ('PIE','IND_CO2_PRC','IND_NM_EC','IND_NM_CLK_WET_N',2012,'IND_NM_CLK',505.20,'[kt/Mt]','');
-- Other non-energy uses
INSERT INTO "EmissionActivity" VALUES ('PIE','IND_CO2','COA_HCO','IND_NEU_TECH',2011,'IND_OTH_NEU',14.89,'[kt/PJ]','');
INSERT INTO "EmissionActivity" VALUES ('PIE','IND_CO2','COA_OVC','IND_NEU_TECH',2011,'IND_OTH_NEU',14.89,'[kt/PJ]','');
INSERT INTO "EmissionActivity" VALUES ('PIE','IND_CO2','OIL_NSP','IND_NEU_TECH',2011,'IND_OTH_NEU',14.89,'[kt/PJ]','');
INSERT INTO "EmissionActivity" VALUES ('PIE','IND_CH4','COA_HCO','IND_NEU_TECH',2011,'IND_OTH_NEU',0.96,'[t/PJ]','');
INSERT INTO "EmissionActivity" VALUES ('PIE','IND_CH4','COA_OVC','IND_NEU_TECH',2011,'IND_OTH_NEU',0.96,'[t/PJ]','');
INSERT INTO "EmissionActivity" VALUES ('PIE','IND_CH4','OIL_NSP','IND_NEU_TECH',2011,'IND_OTH_NEU',0.96,'[t/PJ]','');
INSERT INTO "EmissionActivity" VALUES ('PIE','IND_N2O','COA_HCO','IND_NEU_TECH',2011,'IND_OTH_NEU',0.13,'[t/PJ]','');
INSERT INTO "EmissionActivity" VALUES ('PIE','IND_N2O','COA_OVC','IND_NEU_TECH',2011,'IND_OTH_NEU',0.13,'[t/PJ]','');
INSERT INTO "EmissionActivity" VALUES ('PIE','IND_N2O','OIL_NSP','IND_NEU_TECH',2011,'IND_OTH_NEU',0.13,'[t/PJ]','');
-- Hydrogen
INSERT INTO "EmissionActivity" VALUES ('PIE','UPS_CO2','ELC_CEN','H2_SMR_CL',2020,'H2_CU',74.1,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('PIE','UPS_CO2','GAS_NGA','H2_SMR_CL',2020,'H2_CU',74.1,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('PIE','UPS_CO2','ELC_CEN','H2_SMR_CL',2025,'H2_CU',74.1,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('PIE','UPS_CO2','GAS_NGA','H2_SMR_CL',2025,'H2_CU',74.1,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('PIE','UPS_CO2','ELC_CEN','H2_SMR_CL',2030,'H2_CU',70.1,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('PIE','UPS_CO2','GAS_NGA','H2_SMR_CL',2030,'H2_CU',70.1,'kt/PJ','');

INSERT INTO "EmissionActivity" VALUES ('PIE','UPS_CO2','ELC_CEN','H2_SMR_CS',2020,'H2_CT',88.4,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('PIE','UPS_CO2','GAS_NGA','H2_SMR_CS',2020,'H2_CT',88.4,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('PIE','UPS_CO2','ELC_CEN','H2_SMR_CS',2025,'H2_CT',88.4,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('PIE','UPS_CO2','GAS_NGA','H2_SMR_CS',2025,'H2_CT',88.4,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('PIE','UPS_CO2','ELC_CEN','H2_SMR_CS',2030,'H2_CT',83.0,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('PIE','UPS_CO2','GAS_NGA','H2_SMR_CS',2030,'H2_CT',83.0,'kt/PJ','');

INSERT INTO "EmissionActivity" VALUES ('PIE','UPS_CO2','ELC_DST','H2_SMR_DS',2025,'H2_DT',101.5,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('PIE','UPS_CO2','GAS_NGA','H2_SMR_DS',2025,'H2_DT',101.5,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('PIE','UPS_CO2','ELC_DST','H2_SMR_DS',2030,'H2_DT',87.0,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('PIE','UPS_CO2','GAS_NGA','H2_SMR_DS',2030,'H2_DT',87.0,'kt/PJ','');

INSERT INTO "EmissionActivity" VALUES ('PIE','UPS_CO2','ELC_CEN','H2_HOPO',2020,'H2_CT',100.6,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('PIE','UPS_CO2','OIL_HFO','H2_HOPO',2020,'H2_CT',100.6,'kt/PJ','');


CREATE TABLE "CommodityEmissionFactor" (
   "input_comm"    text,
   "emis_comm"     text,
   "ef"            real,
   "emis_unit"     text,
   "ef_notes"      text,
   primary key("input_comm","ef","emis_comm"),
   foreign key("input_comm") references "commodities"("comm_name"),
   foreign key("emis_comm") references "commodities"("comm_name")
);

-- Transport sector
INSERT INTO "CommodityEmissionFactor" VALUES ('TRA_NGA','TRA_CO2',56.10,'[kt/PJ]','TEMOA_Italy OCT2023');
INSERT INTO "CommodityEmissionFactor" VALUES ('TRA_LPG','TRA_CO2',63.07,'[kt/PJ]','TEMOA_Italy OCT2023');
INSERT INTO "CommodityEmissionFactor" VALUES ('TRA_GSL','TRA_CO2',69.30,'[kt/PJ]','TEMOA_Italy OCT2023');
INSERT INTO "CommodityEmissionFactor" VALUES ('TRA_JTK','TRA_CO2',71.50,'[kt/PJ]','TEMOA_Italy OCT2023');
INSERT INTO "CommodityEmissionFactor" VALUES ('TRA_DSL','TRA_CO2',74.07,'[kt/PJ]','TEMOA_Italy OCT2023');
INSERT INTO "CommodityEmissionFactor" VALUES ('TRA_NGA','TRA_CH4',1.10,'[t/PJ]','TEMOA_Italy OCT2023');
INSERT INTO "CommodityEmissionFactor" VALUES ('TRA_LPG','TRA_CH4',5.00,'[t/PJ]','TEMOA_Italy OCT2023');
INSERT INTO "CommodityEmissionFactor" VALUES ('TRA_GSL','TRA_CH4',6.92,'[t/PJ]','TEMOA_Italy OCT2023');
INSERT INTO "CommodityEmissionFactor" VALUES ('TRA_JTK','TRA_CH4',5.53,'[t/PJ]','TEMOA_Italy OCT2023');
INSERT INTO "CommodityEmissionFactor" VALUES ('TRA_DSL','TRA_CH4',1.32,'[t/PJ]','TEMOA_Italy OCT2023');
INSERT INTO "CommodityEmissionFactor" VALUES ('TRA_NGA','TRA_N2O',1.00,'[t/PJ]','TEMOA_Italy OCT2023');
INSERT INTO "CommodityEmissionFactor" VALUES ('TRA_LPG','TRA_N2O',0.10,'[t/PJ]','TEMOA_Italy OCT2023');
INSERT INTO "CommodityEmissionFactor" VALUES ('TRA_GSL','TRA_N2O',6.60,'[t/PJ]','TEMOA_Italy OCT2023');
INSERT INTO "CommodityEmissionFactor" VALUES ('TRA_JTK','TRA_N2O',6.10,'[t/PJ]','TEMOA_Italy OCT2023');
INSERT INTO "CommodityEmissionFactor" VALUES ('TRA_DSL','TRA_N2O',3.36,'[t/PJ]','TEMOA_Italy OCT2023');

-- Electricity sector
INSERT INTO "CommodityEmissionFactor" VALUES ('ELC_NGA','ELC_CO2',56.10,'[kt/PJ]','TEMOA_Italy OCT2023');
INSERT INTO "CommodityEmissionFactor" VALUES ('ELC_SLB','ELC_CO2',0.00,'[kt/PJ]','TEMOA_Italy OCT2023');
INSERT INTO "CommodityEmissionFactor" VALUES ('ELC_BMU','ELC_CO2',85.85,'[kt/PJ]','TEMOA_Italy OCT2023');
INSERT INTO "CommodityEmissionFactor" VALUES ('ELC_BGS','ELC_CO2',0.00,'[kt/PJ]','TEMOA_Italy OCT2023');
INSERT INTO "CommodityEmissionFactor" VALUES ('ELC_NGA','ELC_CH4',0.13,'[t/PJ]','TEMOA_Italy OCT2023');
INSERT INTO "CommodityEmissionFactor" VALUES ('ELC_SLB_RES','ELC_CH4',30.00,'[t/PJ]','TEMOA_Italy OCT2023');
INSERT INTO "CommodityEmissionFactor" VALUES ('ELC_BMU','ELC_CH4',0.02,'[t/PJ]','TEMOA_Italy OCT2023');
INSERT INTO "CommodityEmissionFactor" VALUES ('ELC_BGS','ELC_CH4',300.00,'[t/PJ]','TEMOA_Italy OCT2023');
INSERT INTO "CommodityEmissionFactor" VALUES ('ELC_NGA','ELC_N2O',0.54,'[t/PJ]','TEMOA_Italy OCT2023');
INSERT INTO "CommodityEmissionFactor" VALUES ('ELC_SLB','ELC_N2O',4.00,'[t/PJ]','TEMOA_Italy OCT2023');
INSERT INTO "CommodityEmissionFactor" VALUES ('ELC_BMU','ELC_N2O',4.00,'[t/PJ]','TEMOA_Italy OCT2023');
INSERT INTO "CommodityEmissionFactor" VALUES ('ELC_BGS','ELC_N2O',4.00,'[t/PJ]','TEMOA_Italy OCT2023');

-- Residential sector
INSERT INTO "CommodityEmissionFactor" VALUES ('RES_NGA','RES_CO2',56.10,'[kt/PJ]','TEMOA_Italy OCT2023');
INSERT INTO "CommodityEmissionFactor" VALUES ('RES_DST','RES_CO2',74.07,'[kt/PJ]','TEMOA_Italy OCT2023');
INSERT INTO "CommodityEmissionFactor" VALUES ('RES_HFO','RES_CO2',77.37,'[kt/PJ]','TEMOA_Italy OCT2023');
INSERT INTO "CommodityEmissionFactor" VALUES ('RES_LPG','RES_CO2',63.07,'[kt/PJ]','TEMOA_Italy OCT2023');
INSERT INTO "CommodityEmissionFactor" VALUES ('RES_BIO','RES_CO2',0.0001,'[kt/PJ]','TEMOA_Italy OCT2023');
INSERT INTO "CommodityEmissionFactor" VALUES ('RES_NGA','RES_CH4',1.10,'[t/PJ]','TEMOA_Italy OCT2023');
INSERT INTO "CommodityEmissionFactor" VALUES ('RES_DST','RES_CH4',1.32,'[t/PJ]','TEMOA_Italy OCT2023');
INSERT INTO "CommodityEmissionFactor" VALUES ('RES_HFO','RES_CH4',0.72,'[t/PJ]','TEMOA_Italy OCT2023');
INSERT INTO "CommodityEmissionFactor" VALUES ('RES_LPG','RES_CH4',5.00,'[t/PJ]','TEMOA_Italy OCT2023');
INSERT INTO "CommodityEmissionFactor" VALUES ('RES_BIO','RES_CH4',300.00,'[t/PJ]','TEMOA_Italy OCT2023');
INSERT INTO "CommodityEmissionFactor" VALUES ('RES_NGA','RES_N2O',1.00,'[t/PJ]','TEMOA_Italy OCT2023');
INSERT INTO "CommodityEmissionFactor" VALUES ('RES_DST','RES_N2O',3.36,'[t/PJ]','TEMOA_Italy OCT2023');
INSERT INTO "CommodityEmissionFactor" VALUES ('RES_HFO','RES_N2O',3.11,'[t/PJ]','TEMOA_Italy OCT2023');
INSERT INTO "CommodityEmissionFactor" VALUES ('RES_LPG','RES_N2O',0.10,'[t/PJ]','TEMOA_Italy OCT2023');
INSERT INTO "CommodityEmissionFactor" VALUES ('RES_BIO','RES_N2O',4.00,'[t/PJ]','TEMOA_Italy OCT2023');

-- Commercial sector
INSERT INTO "CommodityEmissionFactor" VALUES ('COM_NGA','COM_CO2',56.10,'[kt/PJ]','TEMOA_Italy OCT2023');
INSERT INTO "CommodityEmissionFactor" VALUES ('COM_DST','COM_CO2',74.07,'[kt/PJ]','TEMOA_Italy OCT2023');
INSERT INTO "CommodityEmissionFactor" VALUES ('COM_LPG','COM_CO2',63.07,'[kt/PJ]','TEMOA_Italy OCT2023');
INSERT INTO "CommodityEmissionFactor" VALUES ('COM_BIO','COM_CO2',0.0001,'[kt/PJ]','TEMOA_Italy OCT2023');
INSERT INTO "CommodityEmissionFactor" VALUES ('COM_NGA','COM_CH4',1.10,'[t/PJ]','TEMOA_Italy OCT2023');
INSERT INTO "CommodityEmissionFactor" VALUES ('COM_DST','COM_CH4',1.32,'[t/PJ]','TEMOA_Italy OCT2023');
INSERT INTO "CommodityEmissionFactor" VALUES ('COM_LPG','COM_CH4',5.00,'[t/PJ]','TEMOA_Italy OCT2023');
INSERT INTO "CommodityEmissionFactor" VALUES ('COM_BIO','COM_CH4',300.00,'[t/PJ]','TEMOA_Italy OCT2023');
INSERT INTO "CommodityEmissionFactor" VALUES ('COM_NGA','COM_N2O',1.00,'[t/PJ]','TEMOA_Italy OCT2023');
INSERT INTO "CommodityEmissionFactor" VALUES ('COM_DST','COM_N2O',3.36,'[t/PJ]','TEMOA_Italy OCT2023');
INSERT INTO "CommodityEmissionFactor" VALUES ('COM_LPG','COM_N2O',0.01,'[t/PJ]','TEMOA_Italy OCT2023');
INSERT INTO "CommodityEmissionFactor" VALUES ('COM_BIO','COM_N2O',4.00,'[t/PJ]','TEMOA_Italy OCT2023');

-- Agriculture sector
INSERT INTO "CommodityEmissionFactor" VALUES ('AGR_NGA','AGR_CO2',56.10,'[kt/PJ]','TEMOA_Italy OCT2023');
INSERT INTO "CommodityEmissionFactor" VALUES ('AGR_DST','AGR_CO2',74.07,'[kt/PJ]','TEMOA_Italy OCT2023');
INSERT INTO "CommodityEmissionFactor" VALUES ('AGR_GSL','AGR_CO2',69.30,'[kt/PJ]','TEMOA_Italy OCT2023');
INSERT INTO "CommodityEmissionFactor" VALUES ('AGR_LPG','AGR_CO2',63.07,'[kt/PJ]','TEMOA_Italy OCT2023');
INSERT INTO "CommodityEmissionFactor" VALUES ('AGR_NGA','AGR_CH4',1.10,'[t/PJ]','TEMOA_Italy OCT2023');
INSERT INTO "CommodityEmissionFactor" VALUES ('AGR_DST','AGR_CH4',1.32,'[t/PJ]','TEMOA_Italy OCT2023');
INSERT INTO "CommodityEmissionFactor" VALUES ('AGR_GSL','AGR_CH4',6.92,'[t/PJ]','TEMOA_Italy OCT2023');
INSERT INTO "CommodityEmissionFactor" VALUES ('AGR_LPG','AGR_CH4',5.00,'[t/PJ]','TEMOA_Italy OCT2023');
INSERT INTO "CommodityEmissionFactor" VALUES ('AGR_NGA','AGR_N2O',1.00,'[t/PJ]','TEMOA_Italy OCT2023');
INSERT INTO "CommodityEmissionFactor" VALUES ('AGR_DST','AGR_N2O',1.32,'[t/PJ]','TEMOA_Italy OCT2023');
INSERT INTO "CommodityEmissionFactor" VALUES ('AGR_GSL','AGR_N2O',6.60,'[t/PJ]','TEMOA_Italy OCT2023');
INSERT INTO "CommodityEmissionFactor" VALUES ('AGR_LPG','AGR_N2O',0.10,'[t/PJ]','TEMOA_Italy OCT2023');
-- Industrial sector
INSERT INTO "CommodityEmissionFactor" VALUES ('IND_NGA','IND_CO2',56.10,'[kt/PJ]','TEMOA_Italy OCT2023');
INSERT INTO "CommodityEmissionFactor" VALUES ('IND_LPG','IND_CO2',63.07,'[kt/PJ]','TEMOA_Italy OCT2023');
INSERT INTO "CommodityEmissionFactor" VALUES ('IND_COA','IND_CO2',98.27,'[kt/PJ]','TEMOA_Italy OCT2023');
INSERT INTO "CommodityEmissionFactor" VALUES ('IND_COK','IND_CO2',94.60,'[kt/PJ]','TEMOA_Italy OCT2023');
INSERT INTO "CommodityEmissionFactor" VALUES ('IND_COG','IND_CO2',108.17,'[kt/PJ]','TEMOA_Italy OCT2023');
INSERT INTO "CommodityEmissionFactor" VALUES ('IND_BFG','IND_CO2',108.17,'[kt/PJ]','TEMOA_Italy OCT2023');
INSERT INTO "CommodityEmissionFactor" VALUES ('IND_HFO','IND_CO2',77.37,'[kt/PJ]','TEMOA_Italy OCT2023');
INSERT INTO "CommodityEmissionFactor" VALUES ('IND_OIL','IND_CO2',71.98,'[kt/PJ]','TEMOA_Italy OCT2023');
INSERT INTO "CommodityEmissionFactor" VALUES ('IND_ETH','IND_CO2',54.10,'[kt/PJ]','TEMOA_Italy OCT2023');
INSERT INTO "CommodityEmissionFactor" VALUES ('IND_NAP','IND_CO2',73.33,'[kt/PJ]','TEMOA_Italy OCT2023');
INSERT INTO "CommodityEmissionFactor" VALUES ('IND_PTC','IND_CO2',100.80,'[kt/PJ]','TEMOA_Italy OCT2023');
INSERT INTO "CommodityEmissionFactor" VALUES ('IND_BIO','IND_CO2',0.0001,'[kt/PJ]','TEMOA_Italy OCT2023');
INSERT INTO "CommodityEmissionFactor" VALUES ('IND_NGA','IND_CH4',1.10,'[t/PJ]','TEMOA_Italy OCT2023');
INSERT INTO "CommodityEmissionFactor" VALUES ('IND_LPG','IND_CH4',5.00,'[t/PJ]','TEMOA_Italy OCT2023');
INSERT INTO "CommodityEmissionFactor" VALUES ('IND_COA','IND_CH4',0.54,'[t/PJ]','TEMOA_Italy OCT2023');
INSERT INTO "CommodityEmissionFactor" VALUES ('IND_COK','IND_CH4',0.54,'[t/PJ]','TEMOA_Italy OCT2023');
INSERT INTO "CommodityEmissionFactor" VALUES ('IND_COG','IND_CH4',0.54,'[t/PJ]','TEMOA_Italy OCT2023');
INSERT INTO "CommodityEmissionFactor" VALUES ('IND_BFG','IND_CH4',0.54,'[t/PJ]','TEMOA_Italy OCT2023');
INSERT INTO "CommodityEmissionFactor" VALUES ('IND_HFO','IND_CH4',0.72,'[t/PJ]','TEMOA_Italy OCT2023');
INSERT INTO "CommodityEmissionFactor" VALUES ('IND_OIL','IND_CH4',3.82,'[t/PJ]','TEMOA_Italy OCT2023');
INSERT INTO "CommodityEmissionFactor" VALUES ('IND_ETH','IND_CH4',1.10,'[t/PJ]','TEMOA_Italy OCT2023');
INSERT INTO "CommodityEmissionFactor" VALUES ('IND_NAP','IND_CH4',5.00,'[t/PJ]','TEMOA_Italy OCT2023');
INSERT INTO "CommodityEmissionFactor" VALUES ('IND_PTC','IND_CH4',5.00,'[t/PJ]','TEMOA_Italy OCT2023');
INSERT INTO "CommodityEmissionFactor" VALUES ('IND_BIO','IND_CH4',300.00,'[t/PJ]','TEMOA_Italy OCT2023');
INSERT INTO "CommodityEmissionFactor" VALUES ('IND_NGA','IND_N2O',1.00,'[t/PJ]','TEMOA_Italy OCT2023');
INSERT INTO "CommodityEmissionFactor" VALUES ('IND_LPG','IND_N2O',0.10,'[t/PJ]','TEMOA_Italy OCT2023');
INSERT INTO "CommodityEmissionFactor" VALUES ('IND_COA','IND_N2O',1.81,'[t/PJ]','TEMOA_Italy OCT2023');
INSERT INTO "CommodityEmissionFactor" VALUES ('IND_COK','IND_N2O',1.81,'[t/PJ]','TEMOA_Italy OCT2023');
INSERT INTO "CommodityEmissionFactor" VALUES ('IND_COG','IND_N2O',1.81,'[t/PJ]','TEMOA_Italy OCT2023');
INSERT INTO "CommodityEmissionFactor" VALUES ('IND_BFG','IND_N2O',1.81,'[t/PJ]','TEMOA_Italy OCT2023');
INSERT INTO "CommodityEmissionFactor" VALUES ('IND_HFO','IND_N2O',3.11,'[t/PJ]','TEMOA_Italy OCT2023');
INSERT INTO "CommodityEmissionFactor" VALUES ('IND_OIL','IND_N2O',4.82,'[t/PJ]','TEMOA_Italy OCT2023');
INSERT INTO "CommodityEmissionFactor" VALUES ('IND_ETH','IND_N2O',1.00,'[t/PJ]','TEMOA_Italy OCT2023');
INSERT INTO "CommodityEmissionFactor" VALUES ('IND_NAP','IND_N2O',0.60,'[t/PJ]','TEMOA_Italy OCT2023');
INSERT INTO "CommodityEmissionFactor" VALUES ('IND_PTC','IND_N2O',1.40,'[t/PJ]','TEMOA_Italy OCT2023');
INSERT INTO "CommodityEmissionFactor" VALUES ('IND_BIO','IND_N2O',4.00,'[t/PJ]','TEMOA_Italy OCT2023');
INSERT INTO "CommodityEmissionFactor" VALUES ('IND_NGA','IND_SOX',0.00,'[kt/PJ]','TEMOA_Italy OCT2023');
INSERT INTO "CommodityEmissionFactor" VALUES ('IND_LPG','IND_SOX',0.57,'[kt/PJ]','TEMOA_Italy OCT2023');
INSERT INTO "CommodityEmissionFactor" VALUES ('IND_COA','IND_SOX',1.20,'[kt/PJ]','TEMOA_Italy OCT2023');
INSERT INTO "CommodityEmissionFactor" VALUES ('IND_COK','IND_SOX',1.20,'[kt/PJ]','TEMOA_Italy OCT2023');
INSERT INTO "CommodityEmissionFactor" VALUES ('IND_COG','IND_SOX',1.20,'[kt/PJ]','TEMOA_Italy OCT2023');
INSERT INTO "CommodityEmissionFactor" VALUES ('IND_BFG','IND_SOX',0.00,'[kt/PJ]','TEMOA_Italy OCT2023');
INSERT INTO "CommodityEmissionFactor" VALUES ('IND_HFO','IND_SOX',0.57,'[kt/PJ]','TEMOA_Italy OCT2023');
INSERT INTO "CommodityEmissionFactor" VALUES ('IND_OIL','IND_SOX',0.57,'[kt/PJ]','TEMOA_Italy OCT2023');
INSERT INTO "CommodityEmissionFactor" VALUES ('IND_ETH','IND_SOX',0.57,'[kt/PJ]','TEMOA_Italy OCT2023');
INSERT INTO "CommodityEmissionFactor" VALUES ('IND_NAP','IND_SOX',0.57,'[kt/PJ]','TEMOA_Italy OCT2023');
INSERT INTO "CommodityEmissionFactor" VALUES ('IND_PTC','IND_SOX',0.57,'[kt/PJ]','TEMOA_Italy OCT2023');
INSERT INTO "CommodityEmissionFactor" VALUES ('IND_BIO','IND_SOX',0.00,'[kt/PJ]','TEMOA_Italy OCT2023');

-- Upstream sector
INSERT INTO "CommodityEmissionFactor" VALUES ('GAS_NGA_PRI','UPS_CO2',56.10,'[kt/PJ]','TEMOA_Italy OCT2023');
INSERT INTO "CommodityEmissionFactor" VALUES ('OIL_CRD','UPS_CO2',84.97,'[kt/PJ]','TEMOA_Italy OCT2023');
INSERT INTO "CommodityEmissionFactor" VALUES ('GAS_NGA_PRI','UPS_CH4',1.10,'[t/PJ]','TEMOA_Italy OCT2023');
INSERT INTO "CommodityEmissionFactor" VALUES ('OIL_CRD','UPS_CH4',2.19,'[t/PJ]','TEMOA_Italy OCT2023');
INSERT INTO "CommodityEmissionFactor" VALUES ('GAS_NGA_PRI','UPS_N2O',1.00,'[t/PJ]','TEMOA_Italy OCT2023');
INSERT INTO "CommodityEmissionFactor" VALUES ('OIL_CRD','UPS_N2O',2.53,'[t/PJ]','TEMOA_Italy OCT2023');


CREATE TABLE "Efficiency" (
   "regions"  text,
   "input_comm"   text,
   "tech" text,
   "vintage"  integer,
   "output_comm"  text,
   "efficiency"   real check("efficiency" > 0),
   "eff_notes"    text,
   primary key("regions","input_comm","tech","vintage","output_comm"),
   foreign key("output_comm") references "commodities"("comm_name"),
   foreign key("tech") references "technologies"("tech"),
   foreign key("vintage") references "time_periods"("t_periods"),
   foreign key("input_comm") references "commodities"("comm_name")
);

-- Transport sector
-- Fuel technologies
INSERT INTO "Efficiency" VALUES ('PIE','OIL_DST','TRA_FT_DST_E',2011,'TRA_DSL',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','OIL_DST','TRA_FT_DST_N',2012,'TRA_DSL',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','OIL_GSL','TRA_FT_GSL_E',2011,'TRA_GSL',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','OIL_GSL','TRA_FT_GSL_N',2012,'TRA_GSL',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','OIL_JTK','TRA_FT_JTK_E',2011,'TRA_JTK',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','OIL_JTK','TRA_FT_JTK_N',2012,'TRA_JTK',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','OIL_LPG','TRA_FT_LPG_E',2011,'TRA_LPG',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','OIL_LPG','TRA_FT_LPG_N',2012,'TRA_LPG',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_CEN','TRA_FT_ELC',2011,'TRA_ELC',0.93,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_DST','TRA_FT_ELC',2011,'TRA_ELC',0.93,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_CEN','TRA_FT_ELC',2050,'TRA_ELC',0.96,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_DST','TRA_FT_ELC',2050,'TRA_ELC',0.96,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','GAS_NGA','TRA_FT_NGA_E',2011,'TRA_NGA',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','GAS_NGA','TRA_FT_NGA_N',2012,'TRA_NGA',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','BIO_DST','TRA_FT_BIO_DST_E',2011,'TRA_BIO_DST',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','BIO_DST','TRA_FT_BIO_DST_N',2012,'TRA_BIO_DST',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','TRA_BIO_DST','TRA_DSL_BLN',2011,'TRA_DST',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','TRA_DSL','TRA_DSL_BLN',2011,'TRA_DST',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','TRA_ELC','TRA_ELC_DIV',2011,'TRA_ELC_OTH',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','TRA_ELC','TRA_ELC_DIV',2011,'TRA_ELC_RAIL',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','TRA_ELC','TRA_ELC_DIV',2011,'TRA_ELC_ROA',1.0,'PJ/PJ');

-- Base year technologies
INSERT INTO "Efficiency" VALUES ('PIE','TRA_JTK','TRA_AVI_EN',2011,'TRA_AVI',1.00,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','TRA_JTK','TRA_AVI_EN',2040,'TRA_AVI',1.25,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','TRA_ELC_OTH','TRA_OTH_ELC_EN',2011,'TRA_OTH',1.00,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','TRA_ELC_OTH','TRA_OTH_ELC_EN',2040,'TRA_OTH',1.25,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','TRA_DST','TRA_RAIL_DSL_EN',2011,'TRA_RAIL',1.00,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','TRA_ELC_RAIL','TRA_RAIL_ELC_EN',2011,'TRA_RAIL',1.00,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','TRA_DST','TRA_ROA_BUS_DST_E',2011,'TRA_ROA_BUS',0.052,'Bvm/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','TRA_DST','TRA_ROA_CAR_DST_E',2011,'TRA_ROA_CAR',0.350,'Bvm/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','TRA_GSL','TRA_ROA_CAR_GSL_E',2011,'TRA_ROA_CAR',0.299,'Bvm/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','TRA_LPG','TRA_ROA_CAR_LPG_E',2011,'TRA_ROA_CAR',0.300,'Bvm/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','TRA_NGA','TRA_ROA_CAR_NGA_E',2011,'TRA_ROA_CAR',0.274,'Bvm/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','TRA_DST','TRA_ROA_HTR_DST_E',2011,'TRA_ROA_HTR',0.045,'Bvm/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','TRA_DST','TRA_ROA_LCV_DST_E',2011,'TRA_ROA_LCV',0.250,'Bvm/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','TRA_GSL','TRA_ROA_LCV_GSL_E',2011,'TRA_ROA_LCV',0.241,'Bvm/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','TRA_GSL','TRA_ROA_MOP_GSL_E',2011,'TRA_ROA_2WH',1.315,'Bvm/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','TRA_GSL','TRA_ROA_MCY_GSL_E',2011,'TRA_ROA_2WH',1.026,'Bvm/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','TRA_DST','TRA_ROA_MTR_DST_E',2011,'TRA_ROA_MTR',0.090,'Bvm/PJ');
-- New technologies
INSERT INTO "Efficiency" VALUES ('PIE','TRA_GSL','TRA_ROA_2WH_GSL_N',2012,'TRA_ROA_2WH',0.982,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','TRA_GSL','TRA_ROA_2WH_GSL_N',2050,'TRA_ROA_2WH',1.259,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','TRA_DST','TRA_ROA_2WH_DST_N',2012,'TRA_ROA_2WH',1.117,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','TRA_DST','TRA_ROA_2WH_DST_N',2050,'TRA_ROA_2WH',1.487,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','TRA_ELC_ROA','TRA_ROA_2WH_ELC_N',2020,'TRA_ROA_2WH',3.468,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','TRA_ELC_ROA','TRA_ROA_2WH_ELC_N',2050,'TRA_ROA_2WH',4.037,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','TRA_GSL','TRA_ROA_2WH_HYBG_N',2020,'TRA_ROA_2WH',1.609,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','TRA_GSL','TRA_ROA_2WH_HYBG_N',2050,'TRA_ROA_2WH',2.188,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','TRA_GSL','TRA_ROA_BUS_GSL_N',2012,'TRA_ROA_BUS',0.039,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','TRA_GSL','TRA_ROA_BUS_GSL_N',2020,'TRA_ROA_BUS',0.045,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','TRA_GSL','TRA_ROA_BUS_GSL_N',2050,'TRA_ROA_BUS',0.052,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','TRA_DST','TRA_ROA_BUS_DST_N',2012,'TRA_ROA_BUS',0.052,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','TRA_DST','TRA_ROA_BUS_DST_N',2020,'TRA_ROA_BUS',0.059,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','TRA_DST','TRA_ROA_BUS_DST_N',2050,'TRA_ROA_BUS',0.069,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','TRA_LPG','TRA_ROA_BUS_LPG_N',2012,'TRA_ROA_BUS',0.043,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','TRA_NGA','TRA_ROA_BUS_NGA_N',2012,'TRA_ROA_BUS',0.045,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','TRA_ELC_ROA','TRA_ROA_BUS_ELC_N',2020,'TRA_ROA_BUS',0.148,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','TRA_ELC_ROA','TRA_ROA_BUS_ELC_N',2050,'TRA_ROA_BUS',0.172,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','TRA_DST','TRA_ROA_BUS_HYBD_N',2017,'TRA_ROA_BUS',0.053,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','TRA_DST','TRA_ROA_BUS_HYBD_N',2020,'TRA_ROA_BUS',0.055,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','TRA_DST','TRA_ROA_BUS_HYBD_N',2050,'TRA_ROA_BUS',0.075,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','TRA_H2G','TRA_ROA_BUS_FCELL_N',2020,'TRA_ROA_BUS',0.094,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','TRA_H2G','TRA_ROA_BUS_FCELL_N',2050,'TRA_ROA_BUS',0.127,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','TRA_GSL','TRA_ROA_CAR_GSL_N',2012,'TRA_ROA_CAR',0.313,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','TRA_GSL','TRA_ROA_CAR_GSL_N',2020,'TRA_ROA_CAR',0.358,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','TRA_GSL','TRA_ROA_CAR_GSL_N',2050,'TRA_ROA_CAR',0.416,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','TRA_DST','TRA_ROA_CAR_DST_N',2012,'TRA_ROA_CAR',0.800,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','TRA_DST','TRA_ROA_CAR_DST_N',2020,'TRA_ROA_CAR',0.900,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','TRA_DST','TRA_ROA_CAR_DST_N',2050,'TRA_ROA_CAR',0.980,'Bvkm/PJ');

INSERT INTO "Efficiency" VALUES ('PIE','TRA_LPG','TRA_ROA_CAR_LPG_N',2012,'TRA_ROA_CAR',0.290,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','TRA_NGA','TRA_ROA_CAR_NGA_N',2012,'TRA_ROA_CAR',0.150,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','TRA_NGA','TRA_ROA_CAR_NGA_N',2015,'TRA_ROA_CAR',0.20,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','TRA_ELC_ROA','TRA_ROA_CAR_ELC_N',2020,'TRA_ROA_CAR',1.150,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','TRA_ELC_ROA','TRA_ROA_CAR_ELC_N',2050,'TRA_ROA_CAR',1.369,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','TRA_GSL','TRA_ROA_CAR_HYBG_N',2015,'TRA_ROA_CAR',0.400,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','TRA_GSL','TRA_ROA_CAR_HYBG_N',2020,'TRA_ROA_CAR',0.457,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','TRA_GSL','TRA_ROA_CAR_HYBG_N',2050,'TRA_ROA_CAR',0.690,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','TRA_H2G','TRA_ROA_CAR_FCELL_N',2025,'TRA_ROA_CAR',0.500,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','TRA_H2G','TRA_ROA_CAR_FCELL_N',2050,'TRA_ROA_CAR',0.936,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','TRA_GSL','TRA_ROA_CAR_PIHYB_N',2017,'TRA_ROA_CAR',0.760,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','TRA_ELC_ROA','TRA_ROA_CAR_PIHYB_N',2017,'TRA_ROA_CAR',0.760,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','TRA_GSL','TRA_ROA_CAR_PIHYB_N',2020,'TRA_ROA_CAR',0.760,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','TRA_ELC_ROA','TRA_ROA_CAR_PIHYB_N',2020,'TRA_ROA_CAR',0.760,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','TRA_GSL','TRA_ROA_CAR_PIHYB_N',2050,'TRA_ROA_CAR',1.030,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','TRA_ELC_ROA','TRA_ROA_CAR_PIHYB_N',2050,'TRA_ROA_CAR',1.030,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','TRA_GSL','TRA_ROA_HTR_GSL_N',2012,'TRA_ROA_HTR',0.032,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','TRA_GSL','TRA_ROA_HTR_GSL_N',2020,'TRA_ROA_HTR',0.037,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','TRA_GSL','TRA_ROA_HTR_GSL_N',2050,'TRA_ROA_HTR',0.043,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','TRA_DST','TRA_ROA_HTR_DST_N',2012,'TRA_ROA_HTR',0.039,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','TRA_DST','TRA_ROA_HTR_DST_N',2020,'TRA_ROA_HTR',0.044,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','TRA_DST','TRA_ROA_HTR_DST_N',2050,'TRA_ROA_HTR',0.052,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','TRA_LPG','TRA_ROA_HTR_LPG_N',2012,'TRA_ROA_HTR',0.035,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','TRA_NGA','TRA_ROA_HTR_NGA_N',2012,'TRA_ROA_HTR',0.037,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','TRA_ELC_ROA','TRA_ROA_HTR_ELC_N',2025,'TRA_ROA_HTR',0.122,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','TRA_ELC_ROA','TRA_ROA_HTR_ELC_N',2050,'TRA_ROA_HTR',0.142,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','TRA_DST','TRA_ROA_HTR_HYBD_N',2017,'TRA_ROA_HTR',0.044,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','TRA_DST','TRA_ROA_HTR_HYBD_N',2020,'TRA_ROA_HTR',0.045,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','TRA_DST','TRA_ROA_HTR_HYBD_N',2050,'TRA_ROA_HTR',0.061,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','TRA_H2G','TRA_ROA_HTR_FCELL_N',2025,'TRA_ROA_HTR',0.077,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','TRA_H2G','TRA_ROA_HTR_FCELL_N',2050,'TRA_ROA_HTR',0.105,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','TRA_GSL','TRA_ROA_LCV_GSL_N',2012,'TRA_ROA_LCV',0.250,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','TRA_GSL','TRA_ROA_LCV_GSL_N',2020,'TRA_ROA_LCV',0.271,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','TRA_GSL','TRA_ROA_LCV_GSL_N',2050,'TRA_ROA_LCV',0.316,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','TRA_DST','TRA_ROA_LCV_DST_N',2012,'TRA_ROA_LCV',0.287,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','TRA_DST','TRA_ROA_LCV_DST_N',2020,'TRA_ROA_LCV',0.311,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','TRA_DST','TRA_ROA_LCV_DST_N',2050,'TRA_ROA_LCV',0.362,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','TRA_LPG','TRA_ROA_LCV_LPG_N',2012,'TRA_ROA_LCV',0.274,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','TRA_NGA','TRA_ROA_LCV_NGA_N',2012,'TRA_ROA_LCV',0.258,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','TRA_ELC_ROA','TRA_ROA_LCV_ELC_N',2020,'TRA_ROA_LCV',1.084,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','TRA_ELC_ROA','TRA_ROA_LCV_ELC_N',2050,'TRA_ROA_LCV',1.262,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','TRA_DST','TRA_ROA_LCV_HYBD_N',2017,'TRA_ROA_LCV',0.288,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','TRA_DST','TRA_ROA_LCV_HYBD_N',2020,'TRA_ROA_LCV',0.298,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','TRA_DST','TRA_ROA_LCV_HYBD_N',2050,'TRA_ROA_LCV',0.405,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','TRA_H2G','TRA_ROA_LCV_FCELL_N',2025,'TRA_ROA_LCV',0.575,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','TRA_H2G','TRA_ROA_LCV_FCELL_N',2050,'TRA_ROA_LCV',0.782,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','TRA_DST','TRA_ROA_LCV_PIHYB_N',2020,'TRA_ROA_LCV',0.723,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','TRA_ELC_ROA','TRA_ROA_LCV_PIHYB_N',2020,'TRA_ROA_LCV',0.723,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','TRA_DST','TRA_ROA_LCV_PIHYB_N',2050,'TRA_ROA_LCV',0.984,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','TRA_ELC_ROA','TRA_ROA_LCV_PIHYB_N',2050,'TRA_ROA_LCV',0.984,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','TRA_GSL','TRA_ROA_MTR_GSL_N',2012,'TRA_ROA_MTR',0.074,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','TRA_GSL','TRA_ROA_MTR_GSL_N',2020,'TRA_ROA_MTR',0.085,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','TRA_GSL','TRA_ROA_MTR_GSL_N',2050,'TRA_ROA_MTR',0.099,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','TRA_DST','TRA_ROA_MTR_DST_N',2012,'TRA_ROA_MTR',0.089,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','TRA_DST','TRA_ROA_MTR_DST_N',2020,'TRA_ROA_MTR',0.102,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','TRA_DST','TRA_ROA_MTR_DST_N',2050,'TRA_ROA_MTR',0.118,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','TRA_LPG','TRA_ROA_MTR_LPG_N',2012,'TRA_ROA_MTR',0.080,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','TRA_NGA','TRA_ROA_MTR_NGA_N',2012,'TRA_ROA_MTR',0.084,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','TRA_ELC_ROA','TRA_ROA_MTR_ELC_N',2020,'TRA_ROA_MTR',0.279,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','TRA_ELC_ROA','TRA_ROA_MTR_ELC_N',2050,'TRA_ROA_MTR',0.324,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','TRA_DST','TRA_ROA_MTR_HYBD_N',2017,'TRA_ROA_MTR',0.100,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','TRA_DST','TRA_ROA_MTR_HYBD_N',2020,'TRA_ROA_MTR',0.103,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','TRA_DST','TRA_ROA_MTR_HYBD_N',2050,'TRA_ROA_MTR',0.140,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','TRA_H2G','TRA_ROA_MTR_FCELL_N',2025,'TRA_ROA_MTR',0.176,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','TRA_H2G','TRA_ROA_MTR_FCELL_N',2050,'TRA_ROA_MTR',0.239,'Bvkm/PJ');
-- Electricity sector
-- Fuel technologies
INSERT INTO "Efficiency" VALUES ('PIE','SOL','ELC_FT_SOL',2012,'ELC_SOL',1.0,'');
INSERT INTO "Efficiency" VALUES ('PIE','WIN','ELC_FT_WIN',2012,'ELC_WIN',1.0,'');
INSERT INTO "Efficiency" VALUES ('PIE','HYD','ELC_FT_HYD',2012,'ELC_HYD',1.0,'');
INSERT INTO "Efficiency" VALUES ('PIE','GAS_NGA','ELC_FT_NGA',2011,'ELC_NGA',1.0,'');
INSERT INTO "Efficiency" VALUES ('PIE','BIO_BMU','ELC_FT_BMU',2012,'ELC_BMU',1.0,'');
INSERT INTO "Efficiency" VALUES ('PIE','BIO_SLB','ELC_FT_SLB',2012,'ELC_SLB',1.0,'');
INSERT INTO "Efficiency" VALUES ('PIE','BIO_GAS','ELC_FT_BGS',2012,'ELC_BGS',1.0,'');

INSERT INTO "Efficiency" VALUES ('PIE','ELC_IMP','ELC_FT_ELC_IMP',2012,'ELC_CEN',1.0,'');
INSERT INTO "Efficiency" VALUES ('PIE','BIO_DST','ELC_FT_BLQ',2015,'ELC_BLQ',1.0,'');
--Grouping
INSERT INTO "Efficiency" VALUES ('PIE','ELC_SLB','ELC_FT_BIO',2012,'ELC_BIO',1.0,'');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_BMU','ELC_FT_BIO',2012,'ELC_BIO',1.0,'');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_BGS','ELC_FT_BIO',2012,'ELC_BIO',1.0,'');

INSERT INTO "Efficiency" VALUES ('PIE','ELC_SLB','ELC_FT_BIO',2015,'ELC_BIO',1.0,'');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_BMU','ELC_FT_BIO',2015,'ELC_BIO',1.0,'');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_BGS','ELC_FT_BIO',2015,'ELC_BIO',1.0,'');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_BLQ','ELC_FT_BIO',2015,'ELC_BIO',1.0,'');
-- Base year technologies
INSERT INTO "Efficiency" VALUES ('PIE','ELC_NGA','ELC_NGA_CC_E',2011,'ELC_CEN',0.48,'');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_NGA','ELC_NGA_STM_REP_E',2011,'ELC_CEN',0.42,'');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_NGA','ELC_NGA_TURB_E',2011,'ELC_CEN',0.42,'');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_NGA','ELC_CHP_NGA_CC_E',2011,'ELC_CEN',0.71,'');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_NGA','ELC_CHP_NGA_CC_E',2011,'HET',0.71,'');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_NGA','ELC_CHP_NGA_TURB_E',2011,'ELC_CEN',0.70,'');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_NGA','ELC_CHP_NGA_TURB_E',2011,'HET',0.70,'');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_NGA','ELC_CHP_NGA_STM_COND_E',2011,'ELC_CEN',0.73,'');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_NGA','ELC_CHP_NGA_STM_COND_E',2011,'HET',0.73,'');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_BIO','ELC_CHP_BMU_E',2011,'ELC_DST',0.35,'');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_BIO','ELC_CHP_BMU_E',2011,'HET',0.35,'');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_BIO','ELC_CHP_BIO_E',2011,'ELC_DST',0.35,'');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_BIO','ELC_CHP_BIO_E',2011,'HET',0.35,'');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_BIO','ELC_BGS_E',2011,'ELC_DST',0.35,'');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_BIO','ELC_BIO_E',2011,'ELC_DST',0.23,'');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_SOL','ELC_SOL_E',2011,'ELC_DST',1.00,'');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_WIN','ELC_WIN_E',2011,'ELC_DST',1.00,'');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_HYD','ELC_HYD_FLO_E',2011,'ELC_CEN',1.00,'');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_HYD','ELC_HYD_RES_E',2011,'ELC_CEN',1.00,'');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_CEN','ELC_HYD_PUM_E',2011,'ELC_CEN',0.67,'');
-- Planned technologies
INSERT INTO "Efficiency" VALUES ('PIE','ELC_NGA','ELC_NGA_CC_P',2012,'ELC_CEN',0.47,'');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_NGA','ELC_CHP_NGA_CC_P',2012,'ELC_CEN',0.65,'');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_NGA','ELC_CHP_NGA_CC_P',2012,'HET',0.65,'');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_NGA','ELC_CHP_NGA_TURB_P',2012,'ELC_CEN',0.67,'');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_NGA','ELC_CHP_NGA_TURB_P',2012,'HET',0.67,'');

-- New technologies
INSERT INTO "Efficiency" VALUES ('PIE','ELC_NGA','ELC_NGA_TURB_L80MW_N',2012,'ELC_CEN',0.35,'');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_NGA','ELC_NGA_TURB_L80MW_N',2015,'ELC_CEN',0.44,'');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_NGA','ELC_NGA_TURB_L80MW_N',2021,'ELC_CEN',0.49,'');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_WIN','ELC_WIN_N',2012,'ELC_CEN',1.0,'');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_BIO','ELC_BLQ_N',2015,'ELC_CEN',0.32,'');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_BIO','ELC_BLQ_N',2021,'ELC_CEN',0.33,'');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_BIO','ELC_BLQ_N',2030,'ELC_CEN',0.36,'');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_BIO','ELC_BLQ_N',2040,'ELC_CEN',0.39,'');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_BIO','ELC_BLQ_N',2050,'ELC_CEN',0.40,'');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_BIO','ELC_BIO_5C_N',2012,'ELC_CEN',0.26,'');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_BIO','ELC_BIO_5C_N',2014,'ELC_CEN',0.28,'');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_BIO','ELC_BIO_5C_N',2021,'ELC_CEN',0.30,'');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_BIO','ELC_BIO_5C_N',2030,'ELC_CEN',0.33,'');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_BIO','ELC_BIO_5C_N',2040,'ELC_CEN',0.35,'');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_BIO','ELC_BIO_5C_N',2050,'ELC_CEN',0.36,'');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_HYD','ELC_HYD_MICRO_N',2012,'ELC_DST',1.0,'');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_HYD','ELC_HYD_MINI_N',2012,'ELC_DST',1.0,'');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_BIO','ELC_BIOGS_AGR_N',2012,'ELC_DST',0.32,'');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_SOL','ELC_PV_GRO_N',2012,'ELC_CEN',1.0,'');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_SOL','ELC_PV_ROOF_N',2012,'ELC_DST',1.0,'');

INSERT INTO "Efficiency" VALUES ('PIE','ELC_BIO','ELC_CHP_BMU_N',2012,'ELC_CEN',0.38,'');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_BIO','ELC_CHP_BMU_N',2012,'HET',0.38,'');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_NGA','ELC_CHP_NGA_TURB_N',2012,'ELC_CEN',0.77,'');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_NGA','ELC_CHP_NGA_TURB_N',2012,'HET',0.77,'');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_NGA','ELC_CHP_NGA_TURB_N',2040,'ELC_CEN',0.86,'');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_NGA','ELC_CHP_NGA_TURB_N',2040,'HET',0.86,'');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_NGA','ELC_CHP_NGA_CC_N',2012,'ELC_CEN',0.90,'');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_NGA','ELC_CHP_NGA_CC_N',2012,'HET',0.90,'');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_NGA','ELC_CHP_NGA_CP_N',2012,'ELC_CEN',0.84,'');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_NGA','ELC_CHP_NGA_CP_N',2012,'HET',0.84,'');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_NGA','ELC_CHP_NGA_TAP_N',2012,'ELC_CEN',0.80,'');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_NGA','ELC_CHP_NGA_TAP_N',2012,'HET',0.80,'');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_NGA','ELC_CHP_NGA_TAP_N',2040,'ELC_CEN',0.82,'');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_NGA','ELC_CHP_NGA_TAP_N',2040,'HET',0.82,'');
-- Upstream sector
-- Importation prices
INSERT INTO "Efficiency" VALUES ('PIE','ethos','UPS_IMP_OIL_CRD',2011,'OIL_CRD_IMP',1.0,'');
INSERT INTO "Efficiency" VALUES ('PIE','ethos','UPS_IMP_GAS_NGA',2011,'GAS_NGA_IMP',1.0,'');
INSERT INTO "Efficiency" VALUES ('PIE','ethos','UPS_IMP_COA_COC',2011,'IMP_COA_OVC',1.0,'');
INSERT INTO "Efficiency" VALUES ('PIE','ethos','UPS_IMP_COA_HCO',2011,'IMP_COA_HCO',1.0,'');
INSERT INTO "Efficiency" VALUES ('PIE','ethos','UPS_IMP_ELC_CEN',2012,'ELC_IMP',1.0,'');
INSERT INTO "Efficiency" VALUES ('PIE','ethos','UPS_IMP_BIO_DST',2012,'BIO_DST',1.0,'');
INSERT INTO "Efficiency" VALUES ('PIE','ethos','UPS_IMP_OIL_NSP',2012,'IMP_OIL_NSP',1.0,'');
INSERT INTO "Efficiency" VALUES ('PIE','ethos','UPS_DMY_HET',2012,'HET',1.0,'');
INSERT INTO "Efficiency" VALUES ('PIE','ethos','UPS_DMYDMY_BIO',2012,'UPS_BIO_DMY',1.0,'');
INSERT INTO "Efficiency" VALUES ('PIE','ethos','UPS_IMP_OIL_PTC',2011,'OIL_PTC',1.0,'');
-- Fuel technologies
-- Extraction of fossil fuels
INSERT INTO "Efficiency" VALUES ('PIE','ethos','UPS_MIN_RES_HOIL',2011,'OIL_CRD_RES',1.00,'');
INSERT INTO "Efficiency" VALUES ('PIE','ethos','UPS_MIN_GRO_HOIL',2012,'OIL_CRD_GRO',1.00,'');
INSERT INTO "Efficiency" VALUES ('PIE','ethos','UPS_MIN_DSC_HOIL',2012,'OIL_CRD_DSC',1.00,'');
INSERT INTO "Efficiency" VALUES ('PIE','ethos','UPS_MIN_RES_NGA',2011,'GAS_NGA_RES',1.00,'');
INSERT INTO "Efficiency" VALUES ('PIE','ethos','UPS_MIN_GRO_NGA',2012,'GAS_NGA_GRO',1.00,'');
INSERT INTO "Efficiency" VALUES ('PIE','ethos','UPS_MIN_DSC_NGA',2012,'GAS_NGA_DSC',1.00,'');
-- Primary production
INSERT INTO "Efficiency" VALUES ('PIE','OIL_CRD_RES','UPS_PRI_OIL',2011,'OIL_CRD',1.00,'');
INSERT INTO "Efficiency" VALUES ('PIE','OIL_CRD_GRO','UPS_PRI_OIL',2012,'OIL_CRD',1.00,'');
INSERT INTO "Efficiency" VALUES ('PIE','OIL_CRD_DSC','UPS_PRI_OIL',2012,'OIL_CRD',1.00,'');
INSERT INTO "Efficiency" VALUES ('PIE','GAS_NGA_RES','UPS_PRI_NGA',2011,'GAS_NGA_PRI',0.95,'');
INSERT INTO "Efficiency" VALUES ('PIE','GAS_NGA_GRO','UPS_PRI_NGA',2012,'GAS_NGA_PRI',0.95,'');
INSERT INTO "Efficiency" VALUES ('PIE','GAS_NGA_DSC','UPS_PRI_NGA',2012,'GAS_NGA_PRI',0.95,'');
-- Grouping
INSERT INTO "Efficiency" VALUES ('PIE','OIL_CRD','UPS_GRO_OIL',2012,'OIL_FEE',1.00,'');
INSERT INTO "Efficiency" VALUES ('PIE','OIL_CRD_IMP','UPS_GRO_OIL',2012,'OIL_FEE',1.00,'');
INSERT INTO "Efficiency" VALUES ('PIE','GAS_NGA_IMP','UPS_GRO_NGAS',2011,'GAS_NGA',1.00,'');
INSERT INTO "Efficiency" VALUES ('PIE','GAS_NGA_PRI','UPS_GRO_NGAS',2011,'GAS_NGA',1.00,'');
-- Secondary transformation
INSERT INTO "Efficiency" VALUES ('PIE','GAS_NGA','UPS_SEC_REF',2011,'OIL_LPG',0.96,'');
INSERT INTO "Efficiency" VALUES ('PIE','OIL_FEE','UPS_SEC_REF',2011,'OIL_LPG',0.96,'');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_CEN','UPS_SEC_REF',2011,'OIL_LPG',0.96,'');
INSERT INTO "Efficiency" VALUES ('PIE','HET','UPS_SEC_REF',2011,'OIL_LPG',0.96,'');
INSERT INTO "Efficiency" VALUES ('PIE','GAS_NGA','UPS_SEC_REF',2011,'OIL_GSL',0.96,'');
INSERT INTO "Efficiency" VALUES ('PIE','OIL_FEE','UPS_SEC_REF',2011,'OIL_GSL',0.96,'');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_CEN','UPS_SEC_REF',2011,'OIL_GSL',0.96,'');
INSERT INTO "Efficiency" VALUES ('PIE','HET','UPS_SEC_REF',2011,'OIL_GSL',0.96,'');
INSERT INTO "Efficiency" VALUES ('PIE','GAS_NGA','UPS_SEC_REF',2011,'OIL_JTK',0.96,'');
INSERT INTO "Efficiency" VALUES ('PIE','OIL_FEE','UPS_SEC_REF',2011,'OIL_JTK',0.96,'');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_CEN','UPS_SEC_REF',2011,'OIL_JTK',0.96,'');
INSERT INTO "Efficiency" VALUES ('PIE','HET','UPS_SEC_REF',2011,'OIL_JTK',0.96,'');
INSERT INTO "Efficiency" VALUES ('PIE','GAS_NGA','UPS_SEC_REF',2011,'OIL_DST',0.96,'');
INSERT INTO "Efficiency" VALUES ('PIE','OIL_FEE','UPS_SEC_REF',2011,'OIL_DST',0.96,'');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_CEN','UPS_SEC_REF',2011,'OIL_DST',0.96,'');
INSERT INTO "Efficiency" VALUES ('PIE','HET','UPS_SEC_REF',2011,'OIL_DST',0.96,'');
INSERT INTO "Efficiency" VALUES ('PIE','GAS_NGA','UPS_SEC_REF',2011,'OIL_HFO',0.96,'');
INSERT INTO "Efficiency" VALUES ('PIE','OIL_FEE','UPS_SEC_REF',2011,'OIL_HFO',0.96,'');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_CEN','UPS_SEC_REF',2011,'OIL_HFO',0.96,'');
INSERT INTO "Efficiency" VALUES ('PIE','HET','UPS_SEC_REF',2011,'OIL_HFO',0.96,'');
INSERT INTO "Efficiency" VALUES ('PIE','GAS_NGA','UPS_SEC_REF',2011,'OIL_KER',0.96,'');
INSERT INTO "Efficiency" VALUES ('PIE','OIL_FEE','UPS_SEC_REF',2011,'OIL_KER',0.96,'');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_CEN','UPS_SEC_REF',2011,'OIL_KER',0.96,'');
INSERT INTO "Efficiency" VALUES ('PIE','HET','UPS_SEC_REF',2011,'OIL_KER',0.96,'');
INSERT INTO "Efficiency" VALUES ('PIE','GAS_NGA','UPS_SEC_REF',2011,'OIL_NAP',0.96,'');
INSERT INTO "Efficiency" VALUES ('PIE','OIL_FEE','UPS_SEC_REF',2011,'OIL_NAP',0.96,'');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_CEN','UPS_SEC_REF',2011,'OIL_NAP',0.96,'');
INSERT INTO "Efficiency" VALUES ('PIE','HET','UPS_SEC_REF',2011,'OIL_NAP',0.96,'');
INSERT INTO "Efficiency" VALUES ('PIE','GAS_NGA','UPS_SEC_REF',2011,'OIL_RFG',0.96,'');
INSERT INTO "Efficiency" VALUES ('PIE','OIL_FEE','UPS_SEC_REF',2011,'OIL_RFG',0.96,'');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_CEN','UPS_SEC_REF',2011,'OIL_RFG',0.96,'');
INSERT INTO "Efficiency" VALUES ('PIE','HET','UPS_SEC_REF',2011,'OIL_RFG',0.96,'');
INSERT INTO "Efficiency" VALUES ('PIE','GAS_NGA','UPS_SEC_REF',2011,'GAS_ETH',0.96,'');
INSERT INTO "Efficiency" VALUES ('PIE','OIL_FEE','UPS_SEC_REF',2011,'GAS_ETH',0.96,'');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_CEN','UPS_SEC_REF',2011,'GAS_ETH',0.96,'');
INSERT INTO "Efficiency" VALUES ('PIE','HET','UPS_SEC_REF',2011,'GAS_ETH',0.96,'');
INSERT INTO "Efficiency" VALUES ('PIE','IMP_COA_OVC','UPS_SEC_BFG_OXY',2011,'GAS_BFG',0.9,'GOES TO IND SECTOR');
INSERT INTO "Efficiency" VALUES ('PIE','IMP_COA_HCO','UPS_SEC_BFG_OXY',2011,'GAS_BFG',0.9,'GOES TO IND SECTOR');
INSERT INTO "Efficiency" VALUES ('PIE','IMP_COA_HCO','UPS_COA_HCO',2011,'COA_HCO',1.0,'');
INSERT INTO "Efficiency" VALUES ('PIE','IMP_COA_OVC','UPS_IMP_COA_OVC',2011,'COA_OVC',1.0,'');
INSERT INTO "Efficiency" VALUES ('PIE','IMP_OIL_NSP','UPS_REG_OIL_NSP',2012,'OIL_NSP',1.0,'');
INSERT INTO "Efficiency" VALUES ('PIE','COA_HCO','UPS_SEC_OVC_COG',2011,'UPS_COG',0.837,'');
INSERT INTO "Efficiency" VALUES ('PIE','COA_OVC','UPS_SEC_OVC_COG',2011,'UPS_COG',0.837,'');
-- Renewables
INSERT INTO "Efficiency" VALUES ('PIE','ethos','UPS_RNW_HYD',2012,'HYD',1.00,'');
INSERT INTO "Efficiency" VALUES ('PIE','ethos','UPS_RNW_SOL',2012,'SOL',1.00,'');
INSERT INTO "Efficiency" VALUES ('PIE','ethos','UPS_RNW_WIN',2012,'WIN',1.00,'');
INSERT INTO "Efficiency" VALUES ('PIE','ethos','UPS_RNW_SLB',2012,'BIO_SLB',1.00,'');
INSERT INTO "Efficiency" VALUES ('PIE','ethos','UPS_RNW_BMU',2012,'BIO_BMU',1.00,'');
INSERT INTO "Efficiency" VALUES ('PIE','ethos','UPS_RNW_BGS',2012,'BIO_GAS',1.00,'');
INSERT INTO "Efficiency" VALUES ('PIE','ethos','UPS_RNW_BLQ',2012,'BIO_DST',1.00,'');
INSERT INTO "Efficiency" VALUES ('PIE','ethos','UPS_RNW_BIN',2012,'BIO_BIN',1.00,'');

INSERT INTO "Efficiency" VALUES ('PIE','ethos','UPS_RNW_WOD',2012,'BIO_BIN',1.0,'');
INSERT INTO "Efficiency" VALUES ('PIE','ethos','UPS_RNW_WOD',2012,'MAT_WOD',1.0,'');
INSERT INTO "Efficiency" VALUES ('PIE','ethos','UPS_IMP_WOD',2012,'BIO_BIN',1.0,'');
INSERT INTO "Efficiency" VALUES ('PIE','ethos','UPS_IMP_WOD',2012,'MAT_WOD',1.0,'');



-- Residential sector
-- Fuel technologies
INSERT INTO "Efficiency" VALUES ('PIE','OIL_LPG','RES_FT_LPG_E',2011,'RES_LPG',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','OIL_LPG','RES_FT_LPG_N',2012,'RES_LPG',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','GAS_NGA','RES_FT_NGA_E',2011,'RES_NGA',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','OIL_DST','RES_FT_DST_E',2011,'RES_DST',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','OIL_HFO','RES_FT_HFO_E',2011,'RES_HFO',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','BIO_GAS','RES_FT_BIO_E',2011,'RES_BIO',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','BIO_SLB','RES_FT_BIO_E',2011,'RES_BIO',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','BIO_BMU','RES_FT_BIO_E',2011,'RES_BIO',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','UPS_BIO_DMY','RES_FT_BIO_E',2012,'RES_BIO',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','SOL','RES_FT_SOL_E',2011,'RES_SOL',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','SOL','RES_FT_SOL_N',2012,'RES_SOL',1.0,'PJ/PJ');

INSERT INTO "Efficiency" VALUES ('PIE','ELC_CEN','RES_FT_ELC_E',2011,'RES_ELC',0.928,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_DST','RES_FT_ELC_E',2011,'RES_ELC',0.928,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_CEN','RES_FT_ELC_N',2012,'RES_ELC',0.928,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_DST','RES_FT_ELC_N',2012,'RES_ELC',0.928,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','HET','RES_FT_HET_E',2011,'RES_HET',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','GAS_NGA','RES_FT_NGA_N',2012,'RES_NGA',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','OIL_DST','RES_FT_DST_N',2012,'RES_DST',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','OIL_HFO','RES_FT_HFO_N',2012,'RES_HFO',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','BIO_SLB','RES_FT_BIO_N',2012,'RES_BIO',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','BIO_GAS','RES_FT_BIO_N',2012,'RES_BIO',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','UPS_BIO_DMY','RES_FT_BIO_N',2012,'RES_BIO',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','BIO_BMU','RES_FT_BIO_N',2012,'RES_BIO',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','HET','RES_FT_HET_N',2012,'RES_HET',1.0,'PJ/PJ');
-- Base year technologies
INSERT INTO "Efficiency" VALUES ('PIE','RES_NGA','RES_SH_BUR_NGA_LC_E',2011,'RES_SH_LC',0.73*7.93,'Mm^2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_NGA','RES_SH_AHP_NGA_LC_E',2011,'RES_SH_LC',1.10*7.93,'Mm^2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_DST','RES_SH_BUR_DST_LC_E',2011,'RES_SH_LC',0.73*7.93,'Mm^2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_HFO','RES_SH_BUR_HFO_LC_E',2011,'RES_SH_LC',0.73*7.93,'Mm^2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_LPG','RES_SH_BUR_LPG_LC_E',2011,'RES_SH_LC',0.73*7.93,'Mm^2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_ELC','RES_SH_HP_ELC_LC_E',2011,'RES_SH_LC',2.0*7.93,'Mm^2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_ELC','RES_SH_HT_ELC_LC_E',2011,'RES_SH_LC',0.90*7.93,'Mm^2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_HET','RES_SH_HEX_HET_LC_E',2011,'RES_SH_LC',0.90*7.93,'Mm^2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_BIO','RES_SH_WST_BIO_LC_E',2011,'RES_SH_LC',0.25*7.93,'Mm^2/PJ');

INSERT INTO "Efficiency" VALUES ('PIE','RES_NGA','RES_SH_BUR_NGA_MC_E',2011,'RES_SH_MC',0.73*3.36,'Mm^2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_NGA','RES_SH_AHP_NGA_MC_E',2011,'RES_SH_MC',1.10*3.36,'Mm^2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_DST','RES_SH_BUR_DST_MC_E',2011,'RES_SH_MC',0.73*3.36,'Mm^2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_HFO','RES_SH_BUR_HFO_MC_E',2011,'RES_SH_MC',0.73*3.36,'Mm^2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_LPG','RES_SH_BUR_LPG_MC_E',2011,'RES_SH_MC',0.73*3.36,'Mm^2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_ELC','RES_SH_HP_ELC_MC_E',2011,'RES_SH_MC',2.0*3.36,'Mm^2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_ELC','RES_SH_HT_ELC_MC_E',2011,'RES_SH_MC',0.90*3.36,'Mm^2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_HET','RES_SH_HEX_HET_MC_E',2011,'RES_SH_MC',0.90*3.36,'Mm^2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_BIO','RES_SH_WST_BIO_MC_E',2011,'RES_SH_MC',0.25*3.36,'Mm^2/PJ');

INSERT INTO "Efficiency" VALUES ('PIE','RES_NGA','RES_SH_BUR_NGA_HC_E',2011,'RES_SH_HC',0.73*2.27,'Mm^2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_NGA','RES_SH_AHP_NGA_HC_E',2011,'RES_SH_HC',1.10*2.27,'Mm^2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_DST','RES_SH_BUR_DST_HC_E',2011,'RES_SH_HC',0.73*2.27,'Mm^2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_HFO','RES_SH_BUR_HFO_HC_E',2011,'RES_SH_HC',0.73*2.27,'Mm^2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_LPG','RES_SH_BUR_LPG_HC_E',2011,'RES_SH_HC',0.73*2.27,'Mm^2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_ELC','RES_SH_HP_ELC_HC_E',2011,'RES_SH_HC',2.0*2.27,'Mm^2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_ELC','RES_SH_HT_ELC_HC_E',2011,'RES_SH_HC',0.90*2.27,'Mm^2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_HET','RES_SH_HEX_HET_HC_E',2011,'RES_SH_HC',0.90*2.27,'Mm^2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_BIO','RES_SH_WST_BIO_HC_E',2011,'RES_SH_HC',0.25*2.27,'Mm^2/PJ');

INSERT INTO "Efficiency" VALUES ('PIE','RES_ELC','RES_SC_CEN_E',2011,'RES_SC',35.342,'Mm^2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_ELC','RES_SC_EHP_E',2011,'RES_SC',41.232,'Mm^2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_ELC','RES_SC_ROOM_E',2011,'RES_SC',35.342,'Mm^2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_NGA','RES_WH_NGA_E',2011,'RES_WH',0.650,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_HFO','RES_WH_HFO_E',2011,'RES_WH',0.580,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_DST','RES_WH_DST_E',2011,'RES_WH',0.580,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_LPG','RES_WH_LPG_E',2011,'RES_WH',0.540,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_BIO','RES_WH_BIO_E',2011,'RES_WH',0.250,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_ELC','RES_WH_ELC_E',2011,'RES_WH',0.900,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_HET','RES_WH_HET_E',2011,'RES_WH',0.850,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_ELC','RES_RF_RFG_ELC_E',2011,'RES_RF',0.210,'Gl/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_ELC','RES_RF_FRZ_ELC_E',2011,'RES_RF',0.190,'Gl/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_ELC','RES_CW_ELC_E',2011,'RES_CW',0.260,'Glav/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_ELC','RES_CD_ELC_E',2011,'RES_CD',0.068,'Glav/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_ELC','RES_DW_ELC_E',2011,'RES_DW',0.175,'Glav/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_NGA','RES_CK_NGA_E',2011,'RES_CK',0.500,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_LPG','RES_CK_LPG_E',2011,'RES_CK',0.500,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_ELC','RES_CK_ELC_E',2011,'RES_CK',0.800,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_ELC','RES_OE_EQP_E',2011,'RES_OE',1.000,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_ELC','RES_LG_LFL_E',2011,'RES_LG',47.173,'Glm/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_ELC','RES_LG_SFL_E',2011,'RES_LG',38.060,'Glm/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_ELC','RES_LG_LHAL_E',2011,'RES_LG',9.113,'Glm/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_ELC','RES_LG_SHAL_IMP_E',2011,'RES_LG',13.938,'Glm/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_ELC','RES_LG_SHAL_E',2011,'RES_LG',9.649,'Glm/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_ELC','RES_LG_MIN_E',2011,'RES_LG',6.969,'Glm/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_ELC','RES_LG_SIN_E',2011,'RES_LG',5.897,'Glm/PJ');
-- New technologies
INSERT INTO "Efficiency" VALUES ('PIE','RES_ELC','RES_RF_CLB_N',2012,'RES_RF',2.200E-01,'Gl/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_ELC','RES_RF_CLA_N',2012,'RES_RF',2.778E-01,'Gl/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_ELC','RES_RF_CLA+_N',2012,'RES_RF',3.968E-01,'Gl/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_ELC','RES_RF_CLA++_N',2012,'RES_RF',4.630E-01,'Gl/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_ELC','RES_RF_RFG_2020_N',2020,'RES_RF',6.944E-01,'Gl/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_ELC','RES_RF_FRZ_CLB_N',2012,'RES_RF',1.984E-01,'Gl/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_ELC','RES_RF_FRZ_CLA_N',2012,'RES_RF',2.778E-01,'Gl/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_ELC','RES_RF_FRZ_CLA++_N',2012,'RES_RF',4.630E-01,'Gl/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_ELC','RES_RF_FRZ_2020_N',2020,'RES_RF',6.944E-01,'Gl/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_DST','RES_WH_DST_N',2012,'RES_WH',9.16E-01,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_DST','RES_WH_DST_N',2020,'RES_WH',9.414E-01,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_DST','RES_WH_DST_N',2050,'RES_WH',9.847E-01,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_DST','RES_WH_DST_COND_N',2012,'RES_WH',1.02E+00,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_DST','RES_WH_DST_COND_N',2020,'RES_WH',1.046E+00,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_DST','RES_WH_DST_COND_N',2050,'RES_WH',1.094E+00,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_NGA','RES_WH_NGA_N',2012,'RES_WH',9.16E-01,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_NGA','RES_WH_NGA_N',2020,'RES_WH',9.414E-01,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_NGA','RES_WH_NGA_N',2050,'RES_WH',9.847E-01,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_NGA','RES_WH_NGA_COND_N',2012,'RES_WH',1.02E+00,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_NGA','RES_WH_NGA_COND_N',2020,'RES_WH',1.046E+00,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_NGA','RES_WH_NGA_COND_N',2050,'RES_WH',1.094E+00,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_LPG','RES_WH_LPG_N',2012,'RES_WH',8.14E-01,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_LPG','RES_WH_LPG_N',2020,'RES_WH',8.368E-01,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_LPG','RES_WH_LPG_N',2050,'RES_WH',8.753E-01,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_HFO','RES_WH_HFO_N',2012,'RES_WH',8.14E-01,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_LPG','RES_WH_LPG_COND_N',2012,'RES_WH',6.92E-01,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_LPG','RES_WH_LPG_COND_N',2020,'RES_WH',7.113E-01,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_LPG','RES_WH_LPG_COND_N',2050,'RES_WH',7.440E-01,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_BIO','RES_WH_WPL_BIO_N',2012,'RES_WH',7.63E-01,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_BIO','RES_WH_WPL_BIO_N',2020,'RES_WH',7.845E-01,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_BIO','RES_WH_WPL_BIO_N',2050,'RES_WH',8.206E-01,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_ELC','RES_WH_ELC_RES_N',2012,'RES_WH',9.000E-01,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_ELC','RES_WH_AHP_ELC_N',2012,'RES_WH',3.02E+00,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_ELC','RES_WH_AHP_ELC_N',2020,'RES_WH',3.050E+00,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_ELC','RES_WH_AHP_ELC_N',2050,'RES_WH',3.190E+00,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_ELC','RES_WH_HNS_ELC_N',2012,'RES_WH',3.75E+00,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_ELC','RES_WH_HNS_ELC_N',2020,'RES_WH',4.000E+00,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_ELC','RES_WH_HNS_ELC_N',2050,'RES_WH',4.184E+00,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_SOL','RES_WH_SOL_N',2012,'RES_WH',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_PW_HC','RES_WH_PDC_ACS_N',2012,'RES_WH',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_PW_MC','RES_WH_PDC_ACS_N',2012,'RES_WH',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_PW_LC','RES_WH_PDC_ACS_N',2012,'RES_WH',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_ELC','RES_CW_ELC_N',2012,'RES_CW',3.100E-01,'Glav/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_ELC','RES_CW_ELC_IMP_N',2012,'RES_CW',4.000E-01,'Glav/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_ELC','RES_CW_ELC_ADV_N',2012,'RES_CW',4.600E-01,'Glav/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_ELC','RES_CW_2020_ELC_N',2020,'RES_CW',6.200E-01,'Glav/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_ELC','RES_CD_ELC_N',2012,'RES_CD',6.800E-02,'Glav/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_ELC','RES_CD_ELC_ADV_N',2012,'RES_CD',6.944E-02,'Glav/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_ELC','RES_CD_ELC_NEW_N',2020,'RES_CD',7.937E-02,'Glav/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_ELC','RES_DW_ELC_STD_N',2012,'RES_DW',2.100E-01,'Glav/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_ELC','RES_DW_ELC_IMP_N',2012,'RES_DW',2.671E-01,'Glav/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_ELC','RES_DW_ELC_ADV_N',2012,'RES_DW',3.086E-01,'Glav/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_ELC','RES_DW_2020_ELC_N',2020,'RES_DW',3.704E-01,'Glav/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_NGA','RES_CK_NGA_N',2012,'RES_CK',5.000E-01,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_LPG','RES_CK_LPG_N',2012,'RES_CK',5.000E-01,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_ELC','RES_CK_ELC_N',2012,'RES_CK',8.000E-01,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_BIO','RES_CK_BIO_N',2012,'RES_CK',1.500E-01,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_ELC','RES_LG_BFL_IMP_N',2012,'RES_LG',3.460E+01,'Glm/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_ELC','RES_LG_SFL_IMP_N',2012,'RES_LG',2.437E+01,'Glm/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_ELC','RES_LG_EFL_N',2012,'RES_LG',3.899E+01,'Glm/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_ELC','RES_LG_LFL_N',2012,'RES_LG',4.288E+01,'Glm/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_ELC','RES_LG_SFL_N',2012,'RES_LG',3.460E+01,'Glm/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_ELC','RES_LG_LHAL_N',2012,'RES_LG',8.285E+00,'Glm/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_ELC','RES_LG_SHAL_IMP_N',2012,'RES_LG',1.267E+01,'Glm/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_ELC','RES_LG_SHAL_N',2012,'RES_LG',8.772E+00,'Glm/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_ELC','RES_LG_MIN_N',2012,'RES_LG',6.335E+00,'Glm/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_ELC','RES_LG_SIN_N',2012,'RES_LG',5.361E+00,'Glm/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_ELC','RES_LG_LED_ELC_N',2012,'RES_LG',1.511E+01,'Glm/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_ELC','RES_MISC_EQP_N',2012,'RES_OE',1.00,'Mm^2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_DST','RES_SH_DST_LC_N',2012,'RES_SH_LC',0.81*7.93E+00,'Mm^2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_DST','RES_SH_DST_COND_LC_N',2012,'RES_SH_LC',0.915*7.93E+00,'Mm^2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_DST','RES_SH_DST_COND_LC_N',2020,'RES_SH_LC',0.94*7.93E+00,'Mm^2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_DST','RES_SH_DST_COND_LC_N',2050,'RES_SH_LC',0.98*7.93E+00,'Mm^2/PJ');

INSERT INTO "Efficiency" VALUES ('PIE','RES_NGA','RES_SH_NGA_LC_N',2012,'RES_SH_LC',0.81*7.93E+00,'Mm^2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_NGA','RES_SH_NGA_COND_LC_N',2012,'RES_SH_LC',0.915*7.93E+00,'Mm^2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_NGA','RES_SH_NGA_COND_LC_N',2020,'RES_SH_LC',0.94*7.93E+00,'Mm^2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_NGA','RES_SH_NGA_COND_LC_N',2050,'RES_SH_LC',0.98*7.93E+00,'Mm^2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_LPG','RES_SH_LPG_LC_N',2012,'RES_SH_LC',0.81*7.93E+00,'Mm^2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_LPG','RES_SH_LPG_COND_LC_N',2012,'RES_SH_LC',0.915*7.93E+00,'Mm^2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_LPG','RES_SH_LPG_COND_LC_N',2020,'RES_SH_LC',0.94*7.93E+00,'Mm^2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_LPG','RES_SH_LPG_COND_LC_N',2050,'RES_SH_LC',0.98*7.93E+00,'Mm^2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_BIO','RES_SH_WST_BIO_LC_N',2012,'RES_SH_LC',0.50*7.93E+00,'Mm^2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_BIO','RES_SH_WPL_BIO_LC_N',2012,'RES_SH_LC',0.772*7.93E+00,'Mm^2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_BIO','RES_SH_WPL_BIO_LC_N',2020,'RES_SH_LC',0.79*7.93E+00,'Mm^2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_BIO','RES_SH_WPL_BIO_LC_N',2050,'RES_SH_LC',0.83*7.93E+00,'Mm^2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_ELC','RES_SH_AHP_ELC_LC_N',2012,'RES_SH_LC',3.76*7.93E+00,'Mm^2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_ELC','RES_SH_AHP_ELC_LC_N',2020,'RES_SH_LC',4.50*7.93E+00,'Mm^2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_ELC','RES_SH_AHP_ELC_LC_N',2050,'RES_SH_LC',4.71*7.93E+00,'Mm^2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_ELC','RES_SH_HNS_ELC_LC_N',2012,'RES_SH_LC',4.50*7.93E+00,'Mm^2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_ELC','RES_SH_HNS_ELC_LC_N',2020,'RES_SH_LC',5.50*7.93E+00,'Mm^2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_ELC','RES_SH_HNS_ELC_LC_N',2050,'RES_SH_LC',5.75*7.93E+00,'Mm^2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_ELC','RES_SH_HPP_ELC_LC_N',2012,'RES_SH_LC',4.88*7.93E+00,'Mm^2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_ELC','RES_SH_HPP_ELC_LC_N',2020,'RES_SH_LC',5.50*7.93E+00,'Mm^2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_ELC','RES_SH_HPP_ELC_LC_N',2050,'RES_SH_LC',5.75*7.93E+00,'Mm^2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_HET','RES_SH_HEX_HET_LC_N',2012,'RES_SH_LC',0.90*7.93E+00,'Mm^2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_ELC','RES_SH_HPTS_LC_N',2012,'RES_PH_LC',3.76,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_ELC','RES_SH_HPTS_LC_N',2012,'RES_PC_LC',3.76,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_ELC','RES_SH_HPTS_LC_N',2012,'RES_PW_LC',3.76,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_ELC','RES_SH_HPTS_LC_N',2020,'RES_PH_LC',4.50,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_ELC','RES_SH_HPTS_LC_N',2020,'RES_PC_LC',4.50,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_ELC','RES_SH_HPTS_LC_N',2020,'RES_PW_LC',4.5,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_ELC','RES_SH_HPTS_LC_N',2050,'RES_PH_LC',4.71,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_ELC','RES_SH_HPTS_LC_N',2050,'RES_PC_LC',4.71,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_ELC','RES_SH_HPTS_LC_N',2050,'RES_PW_LC',4.71,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_PH_LC','RES_SH_HP_HET_LC_N',2012,'RES_SH_LC',7.93E+00,'Mm^2/PJ');

INSERT INTO "Efficiency" VALUES ('PIE','RES_SOL','RES_SH_SOL_DST_LC_N',2012,'RES_SH_LC',0.835*7.93E+00,'Mm^2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_DST','RES_SH_SOL_DST_LC_N',2012,'RES_SH_LC',0.835*7.93E+00,'Mm^2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_SOL','RES_SH_SOL_DST_LC_N',2020,'RES_SH_LC',0.86*7.93E+00,'Mm^2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_DST','RES_SH_SOL_DST_LC_N',2020,'RES_SH_LC',0.86*7.93E+00,'Mm^2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_SOL','RES_SH_SOL_DST_LC_N',2050,'RES_SH_LC',0.90*7.93E+00,'Mm^2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_DST','RES_SH_SOL_DST_LC_N',2050,'RES_SH_LC',0.90*7.93E+00,'Mm^2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_SOL','RES_SH_SOL_LPG_LC_N',2012,'RES_SH_LC',0.835*7.93E+00,'Mm^2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_LPG','RES_SH_SOL_LPG_LC_N',2012,'RES_SH_LC',0.835*7.93E+00,'Mm^2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_SOL','RES_SH_SOL_LPG_LC_N',2020,'RES_SH_LC',0.86*7.93E+00,'Mm^2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_LPG','RES_SH_SOL_LPG_LC_N',2020,'RES_SH_LC',0.86*7.93E+00,'Mm^2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_SOL','RES_SH_SOL_LPG_LC_N',2050,'RES_SH_LC',0.90*7.93E+00,'Mm^2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_LPG','RES_SH_SOL_LPG_LC_N',2050,'RES_SH_LC',0.90*7.93E+00,'Mm^2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_SOL','RES_SH_SOL_NGA_LC_N',2012,'RES_SH_LC',0.835*7.93E+00,'Mm^2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_NGA','RES_SH_SOL_NGA_LC_N',2012,'RES_SH_LC',0.835*7.93E+00,'Mm^2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_SOL','RES_SH_SOL_NGA_LC_N',2020,'RES_SH_LC',0.86*7.93E+00,'Mm^2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_NGA','RES_SH_SOL_NGA_LC_N',2020,'RES_SH_LC',0.86*7.93E+00,'Mm^2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_SOL','RES_SH_SOL_NGA_LC_N',2050,'RES_SH_LC',0.90*7.93E+00,'Mm^2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_NGA','RES_SH_SOL_NGA_LC_N',2050,'RES_SH_LC',0.90*7.93E+00,'Mm^2/PJ');

INSERT INTO "Efficiency" VALUES ('PIE','RES_DST','RES_SH_DST_MC_N',2012,'RES_SH_MC',0.81*3.36E+00,'Mm^2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_INS_MC','RES_SH_DST_MC_N',2012,'RES_SH_MC',0.81*3.36E+00,'Mm^2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_DST','RES_SH_DST_COND_MC_N',2012,'RES_SH_MC',0.9150*3.36E+00,'Mm^2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_INS_MC','RES_SH_DST_COND_MC_N',2012,'RES_SH_MC',0.915*3.36E+00,'Mm^2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_DST','RES_SH_DST_COND_MC_N',2020,'RES_SH_MC',0.94*3.36E+00,'Mm^2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_INS_MC','RES_SH_DST_COND_MC_N',2020,'RES_SH_MC',0.94*3.36E+00,'Mm^2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_DST','RES_SH_DST_COND_MC_N',2050,'RES_SH_MC',0.98*3.36E+00,'Mm^2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_INS_MC','RES_SH_DST_COND_MC_N',2050,'RES_SH_MC',0.98*3.36E+00,'Mm^2/PJ');

INSERT INTO "Efficiency" VALUES ('PIE','RES_NGA','RES_SH_NGA_MC_N',2012,'RES_SH_MC',0.826*3.36E+00,'Mm^2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_INS_MC','RES_SH_NGA_MC_N',2012,'RES_SH_MC',0.826*3.36E+00,'Mm^2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_NGA','RES_SH_NGA_MC_N',2050,'RES_SH_MC',0.90*3.36E+00,'Mm^2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_INS_MC','RES_SH_NGA_MC_N',2050,'RES_SH_MC',0.90*3.36E+00,'Mm^2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_NGA','RES_SH_NGA_COND_MC_N',2012,'RES_SH_MC',0.896*3.36E+00,'Mm^2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_INS_MC','RES_SH_NGA_COND_MC_N',2012,'RES_SH_MC',0.896*3.36E+00,'Mm^2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_NGA','RES_SH_NGA_COND_MC_N',2020,'RES_SH_MC',0.90*3.36E+00,'Mm^2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_INS_MC','RES_SH_NGA_COND_MC_N',2020,'RES_SH_MC',0.90*3.36E+00,'Mm^2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_NGA','RES_SH_NGA_COND_MC_N',2050,'RES_SH_MC',0.98*3.36E+00,'Mm^2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_INS_MC','RES_SH_NGA_COND_MC_N',2050,'RES_SH_MC',0.98*3.36E+00,'Mm^2/PJ');

INSERT INTO "Efficiency" VALUES ('PIE','RES_LPG','RES_SH_LPG_MC_N',2012,'RES_SH_MC',0.81*3.36E+00,'Mm^2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_INS_MC','RES_SH_LPG_MC_N',2012,'RES_SH_MC',0.81*3.36E+00,'Mm^2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_LPG','RES_SH_LPG_COND_MC_N',2012,'RES_SH_MC',0.94*3.36E+00,'Mm^2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_INS_MC','RES_SH_LPG_COND_MC_N',2012,'RES_SH_MC',0.94*3.36E+00,'Mm^2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_LPG','RES_SH_LPG_COND_MC_N',2020,'RES_SH_MC',0.94*3.36E+00,'Mm^2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_INS_MC','RES_SH_LPG_COND_MC_N',2020,'RES_SH_MC',0.94*3.36E+00,'Mm^2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_LPG','RES_SH_LPG_COND_MC_N',2050,'RES_SH_MC',0.98*3.36E+00,'Mm^2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_INS_MC','RES_SH_LPG_COND_MC_N',2050,'RES_SH_MC',0.98*3.36E+00,'Mm^2/PJ');

INSERT INTO "Efficiency" VALUES ('PIE','RES_BIO','RES_SH_WST_BIO_MC_N',2012,'RES_SH_MC',0.50*3.36E+00,'Mm^2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_INS_MC','RES_SH_WST_BIO_MC_N',2012,'RES_SH_MC',0.50*3.36E+00,'Mm^2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_BIO','RES_SH_WPL_BIO_MC_N',2012,'RES_SH_MC',0.772*3.36E+00,'Mm^2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_INS_MC','RES_SH_WPL_BIO_MC_N',2012,'RES_SH_MC',0.772*3.36E+00,'Mm^2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_BIO','RES_SH_WPL_BIO_MC_N',2020,'RES_SH_MC',0.79*3.36E+00,'Mm^2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_INS_MC','RES_SH_WPL_BIO_MC_N',2020,'RES_SH_MC',0.79*3.36E+00,'Mm^2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_BIO','RES_SH_WPL_BIO_MC_N',2050,'RES_SH_MC',0.83*3.36E+00,'Mm^2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_INS_MC','RES_SH_WPL_BIO_MC_N',2050,'RES_SH_MC',0.83*3.36E+00,'Mm^2/PJ');

INSERT INTO "Efficiency" VALUES ('PIE','RES_ELC','RES_SH_AHP_ELC_MC_N',2012,'RES_SH_MC',3.57*3.36E+00,'Mm^2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_INS_MC','RES_SH_AHP_ELC_MC_N',2012,'RES_SH_MC',3.57*3.36E+00,'Mm^2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_ELC','RES_SH_AHP_ELC_MC_N',2020,'RES_SH_MC',4.00*3.36E+00,'Mm^2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_INS_MC','RES_SH_AHP_ELC_MC_N',2020,'RES_SH_MC',4.00*3.36E+00,'Mm^2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_ELC','RES_SH_AHP_ELC_MC_N',2050,'RES_SH_MC',4.71*3.36E+00,'Mm^2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_INS_MC','RES_SH_AHP_ELC_MC_N',2050,'RES_SH_MC',4.71*3.36E+00,'Mm^2/PJ');

INSERT INTO "Efficiency" VALUES ('PIE','RES_ELC','RES_SH_HNS_ELC_MC_N',2012,'RES_SH_MC',4.38*3.36E+00,'Mm^2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_INS_MC','RES_SH_HNS_ELC_MC_N',2012,'RES_SH_MC',4.38*3.36E+00,'Mm^2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_ELC','RES_SH_HNS_ELC_MC_N',2020,'RES_SH_MC',5.00*3.36E+00,'Mm^2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_INS_MC','RES_SH_HNS_ELC_MC_N',2020,'RES_SH_MC',5.00*3.36E+00,'Mm^2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_ELC','RES_SH_HNS_ELC_MC_N',2050,'RES_SH_MC',5.75*3.36E+00,'Mm^2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_INS_MC','RES_SH_HNS_ELC_MC_N',2050,'RES_SH_MC',5.75*3.36E+00,'Mm^2/PJ');

INSERT INTO "Efficiency" VALUES ('PIE','RES_ELC','RES_SH_HPP_ELC_MC_N',2012,'RES_SH_MC',4.88*3.36E+00,'Mm^2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_INS_MC','RES_SH_HPP_ELC_MC_N',2012,'RES_SH_MC',4.88*3.36E+00,'Mm^2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_ELC','RES_SH_HPP_ELC_MC_N',2020,'RES_SH_MC',5.50*3.36E+00,'Mm^2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_INS_MC','RES_SH_HPP_ELC_MC_N',2020,'RES_SH_MC',5.50*3.36E+00,'Mm^2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_ELC','RES_SH_HPP_ELC_MC_N',2050,'RES_SH_MC',5.75*3.36E+00,'Mm^2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_INS_MC','RES_SH_HPP_ELC_MC_N',2050,'RES_SH_MC',5.75*3.36E+00,'Mm^2/PJ');

INSERT INTO "Efficiency" VALUES ('PIE','RES_HET','RES_SH_HEX_HET_MC_N',2012,'RES_SH_MC',0.90*3.36E+00,'Mm^2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_INS_MC','RES_SH_HEX_HET_MC_N',2012,'RES_SH_MC',0.90*3.36E+00,'Mm^2/PJ');

INSERT INTO "Efficiency" VALUES ('PIE','RES_ELC','RES_SH_HPTS_MC_N',2012,'RES_PH_MC',3.76,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_ELC','RES_SH_HPTS_MC_N',2012,'RES_PC_MC',3.76,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_ELC','RES_SH_HPTS_MC_N',2012,'RES_PW_MC',3.76,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_ELC','RES_SH_HPTS_MC_N',2020,'RES_PH_MC',4.5,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_ELC','RES_SH_HPTS_MC_N',2020,'RES_PC_MC',4.5,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_ELC','RES_SH_HPTS_MC_N',2020,'RES_PW_MC',4.5,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_ELC','RES_SH_HPTS_MC_N',2050,'RES_PH_MC',4.71,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_ELC','RES_SH_HPTS_MC_N',2050,'RES_PC_MC',4.71,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_ELC','RES_SH_HPTS_MC_N',2050,'RES_PW_MC',4.71,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_PH_MC','RES_SH_HP_HET_MC_N',2012,'RES_SH_MC',3.36E+00,'Mm^2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_SOL','RES_SH_SOL_DST_MC_N',2012,'RES_SH_MC',0.835*3.36E+00,'Mm^2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_DST','RES_SH_SOL_DST_MC_N',2012,'RES_SH_MC',0.835*3.36E+00,'Mm^2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_SOL','RES_SH_SOL_DST_MC_N',2020,'RES_SH_MC',0.86*3.36E+00,'Mm^2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_DST','RES_SH_SOL_DST_MC_N',2020,'RES_SH_MC',0.86*3.36E+00,'Mm^2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_SOL','RES_SH_SOL_DST_MC_N',2050,'RES_SH_MC',0.90*3.36E+00,'Mm^2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_DST','RES_SH_SOL_DST_MC_N',2050,'RES_SH_MC',0.90*3.36E+00,'Mm^2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_SOL','RES_SH_SOL_LPG_MC_N',2012,'RES_SH_MC',0.835*3.36E+00,'Mm^2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_LPG','RES_SH_SOL_LPG_MC_N',2012,'RES_SH_MC',0.835*3.36E+00,'Mm^2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_SOL','RES_SH_SOL_LPG_MC_N',2020,'RES_SH_MC',0.86*3.36E+00,'Mm^2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_LPG','RES_SH_SOL_LPG_MC_N',2020,'RES_SH_MC',0.86*3.36E+00,'Mm^2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_SOL','RES_SH_SOL_LPG_MC_N',2050,'RES_SH_MC',0.90*3.36E+00,'Mm^2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_LPG','RES_SH_SOL_LPG_MC_N',2050,'RES_SH_MC',0.90*3.36E+00,'Mm^2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_SOL','RES_SH_SOL_NGA_MC_N',2012,'RES_SH_MC',0.835*3.36E+00,'Mm^2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_NGA','RES_SH_SOL_NGA_MC_N',2012,'RES_SH_MC',0.835*3.36E+00,'Mm^2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_SOL','RES_SH_SOL_NGA_MC_N',2020,'RES_SH_MC',0.86*3.36E+00,'Mm^2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_NGA','RES_SH_SOL_NGA_MC_N',2020,'RES_SH_MC',0.86*3.36E+00,'Mm^2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_SOL','RES_SH_SOL_NGA_MC_N',2050,'RES_SH_MC',0.90*3.36E+00,'Mm^2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_NGA','RES_SH_SOL_NGA_MC_N',2050,'RES_SH_MC',0.90*3.36E+00,'Mm^2/PJ');

--newly inserted
INSERT INTO "Efficiency" VALUES ('PIE','CRT_EFF','RES_SH_ROOF_INS_MC_N',2012,'RES_INS_MC',1.00,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','CRT_EFF','RES_SH_INT_INS_MC_N',2012,'RES_INS_MC',1.00,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','CRT_EFF','RES_SH_BASE_INS_MC_N',2012,'RES_INS_MC',1.00,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','CRT_EFF','RES_SH_WIN_INS_MC_N',2012,'RES_INS_MC',1.00,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','CRT_EFF','RES_SH_ROOF_INS_MC_N',2012,'RES_INS_C',1.00,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','CRT_EFF','RES_SH_INT_INS_MC_N',2012,'RES_INS_C',1.00,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','CRT_EFF','RES_SH_BASE_INS_MC_N',2012,'RES_INS_C',1.00,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','CRT_EFF','RES_SH_WIN_INS_MC_N',2012,'RES_INS_C',1.00,'PJ/PJ');

INSERT INTO "Efficiency" VALUES ('PIE','RES_DST','RES_SH_DST_HC_N',2012,'RES_SH_HC',0.81*2.27,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_INS_HC','RES_SH_DST_HC_N',2012,'RES_SH_HC',0.81*2.27,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_DST','RES_SH_DST_COND_HC_N',2012,'RES_SH_HC',0.90*2.27,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_INS_HC','RES_SH_DST_COND_HC_N',2012,'RES_SH_HC',0.90*2.27,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_DST','RES_SH_DST_COND_HC_N',2020,'RES_SH_HC',0.94*2.27,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_INS_HC','RES_SH_DST_COND_HC_N',2020,'RES_SH_HC',0.94*2.27,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_DST','RES_SH_DST_COND_HC_N',2050,'RES_SH_HC',0.98*2.27,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_INS_HC','RES_SH_DST_COND_HC_N',2050,'RES_SH_HC',0.98*2.27,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_NGA','RES_SH_NGA_HC_N',2012,'RES_SH_HC',0.78*2.27,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_INS_HC','RES_SH_NGA_HC_N',2012,'RES_SH_HC',0.78*2.27,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_NGA','RES_SH_NGA_HC_N',2050,'RES_SH_HC',0.90*2.27,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_INS_HC','RES_SH_NGA_HC_N',2050,'RES_SH_HC',0.90*2.27,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_NGA','RES_SH_NGA_COND_HC_N',2012,'RES_SH_HC',0.85*2.27,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_INS_HC','RES_SH_NGA_COND_HC_N',2012,'RES_SH_HC',0.85*2.27,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_NGA','RES_SH_NGA_COND_HC_N',2020,'RES_SH_HC',0.92*2.27,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_INS_HC','RES_SH_NGA_COND_HC_N',2020,'RES_SH_HC',0.92*2.27,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_NGA','RES_SH_NGA_COND_HC_N',2050,'RES_SH_HC',0.98*2.27,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_INS_HC','RES_SH_NGA_COND_HC_N',2050,'RES_SH_HC',0.98*2.27,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_LPG','RES_SH_LPG_HC_N',2012,'RES_SH_HC',0.75*2.27,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_INS_HC','RES_SH_LPG_HC_N',2012,'RES_SH_HC',0.75*2.27,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_LPG','RES_SH_LPG_HC_N',2020,'RES_SH_HC',0.81*2.27,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_INS_HC','RES_SH_LPG_HC_N',2020,'RES_SH_HC',0.81*2.27,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_LPG','RES_SH_LPG_COND_HC_N',2012,'RES_SH_HC',0.915*2.27,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_INS_HC','RES_SH_LPG_COND_HC_N',2012,'RES_SH_HC',0.915*2.27,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_LPG','RES_SH_LPG_COND_HC_N',2020,'RES_SH_HC',0.90*2.27,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_INS_HC','RES_SH_LPG_COND_HC_N',2020,'RES_SH_HC',0.90*2.27,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_LPG','RES_SH_LPG_COND_HC_N',2050,'RES_SH_HC',0.98*2.27,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_INS_HC','RES_SH_LPG_COND_HC_N',2050,'RES_SH_HC',0.98*2.27,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_BIO','RES_SH_WST_BIO_HC_N',2012,'RES_SH_HC',0.32*2.27,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_INS_HC','RES_SH_WST_BIO_HC_N',2012,'RES_SH_HC',0.32*2.27,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_BIO','RES_SH_WST_BIO_HC_N',2050,'RES_SH_HC',0.45*2.27,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_INS_HC','RES_SH_WST_BIO_HC_N',2050,'RES_SH_HC',0.45*2.27,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_BIO','RES_SH_WPL_BIO_HC_N',2012,'RES_SH_HC',0.772*2.27,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_INS_HC','RES_SH_WPL_BIO_HC_N',2012,'RES_SH_HC',0.772*2.27,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_BIO','RES_SH_WPL_BIO_HC_N',2020,'RES_SH_HC',0.79*2.27,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_INS_HC','RES_SH_WPL_BIO_HC_N',2020,'RES_SH_HC',0.79*2.27,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_BIO','RES_SH_WPL_BIO_HC_N',2050,'RES_SH_HC',0.83*2.27,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_INS_HC','RES_SH_WPL_BIO_HC_N',2050,'RES_SH_HC',0.83*2.27,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_ELC','RES_SH_AHP_ELC_HC_N',2012,'RES_SH_HC',3.57*2.27,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_INS_HC','RES_SH_AHP_ELC_HC_N',2012,'RES_SH_HC',3.57*2.27,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_ELC','RES_SH_AHP_ELC_HC_N',2020,'RES_SH_HC',4.00*2.27,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_INS_HC','RES_SH_AHP_ELC_HC_N',2020,'RES_SH_HC',4.00*2.27,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_ELC','RES_SH_AHP_ELC_HC_N',2050,'RES_SH_HC',4.71*2.27,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_INS_HC','RES_SH_AHP_ELC_HC_N',2050,'RES_SH_HC',4.71*2.27,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_ELC','RES_SH_HNS_ELC_HC_N',2012,'RES_SH_HC',4.38*2.27,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_INS_HC','RES_SH_HNS_ELC_HC_N',2012,'RES_SH_HC',4.38*2.27,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_ELC','RES_SH_HNS_ELC_HC_N',2020,'RES_SH_HC',5.00*2.27,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_INS_HC','RES_SH_HNS_ELC_HC_N',2020,'RES_SH_HC',5.00*2.27,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_ELC','RES_SH_HNS_ELC_HC_N',2050,'RES_SH_HC',5.75*2.27,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_INS_HC','RES_SH_HNS_ELC_HC_N',2050,'RES_SH_HC',5.75*2.27,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_ELC','RES_SH_HPP_ELC_HC_N',2012,'RES_SH_HC',4.88*2.27,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_INS_HC','RES_SH_HPP_ELC_HC_N',2012,'RES_SH_HC',4.88*2.27,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_ELC','RES_SH_HPP_ELC_HC_N',2020,'RES_SH_HC',5.50*2.27,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_INS_HC','RES_SH_HPP_ELC_HC_N',2020,'RES_SH_HC',5.50*2.27,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_ELC','RES_SH_HPP_ELC_HC_N',2050,'RES_SH_HC',5.75*2.27,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_INS_HC','RES_SH_HPP_ELC_HC_N',2050,'RES_SH_HC',5.75*2.27,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_HET','RES_SH_HEX_HET_HC_N',2012,'RES_SH_HC',0.90*2.27,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_INS_HC','RES_SH_HEX_HET_HC_N',2012,'RES_SH_HC',0.90*2.27,'Mm2/PJ');

INSERT INTO "Efficiency" VALUES ('PIE','CRT_EFF','RES_SH_ROOF_INS_HC_N',2012,'RES_INS_HC',1.00,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','CRT_EFF','RES_SH_INT_INS_HC_N',2012,'RES_INS_HC',1.00,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','CRT_EFF','RES_SH_BASE_INS_HC_N',2012,'RES_INS_HC',1.00,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','CRT_EFF','RES_SH_WIN_INS_HC_N',2012,'RES_INS_HC',1.00,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','CRT_EFF','RES_SH_ROOF_INS_HC_N',2012,'RES_INS_C',1.00,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','CRT_EFF','RES_SH_INT_INS_HC_N',2012,'RES_INS_C',1.00,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','CRT_EFF','RES_SH_BASE_INS_HC_N',2012,'RES_INS_C',1.00,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','CRT_EFF','RES_SH_WIN_INS_HC_N',2012,'RES_INS_C',1.00,'PJ/PJ');


INSERT INTO "Efficiency" VALUES ('PIE','RES_ELC','RES_SH_HPTS_HC_N',2012,'RES_PH_HC',4.04,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_ELC','RES_SH_HPTS_HC_N',2012,'RES_PC_HC',4.04,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_ELC','RES_SH_HPTS_HC_N',2012,'RES_PW_HC',4.04,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_ELC','RES_SH_HPTS_HC_N',2020,'RES_PH_HC',4.51,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_ELC','RES_SH_HPTS_HC_N',2020,'RES_PC_HC',4.51,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_ELC','RES_SH_HPTS_HC_N',2020,'RES_PW_HC',4.51,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_ELC','RES_SH_HPTS_HC_N',2050,'RES_PH_HC',4.71,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_ELC','RES_SH_HPTS_HC_N',2050,'RES_PC_HC',4.71,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_ELC','RES_SH_HPTS_HC_N',2050,'RES_PW_HC',4.71,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_PH_HC','RES_SH_HP_HET_HC_N',2012,'RES_SH_HC',1.9395E+00,'Mm^2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_ELC'  ,'RES_SC_AHP_ELC_STD_N',2012,'RES_SC',4.565E+01,'Mm^2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_INS_C'  ,'RES_SC_AHP_ELC_STD_N',2012,'RES_SC',4.565E+01,'Mm^2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_ELC'  ,'RES_SC_AHP_ELC_IMP_N',2012,'RES_SC',5.183E+01,'Mm^2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_INS_C'  ,'RES_SC_AHP_ELC_IMP_N',2012,'RES_SC',5.183E+01,'Mm^2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_ELC'  ,'RES_SC_CEN_N',2012,'RES_SC',4.315E+01,'Mm^2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_INS_C'  ,'RES_SC_CEN_N',2012,'RES_SC',4.315E+01,'Mm^2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_ELC'  ,'RES_SC_ROOM_N',2012,'RES_SC',5.051E+01,'Mm^2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_INS_C'  ,'RES_SC_ROOM_N',2012,'RES_SC',5.051E+01,'Mm^2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_ELC'  ,'RES_SC_AHP_ELC_ADV_N',2012,'RES_SC',6.347E+01,'Mm^2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_INS_C'  ,'RES_SC_AHP_ELC_ADV_N',2012,'RES_SC',6.347E+01,'Mm^2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_ELC'  ,'RES_SC_ROOM_ELC_NEW_N',2012,'RES_SC',5.183E+01,'Mm^2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_INS_C'  ,'RES_SC_ROOM_ELC_NEW_N',2012,'RES_SC',5.183E+01,'Mm^2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_NGA'  ,'RES_SC_AHP_NGA_ADV_N',2012,'RES_SC',1.620E+01,'Mm^2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_INS_C'  ,'RES_SC_AHP_NGA_ADV_N',2012,'RES_SC',1.620E+01,'Mm^2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_NGA'  ,'RES_SC_CEN_NGA_N',2012,'RES_SC',1.767E+01,'Mm^2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_INS_C'  ,'RES_SC_CEN_NGA_N',2012,'RES_SC',1.767E+01,'Mm^2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_NGA'  ,'RES_SC_AHP_NGA_N',2015,'RES_SC',1.767E+01,'Mm^2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_INS_C'  ,'RES_SC_AHP_NGA_N',2015,'RES_SC',1.767E+01,'Mm^2/PJ');

INSERT INTO "Efficiency" VALUES ('PIE','RES_PC_LC','RES_SC_HP_N',2012,'RES_SC',1.473E+01,'Mm^2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_PC_MC','RES_SC_HP_N',2012,'RES_SC',1.473E+01,'Mm^2/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','RES_PC_HC','RES_SC_HP_N',2012,'RES_SC',1.473E+01,'Mm^2/PJ');
-- Micro-CHP
INSERT INTO "Efficiency" VALUES ('PIE','ELC_NGA','RES_CHP_NGA_CI_N',2012,'ELC_DST',0.368,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_NGA','RES_CHP_NGA_CI_N',2015,'ELC_DST',0.375,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_NGA','RES_CHP_NGA_CI_N',2023,'ELC_DST',0.410,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_NGA','RES_CHP_NGA_CI_N',2030,'ELC_DST',0.450,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_NGA','RES_CHP_NGA_CI_N',2012,'RES_HET',0.450,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_NGA','RES_CHP_NGA_CI_N',2015,'RES_HET',0.450,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_NGA','RES_CHP_NGA_CI_N',2021,'RES_HET',0.450,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_NGA','RES_CHP_NGA_CI_N',2030,'RES_HET',0.432,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_NGA','RES_CHP_NGA_MICRO_N',2012,'ELC_DST',0.300,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_NGA','RES_CHP_NGA_MICRO_N',2014,'ELC_DST',0.310,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_NGA','RES_CHP_NGA_MICRO_N',2023,'ELC_DST',0.360,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_NGA','RES_CHP_NGA_MICRO_N',2030,'ELC_DST',0.440,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_NGA','RES_CHP_NGA_MICRO_N',2012,'RES_HET',0.513,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_NGA','RES_CHP_NGA_MICRO_N',2015,'RES_HET',0.510,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_NGA','RES_CHP_NGA_MICRO_N',2023,'RES_HET',0.500,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_NGA','RES_CHP_NGA_MICRO_N',2030,'RES_HET',0.480,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_NGA','RES_CHP_NGA_CC_N',2012,'ELC_DST',0.40,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_NGA','RES_CHP_NGA_CC_N',2012,'RES_HET',0.40,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_NGA','RES_CHP_NGA_CC_N',2015,'ELC_DST',0.40,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_NGA','RES_CHP_NGA_CC_N',2015,'RES_HET',0.40,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_NGA','RES_CHP_NGA_CC_N',2023,'ELC_DST',0.40,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_NGA','RES_CHP_NGA_CC_N',2023,'RES_HET',0.40,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_NGA','RES_CHP_NGA_STR_N',2023,'ELC_DST',0.16,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_NGA','RES_CHP_NGA_STR_N',2023,'RES_HET',0.64,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_NGA','RES_CHP_NGA_STR_N',2030,'ELC_DST',0.20,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_NGA','RES_CHP_NGA_STR_N',2030,'RES_HET',0.60,'PJ/PJ');
-- Commercial sector
-- Fuel technologies
INSERT INTO "Efficiency" VALUES ('PIE','GAS_NGA','COM_FT_NGA_E',2011,'COM_NGA',1.0,'');
INSERT INTO "Efficiency" VALUES ('PIE','OIL_DST','COM_FT_DST_E',2011,'COM_DST',1.0,'');
INSERT INTO "Efficiency" VALUES ('PIE','OIL_HFO','COM_FT_DST_E',2011,'COM_DST',1.0,'');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_CEN','COM_FT_ELC_EN',2011,'COM_ELC',0.929,'');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_DST','COM_FT_ELC_EN',2011,'COM_ELC',0.929,'');
INSERT INTO "Efficiency" VALUES ('PIE','GAS_NGA','COM_FT_NGA_N',2012,'COM_NGA',1.0,'');
INSERT INTO "Efficiency" VALUES ('PIE','OIL_DST','COM_FT_DST_N',2012,'COM_DST',1.0,'');
INSERT INTO "Efficiency" VALUES ('PIE','OIL_HFO','COM_FT_DST_N',2012,'COM_DST',1.0,'');
INSERT INTO "Efficiency" VALUES ('PIE','OIL_LPG','COM_FT_LPG_EN',2011,'COM_LPG',1.0,'');
INSERT INTO "Efficiency" VALUES ('PIE','BIO_SLB','COM_FT_BIO_N',2012,'COM_BIO',1.0,'');
INSERT INTO "Efficiency" VALUES ('PIE','HET','COM_FT_HET_EN',2011,'COM_HET',1.0,'');
-- Base year technologies
INSERT INTO "Efficiency" VALUES ('PIE','COM_NGA','COM_SH_HT_NGA_E',2011,'COM_SH',0.700,'');
INSERT INTO "Efficiency" VALUES ('PIE','COM_NGA','COM_SH_HP_NGA_E',2011,'COM_SH',1.900,'');
INSERT INTO "Efficiency" VALUES ('PIE','COM_DST','COM_SH_HT_DST_E',2011,'COM_SH',0.700,'');
INSERT INTO "Efficiency" VALUES ('PIE','COM_LPG','COM_SH_HT_LPG_E',2011,'COM_SH',0.600,'');
INSERT INTO "Efficiency" VALUES ('PIE','COM_ELC','COM_SH_RES_ELC_E',2011,'COM_SH',0.900,'');
INSERT INTO "Efficiency" VALUES ('PIE','COM_ELC','COM_SH_HP_ELC_E',2011,'COM_SH',2.000,'');
INSERT INTO "Efficiency" VALUES ('PIE','COM_HET','COM_SH_HEX_HET_E',2011,'COM_SH',0.900,'');
INSERT INTO "Efficiency" VALUES ('PIE','COM_NGA','COM_SC_ABS_NGA_E',2011,'COM_SC',1.200,'');
INSERT INTO "Efficiency" VALUES ('PIE','COM_DST','COM_SC_CHL_DST_E',2011,'COM_SC',0.840,'');
INSERT INTO "Efficiency" VALUES ('PIE','COM_ELC','COM_SC_CCL_ELC_CNT_E',2011,'COM_SC',3.600,'');
INSERT INTO "Efficiency" VALUES ('PIE','COM_ELC','COM_SC_AHP_ELC_E',2011,'COM_SC',3.720,'');
INSERT INTO "Efficiency" VALUES ('PIE','COM_ELC','COM_SC_ROOM_ELC_E',2011,'COM_SC',3.600,'');
INSERT INTO "Efficiency" VALUES ('PIE','COM_ELC','COM_SC_ROOF_ELC_E',2011,'COM_SC',3.720,'');
INSERT INTO "Efficiency" VALUES ('PIE','COM_NGA','COM_WH_NGA_E',2011,'COM_WH',0.650,'');
INSERT INTO "Efficiency" VALUES ('PIE','COM_DST','COM_WH_DST_E',2011,'COM_WH',0.650,'');
INSERT INTO "Efficiency" VALUES ('PIE','COM_LPG','COM_WH_LPG_E',2011,'COM_WH',0.600,'');
INSERT INTO "Efficiency" VALUES ('PIE','COM_ELC','COM_WH_ELC_E',2011,'COM_WH',0.910,'');
INSERT INTO "Efficiency" VALUES ('PIE','COM_HET','COM_WH_HET_E',2011,'COM_WH',1.000,'');
INSERT INTO "Efficiency" VALUES ('PIE','COM_ELC','COM_LG_INC_E',2011,'COM_LG',1.170,'');
INSERT INTO "Efficiency" VALUES ('PIE','COM_ELC','COM_LG_SHAL_E',2011,'COM_LG',1.596,'');
INSERT INTO "Efficiency" VALUES ('PIE','COM_ELC','COM_LG_IRCHAL_E',2011,'COM_LG',2.087,'');
INSERT INTO "Efficiency" VALUES ('PIE','COM_ELC','COM_LG_SFL_E',2011,'COM_LG',5.632,'');
INSERT INTO "Efficiency" VALUES ('PIE','COM_ELC','COM_LG_LFL_E',2011,'COM_LG',6.981,'');
INSERT INTO "Efficiency" VALUES ('PIE','COM_ELC','COM_LG_CFL_C_E',2011,'COM_LG',5.927,'');
INSERT INTO "Efficiency" VALUES ('PIE','COM_ELC','COM_LG_MER_E',2011,'COM_LG',3.200,'');
INSERT INTO "Efficiency" VALUES ('PIE','COM_ELC','COM_LG_SOD_E',2011,'COM_LG',8.000,'');
INSERT INTO "Efficiency" VALUES ('PIE','COM_NGA','COM_CK_NGA_E',2011,'COM_CK',0.50,'');
INSERT INTO "Efficiency" VALUES ('PIE','COM_LPG','COM_CK_LPG_E',2011,'COM_CK',0.50,'');
INSERT INTO "Efficiency" VALUES ('PIE','COM_ELC','COM_CK_ELC_E',2011,'COM_CK',0.70,'');
INSERT INTO "Efficiency" VALUES ('PIE','COM_ELC','COM_RF_RFR_ELC_E',2011,'COM_RF',1.00,'');
INSERT INTO "Efficiency" VALUES ('PIE','COM_ELC','COM_OE_OFF_ELC_E',2011,'COM_OE',1.00,'');

-- New technologies
INSERT INTO "Efficiency" VALUES ('PIE','COM_ELC','COM_LG_INC_N',2012,'COM_LG',1.17,'');
INSERT INTO "Efficiency" VALUES ('PIE','COM_ELC','COM_LG_SHAL_STD_N',2012,'COM_LG',1.60,'');
INSERT INTO "Efficiency" VALUES ('PIE','COM_ELC','COM_LG_HAL_IMP_N',2012,'COM_LG',2.09,'');
INSERT INTO "Efficiency" VALUES ('PIE','COM_ELC','COM_LG_SFL_N',2012,'COM_LG',5.65,'');
INSERT INTO "Efficiency" VALUES ('PIE','COM_ELC','COM_LG_LFL_N',2012,'COM_LG',7.00,'');
INSERT INTO "Efficiency" VALUES ('PIE','COM_ELC','COM_LG_CFL_N',2012,'COM_LG',5.94,'');
INSERT INTO "Efficiency" VALUES ('PIE','COM_ELC','COM_LG_MER_N',2012,'COM_LG',3.20,'');
INSERT INTO "Efficiency" VALUES ('PIE','COM_ELC','COM_LG_SOD_N',2012,'COM_LG',8.00,'');
INSERT INTO "Efficiency" VALUES ('PIE','COM_DST','COM_WH_COND_DST_N',2012,'COM_WH',0.92,'');
INSERT INTO "Efficiency" VALUES ('PIE','COM_DST','COM_WH_COND_DST_N',2020,'COM_WH',0.94,'');
INSERT INTO "Efficiency" VALUES ('PIE','COM_DST','COM_WH_COND_DST_N',2050,'COM_WH',0.98,'');
INSERT INTO "Efficiency" VALUES ('PIE','COM_NGA','COM_WH_NGA_N',2012,'COM_WH',0.75,'');
INSERT INTO "Efficiency" VALUES ('PIE','COM_NGA','COM_WH_COND_NGA_N',2012,'COM_WH',0.82,'');
INSERT INTO "Efficiency" VALUES ('PIE','COM_NGA','COM_WH_COND_NGA_N',2020,'COM_WH',0.85,'');
INSERT INTO "Efficiency" VALUES ('PIE','COM_NGA','COM_WH_COND_NGA_N',2050,'COM_WH',0.98,'');
INSERT INTO "Efficiency" VALUES ('PIE','COM_LPG','COM_WH_LPG_N',2012,'COM_WH',0.692,'');
INSERT INTO "Efficiency" VALUES ('PIE','COM_LPG','COM_WH_LPG_N',2020,'COM_WH',0.71,'');
INSERT INTO "Efficiency" VALUES ('PIE','COM_LPG','COM_WH_LPG_N',2050,'COM_WH',0.74,'');
INSERT INTO "Efficiency" VALUES ('PIE','COM_LPG','COM_WH_COND_LPG_N',2012,'COM_WH',0.82,'');
INSERT INTO "Efficiency" VALUES ('PIE','COM_LPG','COM_WH_COND_LPG_N',2020,'COM_WH',0.84,'');
INSERT INTO "Efficiency" VALUES ('PIE','COM_LPG','COM_WH_COND_LPG_N',2050,'COM_WH',0.88,'');
INSERT INTO "Efficiency" VALUES ('PIE','COM_BIO','COM_WH_WPEL_BIO_N',2012,'COM_WH',0.76,'');
INSERT INTO "Efficiency" VALUES ('PIE','COM_BIO','COM_WH_WPEL_BIO_N',2020,'COM_WH',0.78,'');
INSERT INTO "Efficiency" VALUES ('PIE','COM_BIO','COM_WH_WPEL_BIO_N',2050,'COM_WH',0.82,'');
INSERT INTO "Efficiency" VALUES ('PIE','COM_ELC','COM_WH_ELC_N',2012,'COM_WH',0.90,'');
INSERT INTO "Efficiency" VALUES ('PIE','COM_ELC','COM_WH_AHP_ELC_N',2012,'COM_WH',3.02,'');
INSERT INTO "Efficiency" VALUES ('PIE','COM_ELC','COM_WH_AHP_ELC_N',2020,'COM_WH',3.05,'');
INSERT INTO "Efficiency" VALUES ('PIE','COM_ELC','COM_WH_AHP_ELC_N',2050,'COM_WH',3.19,'');
INSERT INTO "Efficiency" VALUES ('PIE','COM_HET','COM_WH_HEX_HET_N',2012,'COM_WH',0.87,'');
INSERT INTO "Efficiency" VALUES ('PIE','COM_HET','COM_WH_HEX_HET_N',2020,'COM_WH',0.89,'');
INSERT INTO "Efficiency" VALUES ('PIE','COM_HET','COM_WH_HEX_HET_N',2050,'COM_WH',0.93,'');
INSERT INTO "Efficiency" VALUES ('PIE','COM_NGA','COM_SH_NGA_N',2012,'COM_SH',0.78,'');
INSERT INTO "Efficiency" VALUES ('PIE','COM_NGA','COM_SH_NGA_N',2020,'COM_SH',0.80,'');
INSERT INTO "Efficiency" VALUES ('PIE','COM_NGA','COM_SH_COND_NGA_N',2012,'COM_SH',0.82,'');
INSERT INTO "Efficiency" VALUES ('PIE','COM_NGA','COM_SH_COND_NGA_N',2020,'COM_SH',0.85,'');
INSERT INTO "Efficiency" VALUES ('PIE','COM_NGA','COM_SH_COND_NGA_N',2050,'COM_SH',0.98,'');
INSERT INTO "Efficiency" VALUES ('PIE','COM_LPG','COM_SH_LPG_N',2012,'COM_SH',0.81,'');
INSERT INTO "Efficiency" VALUES ('PIE','COM_LPG','COM_SH_LPG_N',2050,'COM_SH',0.81,'');
INSERT INTO "Efficiency" VALUES ('PIE','COM_LPG','COM_SH_COND_LPG_N',2012,'COM_SH',0.92,'');
INSERT INTO "Efficiency" VALUES ('PIE','COM_LPG','COM_SH_COND_LPG_N',2020,'COM_SH',0.94,'');
INSERT INTO "Efficiency" VALUES ('PIE','COM_LPG','COM_SH_COND_LPG_N',2050,'COM_SH',0.98,'');
INSERT INTO "Efficiency" VALUES ('PIE','COM_HET','COM_SH_HEX_HET_N',2012,'COM_SH',0.90,'');
INSERT INTO "Efficiency" VALUES ('PIE','COM_HET','COM_SH_HEX_HET_N',2020,'COM_SH',0.90,'');
INSERT INTO "Efficiency" VALUES ('PIE','COM_HET','COM_SH_HEX_HET_N',2050,'COM_SH',0.90,'');
INSERT INTO "Efficiency" VALUES ('PIE','COM_ELC','COM_SH_HP_AIR_N',2012,'COM_SH',3.57,'');
INSERT INTO "Efficiency" VALUES ('PIE','COM_ELC','COM_SH_HP_AIR_N',2020,'COM_SH',4.00,'');
INSERT INTO "Efficiency" VALUES ('PIE','COM_ELC','COM_SH_HP_AIR_N',2050,'COM_SH',4.70,'');
INSERT INTO "Efficiency" VALUES ('PIE','COM_ELC','COM_SH_HP_PRB_N',2012,'COM_SH',4.69,'');
INSERT INTO "Efficiency" VALUES ('PIE','COM_ELC','COM_SH_HP_PRB_N',2020,'COM_SH',5.00,'');
INSERT INTO "Efficiency" VALUES ('PIE','COM_ELC','COM_SH_HP_PRB_N',2050,'COM_SH',5.75,'');
INSERT INTO "Efficiency" VALUES ('PIE','COM_ELC','COM_SH_HP_N',2012,'COM_SH',3.76,'');
INSERT INTO "Efficiency" VALUES ('PIE','COM_ELC','COM_SH_HP_N',2012,'COM_WH',3.76,'');
INSERT INTO "Efficiency" VALUES ('PIE','COM_ELC','COM_SH_HP_N',2012,'COM_SC',3.76,'');
INSERT INTO "Efficiency" VALUES ('PIE','COM_ELC','COM_SH_HP_N',2020,'COM_SH',4.50,'');
INSERT INTO "Efficiency" VALUES ('PIE','COM_ELC','COM_SH_HP_N',2020,'COM_WH',4.50,'');
INSERT INTO "Efficiency" VALUES ('PIE','COM_ELC','COM_SH_HP_N',2020,'COM_SC',4.50,'');
INSERT INTO "Efficiency" VALUES ('PIE','COM_ELC','COM_SH_HP_N',2050,'COM_SH',4.71,'');
INSERT INTO "Efficiency" VALUES ('PIE','COM_ELC','COM_SH_HP_N',2050,'COM_WH',4.71,'');
INSERT INTO "Efficiency" VALUES ('PIE','COM_ELC','COM_SH_HP_N',2050,'COM_SC',4.71,'');
INSERT INTO "Efficiency" VALUES ('PIE','COM_BIO','COM_SH_WPEL_N',2012,'COM_SH',0.77,'');
INSERT INTO "Efficiency" VALUES ('PIE','COM_BIO','COM_SH_WPEL_N',2020,'COM_SH',0.79,'');
INSERT INTO "Efficiency" VALUES ('PIE','COM_BIO','COM_SH_WPEL_N',2050,'COM_SH',0.83,'');
INSERT INTO "Efficiency" VALUES ('PIE','COM_ELC','COM_SC_HP_STD_N',2012,'COM_SC',2.90,'');
INSERT INTO "Efficiency" VALUES ('PIE','COM_ELC','COM_SC_HP_IMP_N',2012,'COM_SC',5.28,'');
INSERT INTO "Efficiency" VALUES ('PIE','COM_ELC','COM_SC_ROOF_STD_N',2012,'COM_SC',3.10,'');
INSERT INTO "Efficiency" VALUES ('PIE','COM_ELC','COM_SC_ROOF_ADV_N',2012,'COM_SC',3.40,'');
INSERT INTO "Efficiency" VALUES ('PIE','COM_ELC','COM_SC_REC_N',2012,'COM_SC',3.93,'');
INSERT INTO "Efficiency" VALUES ('PIE','COM_ELC','COM_SC_REC_IMP_N',2012,'COM_SC',4.47,'');
INSERT INTO "Efficiency" VALUES ('PIE','COM_ELC','COM_SC_CNF_N',2012,'COM_SC',6.40,'');
INSERT INTO "Efficiency" VALUES ('PIE','COM_ELC','COM_SC_CNF_IMP_N',2015,'COM_SC',7.30,'');
INSERT INTO "Efficiency" VALUES ('PIE','COM_ELC','COM_SC_CNT_N',2012,'COM_SC',3.00,'');
INSERT INTO "Efficiency" VALUES ('PIE','COM_ELC','COM_SC_ROOM_N',2012,'COM_SC',3.43,'');
INSERT INTO "Efficiency" VALUES ('PIE','COM_NGA','COM_SC_ABS_NGA_N',2012,'COM_SC',1.00,'');
INSERT INTO "Efficiency" VALUES ('PIE','COM_NGA','COM_SC_NGA_STD_N',2012,'COM_SC',2.00,'');
INSERT INTO "Efficiency" VALUES ('PIE','COM_NGA','COM_SC_NGA_IMP_N',2012,'COM_SC',2.20,'');
INSERT INTO "Efficiency" VALUES ('PIE','COM_NGA','COM_CK_NGA_N',2012,'COM_CK',0.50,'');
INSERT INTO "Efficiency" VALUES ('PIE','COM_LPG','COM_CK_LPG_N',2012,'COM_CK',0.50,'');
INSERT INTO "Efficiency" VALUES ('PIE','COM_ELC','COM_CK_ELC_N',2012,'COM_CK',0.70,'');
INSERT INTO "Efficiency" VALUES ('PIE','COM_BIO','COM_CK_BIO_N',2012,'COM_CK',0.15,'');
INSERT INTO "Efficiency" VALUES ('PIE','COM_ELC','COM_OE_OFF_ELC_STD_N',2012,'COM_OE',1.00,'');
INSERT INTO "Efficiency" VALUES ('PIE','COM_ELC','COM_OE_OFF_ELC_IMP_N',2012,'COM_OE',1.05,'');
INSERT INTO "Efficiency" VALUES ('PIE','COM_ELC','COM_OE_OFF_ADV_N',2012,'COM_OE',1.10,'');
INSERT INTO "Efficiency" VALUES ('PIE','COM_ELC','COM_RF_STD_N',2012,'COM_RF',1.05,'');
INSERT INTO "Efficiency" VALUES ('PIE','COM_ELC','COM_RF_IMP_N',2012,'COM_RF',1.20,'');
INSERT INTO "Efficiency" VALUES ('PIE','COM_ELC','COM_RF_N',2012,'COM_RF',1.40,'');

INSERT INTO "Efficiency" VALUES ('PIE','ELC_CEN','COM_H2G_C1',2030,'COM_H2',0.9381,'');
INSERT INTO "Efficiency" VALUES ('PIE','H2_CT','COM_H2G_C1',2030,'COM_H2',0.9381,'');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_CEN','COM_H2G_C2',2030,'COM_H2',0.9381,'');
INSERT INTO "Efficiency" VALUES ('PIE','H2_CU','COM_H2G_C2',2030,'COM_H2',0.9381,'');

-- Micro-CHP
INSERT INTO "Efficiency" VALUES ('PIE','ELC_NGA','COM_CHP_NGA_CI_N',2012,'ELC_DST',0.368,'');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_NGA','COM_CHP_NGA_CI_N',2012,'COM_HET',0.450,'');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_NGA','COM_CHP_NGA_CI_N',2015,'ELC_DST',0.378,'');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_NGA','COM_CHP_NGA_CI_N',2015,'COM_HET',0.450,'');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_NGA','COM_CHP_NGA_CI_N',2023,'ELC_DST',0.410,'');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_NGA','COM_CHP_NGA_CI_N',2023,'COM_HET',0.450,'');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_NGA','COM_CHP_NGA_CI_N',2030,'ELC_DST',0.450,'');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_NGA','COM_CHP_NGA_CI_N',2030,'COM_HET',0.432,'');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_NGA','COM_CHP_NGA_MICRO_N',2012,'ELC_DST',0.301,'');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_NGA','COM_CHP_NGA_MICRO_N',2012,'COM_HET',0.513,'');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_NGA','COM_CHP_NGA_MICRO_N',2015,'ELC_DST',0.314,'');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_NGA','COM_CHP_NGA_MICRO_N',2015,'COM_HET',0.509,'');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_NGA','COM_CHP_NGA_MICRO_N',2023,'ELC_DST',0.349,'');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_NGA','COM_CHP_NGA_MICRO_N',2023,'COM_HET',0.497,'');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_NGA','COM_CHP_NGA_MICRO_N',2030,'ELC_DST',0.440,'');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_NGA','COM_CHP_NGA_MICRO_N',2030,'COM_HET',0.480,'');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_NGA','COM_CHP_NGA_CC_N',2012,'ELC_DST',0.400,'');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_NGA','COM_CHP_NGA_CC_N',2012,'COM_HET',0.400,'');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_NGA','COM_CHP_NGA_CC_N',2014,'ELC_DST',0.400,'');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_NGA','COM_CHP_NGA_CC_N',2014,'COM_HET',0.400,'');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_NGA','COM_CHP_NGA_CC_N',2023,'ELC_DST',0.400,'');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_NGA','COM_CHP_NGA_CC_N',2023,'COM_HET',0.400,'');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_NGA','COM_CHP_NGA_CC_N',2030,'ELC_DST',0.400,'');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_NGA','COM_CHP_NGA_CC_N',2030,'COM_HET',0.400,'');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_NGA','COM_CHP_NGA_SOFC_N',2030,'COM_ELC',0.90,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_NGA','COM_CHP_NGA_SOFC_N',2030,'COM_HET',0.90,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','COM_H2','COM_CHP_HH2_PEMFC_N',2030,'COM_ELC',0.96,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','COM_H2','COM_CHP_HH2_PEMFC_N',2030,'COM_HET',0.96,'PJ/PJ');
-- Agriculture sector
-- Fuel technologies
INSERT INTO "Efficiency" VALUES ('PIE','GAS_NGA','AGR_FT_NGA_E',2011,'AGR_NGA',1.0,'');
INSERT INTO "Efficiency" VALUES ('PIE','GAS_NGA','AGR_FT_NGA_E',2013,'AGR_NGA',9.66E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','GAS_NGA','AGR_FT_NGA_E',2021,'AGR_NGA',1.0,'');
INSERT INTO "Efficiency" VALUES ('PIE','OIL_DST','AGR_FT_DST_E',2011,'AGR_DST',0.928,'');
INSERT INTO "Efficiency" VALUES ('PIE','OIL_GSL','AGR_FT_GSL_E',2011,'AGR_GSL',0.928,'');
INSERT INTO "Efficiency" VALUES ('PIE','OIL_LPG','AGR_FT_LPG_E',2011,'AGR_LPG',0.928,'');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_CEN','AGR_FT_ELC_E',2011,'AGR_ELC',0.95,'');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_DST','AGR_FT_ELC_E',2011,'AGR_ELC',0.95,'');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_CEN','AGR_FT_ELC_E',2020,'AGR_ELC',0.95,'');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_DST','AGR_FT_ELC_E',2020,'AGR_ELC',0.95,'');
-- Base year technologies
INSERT INTO "Efficiency" VALUES ('PIE','AGR_NGA','AGR_TECH',2011,'AGR_DEM',1.00,'');
INSERT INTO "Efficiency" VALUES ('PIE','AGR_DST','AGR_TECH',2011,'AGR_DEM',1.00,'');
INSERT INTO "Efficiency" VALUES ('PIE','AGR_GSL','AGR_TECH',2011,'AGR_DEM',1.00,'');
INSERT INTO "Efficiency" VALUES ('PIE','AGR_LPG','AGR_TECH',2011,'AGR_DEM',1.90,'');
INSERT INTO "Efficiency" VALUES ('PIE','AGR_ELC','AGR_TECH',2011,'AGR_DEM',1.00,'');
INSERT INTO "Efficiency" VALUES ('PIE','AGR_NGA','AGR_TECH',2012,'AGR_DEM',1.00,'');
INSERT INTO "Efficiency" VALUES ('PIE','AGR_NGA','AGR_TECH',2013,'AGR_DEM',1.08,'');
INSERT INTO "Efficiency" VALUES ('PIE','AGR_NGA','AGR_TECH',2014,'AGR_DEM',1.80,'');
INSERT INTO "Efficiency" VALUES ('PIE','AGR_NGA','AGR_TECH',2015,'AGR_DEM',1.30,'');
INSERT INTO "Efficiency" VALUES ('PIE','AGR_DST','AGR_TECH',2012,'AGR_DEM',1.10,'');
INSERT INTO "Efficiency" VALUES ('PIE','AGR_GSL','AGR_TECH',2012,'AGR_DEM',1.00,'');
INSERT INTO "Efficiency" VALUES ('PIE','AGR_LPG','AGR_TECH',2012,'AGR_DEM',1.08,'');
INSERT INTO "Efficiency" VALUES ('PIE','AGR_ELC','AGR_TECH',2012,'AGR_DEM',1.00,'');
INSERT INTO "Efficiency" VALUES ('PIE','AGR_NGA','AGR_TECH',2020,'AGR_DEM',1.15,'');
INSERT INTO "Efficiency" VALUES ('PIE','AGR_NGA','AGR_TECH',2021,'AGR_DEM',0.80,'');
INSERT INTO "Efficiency" VALUES ('PIE','AGR_DST','AGR_TECH',2020,'AGR_DEM',1.15,'');
INSERT INTO "Efficiency" VALUES ('PIE','AGR_GSL','AGR_TECH',2020,'AGR_DEM',1.15,'');
INSERT INTO "Efficiency" VALUES ('PIE','AGR_ELC','AGR_TECH',2020,'AGR_DEM',1.15,'');
INSERT INTO "Efficiency" VALUES ('PIE','AGR_NGA','AGR_TECH',2050,'AGR_DEM',1.20,'');
INSERT INTO "Efficiency" VALUES ('PIE','AGR_DST','AGR_TECH',2050,'AGR_DEM',1.25,'');
INSERT INTO "Efficiency" VALUES ('PIE','AGR_GSL','AGR_TECH',2050,'AGR_DEM',1.25,'');
INSERT INTO "Efficiency" VALUES ('PIE','AGR_LPG','AGR_TECH',2050,'AGR_DEM',1.25,'');
INSERT INTO "Efficiency" VALUES ('PIE','AGR_ELC','AGR_TECH',2050,'AGR_DEM',1.25,'');
-- Industrial sector
-- Fuel technologies
INSERT INTO "Efficiency" VALUES ('PIE','GAS_BFG','IND_FT_BFG_E',2011,'IND_BFG',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','GAS_BFG','IND_FT_BFG_N',2012,'IND_BFG',1.0,'PJ/PJ');

INSERT INTO "Efficiency" VALUES ('PIE','BIO_SLB','IND_FT_BIO_E',2011,'IND_BIO',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','BIO_GAS','IND_FT_BIO_E',2011,'IND_BIO',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','BIO_BIN','IND_FT_BIO_E',2011,'IND_BIO',1.0,'PJ/PJ');

INSERT INTO "Efficiency" VALUES ('PIE','BIO_SLB','IND_FT_BIO_N',2012,'IND_BIO',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','BIO_GAS','IND_FT_BIO_N',2012,'IND_BIO',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','BIO_BIN','IND_FT_BIO_N',2012,'IND_BIO',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','COA_HCO','IND_FT_COA_E',2011,'IND_COA',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','COA_HCO','IND_FT_COA_N',2012,'IND_COA',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','UPS_COG','IND_FT_COG_EN',2012,'IND_COG',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','COA_OVC','IND_FT_COK_E',2011,'IND_COK',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','COA_OVC','IND_FT_COK_N',2012,'IND_COK',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_DST','IND_FT_ELC_EN',2011,'IND_ELC',0.93,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_CEN','IND_FT_ELC_EN',2011,'IND_ELC',0.93,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','OIL_RFG','IND_FT_ETH_E',2011,'IND_ETH',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','GAS_ETH','IND_FT_ETH_E',2011,'IND_ETH',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','OIL_RFG','IND_FT_ETH_N',2012,'IND_ETH',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','GAS_ETH','IND_FT_ETH_N',2012,'IND_ETH',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','HET','IND_FT_HET_E',2011,'IND_HET',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','HET','IND_FT_HET_N',2012,'IND_HET',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','OIL_HFO','IND_FT_HFO_E',2011,'IND_HFO',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','OIL_NSP','IND_FT_HFO_E',2011,'IND_HFO',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','OIL_HFO','IND_FT_HFO_N',2012,'IND_HFO',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','OIL_NSP','IND_FT_HFO_N',2012,'IND_HFO',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','OIL_DST','IND_FT_OIL_E',2011,'IND_OIL',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','OIL_KER','IND_FT_OIL_E',2011,'IND_OIL',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','OIL_GSL','IND_FT_OIL_E',2011,'IND_OIL',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','OIL_DST','IND_FT_OIL_N',2012,'IND_OIL',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','OIL_KER','IND_FT_OIL_N',2012,'IND_OIL',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','OIL_GSL','IND_FT_OIL_N',2012,'IND_OIL',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','OIL_LPG','IND_FT_LPG_E',2011,'IND_LPG',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','OIL_LPG','IND_FT_LPG_N',2012,'IND_LPG',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','OIL_NAP','IND_FT_NAP_E',2011,'IND_NAP',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','OIL_NAP','IND_FT_NAP_N',2012,'IND_NAP',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','GAS_NGA','IND_FT_NGA_E',2011,'IND_NGA',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','GAS_NGA','IND_FT_NGA_N',2012,'IND_NGA',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','OIL_PTC','IND_FT_PTC_E',2011,'IND_PTC',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','OIL_PTC','IND_FT_PTC_N',2012,'IND_PTC',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','H2_DT','IND_H2G_DE',2025,'IND_H2E',1.00,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_MTH','IND_FT_MET_SYN_N',2012,'MTH_SYN',20.0,'PJ/Mt');
---- Base year technologies
---- Machine drive and steam
INSERT INTO "Efficiency" VALUES ('PIE','IND_MD','IND_MD_TECH',2011,'IND_IS_MD',1.00,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','IND_MD','IND_MD_TECH',2011,'IND_NF_MD',1.00,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','IND_MD','IND_MD_TECH',2011,'IND_CH_MD',1.00,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','IND_MD','IND_MD_TECH',2011,'IND_NM_MD',1.00,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','IND_MD','IND_MD_TECH',2011,'IND_PP_MD',1.00,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','IND_MD','IND_MD_TECH',2011,'IND_OTH_MD',1.00,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','IND_ELC','IND_MD_ELC_E',2011,'IND_MD',0.86,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','IND_SB','IND_STM_TECH',2011,'IND_IS_SB',1.00,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','IND_SB','IND_STM_TECH',2011,'IND_NF_SB',1.00,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','IND_SB','IND_STM_TECH',2011,'IND_CH_SB',1.00,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','IND_SB','IND_STM_TECH',2011,'IND_NM_SB',1.00,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','IND_SB','IND_STM_TECH',2011,'IND_PP_SB',1.00,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','IND_SB','IND_STM_TECH',2011,'IND_OTH_SB',1.00,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','IND_NGA','IND_STM_NGA_E',2011,'IND_SB',0.86,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','IND_LPG','IND_STM_LPG_E',2011,'IND_SB',0.86,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','IND_COA','IND_STM_COA_E',2011,'IND_SB',0.86,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','IND_HFO','IND_STM_HFO_E',2011,'IND_SB',0.86,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','IND_BIO','IND_STM_BIO_E',2011,'IND_SB',0.90,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','IND_OIL','IND_STM_DST_E',2011,'IND_SB',1.00,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','IND_HET','IND_STM_HET_E',2011,'IND_SB',1.00,'PJ/PJ');
---- Chemicals
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_OLF','IND_CH_TECH',2011,'IND_CH',1.0,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_BTX','IND_CH_TECH',2011,'IND_CH',1.0,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_AMM','IND_CH_TECH',2011,'IND_CH',1.0,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_MTH','IND_CH_TECH',2011,'IND_CH',1.0,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_CHL','IND_CH_TECH',2011,'IND_CH',1.0,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_OTH_PROD','IND_CH_TECH',2011,'IND_CH',1.0,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_EC','IND_CH_OLF_E',2011,'IND_CH_OLF',1.33E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_NGA','IND_CH_OLF_E',2011,'IND_CH_OLF',1.33E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_LPG','IND_CH_OLF_E',2011,'IND_CH_OLF',1.33E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_HFO','IND_CH_OLF_E',2011,'IND_CH_OLF',1.33E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_OIL','IND_CH_OLF_E',2011,'IND_CH_OLF',1.33E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_ETH','IND_CH_OLF_E',2011,'IND_CH_OLF',1.33E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_FS','IND_CH_OLF_E',2011,'IND_CH_OLF',1.33E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_SB','IND_CH_OLF_E',2011,'IND_CH_OLF',1.33E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_MD','IND_CH_OLF_E',2011,'IND_CH_OLF',1.33E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_EC','IND_CH_BTX_E',2011,'IND_CH_BTX',1.37E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_NGA','IND_CH_BTX_E',2011,'IND_CH_BTX',1.37E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_LPG','IND_CH_BTX_E',2011,'IND_CH_BTX',1.37E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_HFO','IND_CH_BTX_E',2011,'IND_CH_BTX',1.37E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_OIL','IND_CH_BTX_E',2011,'IND_CH_BTX',1.37E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_ETH','IND_CH_BTX_E',2011,'IND_CH_BTX',1.37E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_FS','IND_CH_BTX_E',2011,'IND_CH_BTX',1.37E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_SB','IND_CH_BTX_E',2011,'IND_CH_BTX',1.37E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_MD','IND_CH_BTX_E',2011,'IND_CH_BTX',1.37E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_EC','IND_CH_AMM_E',2011,'IND_CH_AMM',1.52E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_NGA','IND_CH_AMM_E',2011,'IND_CH_AMM',1.52E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_FS','IND_CH_AMM_E',2011,'IND_CH_AMM',1.52E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_SB','IND_CH_AMM_E',2011,'IND_CH_AMM',1.52E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_MD','IND_CH_AMM_E',2011,'IND_CH_AMM',1.52E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_EC','IND_CH_MTH_E',2011,'IND_CH_MTH',2.05E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_NGA','IND_CH_MTH_E',2011,'IND_CH_MTH',2.05E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_FS','IND_CH_MTH_E',2011,'IND_CH_MTH',2.05E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_SB','IND_CH_MTH_E',2011,'IND_CH_MTH',2.05E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_MD','IND_CH_MTH_E',2011,'IND_CH_MTH',2.05E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_EC','IND_CH_CHL_E',2011,'IND_CH_CHL',7.78E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_SB','IND_CH_CHL_E',2011,'IND_CH_CHL',7.78E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_MD','IND_CH_CHL_E',2011,'IND_CH_CHL',7.78E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_EC','IND_CH_OTH_E',2011,'IND_CH_OTH_PROD',1.00E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_FS','IND_CH_OTH_E',2011,'IND_CH_OTH_PROD',1.00E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_SB','IND_CH_OTH_E',2011,'IND_CH_OTH_PROD',1.00E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_MD','IND_CH_OTH_E',2011,'IND_CH_OTH_PROD',1.00E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_OTH','IND_CH_OTH_E',2011,'IND_CH_OTH_PROD',1.00E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_EC','IND_CH_OTH_E',2050,'IND_CH_OTH_PROD',1.11E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_FS','IND_CH_OTH_E',2050,'IND_CH_OTH_PROD',1.11E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_SB','IND_CH_OTH_E',2050,'IND_CH_OTH_PROD',1.11E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_MD','IND_CH_OTH_E',2050,'IND_CH_OTH_PROD',1.11E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_OTH','IND_CH_OTH_E',2050,'IND_CH_OTH_PROD',1.11E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','GAS_NGA','IND_CH_FS_NGA_E',2011,'IND_CH_FS',1.0,'');
INSERT INTO "Efficiency" VALUES ('PIE','OIL_LPG','IND_CH_FS_LPG_E',2011,'IND_CH_FS',1.0,'');
INSERT INTO "Efficiency" VALUES ('PIE','OIL_KER','IND_CH_FS_KER_E',2011,'IND_CH_FS',1.0,'');
INSERT INTO "Efficiency" VALUES ('PIE','OIL_HFO','IND_CH_FS_HFO_E',2011,'IND_CH_FS',1.0,'');
INSERT INTO "Efficiency" VALUES ('PIE','OIL_DST','IND_CH_FS_DST_E',2011,'IND_CH_FS',1.0,'');
INSERT INTO "Efficiency" VALUES ('PIE','OIL_NSP','IND_CH_FS_NSP_E',2011,'IND_CH_FS',1.0,'');
INSERT INTO "Efficiency" VALUES ('PIE','OIL_GSL','IND_CH_FS_GSL_E',2011,'IND_CH_FS',1.0,'');
INSERT INTO "Efficiency" VALUES ('PIE','OIL_NAP','IND_CH_FS_NAP_E',2011,'IND_CH_FS',1.0,'');
INSERT INTO "Efficiency" VALUES ('PIE','OIL_RFG','IND_CH_FS_RFG_E',2011,'IND_CH_FS',1.0,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_ELC','IND_CH_EC_E',2011,'IND_CH_EC',1.0,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_COK','IND_CH_OTH_COK_E',2011,'IND_CH_OTH',1.0,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_OIL','IND_CH_OTH_DST_E',2011,'IND_CH_OTH',1.0,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_ELC','IND_CH_OTH_ELC_E',2011,'IND_CH_OTH',1.0,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_ETH','IND_CH_OTH_ETH_E',2011,'IND_CH_OTH',1.0,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_HFO','IND_CH_OTH_HFO_E',2011,'IND_CH_OTH',1.0,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_NGA','IND_CH_OTH_NGA_E',2011,'IND_CH_OTH',1.0,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_PTC','IND_CH_OTH_PTC_E',2011,'IND_CH_OTH',1.0,'');
---- Iron and steel
INSERT INTO "Efficiency" VALUES ('PIE','IND_IS_BOF','IND_IS_TECH',2011,'IND_IS',1.0,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_IS_EAF','IND_IS_TECH',2011,'IND_IS',1.0,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_IS_SB','IND_IS_BOF_E',2011,'IND_IS_BOF',7.74E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_IS_MD','IND_IS_BOF_E',2011,'IND_IS_BOF',7.74E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_IS_OTH','IND_IS_BOF_E',2011,'IND_IS_BOF',7.74E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_IS_FS','IND_IS_BOF_E',2011,'IND_IS_BOF',7.74E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_NGA','IND_IS_BOF_E',2011,'IND_IS_BOF',7.74E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_COA','IND_IS_BOF_E',2011,'IND_IS_BOF',7.74E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_BFG','IND_IS_BOF_E',2011,'IND_IS_BOF',7.74E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_HFO','IND_IS_BOF_E',2011,'IND_IS_BOF',7.74E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_LPG','IND_IS_BOF_E',2011,'IND_IS_BOF',7.74E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_IS_SB','IND_IS_EAF_E',2011,'IND_IS_EAF',2.30E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_IS_MD','IND_IS_EAF_E',2011,'IND_IS_EAF',2.30E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_IS_OTH','IND_IS_EAF_E',2011,'IND_IS_EAF',2.30E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_IS_FS','IND_IS_EAF_E',2011,'IND_IS_EAF',2.30E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_NGA','IND_IS_EAF_E',2011,'IND_IS_EAF',2.30E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_COA','IND_IS_EAF_E',2011,'IND_IS_EAF',2.30E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_ELC','IND_IS_EAF_E',2011,'IND_IS_EAF',2.30E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_OIL','IND_IS_EAF_E',2011,'IND_IS_EAF',2.30E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_ELC','IND_IS_OTH_ELC_E',2011,'IND_IS_OTH',1.0,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_PTC','IND_IS_FS_PTC_E',2011,'IND_IS_OTH',1.0,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_COK','IND_IS_FS_COK_E',2011,'IND_IS_OTH',1.0,'');
---- Non-ferrous metals
INSERT INTO "Efficiency" VALUES ('PIE','IND_NF_ALU','IND_NF_TECH',2011,'IND_NF',1.0,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_NF_COP','IND_NF_TECH',2011,'IND_NF',1.0,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_NF_ZNC','IND_NF_TECH',2011,'IND_NF',1.0,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_NF_OTH_PROD','IND_NF_TECH',2011,'IND_NF',1.0,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_HFO','IND_NF_ALU_E',2011,'IND_NF_ALU',2.12E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_NGA','IND_NF_ALU_E',2011,'IND_NF_ALU',2.12E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_NF_EC','IND_NF_ALU_E',2011,'IND_NF_ALU',2.12E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_NF_EC','IND_NF_COP_E',2011,'IND_NF_COP',3.97E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_NGA','IND_NF_COP_E',2011,'IND_NF_COP',3.97E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_COA','IND_NF_COP_E',2011,'IND_NF_COP',3.97E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_COK','IND_NF_COP_E',2011,'IND_NF_COP',3.97E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_HFO','IND_NF_COP_E',2011,'IND_NF_COP',3.97E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_NF_SB','IND_NF_COP_E',2011,'IND_NF_COP',3.97E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_NF_EC','IND_NF_ZNC_E',2011,'IND_NF_ZNC',5.68E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_NGA','IND_NF_ZNC_E',2011,'IND_NF_ZNC',5.68E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_HFO','IND_NF_ZNC_E',2011,'IND_NF_ZNC',5.68E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_NF_SB','IND_NF_ZNC_E',2011,'IND_NF_ZNC',5.68E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_NF_MD','IND_NF_ZNC_E',2011,'IND_NF_ZNC',5.68E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_NF_MD','IND_NF_OTH_E',2011,'IND_NF_OTH_PROD',1.00E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_NF_OTH','IND_NF_OTH_E',2011,'IND_NF_OTH_PROD',1.00E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_ELC','IND_NF_EC_E',2011,'IND_NF_EC',1.0,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_ELC','IND_NF_OTH_ELC_E',2011,'IND_NF_OTH',1.0,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_OIL','IND_NF_OTH_DST_E',2011,'IND_NF_OTH',1.0,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_NGA','IND_NF_OTH_NGA_E',2011,'IND_NF_OTH',1.0,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_LPG','IND_NF_OTH_LPG_E',2011,'IND_NF_OTH',1.0,'');
-- Non-metallic minerals
INSERT INTO "Efficiency" VALUES ('PIE','IND_NM_CMT','IND_NM_TECH',2011,'IND_NM',1.0,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_NM_LIM','IND_NM_TECH',2011,'IND_NM',1.0,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_NM_GLS','IND_NM_TECH',2011,'IND_NM',1.0,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_NM_CRM','IND_NM_TECH',2011,'IND_NM',1.0,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_NGA','IND_NM_CLK_DRY_E',2011,'IND_NM_CMT',3.89E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_COA','IND_NM_CLK_DRY_E',2011,'IND_NM_CMT',3.89E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_HFO','IND_NM_CLK_DRY_E',2011,'IND_NM_CMT',3.89E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_PTC','IND_NM_CLK_DRY_E',2011,'IND_NM_CMT',3.89E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_BIO','IND_NM_CLK_DRY_E',2011,'IND_NM_CMT',3.89E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_ELC','IND_NM_CLK_DRY_E',2011,'IND_NM_CMT',3.89E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_LPG','IND_NM_CLK_DRY_E',2011,'IND_NM_CMT',3.89E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_NM_SB','IND_NM_CLK_DRY_E',2011,'IND_NM_CMT',3.89E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_NM_MD','IND_NM_CLK_DRY_E',2011,'IND_NM_CMT',3.89E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_NM_OTH','IND_NM_CLK_DRY_E',2011,'IND_NM_CMT',3.89E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_NGA','IND_NM_CLK_WET_E',2011,'IND_NM_CMT',2.16E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_COA','IND_NM_CLK_WET_E',2011,'IND_NM_CMT',2.16E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_HFO','IND_NM_CLK_WET_E',2011,'IND_NM_CMT',2.16E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_PTC','IND_NM_CLK_WET_E',2011,'IND_NM_CMT',2.16E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_ELC','IND_NM_CLK_WET_E',2011,'IND_NM_CMT',2.16E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_OIL','IND_NM_CLK_WET_E',2011,'IND_NM_CMT',2.16E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_LPG','IND_NM_CLK_WET_E',2011,'IND_NM_CMT',2.16E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_NM_SB','IND_NM_CLK_WET_E',2011,'IND_NM_CMT',2.16E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_NM_MD','IND_NM_CLK_WET_E',2011,'IND_NM_CMT',2.16E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_NM_OTH','IND_NM_CLK_WET_E',2011,'IND_NM_CMT',2.16E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_NGA','IND_NM_LIM_E',2011,'IND_NM_LIM',1.45E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_COA','IND_NM_LIM_E',2011,'IND_NM_LIM',1.45E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_HFO','IND_NM_LIM_E',2011,'IND_NM_LIM',1.45E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_ELC','IND_NM_LIM_E',2011,'IND_NM_LIM',1.45E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_LPG','IND_NM_LIM_E',2011,'IND_NM_LIM',1.45E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_NM_SB','IND_NM_LIM_E',2011,'IND_NM_LIM',1.45E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_NM_MD','IND_NM_LIM_E',2011,'IND_NM_LIM',1.45E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_NM_OTH','IND_NM_LIM_E',2011,'IND_NM_LIM',1.45E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_NGA','IND_NM_GLS_E',2011,'IND_NM_GLS',8.09E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_HFO','IND_NM_GLS_E',2011,'IND_NM_GLS',8.09E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_ELC','IND_NM_GLS_E',2011,'IND_NM_GLS',8.09E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_NM_SB','IND_NM_GLS_E',2011,'IND_NM_GLS',8.09E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_NM_MD','IND_NM_GLS_E',2011,'IND_NM_GLS',8.09E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_NM_OTH','IND_NM_GLS_E',2011,'IND_NM_GLS',8.09E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_NGA','IND_NM_CRM_E',2011,'IND_NM_CRM',4.71E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_COA','IND_NM_CRM_E',2011,'IND_NM_CRM',4.71E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_HFO','IND_NM_CRM_E',2011,'IND_NM_CRM',4.71E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_OIL','IND_NM_CRM_E',2011,'IND_NM_CRM',4.71E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_ELC','IND_NM_CRM_E',2011,'IND_NM_CRM',4.71E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_NM_SB','IND_NM_CRM_E',2011,'IND_NM_CRM',4.71E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_NM_MD','IND_NM_CRM_E',2011,'IND_NM_CRM',4.71E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_NM_OTH','IND_NM_CRM_E',2011,'IND_NM_CRM',4.71E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_OIL','IND_NM_OTH_DST_E',2011,'IND_NM_OTH',1.0,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_NGA','IND_NM_OTH_NGA_E',2011,'IND_NM_OTH',1.0,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_COK','IND_NM_OTH_COK_E',2011,'IND_NM_OTH',1.0,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_ELC','IND_NM_OTH_ELC_E',2011,'IND_NM_OTH',1.0,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_LPG','IND_NM_OTH_LPG_E',2011,'IND_NM_OTH',1.0,'');
-- Pulp and paper
INSERT INTO "Efficiency" VALUES ('PIE','IND_PP_PAP','IND_PP_TECH',2011,'IND_PP',1.0,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_PP_PUC','IND_PP_PUL_TECH',2012,'IND_PP_PUL',1.00,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_PP_PUM','IND_PP_PUL_TECH',2012,'IND_PP_PUL',1.00,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_PP_PUR','IND_PP_PUL_TECH',2012,'IND_PP_PUL',1.00,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_PP_SB','IND_PP_PUL_CHEM_E',2011,'IND_PP_PUC',7.24E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_PP_PH','IND_PP_PUL_CHEM_E',2011,'IND_PP_PUC',7.24E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_PP_MD','IND_PP_PUL_CHEM_E',2011,'IND_PP_PUC',7.24E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_PP_MD','IND_PP_PUL_MEC_E',2011,'IND_PP_SB',5.40E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_PP_MD','IND_PP_PUL_MEC_E',2011,'IND_PP_PUM',5.40E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_PP_SB','IND_PP_PUL_REC_E',2011,'IND_PP_PUR',6.82E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_PP_DH','IND_PP_PUL_REC_E',2011,'IND_PP_PUR',6.82E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_PP_MD','IND_PP_PUL_REC_E',2011,'IND_PP_PUR',6.82E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_PP_OTH','IND_PP_PUL_REC_E',2011,'IND_PP_PUR',6.82E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_PP_SB','IND_PP_PAP_E',2011,'IND_PP_PAP',1.03E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_PP_DH','IND_PP_PAP_E',2011,'IND_PP_PAP',1.03E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_PP_MD','IND_PP_PAP_E',2011,'IND_PP_PAP',1.03E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_PP_OTH','IND_PP_PAP_E',2011,'IND_PP_PAP',1.03E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_PP_PUL','IND_PP_PAP_E',2011,'IND_PP_PAP',1.03E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_HFO','IND_PP_PH_HFO_E',2011,'IND_PP_PH',1.0,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_HFO','IND_PP_PH_HFO_E',2011,'IND_PP_DH',1.0,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_OIL','IND_PP_PH_DST_E',2011,'IND_PP_DH',1.0,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_NGA','IND_PP_PH_NGA_E',2011,'IND_PP_DH',1.0,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_ELC','IND_PP_PH_ELC_E',2011,'IND_PP_DH',1.0,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_OIL','IND_PP_OTH_DST_E',2011,'IND_PP_OTH',1.0,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_ELC','IND_PP_OTH_ELC_E',2011,'IND_PP_OTH',1.0,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_LPG','IND_PP_OTH_LPG_E',2011,'IND_PP_OTH',1.0,'');
-- Other industries
INSERT INTO "Efficiency" VALUES ('PIE','IND_OTH_SB','IND_OTH_TECH',2011,'IND_OTH',1.0,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_OTH_PH','IND_OTH_TECH',2011,'IND_OTH',1.0,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_OTH_MD','IND_OTH_TECH',2011,'IND_OTH',1.0,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_OTH_OTH','IND_OTH_TECH',2011,'IND_OTH',1.0,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_OTH_SB','IND_OTH_TECH',2015,'IND_OTH',1.05,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_OTH_PH','IND_OTH_TECH',2015,'IND_OTH',1.05,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_OTH_MD','IND_OTH_TECH',2015,'IND_OTH',1.05,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_OTH_OTH','IND_OTH_TECH',2015,'IND_OTH',1.05,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_OTH_SB','IND_OTH_TECH',2030,'IND_OTH',1.11,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_OTH_PH','IND_OTH_TECH',2030,'IND_OTH',1.11,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_OTH_MD','IND_OTH_TECH',2030,'IND_OTH',1.11,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_OTH_OTH','IND_OTH_TECH',2030,'IND_OTH',1.11,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_OTH_SB','IND_OTH_TECH',2050,'IND_OTH',1.18,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_OTH_PH','IND_OTH_TECH',2050,'IND_OTH',1.18,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_OTH_MD','IND_OTH_TECH',2050,'IND_OTH',1.18,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_OTH_OTH','IND_OTH_TECH',2050,'IND_OTH',1.18,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_OIL','IND_OTH_PH_DST_E',2011,'IND_OTH_PH',1.0,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_HFO','IND_OTH_PH_HFO_E',2011,'IND_OTH_PH',1.0,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_LPG','IND_OTH_PH_LPG_E',2011,'IND_OTH_PH',1.0,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_NGA','IND_OTH_PH_NGA_E',2011,'IND_OTH_PH',1.0,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_ELC','IND_OTH_OTH_ELC_E',2011,'IND_OTH_OTH',1.0,'');
-- Other non-specified consumption
INSERT INTO "Efficiency" VALUES ('PIE','IND_ELC','IND_ONS_TECH',2011,'IND_OTH_NSP',1.15,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_NGA','IND_ONS_TECH',2011,'IND_OTH_NSP',1.15,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_LPG','IND_ONS_TECH',2011,'IND_OTH_NSP',1.15,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_HFO','IND_ONS_TECH',2011,'IND_OTH_NSP',1.15,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_OIL','IND_ONS_TECH',2011,'IND_OTH_NSP',1.15,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_BIO','IND_ONS_TECH',2011,'IND_OTH_NSP',1.15,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_HET','IND_ONS_TECH',2011,'IND_OTH_NSP',1.15,'');

INSERT INTO "Efficiency" VALUES ('PIE','IND_ELC','IND_ONS_TECH',2020,'IND_OTH_NSP',1.30,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_NGA','IND_ONS_TECH',2020,'IND_OTH_NSP',1.30,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_LPG','IND_ONS_TECH',2020,'IND_OTH_NSP',1.30,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_HFO','IND_ONS_TECH',2020,'IND_OTH_NSP',1.30,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_OIL','IND_ONS_TECH',2020,'IND_OTH_NSP',1.30,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_BIO','IND_ONS_TECH',2020,'IND_OTH_NSP',1.30,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_HET','IND_ONS_TECH',2020,'IND_OTH_NSP',1.30,'');

INSERT INTO "Efficiency" VALUES ('PIE','IND_ELC','IND_ONS_TECH',2050,'IND_OTH_NSP',1.50,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_NGA','IND_ONS_TECH',2050,'IND_OTH_NSP',1.50,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_LPG','IND_ONS_TECH',2050,'IND_OTH_NSP',1.50,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_HFO','IND_ONS_TECH',2050,'IND_OTH_NSP',1.50,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_OIL','IND_ONS_TECH',2050,'IND_OTH_NSP',1.50,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_BIO','IND_ONS_TECH',2050,'IND_OTH_NSP',1.50,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_HET','IND_ONS_TECH',2050,'IND_OTH_NSP',1.50,'');
-- Other non-energy uses
INSERT INTO "Efficiency" VALUES ('PIE','COA_HCO','IND_NEU_TECH',2011,'IND_OTH_NEU',1.00,'');
INSERT INTO "Efficiency" VALUES ('PIE','COA_OVC','IND_NEU_TECH',2011,'IND_OTH_NEU',1.00,'');
INSERT INTO "Efficiency" VALUES ('PIE','OIL_NSP','IND_NEU_TECH',2011,'IND_OTH_NEU',1.00,'');
INSERT INTO "Efficiency" VALUES ('PIE','COA_HCO','IND_NEU_TECH',2014,'IND_OTH_NEU',1.00,'');
INSERT INTO "Efficiency" VALUES ('PIE','COA_OVC','IND_NEU_TECH',2014,'IND_OTH_NEU',1.00,'');
INSERT INTO "Efficiency" VALUES ('PIE','OIL_NSP','IND_NEU_TECH',2014,'IND_OTH_NEU',1.00,'');
INSERT INTO "Efficiency" VALUES ('PIE','COA_HCO','IND_NEU_TECH',2050,'IND_OTH_NEU',1.20,'');
INSERT INTO "Efficiency" VALUES ('PIE','COA_OVC','IND_NEU_TECH',2050,'IND_OTH_NEU',1.20,'');
INSERT INTO "Efficiency" VALUES ('PIE','OIL_NSP','IND_NEU_TECH',2050,'IND_OTH_NEU',1.20,'');

-- New technologies
-- Machine drive and steam

INSERT INTO "Efficiency" VALUES ('PIE','IND_LPG','IND_MD_LPG_N',2012,'IND_MD',0.38,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','IND_LPG','IND_MD_LPG_N',2050,'IND_MD',0.44,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','IND_NGA','IND_MD_NGA_N',2012,'IND_MD',0.38,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','IND_NGA','IND_MD_NGA_N',2050,'IND_MD',0.44,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','IND_ELC','IND_MD_ELC_N',2012,'IND_MD',0.88,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','IND_ELC','IND_MD_ELC_N',2050,'IND_MD',0.93,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','IND_BIO','IND_STM_BIO_N',2012,'IND_SB',0.80,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','IND_BIO','IND_STM_BIO_N',2050,'IND_SB',0.88,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','IND_BFG','IND_STM_BFG_N',2012,'IND_SB',0.83,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','IND_BFG','IND_STM_BFG_N',2050,'IND_SB',0.90,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','IND_OIL','IND_STM_DST_N',2012,'IND_SB',0.83,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','IND_OIL','IND_STM_DST_N',2050,'IND_SB',0.91,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','IND_ETH','IND_STM_ETH_N',2012,'IND_SB',0.85,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','IND_ETH','IND_STM_ETH_N',2050,'IND_SB',0.91,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','IND_HET','IND_STM_HET_N',2012,'IND_SB',1.00,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','IND_HET','IND_STM_HET_N',2050,'IND_SB',1.01,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','IND_LPG','IND_STM_LPG_N',2012,'IND_SB',0.83,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','IND_LPG','IND_STM_LPG_N',2050,'IND_SB',0.86,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','IND_NGA','IND_STM_NGA_N',2012,'IND_SB',0.90,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','IND_NGA','IND_STM_NGA_N',2050,'IND_SB',0.94,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','IND_PTC','IND_STM_PTC_N',2012,'IND_SB',0.81,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','IND_PTC','IND_STM_PTC_N',2050,'IND_SB',0.87,'PJ/PJ');
-- Chemicals
INSERT INTO "Efficiency" VALUES ('PIE','IND_NAP','IND_CH_HVC_NAPSC_N',2012,'IND_CH_SB',2.55E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_MD','IND_CH_HVC_NAPSC_N',2012,'IND_CH_SB',2.55E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_FS_NAP','IND_CH_HVC_NAPSC_N',2012,'IND_CH_SB',2.55E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_NAP','IND_CH_HVC_NAPSC_N',2012,'IND_CH_HVC',2.55E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_MD','IND_CH_HVC_NAPSC_N',2012,'IND_CH_HVC',2.55E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_FS_NAP','IND_CH_HVC_NAPSC_N',2012,'IND_CH_HVC',2.55E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_NAP','IND_CH_HVC_NAPSC_N',2030,'IND_CH_SB',3.66E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_MD','IND_CH_HVC_NAPSC_N',2030,'IND_CH_SB',3.66E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_FS_NAP','IND_CH_HVC_NAPSC_N',2030,'IND_CH_SB',3.66E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_NAP','IND_CH_HVC_NAPSC_N',2030,'IND_CH_HVC',3.66E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_MD','IND_CH_HVC_NAPSC_N',2030,'IND_CH_HVC',3.66E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_FS_NAP','IND_CH_HVC_NAPSC_N',2030,'IND_CH_HVC',3.66E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_ETH','IND_CH_HVC_ETHSC_N',2012,'IND_CH_SB',3.40E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_MD','IND_CH_HVC_ETHSC_N',2012,'IND_CH_SB',3.40E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_FS_ETH','IND_CH_HVC_ETHSC_N',2012,'IND_CH_SB',3.40E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_ETH','IND_CH_HVC_ETHSC_N',2012,'IND_CH_HVC',3.40E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_MD','IND_CH_HVC_ETHSC_N',2012,'IND_CH_HVC',3.40E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_FS_ETH','IND_CH_HVC_ETHSC_N',2012,'IND_CH_HVC',3.40E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_ETH','IND_CH_HVC_ETHSC_N',2030,'IND_CH_SB',6.30E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_MD','IND_CH_HVC_ETHSC_N',2030,'IND_CH_SB',6.30E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_FS_ETH','IND_CH_HVC_ETHSC_N',2030,'IND_CH_SB',6.30E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_ETH','IND_CH_HVC_ETHSC_N',2030,'IND_CH_HVC',6.30E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_MD','IND_CH_HVC_ETHSC_N',2030,'IND_CH_HVC',6.30E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_FS_ETH','IND_CH_HVC_ETHSC_N',2030,'IND_CH_HVC',6.30E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_OIL','IND_CH_HVC_GSOSC_N',2012,'IND_CH_SB',2.35E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_MD','IND_CH_HVC_GSOSC_N',2012,'IND_CH_SB',2.35E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_FS_DST','IND_CH_HVC_GSOSC_N',2012,'IND_CH_SB',2.35E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_OIL','IND_CH_HVC_GSOSC_N',2012,'IND_CH_HVC',2.35E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_MD','IND_CH_HVC_GSOSC_N',2012,'IND_CH_HVC',2.35E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_FS_DST','IND_CH_HVC_GSOSC_N',2012,'IND_CH_HVC',2.35E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_OIL','IND_CH_HVC_GSOSC_N',2030,'IND_CH_SB',2.61E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_MD','IND_CH_HVC_GSOSC_N',2030,'IND_CH_SB',2.61E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_FS_DST','IND_CH_HVC_GSOSC_N',2030,'IND_CH_SB',2.61E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_OIL','IND_CH_HVC_GSOSC_N',2030,'IND_CH_HVC',2.61E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_MD','IND_CH_HVC_GSOSC_N',2030,'IND_CH_HVC',2.61E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_FS_DST','IND_CH_HVC_GSOSC_N',2030,'IND_CH_HVC',2.61E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_LPG','IND_CH_HVC_LPGSC_N',2012,'IND_CH_SB',2.58E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_MD','IND_CH_HVC_LPGSC_N',2012,'IND_CH_SB',2.58E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_FS_LPG','IND_CH_HVC_LPGSC_N',2012,'IND_CH_SB',2.58E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_LPG','IND_CH_HVC_LPGSC_N',2012,'IND_CH_HVC',2.58E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_MD','IND_CH_HVC_LPGSC_N',2012,'IND_CH_HVC',2.58E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_FS_LPG','IND_CH_HVC_LPGSC_N',2012,'IND_CH_HVC',2.58E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_LPG','IND_CH_HVC_LPGSC_N',2030,'IND_CH_SB',4.54E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_MD','IND_CH_HVC_LPGSC_N',2030,'IND_CH_SB',4.54E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_FS_LPG','IND_CH_HVC_LPGSC_N',2030,'IND_CH_SB',4.54E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_LPG','IND_CH_HVC_LPGSC_N',2030,'IND_CH_HVC',4.54E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_MD','IND_CH_HVC_LPGSC_N',2030,'IND_CH_HVC',4.54E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_FS_LPG','IND_CH_HVC_LPGSC_N',2030,'IND_CH_HVC',4.54E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_NAP','IND_CH_HVC_NCC_N',2020,'IND_CH_SB',2.97E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_MD','IND_CH_HVC_NCC_N',2020,'IND_CH_SB',2.97E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_FS_NAP','IND_CH_HVC_NCC_N',2020,'IND_CH_SB',2.97E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_NAP','IND_CH_HVC_NCC_N',2020,'IND_CH_HVC',2.97E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_MD','IND_CH_HVC_NCC_N',2020,'IND_CH_HVC',2.97E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_FS_NAP','IND_CH_HVC_NCC_N',2020,'IND_CH_HVC',2.97E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_NAP','IND_CH_HVC_NCC_N',2030,'IND_CH_SB',3.30E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_MD','IND_CH_HVC_NCC_N',2030,'IND_CH_SB',3.30E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_FS_NAP','IND_CH_HVC_NCC_N',2030,'IND_CH_SB',3.30E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_NAP','IND_CH_HVC_NCC_N',2030,'IND_CH_HVC',3.30E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_MD','IND_CH_HVC_NCC_N',2030,'IND_CH_HVC',3.30E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_FS_NAP','IND_CH_HVC_NCC_N',2030,'IND_CH_HVC',3.30E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_BIO','IND_CH_HVC_BDH_N',2020,'IND_CH_HVC',1.05E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_MD','IND_CH_HVC_BDH_N',2020,'IND_CH_HVC',1.05E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_SB','IND_CH_HVC_BDH_N',2020,'IND_CH_HVC',1.05E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_FS_BIO','IND_CH_HVC_BDH_N',2020,'IND_CH_HVC',1.05E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_HVC','IND_CH_HVC_N',2012,'IND_CH_BTX',1.00E+00,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_HVC','IND_CH_HVC_N',2012,'IND_CH_OLF',1.00E+00,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_LPG','IND_CH_OLF_PDH_N',2015,'IND_CH_OLF',1.44E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_SB','IND_CH_OLF_PDH_N',2015,'IND_CH_OLF',1.44E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_MD','IND_CH_OLF_PDH_N',2015,'IND_CH_OLF',1.44E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_FS_LPG','IND_CH_OLF_PDH_N',2015,'IND_CH_OLF',1.44E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_LPG','IND_CH_OLF_PDH_N',2030,'IND_CH_OLF',1.63E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_SB','IND_CH_OLF_PDH_N',2030,'IND_CH_OLF',1.63E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_MD','IND_CH_OLF_PDH_N',2030,'IND_CH_OLF',1.63E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_FS_LPG','IND_CH_OLF_PDH_N',2030,'IND_CH_OLF',1.63E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_NGA','IND_CH_OLF_MTO_N',2012,'IND_CH_OLF',3.19E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_FS_MTH','IND_CH_OLF_MTO_N',2012,'IND_CH_OLF',3.19E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_MD','IND_CH_OLF_MTO_N',2012,'IND_CH_OLF',3.19E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_NGA','IND_CH_OLF_MTO_N',2012,'IND_CH_SB',3.19E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_FS_MTH','IND_CH_OLF_MTO_N',2012,'IND_CH_SB',3.19E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_MD','IND_CH_OLF_MTO_N',2012,'IND_CH_SB',3.19E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_NGA','IND_CH_OLF_MTO_N',2030,'IND_CH_OLF',3.55E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_FS_MTH','IND_CH_OLF_MTO_N',2030,'IND_CH_OLF',3.55E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_MD','IND_CH_OLF_MTO_N',2030,'IND_CH_OLF',3.55E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_NGA','IND_CH_OLF_MTO_N',2030,'IND_CH_SB',3.55E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_FS_MTH','IND_CH_OLF_MTO_N',2030,'IND_CH_SB',3.55E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_MD','IND_CH_OLF_MTO_N',2030,'IND_CH_SB',3.55E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_NGA','IND_CH_AMM_NGASR_N',2012,'IND_CH_AMM',2.24E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_FS_NGA','IND_CH_AMM_NGASR_N',2012,'IND_CH_AMM',2.24E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_EC','IND_CH_AMM_NGASR_N',2012,'IND_CH_AMM',2.24E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_NGA','IND_CH_AMM_NGASR_N',2012,'IND_CH_SB',2.24E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_FS_NGA','IND_CH_AMM_NGASR_N',2012,'IND_CH_SB',2.24E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_EC','IND_CH_AMM_NGASR_N',2012,'IND_CH_SB',2.24E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_NGA','IND_CH_AMM_NGASR_N',2030,'IND_CH_AMM',3.50E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_FS_NGA','IND_CH_AMM_NGASR_N',2030,'IND_CH_AMM',3.50E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_EC','IND_CH_AMM_NGASR_N',2030,'IND_CH_AMM',3.50E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_NGA','IND_CH_AMM_NGASR_N',2030,'IND_CH_SB',3.50E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_FS_NGA','IND_CH_AMM_NGASR_N',2030,'IND_CH_SB',3.50E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_EC','IND_CH_AMM_NGASR_N',2030,'IND_CH_SB',3.50E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_NAP','IND_CH_AMM_NAPPOX_N',2012,'IND_CH_AMM',1.95E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_FS_NAP','IND_CH_AMM_NAPPOX_N',2012,'IND_CH_AMM',1.95E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_EC','IND_CH_AMM_NAPPOX_N',2012,'IND_CH_AMM',1.95E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_NAP','IND_CH_AMM_NAPPOX_N',2012,'IND_CH_SB',1.95E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_FS_NAP','IND_CH_AMM_NAPPOX_N',2012,'IND_CH_SB',1.95E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_EC','IND_CH_AMM_NAPPOX_N',2012,'IND_CH_SB',1.95E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_NAP','IND_CH_AMM_NAPPOX_N',2030,'IND_CH_AMM',2.61E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_FS_NAP','IND_CH_AMM_NAPPOX_N',2030,'IND_CH_AMM',2.61E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_EC','IND_CH_AMM_NAPPOX_N',2030,'IND_CH_AMM',2.61E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_NAP','IND_CH_AMM_NAPPOX_N',2030,'IND_CH_SB',2.61E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_FS_NAP','IND_CH_AMM_NAPPOX_N',2030,'IND_CH_SB',2.61E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_EC','IND_CH_AMM_NAPPOX_N',2030,'IND_CH_SB',2.61E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_COA','IND_CH_AMM_COAGSF_N',2012,'IND_CH_AMM',5.46E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_FS_HCO','IND_CH_AMM_COAGSF_N',2012,'IND_CH_AMM',5.46E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_EC','IND_CH_AMM_COAGSF_N',2012,'IND_CH_AMM',5.46E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_COA','IND_CH_AMM_COAGSF_N',2012,'IND_CH_SB',5.46E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_FS_HCO','IND_CH_AMM_COAGSF_N',2012,'IND_CH_SB',5.46E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_EC','IND_CH_AMM_COAGSF_N',2012,'IND_CH_SB',5.46E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_COA','IND_CH_AMM_COAGSF_N',2030,'IND_CH_AMM',6.94E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_FS_HCO','IND_CH_AMM_COAGSF_N',2030,'IND_CH_AMM',6.94E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_EC','IND_CH_AMM_COAGSF_N',2030,'IND_CH_AMM',6.94E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_COA','IND_CH_AMM_COAGSF_N',2030,'IND_CH_SB',6.94E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_FS_HCO','IND_CH_AMM_COAGSF_N',2030,'IND_CH_SB',6.94E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_EC','IND_CH_AMM_COAGSF_N',2030,'IND_CH_SB',6.94E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_BIO','IND_CH_AMM_BIOGSF_N',2025,'IND_CH_AMM',4.63E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_FS_BIO','IND_CH_AMM_BIOGSF_N',2025,'IND_CH_AMM',4.63E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_EC','IND_CH_AMM_BIOGSF_N',2025,'IND_CH_AMM',4.63E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_BIO','IND_CH_AMM_BIOGSF_N',2025,'IND_CH_SB',4.63E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_FS_BIO','IND_CH_AMM_BIOGSF_N',2025,'IND_CH_SB',4.63E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_EC','IND_CH_AMM_BIOGSF_N',2025,'IND_CH_SB',4.63E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_H2E','IND_CH_AMM_ELCSYS_N',2025,'IND_CH_AMM',2.48E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_MD','IND_CH_AMM_ELCSYS_N',2025,'IND_CH_AMM',2.48E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_NGA','IND_CH_MTH_NGASR_N',2012,'IND_CH_MTH',1.00E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_FS_NGA','IND_CH_MTH_NGASR_N',2012,'IND_CH_MTH',1.00E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_MD','IND_CH_MTH_NGASR_N',2012,'IND_CH_MTH',1.00E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_NGA','IND_CH_MTH_NGASR_N',2012,'IND_CH_SB',1.00E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_FS_NGA','IND_CH_MTH_NGASR_N',2012,'IND_CH_SB',1.00E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_MD','IND_CH_MTH_NGASR_N',2012,'IND_CH_SB',1.00E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_NGA','IND_CH_MTH_NGASR_N',2020,'IND_CH_MTH',1.11E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_FS_NGA','IND_CH_MTH_NGASR_N',2020,'IND_CH_MTH',1.11E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_MD','IND_CH_MTH_NGASR_N',2020,'IND_CH_MTH',1.11E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_NGA','IND_CH_MTH_NGASR_N',2020,'IND_CH_SB',1.11E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_FS_NGA','IND_CH_MTH_NGASR_N',2020,'IND_CH_SB',1.11E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_MD','IND_CH_MTH_NGASR_N',2020,'IND_CH_SB',1.11E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_COG','IND_CH_MTH_COGSR_N',2012,'IND_CH_MTH',1.24E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_FS_NGA','IND_CH_MTH_COGSR_N',2012,'IND_CH_MTH',1.24E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_MD','IND_CH_MTH_COGSR_N',2012,'IND_CH_MTH',1.24E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_COG','IND_CH_MTH_COGSR_N',2012,'IND_CH_SB',1.24E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_FS_NGA','IND_CH_MTH_COGSR_N',2012,'IND_CH_SB',1.24E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_MD','IND_CH_MTH_COGSR_N',2012,'IND_CH_SB',1.24E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_COG','IND_CH_MTH_COGSR_N',2030,'IND_CH_MTH',1.38E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_FS_NGA','IND_CH_MTH_COGSR_N',2030,'IND_CH_MTH',1.38E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_MD','IND_CH_MTH_COGSR_N',2030,'IND_CH_MTH',1.38E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_COG','IND_CH_MTH_COGSR_N',2030,'IND_CH_SB',1.38E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_FS_NGA','IND_CH_MTH_COGSR_N',2030,'IND_CH_SB',1.38E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_MD','IND_CH_MTH_COGSR_N',2030,'IND_CH_SB',1.38E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_LPG','IND_CH_MTH_LPGSR_N',2012,'IND_CH_MTH',1.03E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_FS_LPG','IND_CH_MTH_LPGSR_N',2012,'IND_CH_MTH',1.03E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_MD','IND_CH_MTH_LPGSR_N',2012,'IND_CH_MTH',1.03E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_LPG','IND_CH_MTH_LPGSR_N',2012,'IND_CH_SB',1.03E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_FS_LPG','IND_CH_MTH_LPGSR_N',2012,'IND_CH_SB',1.03E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_MD','IND_CH_MTH_LPGSR_N',2012,'IND_CH_SB',1.03E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_LPG','IND_CH_MTH_LPGSR_N',2030,'IND_CH_MTH',1.15E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_FS_LPG','IND_CH_MTH_LPGSR_N',2030,'IND_CH_MTH',1.15E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_MD','IND_CH_MTH_LPGSR_N',2030,'IND_CH_MTH',1.15E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_LPG','IND_CH_MTH_LPGSR_N',2030,'IND_CH_SB',1.15E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_FS_LPG','IND_CH_MTH_LPGSR_N',2030,'IND_CH_SB',1.15E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_MD','IND_CH_MTH_LPGSR_N',2030,'IND_CH_SB',1.15E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_COA','IND_CH_MTH_COAGSF_N',2012,'IND_CH_MTH',1.30E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_FS_HCO','IND_CH_MTH_COAGSF_N',2012,'IND_CH_MTH',1.30E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_MD','IND_CH_MTH_COAGSF_N',2012,'IND_CH_MTH',1.30E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_COA','IND_CH_MTH_COAGSF_N',2012,'IND_CH_SB',1.30E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_FS_HCO','IND_CH_MTH_COAGSF_N',2012,'IND_CH_SB',1.30E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_MD','IND_CH_MTH_COAGSF_N',2012,'IND_CH_SB',1.30E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_COA','IND_CH_MTH_COAGSF_N',2030,'IND_CH_MTH',1.44E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_FS_HCO','IND_CH_MTH_COAGSF_N',2030,'IND_CH_MTH',1.44E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_MD','IND_CH_MTH_COAGSF_N',2030,'IND_CH_MTH',1.44E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_COA','IND_CH_MTH_COAGSF_N',2030,'IND_CH_SB',1.44E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_FS_HCO','IND_CH_MTH_COAGSF_N',2030,'IND_CH_SB',1.44E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_MD','IND_CH_MTH_COAGSF_N',2030,'IND_CH_SB',1.44E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_BIO','IND_CH_MTH_BIOGSF_N',2025,'IND_CH_MTH',1.12E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_FS_BIO','IND_CH_MTH_BIOGSF_N',2025,'IND_CH_MTH',1.12E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_MD','IND_CH_MTH_BIOGSF_N',2025,'IND_CH_MTH',1.12E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_BIO','IND_CH_MTH_BIOGSF_N',2025,'IND_CH_SB',1.12E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_FS_BIO','IND_CH_MTH_BIOGSF_N',2025,'IND_CH_SB',1.12E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_MD','IND_CH_MTH_BIOGSF_N',2025,'IND_CH_SB',1.12E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_H2E','IND_CH_MTH_ELCSYS_N',2025,'IND_CH_MTH',4.18E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_MD','IND_CH_MTH_ELCSYS_N',2025,'IND_CH_MTH',4.18E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_EC','IND_CH_CHL_MERC_N',2012,'IND_CH_CHL',9.05E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_SB','IND_CH_CHL_MERC_N',2012,'IND_CH_CHL',9.05E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_MD','IND_CH_CHL_MERC_N',2012,'IND_CH_CHL',9.05E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_EC','IND_CH_CHL_MERC_N',2012,'IND_H2',9.05E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_SB','IND_CH_CHL_MERC_N',2012,'IND_H2',9.05E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_MD','IND_CH_CHL_MERC_N',2012,'IND_H2',9.05E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_EC','IND_CH_CHL_MERC_N',2030,'IND_CH_CHL',1.30E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_SB','IND_CH_CHL_MERC_N',2030,'IND_CH_CHL',1.30E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_MD','IND_CH_CHL_MERC_N',2030,'IND_CH_CHL',1.30E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_EC','IND_CH_CHL_MERC_N',2030,'IND_H2',1.30E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_SB','IND_CH_CHL_MERC_N',2030,'IND_H2',1.30E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_MD','IND_CH_CHL_MERC_N',2030,'IND_H2',1.30E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_EC','IND_CH_CHL_DIAP_N',2012,'IND_CH_CHL',1.12E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_SB','IND_CH_CHL_DIAP_N',2012,'IND_CH_CHL',1.12E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_MD','IND_CH_CHL_DIAP_N',2012,'IND_CH_CHL',1.12E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_EC','IND_CH_CHL_DIAP_N',2012,'IND_H2',1.12E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_SB','IND_CH_CHL_DIAP_N',2012,'IND_H2',1.12E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_MD','IND_CH_CHL_DIAP_N',2012,'IND_H2',1.12E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_EC','IND_CH_CHL_DIAP_N',2030,'IND_CH_CHL',1.62E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_SB','IND_CH_CHL_DIAP_N',2030,'IND_CH_CHL',1.62E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_MD','IND_CH_CHL_DIAP_N',2030,'IND_CH_CHL',1.62E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_EC','IND_CH_CHL_DIAP_N',2030,'IND_H2',1.62E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_SB','IND_CH_CHL_DIAP_N',2030,'IND_H2',1.62E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_MD','IND_CH_CHL_DIAP_N',2030,'IND_H2',1.62E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_EC','IND_CH_CHL_MEMB_N',2012,'IND_CH_CHL',1.19E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_SB','IND_CH_CHL_MEMB_N',2012,'IND_CH_CHL',1.19E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_MD','IND_CH_CHL_MEMB_N',2012,'IND_CH_CHL',1.19E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_EC','IND_CH_CHL_MEMB_N',2012,'IND_H2',1.19E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_SB','IND_CH_CHL_MEMB_N',2012,'IND_H2',1.19E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_MD','IND_CH_CHL_MEMB_N',2012,'IND_H2',1.19E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_EC','IND_CH_CHL_MEMB_N',2030,'IND_CH_CHL',1.72E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_SB','IND_CH_CHL_MEMB_N',2030,'IND_CH_CHL',1.72E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_MD','IND_CH_CHL_MEMB_N',2030,'IND_CH_CHL',1.72E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_EC','IND_CH_CHL_MEMB_N',2030,'IND_H2',1.72E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_SB','IND_CH_CHL_MEMB_N',2030,'IND_H2',1.72E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_CH_MD','IND_CH_CHL_MEMB_N',2030,'IND_H2',1.72E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_ELC','IND_CH_EC_N',2012,'IND_CH_EC',1.01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_ELC','IND_CH_EC_N',2020,'IND_CH_EC',1.05,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_ELC','IND_CH_EC_N',2050,'IND_CH_EC',1.10,'');
INSERT INTO "Efficiency" VALUES ('PIE','BIO_SLB','IND_CH_FS_BIO_N',2012,'IND_CH_FS_BIO',1.00,'');
INSERT INTO "Efficiency" VALUES ('PIE','COA_HCO','IND_CH_FS_COA_N',2012,'IND_CH_FS_HCO',1.00,'');
INSERT INTO "Efficiency" VALUES ('PIE','OIL_DST','IND_CH_FS_DST_N',2012,'IND_CH_FS_DST',1.00,'');
INSERT INTO "Efficiency" VALUES ('PIE','GAS_ETH','IND_CH_FS_ETH_N',2012,'IND_CH_FS_ETH',1.00,'');
INSERT INTO "Efficiency" VALUES ('PIE','MTH_SYN','IND_CH_FS_MTH_N',2012,'IND_CH_FS_MTH',1.00,'');
INSERT INTO "Efficiency" VALUES ('PIE','GAS_NGA','IND_CH_FS_NGA_N',2012,'IND_CH_FS_NGA',1.00,'');
INSERT INTO "Efficiency" VALUES ('PIE','OIL_LPG','IND_CH_FS_LPG_N',2012,'IND_CH_FS_LPG',1.00,'');
INSERT INTO "Efficiency" VALUES ('PIE','OIL_NAP','IND_CH_FS_NAP_N',2012,'IND_CH_FS_NAP',1.00,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_COK','IND_CH_OTH_COK_N',2012,'IND_CH_OTH',1.00,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_OIL','IND_CH_OTH_DST_N',2012,'IND_CH_OTH',1.00,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_ELC','IND_CH_OTH_ELC_N',2012,'IND_CH_OTH',1.02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_ETH','IND_CH_OTH_ETH_N',2012,'IND_CH_OTH',1.00,'');

INSERT INTO "Efficiency" VALUES ('PIE','IND_NGA','IND_CH_OTH_NGA_N',2012,'IND_CH_OTH',1.02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_NGA','IND_CH_OTH_NGA_N',2040,'IND_CH_OTH',1.03,'');
-- Iron and steel
INSERT INTO "Efficiency" VALUES ('PIE','IND_BFG','IND_IS_BOF_BFBOF_N',2012,'GAS_BFG',2.69E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_IS_FS','IND_IS_BOF_BFBOF_N',2012,'GAS_BFG',2.69E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_IS_MD','IND_IS_BOF_BFBOF_N',2012,'GAS_BFG',2.69E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_COA','IND_IS_BOF_BFBOF_N',2012,'GAS_BFG',2.69E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_BFG','IND_IS_BOF_BFBOF_N',2012,'IND_IS_BOF',2.69E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_IS_FS','IND_IS_BOF_BFBOF_N',2012,'IND_IS_BOF',2.69E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_IS_MD','IND_IS_BOF_BFBOF_N',2012,'IND_IS_BOF',2.69E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_COA','IND_IS_BOF_BFBOF_N',2012,'IND_IS_BOF',2.69E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_BFG','IND_IS_BOF_BFBOF_N',2050,'GAS_BFG',2.69E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_IS_FS','IND_IS_BOF_BFBOF_N',2050,'GAS_BFG',3.05E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_IS_MD','IND_IS_BOF_BFBOF_N',2050,'GAS_BFG',3.05E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_COA','IND_IS_BOF_BFBOF_N',2050,'GAS_BFG',3.05E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_BFG','IND_IS_BOF_BFBOF_N',2050,'IND_IS_BOF',3.05E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_IS_FS','IND_IS_BOF_BFBOF_N',2050,'IND_IS_BOF',3.05E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_IS_MD','IND_IS_BOF_BFBOF_N',2050,'IND_IS_BOF',3.05E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_COA','IND_IS_BOF_BFBOF_N',2050,'IND_IS_BOF',3.05E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_ELC','IND_IS_DRI_DRIEAF_N',2012,'IND_IS_EAF',1.79E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_IS_FS','IND_IS_DRI_DRIEAF_N',2012,'IND_IS_EAF',1.79E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_NGA','IND_IS_DRI_DRIEAF_N',2012,'IND_IS_EAF',1.79E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_ELC','IND_IS_DRI_DRIEAF_N',2012,'IND_SB',1.79E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_IS_FS','IND_IS_DRI_DRIEAF_N',2012,'IND_SB',1.79E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_NGA','IND_IS_DRI_DRIEAF_N',2012,'IND_SB',1.79E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_ELC','IND_IS_DRI_DRIEAF_N',2030,'IND_IS_EAF',1.99E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_IS_FS','IND_IS_DRI_DRIEAF_N',2030,'IND_IS_EAF',1.99E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_NGA','IND_IS_DRI_DRIEAF_N',2030,'IND_IS_EAF',1.99E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_ELC','IND_IS_DRI_DRIEAF_N',2030,'IND_SB',1.99E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_IS_FS','IND_IS_DRI_DRIEAF_N',2030,'IND_SB',1.99E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_NGA','IND_IS_DRI_DRIEAF_N',2030,'IND_SB',1.99E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_ELC','IND_IS_DRI_HDREAF_N',2030,'IND_IS_EAF',1.18E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_H2','IND_IS_DRI_HDREAF_N',2030,'IND_IS_EAF',1.18E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_NGA','IND_IS_DRI_HDREAF_N',2030,'IND_IS_EAF',1.18E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_IS_MD','IND_IS_DRI_HDREAF_N',2030,'IND_IS_EAF',1.18E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_ELC','IND_IS_DRI_HDREAF_N',2030,'IND_SB',1.18E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_H2','IND_IS_DRI_HDREAF_N',2030,'IND_SB',1.18E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_NGA','IND_IS_DRI_HDREAF_N',2030,'IND_SB',1.18E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_IS_MD','IND_IS_DRI_HDREAF_N',2030,'IND_SB',1.18E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_NGA','IND_IS_BOF_HISBOF_N',2025,'IND_IS_BOF',7.32E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_ELC','IND_IS_BOF_HISBOF_N',2025,'IND_IS_BOF',7.32E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_COA','IND_IS_BOF_HISBOF_N',2025,'IND_IS_BOF',7.32E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_NGA','IND_IS_BOF_HISBOF_N',2030,'IND_IS_BOF',8.14E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_ELC','IND_IS_BOF_HISBOF_N',2030,'IND_IS_BOF',8.14E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_COA','IND_IS_BOF_HISBOF_N',2030,'IND_IS_BOF',8.14E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_COA','IND_IS_BOF_ULCOWIN_N',2030,'IND_IS_BOF',6.40E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_NGA','IND_IS_BOF_ULCOWIN_N',2030,'IND_IS_BOF',6.40E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_ELC','IND_IS_BOF_ULCOWIN_N',2030,'IND_IS_BOF',6.40E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_ELC','IND_IS_BOF_ULCOLYSIS_N',2030,'IND_IS_BOF',6.35E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_NGA','IND_IS_BOF_ULCOLYSIS_N',2030,'IND_IS_BOF',6.35E-02,'');
-- Non-ferrous metals
INSERT INTO "Efficiency" VALUES ('PIE','IND_COA','IND_NF_AMN_BAY_N',2012,'IND_NF_AMN',6.80E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_HFO','IND_NF_AMN_BAY_N',2012,'IND_NF_AMN',6.80E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_NGA','IND_NF_AMN_BAY_N',2012,'IND_NF_AMN',6.80E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_NF_EC','IND_NF_AMN_BAY_N',2012,'IND_NF_AMN',6.80E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_COA','IND_NF_AMN_BAY_N',2030,'IND_NF_AMN',9.62E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_HFO','IND_NF_AMN_BAY_N',2030,'IND_NF_AMN',9.62E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_NGA','IND_NF_AMN_BAY_N',2030,'IND_NF_AMN',9.62E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_NF_EC','IND_NF_AMN_BAY_N',2030,'IND_NF_AMN',9.62E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_NF_AMN','IND_NF_ALU_HLH_N',2012,'IND_NF_ALU',1.87E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_NGA','IND_NF_ALU_HLH_N',2012,'IND_NF_ALU',1.87E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_NF_EC','IND_NF_ALU_HLH_N',2012,'IND_NF_ALU',1.87E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_NF_AMN','IND_NF_ALU_HLH_N',2030,'IND_NF_ALU',2.08E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_NGA','IND_NF_ALU_HLH_N',2030,'IND_NF_ALU',2.08E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_NF_EC','IND_NF_ALU_HLH_N',2030,'IND_NF_ALU',2.08E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_HFO','IND_NF_ALU_SEC_N',2012,'IND_NF_ALU',2.32E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_NGA','IND_NF_ALU_SEC_N',2012,'IND_NF_ALU',2.32E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_NF_EC','IND_NF_ALU_SEC_N',2012,'IND_NF_ALU',2.32E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_HFO','IND_NF_ALU_SEC_N',2030,'IND_NF_ALU',2.58E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_NGA','IND_NF_ALU_SEC_N',2030,'IND_NF_ALU',2.58E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_NF_EC','IND_NF_ALU_SEC_N',2030,'IND_NF_ALU',2.58E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_NF_AMN','IND_NF_ALU_HLHIA_N',2030,'IND_NF_ALU',2.36E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_NGA','IND_NF_ALU_HLHIA_N',2030,'IND_NF_ALU',2.36E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_NF_EC','IND_NF_ALU_HLHIA_N',2030,'IND_NF_ALU',2.36E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_NF_AMN','IND_NF_ALU_CBT_N',2050,'IND_NF_ALU',2.63E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_NGA','IND_NF_ALU_CBT_N',2050,'IND_NF_ALU',2.63E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_NF_EC','IND_NF_ALU_CBT_N',2050,'IND_NF_ALU',2.63E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_NF_EC','IND_NF_ALU_KAO_N',2050,'IND_NF_ALU',1.98E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_HFO','IND_NF_COP_N',2012,'IND_NF_COP',6.13E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_NGA','IND_NF_COP_N',2012,'IND_NF_COP',6.13E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_COA','IND_NF_COP_N',2012,'IND_NF_COP',6.13E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_OIL','IND_NF_COP_N',2012,'IND_NF_COP',6.13E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_NF_EC','IND_NF_COP_N',2012,'IND_NF_COP',6.13E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_HFO','IND_NF_COP_N',2030,'IND_NF_COP',6.81E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_NGA','IND_NF_COP_N',2030,'IND_NF_COP',6.81E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_COA','IND_NF_COP_N',2030,'IND_NF_COP',6.81E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_OIL','IND_NF_COP_N',2030,'IND_NF_COP',6.81E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_NF_EC','IND_NF_COP_N',2030,'IND_NF_COP',6.81E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_NF_EC','IND_NF_ZNC_N',2012,'IND_NF_ZNC',5.66E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_NF_SB','IND_NF_ZNC_N',2012,'IND_NF_ZNC',5.66E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_NF_MD','IND_NF_ZNC_N',2012,'IND_NF_ZNC',5.66E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_NF_EC','IND_NF_ZNC_N',2015,'IND_NF_ZNC',5.81E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_NF_SB','IND_NF_ZNC_N',2015,'IND_NF_ZNC',5.81E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_NF_MD','IND_NF_ZNC_N',2015,'IND_NF_ZNC',5.81E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_NF_EC','IND_NF_ZNC_N',2030,'IND_NF_ZNC',6.16E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_NF_SB','IND_NF_ZNC_N',2030,'IND_NF_ZNC',6.16E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_NF_MD','IND_NF_ZNC_N',2030,'IND_NF_ZNC',6.16E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_NF_EC','IND_NF_ZNC_N',2040,'IND_NF_ZNC',6.52E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_NF_SB','IND_NF_ZNC_N',2040,'IND_NF_ZNC',6.52E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_NF_MD','IND_NF_ZNC_N',2040,'IND_NF_ZNC',6.52E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_NF_EC','IND_NF_ZNC_N',2050,'IND_NF_ZNC',7.34E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_NF_SB','IND_NF_ZNC_N',2050,'IND_NF_ZNC',7.34E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_NF_MD','IND_NF_ZNC_N',2050,'IND_NF_ZNC',7.34E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_ELC','IND_NF_EC_N',2012,'IND_NF_EC',1.01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_ELC','IND_NF_EC_N',2020,'IND_NF_EC',1.04,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_ELC','IND_NF_EC_N',2050,'IND_NF_EC',1.06,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_ELC','IND_NF_OTH_ELC_N',2012,'IND_NF_OTH',1.00,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_ELC','IND_NF_OTH_ELC_N',2040,'IND_NF_OTH',1.03,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_OIL','IND_NF_OTH_DST_N',2012,'IND_NF_OTH',1.00,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_NGA','IND_NF_OTH_NGA_N',2012,'IND_NF_OTH',1.01,'');
-- Non-metallic minerals
INSERT INTO "Efficiency" VALUES ('PIE','IND_COA','IND_NM_CLK_DRY_N',2012,'IND_NM_CLK',2.32E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_HFO','IND_NM_CLK_DRY_N',2012,'IND_NM_CLK',2.32E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_NGA','IND_NM_CLK_DRY_N',2012,'IND_NM_CLK',2.32E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_BIO','IND_NM_CLK_DRY_N',2012,'IND_NM_CLK',2.32E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_NM_EC','IND_NM_CLK_DRY_N',2012,'IND_NM_CLK',2.32E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_COA','IND_NM_CLK_DRY_N',2030,'IND_NM_CLK',2.58E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_HFO','IND_NM_CLK_DRY_N',2030,'IND_NM_CLK',2.58E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_NGA','IND_NM_CLK_DRY_N',2030,'IND_NM_CLK',2.58E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_BIO','IND_NM_CLK_DRY_N',2030,'IND_NM_CLK',2.58E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_NM_EC','IND_NM_CLK_DRY_N',2030,'IND_NM_CLK',2.58E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_COA','IND_NM_CLK_WET_N',2012,'IND_NM_CLK',1.54E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_HFO','IND_NM_CLK_WET_N',2012,'IND_NM_CLK',1.54E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_NGA','IND_NM_CLK_WET_N',2012,'IND_NM_CLK',1.54E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_BIO','IND_NM_CLK_WET_N',2012,'IND_NM_CLK',1.54E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_NM_EC','IND_NM_CLK_WET_N',2012,'IND_NM_CLK',1.54E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_COA','IND_NM_CLK_WET_N',2030,'IND_NM_CLK',1.71E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_HFO','IND_NM_CLK_WET_N',2030,'IND_NM_CLK',1.71E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_NGA','IND_NM_CLK_WET_N',2030,'IND_NM_CLK',1.71E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_BIO','IND_NM_CLK_WET_N',2030,'IND_NM_CLK',1.71E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_NM_EC','IND_NM_CLK_WET_N',2030,'IND_NM_CLK',1.71E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_COA','IND_NM_CLK_DRYCL_PCCS_N',2020,'IND_NM_CLK',1.34E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_HFO','IND_NM_CLK_DRYCL_PCCS_N',2020,'IND_NM_CLK',1.34E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_NGA','IND_NM_CLK_DRYCL_PCCS_N',2020,'IND_NM_CLK',1.34E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_BIO','IND_NM_CLK_DRYCL_PCCS_N',2020,'IND_NM_CLK',1.34E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_NM_SB','IND_NM_CLK_DRYCL_PCCS_N',2020,'IND_NM_CLK',1.34E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_NM_EC','IND_NM_CLK_DRYCL_PCCS_N',2020,'IND_NM_CLK',1.34E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_NM_MD','IND_NM_CLK_DRYCL_PCCS_N',2020,'IND_NM_CLK',1.34E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_COA','IND_NM_CLK_DRYCL_OCCS_N',2030,'IND_NM_CLK',2.12E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_HFO','IND_NM_CLK_DRYCL_OCCS_N',2030,'IND_NM_CLK',2.12E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_NGA','IND_NM_CLK_DRYCL_OCCS_N',2030,'IND_NM_CLK',2.12E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_BIO','IND_NM_CLK_DRYCL_OCCS_N',2030,'IND_NM_CLK',2.12E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_NM_EC','IND_NM_CLK_DRYCL_OCCS_N',2030,'IND_NM_CLK',2.12E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_NM_CLK','IND_NM_CEM_BLN_N',2012,'IND_NM_CMT',1.00,'');
INSERT INTO "Efficiency" VALUES ('PIE','MAT_BFS','IND_NM_CEM_BLN_N',2012,'IND_NM_CMT',1.00,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_COA','IND_NM_CEM_AAC_N',2030,'IND_NM_CMT',8.33E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_HFO','IND_NM_CEM_AAC_N',2030,'IND_NM_CMT',8.33E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_NGA','IND_NM_CEM_AAC_N',2030,'IND_NM_CMT',8.33E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_BIO','IND_NM_CEM_AAC_N',2030,'IND_NM_CMT',8.33E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_NM_EC','IND_NM_CEM_AAC_N',2030,'IND_NM_CMT',8.33E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_COA','IND_NM_CEM_BEL_N',2030,'IND_NM_CMT',2.54E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_HFO','IND_NM_CEM_BEL_N',2030,'IND_NM_CMT',2.54E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_NGA','IND_NM_CEM_BEL_N',2030,'IND_NM_CMT',2.54E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_BIO','IND_NM_CEM_BEL_N',2030,'IND_NM_CMT',2.54E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_NM_EC','IND_NM_CEM_BEL_N',2030,'IND_NM_CMT',2.54E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_COA','IND_NM_LIM_LRK_N',2012,'IND_NM_LIM',1.32E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_HFO','IND_NM_LIM_LRK_N',2012,'IND_NM_LIM',1.32E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_NGA','IND_NM_LIM_LRK_N',2012,'IND_NM_LIM',1.32E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_BIO','IND_NM_LIM_LRK_N',2012,'IND_NM_LIM',1.32E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_NM_EC','IND_NM_LIM_LRK_N',2012,'IND_NM_LIM',1.32E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_COA','IND_NM_LIM_LRK_N',2030,'IND_NM_LIM',1.46E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_HFO','IND_NM_LIM_LRK_N',2030,'IND_NM_LIM',1.46E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_NGA','IND_NM_LIM_LRK_N',2030,'IND_NM_LIM',1.46E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_BIO','IND_NM_LIM_LRK_N',2030,'IND_NM_LIM',1.46E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_NM_EC','IND_NM_LIM_LRK_N',2030,'IND_NM_LIM',1.46E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_NGA','IND_NM_GLS_FOSS_N',2012,'IND_NM_GLS',6.25E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_OIL','IND_NM_GLS_FOSS_N',2012,'IND_NM_GLS',6.25E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_NM_EC','IND_NM_GLS_FOSS_N',2012,'IND_NM_GLS',6.25E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_NGA','IND_NM_GLS_FOSS_N',2030,'IND_NM_GLS',6.94E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_OIL','IND_NM_GLS_FOSS_N',2030,'IND_NM_GLS',6.94E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_NM_EC','IND_NM_GLS_FOSS_N',2030,'IND_NM_GLS',6.94E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_NM_EC','IND_NM_GLS_ELEC_N',2012,'IND_NM_GLS',9.26E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_OIL','IND_NM_GLS_ELEC_N',2012,'IND_NM_GLS',9.26E-02,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_NM_EC','IND_NM_GLS_ELEC_N',2030,'IND_NM_GLS',1.03E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_OIL','IND_NM_GLS_ELEC_N',2030,'IND_NM_GLS',1.03E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_NGA','IND_NM_CRM_N',2012,'IND_NM_CRM',3.81E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_NM_EC','IND_NM_CRM_N',2012,'IND_NM_CRM',3.81E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_NGA','IND_NM_CRM_N',2030,'IND_NM_CRM',4.24E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_NM_EC','IND_NM_CRM_N',2030,'IND_NM_CRM',4.24E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_ELC','IND_NM_EC_N',2012,'IND_NM_EC',1.04,'');
-- Pulp and paper
INSERT INTO "Efficiency" VALUES ('PIE', 'IND_PP_PH','IND_PP_PUL_KRF_N',2012,'MAT_BSW',1.15E+00,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_PP_MD','IND_PP_PUL_KRF_N',2012,'MAT_BSW',1.15E+00,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_PP_SB','IND_PP_PUL_KRF_N',2012,'MAT_BSW',1.15E+00,'');
INSERT INTO "Efficiency" VALUES ('PIE','MAT_WOD','IND_PP_PUL_KRF_N',2012,'MAT_BSW',1.15E+00,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_PP_PH','IND_PP_PUL_KRF_N',2012,'IND_ELC',1.15E+00,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_PP_MD','IND_PP_PUL_KRF_N',2012,'IND_ELC',1.15E+00,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_PP_SB','IND_PP_PUL_KRF_N',2012,'IND_ELC',1.15E+00,'');
INSERT INTO "Efficiency" VALUES ('PIE','MAT_WOD','IND_PP_PUL_KRF_N',2012,'IND_ELC',1.15E+00,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_PP_PH','IND_PP_PUL_KRF_N',2012,'IND_PP_PUC',1.15E+00,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_PP_MD','IND_PP_PUL_KRF_N',2012,'IND_PP_PUC',1.15E+00,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_PP_SB','IND_PP_PUL_KRF_N',2012,'IND_PP_PUC',1.15E+00,'');
INSERT INTO "Efficiency" VALUES ('PIE','MAT_WOD','IND_PP_PUL_KRF_N',2012,'IND_PP_PUC',1.15E+00,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_PP_PH','IND_PP_PUL_KRF_N',2030,'MAT_BSW',1.19E+00,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_PP_MD','IND_PP_PUL_KRF_N',2030,'MAT_BSW',1.19E+00,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_PP_SB','IND_PP_PUL_KRF_N',2030,'MAT_BSW',1.19E+00,'');
INSERT INTO "Efficiency" VALUES ('PIE','MAT_WOD','IND_PP_PUL_KRF_N',2030,'MAT_BSW',1.19E+00,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_PP_PH','IND_PP_PUL_KRF_N',2030,'IND_ELC',1.19E+00,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_PP_MD','IND_PP_PUL_KRF_N',2030,'IND_ELC',1.19E+00,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_PP_SB','IND_PP_PUL_KRF_N',2030,'IND_ELC',1.19E+00,'');
INSERT INTO "Efficiency" VALUES ('PIE','MAT_WOD','IND_PP_PUL_KRF_N',2030,'IND_ELC',1.19E+00,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_PP_PH','IND_PP_PUL_KRF_N',2030,'IND_PP_PUC',1.19E+00,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_PP_MD','IND_PP_PUL_KRF_N',2030,'IND_PP_PUC',1.19E+00,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_PP_SB','IND_PP_PUL_KRF_N',2030,'IND_PP_PUC',1.19E+00,'');
INSERT INTO "Efficiency" VALUES ('PIE','MAT_WOD','IND_PP_PUL_KRF_N',2030,'IND_PP_PUC',1.19E+00,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_PP_PH','IND_PP_PUL_SUL_N',2012,'MAT_BSW',8.60E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_PP_MD','IND_PP_PUL_SUL_N',2012,'MAT_BSW',8.60E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_PP_SB','IND_PP_PUL_SUL_N',2012,'MAT_BSW',8.60E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','MAT_WOD','IND_PP_PUL_SUL_N',2012,'MAT_BSW',8.60E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_PP_PH','IND_PP_PUL_SUL_N',2012,'IND_ELC',8.60E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_PP_MD','IND_PP_PUL_SUL_N',2012,'IND_ELC',8.60E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_PP_SB','IND_PP_PUL_SUL_N',2012,'IND_ELC',8.60E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','MAT_WOD','IND_PP_PUL_SUL_N',2012,'IND_ELC',8.60E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_PP_PH','IND_PP_PUL_SUL_N',2012,'IND_PP_PUC',8.60E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_PP_MD','IND_PP_PUL_SUL_N',2012,'IND_PP_PUC',8.60E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_PP_SB','IND_PP_PUL_SUL_N',2012,'IND_PP_PUC',8.60E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','MAT_WOD','IND_PP_PUL_SUL_N',2012,'IND_PP_PUC',8.60E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_PP_PH','IND_PP_PUL_SUL_N',2030,'MAT_BSW',9.40E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_PP_MD','IND_PP_PUL_SUL_N',2030,'MAT_BSW',9.40E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_PP_SB','IND_PP_PUL_SUL_N',2030,'MAT_BSW',9.40E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','MAT_WOD','IND_PP_PUL_SUL_N',2030,'MAT_BSW',9.40E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_PP_PH','IND_PP_PUL_SUL_N',2030,'IND_ELC',9.40E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_PP_MD','IND_PP_PUL_SUL_N',2030,'IND_ELC',9.40E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_PP_SB','IND_PP_PUL_SUL_N',2030,'IND_ELC',9.40E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','MAT_WOD','IND_PP_PUL_SUL_N',2030,'IND_ELC',9.40E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_PP_PH','IND_PP_PUL_SUL_N',2030,'IND_PP_PUC',9.40E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_PP_MD','IND_PP_PUL_SUL_N',2030,'IND_PP_PUC',9.40E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_PP_SB','IND_PP_PUL_SUL_N',2030,'IND_PP_PUC',9.40E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','MAT_WOD','IND_PP_PUL_SUL_N',2030,'IND_PP_PUC',9.40E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_PP_MD','IND_PP_PUL_MEC_N',2012,'IND_PP_PUM',3.99E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','MAT_WOD','IND_PP_PUL_MEC_N',2012,'IND_PP_PUM',3.99E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_PP_MD','IND_PP_PUL_MEC_N',2012,'IND_PP_SB',3.99E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','MAT_WOD','IND_PP_PUL_MEC_N',2012,'IND_PP_SB',3.99E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_PP_MD','IND_PP_PUL_MEC_N',2030,'IND_PP_PUM',8.60E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','MAT_WOD','IND_PP_PUL_MEC_N',2030,'IND_PP_PUM',8.60E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_PP_MD','IND_PP_PUL_MEC_N',2030,'IND_PP_SB',8.60E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','MAT_WOD','IND_PP_PUL_MEC_N',2030,'IND_PP_SB',8.60E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_PP_MD','IND_PP_PUL_SCH_N',2012,'IND_PP_PUM',1.96E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_PP_SB','IND_PP_PUL_SCH_N',2012,'IND_PP_PUM',1.96E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','MAT_WOD','IND_PP_PUL_SCH_N',2012,'IND_PP_PUM',1.96E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_PP_MD','IND_PP_PUL_SCH_N',2030,'IND_PP_PUM',2.12E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_PP_SB','IND_PP_PUL_SCH_N',2030,'IND_PP_PUM',2.12E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','MAT_WOD','IND_PP_PUL_SCH_N',2030,'IND_PP_PUM',2.12E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_PP_MD','IND_PP_PUL_REC_N',2012,'IND_PP_PUR',7.69E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_PP_SB','IND_PP_PUL_REC_N',2012,'IND_PP_PUR',7.69E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_PP_MD','IND_PP_PUL_REC_N',2030,'IND_PP_PUR',8.55E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_PP_SB','IND_PP_PUL_REC_N',2030,'IND_PP_PUR',8.55E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_PP_PUL','IND_PP_PAP_N',2012,'IND_PP_PAP',1.39E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_PP_MD','IND_PP_PAP_N',2012,'IND_PP_PAP',1.39E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_PP_SB','IND_PP_PAP_N',2012,'IND_PP_PAP',1.39E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_PP_PUL','IND_PP_PAP_N',2030,'IND_PP_PAP',1.55E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_PP_MD','IND_PP_PAP_N',2030,'IND_PP_PAP',1.55E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_PP_SB','IND_PP_PAP_N',2030,'IND_PP_PAP',1.55E-01,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_HFO','IND_PP_PH_HFO_N',2012,'IND_PP_PH',0.91,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_HFO','IND_PP_PH_HFO_N',2030,'IND_PP_PH',0.98,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_NGA','IND_PP_PH_NGA_N',2012,'IND_PP_PH',0.89,'');
INSERT INTO "Efficiency" VALUES ('PIE','IND_NGA','IND_PP_PH_NGA_N',2050,'IND_PP_PH',0.95,'');
-- Other industries
INSERT INTO "Efficiency" VALUES ('PIE','IND_ELC','IND_OTH_OTH_ELC_N',2012,'IND_OTH_OTH',1.01,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','IND_ELC','IND_OTH_OTH_ELC_N',2015,'IND_OTH_OTH',1.03,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','IND_ELC','IND_OTH_OTH_ELC_N',2025,'IND_OTH_OTH',1.05,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','IND_ELC','IND_OTH_OTH_ELC_N',2050,'IND_OTH_OTH',1.08,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','IND_OIL','IND_OTH_PH_DST_N',2012,'IND_OTH_PH',1.00,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','IND_HFO','IND_OTH_PH_HFO_N',2012,'IND_OTH_PH',1.01,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','IND_HFO','IND_OTH_PH_HFO_N',2040,'IND_OTH_PH',1.01,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','IND_HFO','IND_OTH_PH_HFO_N',2050,'IND_OTH_PH',1.08,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','IND_LPG','IND_OTH_PH_LPG_N',2012,'IND_OTH_PH',1.00,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','IND_LPG','IND_OTH_PH_LPG_N',2050,'IND_OTH_PH',1.02,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','IND_NGA','IND_OTH_PH_NGA_N',2012,'IND_OTH_PH',1.00,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','IND_NGA','IND_OTH_PH_NGA_N',2025,'IND_OTH_PH',1.08,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','IND_NGA','IND_OTH_PH_NGA_N',2030,'IND_OTH_PH',1.15,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','IND_NGA','IND_OTH_PH_NGA_N',2050,'IND_OTH_PH',1.20,'PJ/PJ');
-- Micro-CHP
INSERT INTO "Efficiency" VALUES ('PIE','ELC_NGA','IND_CHP_NGA_CI_N',2012,'ELC_DST',0.800,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_NGA','IND_CHP_NGA_CI_N',2014,'ELC_DST',0.825,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_NGA','IND_CHP_NGA_CI_N',2025,'ELC_DST',0.860,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_NGA','IND_CHP_NGA_CI_N',2030,'ELC_DST',0.880,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_NGA','IND_CHP_NGA_CI_N',2050,'ELC_DST',0.907,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_NGA','IND_CHP_NGA_TG_N',2012,'ELC_DST',0.740,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_NGA','IND_CHP_NGA_TG_N',2014,'ELC_DST',0.750,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_NGA','IND_CHP_NGA_TG_N',2025,'ELC_DST',0.750,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_NGA','IND_CHP_NGA_TG_N',2030,'ELC_DST',0.800,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_NGA','IND_CHP_NGA_TV_N',2012,'ELC_DST',0.750,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_NGA','IND_CHP_NGA_TV_N',2014,'ELC_DST',0.760,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_NGA','IND_CHP_NGA_TV_N',2025,'ELC_DST',0.774,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_NGA','IND_CHP_NGA_TV_N',2030,'ELC_DST',0.790,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_BLQ','IND_CHP_BLQ_CI_N',2014,'ELC_DST',0.845,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_BLQ','IND_CHP_BLQ_CI_N',2025,'ELC_DST',0.905,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_BLQ','IND_CHP_BLQ_CI_N',2030,'ELC_DST',0.923,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_BLQ','IND_CHP_BLQ_CI_N',2050,'ELC_DST',0.931,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_NGA','IND_CHP_NGA_CI_N',2012,'IND_HET',0.800,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_NGA','IND_CHP_NGA_CI_N',2014,'IND_HET',0.825,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_NGA','IND_CHP_NGA_CI_N',2025,'IND_HET',0.860,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_NGA','IND_CHP_NGA_CI_N',2030,'IND_HET',0.880,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_NGA','IND_CHP_NGA_CI_N',2050,'IND_HET',0.907,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_NGA','IND_CHP_NGA_TG_N',2012,'IND_HET',0.740,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_NGA','IND_CHP_NGA_TG_N',2014,'IND_HET',0.750,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_NGA','IND_CHP_NGA_TG_N',2025,'IND_HET',0.750,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_NGA','IND_CHP_NGA_TG_N',2030,'IND_HET',0.800,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_NGA','IND_CHP_NGA_TV_N',2012,'IND_HET',0.750,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_NGA','IND_CHP_NGA_TV_N',2014,'IND_HET',0.760,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_NGA','IND_CHP_NGA_TV_N',2025,'IND_HET',0.774,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_NGA','IND_CHP_NGA_TV_N',2030,'IND_HET',0.790,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_BLQ','IND_CHP_BLQ_CI_N',2014,'IND_HET',0.845,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_BLQ','IND_CHP_BLQ_CI_N',2025,'IND_HET',0.905,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_BLQ','IND_CHP_BLQ_CI_N',2030,'IND_HET',0.923,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_BLQ','IND_CHP_BLQ_CI_N',2050,'IND_HET',0.931,'PJ/PJ');
-- Upstream sector
INSERT INTO "Efficiency" VALUES ('PIE','MAT_BSW','UPS_FT_BIO_REC_N',2012,'BIO_BIN',1.00,'');


-- Dummy - to account for energy-water demand, Temporary
INSERT INTO "Efficiency" VALUES ('PIE','IND_ELC','DMY_WAT_TECH',2011,'DMY_WAT_OUT',1.00,'');

-- Hydrogen
INSERT INTO "Efficiency" VALUES ('PIE','ELC_CEN','H2_SMR_CL',2020,'H2_CU',0.7462,'');
INSERT INTO "Efficiency" VALUES ('PIE','GAS_NGA','H2_SMR_CL',2020,'H2_CU',0.7462,'');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_CEN','H2_SMR_CL',2025,'H2_CU',0.7462,'');
INSERT INTO "Efficiency" VALUES ('PIE','GAS_NGA','H2_SMR_CL',2025,'H2_CU',0.7462,'');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_CEN','H2_SMR_CL',2030,'H2_CU',0.7874,'');
INSERT INTO "Efficiency" VALUES ('PIE','GAS_NGA','H2_SMR_CL',2030,'H2_CU',0.7874,'');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_CEN','H2_SMR_CS',2020,'H2_CT',0.6211,'');
INSERT INTO "Efficiency" VALUES ('PIE','GAS_NGA','H2_SMR_CS',2020,'H2_CT',0.6211,'');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_CEN','H2_SMR_CS',2025,'H2_CT',0.6211,'');
INSERT INTO "Efficiency" VALUES ('PIE','GAS_NGA','H2_SMR_CS',2025,'H2_CT',0.6211,'');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_CEN','H2_SMR_CS',2030,'H2_CT',0.6667,'');
INSERT INTO "Efficiency" VALUES ('PIE','GAS_NGA','H2_SMR_CS',2030,'H2_CT',0.6667,'');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_DST','H2_SMR_DS',2025,'H2_DT',0.5319,'');
INSERT INTO "Efficiency" VALUES ('PIE','GAS_NGA','H2_SMR_DS',2025,'H2_DT',0.5319,'');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_DST','H2_SMR_DS',2030,'H2_DT',0.625,'');
INSERT INTO "Efficiency" VALUES ('PIE','GAS_NGA','H2_SMR_DS',2030,'H2_DT',0.625,'');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_CEN','H2_HOPO',2020,'H2_CT',0.7353,'');
INSERT INTO "Efficiency" VALUES ('PIE','OIL_HFO','H2_HOPO',2020,'H2_CT',0.7353,'');

INSERT INTO "Efficiency" VALUES ('PIE','ELC_CEN','H2_TRA_FT_GC1',2020,'TRA_H2G',0.7916,'');
INSERT INTO "Efficiency" VALUES ('PIE','H2_CU','H2_TRA_FT_GC1',2020,'TRA_H2G',0.7916,'');
INSERT INTO "Efficiency" VALUES ('PIE','TRA_GSL','H2_TRA_FT_GC1',2020,'TRA_H2G',0.7916,'');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_CEN','H2_TRA_FT_GC2',2020,'TRA_H2G',0.7916,'');
INSERT INTO "Efficiency" VALUES ('PIE','H2_CT','H2_TRA_FT_GC2',2020,'TRA_H2G',0.7916,'');
INSERT INTO "Efficiency" VALUES ('PIE','TRA_GSL','H2_TRA_FT_GC2',2020,'TRA_H2G',0.7916,'');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_CEN','H2_TRA_FT_GC3',2020,'TRA_H2G',0.9173,'');
INSERT INTO "Efficiency" VALUES ('PIE','H2_CT','H2_TRA_FT_GC3',2020,'TRA_H2G',0.9173,'');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_CEN','H2_TRA_FT_GC4',2020,'TRA_H2G',0.9291,'');
INSERT INTO "Efficiency" VALUES ('PIE','H2_CU','H2_TRA_FT_GC4',2020,'TRA_H2G',0.9291,'');
INSERT INTO "Efficiency" VALUES ('PIE','TRA_GSL','H2_TRA_FT_GC4',2020,'TRA_H2G',0.9291,'');
INSERT INTO "Efficiency" VALUES ('PIE','ELC_CEN','H2_TRA_FT_GC5',2020,'TRA_H2G',0.9173,'');
INSERT INTO "Efficiency" VALUES ('PIE','H2_CU','H2_TRA_FT_GC5',2020,'TRA_H2G',0.9173,'');

CREATE TABLE "DiscountRate" (
   "regions"  text,
   "tech" text,
   "vintage"  integer,
   "tech_rate"    real,
   "tech_rate_notes"  text,
   primary key("regions","tech","vintage"),
   foreign key("tech") references "technologies"("tech"),
   foreign key("vintage") references "time_periods"("t_periods")
);
-- Electricity sector
-- New technologies
INSERT INTO "DiscountRate" VALUES ('PIE','ELC_NGA_TURB_L80MW_N',2012,0.10,'');
INSERT INTO "DiscountRate" VALUES ('PIE','ELC_BLQ_N',2015,0.10,'');
INSERT INTO "DiscountRate" VALUES ('PIE','ELC_BIO_5C_N',2012,0.10,'');
INSERT INTO "DiscountRate" VALUES ('PIE','ELC_CHP_BMU_N',2012,0.10,'');
INSERT INTO "DiscountRate" VALUES ('PIE','ELC_CHP_NGA_TURB_N',2012,0.10,'');
INSERT INTO "DiscountRate" VALUES ('PIE','ELC_CHP_NGA_CC_N',2012,0.10,'');
INSERT INTO "DiscountRate" VALUES ('PIE','ELC_CHP_NGA_CP_N',2012,0.10,'');
INSERT INTO "DiscountRate" VALUES ('PIE','ELC_CHP_NGA_TAP_N',2012,0.10,'');
INSERT INTO "DiscountRate" VALUES ('PIE','ELC_WIN_N',2012,0.076,'');
INSERT INTO "DiscountRate" VALUES ('PIE','ELC_PV_GRO_N',2012,0.057,'');
INSERT INTO "DiscountRate" VALUES ('PIE','ELC_PV_ROOF_N',2012,0.057,'');

-- Hydrogen
INSERT INTO "DiscountRate" VALUES ('PIE','H2_SMR_CL',2020,0.080,'');
INSERT INTO "DiscountRate" VALUES ('PIE','H2_SMR_CS',2020,0.080,'');
INSERT INTO "DiscountRate" VALUES ('PIE','H2_SMR_DS',2025,0.080,'');
INSERT INTO "DiscountRate" VALUES ('PIE','H2_HOPO',2020,0.080,'');

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

CREATE TABLE "Driver" (
    "regions"       text,
    "periods"      integer,
   "driver_name"  text,
   "driver"        real,
   "driver_notes"  text,
   primary key("regions", "periods", "driver_name"),
   foreign key("regions") references "regions"("regions"),
   foreign key("periods") references "time_periods"("t_periods")
);
-- Population
INSERT INTO "Driver" VALUES ('PIE',2011,'POP',1.000,'');
INSERT INTO "Driver" VALUES ('PIE',2012,'POP',1.002,'');
INSERT INTO "Driver" VALUES ('PIE',2013,'POP',1.017,'');
INSERT INTO "Driver" VALUES ('PIE',2014,'POP',1.014,'');
INSERT INTO "Driver" VALUES ('PIE',2015,'POP',1.009,'');
INSERT INTO "Driver" VALUES ('PIE',2017,'POP',1.003,'');
INSERT INTO "Driver" VALUES ('PIE',2019,'POP',0.988,'');
INSERT INTO "Driver" VALUES ('PIE',2020,'POP',0.988,'');
INSERT INTO "Driver" VALUES ('PIE',2021,'POP',0.980,'');
INSERT INTO "Driver" VALUES ('PIE',2023,'POP',0.992,'');
INSERT INTO "Driver" VALUES ('PIE',2025,'POP',0.965,'');
INSERT INTO "Driver" VALUES ('PIE',2030,'POP',0.948,'');
INSERT INTO "Driver" VALUES ('PIE',2035,'POP',0.932,'');
INSERT INTO "Driver" VALUES ('PIE',2040,'POP',0.916,'');
INSERT INTO "Driver" VALUES ('PIE',2050,'POP',0.877,'');
-- GDP
INSERT INTO "Driver" VALUES ('PIE',2011,'GDP',1.000,'');
INSERT INTO "Driver" VALUES ('PIE',2012,'GDP',0.987,'');
INSERT INTO "Driver" VALUES ('PIE',2013,'GDP',1.105,'');
INSERT INTO "Driver" VALUES ('PIE',2014,'GDP',1.104,'');
INSERT INTO "Driver" VALUES ('PIE',2015,'GDP',1.126,'');
INSERT INTO "Driver" VALUES ('PIE',2017,'GDP',1.193,'');
INSERT INTO "Driver" VALUES ('PIE',2019,'GDP',1.223,'');
INSERT INTO "Driver" VALUES ('PIE',2020,'GDP',1.120,'');
INSERT INTO "Driver" VALUES ('PIE',2021,'GDP',1.210,'');
INSERT INTO "Driver" VALUES ('PIE',2023,'GDP',1.288,'');
INSERT INTO "Driver" VALUES ('PIE',2025,'GDP',1.326,'');
INSERT INTO "Driver" VALUES ('PIE',2030,'GDP',1.342,'');
INSERT INTO "Driver" VALUES ('PIE',2035,'GDP',1.362,'');
INSERT INTO "Driver" VALUES ('PIE',2040,'GDP',1.383,'');
INSERT INTO "Driver" VALUES ('PIE',2050,'GDP',1.408,'');
-- GDP per Capita
INSERT INTO "Driver" VALUES ('PIE',2011,'GDPP',1.000,'');
INSERT INTO "Driver" VALUES ('PIE',2012,'GDPP',0.985,'');
INSERT INTO "Driver" VALUES ('PIE',2013,'GDPP',1.087,'');
INSERT INTO "Driver" VALUES ('PIE',2014,'GDPP',1.089,'');
INSERT INTO "Driver" VALUES ('PIE',2015,'GDPP',1.116,'');
INSERT INTO "Driver" VALUES ('PIE',2017,'GDPP',1.190,'');
INSERT INTO "Driver" VALUES ('PIE',2019,'GDPP',1.238,'');
INSERT INTO "Driver" VALUES ('PIE',2020,'GDPP',1.143,'');
INSERT INTO "Driver" VALUES ('PIE',2021,'GDPP',1.235,'');
INSERT INTO "Driver" VALUES ('PIE',2023,'GDPP',1.299,'');
INSERT INTO "Driver" VALUES ('PIE',2025,'GDPP',1.345,'');
INSERT INTO "Driver" VALUES ('PIE',2030,'GDPP',1.376,'');
INSERT INTO "Driver" VALUES ('PIE',2035,'GDPP',1.420,'');
INSERT INTO "Driver" VALUES ('PIE',2040,'GDPP',1.439,'');
INSERT INTO "Driver" VALUES ('PIE',2050,'GDPP',1.548,'');

-- Value added service sector
INSERT INTO "Driver" VALUES ('PIE',2011,'PSER',1.000,'');
INSERT INTO "Driver" VALUES ('PIE',2012,'PSER',0.960,'');
INSERT INTO "Driver" VALUES ('PIE',2013,'PSER',0.970,'');
INSERT INTO "Driver" VALUES ('PIE',2014,'PSER',0.968,'');
INSERT INTO "Driver" VALUES ('PIE',2015,'PSER',0.975,'');
INSERT INTO "Driver" VALUES ('PIE',2017,'PSER',1.005,'');
INSERT INTO "Driver" VALUES ('PIE',2019,'PSER',1.013,'');
INSERT INTO "Driver" VALUES ('PIE',2020,'PSER',0.923,'');
INSERT INTO "Driver" VALUES ('PIE',2021,'PSER',1.068,'');
INSERT INTO "Driver" VALUES ('PIE',2023,'PSER',1.096,'');
INSERT INTO "Driver" VALUES ('PIE',2025,'PSER',1.140,'');
INSERT INTO "Driver" VALUES ('PIE',2030,'PSER',1.218,'');
INSERT INTO "Driver" VALUES ('PIE',2035,'PSER',1.370,'');
INSERT INTO "Driver" VALUES ('PIE',2040,'PSER',1.542,'');
INSERT INTO "Driver" VALUES ('PIE',2050,'PSER',1.732,'');
-- Value added agriculture sector
INSERT INTO "Driver" VALUES ('PIE',2011,'PAGR',1.000,'');
INSERT INTO "Driver" VALUES ('PIE',2012,'PAGR',1.019,'');
INSERT INTO "Driver" VALUES ('PIE',2013,'PAGR',1.044,'');
INSERT INTO "Driver" VALUES ('PIE',2014,'PAGR',1.060,'');
INSERT INTO "Driver" VALUES ('PIE',2015,'PAGR',1.054,'');
INSERT INTO "Driver" VALUES ('PIE',2017,'PAGR',1.019,'');
INSERT INTO "Driver" VALUES ('PIE',2019,'PAGR',1.010,'');
INSERT INTO "Driver" VALUES ('PIE',2020,'PAGR',0.939,'');
INSERT INTO "Driver" VALUES ('PIE',2021,'PAGR',0.886,'');
INSERT INTO "Driver" VALUES ('PIE',2023,'PAGR',0.900,'');
INSERT INTO "Driver" VALUES ('PIE',2025,'PAGR',0.914,'');
INSERT INTO "Driver" VALUES ('PIE',2030,'PAGR',0.936,'');
INSERT INTO "Driver" VALUES ('PIE',2035,'PAGR',0.973,'');
INSERT INTO "Driver" VALUES ('PIE',2040,'PAGR',1.051,'');
INSERT INTO "Driver" VALUES ('PIE',2050,'PAGR',1.136,'');

-- Industrial Sector
-- Pandemic
INSERT INTO "Driver" VALUES ('PIE',2011,'PCHEM',1.000,'');
INSERT INTO "Driver" VALUES ('PIE',2012,'PCHEM',0.984,'');
INSERT INTO "Driver" VALUES ('PIE',2013,'PCHEM',0.989,'');
INSERT INTO "Driver" VALUES ('PIE',2014,'PCHEM',0.994,'');
INSERT INTO "Driver" VALUES ('PIE',2015,'PCHEM',1.049,'');
INSERT INTO "Driver" VALUES ('PIE',2017,'PCHEM',1.081,'');
INSERT INTO "Driver" VALUES ('PIE',2019,'PCHEM',1.098,'');
INSERT INTO "Driver" VALUES ('PIE',2020,'PCHEM',1.105,'');
INSERT INTO "Driver" VALUES ('PIE',2021,'PCHEM',1.113,'');
INSERT INTO "Driver" VALUES ('PIE',2023,'PCHEM',1.128,'');
INSERT INTO "Driver" VALUES ('PIE',2025,'PCHEM',1.143,'');
INSERT INTO "Driver" VALUES ('PIE',2030,'PCHEM',1.159,'');
INSERT INTO "Driver" VALUES ('PIE',2035,'PCHEM',1.192,'');
INSERT INTO "Driver" VALUES ('PIE',2040,'PCHEM',1.264,'');
INSERT INTO "Driver" VALUES ('PIE',2050,'PCHEM',1.346,'');
INSERT INTO "Driver" VALUES ('PIE',2011,'PISNF',1.000,'');
INSERT INTO "Driver" VALUES ('PIE',2012,'PISNF',0.929,'');
INSERT INTO "Driver" VALUES ('PIE',2013,'PISNF',0.942,'');
INSERT INTO "Driver" VALUES ('PIE',2014,'PISNF',0.955,'');
INSERT INTO "Driver" VALUES ('PIE',2015,'PISNF',1.003,'');
INSERT INTO "Driver" VALUES ('PIE',2017,'PISNF',1.013,'');
INSERT INTO "Driver" VALUES ('PIE',2019,'PISNF',1.018,'');
INSERT INTO "Driver" VALUES ('PIE',2020,'PISNF',0.983,'');
INSERT INTO "Driver" VALUES ('PIE',2021,'PISNF',0.948,'');
INSERT INTO "Driver" VALUES ('PIE',2023,'PISNF',0.968,'');
INSERT INTO "Driver" VALUES ('PIE',2025,'PISNF',0.987,'');
INSERT INTO "Driver" VALUES ('PIE',2030,'PISNF',0.990,'');
INSERT INTO "Driver" VALUES ('PIE',2035,'PISNF',0.995,'');
INSERT INTO "Driver" VALUES ('PIE',2040,'PISNF',1.022,'');
INSERT INTO "Driver" VALUES ('PIE',2050,'PISNF',1.059,'');
INSERT INTO "Driver" VALUES ('PIE',2011,'PIS',1.000,'');
INSERT INTO "Driver" VALUES ('PIE',2012,'PIS',0.964,'');
INSERT INTO "Driver" VALUES ('PIE',2013,'PIS',0.955,'');
INSERT INTO "Driver" VALUES ('PIE',2014,'PIS',0.946,'');
INSERT INTO "Driver" VALUES ('PIE',2015,'PIS',0.973,'');
INSERT INTO "Driver" VALUES ('PIE',2017,'PIS',0.980,'');
INSERT INTO "Driver" VALUES ('PIE',2019,'PIS',0.983,'');
INSERT INTO "Driver" VALUES ('PIE',2020,'PIS',0.939,'');
INSERT INTO "Driver" VALUES ('PIE',2021,'PIS',0.895,'');
INSERT INTO "Driver" VALUES ('PIE',2023,'PIS',0.923,'');
INSERT INTO "Driver" VALUES ('PIE',2025,'PIS',0.952,'');
INSERT INTO "Driver" VALUES ('PIE',2030,'PIS',0.952,'');
INSERT INTO "Driver" VALUES ('PIE',2035,'PIS',0.954,'');
INSERT INTO "Driver" VALUES ('PIE',2040,'PIS',0.963,'');
INSERT INTO "Driver" VALUES ('PIE',2050,'PIS',0.982,'');
INSERT INTO "Driver" VALUES ('PIE',2011,'PNM',1.000,'');
INSERT INTO "Driver" VALUES ('PIE',2012,'PNM',0.943,'');
INSERT INTO "Driver" VALUES ('PIE',2013,'PNM',0.940,'');
INSERT INTO "Driver" VALUES ('PIE',2014,'PNM',0.937,'');
INSERT INTO "Driver" VALUES ('PIE',2015,'PNM',0.990,'');
INSERT INTO "Driver" VALUES ('PIE',2017,'PNM',0.981,'');
INSERT INTO "Driver" VALUES ('PIE',2019,'PNM',0.977,'');
INSERT INTO "Driver" VALUES ('PIE',2020,'PNM',0.932,'');
INSERT INTO "Driver" VALUES ('PIE',2021,'PNM',0.888,'');
INSERT INTO "Driver" VALUES ('PIE',2023,'PNM',0.909,'');
INSERT INTO "Driver" VALUES ('PIE',2025,'PNM',0.930,'');
INSERT INTO "Driver" VALUES ('PIE',2030,'PNM',0.939,'');
INSERT INTO "Driver" VALUES ('PIE',2035,'PNM',0.956,'');
INSERT INTO "Driver" VALUES ('PIE',2040,'PNM',1.012,'');
INSERT INTO "Driver" VALUES ('PIE',2050,'PNM',1.063,'');
INSERT INTO "Driver" VALUES ('PIE',2011,'PLP',1.000,'');
INSERT INTO "Driver" VALUES ('PIE',2012,'PLP',0.980,'');
INSERT INTO "Driver" VALUES ('PIE',2013,'PLP',0.995,'');
INSERT INTO "Driver" VALUES ('PIE',2014,'PLP',1.010,'');
INSERT INTO "Driver" VALUES ('PIE',2015,'PLP',1.044,'');
INSERT INTO "Driver" VALUES ('PIE',2017,'PLP',1.014,'');
INSERT INTO "Driver" VALUES ('PIE',2019,'PLP',0.999,'');
INSERT INTO "Driver" VALUES ('PIE',2020,'PLP',0.995,'');
INSERT INTO "Driver" VALUES ('PIE',2021,'PLP',0.991,'');
INSERT INTO "Driver" VALUES ('PIE',2023,'PLP',1.003,'');
INSERT INTO "Driver" VALUES ('PIE',2025,'PLP',1.014,'');
INSERT INTO "Driver" VALUES ('PIE',2030,'PLP',1.016,'');
INSERT INTO "Driver" VALUES ('PIE',2035,'PLP',1.018,'');
INSERT INTO "Driver" VALUES ('PIE',2040,'PLP',1.041,'');
INSERT INTO "Driver" VALUES ('PIE',2050,'PLP',1.099,'');
INSERT INTO "Driver" VALUES ('PIE',2011,'POI',1.000,'');
INSERT INTO "Driver" VALUES ('PIE',2012,'POI',0.961,'');
INSERT INTO "Driver" VALUES ('PIE',2013,'POI',0.956,'');
INSERT INTO "Driver" VALUES ('PIE',2014,'POI',0.951,'');
INSERT INTO "Driver" VALUES ('PIE',2015,'POI',0.990,'');
INSERT INTO "Driver" VALUES ('PIE',2017,'POI',1.008,'');
INSERT INTO "Driver" VALUES ('PIE',2019,'POI',1.017,'');
INSERT INTO "Driver" VALUES ('PIE',2020,'POI',0.973,'');
INSERT INTO "Driver" VALUES ('PIE',2021,'POI',0.928,'');
INSERT INTO "Driver" VALUES ('PIE',2023,'POI',0.951,'');
INSERT INTO "Driver" VALUES ('PIE',2025,'POI',0.974,'');
INSERT INTO "Driver" VALUES ('PIE',2030,'POI',0.980,'');
INSERT INTO "Driver" VALUES ('PIE',2035,'POI',0.991,'');
INSERT INTO "Driver" VALUES ('PIE',2040,'POI',1.017,'');
INSERT INTO "Driver" VALUES ('PIE',2050,'POI',1.041,'');


CREATE TABLE "Allocation" (
    "regions"       text,
   "demand_comm"  text,
   "driver_name"  text,
   "allocation_notes"  text,
   primary key("regions", "demand_comm", "driver_name"),
   foreign key("regions") references "regions"("regions"),
   foreign key("demand_comm") references "commodities"("comm_name"),
   foreign key("driver_name") references "Driver"("driver_name")
);
---- Fictitious demands
INSERT INTO "Allocation" VALUES ('PIE','IND_OIL_FICT','GDP','');
-- Transport sector
INSERT INTO "Allocation" VALUES ('PIE','TRA_OTH','GDP','');
INSERT INTO "Allocation" VALUES ('PIE','TRA_AVI','GDP','');
INSERT INTO "Allocation" VALUES ('PIE','TRA_ROA_BUS','GDP','');
INSERT INTO "Allocation" VALUES ('PIE','TRA_ROA_LCV','GDP','');
INSERT INTO "Allocation" VALUES ('PIE','TRA_ROA_HTR','GDP','');
INSERT INTO "Allocation" VALUES ('PIE','TRA_ROA_MTR','GDP','');
INSERT INTO "Allocation" VALUES ('PIE','TRA_ROA_CAR','GDP','');
INSERT INTO "Allocation" VALUES ('PIE','TRA_ROA_2WH','GDP','');
INSERT INTO "Allocation" VALUES ('PIE','TRA_RAIL','GDP','');
--Residential Sector
INSERT INTO "Allocation" VALUES ('PIE','RES_CD','POP','');
INSERT INTO "Allocation" VALUES ('PIE','RES_CK','POP','');
INSERT INTO "Allocation" VALUES ('PIE','RES_CW','POP','');
INSERT INTO "Allocation" VALUES ('PIE','RES_DW','POP','');
INSERT INTO "Allocation" VALUES ('PIE','RES_LG','POP','');
INSERT INTO "Allocation" VALUES ('PIE','RES_OE','POP','');
INSERT INTO "Allocation" VALUES ('PIE','RES_RF','POP','');
INSERT INTO "Allocation" VALUES ('PIE','RES_SC','POP','');
INSERT INTO "Allocation" VALUES ('PIE','RES_SH_HC','POP','');
INSERT INTO "Allocation" VALUES ('PIE','RES_SH_MC','POP','');
INSERT INTO "Allocation" VALUES ('PIE','RES_SH_LC','POP','');
INSERT INTO "Allocation" VALUES ('PIE','RES_WH','POP','');

-- Commercial Sector
INSERT INTO "Allocation" VALUES ('PIE','COM_SC','PSER','');
INSERT INTO "Allocation" VALUES ('PIE','COM_CK','PSER','');
INSERT INTO "Allocation" VALUES ('PIE','COM_SH','PSER','');
INSERT INTO "Allocation" VALUES ('PIE','COM_WH','PSER','');
INSERT INTO "Allocation" VALUES ('PIE','COM_LG','PSER','');
INSERT INTO "Allocation" VALUES ('PIE','COM_OE','PSER','');
INSERT INTO "Allocation" VALUES ('PIE','COM_RF','PSER','');
-- Agriculture Sector
INSERT INTO "Allocation" VALUES ('PIE','AGR_DEM','PAGR','');
-- Industrial Sector
INSERT INTO "Allocation" VALUES ('PIE','IND_CH','PCHEM','');
INSERT INTO "Allocation" VALUES ('PIE','IND_IS','PIS','');
INSERT INTO "Allocation" VALUES ('PIE','IND_PP','PLP','');
INSERT INTO "Allocation" VALUES ('PIE','IND_NF','PISNF','');
INSERT INTO "Allocation" VALUES ('PIE','IND_NM','PNM','');
INSERT INTO "Allocation" VALUES ('PIE','IND_OTH','POI','');
INSERT INTO "Allocation" VALUES ('PIE','IND_OTH_NEU','GDP','');
INSERT INTO "Allocation" VALUES ('PIE','IND_OTH_NSP','GDP','');
-- Dummy to account for energy-water demand, Temporary
INSERT INTO "Allocation" VALUES ('PIE','DMY_WAT_OUT','GDP','');

CREATE TABLE "Elasticity" (
    "regions"       text,
    "periods"      integer,
   "demand_comm"  text,
   "elasticity"    real,
   "elaticity_notes"  text,
   primary key("regions", "periods", "demand_comm"),
   foreign key("regions") references "regions"("regions"),
   foreign key("periods") references "time_periods"("t_periods"),
   foreign key("demand_comm") references "commodities"("comm_name")
);
---- Fictitious demands
-- Transport sector
INSERT INTO "Elasticity" VALUES ('PIE',2012,'TRA_AVI',0.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2013,'TRA_AVI',0.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2014,'TRA_AVI',0.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2015,'TRA_AVI',0.75,'');
INSERT INTO "Elasticity" VALUES ('PIE',2017,'TRA_AVI',1.50,'');
INSERT INTO "Elasticity" VALUES ('PIE',2019,'TRA_AVI',1.50,'');
INSERT INTO "Elasticity" VALUES ('PIE',2020,'TRA_AVI',1.50,'');
INSERT INTO "Elasticity" VALUES ('PIE',2021,'TRA_AVI',1.35,'');
INSERT INTO "Elasticity" VALUES ('PIE',2023,'TRA_AVI',1.20,'');
INSERT INTO "Elasticity" VALUES ('PIE',2025,'TRA_AVI',1.20,'');
INSERT INTO "Elasticity" VALUES ('PIE',2030,'TRA_AVI',1.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2035,'TRA_AVI',1.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2040,'TRA_AVI',1.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2050,'TRA_AVI',1.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2012,'TRA_ROA_BUS',1.20,'');
INSERT INTO "Elasticity" VALUES ('PIE',2013,'TRA_ROA_BUS',1.20,'');
INSERT INTO "Elasticity" VALUES ('PIE',2014,'TRA_ROA_BUS',1.20,'');
INSERT INTO "Elasticity" VALUES ('PIE',2015,'TRA_ROA_BUS',1.20,'');
INSERT INTO "Elasticity" VALUES ('PIE',2017,'TRA_ROA_BUS',1.10,'');
INSERT INTO "Elasticity" VALUES ('PIE',2019,'TRA_ROA_BUS',1.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2020,'TRA_ROA_BUS',1.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2021,'TRA_ROA_BUS',0.95,'');
INSERT INTO "Elasticity" VALUES ('PIE',2023,'TRA_ROA_BUS',0.90,'');
INSERT INTO "Elasticity" VALUES ('PIE',2025,'TRA_ROA_BUS',0.90,'');
INSERT INTO "Elasticity" VALUES ('PIE',2030,'TRA_ROA_BUS',0.90,'');
INSERT INTO "Elasticity" VALUES ('PIE',2035,'TRA_ROA_BUS',0.85,'');
INSERT INTO "Elasticity" VALUES ('PIE',2040,'TRA_ROA_BUS',0.80,'');
INSERT INTO "Elasticity" VALUES ('PIE',2050,'TRA_ROA_BUS',0.80,'');
INSERT INTO "Elasticity" VALUES ('PIE',2012,'TRA_ROA_LCV',1.50,'');
INSERT INTO "Elasticity" VALUES ('PIE',2013,'TRA_ROA_LCV',1.50,'');
INSERT INTO "Elasticity" VALUES ('PIE',2014,'TRA_ROA_LCV',1.50,'');
INSERT INTO "Elasticity" VALUES ('PIE',2015,'TRA_ROA_LCV',1.25,'');
INSERT INTO "Elasticity" VALUES ('PIE',2017,'TRA_ROA_LCV',1.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2019,'TRA_ROA_LCV',1.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2020,'TRA_ROA_LCV',1.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2021,'TRA_ROA_LCV',1.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2023,'TRA_ROA_LCV',1.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2025,'TRA_ROA_LCV',1.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2030,'TRA_ROA_LCV',1.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2035,'TRA_ROA_LCV',0.80,'');
INSERT INTO "Elasticity" VALUES ('PIE',2040,'TRA_ROA_LCV',0.80,'');
INSERT INTO "Elasticity" VALUES ('PIE',2050,'TRA_ROA_LCV',0.80,'');
INSERT INTO "Elasticity" VALUES ('PIE',2012,'TRA_ROA_HTR',1.50,'');
INSERT INTO "Elasticity" VALUES ('PIE',2013,'TRA_ROA_HTR',1.50,'');
INSERT INTO "Elasticity" VALUES ('PIE',2014,'TRA_ROA_HTR',1.50,'');
INSERT INTO "Elasticity" VALUES ('PIE',2015,'TRA_ROA_HTR',1.25,'');
INSERT INTO "Elasticity" VALUES ('PIE',2017,'TRA_ROA_HTR',1.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2019,'TRA_ROA_HTR',1.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2020,'TRA_ROA_HTR',1.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2021,'TRA_ROA_HTR',1.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2023,'TRA_ROA_HTR',1.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2025,'TRA_ROA_HTR',1.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2030,'TRA_ROA_HTR',1.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2035,'TRA_ROA_HTR',0.90,'');
INSERT INTO "Elasticity" VALUES ('PIE',2040,'TRA_ROA_HTR',0.80,'');
INSERT INTO "Elasticity" VALUES ('PIE',2050,'TRA_ROA_HTR',0.80,'');
INSERT INTO "Elasticity" VALUES ('PIE',2012,'TRA_ROA_MTR',1.50,'');
INSERT INTO "Elasticity" VALUES ('PIE',2013,'TRA_ROA_MTR',1.50,'');
INSERT INTO "Elasticity" VALUES ('PIE',2014,'TRA_ROA_MTR',1.50,'');
INSERT INTO "Elasticity" VALUES ('PIE',2015,'TRA_ROA_MTR',1.25,'');
INSERT INTO "Elasticity" VALUES ('PIE',2017,'TRA_ROA_MTR',1.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2019,'TRA_ROA_MTR',1.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2020,'TRA_ROA_MTR',1.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2021,'TRA_ROA_MTR',1.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2023,'TRA_ROA_MTR',1.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2025,'TRA_ROA_MTR',1.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2030,'TRA_ROA_MTR',1.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2035,'TRA_ROA_MTR',0.90,'');
INSERT INTO "Elasticity" VALUES ('PIE',2040,'TRA_ROA_MTR',0.80,'');
INSERT INTO "Elasticity" VALUES ('PIE',2050,'TRA_ROA_MTR',0.80,'');
INSERT INTO "Elasticity" VALUES ('PIE',2012,'TRA_OTH',-0.50,'');
INSERT INTO "Elasticity" VALUES ('PIE',2013,'TRA_OTH',-0.50,'');
INSERT INTO "Elasticity" VALUES ('PIE',2014,'TRA_OTH',-0.50,'');
INSERT INTO "Elasticity" VALUES ('PIE',2015,'TRA_OTH',0.50,'');
INSERT INTO "Elasticity" VALUES ('PIE',2017,'TRA_OTH',1.50,'');
INSERT INTO "Elasticity" VALUES ('PIE',2019,'TRA_OTH',1.50,'');
INSERT INTO "Elasticity" VALUES ('PIE',2020,'TRA_OTH',1.50,'');
INSERT INTO "Elasticity" VALUES ('PIE',2021,'TRA_OTH',1.50,'');
INSERT INTO "Elasticity" VALUES ('PIE',2023,'TRA_OTH',1.50,'');
INSERT INTO "Elasticity" VALUES ('PIE',2025,'TRA_OTH',1.50,'');
INSERT INTO "Elasticity" VALUES ('PIE',2030,'TRA_OTH',1.50,'');
INSERT INTO "Elasticity" VALUES ('PIE',2035,'TRA_OTH',1.50,'');
INSERT INTO "Elasticity" VALUES ('PIE',2040,'TRA_OTH',1.50,'');
INSERT INTO "Elasticity" VALUES ('PIE',2050,'TRA_OTH',1.50,'');
INSERT INTO "Elasticity" VALUES ('PIE',2012,'TRA_ROA_CAR',0.80,'');
INSERT INTO "Elasticity" VALUES ('PIE',2013,'TRA_ROA_CAR',0.80,'');
INSERT INTO "Elasticity" VALUES ('PIE',2014,'TRA_ROA_CAR',0.80,'');
INSERT INTO "Elasticity" VALUES ('PIE',2015,'TRA_ROA_CAR',0.80,'');
INSERT INTO "Elasticity" VALUES ('PIE',2017,'TRA_ROA_CAR',0.80,'');
INSERT INTO "Elasticity" VALUES ('PIE',2019,'TRA_ROA_CAR',0.85,'');
INSERT INTO "Elasticity" VALUES ('PIE',2020,'TRA_ROA_CAR',0.70,'');
INSERT INTO "Elasticity" VALUES ('PIE',2021,'TRA_ROA_CAR',0.75,'');
INSERT INTO "Elasticity" VALUES ('PIE',2023,'TRA_ROA_CAR',0.60,'');
INSERT INTO "Elasticity" VALUES ('PIE',2025,'TRA_ROA_CAR',0.50,'');
INSERT INTO "Elasticity" VALUES ('PIE',2030,'TRA_ROA_CAR',0.40,'');
INSERT INTO "Elasticity" VALUES ('PIE',2035,'TRA_ROA_CAR',0.40,'');
INSERT INTO "Elasticity" VALUES ('PIE',2040,'TRA_ROA_CAR',0.40,'');
INSERT INTO "Elasticity" VALUES ('PIE',2050,'TRA_ROA_CAR',0.40,'');
INSERT INTO "Elasticity" VALUES ('PIE',2012,'TRA_ROA_2WH',1.20,'');
INSERT INTO "Elasticity" VALUES ('PIE',2013,'TRA_ROA_2WH',1.20,'');
INSERT INTO "Elasticity" VALUES ('PIE',2014,'TRA_ROA_2WH',1.20,'');
INSERT INTO "Elasticity" VALUES ('PIE',2015,'TRA_ROA_2WH',1.20,'');
INSERT INTO "Elasticity" VALUES ('PIE',2017,'TRA_ROA_2WH',1.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2019,'TRA_ROA_2WH',0.80,'');
INSERT INTO "Elasticity" VALUES ('PIE',2020,'TRA_ROA_2WH',0.80,'');
INSERT INTO "Elasticity" VALUES ('PIE',2021,'TRA_ROA_2WH',1.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2023,'TRA_ROA_2WH',0.60,'');
INSERT INTO "Elasticity" VALUES ('PIE',2025,'TRA_ROA_2WH',0.60,'');
INSERT INTO "Elasticity" VALUES ('PIE',2030,'TRA_ROA_2WH',0.60,'');
INSERT INTO "Elasticity" VALUES ('PIE',2035,'TRA_ROA_2WH',0.50,'');
INSERT INTO "Elasticity" VALUES ('PIE',2040,'TRA_ROA_2WH',0.40,'');
INSERT INTO "Elasticity" VALUES ('PIE',2050,'TRA_ROA_2WH',0.40,'');
INSERT INTO "Elasticity" VALUES ('PIE',2012,'TRA_RAIL',1.20,'');
INSERT INTO "Elasticity" VALUES ('PIE',2013,'TRA_RAIL',1.20,'');
INSERT INTO "Elasticity" VALUES ('PIE',2014,'TRA_RAIL',1.20,'');
INSERT INTO "Elasticity" VALUES ('PIE',2015,'TRA_RAIL',1.20,'');
INSERT INTO "Elasticity" VALUES ('PIE',2017,'TRA_RAIL',1.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2019,'TRA_RAIL',0.80,'');
INSERT INTO "Elasticity" VALUES ('PIE',2020,'TRA_RAIL',0.80,'');
INSERT INTO "Elasticity" VALUES ('PIE',2021,'TRA_RAIL',0.70,'');
INSERT INTO "Elasticity" VALUES ('PIE',2023,'TRA_RAIL',0.60,'');
INSERT INTO "Elasticity" VALUES ('PIE',2025,'TRA_RAIL',0.60,'');
INSERT INTO "Elasticity" VALUES ('PIE',2030,'TRA_RAIL',0.60,'');
INSERT INTO "Elasticity" VALUES ('PIE',2035,'TRA_RAIL',0.50,'');
INSERT INTO "Elasticity" VALUES ('PIE',2040,'TRA_RAIL',0.40,'');
INSERT INTO "Elasticity" VALUES ('PIE',2050,'TRA_RAIL',0.40,'');
--Residential Sector
INSERT INTO "Elasticity" VALUES ('PIE',2012,'RES_SC',2.50,'');
INSERT INTO "Elasticity" VALUES ('PIE',2013,'RES_SC',2.50,'');
INSERT INTO "Elasticity" VALUES ('PIE',2014,'RES_SC',2.50,'');
INSERT INTO "Elasticity" VALUES ('PIE',2015,'RES_SC',1.50,'');
INSERT INTO "Elasticity" VALUES ('PIE',2017,'RES_SC',1.50,'');
INSERT INTO "Elasticity" VALUES ('PIE',2019,'RES_SC',1.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2020,'RES_SC',1.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2021,'RES_SC',1.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2023,'RES_SC',0.75,'');
INSERT INTO "Elasticity" VALUES ('PIE',2025,'RES_SC',0.75,'');
INSERT INTO "Elasticity" VALUES ('PIE',2030,'RES_SC',0.75,'');
INSERT INTO "Elasticity" VALUES ('PIE',2035,'RES_SC',0.75,'');
INSERT INTO "Elasticity" VALUES ('PIE',2040,'RES_SC',0.75,'');
INSERT INTO "Elasticity" VALUES ('PIE',2050,'RES_SC',0.75,'');

INSERT INTO "Elasticity" VALUES ('PIE',2012,'RES_CD',5.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2013,'RES_CD',5.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2014,'RES_CD',5.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2015,'RES_CD',5.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2017,'RES_CD',5.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2019,'RES_CD',5.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2020,'RES_CD',2.50,'');
INSERT INTO "Elasticity" VALUES ('PIE',2021,'RES_CD',2.50,'');
INSERT INTO "Elasticity" VALUES ('PIE',2023,'RES_CD',1.50,'');
INSERT INTO "Elasticity" VALUES ('PIE',2025,'RES_CD',1.50,'');
INSERT INTO "Elasticity" VALUES ('PIE',2030,'RES_CD',1.50,'');
INSERT INTO "Elasticity" VALUES ('PIE',2035,'RES_CD',1.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2040,'RES_CD',1.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2050,'RES_CD',1.00,'');

INSERT INTO "Elasticity" VALUES ('PIE',2012,'RES_CW',1.50,'');
INSERT INTO "Elasticity" VALUES ('PIE',2013,'RES_CW',1.50,'');
INSERT INTO "Elasticity" VALUES ('PIE',2014,'RES_CW',1.50,'');
INSERT INTO "Elasticity" VALUES ('PIE',2015,'RES_CW',1.50,'');
INSERT INTO "Elasticity" VALUES ('PIE',2017,'RES_CW',1.20,'');
INSERT INTO "Elasticity" VALUES ('PIE',2019,'RES_CW',1.20,'');
INSERT INTO "Elasticity" VALUES ('PIE',2020,'RES_CW',1.20,'');
INSERT INTO "Elasticity" VALUES ('PIE',2021,'RES_CW',1.20,'');
INSERT INTO "Elasticity" VALUES ('PIE',2023,'RES_CW',1.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2025,'RES_CW',1.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2030,'RES_CW',1.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2035,'RES_CW',0.75,'');
INSERT INTO "Elasticity" VALUES ('PIE',2040,'RES_CW',0.75,'');
INSERT INTO "Elasticity" VALUES ('PIE',2050,'RES_CW',0.75,'');

INSERT INTO "Elasticity" VALUES ('PIE',2012,'RES_DW',1.50,'');
INSERT INTO "Elasticity" VALUES ('PIE',2013,'RES_DW',1.50,'');
INSERT INTO "Elasticity" VALUES ('PIE',2014,'RES_DW',1.50,'');
INSERT INTO "Elasticity" VALUES ('PIE',2015,'RES_DW',1.50,'');
INSERT INTO "Elasticity" VALUES ('PIE',2017,'RES_DW',1.50,'');
INSERT INTO "Elasticity" VALUES ('PIE',2019,'RES_DW',1.50,'');
INSERT INTO "Elasticity" VALUES ('PIE',2020,'RES_DW',1.50,'');
INSERT INTO "Elasticity" VALUES ('PIE',2021,'RES_DW',1.50,'');
INSERT INTO "Elasticity" VALUES ('PIE',2023,'RES_DW',1.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2025,'RES_DW',1.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2030,'RES_DW',1.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2035,'RES_DW',0.75,'');
INSERT INTO "Elasticity" VALUES ('PIE',2040,'RES_DW',0.75,'');
INSERT INTO "Elasticity" VALUES ('PIE',2050,'RES_DW',0.75,'');

INSERT INTO "Elasticity" VALUES ('PIE',2012,'RES_OE',1.50,'');
INSERT INTO "Elasticity" VALUES ('PIE',2013,'RES_OE',1.50,'');
INSERT INTO "Elasticity" VALUES ('PIE',2014,'RES_OE',1.50,'');
INSERT INTO "Elasticity" VALUES ('PIE',2015,'RES_OE',1.50,'');
INSERT INTO "Elasticity" VALUES ('PIE',2017,'RES_OE',1.50,'');
INSERT INTO "Elasticity" VALUES ('PIE',2019,'RES_OE',1.50,'');
INSERT INTO "Elasticity" VALUES ('PIE',2020,'RES_OE',1.50,'');
INSERT INTO "Elasticity" VALUES ('PIE',2021,'RES_OE',1.50,'');
INSERT INTO "Elasticity" VALUES ('PIE',2023,'RES_OE',1.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2025,'RES_OE',1.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2030,'RES_OE',1.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2035,'RES_OE',0.75,'');
INSERT INTO "Elasticity" VALUES ('PIE',2040,'RES_OE',0.75,'');
INSERT INTO "Elasticity" VALUES ('PIE',2050,'RES_OE',0.75,'');
INSERT INTO "Elasticity" VALUES ('PIE',2012,'RES_SH_LC',3.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2013,'RES_SH_LC',3.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2014,'RES_SH_LC',2.50,'');
INSERT INTO "Elasticity" VALUES ('PIE',2015,'RES_SH_LC',2.50,'');
INSERT INTO "Elasticity" VALUES ('PIE',2017,'RES_SH_LC',2.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2019,'RES_SH_LC',2.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2020,'RES_SH_LC',1.50,'');
INSERT INTO "Elasticity" VALUES ('PIE',2021,'RES_SH_LC',1.50,'');
INSERT INTO "Elasticity" VALUES ('PIE',2023,'RES_SH_LC',1.25,'');
INSERT INTO "Elasticity" VALUES ('PIE',2025,'RES_SH_LC',1.25,'');
INSERT INTO "Elasticity" VALUES ('PIE',2030,'RES_SH_LC',1.25,'');
INSERT INTO "Elasticity" VALUES ('PIE',2035,'RES_SH_LC',1.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2040,'RES_SH_LC',1.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2050,'RES_SH_LC',1.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2012,'RES_SH_MC',1.50,'');
INSERT INTO "Elasticity" VALUES ('PIE',2013,'RES_SH_MC',1.50,'');
INSERT INTO "Elasticity" VALUES ('PIE',2014,'RES_SH_MC',1.25,'');
INSERT INTO "Elasticity" VALUES ('PIE',2015,'RES_SH_MC',1.25,'');
INSERT INTO "Elasticity" VALUES ('PIE',2017,'RES_SH_MC',1.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2019,'RES_SH_MC',1.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2020,'RES_SH_MC',0.75,'');
INSERT INTO "Elasticity" VALUES ('PIE',2021,'RES_SH_MC',0.75,'');
INSERT INTO "Elasticity" VALUES ('PIE',2023,'RES_SH_MC',0.625,'');
INSERT INTO "Elasticity" VALUES ('PIE',2025,'RES_SH_MC',0.625,'');
INSERT INTO "Elasticity" VALUES ('PIE',2030,'RES_SH_MC',0.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2035,'RES_SH_MC',0.50,'');
INSERT INTO "Elasticity" VALUES ('PIE',2040,'RES_SH_MC',0.50,'');
INSERT INTO "Elasticity" VALUES ('PIE',2050,'RES_SH_MC',0.50,'');
INSERT INTO "Elasticity" VALUES ('PIE',2012,'RES_SH_HC',0.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2013,'RES_SH_HC',0.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2014,'RES_SH_HC',0.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2015,'RES_SH_HC',0.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2017,'RES_SH_HC',0.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2019,'RES_SH_HC',0.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2020,'RES_SH_HC',0.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2021,'RES_SH_HC',0.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2023,'RES_SH_HC',0.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2025,'RES_SH_HC',0.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2030,'RES_SH_HC',0.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2035,'RES_SH_HC',0.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2040,'RES_SH_HC',0.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2050,'RES_SH_HC',0.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2012,'RES_WH',0.30,'');
INSERT INTO "Elasticity" VALUES ('PIE',2013,'RES_WH',0.30,'');
INSERT INTO "Elasticity" VALUES ('PIE',2014,'RES_WH',0.30,'');
INSERT INTO "Elasticity" VALUES ('PIE',2015,'RES_WH',0.30,'');
INSERT INTO "Elasticity" VALUES ('PIE',2017,'RES_WH',0.30,'');
INSERT INTO "Elasticity" VALUES ('PIE',2019,'RES_WH',0.30,'');
INSERT INTO "Elasticity" VALUES ('PIE',2020,'RES_WH',0.30,'');
INSERT INTO "Elasticity" VALUES ('PIE',2021,'RES_WH',0.30,'');
INSERT INTO "Elasticity" VALUES ('PIE',2023,'RES_WH',0.30,'');
INSERT INTO "Elasticity" VALUES ('PIE',2025,'RES_WH',0.30,'');
INSERT INTO "Elasticity" VALUES ('PIE',2030,'RES_WH',0.30,'');
INSERT INTO "Elasticity" VALUES ('PIE',2035,'RES_WH',0.30,'');
INSERT INTO "Elasticity" VALUES ('PIE',2040,'RES_WH',0.30,'');
INSERT INTO "Elasticity" VALUES ('PIE',2050,'RES_WH',0.30,'');
INSERT INTO "Elasticity" VALUES ('PIE',2012,'RES_CK',0.30,'');
INSERT INTO "Elasticity" VALUES ('PIE',2013,'RES_CK',0.30,'');
INSERT INTO "Elasticity" VALUES ('PIE',2014,'RES_CK',0.30,'');
INSERT INTO "Elasticity" VALUES ('PIE',2015,'RES_CK',0.30,'');
INSERT INTO "Elasticity" VALUES ('PIE',2017,'RES_CK',0.30,'');
INSERT INTO "Elasticity" VALUES ('PIE',2019,'RES_CK',0.30,'');
INSERT INTO "Elasticity" VALUES ('PIE',2020,'RES_CK',0.30,'');
INSERT INTO "Elasticity" VALUES ('PIE',2021,'RES_CK',0.30,'');
INSERT INTO "Elasticity" VALUES ('PIE',2023,'RES_CK',0.30,'');
INSERT INTO "Elasticity" VALUES ('PIE',2025,'RES_CK',0.30,'');
INSERT INTO "Elasticity" VALUES ('PIE',2030,'RES_CK',0.30,'');
INSERT INTO "Elasticity" VALUES ('PIE',2035,'RES_CK',0.30,'');
INSERT INTO "Elasticity" VALUES ('PIE',2040,'RES_CK',0.30,'');
INSERT INTO "Elasticity" VALUES ('PIE',2050,'RES_CK',0.30,'');
INSERT INTO "Elasticity" VALUES ('PIE',2012,'RES_LG',1.50,'');
INSERT INTO "Elasticity" VALUES ('PIE',2013,'RES_LG',1.50,'');
INSERT INTO "Elasticity" VALUES ('PIE',2014,'RES_LG',1.50,'');
INSERT INTO "Elasticity" VALUES ('PIE',2015,'RES_LG',1.50,'');
INSERT INTO "Elasticity" VALUES ('PIE',2017,'RES_LG',1.20,'');
INSERT INTO "Elasticity" VALUES ('PIE',2019,'RES_LG',1.20,'');
INSERT INTO "Elasticity" VALUES ('PIE',2020,'RES_LG',1.20,'');
INSERT INTO "Elasticity" VALUES ('PIE',2021,'RES_LG',1.20,'');
INSERT INTO "Elasticity" VALUES ('PIE',2023,'RES_LG',1.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2025,'RES_LG',1.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2030,'RES_LG',1.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2035,'RES_LG',1.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2040,'RES_LG',0.90,'');
INSERT INTO "Elasticity" VALUES ('PIE',2050,'RES_LG',1.50,'');
INSERT INTO "Elasticity" VALUES ('PIE',2012,'RES_RF',1.50,'');
INSERT INTO "Elasticity" VALUES ('PIE',2013,'RES_RF',1.50,'');
INSERT INTO "Elasticity" VALUES ('PIE',2014,'RES_RF',1.50,'');
INSERT INTO "Elasticity" VALUES ('PIE',2015,'RES_RF',1.50,'');
INSERT INTO "Elasticity" VALUES ('PIE',2017,'RES_RF',1.20,'');
INSERT INTO "Elasticity" VALUES ('PIE',2019,'RES_RF',1.20,'');
INSERT INTO "Elasticity" VALUES ('PIE',2020,'RES_RF',1.20,'');
INSERT INTO "Elasticity" VALUES ('PIE',2021,'RES_RF',1.20,'');
INSERT INTO "Elasticity" VALUES ('PIE',2023,'RES_RF',1.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2025,'RES_RF',1.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2030,'RES_RF',1.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2035,'RES_RF',1.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2040,'RES_RF',0.90,'');
INSERT INTO "Elasticity" VALUES ('PIE',2050,'RES_RF',1.00,'');
-- Dummy to account for energy-water demand, Temporary
INSERT INTO "Elasticity" VALUES ('PIE',2012,'DMY_WAT_OUT',0.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2013,'DMY_WAT_OUT',0.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2014,'DMY_WAT_OUT',0.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2015,'DMY_WAT_OUT',0.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2017,'DMY_WAT_OUT',0.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2019,'DMY_WAT_OUT',0.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2020,'DMY_WAT_OUT',0.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2021,'DMY_WAT_OUT',0.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2023,'DMY_WAT_OUT',0.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2025,'DMY_WAT_OUT',0.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2030,'DMY_WAT_OUT',0.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2035,'DMY_WAT_OUT',0.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2040,'DMY_WAT_OUT',0.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2050,'DMY_WAT_OUT',0.00,'');
--Commercial Sector
INSERT INTO "Elasticity" VALUES ('PIE',2012,'COM_SC',-1.50,'');
INSERT INTO "Elasticity" VALUES ('PIE',2013,'COM_SC',-1.50,'');
INSERT INTO "Elasticity" VALUES ('PIE',2014,'COM_SC',-1.50,'');
INSERT INTO "Elasticity" VALUES ('PIE',2015,'COM_SC',-1.50,'');
INSERT INTO "Elasticity" VALUES ('PIE',2017,'COM_SC',2.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2019,'COM_SC',1.50,'');
INSERT INTO "Elasticity" VALUES ('PIE',2020,'COM_SC',1.50,'');
INSERT INTO "Elasticity" VALUES ('PIE',2021,'COM_SC',1.25,'');
INSERT INTO "Elasticity" VALUES ('PIE',2023,'COM_SC',1.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2025,'COM_SC',1.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2030,'COM_SC',1.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2035,'COM_SC',0.75,'');
INSERT INTO "Elasticity" VALUES ('PIE',2040,'COM_SC',1.75,'');
INSERT INTO "Elasticity" VALUES ('PIE',2050,'COM_SC',0.75,'');

INSERT INTO "Elasticity" VALUES ('PIE',2012,'COM_CK',0.50 ,'');
INSERT INTO "Elasticity" VALUES ('PIE',2013,'COM_CK',0.50 ,'');
INSERT INTO "Elasticity" VALUES ('PIE',2014,'COM_CK',1.50 ,'');
INSERT INTO "Elasticity" VALUES ('PIE',2015,'COM_CK',1.50 ,'');
INSERT INTO "Elasticity" VALUES ('PIE',2017,'COM_CK',1.75 ,'');
INSERT INTO "Elasticity" VALUES ('PIE',2019,'COM_CK',1.00 ,'');
INSERT INTO "Elasticity" VALUES ('PIE',2020,'COM_CK',1.00 ,'');
INSERT INTO "Elasticity" VALUES ('PIE',2021,'COM_CK',0.875,'');
INSERT INTO "Elasticity" VALUES ('PIE',2023,'COM_CK',0.75 ,'');
INSERT INTO "Elasticity" VALUES ('PIE',2025,'COM_CK',0.75 ,'');
INSERT INTO "Elasticity" VALUES ('PIE',2030,'COM_CK',0.75 ,'');
INSERT INTO "Elasticity" VALUES ('PIE',2035,'COM_CK',0.625,'');
INSERT INTO "Elasticity" VALUES ('PIE',2040,'COM_CK',0.50 ,'');
INSERT INTO "Elasticity" VALUES ('PIE',2050,'COM_CK',0.50 ,'');

INSERT INTO "Elasticity" VALUES ('PIE',2012,'COM_SH',0.50,'');
INSERT INTO "Elasticity" VALUES ('PIE',2013,'COM_SH',0.50,'');
INSERT INTO "Elasticity" VALUES ('PIE',2014,'COM_SH',0.50,'');
INSERT INTO "Elasticity" VALUES ('PIE',2015,'COM_SH',0.75,'');
INSERT INTO "Elasticity" VALUES ('PIE',2017,'COM_SH',1.25,'');
INSERT INTO "Elasticity" VALUES ('PIE',2019,'COM_SH',1.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2020,'COM_SH',1.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2021,'COM_SH',0.875,'');
INSERT INTO "Elasticity" VALUES ('PIE',2023,'COM_SH',0.75,'');
INSERT INTO "Elasticity" VALUES ('PIE',2025,'COM_SH',0.75,'');
INSERT INTO "Elasticity" VALUES ('PIE',2030,'COM_SH',0.75,'');
INSERT INTO "Elasticity" VALUES ('PIE',2035,'COM_SH',0.625,'');
INSERT INTO "Elasticity" VALUES ('PIE',2040,'COM_SH',0.50,'');
INSERT INTO "Elasticity" VALUES ('PIE',2050,'COM_SH',0.50,'');

INSERT INTO "Elasticity" VALUES ('PIE',2012,'COM_WH',0.50,'');
INSERT INTO "Elasticity" VALUES ('PIE',2013,'COM_WH',0.50,'');
INSERT INTO "Elasticity" VALUES ('PIE',2014,'COM_WH',0.50,'');
INSERT INTO "Elasticity" VALUES ('PIE',2015,'COM_WH',1.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2017,'COM_WH',1.25,'');
INSERT INTO "Elasticity" VALUES ('PIE',2019,'COM_WH',1.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2020,'COM_WH',1.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2021,'COM_WH',0.875,'');
INSERT INTO "Elasticity" VALUES ('PIE',2023,'COM_WH',0.75,'');
INSERT INTO "Elasticity" VALUES ('PIE',2025,'COM_WH',0.75,'');
INSERT INTO "Elasticity" VALUES ('PIE',2030,'COM_WH',0.75,'');
INSERT INTO "Elasticity" VALUES ('PIE',2035,'COM_WH',0.625,'');
INSERT INTO "Elasticity" VALUES ('PIE',2040,'COM_WH',0.50,'');
INSERT INTO "Elasticity" VALUES ('PIE',2050,'COM_WH',0.50,'');

INSERT INTO "Elasticity" VALUES ('PIE',2012,'COM_LG',-2.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2013,'COM_LG',-2.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2014,'COM_LG',-2.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2015,'COM_LG',0.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2017,'COM_LG',1.75,'');
INSERT INTO "Elasticity" VALUES ('PIE',2019,'COM_LG',1.50,'');
INSERT INTO "Elasticity" VALUES ('PIE',2020,'COM_LG',1.50,'');
INSERT INTO "Elasticity" VALUES ('PIE',2021,'COM_LG',1.25,'');
INSERT INTO "Elasticity" VALUES ('PIE',2023,'COM_LG',1.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2025,'COM_LG',1.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2030,'COM_LG',1.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2035,'COM_LG',1.35,'');
INSERT INTO "Elasticity" VALUES ('PIE',2040,'COM_LG',0.70,'');
INSERT INTO "Elasticity" VALUES ('PIE',2050,'COM_LG',0.70,'');

INSERT INTO "Elasticity" VALUES ('PIE',2012,'COM_OE',-2.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2013,'COM_OE',-2.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2014,'COM_OE',-2.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2015,'COM_OE',0.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2017,'COM_OE',1.75,'');
INSERT INTO "Elasticity" VALUES ('PIE',2019,'COM_OE',1.50,'');
INSERT INTO "Elasticity" VALUES ('PIE',2020,'COM_OE',1.50,'');
INSERT INTO "Elasticity" VALUES ('PIE',2021,'COM_OE',1.25,'');
INSERT INTO "Elasticity" VALUES ('PIE',2023,'COM_OE',1.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2025,'COM_OE',1.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2030,'COM_OE',1.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2035,'COM_OE',0.85,'');
INSERT INTO "Elasticity" VALUES ('PIE',2040,'COM_OE',0.70,'');
INSERT INTO "Elasticity" VALUES ('PIE',2050,'COM_OE',0.70,'');

INSERT INTO "Elasticity" VALUES ('PIE',2012,'COM_RF',-2.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2013,'COM_RF',-2.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2014,'COM_RF',-2.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2015,'COM_RF',0.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2017,'COM_RF',1.75,'');
INSERT INTO "Elasticity" VALUES ('PIE',2019,'COM_RF',1.50, '');
INSERT INTO "Elasticity" VALUES ('PIE',2020,'COM_RF',1.50, '');
INSERT INTO "Elasticity" VALUES ('PIE',2021,'COM_RF',1.25, '');
INSERT INTO "Elasticity" VALUES ('PIE',2023,'COM_RF',1.00, '');
INSERT INTO "Elasticity" VALUES ('PIE',2025,'COM_RF',1.00, '');
INSERT INTO "Elasticity" VALUES ('PIE',2030,'COM_RF',1.00, '');
INSERT INTO "Elasticity" VALUES ('PIE',2035,'COM_RF',0.85, '');
INSERT INTO "Elasticity" VALUES ('PIE',2040,'COM_RF',0.70, '');
INSERT INTO "Elasticity" VALUES ('PIE',2050,'COM_RF',0.70, '');
-- Agriculture Sector
INSERT INTO "Elasticity" VALUES ('PIE',2012,'AGR_DEM',1.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2013,'AGR_DEM',0.90,'');
INSERT INTO "Elasticity" VALUES ('PIE',2014,'AGR_DEM',0.20,'');
INSERT INTO "Elasticity" VALUES ('PIE',2015,'AGR_DEM',0.60,'');
INSERT INTO "Elasticity" VALUES ('PIE',2017,'AGR_DEM',0.80,'');
INSERT INTO "Elasticity" VALUES ('PIE',2019,'AGR_DEM',1.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2020,'AGR_DEM',1.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2021,'AGR_DEM',1.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2023,'AGR_DEM',0.80,'');
INSERT INTO "Elasticity" VALUES ('PIE',2025,'AGR_DEM',0.80,'');
INSERT INTO "Elasticity" VALUES ('PIE',2030,'AGR_DEM',0.80,'');
INSERT INTO "Elasticity" VALUES ('PIE',2035,'AGR_DEM',0.60,'');
INSERT INTO "Elasticity" VALUES ('PIE',2040,'AGR_DEM',0.60,'');
INSERT INTO "Elasticity" VALUES ('PIE',2050,'AGR_DEM',0.60,'');

INSERT INTO "Elasticity" VALUES ('PIE',2012,'IND_CH',1.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2013,'IND_CH',1.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2014,'IND_CH',1.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2015,'IND_CH',1.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2017,'IND_CH',1.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2019,'IND_CH',1.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2020,'IND_CH',1.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2021,'IND_CH',1.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2023,'IND_CH',1.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2025,'IND_CH',1.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2030,'IND_CH',1.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2035,'IND_CH',1.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2040,'IND_CH',1.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2050,'IND_CH',1.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2012,'IND_IS',1.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2013,'IND_IS',1.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2014,'IND_IS',1.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2015,'IND_IS',1.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2017,'IND_IS',1.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2019,'IND_IS',1.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2020,'IND_IS',1.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2021,'IND_IS',1.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2023,'IND_IS',1.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2025,'IND_IS',1.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2030,'IND_IS',1.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2035,'IND_IS',1.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2040,'IND_IS',1.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2050,'IND_IS',1.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2012,'IND_PP',1.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2013,'IND_PP',1.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2014,'IND_PP',1.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2015,'IND_PP',1.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2017,'IND_PP',1.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2019,'IND_PP',1.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2020,'IND_PP',1.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2021,'IND_PP',1.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2023,'IND_PP',1.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2025,'IND_PP',1.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2030,'IND_PP',1.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2035,'IND_PP',1.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2040,'IND_PP',1.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2050,'IND_PP',1.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2012,'IND_NF',1.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2013,'IND_NF',1.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2014,'IND_NF',1.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2015,'IND_NF',1.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2017,'IND_NF',1.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2019,'IND_NF',1.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2020,'IND_NF',1.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2021,'IND_NF',1.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2023,'IND_NF',1.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2025,'IND_NF',1.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2030,'IND_NF',1.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2035,'IND_NF',1.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2040,'IND_NF',1.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2050,'IND_NF',1.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2012,'IND_NM',1.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2013,'IND_NM',1.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2014,'IND_NM',1.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2015,'IND_NM',1.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2017,'IND_NM',1.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2019,'IND_NM',1.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2020,'IND_NM',1.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2021,'IND_NM',1.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2023,'IND_NM',1.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2025,'IND_NM',1.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2030,'IND_NM',1.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2035,'IND_NM',1.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2040,'IND_NM',1.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2050,'IND_NM',1.00,'');
INSERT INTO "Elasticity" VALUES ('PIE',2012,'IND_OTH',0.89,'');
INSERT INTO "Elasticity" VALUES ('PIE',2013,'IND_OTH',0.89,'');
INSERT INTO "Elasticity" VALUES ('PIE',2014,'IND_OTH',0.89,'');
INSERT INTO "Elasticity" VALUES ('PIE',2015,'IND_OTH',1.67,'');
INSERT INTO "Elasticity" VALUES ('PIE',2017,'IND_OTH',1.30,'');
INSERT INTO "Elasticity" VALUES ('PIE',2019,'IND_OTH',1.11,'');
INSERT INTO "Elasticity" VALUES ('PIE',2020,'IND_OTH',1.11,'');
INSERT INTO "Elasticity" VALUES ('PIE',2021,'IND_OTH',0.97,'');
INSERT INTO "Elasticity" VALUES ('PIE',2023,'IND_OTH',0.83,'');
INSERT INTO "Elasticity" VALUES ('PIE',2025,'IND_OTH',0.83,'');
INSERT INTO "Elasticity" VALUES ('PIE',2030,'IND_OTH',0.83,'');
INSERT INTO "Elasticity" VALUES ('PIE',2035,'IND_OTH',0.69,'');
INSERT INTO "Elasticity" VALUES ('PIE',2040,'IND_OTH',0.56,'');
INSERT INTO "Elasticity" VALUES ('PIE',2050,'IND_OTH',0.56,'');

INSERT INTO "Elasticity" VALUES ('PIE',2012,'IND_OTH_NEU',0.89,'');
INSERT INTO "Elasticity" VALUES ('PIE',2013,'IND_OTH_NEU',0.89,'');
INSERT INTO "Elasticity" VALUES ('PIE',2014,'IND_OTH_NEU',0.89,'');
INSERT INTO "Elasticity" VALUES ('PIE',2015,'IND_OTH_NEU',1.67,'');
INSERT INTO "Elasticity" VALUES ('PIE',2017,'IND_OTH_NEU',1.30,'');
INSERT INTO "Elasticity" VALUES ('PIE',2019,'IND_OTH_NEU',1.11,'');
INSERT INTO "Elasticity" VALUES ('PIE',2020,'IND_OTH_NEU',1.11,'');
INSERT INTO "Elasticity" VALUES ('PIE',2021,'IND_OTH_NEU',1.11,'');
INSERT INTO "Elasticity" VALUES ('PIE',2023,'IND_OTH_NEU',0.97,'');
INSERT INTO "Elasticity" VALUES ('PIE',2025,'IND_OTH_NEU',0.83,'');
INSERT INTO "Elasticity" VALUES ('PIE',2030,'IND_OTH_NEU',0.83,'');
INSERT INTO "Elasticity" VALUES ('PIE',2035,'IND_OTH_NEU',0.83,'');
INSERT INTO "Elasticity" VALUES ('PIE',2040,'IND_OTH_NEU',0.83,'');
INSERT INTO "Elasticity" VALUES ('PIE',2050,'IND_OTH_NEU',0.83,'');
INSERT INTO "Elasticity" VALUES ('PIE',2012,'IND_OTH_NSP',0.75,'');
INSERT INTO "Elasticity" VALUES ('PIE',2013,'IND_OTH_NSP',0.75,'');
INSERT INTO "Elasticity" VALUES ('PIE',2014,'IND_OTH_NSP',0.75,'');
INSERT INTO "Elasticity" VALUES ('PIE',2015,'IND_OTH_NSP',1.88,'');
INSERT INTO "Elasticity" VALUES ('PIE',2017,'IND_OTH_NSP',1.46,'');
INSERT INTO "Elasticity" VALUES ('PIE',2019,'IND_OTH_NSP',1.25,'');
INSERT INTO "Elasticity" VALUES ('PIE',2020,'IND_OTH_NSP',1.25,'');
INSERT INTO "Elasticity" VALUES ('PIE',2021,'IND_OTH_NSP',1.09,'');
INSERT INTO "Elasticity" VALUES ('PIE',2023,'IND_OTH_NSP',0.94,'');
INSERT INTO "Elasticity" VALUES ('PIE',2025,'IND_OTH_NSP',0.94,'');
INSERT INTO "Elasticity" VALUES ('PIE',2030,'IND_OTH_NSP',0.94,'');
INSERT INTO "Elasticity" VALUES ('PIE',2035,'IND_OTH_NSP',0.78,'');
INSERT INTO "Elasticity" VALUES ('PIE',2040,'IND_OTH_NSP',0.63,'');
INSERT INTO "Elasticity" VALUES ('PIE',2050,'IND_OTH_NSP',0.63,'');

CREATE TABLE "Demand" (
   "regions"  text,
   "periods"  integer,
   "demand_comm"  text,
   "demand"   real,
   "demand_units" text,
   "demand_notes" text,
   primary key("regions","periods","demand_comm"),
   foreign key("periods") references "time_periods"("t_periods"),
   foreign key("demand_comm") references "commodities"("comm_name")
);

-- Transport sector
INSERT INTO "Demand" VALUES ('PIE',2011,'TRA_AVI',3.225E+00,'PJ','Updated based on GSE Report');
INSERT INTO "Demand" VALUES ('PIE',2011,'TRA_OTH',1.57E+00,'PJ','');
INSERT INTO "Demand" VALUES ('PIE',2011,'TRA_RAIL',2.09E+00,'PJ','');
INSERT INTO "Demand" VALUES ('PIE',2011,'TRA_ROA_BUS',1.077E-01,'Bvkm','');
INSERT INTO "Demand" VALUES ('PIE',2011,'TRA_ROA_CAR',2.27E+01,'Bvkm','');
INSERT INTO "Demand" VALUES ('PIE',2011,'TRA_ROA_MTR',5.384E-01,'Bvkm','');
INSERT INTO "Demand" VALUES ('PIE',2011,'TRA_ROA_HTR',6.159E-01,'Bvkm','');
INSERT INTO "Demand" VALUES ('PIE',2011,'TRA_ROA_LCV',5.058E+00,'Bvkm','');
INSERT INTO "Demand" VALUES ('PIE',2011,'TRA_ROA_2WH',4.31E+00,'Bvkm','');
-- Residential sector
INSERT INTO "Demand" VALUES ('PIE',2011,'RES_SH_LC',3.50E+00,'Mm2','');
INSERT INTO "Demand" VALUES ('PIE',2011,'RES_SH_MC',2.37E+01,'Mm2','');
INSERT INTO "Demand" VALUES ('PIE',2011,'RES_SH_HC',1.38E+02,'Mm2','');
INSERT INTO "Demand" VALUES ('PIE',2011,'RES_SC',2.55E+01,'Mm2','');
INSERT INTO "Demand" VALUES ('PIE',2011,'RES_WH',6.73E+00,'PJ','');
INSERT INTO "Demand" VALUES ('PIE',2011,'RES_RF',6.62E-01,'Gl','');
INSERT INTO "Demand" VALUES ('PIE',2011,'RES_CW',4.42E-01,'Glav','');
INSERT INTO "Demand" VALUES ('PIE',2011,'RES_CD',6.27E-03,'Glav','');
INSERT INTO "Demand" VALUES ('PIE',2011,'RES_DW',2.04E-01,'Glav','');
INSERT INTO "Demand" VALUES ('PIE',2011,'RES_CK',2.03E+00,'PJ','');
INSERT INTO "Demand" VALUES ('PIE',2011,'RES_OE',5.03E+00,'PJ','');
INSERT INTO "Demand" VALUES ('PIE',2011,'RES_LG',6.06E+01,'Glm','');

-- Commercial sector
INSERT INTO "Demand" VALUES ('PIE',2011,'COM_SH',3.14E+01,'PJ','');
INSERT INTO "Demand" VALUES ('PIE',2011,'COM_SC',1.46E+01,'PJ','');
INSERT INTO "Demand" VALUES ('PIE',2011,'COM_WH',2.12E+00,'PJ','');
INSERT INTO "Demand" VALUES ('PIE',2011,'COM_LG',4.32E+01,'PJ','');
INSERT INTO "Demand" VALUES ('PIE',2011,'COM_CK',1.28E+00,'PJ','');
INSERT INTO "Demand" VALUES ('PIE',2011,'COM_RF',1.76E+00,'PJ','');
INSERT INTO "Demand" VALUES ('PIE',2011,'COM_OE',9.04E+00,'PJ','');
-- Agriculture sector
INSERT INTO "Demand" VALUES ('PIE',2011,'AGR_DEM',3.68E+01,'PJ','');
-- Industrial sector
INSERT INTO "Demand" VALUES ('PIE',2011,'IND_CH',0.8*1.50E+00,'Mt','');
INSERT INTO "Demand" VALUES ('PIE',2011,'IND_IS',0.9*2.98E+00,'Mt','');
INSERT INTO "Demand" VALUES ('PIE',2011,'IND_NF',0.9*1.25E+00,'Mt','');
INSERT INTO "Demand" VALUES ('PIE',2011,'IND_NM',0.9*2.50E+00,'Mt','');
INSERT INTO "Demand" VALUES ('PIE',2011,'IND_PP',0.7*8.72E-01,'Mt','');
INSERT INTO "Demand" VALUES ('PIE',2011,'IND_OTH',2.78E+01,'PJ','');
INSERT INTO "Demand" VALUES ('PIE',2011,'IND_OTH_NEU',0.5*1.16E+01,'PJ','');
INSERT INTO "Demand" VALUES ('PIE',2011,'IND_OTH_NSP',0.3*1.35E+01,'PJ','');

-- Dummy water-energy demand
INSERT INTO "Demand" VALUES ('PIE',2011,'DMY_WAT_OUT',5.62E+00,'PJ','');

CREATE TABLE "CostVariable" (
   "regions"  text not null,
   "periods"  integer not null,
   "tech" text not null,
   "vintage"  integer not null,
   "cost_variable"    real,
   "cost_variable_units"  text,
   "cost_variable_notes"  text,
   primary key("regions","periods","tech","vintage"),
   foreign key("tech") references "technologies"("tech"),
   foreign key("vintage") references "time_periods"("t_periods"),
   foreign key("periods") references "time_periods"("t_periods")
);

-- Transport sector
-- Fuel technologies

INSERT INTO "CostVariable" VALUES ('PIE',2011,'TRA_RAIL_DSL_EN',2011,2.17,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('PIE',2011,'TRA_RAIL_ELC_EN',2011,2.17,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('PIE',2012,'TRA_OTH_ELC_EN',2012,2.17,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('PIE',2011,'TRA_ELC_DIV',2011,2.17,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('PIE',2011,'TRA_FT_ELC',2011,2.17,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('PIE',2011,'TRA_FT_DST_E',2011,2.17,'M€/PJ','temoa-it');
INSERT INTO "CostVariable" VALUES ('PIE',2012,'TRA_FT_DST_N',2012,2.17,'M€/PJ','temoa-it');
INSERT INTO "CostVariable" VALUES ('PIE',2011,'TRA_DSL_BLN',2011,2.17,'','');
INSERT INTO "CostVariable" VALUES ('PIE',2011,'TRA_FT_BIO_DST_E',2011,2.17,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('PIE',2012,'TRA_FT_BIO_DST_N',2012,2.0,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('PIE',2011,'TRA_FT_JTK_E',2011,2.17,'','');
INSERT INTO "CostVariable" VALUES ('PIE',2011,'TRA_FT_LPG_E',2011,2.17,'','');
INSERT INTO "CostVariable" VALUES ('PIE',2011,'TRA_FT_GSL_E',2011,2.17,'','');

INSERT INTO "CostVariable" VALUES ('PIE',2011,'TRA_AVI_EN',2011,2.17,'','');
INSERT INTO "CostVariable" VALUES ('PIE',2012,'TRA_FT_LPG_N',2012,2.17,'','');
INSERT INTO "CostVariable" VALUES ('PIE',2012,'TRA_FT_JTK_N',2012,2.17,'','');
INSERT INTO "CostVariable" VALUES ('PIE',2012,'TRA_FT_GSL_N',2012,2.17,'','');
INSERT INTO "CostVariable" VALUES ('PIE',2012,'TRA_FT_NGA_N',2012,3.0,'','');

-- Electricity sector
-- Fuel technologies
INSERT INTO "CostVariable" VALUES ('PIE',2012,'ELC_FT_BMU',2012,3.00,'M€/PJ','');

-- Base year technologies
INSERT INTO "CostVariable" VALUES ('PIE',2011,'ELC_NGA_CC_E',2011,0.41,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('PIE',2011,'ELC_NGA_TURB_E',2011,0.50,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('PIE',2011,'ELC_NGA_STM_REP_E',2011,0.33,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('PIE',2011,'ELC_BGS_E',2011,0.36,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('PIE',2011,'ELC_BIO_E',2011,0.36,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('PIE',2011,'ELC_SOL_E',2011,13.89,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('PIE',2011,'ELC_WIN_E',2011,0.00,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('PIE',2011,'ELC_HYD_FLO_E',2011,0.08,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('PIE',2011,'ELC_HYD_RES_E',2011,0.08,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('PIE',2011,'ELC_HYD_PUM_E',2011,0.08,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('PIE',2011,'ELC_CHP_NGA_CC_E',2011,0.79,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('PIE',2011,'ELC_CHP_NGA_TURB_E',2011,0.57,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('PIE',2011,'ELC_CHP_NGA_STM_COND_E',2011,0.48,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('PIE',2011,'ELC_CHP_BMU_E',2011,0.83,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('PIE',2011,'ELC_CHP_BIO_E',2011,0.83,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('PIE',2011,'UPS_COA_HCO',2011,3.0,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('PIE',2012,'UPS_IMP_ELC_CEN',2012,23.34,'M€/PJ','TEMOA_IT-price of 2012');
INSERT INTO "CostVariable" VALUES ('PIE',2015,'UPS_IMP_ELC_CEN',2015,17.06,'M€/PJ','TEMOA_IT-price of 2014');
INSERT INTO "CostVariable" VALUES ('PIE',2017,'UPS_IMP_ELC_CEN',2017,13.20,'M€/PJ','TEMOA_IT-price of 2016');
INSERT INTO "CostVariable" VALUES ('PIE',2012,'UPS_IMP_WOD',2012,50,'M€/PJ','TEMOA_IT');

-- Planned technologies
INSERT INTO "CostVariable" VALUES ('PIE',2012,'ELC_NGA_CC_P',2012,1.41,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('PIE',2012,'ELC_CHP_NGA_CC_P',2012,0.49,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('PIE',2012,'ELC_CHP_NGA_TURB_P',2012,0.50,'M€/PJ','');
-- New technologies
INSERT INTO "CostVariable" VALUES ('PIE',2012,'ELC_NGA_TURB_L80MW_N',2012,0.75,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('PIE',2015,'ELC_BLQ_N',2015,1.11,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('PIE',2012,'ELC_BIO_5C_N',2012,1.11,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('PIE',2040,'ELC_BIO_5C_N',2040,0.50,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('PIE',2012,'ELC_CHP_BMU_N',2012,12.50,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('PIE',2030,'ELC_CHP_BMU_N',2030,9.50,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('PIE',2012,'ELC_CHP_NGA_TURB_N',2012,1.67,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('PIE',2015,'ELC_CHP_NGA_TURB_N',2015,1.53,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('PIE',2021,'ELC_CHP_NGA_TURB_N',2021,1.39,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('PIE',2030,'ELC_CHP_NGA_TURB_N',2030,1.25,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('PIE',2040,'ELC_CHP_NGA_TURB_N',2040,1.11,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('PIE',2012,'ELC_CHP_NGA_CC_N',2012,0.50,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('PIE',2015,'ELC_CHP_NGA_CC_N',2015,0.44,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('PIE',2021,'ELC_CHP_NGA_CC_N',2021,0.42,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('PIE',2030,'ELC_CHP_NGA_CC_N',2030,0.37,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('PIE',2040,'ELC_CHP_NGA_CC_N',2040,0.33,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('PIE',2012,'ELC_CHP_NGA_CP_N',2012,1.39,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('PIE',2012,'ELC_CHP_NGA_TAP_N',2012,1.39,'M€/PJ','');
-- Upstream sector

INSERT INTO "CostVariable" VALUES ('PIE',2012,'UPS_DMY_HET',2012,5E4,'M€/PJ','');
-- Importation prices
INSERT INTO "CostVariable" VALUES ('PIE',2012,'UPS_IMP_COA_OVC',2012,11.00,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('PIE',2050,'UPS_IMP_COA_OVC',2050,13.20,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('PIE',2011,'UPS_IMP_GAS_NGA',2011,7.46,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('PIE',2015,'UPS_IMP_GAS_NGA',2015,7.09,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('PIE',2017,'UPS_IMP_GAS_NGA',2017,6.07,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('PIE',2019,'UPS_IMP_GAS_NGA',2019,6.21,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('PIE',2020,'UPS_IMP_GAS_NGA',2020,6.34,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('PIE',2030,'UPS_IMP_GAS_NGA',2030,6.89,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('PIE',2040,'UPS_IMP_GAS_NGA',2040,7.58,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('PIE',2050,'UPS_IMP_GAS_NGA',2050,8.34,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('PIE',2011,'UPS_IMP_COA_COC',2011,10.50,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('PIE',2013,'UPS_IMP_COA_COC',2013,11.00,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('PIE',2011,'UPS_IMP_COA_HCO',2011,3.10,'M€/PJ','TEMOA_IT');
INSERT INTO "CostVariable" VALUES ('PIE',2015,'UPS_IMP_COA_HCO',2015,3.14,'M€/PJ','TEMOA_IT');
INSERT INTO "CostVariable" VALUES ('PIE',2017,'UPS_IMP_COA_HCO',2017,3.57,'M€/PJ','TEMOA_IT');
INSERT INTO "CostVariable" VALUES ('PIE',2019,'UPS_IMP_COA_HCO',2019,4.39,'M€/PJ','TEMOA_IT');
INSERT INTO "CostVariable" VALUES ('PIE',2020,'UPS_IMP_COA_HCO',2020,5.22,'M€/PJ','TEMOA_IT');
INSERT INTO "CostVariable" VALUES ('PIE',2030,'UPS_IMP_COA_HCO',2030,3.35,'M€/PJ','TEMOA_IT');
INSERT INTO "CostVariable" VALUES ('PIE',2040,'UPS_IMP_COA_HCO',2040,3.35,'M€/PJ','TEMOA_IT');
INSERT INTO "CostVariable" VALUES ('PIE',2050,'UPS_IMP_COA_HCO',2050,3.35,'M€/PJ','TEMOA_IT');
INSERT INTO "CostVariable" VALUES ('PIE',2011,'UPS_IMP_OIL_CRD',2011,11.85,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('PIE',2015,'UPS_IMP_OIL_CRD',2015,11.45,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('PIE',2017,'UPS_IMP_OIL_CRD',2017,9.75,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('PIE',2019,'UPS_IMP_OIL_CRD',2019,10.34,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('PIE',2020,'UPS_IMP_OIL_CRD',2020,10.94,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('PIE',2030,'UPS_IMP_OIL_CRD',2030,9.37,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('PIE',2040,'UPS_IMP_OIL_CRD',2040,10.31,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('PIE',2050,'UPS_IMP_OIL_CRD',2050,11.34,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('PIE',2012,'UPS_IMP_OIL_NSP',2012,31.72,'M€/PJ','TEMOA_IT');
INSERT INTO "CostVariable" VALUES ('PIE',2014,'UPS_IMP_OIL_NSP',2014,30.65,'M€/PJ','TEMOA_IT');
INSERT INTO "CostVariable" VALUES ('PIE',2017,'UPS_IMP_OIL_NSP',2017,26.89,'M€/PJ','average of 2016-2018 TEMOA_IT');
INSERT INTO "CostVariable" VALUES ('PIE',2020,'UPS_IMP_OIL_NSP',2020,29.27,'M€/PJ','TEMOA_IT');
INSERT INTO "CostVariable" VALUES ('PIE',2030,'UPS_IMP_OIL_NSP',2030,25.08,'M€/PJ','TEMOA_IT');
INSERT INTO "CostVariable" VALUES ('PIE',2040,'UPS_IMP_OIL_NSP',2040,27.59,'M€/PJ','TEMOA_IT');
INSERT INTO "CostVariable" VALUES ('PIE',2050,'UPS_IMP_OIL_NSP',2050,30.35,'M€/PJ','TEMOA_IT');
INSERT INTO "CostVariable" VALUES ('PIE',2012,'UPS_REG_OIL_NSP',2012,5.00E-01,'M€/PJ','');

INSERT INTO "CostVariable" VALUES ('PIE',2012,'UPS_IMP_BIO_DST',2012,30.22,'M€/PJ','TEMOA_IT');
INSERT INTO "CostVariable" VALUES ('PIE',2014,'UPS_IMP_BIO_DST',2014,22.48,'M€/PJ','TEMOA_IT');
INSERT INTO "CostVariable" VALUES ('PIE',2017,'UPS_IMP_BIO_DST',2017,20.97,'M€/PJ','2016-18 average TEMOA_IT');
INSERT INTO "CostVariable" VALUES ('PIE',2020,'UPS_IMP_BIO_DST',2020,26.67,'M€/PJ','TEMOA_IT');
INSERT INTO "CostVariable" VALUES ('PIE',2025,'UPS_IMP_BIO_DST',2025,31.20,'M€/PJ','TEMOA_IT');
INSERT INTO "CostVariable" VALUES ('PIE',2030,'UPS_IMP_BIO_DST',2030,47.19,'M€/PJ','TEMOA_IT');
INSERT INTO "CostVariable" VALUES ('PIE',2040,'UPS_IMP_BIO_DST',2040,50.93,'M€/PJ','TEMOA_IT');
INSERT INTO "CostVariable" VALUES ('PIE',2050,'UPS_IMP_BIO_DST',2050,54.67,'M€/PJ','TEMOA_IT');


INSERT INTO "CostVariable" VALUES ('PIE',2011,'UPS_IMP_OIL_PTC',2011,10.675,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('PIE',2012,'UPS_IMP_OIL_PTC',2012,11.90,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('PIE',2014,'UPS_IMP_OIL_PTC',2014,9.31,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('PIE',2017,'UPS_IMP_OIL_PTC',2017,8.24,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('PIE',2020,'UPS_IMP_OIL_PTC',2020,7.77,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('PIE',2025,'UPS_IMP_OIL_PTC',2025,8.56,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('PIE',2030,'UPS_IMP_OIL_PTC',2030,12.95,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('PIE',2040,'UPS_IMP_OIL_PTC',2040,13.98,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('PIE',2050,'UPS_IMP_OIL_PTC',2050,15.00,'M€/PJ','');
-- Extraction of fossil fuels
INSERT INTO "CostVariable" VALUES ('PIE',2011,'UPS_MIN_RES_HOIL',2011,1.00,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('PIE',2012,'UPS_MIN_GRO_HOIL',2012,1.10,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('PIE',2012,'UPS_MIN_DSC_HOIL',2012,1.20,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('PIE',2011,'UPS_MIN_RES_NGA',2011,0.70,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('PIE',2012,'UPS_MIN_GRO_NGA',2012,0.80,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('PIE',2012,'UPS_MIN_DSC_NGA',2012,0.90,'M€/PJ','');
-- Primary production
INSERT INTO "CostVariable" VALUES ('PIE',2011,'UPS_PRI_OIL',2011,1.0E-04,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('PIE',2011,'UPS_PRI_NGA',2011,2.00,'M€/PJ','');
-- Secondary transformation
INSERT INTO "CostVariable" VALUES ('PIE',2011,'UPS_SEC_REF',2011,0.001,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('PIE',2011,'UPS_SEC_BFG_OXY',2011,2.0,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('PIE',2011,'UPS_SEC_OVC_COG',2011,2.0,'M€/PJ','');

-- Renewables
INSERT INTO "CostVariable" VALUES ('PIE',2012,'UPS_RNW_HYD',2012,1.00E-04,'M€/PJ','TEMOA_IT');
INSERT INTO "CostVariable" VALUES ('PIE',2012,'UPS_RNW_SOL',2012,1.00E-04,'M€/PJ','TEMOA_IT');
INSERT INTO "CostVariable" VALUES ('PIE',2012,'UPS_RNW_WIN',2012,1.00E-04,'M€/PJ','TEMOA_IT');
INSERT INTO "CostVariable" VALUES ('PIE',2012,'UPS_RNW_SLB',2012,6.25E-01,'M€/PJ','TEMOA_IT');
INSERT INTO "CostVariable" VALUES ('PIE',2012,'UPS_RNW_BMU',2012,1.00E-02,'M€/PJ','TEMOA_IT');
INSERT INTO "CostVariable" VALUES ('PIE',2012,'UPS_RNW_BGS',2012,4.00E+00,'M€/PJ','TEMOA_IT');
INSERT INTO "CostVariable" VALUES ('PIE',2012,'UPS_RNW_BLQ',2012,5.00E+00,'M€/PJ','TEMOA_IT');
INSERT INTO "CostVariable" VALUES ('PIE',2012,'UPS_RNW_BIN',2012,1.00E-02,'M€/PJ','TEMOA_IT');
INSERT INTO "CostVariable" VALUES ('PIE',2012,'UPS_RNW_WOD',2012,3.50E+01,'M€/PJ','TEMOA_IT');
-- Dummy
INSERT INTO "CostVariable" VALUES ('PIE',2012,'UPS_DMYDMY_BIO',2012,5E4,'M€/PJ','');
-- Residential sector
-- Fuel technologies
INSERT INTO "CostVariable" VALUES ('PIE',2011,'RES_FT_NGA_E',2011,2.07E+00,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('PIE',2011,'RES_FT_DST_E',2011,3.11E+00,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('PIE',2011,'RES_FT_HFO_E',2011,3.11E+00,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('PIE',2011,'RES_FT_LPG_E',2011,3.11E+00,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('PIE',2011,'RES_FT_BIO_E',2011,3.52E+00,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('PIE',2011,'RES_FT_ELC_E',2011,15.0,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('PIE',2012,'RES_FT_ELC_N',2012,15.0,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('PIE',2012,'RES_FT_SOL_N',2012,0.10,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('PIE',2012,'RES_FT_DST_N',2012,3.11,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('PIE',2012,'RES_FT_HFO_N',2012,3.11,'M€/PJ','');
-- Micro-CHP
INSERT INTO "CostVariable" VALUES ('PIE',2012,'RES_CHP_NGA_CI_N',2012,4.17,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('PIE',2014,'RES_CHP_NGA_CI_N',2014,3.75,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('PIE',2023,'RES_CHP_NGA_CI_N',2023,3.22,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('PIE',2030,'RES_CHP_NGA_CI_N',2030,2.78,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('PIE',2012,'RES_CHP_NGA_MICRO_N',2012,2.78,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('PIE',2014,'RES_CHP_NGA_MICRO_N',2014,2.22,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('PIE',2023,'RES_CHP_NGA_MICRO_N',2023,1.67,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('PIE',2030,'RES_CHP_NGA_MICRO_N',2030,1.67,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('PIE',2012,'RES_CHP_NGA_CC_N',2012,0.50,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('PIE',2014,'RES_CHP_NGA_CC_N',2014,0.44,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('PIE',2023,'RES_CHP_NGA_CC_N',2023,0.42,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('PIE',2023,'RES_CHP_NGA_STR_N',2023,5.00,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('PIE',2030,'RES_CHP_NGA_STR_N',2030,2.78,'M€/PJ','');
-- Commercial sector
-- Fuel technologies
INSERT INTO "CostVariable" VALUES ('PIE',2011,'COM_FT_DST_E',2011,3.280E+00,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('PIE',2011,'COM_FT_NGA_E',2011,3.280E+00,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('PIE',2011,'COM_FT_ELC_EN',2011,1.50E+01,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('PIE',2011,'COM_FT_LPG_EN',2011,2.48E+00,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('PIE',2012,'COM_FT_NGA_N',2012,1.66E+00,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('PIE',2012,'COM_FT_DST_N',2012,2.48E+00,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('PIE',2012,'COM_FT_BIO_N',2012,2.82E+00,'M€/PJ','');

INSERT INTO "CostVariable" VALUES ('PIE',2030,'COM_H2G_C1',2030,0.3,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('PIE',2030,'COM_H2G_C2',2030,0.3,'M€/PJ','');

-- Micro-CHP
INSERT INTO "CostVariable" VALUES ('PIE',2012,'COM_CHP_NGA_CI_N',2012,4.17E+00,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('PIE',2012,'COM_CHP_NGA_MICRO_N',2012,2.78E+00,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('PIE',2012,'COM_CHP_NGA_CC_N',2012,5.00E-01,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('PIE',2030,'COM_CHP_NGA_SOFC_N',2030,4.86,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('PIE',2030,'COM_CHP_HH2_PEMFC_N',2030,6.94,'M€/PJ','');
-- Agriculture sector
-- Fuel technologies
INSERT INTO "CostVariable" VALUES ('PIE',2011,'AGR_FT_NGA_E',2011,2.17,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('PIE',2011,'AGR_FT_DST_E',2011,3.26,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('PIE',2011,'AGR_FT_GSL_E',2011,3.26,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('PIE',2011,'AGR_FT_LPG_E',2011,3.26,'M€/PJ','');
-- Industrial sector
-- New technologies
-- Fuel Technologies
INSERT INTO "CostVariable" VALUES ('PIE',2011,'IND_FT_ELC_EN',2011,1.50E+01,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('PIE',2011,'IND_FT_HET_E',2011,5.00E+00,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('PIE',2012,'IND_FT_BFG_N',2012,8.28E-01,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('PIE',2012,'IND_FT_BIO_N',2012,1.76E+00,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('PIE',2012,'IND_FT_COA_N',2012,1.55E+00,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('PIE',2012,'IND_FT_COG_EN',2012,1.55E+00,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('PIE',2012,'IND_FT_COK_N',2012,1.55E+00,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('PIE',2012,'IND_FT_ETH_N',2012,1.55E+00,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('PIE',2012,'IND_FT_HFO_N',2012,1.55E+00,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('PIE',2012,'IND_FT_LPG_N',2012,1.55E+00,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('PIE',2012,'IND_FT_NAP_N',2012,1.55E+00,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('PIE',2012,'IND_FT_NGA_N',2012,1.04E+00,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('PIE',2012,'IND_FT_OIL_N',2012,1.55E+00,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('PIE',2012,'IND_FT_PTC_N',2012,1.55E+00,'M€/PJ','');


-- Micro-CHP
INSERT INTO "CostVariable" VALUES ('PIE',2012,'IND_CHP_NGA_CI_N',2012,4.17E+00,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('PIE',2014,'IND_CHP_NGA_CI_N',2014,3.75E+00,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('PIE',2025,'IND_CHP_NGA_CI_N',2025,3.22E+00,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('PIE',2030,'IND_CHP_NGA_CI_N',2030,2.78E+00,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('PIE',2012,'IND_CHP_NGA_TG_N',2012,1.67E+00,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('PIE',2014,'IND_CHP_NGA_TG_N',2014,1.53E+00,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('PIE',2025,'IND_CHP_NGA_TG_N',2025,1.39E+00,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('PIE',2012,'IND_CHP_NGA_TV_N',2012,1.39E+00,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('PIE',2014,'IND_CHP_BLQ_CI_N',2014,3.75E+00,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('PIE',2025,'IND_CHP_BLQ_CI_N',2025,3.22E+00,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('PIE',2030,'IND_CHP_BLQ_CI_N',2030,2.78E+00,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('PIE',2050,'IND_CHP_BLQ_CI_N',2050,2.50E+00,'M€/PJ','');

-- Hydrogen
INSERT INTO "CostVariable" VALUES ('PIE',2025,'IND_H2G_DE',2025,0.00,'M€/PJ','TEMOA_IT');
INSERT INTO "CostVariable" VALUES ('PIE',2025,'H2_SMR_DS',2025,0.65,'M€/PJ','TEMOA_IT');
INSERT INTO "CostVariable" VALUES ('PIE',2030,'H2_SMR_DS',2030,0.04,'M€/PJ','TEMOA_IT');
INSERT INTO "CostVariable" VALUES ('PIE',2020,'H2_SMR_CL',2020,0.08,'M€/PJ','interpolation - TEMOA_IT');
INSERT INTO "CostVariable" VALUES ('PIE',2025,'H2_SMR_CL',2025,0.08,'M€/PJ','TEMOA_IT');
INSERT INTO "CostVariable" VALUES ('PIE',2030,'H2_SMR_CL',2030,0.05,'M€/PJ','TEMOA_IT');
INSERT INTO "CostVariable" VALUES ('PIE',2020,'H2_SMR_CS',2020,0.11,'M€/PJ','interpolation - TEMOA_IT');
INSERT INTO "CostVariable" VALUES ('PIE',2025,'H2_SMR_CS',2025,0.08,'M€/PJ','TEMOA_IT');
INSERT INTO "CostVariable" VALUES ('PIE',2030,'H2_SMR_CS',2030,0.05,'M€/PJ','TEMOA_IT');
INSERT INTO "CostVariable" VALUES ('PIE',2020,'H2_HOPO',2020,0.14,'M€/PJ','TEMOA_IT');

INSERT INTO "CostVariable" VALUES ('PIE',2020,'H2_TRA_FT_GC1',2020,0.25,'M€/PJ','Interpolation - TEMOA_IT');
INSERT INTO "CostVariable" VALUES ('PIE',2025,'H2_TRA_FT_GC1',2025,0.2,'M€/PJ','TEMOA_IT');
INSERT INTO "CostVariable" VALUES ('PIE',2020,'H2_TRA_FT_GC2',2020,0.25,'M€/PJ','Interpolation - TEMOA_IT');
INSERT INTO "CostVariable" VALUES ('PIE',2025,'H2_TRA_FT_GC2',2025,0.2,'M€/PJ','TEMOA_IT');
INSERT INTO "CostVariable" VALUES ('PIE',2020,'H2_TRA_FT_GC3',2020,0.5,'M€/PJ','TEMOA_IT');
INSERT INTO "CostVariable" VALUES ('PIE',2025,'H2_TRA_FT_GC3',2025,0.4,'M€/PJ','TEMOA_IT');
INSERT INTO "CostVariable" VALUES ('PIE',2020,'H2_TRA_FT_GC4',2020,0.2,'M€/PJ','TEMOA_IT');
INSERT INTO "CostVariable" VALUES ('PIE',2020,'H2_TRA_FT_GC5',2020,0.5,'M€/PJ','TEMOA_IT');
INSERT INTO "CostVariable" VALUES ('PIE',2025,'H2_TRA_FT_GC5',2025,0.4,'M€/PJ','TEMOA_IT');


CREATE TABLE "CostInvest" (
   "regions"  text,
   "tech" text,
   "vintage"  integer,
   "cost_invest"  real,
   "cost_invest_units"    text,
   "cost_invest_notes"    text,
   primary key("regions","tech","vintage"),
   foreign key("tech") references "technologies"("tech"),
   foreign key("vintage") references "time_periods"("t_periods")
);

-- Upstream sector

INSERT INTO "CostInvest" VALUES ('PIE','UPS_RNW_BLQ',2015,4416,'M$/GW','ATB 2022- changed from 2007 to 2012');
INSERT INTO "CostInvest" VALUES ('PIE','UPS_RNW_BLQ',2020,4416,'M$/GW','ATB 2022');
INSERT INTO "CostInvest" VALUES ('PIE','UPS_RNW_BLQ',2050,3626,'M$/GW','ATB 2022');

-- Transport sector
-- Fuel technologies
INSERT INTO "CostInvest" VALUES ('PIE','TRA_FT_DST_N',2012,30.0,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('PIE','TRA_FT_GSL_N',2012,30.0,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('PIE','TRA_FT_JTK_N',2012,5.0,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('PIE','TRA_FT_LPG_N',2012,30.0,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('PIE','TRA_FT_NGA_N',2012,100.0,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('PIE','TRA_FT_BIO_DST_N',2012,10.0,'M€/PJ','');
-- New technologies
INSERT INTO "CostInvest" VALUES ('PIE','TRA_ROA_2WH_DST_N',2012,4121.00,'M€/Bvkm','interpolation of temoa-it');
INSERT INTO "CostInvest" VALUES ('PIE','TRA_ROA_2WH_DST_N',2020,4090.00,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('PIE','TRA_ROA_2WH_ELC_N',2020,9220.00,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('PIE','TRA_ROA_2WH_ELC_N',2030,5330.00,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('PIE','TRA_ROA_2WH_ELC_N',2050,4780.00,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('PIE','TRA_ROA_2WH_GSL_N',2012,3751.00,'M€/Bvkm','interpolation of temoa-it');
INSERT INTO "CostInvest" VALUES ('PIE','TRA_ROA_2WH_GSL_N',2020,3720.00,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('PIE','TRA_ROA_2WH_HYBG_N',2020,5210.00,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('PIE','TRA_ROA_2WH_HYBG_N',2040,5040.00,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('PIE','TRA_ROA_BUS_GSL_N',2012,3171.00,'M€/Bvkm','interpolation of temoa-it');
INSERT INTO "CostInvest" VALUES ('PIE','TRA_ROA_BUS_GSL_N',2020,3140.00,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('PIE','TRA_ROA_BUS_DST_N',2012,3225.00,'M€/Bvkm','interpolation of temoa-it');
INSERT INTO "CostInvest" VALUES ('PIE','TRA_ROA_BUS_DST_N',2020,3200.00,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('PIE','TRA_ROA_BUS_LPG_N',2012,3340.00,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('PIE','TRA_ROA_BUS_NGA_N',2012,3340.00,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('PIE','TRA_ROA_BUS_ELC_N',2020,6470.00,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('PIE','TRA_ROA_BUS_ELC_N',2030,5620.00,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('PIE','TRA_ROA_BUS_ELC_N',2040,5250.00,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('PIE','TRA_ROA_BUS_ELC_N',2050,5030.00,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('PIE','TRA_ROA_BUS_FCELL_N',2020,11320.00,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('PIE','TRA_ROA_BUS_FCELL_N',2030,9930.00,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('PIE','TRA_ROA_BUS_FCELL_N',2040,9260.00,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('PIE','TRA_ROA_BUS_FCELL_N',2050,8770.00,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('PIE','TRA_ROA_BUS_HYBD_N',2017,6080.00,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('PIE','TRA_ROA_BUS_HYBD_N',2030,4640.00,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('PIE','TRA_ROA_BUS_HYBD_N',2040,4430.00,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('PIE','TRA_ROA_BUS_HYBD_N',2050,4270.00,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('PIE','TRA_ROA_CAR_GSL_N',2012,2855.00,'M€/Bvkm','interpolation of temoa-it');
INSERT INTO "CostInvest" VALUES ('PIE','TRA_ROA_CAR_GSL_N',2020,2830.00,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('PIE','TRA_ROA_CAR_DST_N',2012,3085.00,'M€/Bvkm','interpolation of temoa-it');
INSERT INTO "CostInvest" VALUES ('PIE','TRA_ROA_CAR_DST_N',2020,3060.00,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('PIE','TRA_ROA_CAR_LPG_N',2012,3060.00,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('PIE','TRA_ROA_CAR_NGA_N',2012,3060.00,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('PIE','TRA_ROA_CAR_ELC_N',2020,5520.00,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('PIE','TRA_ROA_CAR_ELC_N',2030,3990.00,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('PIE','TRA_ROA_CAR_ELC_N',2050,3730.00,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('PIE','TRA_ROA_CAR_HYBG_N',2015,3585.00,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('PIE','TRA_ROA_CAR_HYBG_N',2030,3125.00,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('PIE','TRA_ROA_CAR_HYBG_N',2040,2914.90,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('PIE','TRA_ROA_CAR_HYBG_N',2050,2830.00,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('PIE','TRA_ROA_CAR_FCELL_N',2025,11590.0,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('PIE','TRA_ROA_CAR_FCELL_N',2030,5810.00,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('PIE','TRA_ROA_CAR_FCELL_N',2040,5420.00,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('PIE','TRA_ROA_CAR_FCELL_N',2050,5140.00,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('PIE','TRA_ROA_CAR_PIHYB_N',2017,5380.00,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('PIE','TRA_ROA_CAR_PIHYB_N',2030,4080.00,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('PIE','TRA_ROA_CAR_PIHYB_N',2040,3880.00,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('PIE','TRA_ROA_CAR_PIHYB_N',2050,3740.00,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('PIE','TRA_ROA_HTR_GSL_N',2012,4080.00,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('PIE','TRA_ROA_HTR_GSL_N',2020,4020.00,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('PIE','TRA_ROA_HTR_DST_N',2012,4311.00,'M€/Bvkm','interpolation of temoa-it');
INSERT INTO "CostInvest" VALUES ('PIE','TRA_ROA_HTR_DST_N',2020,4280.00,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('PIE','TRA_ROA_HTR_LPG_N',2012,4250.00,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('PIE','TRA_ROA_HTR_NGA_N',2012,4250.00,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('PIE','TRA_ROA_HTR_ELC_N',2025,8240.00,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('PIE','TRA_ROA_HTR_ELC_N',2030,7150.00,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('PIE','TRA_ROA_HTR_ELC_N',2040,6690.00,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('PIE','TRA_ROA_HTR_ELC_N',2050,6410.00,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('PIE','TRA_ROA_HTR_FCELL_N',2025,11780.00,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('PIE','TRA_ROA_HTR_FCELL_N',2030,10330.00,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('PIE','TRA_ROA_HTR_FCELL_N',2040,9630.00,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('PIE','TRA_ROA_HTR_FCELL_N',2050,9120.00,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('PIE','TRA_ROA_HTR_HYBD_N',2017,8140.00,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('PIE','TRA_ROA_HTR_HYBD_N',2030,6200.00,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('PIE','TRA_ROA_HTR_HYBD_N',2040,5920.00,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('PIE','TRA_ROA_HTR_HYBD_N',2050,5720.00,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('PIE','TRA_ROA_LCV_GSL_N',2012,2765.00,'M€/Bvkm','interpolation of temoa-it');
INSERT INTO "CostInvest" VALUES ('PIE','TRA_ROA_LCV_GSL_N',2020,2740.00,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('PIE','TRA_ROA_LCV_DST_N',2012,2765.00,'M€/Bvkm','interpolation of temoa-it');
INSERT INTO "CostInvest" VALUES ('PIE','TRA_ROA_LCV_DST_N',2020,2740.00,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('PIE','TRA_ROA_LCV_LPG_N',2012,3180.00,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('PIE','TRA_ROA_LCV_NGA_N',2012,3180.00,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('PIE','TRA_ROA_LCV_ELC_N',2020,6830.00,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('PIE','TRA_ROA_LCV_ELC_N',2030,4940.00,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('PIE','TRA_ROA_LCV_ELC_N',2040,4620.00,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('PIE','TRA_ROA_LCV_ELC_N',2050,4430.00,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('PIE','TRA_ROA_LCV_FCELL_N',2025,7700.00,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('PIE','TRA_ROA_LCV_FCELL_N',2030,5630.00,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('PIE','TRA_ROA_LCV_FCELL_N',2040,5250.00,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('PIE','TRA_ROA_LCV_FCELL_N',2050,4970.00,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('PIE','TRA_ROA_LCV_HYBD_N',2017,3270.00,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('PIE','TRA_ROA_LCV_HYBD_N',2030,3170.00,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('PIE','TRA_ROA_LCV_HYBD_N',2040,3130.00,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('PIE','TRA_ROA_LCV_HYBD_N',2050,3100.00,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('PIE','TRA_ROA_LCV_PIHYB_N',2020,6080.00,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('PIE','TRA_ROA_LCV_PIHYB_N',2030,4640.00,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('PIE','TRA_ROA_LCV_PIHYB_N',2040,4430.00,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('PIE','TRA_ROA_LCV_PIHYB_N',2050,4270.00,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('PIE','TRA_ROA_MTR_GSL_N',2012,3571.00,'M€/Bvkm','interpolation of temoa-it');
INSERT INTO "CostInvest" VALUES ('PIE','TRA_ROA_MTR_GSL_N',2020,3540.00,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('PIE','TRA_ROA_MTR_DST_N',2012,3811.00,'M€/Bvkm','interpolation of temoa-it');
INSERT INTO "CostInvest" VALUES ('PIE','TRA_ROA_MTR_DST_N',2020,3780.00,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('PIE','TRA_ROA_MTR_LPG_N',2012,3730.00,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('PIE','TRA_ROA_MTR_NGA_N',2012,3730.00,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('PIE','TRA_ROA_MTR_ELC_N',2020,7260.00,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('PIE','TRA_ROA_MTR_ELC_N',2030,6300.00,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('PIE','TRA_ROA_MTR_ELC_N',2040,5890.00,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('PIE','TRA_ROA_MTR_ELC_N',2050,5640.00,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('PIE','TRA_ROA_MTR_HYBD_N',2017,7190.00,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('PIE','TRA_ROA_MTR_HYBD_N',2030,5480.00,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('PIE','TRA_ROA_MTR_HYBD_N',2040,5230.00,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('PIE','TRA_ROA_MTR_HYBD_N',2050,5050.00,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('PIE','TRA_ROA_MTR_FCELL_N',2025,10370.00,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('PIE','TRA_ROA_MTR_FCELL_N',2030,9090.00,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('PIE','TRA_ROA_MTR_FCELL_N',2040,8480.00,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('PIE','TRA_ROA_MTR_FCELL_N',2050,8030.00,'M€/Bvkm','');

-- Electricity sector
-- New technologies
INSERT INTO "CostInvest" VALUES ('PIE','ELC_NGA_TURB_L80MW_N',2012,248,'M€/GW','');
INSERT INTO "CostInvest" VALUES ('PIE','ELC_NGA_TURB_L80MW_N',2015,237,'M€/GW','');
INSERT INTO "CostInvest" VALUES ('PIE','ELC_NGA_TURB_L80MW_N',2021,200,'M€/GW','');
INSERT INTO "CostInvest" VALUES ('PIE','ELC_WIN_N',2012,1462,'M$/GW','');
INSERT INTO "CostInvest" VALUES ('PIE','ELC_WIN_N',2020,1462,'M$/GW','ATB 2022');
INSERT INTO "CostInvest" VALUES ('PIE','ELC_WIN_N',2030,956,'M$/GW','ATB 2022');
INSERT INTO "CostInvest" VALUES ('PIE','ELC_WIN_N',2050,765,'M$/GW','ATB 2022');
INSERT INTO "CostInvest" VALUES ('PIE','ELC_PV_GRO_N',2012,1333,'M$/GW','');
INSERT INTO "CostInvest" VALUES ('PIE','ELC_PV_GRO_N',2020,1333,'M$/GW','ATB 2022');
INSERT INTO "CostInvest" VALUES ('PIE','ELC_PV_GRO_N',2030,754,'M$/GW','ATB 2022');
INSERT INTO "CostInvest" VALUES ('PIE','ELC_PV_GRO_N',2050,620,'M$/GW','ATB 2022');
INSERT INTO "CostInvest" VALUES ('PIE','ELC_PV_ROOF_N',2012,2263,'M$/GW','');
INSERT INTO "CostInvest" VALUES ('PIE','ELC_PV_ROOF_N',2020,2263,'M$/GW','ATB 2022');
INSERT INTO "CostInvest" VALUES ('PIE','ELC_PV_ROOF_N',2030,972,'M$/GW','ATB 2022');
INSERT INTO "CostInvest" VALUES ('PIE','ELC_PV_ROOF_N',2050,751,'M$/GW','ATB 2022');
INSERT INTO "CostInvest" VALUES ('PIE','ELC_BLQ_N',2015,4416,'M$/GW','ATB 2022');
INSERT INTO "CostInvest" VALUES ('PIE','ELC_BLQ_N',2020,4416,'M$/GW','ATB 2022');
INSERT INTO "CostInvest" VALUES ('PIE','ELC_BLQ_N',2050,3626,'M$/GW','ATB 2022');
INSERT INTO "CostInvest" VALUES ('PIE','ELC_BIO_5C_N',2012,2207,'M€/GW','');
INSERT INTO "CostInvest" VALUES ('PIE','ELC_BIO_5C_N',2014,2150,'M€/GW','');
INSERT INTO "CostInvest" VALUES ('PIE','ELC_BIO_5C_N',2021,2000,'M€/GW','');
INSERT INTO "CostInvest" VALUES ('PIE','ELC_BIO_5C_N',2030,1850,'M€/GW','');
INSERT INTO "CostInvest" VALUES ('PIE','ELC_BIO_5C_N',2040,1700,'M€/GW','');
INSERT INTO "CostInvest" VALUES ('PIE','ELC_BIO_5C_N',2050,1500,'M€/GW','');
INSERT INTO "CostInvest" VALUES ('PIE','ELC_HYD_MICRO_N',2012,4500,'M€/GW','');
INSERT INTO "CostInvest" VALUES ('PIE','ELC_HYD_MINI_N',2012,2250,'M€/GW','');
INSERT INTO "CostInvest" VALUES ('PIE','ELC_BIOGS_AGR_N',2012,3393,'M€/GW','');
INSERT INTO "CostInvest" VALUES ('PIE','ELC_BIOGS_AGR_N',2015,3350,'M€/GW','');
INSERT INTO "CostInvest" VALUES ('PIE','ELC_BIOGS_AGR_N',2021,2900,'M€/GW','');
INSERT INTO "CostInvest" VALUES ('PIE','ELC_BIOGS_AGR_N',2030,2700,'M€/GW','');
INSERT INTO "CostInvest" VALUES ('PIE','ELC_BIOGS_AGR_N',2040,2500,'M€/GW','');
INSERT INTO "CostInvest" VALUES ('PIE','ELC_CHP_BMU_N',2012,3478,'M€/GW','');
INSERT INTO "CostInvest" VALUES ('PIE','ELC_CHP_BMU_N',2015,3429,'M€/GW','');
INSERT INTO "CostInvest" VALUES ('PIE','ELC_CHP_BMU_N',2021,2895,'M€/GW','');
INSERT INTO "CostInvest" VALUES ('PIE','ELC_CHP_BMU_N',2030,2287,'M€/GW','');
INSERT INTO "CostInvest" VALUES ('PIE','ELC_CHP_BMU_N',2040,2059,'M€/GW','');
INSERT INTO "CostInvest" VALUES ('PIE','ELC_CHP_NGA_TURB_N',2012,960,'M€/GW','');
INSERT INTO "CostInvest" VALUES ('PIE','ELC_CHP_NGA_CC_N',2012,720,'M€/GW','');
INSERT INTO "CostInvest" VALUES ('PIE','ELC_CHP_NGA_CP_N',2012,702,'M€/GW','');
INSERT INTO "CostInvest" VALUES ('PIE','ELC_CHP_NGA_TAP_N',2012,702,'M€/GW','');
-- Residential sector
-- Fuel technologies
INSERT INTO "CostInvest" VALUES ('PIE','RES_FT_NGA_N',2012,2.00E+01,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('PIE','RES_FT_HET_N',2012,5.07E+00,'M€/PJ','');

-- New technologies
INSERT INTO "CostInvest" VALUES ('PIE','RES_RF_CLB_N',2012,1600.0,'','');
INSERT INTO "CostInvest" VALUES ('PIE','RES_RF_CLA_N',2012,2200.0,'','');
INSERT INTO "CostInvest" VALUES ('PIE','RES_RF_CLA+_N',2012,2700.0,'','');
INSERT INTO "CostInvest" VALUES ('PIE','RES_RF_CLA++_N',2012,3700.0,'','');
INSERT INTO "CostInvest" VALUES ('PIE','RES_RF_RFG_2020_N',2020,7700.0,'','');
INSERT INTO "CostInvest" VALUES ('PIE','RES_RF_FRZ_CLB_N',2012,1100.0,'','');
INSERT INTO "CostInvest" VALUES ('PIE','RES_RF_FRZ_CLA_N',2012,1500.0,'','');
INSERT INTO "CostInvest" VALUES ('PIE','RES_RF_FRZ_CLA++_N',2012,1900.0,'','');
INSERT INTO "CostInvest" VALUES ('PIE','RES_RF_FRZ_2020_N',2020,3954,'','');
INSERT INTO "CostInvest" VALUES ('PIE','RES_WH_DST_N',2012,2.42E+00,'','');
INSERT INTO "CostInvest" VALUES ('PIE','RES_WH_DST_COND_N',2012,3.60E+00,'','');
INSERT INTO "CostInvest" VALUES ('PIE','RES_WH_NGA_N',2012,2.06E+00,'','');
INSERT INTO "CostInvest" VALUES ('PIE','RES_WH_NGA_COND_N',2012,2.82E+00,'','');
INSERT INTO "CostInvest" VALUES ('PIE','RES_WH_LPG_N',2012,2.26E+00,'','');
INSERT INTO "CostInvest" VALUES ('PIE','RES_WH_HFO_N',2012,2.26E+00,'','');
INSERT INTO "CostInvest" VALUES ('PIE','RES_WH_LPG_COND_N',2012,2.89E+00,'','');
INSERT INTO "CostInvest" VALUES ('PIE','RES_WH_WPL_BIO_N',2012,5.00E+00,'','');
INSERT INTO "CostInvest" VALUES ('PIE','RES_WH_ELC_RES_N',2012,1.70E+00,'','');
INSERT INTO "CostInvest" VALUES ('PIE','RES_WH_AHP_ELC_N',2012,1.96E+01,'','');
INSERT INTO "CostInvest" VALUES ('PIE','RES_WH_HNS_ELC_N',2012,2.09E+01,'','');
INSERT INTO "CostInvest" VALUES ('PIE','RES_WH_SOL_N',2012,2.90E+01,'','');
INSERT INTO "CostInvest" VALUES ('PIE','RES_WH_SOL_N',2020,2.77E+01,'','');
INSERT INTO "CostInvest" VALUES ('PIE','RES_WH_SOL_N',2050,2.65E+01,'','');
INSERT INTO "CostInvest" VALUES ('PIE','RES_WH_PDC_ACS_N',2012,1.00E-02,'','');
INSERT INTO "CostInvest" VALUES ('PIE','RES_CW_ELC_N',2012,1.466E+03,'','');
INSERT INTO "CostInvest" VALUES ('PIE','RES_CW_ELC_IMP_N',2012,2.256E+03,'','');
INSERT INTO "CostInvest" VALUES ('PIE','RES_CW_ELC_ADV_N',2012,2.707E+03,'','');
INSERT INTO "CostInvest" VALUES ('PIE','RES_CW_2020_ELC_N',2020,3.835E+03,'','');
INSERT INTO "CostInvest" VALUES ('PIE','RES_CD_ELC_N',2012,6.000E+03,'','');
INSERT INTO "CostInvest" VALUES ('PIE','RES_CD_ELC_ADV_N',2012,7.500E+03,'','');
INSERT INTO "CostInvest" VALUES ('PIE','RES_CD_ELC_NEW_N',2020,9.000E+03,'','');
INSERT INTO "CostInvest" VALUES ('PIE','RES_DW_ELC_STD_N',2012,2.400E+03,'','');
INSERT INTO "CostInvest" VALUES ('PIE','RES_DW_ELC_IMP_N',2012,2.800E+03,'','');
INSERT INTO "CostInvest" VALUES ('PIE','RES_DW_ELC_ADV_N',2012,3.400E+03,'','');
INSERT INTO "CostInvest" VALUES ('PIE','RES_DW_2020_ELC_N',2020,5.300E+03,'','');
INSERT INTO "CostInvest" VALUES ('PIE','RES_CK_NGA_N',2012,9.199E+01,'','');
INSERT INTO "CostInvest" VALUES ('PIE','RES_CK_LPG_N',2012,1.380E+02,'','');
INSERT INTO "CostInvest" VALUES ('PIE','RES_CK_ELC_N',2012,1.840E+02,'','');
INSERT INTO "CostInvest" VALUES ('PIE','RES_CK_BIO_N',2012,6.618E+01,'','');
INSERT INTO "CostInvest" VALUES ('PIE','RES_LG_BFL_IMP_N',2012,2.378E+01,'','');
INSERT INTO "CostInvest" VALUES ('PIE','RES_LG_SFL_IMP_N',2012,7.930E+00,'','');
INSERT INTO "CostInvest" VALUES ('PIE','RES_LG_EFL_N',2012,5.074E+01,'','');
INSERT INTO "CostInvest" VALUES ('PIE','RES_LG_LFL_N',2012,3.960E+00,'','');
INSERT INTO "CostInvest" VALUES ('PIE','RES_LG_SFL_N',2012,1.306E+01,'','');
INSERT INTO "CostInvest" VALUES ('PIE','RES_LG_LHAL_N',2012,1.060E+00,'','');
INSERT INTO "CostInvest" VALUES ('PIE','RES_LG_SHAL_IMP_N',2012,5.440E+00,'','');
INSERT INTO "CostInvest" VALUES ('PIE','RES_LG_SHAL_N',2012,1.270E+00,'','');
INSERT INTO "CostInvest" VALUES ('PIE','RES_LG_MIN_N',2012,4.200E-01,'','');
INSERT INTO "CostInvest" VALUES ('PIE','RES_LG_SIN_N',2012,7.900E-01,'','');
INSERT INTO "CostInvest" VALUES ('PIE','RES_LG_LED_ELC_N',2012,6.342E+01,'','');

INSERT INTO "CostInvest" VALUES ('PIE','RES_SH_DST_COND_LC_N',2012,8.720E+00,'','');
INSERT INTO "CostInvest" VALUES ('PIE','RES_SH_NGA_COND_LC_N',2012,6.840E+00,'','');
INSERT INTO "CostInvest" VALUES ('PIE','RES_SH_LPG_COND_LC_N',2012,7.000E+00,'','');
INSERT INTO "CostInvest" VALUES ('PIE','RES_SH_WST_BIO_LC_N' ,2012,2.000E+00,'','');
INSERT INTO "CostInvest" VALUES ('PIE','RES_SH_WPL_BIO_LC_N' ,2012,1.585E+01,'','');
INSERT INTO "CostInvest" VALUES ('PIE','RES_SH_AHP_ELC_LC_N' ,2012,4.756E+01,'','');
INSERT INTO "CostInvest" VALUES ('PIE','RES_SH_HNS_ELC_LC_N' ,2012,5.074E+01,'','');
INSERT INTO "CostInvest" VALUES ('PIE','RES_SH_HPP_ELC_LC_N' ,2012,6.659E+01,'','');
INSERT INTO "CostInvest" VALUES ('PIE','RES_SH_HEX_HET_LC_N' ,2012,2.880E+00,'','');
INSERT INTO "CostInvest" VALUES ('PIE','RES_SH_HEX_HET_LC_N' ,2020,2.753E+00,'','');
INSERT INTO "CostInvest" VALUES ('PIE','RES_SH_HEX_HET_LC_N' ,2050,2.632E+00,'','');
INSERT INTO "CostInvest" VALUES ('PIE','RES_SH_HP_HET_LC_N'  ,2012,1.000E-02,'','');
INSERT INTO "CostInvest" VALUES ('PIE','RES_SH_HPTS_LC_N'    ,2012,4.756E+01,'','');
INSERT INTO "CostInvest" VALUES ('PIE','RES_SH_HPTS_LC_N'    ,2020,4.118E+01,'','');
INSERT INTO "CostInvest" VALUES ('PIE','RES_SH_HPTS_LC_N'    ,2050,3.922E+01,'','');
INSERT INTO "CostInvest" VALUES ('PIE','RES_SH_SOL_DST_LC_N' ,2012,2.350E+01,'','');
INSERT INTO "CostInvest" VALUES ('PIE','RES_SH_SOL_DST_LC_N' ,2020,2.247E+01,'','');
INSERT INTO "CostInvest" VALUES ('PIE','RES_SH_SOL_DST_LC_N' ,2050,2.148E+01,'','');
INSERT INTO "CostInvest" VALUES ('PIE','RES_SH_SOL_LPG_LC_N' ,2012,2.300E+01,'','');
INSERT INTO "CostInvest" VALUES ('PIE','RES_SH_SOL_LPG_LC_N' ,2020,2.199E+01,'','');
INSERT INTO "CostInvest" VALUES ('PIE','RES_SH_SOL_LPG_LC_N' ,2050,2.102E+01,'','');
INSERT INTO "CostInvest" VALUES ('PIE','RES_SH_SOL_NGA_LC_N' ,2012,2.249E+01,'','');
INSERT INTO "CostInvest" VALUES ('PIE','RES_SH_SOL_NGA_LC_N' ,2020,2.150E+01,'','');
INSERT INTO "CostInvest" VALUES ('PIE','RES_SH_SOL_NGA_LC_N' ,2050,2.056E+01,'','');
INSERT INTO "CostInvest" VALUES ('PIE','RES_SH_DST_LC_N'     ,2012,5.866E+00,'','');
INSERT INTO "CostInvest" VALUES ('PIE','RES_SH_NGA_LC_N'     ,2012,4.994E+00,'','');
INSERT INTO "CostInvest" VALUES ('PIE','RES_SH_LPG_LC_N'     ,2012,5.470E+00,'','');

INSERT INTO "CostInvest" VALUES ('PIE','RES_SH_DST_COND_MC_N',2012,8.720E+00,'','');
INSERT INTO "CostInvest" VALUES ('PIE','RES_SH_NGA_COND_MC_N',2012,6.840E+00,'','');
INSERT INTO "CostInvest" VALUES ('PIE','RES_SH_LPG_COND_MC_N',2012,7.000E+00,'','');
INSERT INTO "CostInvest" VALUES ('PIE','RES_SH_WST_BIO_MC_N' ,2012,2.000E+00,'','');
INSERT INTO "CostInvest" VALUES ('PIE','RES_SH_WPL_BIO_MC_N' ,2012,1.585E+01,'','');
INSERT INTO "CostInvest" VALUES ('PIE','RES_SH_AHP_ELC_MC_N' ,2012,4.756E+01,'','');
INSERT INTO "CostInvest" VALUES ('PIE','RES_SH_HNS_ELC_MC_N' ,2012,5.074E+01,'','');
INSERT INTO "CostInvest" VALUES ('PIE','RES_SH_HPP_ELC_MC_N' ,2012,6.659E+01,'','');
INSERT INTO "CostInvest" VALUES ('PIE','RES_SH_HEX_HET_MC_N' ,2012,2.880E+00,'','');
INSERT INTO "CostInvest" VALUES ('PIE','RES_SH_HEX_HET_MC_N' ,2020,2.753E+00,'','');
INSERT INTO "CostInvest" VALUES ('PIE','RES_SH_HEX_HET_MC_N' ,2050,2.632E+00,'','');
INSERT INTO "CostInvest" VALUES ('PIE','RES_SH_HP_HET_MC_N'  ,2012,1.000E-02,'','');
INSERT INTO "CostInvest" VALUES ('PIE','RES_SH_HPTS_MC_N'    ,2012,4.756E+01,'','');
INSERT INTO "CostInvest" VALUES ('PIE','RES_SH_HPTS_MC_N'    ,2020,4.118E+01,'','');
INSERT INTO "CostInvest" VALUES ('PIE','RES_SH_HPTS_MC_N'    ,2050,3.922E+01,'','');
INSERT INTO "CostInvest" VALUES ('PIE','RES_SH_SOL_DST_MC_N' ,2012,2.350E+01,'','');
INSERT INTO "CostInvest" VALUES ('PIE','RES_SH_SOL_DST_MC_N' ,2020,2.247E+01,'','');
INSERT INTO "CostInvest" VALUES ('PIE','RES_SH_SOL_DST_MC_N' ,2050,2.148E+01,'','');
INSERT INTO "CostInvest" VALUES ('PIE','RES_SH_SOL_LPG_MC_N' ,2012,2.300E+01,'','');
INSERT INTO "CostInvest" VALUES ('PIE','RES_SH_SOL_LPG_MC_N' ,2020,2.199E+01,'','');
INSERT INTO "CostInvest" VALUES ('PIE','RES_SH_SOL_LPG_MC_N' ,2050,2.102E+01,'','');
INSERT INTO "CostInvest" VALUES ('PIE','RES_SH_SOL_NGA_MC_N' ,2012,2.249E+01,'','');
INSERT INTO "CostInvest" VALUES ('PIE','RES_SH_SOL_NGA_MC_N' ,2020,2.150E+01,'','');
INSERT INTO "CostInvest" VALUES ('PIE','RES_SH_SOL_NGA_MC_N' ,2050,2.056E+01,'','');
INSERT INTO "CostInvest" VALUES ('PIE','RES_SH_DST_MC_N'     ,2012,5.866E+00,'','');
INSERT INTO "CostInvest" VALUES ('PIE','RES_SH_NGA_MC_N'     ,2012,4.994E+00,'','');
INSERT INTO "CostInvest" VALUES ('PIE','RES_SH_LPG_MC_N'     ,2012,5.470E+00,'','');

INSERT INTO "CostInvest" VALUES ('PIE','RES_SH_DST_COND_HC_N',2012,8.720E+00,'','');
INSERT INTO "CostInvest" VALUES ('PIE','RES_SH_NGA_COND_HC_N',2012,6.840E+00,'','');
INSERT INTO "CostInvest" VALUES ('PIE','RES_SH_LPG_COND_HC_N',2012,7.000E+00,'','');
INSERT INTO "CostInvest" VALUES ('PIE','RES_SH_WST_BIO_HC_N' ,2012,2.000E+00,'','');
INSERT INTO "CostInvest" VALUES ('PIE','RES_SH_WPL_BIO_HC_N' ,2012,1.585E+01,'','');
INSERT INTO "CostInvest" VALUES ('PIE','RES_SH_AHP_ELC_HC_N' ,2012,4.756E+01,'','');
INSERT INTO "CostInvest" VALUES ('PIE','RES_SH_HNS_ELC_HC_N' ,2012,5.074E+01,'','');
INSERT INTO "CostInvest" VALUES ('PIE','RES_SH_HPP_ELC_HC_N' ,2012,6.659E+01,'','');
INSERT INTO "CostInvest" VALUES ('PIE','RES_SH_HEX_HET_HC_N' ,2012,2.880E+00,'','');
INSERT INTO "CostInvest" VALUES ('PIE','RES_SH_HEX_HET_HC_N' ,2020,2.753E+00,'','');
INSERT INTO "CostInvest" VALUES ('PIE','RES_SH_HEX_HET_HC_N' ,2050,2.632E+00,'','');
INSERT INTO "CostInvest" VALUES ('PIE','RES_SH_HP_HET_HC_N'  ,2012,1.000E-02,'','');
INSERT INTO "CostInvest" VALUES ('PIE','RES_SH_HPTS_HC_N'    ,2012,4.756E+01,'','');
INSERT INTO "CostInvest" VALUES ('PIE','RES_SH_HPTS_HC_N'    ,2020,4.118E+01,'','');
INSERT INTO "CostInvest" VALUES ('PIE','RES_SH_HPTS_HC_N'    ,2050,3.922E+01,'','');
INSERT INTO "CostInvest" VALUES ('PIE','RES_SH_DST_HC_N'     ,2012,5.866E+00,'','');
INSERT INTO "CostInvest" VALUES ('PIE','RES_SH_NGA_HC_N'     ,2012,4.994E+00,'','');
INSERT INTO "CostInvest" VALUES ('PIE','RES_SH_LPG_HC_N'     ,2012,5.470E+00,'','');

INSERT INTO "CostInvest" VALUES ('PIE','RES_SC_AHP_ELC_STD_N',2012,3.155E+01,'','');
INSERT INTO "CostInvest" VALUES ('PIE','RES_SC_AHP_ELC_IMP_N',2012,4.039E+01,'','');
INSERT INTO "CostInvest" VALUES ('PIE','RES_SC_CEN_N',2012,4.847E+01,'','');
INSERT INTO "CostInvest" VALUES ('PIE','RES_SC_ROOM_N',2012,4.702E+01,'','');
INSERT INTO "CostInvest" VALUES ('PIE','RES_SC_AHP_ELC_ADV_N',2012,5.049E+01,'','');
INSERT INTO "CostInvest" VALUES ('PIE','RES_SC_ROOM_ELC_NEW_N',2012,5.752E+01,'','');
INSERT INTO "CostInvest" VALUES ('PIE','RES_SC_AHP_NGA_ADV_N',2012,4.039E+01,'','');
INSERT INTO "CostInvest" VALUES ('PIE','RES_SC_CEN_NGA_N',2012,5.453E+01,'','');
INSERT INTO "CostInvest" VALUES ('PIE','RES_SC_AHP_NGA_N',2015,6.059E+01,'','');
INSERT INTO "CostInvest" VALUES ('PIE','RES_SC_HP_N',2012,1.000E-02,'','');
INSERT INTO "CostInvest" VALUES ('PIE','RES_MISC_EQP_N',2012,1.260E+00,'','');

INSERT INTO "CostInvest" VALUES ('PIE','RES_SH_ROOF_INS_HC_N',2012,481.32,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('PIE','RES_SH_INT_INS_HC_N',2012,859.34,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('PIE','RES_SH_BASE_INS_HC_N',2012,1493.51,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('PIE','RES_SH_WIN_INS_HC_N',2012,2767.65,'M€/PJ','');

INSERT INTO "CostInvest" VALUES ('PIE','RES_SH_ROOF_INS_MC_N',2012,320.315,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('PIE','RES_SH_INT_INS_MC_N',2012,335.11,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('PIE','RES_SH_BASE_INS_MC_N',2012,495.53,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('PIE','RES_SH_WIN_INS_MC_N',2012,1438.565,'M€/PJ','');

-- Micro-CHP
INSERT INTO "CostInvest" VALUES ('PIE','RES_CHP_NGA_CI_N',2012,1100,'€/kW','');
INSERT INTO "CostInvest" VALUES ('PIE','RES_CHP_NGA_CI_N',2014,1050,'€/kW','');
INSERT INTO "CostInvest" VALUES ('PIE','RES_CHP_NGA_CI_N',2021,980,'€/kW','');
INSERT INTO "CostInvest" VALUES ('PIE','RES_CHP_NGA_CI_N',2030,900,'€/kW','');
INSERT INTO "CostInvest" VALUES ('PIE','RES_CHP_NGA_MICRO_N',2012,1500,'€/kW','');
INSERT INTO "CostInvest" VALUES ('PIE','RES_CHP_NGA_MICRO_N',2014,1350,'€/kW','');
INSERT INTO "CostInvest" VALUES ('PIE','RES_CHP_NGA_MICRO_N',2023,1160,'€/kW','');
INSERT INTO "CostInvest" VALUES ('PIE','RES_CHP_NGA_MICRO_N',2030,1000,'€/kW','');
INSERT INTO "CostInvest" VALUES ('PIE','RES_CHP_NGA_CC_N',2012,1300,'€/kW','');
INSERT INTO "CostInvest" VALUES ('PIE','RES_CHP_NGA_CC_N',2014,1300,'€/kW','');
INSERT INTO "CostInvest" VALUES ('PIE','RES_CHP_NGA_CC_N',2023,1300,'€/kW','');
INSERT INTO "CostInvest" VALUES ('PIE','RES_CHP_NGA_STR_N',2023,2180,'€/kW','');
INSERT INTO "CostInvest" VALUES ('PIE','RES_CHP_NGA_STR_N',2030,2100,'€/kW','');
-- Upstream sector
-- Secondary transformation
INSERT INTO "CostInvest" VALUES ('PIE','UPS_SEC_REF',2012,4.58,'M€/PJ','');
-- Commercial sector
-- Fuel technologies
INSERT INTO "CostInvest" VALUES ('PIE','COM_FT_DST_N',2012,2.00E+01,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('PIE','COM_FT_NGA_N',2012,2.00E+01,'M€/PJ','');
-- New technologies
INSERT INTO "CostInvest" VALUES ('PIE','COM_LG_INC_N',2012,6.30E-01,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('PIE','COM_LG_SHAL_STD_N',2012,7.10E-01,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('PIE','COM_LG_HAL_IMP_N',2012,2.93E+00,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('PIE','COM_LG_SFL_N',2012,1.31E+01,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('PIE','COM_LG_LFL_N',2012,3.96E+00,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('PIE','COM_LG_CFL_N',2012,5.89E+00,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('PIE','COM_LG_MER_N',2012,3.80E+00,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('PIE','COM_LG_SOD_N',2012,6.24E+01,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('PIE','COM_WH_COND_DST_N',2012,3.60E+00,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('PIE','COM_WH_NGA_N',2012,2.06E+00,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('PIE','COM_WH_COND_NGA_N',2012,2.82E+00,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('PIE','COM_WH_LPG_N',2012,2.26E+00,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('PIE','COM_WH_COND_LPG_N',2012,2.89E+00,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('PIE','COM_WH_WPEL_BIO_N',2012,5.00E+00,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('PIE','COM_WH_ELC_N',2012,1.70E+00,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('PIE','COM_WH_AHP_ELC_N',2012,1.96E+01,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('PIE','COM_WH_HEX_HET_N',2012,1.50E+00,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('PIE','COM_SH_NGA_N',2012,4.99E+00,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('PIE','COM_SH_COND_NGA_N',2012,6.84E+00,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('PIE','COM_SH_LPG_N',2012,5.47E+00,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('PIE','COM_SH_COND_LPG_N',2012,7.00E+00,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('PIE','COM_SH_HEX_HET_N',2012,2.88E+00,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('PIE','COM_SH_HEX_HET_N',2020,2.75E+00,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('PIE','COM_SH_HEX_HET_N',2050,2.63E+00,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('PIE','COM_SH_HP_AIR_N',2012,4.32E+01,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('PIE','COM_SH_HP_PRB_N',2012,6.66E+01,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('PIE','COM_SH_HP_N',2012,4.32E+01,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('PIE','COM_SH_HP_N',2020,4.12E+01,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('PIE','COM_SH_HP_N',2050,3.92E+01,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('PIE','COM_SH_WPEL_N',2012,1.59E+01,'M€/PJ','');

INSERT INTO "CostInvest" VALUES ('PIE','COM_SC_HP_STD_N',2012,2.00E+01,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('PIE','COM_SC_HP_IMP_N',2012,3.21E+01,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('PIE','COM_SC_ROOF_STD_N',2012,1.05E+01,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('PIE','COM_SC_ROOF_ADV_N',2012,9.91E+00,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('PIE','COM_SC_REC_N',2012,1.91E+01,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('PIE','COM_SC_REC_IMP_N',2012,2.18E+01,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('PIE','COM_SC_CNF_N',2012,2.52E+01,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('PIE','COM_SC_CNF_IMP_N',2015,2.78E+01,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('PIE','COM_SC_CNT_N',2012,2.60E+01,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('PIE','COM_SC_ROOM_N',2012,3.25E+01,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('PIE','COM_SC_ABS_NGA_N',2012,2.35E+01,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('PIE','COM_SC_NGA_STD_N',2012,3.55E+01,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('PIE','COM_SC_NGA_IMP_N',2012,3.95E+01,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('PIE','COM_CK_NGA_N',2012,1.90E+02,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('PIE','COM_CK_LPG_N',2012,2.00E+02,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('PIE','COM_CK_ELC_N',2012,1.80E+02,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('PIE','COM_CK_BIO_N',2012,2.00E+02,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('PIE','COM_OE_OFF_ELC_STD_N',2012,7.39E+00,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('PIE','COM_OE_OFF_ELC_IMP_N',2012,7.99E+00,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('PIE','COM_OE_OFF_ADV_N',2012,8.49E+00,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('PIE','COM_RF_STD_N',2012,6.66E+00,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('PIE','COM_RF_IMP_N',2012,8.72E+00,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('PIE','COM_RF_N',2012,1.02E+01,'M€/PJ','');

INSERT INTO "CostInvest" VALUES ('PIE','COM_H2G_C1',2030,30.3,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('PIE','COM_H2G_C2',2030,30.3,'M€/PJ','');
-- Micro-CHP
INSERT INTO "CostInvest" VALUES ('PIE','COM_CHP_NGA_CI_N',2012,1100.0,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('PIE','COM_CHP_NGA_CI_N',2014,1050.0,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('PIE','COM_CHP_NGA_CI_N',2021,980.0,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('PIE','COM_CHP_NGA_CI_N',2030,900.0,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('PIE','COM_CHP_NGA_CI_N',2050,900.0,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('PIE','COM_CHP_NGA_MICRO_N',2012,1500.0,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('PIE','COM_CHP_NGA_MICRO_N',2014,1350.0,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('PIE','COM_CHP_NGA_MICRO_N',2021,1160.0,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('PIE','COM_CHP_NGA_MICRO_N',2030,1000.0,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('PIE','COM_CHP_NGA_MICRO_N',2050,1000.0,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('PIE','COM_CHP_NGA_CC_N',2012,1300.0,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('PIE','COM_CHP_NGA_CC_N',2014,1300.0,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('PIE','COM_CHP_NGA_CC_N',2021,1300.0,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('PIE','COM_CHP_NGA_CC_N',2030,1300.0,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('PIE','COM_CHP_NGA_CC_N',2050,1300.0,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('PIE','COM_CHP_NGA_SOFC_N',2030,2250,'M€/GW','');
INSERT INTO "CostInvest" VALUES ('PIE','COM_CHP_HH2_PEMFC_N',2030,1050,'M€/GW','');
-- Agriculture sector
-- Fuel technologies
-- Industrial sector
-- Fuel technologies
INSERT INTO "CostInvest" VALUES ('PIE','IND_FT_HET_N',2012,6.07,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('PIE','IND_FT_NGA_N',2012,20.0,'M€/PJ','');
-- New technologies
-- Machine drive and steam

INSERT INTO "CostInvest" VALUES ('PIE','IND_MD_LPG_N',2012,19.25,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('PIE','IND_MD_NGA_N',2012,23.10,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('PIE','IND_MD_ELC_N',2012,2.83,'M€/PJ','interpolation TEMOA_IT');
INSERT INTO "CostInvest" VALUES ('PIE','IND_MD_ELC_N',2015,4.50,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('PIE','IND_STM_BIO_N',2012,18.50,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('PIE','IND_STM_BFG_N',2012,5.60,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('PIE','IND_STM_DST_N',2012,5.60,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('PIE','IND_STM_ETH_N',2012,4.60,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('PIE','IND_STM_HET_N',2012,4.70,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('PIE','IND_STM_LPG_N',2012,3.00,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('PIE','IND_STM_NGA_N',2012,4.60,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('PIE','IND_STM_PTC_N',2012,15.20,'M€/PJ','');
-- Chemicals
INSERT INTO "CostInvest" VALUES ('PIE','IND_CH_HVC_NAPSC_N',2012,8.57E+02,'M€/Mt','');
INSERT INTO "CostInvest" VALUES ('PIE','IND_CH_HVC_NAPSC_N',2030,6.64E+02,'M€/Mt','');
INSERT INTO "CostInvest" VALUES ('PIE','IND_CH_HVC_ETHSC_N',2012,6.20E+02,'M€/Mt','');
INSERT INTO "CostInvest" VALUES ('PIE','IND_CH_HVC_ETHSC_N',2030,3.72E+02,'M€/Mt','');
INSERT INTO "CostInvest" VALUES ('PIE','IND_CH_HVC_GSOSC_N',2012,9.70E+02,'M€/Mt','');
INSERT INTO "CostInvest" VALUES ('PIE','IND_CH_HVC_LPGSC_N',2012,7.92E+02,'M€/Mt','');
INSERT INTO "CostInvest" VALUES ('PIE','IND_CH_HVC_LPGSC_N',2030,5.00E+02,'M€/Mt','');
INSERT INTO "CostInvest" VALUES ('PIE','IND_CH_HVC_NCC_N',2020,1.36E+03,'M€/Mt','');
INSERT INTO "CostInvest" VALUES ('PIE','IND_CH_HVC_BDH_N',2020,1.33E+03,'M€/Mt','');
INSERT INTO "CostInvest" VALUES ('PIE','IND_CH_HVC_N',2012,1.33E+03,'M€/Mt','');

INSERT INTO "CostInvest" VALUES ('PIE','IND_CH_OLF_PDH_N',2015,1.69E+03,'M€/Mt','');
INSERT INTO "CostInvest" VALUES ('PIE','IND_CH_OLF_MTO_N',2012,4.76E+02,'M€/Mt','');
INSERT INTO "CostInvest" VALUES ('PIE','IND_CH_AMM_NGASR_N',2012,8.35E+01,'M€/Mt','');
INSERT INTO "CostInvest" VALUES ('PIE','IND_CH_AMM_NGASR_N',2030,6.94E+01,'M€/Mt','');
INSERT INTO "CostInvest" VALUES ('PIE','IND_CH_AMM_NAPPOX_N',2012,1.28E+02,'M€/Mt','');
INSERT INTO "CostInvest" VALUES ('PIE','IND_CH_AMM_NAPPOX_N',2030,1.12E+02,'M€/Mt','');
INSERT INTO "CostInvest" VALUES ('PIE','IND_CH_AMM_COAGSF_N',2012,8.25E+02,'M€/Mt','');
INSERT INTO "CostInvest" VALUES ('PIE','IND_CH_AMM_COAGSF_N',2030,7.11E+02,'M€/Mt','');
INSERT INTO "CostInvest" VALUES ('PIE','IND_CH_AMM_BIOGSF_N',2025,2.22E+03,'M€/Mt','');
INSERT INTO "CostInvest" VALUES ('PIE','IND_CH_AMM_ELCSYS_N',2025,1.04E+02,'M€/Mt','');
INSERT INTO "CostInvest" VALUES ('PIE','IND_CH_MTH_NGASR_N',2012,7.38E+01,'M€/Mt','');
INSERT INTO "CostInvest" VALUES ('PIE','IND_CH_MTH_COGSR_N',2012,4.54E+01,'M€/Mt','');
INSERT INTO "CostInvest" VALUES ('PIE','IND_CH_MTH_LPGSR_N',2012,7.56E+01,'M€/Mt','');
INSERT INTO "CostInvest" VALUES ('PIE','IND_CH_MTH_COAGSF_N',2012,1.09E+02,'M€/Mt','');
INSERT INTO "CostInvest" VALUES ('PIE','IND_CH_MTH_BIOGSF_N',2025,7.10E+02,'M€/Mt','');
INSERT INTO "CostInvest" VALUES ('PIE','IND_CH_MTH_ELCSYS_N',2025,4.40E+01,'M€/Mt','');
INSERT INTO "CostInvest" VALUES ('PIE','IND_CH_CHL_MERC_N',2012,4.76E+02,'M€/Mt','');
INSERT INTO "CostInvest" VALUES ('PIE','IND_CH_CHL_MERC_N',2030,3.67E+02,'M€/Mt','');
INSERT INTO "CostInvest" VALUES ('PIE','IND_CH_CHL_DIAP_N',2012,4.76E+02,'M€/Mt','');
INSERT INTO "CostInvest" VALUES ('PIE','IND_CH_CHL_DIAP_N',2030,3.67E+02,'M€/Mt','');
INSERT INTO "CostInvest" VALUES ('PIE','IND_CH_CHL_MEMB_N',2012,4.76E+02,'M€/Mt','');
INSERT INTO "CostInvest" VALUES ('PIE','IND_CH_CHL_MEMB_N',2030,3.67E+02,'M€/Mt','');
INSERT INTO "CostInvest" VALUES ('PIE','IND_CH_EC_N',2012,1.00E+01,'M€/PJ','');

INSERT INTO "CostInvest" VALUES ('PIE','IND_CH_OTH_COK_N',2012,3.09E+00,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('PIE','IND_CH_OTH_DST_N',2012,2.95E+00,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('PIE','IND_CH_OTH_ELC_N',2012,1.00E+01,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('PIE','IND_CH_OTH_ETH_N',2012,3.09E+00,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('PIE','IND_CH_OTH_NGA_N',2012,2.60E+00,'M€/PJ','');

-- Iron and steel
INSERT INTO "CostInvest" VALUES ('PIE','IND_IS_BOF_BFBOF_N',2012,1.28E+02,'M€/Mt','');
INSERT INTO "CostInvest" VALUES ('PIE','IND_IS_DRI_DRIEAF_N',2012,4.58E+02,'M€/Mt','');
INSERT INTO "CostInvest" VALUES ('PIE','IND_IS_DRI_HDREAF_N',2030,6.34E+02,'M€/Mt','');
INSERT INTO "CostInvest" VALUES ('PIE','IND_IS_BOF_HISBOF_N',2025,4.40E+02,'M€/Mt','');
INSERT INTO "CostInvest" VALUES ('PIE','IND_IS_BOF_ULCOWIN_N',2030,6.94E+03,'M€/Mt','');
INSERT INTO "CostInvest" VALUES ('PIE','IND_IS_BOF_ULCOLYSIS_N',2030,6.72E+03,'M€/Mt','');
-- Non-ferrous metals
INSERT INTO "CostInvest" VALUES ('PIE','IND_NF_AMN_BAY_N',2012,1.56E+03,'M€/Mt','');
INSERT INTO "CostInvest" VALUES ('PIE','IND_NF_ALU_HLH_N',2012,4.41E+03,'M€/Mt','');
INSERT INTO "CostInvest" VALUES ('PIE','IND_NF_ALU_SEC_N',2012,1.26E+03,'M€/Mt','');
INSERT INTO "CostInvest" VALUES ('PIE','IND_NF_ALU_HLHIA_N',2030,3.87E+03,'M€/Mt','');
INSERT INTO "CostInvest" VALUES ('PIE','IND_NF_ALU_CBT_N',2050,1.30E+03,'M€/Mt','');
INSERT INTO "CostInvest" VALUES ('PIE','IND_NF_ALU_KAO_N',2050,1.56E+03,'M€/Mt','');
INSERT INTO "CostInvest" VALUES ('PIE','IND_NF_COP_N',2012,4.40E+03,'M€/Mt','');
INSERT INTO "CostInvest" VALUES ('PIE','IND_NF_ZNC_N',2012,2.00E+03,'M€/Mt','');
INSERT INTO "CostInvest" VALUES ('PIE','IND_NF_EC_N',2012,8.15E+01,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('PIE','IND_NF_OTH_ELC_N',2012,3.15E+00,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('PIE','IND_NF_OTH_ELC_N',2040,4.09E+00,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('PIE','IND_NF_OTH_DST_N',2012,2.94E+00,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('PIE','IND_NF_OTH_NGA_N',2012,2.66E+00,'M€/PJ','');
-- Non-metallic minerals
INSERT INTO "CostInvest" VALUES ('PIE','IND_NM_CLK_DRY_N',2012,3.49E+02,'M€/Mt','');
INSERT INTO "CostInvest" VALUES ('PIE','IND_NM_CLK_WET_N',2012,3.49E+02,'M€/Mt','');
INSERT INTO "CostInvest" VALUES ('PIE','IND_NM_CEM_BLN_N',2012,1.20E+01,'M€/Mt','');
INSERT INTO "CostInvest" VALUES ('PIE','IND_NM_CLK_DRYCL_PCCS_N',2020,7.40E+02,'M€/Mt','');
INSERT INTO "CostInvest" VALUES ('PIE','IND_NM_CLK_DRYCL_OCCS_N',2030,4.34E+02,'M€/Mt','');
INSERT INTO "CostInvest" VALUES ('PIE','IND_NM_CEM_AAC_N',2030,1.10E+03,'M€/Mt','');
INSERT INTO "CostInvest" VALUES ('PIE','IND_NM_CEM_BEL_N',2030,3.61E+02,'M€/Mt','');
INSERT INTO "CostInvest" VALUES ('PIE','IND_NM_LIM_LRK_N',2012,3.98E+02,'M€/Mt','');
INSERT INTO "CostInvest" VALUES ('PIE','IND_NM_GLS_FOSS_N',2012,3.32E+02,'M€/Mt','');
INSERT INTO "CostInvest" VALUES ('PIE','IND_NM_GLS_ELEC_N',2012,3.32E+02,'M€/Mt','');
INSERT INTO "CostInvest" VALUES ('PIE','IND_NM_CRM_N',2012,1.25E+02,'M€/Mt','');
INSERT INTO "CostInvest" VALUES ('PIE','IND_NM_EC_N',2012,1.00E+01,'M€/PJ','');

-- Pulp and paper
INSERT INTO "CostInvest" VALUES ('PIE','IND_PP_PUL_KRF_N',2012,1.36E+03,'M€/Mt','');
INSERT INTO "CostInvest" VALUES ('PIE','IND_PP_PUL_SUL_N',2012,1.36E+03,'M€/Mt','');
INSERT INTO "CostInvest" VALUES ('PIE','IND_PP_PUL_MEC_N',2012,3.00E+02,'M€/Mt','');
INSERT INTO "CostInvest" VALUES ('PIE','IND_PP_PUL_SCH_N',2012,8.28E+02,'M€/Mt','');
INSERT INTO "CostInvest" VALUES ('PIE','IND_PP_PUL_REC_N',2012,6.42E+02,'M€/Mt','');
INSERT INTO "CostInvest" VALUES ('PIE','IND_PP_PAP_N',2012,1.80E+03,'M€/Mt','');
INSERT INTO "CostInvest" VALUES ('PIE','IND_PP_PH_HFO_N',2012,7.41E+01,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('PIE','IND_PP_PH_NGA_N',2012,7.41E+01,'M€/PJ','');
-- Micro-CHP
INSERT INTO "CostInvest" VALUES ('PIE','IND_CHP_NGA_CI_N',2012,1.10E+03,'M€/GW','');
INSERT INTO "CostInvest" VALUES ('PIE','IND_CHP_NGA_CI_N',2014,1.05E+03,'M€/GW','');
INSERT INTO "CostInvest" VALUES ('PIE','IND_CHP_NGA_CI_N',2025,1.03E+03,'M€/GW','');
INSERT INTO "CostInvest" VALUES ('PIE','IND_CHP_NGA_CI_N',2030,9.45E+02,'M€/GW','');
INSERT INTO "CostInvest" VALUES ('PIE','IND_CHP_NGA_TG_N',2012,8.00E+02,'M€/GW','');
INSERT INTO "CostInvest" VALUES ('PIE','IND_CHP_NGA_TV_N',2012,1.50E+03,'M€/GW','');
INSERT INTO "CostInvest" VALUES ('PIE','IND_CHP_BLQ_CI_N',2014,2.10E+03,'M€/GW','');
INSERT INTO "CostInvest" VALUES ('PIE','IND_CHP_BLQ_CI_N',2025,2.06E+03,'M€/GW','');
INSERT INTO "CostInvest" VALUES ('PIE','IND_CHP_BLQ_CI_N',2030,1.89E+03,'M€/GW','');
INSERT INTO "CostInvest" VALUES ('PIE','IND_CHP_BLQ_CI_N',2050,1.80E+03,'M€/GW','');
-- Other energy use
INSERT INTO "CostInvest" VALUES ('PIE','IND_OTH_OTH_ELC_N',2012,12.00,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('PIE','IND_OTH_PH_DST_N',2012,10.00,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('PIE','IND_OTH_PH_HFO_N',2012,8.25,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('PIE','IND_OTH_PH_LPG_N',2012,6.00,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('PIE','IND_OTH_PH_NGA_N',2012,5.00,'M€/PJ','');

-- Hydrogen
INSERT INTO "CostInvest" VALUES ('PIE','IND_H2G_DE',2025,0.0,'M€/PJ','TEMOA_IT');
INSERT INTO "CostInvest" VALUES ('PIE','H2_SMR_DS',2025,52.1,'M€/GW','TEMOA_IT');
INSERT INTO "CostInvest" VALUES ('PIE','H2_SMR_DS',2030,36.71,'M€/GW','TEMOA_IT');
INSERT INTO "CostInvest" VALUES ('PIE','H2_SMR_CL',2020,6.38,'M€/PJ','TEMOA_IT');
INSERT INTO "CostInvest" VALUES ('PIE','H2_SMR_CL',2025,6.38,'M€/PJ','TEMOA_IT');
INSERT INTO "CostInvest" VALUES ('PIE','H2_SMR_CL',2030,5.02,'M€/PJ','TEMOA_IT');
INSERT INTO "CostInvest" VALUES ('PIE','H2_SMR_CS',2020,13.69,'M€/PJ','TEMOA_IT');
INSERT INTO "CostInvest" VALUES ('PIE','H2_SMR_CS',2025,13.69,'M€/PJ','TEMOA_IT');
INSERT INTO "CostInvest" VALUES ('PIE','H2_SMR_CS',2030,10.92,'M€/PJ','TEMOA_IT');
INSERT INTO "CostInvest" VALUES ('PIE','H2_HOPO',2020,13.69,'M€/PJ','TEMOA_IT');

INSERT INTO "CostInvest" VALUES ('PIE','H2_TRA_FT_GC1',2020,50.8,'M€/PJ','TEMOA_IT');
INSERT INTO "CostInvest" VALUES ('PIE','H2_TRA_FT_GC1',2025,45.8,'M€/PJ','TEMOA_IT');
INSERT INTO "CostInvest" VALUES ('PIE','H2_TRA_FT_GC2',2020,50.8,'M€/PJ','TEMOA_IT');
INSERT INTO "CostInvest" VALUES ('PIE','H2_TRA_FT_GC2',2025,45.8,'M€/PJ','TEMOA_IT');
INSERT INTO "CostInvest" VALUES ('PIE','H2_TRA_FT_GC3',2020,66.7,'M€/PJ','TEMOA_IT');
INSERT INTO "CostInvest" VALUES ('PIE','H2_TRA_FT_GC3',2025,62.0,'M€/PJ','TEMOA_IT');
INSERT INTO "CostInvest" VALUES ('PIE','H2_TRA_FT_GC4',2020,51.9,'M€/PJ','TEMOA_IT');
INSERT INTO "CostInvest" VALUES ('PIE','H2_TRA_FT_GC4',2025,47.2,'M€/PJ','TEMOA_IT');
INSERT INTO "CostInvest" VALUES ('PIE','H2_TRA_FT_GC5',2020,66.7,'M€/PJ','TEMOA_IT');
INSERT INTO "CostInvest" VALUES ('PIE','H2_TRA_FT_GC5',2025,62.0,'M€/PJ','TEMOA_IT');


CREATE TABLE "CostFixed" (
   "regions"  text not null,
   "periods"  integer not null,
   "tech" text not null,
   "vintage"  integer not null,
   "cost_fixed"   real,
   "cost_fixed_units" text,
   "cost_fixed_notes" text,
   primary key("regions","periods","tech","vintage"),
   foreign key("tech") references "technologies"("tech"),
   foreign key("vintage") references "time_periods"("t_periods"),
   foreign key("periods") references "time_periods"("t_periods")
);
-- Transport sector
-- New technologies
INSERT INTO "CostFixed" VALUES ('PIE',2011,'TRA_RAIL_DSL_EN',2011,4.31,'','');
INSERT INTO "CostFixed" VALUES ('PIE',2011,'TRA_RAIL_ELC_EN',2011,4.31,'','');
INSERT INTO "CostFixed" VALUES ('PIE',2011,'TRA_ELC_DIV',2011,4.31,'','');
INSERT INTO "CostFixed" VALUES ('PIE',2011,'TRA_OTH_ELC_EN',2011,4.31,'','');
INSERT INTO "CostFixed" VALUES ('PIE',2011,'TRA_FT_ELC',2011,4.31,'','');

INSERT INTO "CostFixed" VALUES ('PIE',2011,'TRA_AVI_EN',2011,4.31,'','');
INSERT INTO "CostFixed" VALUES ('PIE',2011,'TRA_FT_LPG_E',2011,4.31,'','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'TRA_FT_LPG_N',2012,4.31,'','');
INSERT INTO "CostFixed" VALUES ('PIE',2011,'TRA_FT_GSL_E',2011,4.31,'','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'TRA_FT_GSL_N',2012,4.31,'','');
INSERT INTO "CostFixed" VALUES ('PIE',2011,'TRA_FT_BIO_DST_E',2011,4.31,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'TRA_FT_BIO_DST_N',2012,5.31,'M€/PJ','');

INSERT INTO "CostFixed" VALUES ('PIE',2011,'TRA_DSL_BLN',2011,4.31,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2011,'TRA_FT_DST_E',2011,4.31,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'TRA_FT_DST_N',2012,4.31,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'TRA_ROA_2WH_GSL_N',2012,62.63,'M€/Bvkm','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'TRA_ROA_2WH_DST_N',2012,62.63,'M€/Bvkm','');
INSERT INTO "CostFixed" VALUES ('PIE',2020,'TRA_ROA_2WH_ELC_N',2020,51.33,'M€/Bvkm','');
INSERT INTO "CostFixed" VALUES ('PIE',2020,'TRA_ROA_2WH_HYBG_N',2020,61.76,'M€/Bvkm','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'TRA_ROA_BUS_GSL_N',2012,62.63,'M€/Bvkm','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'TRA_ROA_BUS_DST_N',2012,62.63,'M€/Bvkm','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'TRA_ROA_BUS_LPG_N',2012,64.37,'M€/Bvkm','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'TRA_ROA_BUS_NGA_N',2012,64.37,'M€/Bvkm','');
INSERT INTO "CostFixed" VALUES ('PIE',2020,'TRA_ROA_BUS_ELC_N',2020,51.33,'M€/Bvkm','');
INSERT INTO "CostFixed" VALUES ('PIE',2017,'TRA_ROA_BUS_HYBD_N',2017,61.76,'M€/Bvkm','');
INSERT INTO "CostFixed" VALUES ('PIE',2020,'TRA_ROA_BUS_FCELL_N',2020,60.89,'M€/Bvkm','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'TRA_ROA_CAR_GSL_N',2012,62.63,'M€/Bvkm','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'TRA_ROA_CAR_DST_N',2012,62.63,'M€/Bvkm','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'TRA_ROA_CAR_LPG_N',2012,64.37,'M€/Bvkm','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'TRA_ROA_CAR_NGA_N',2012,64.37,'M€/Bvkm','');
INSERT INTO "CostFixed" VALUES ('PIE',2020,'TRA_ROA_CAR_ELC_N',2020,51.33,'M€/Bvkm','');
INSERT INTO "CostFixed" VALUES ('PIE',2015,'TRA_ROA_CAR_HYBG_N',2015,61.76,'M€/Bvkm','');
INSERT INTO "CostFixed" VALUES ('PIE',2025,'TRA_ROA_CAR_FCELL_N',2025,70.03,'M€/Bvkm','');
INSERT INTO "CostFixed" VALUES ('PIE',2017,'TRA_ROA_CAR_PIHYB_N',2017,60.00,'M€/Bvkm','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'TRA_ROA_HTR_GSL_N',2012,62.63,'M€/Bvkm','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'TRA_ROA_HTR_DST_N',2012,62.63,'M€/Bvkm','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'TRA_ROA_HTR_LPG_N',2012,64.37,'M€/Bvkm','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'TRA_ROA_HTR_NGA_N',2012,64.37,'M€/Bvkm','');
INSERT INTO "CostFixed" VALUES ('PIE',2025,'TRA_ROA_HTR_ELC_N',2025,51.33,'M€/Bvkm','');
INSERT INTO "CostFixed" VALUES ('PIE',2017,'TRA_ROA_HTR_HYBD_N',2017,61.76,'M€/Bvkm','');
INSERT INTO "CostFixed" VALUES ('PIE',2025,'TRA_ROA_HTR_FCELL_N',2025,60.89,'M€/Bvkm','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'TRA_ROA_LCV_GSL_N',2012,62.63,'M€/Bvkm','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'TRA_ROA_LCV_DST_N',2012,62.63,'M€/Bvkm','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'TRA_ROA_LCV_LPG_N',2012,64.37,'M€/Bvkm','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'TRA_ROA_LCV_NGA_N',2012,64.37,'M€/Bvkm','');
INSERT INTO "CostFixed" VALUES ('PIE',2020,'TRA_ROA_LCV_ELC_N',2020,51.33,'M€/Bvkm','');
INSERT INTO "CostFixed" VALUES ('PIE',2017,'TRA_ROA_LCV_HYBD_N',2017,61.76,'M€/Bvkm','');
INSERT INTO "CostFixed" VALUES ('PIE',2025,'TRA_ROA_LCV_FCELL_N',2025,60.89,'M€/Bvkm','');
INSERT INTO "CostFixed" VALUES ('PIE',2020,'TRA_ROA_LCV_PIHYB_N',2020,60.00,'M€/Bvkm','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'TRA_ROA_MTR_GSL_N',2012,62.63,'M€/Bvkm','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'TRA_ROA_MTR_DST_N',2012,62.63,'M€/Bvkm','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'TRA_ROA_MTR_LPG_N',2012,64.37,'M€/Bvkm','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'TRA_ROA_MTR_NGA_N',2012,64.37,'M€/Bvkm','');
INSERT INTO "CostFixed" VALUES ('PIE',2020,'TRA_ROA_MTR_ELC_N',2020,51.33,'M€/Bvkm','');
INSERT INTO "CostFixed" VALUES ('PIE',2017,'TRA_ROA_MTR_HYBD_N',2017,61.76,'M€/Bvkm','');
INSERT INTO "CostFixed" VALUES ('PIE',2025,'TRA_ROA_MTR_FCELL_N',2025,60.89,'M€/Bvkm','');

-- Electricity sector
-- Base year technologies
INSERT INTO "CostFixed" VALUES ('PIE',2011,'ELC_NGA_CC_E',2011,13.50,'M€/GW','');
INSERT INTO "CostFixed" VALUES ('PIE',2011,'ELC_NGA_STM_REP_E',2011,15.40,'M€/GW','');
INSERT INTO "CostFixed" VALUES ('PIE',2011,'ELC_NGA_TURB_E',2011,26.24,'M€/GW','');
INSERT INTO "CostFixed" VALUES ('PIE',2011,'ELC_CHP_NGA_CC_E',2011,20.11,'M€/GW','');
INSERT INTO "CostFixed" VALUES ('PIE',2011,'ELC_CHP_NGA_TURB_E',2011,32.85,'M€/GW','');
INSERT INTO "CostFixed" VALUES ('PIE',2011,'ELC_CHP_NGA_STM_COND_E',2011,34.27,'M€/GW','');
INSERT INTO "CostFixed" VALUES ('PIE',2011,'ELC_CHP_BMU_E',2011,220.50,'M€/GW','');
INSERT INTO "CostFixed" VALUES ('PIE',2011,'ELC_CHP_BIO_E',2011,220.50,'M€/GW','');
INSERT INTO "CostFixed" VALUES ('PIE',2011,'ELC_BGS_E',2011,12.50,'M€/GW','');
INSERT INTO "CostFixed" VALUES ('PIE',2011,'ELC_BIO_E',2011,12.50,'M€/GW','');
INSERT INTO "CostFixed" VALUES ('PIE',2011,'ELC_SOL_E',2011,30.80,'M€/GW','');
INSERT INTO "CostFixed" VALUES ('PIE',2011,'ELC_WIN_E',2011,34.00,'M€/GW','');
INSERT INTO "CostFixed" VALUES ('PIE',2011,'ELC_HYD_FLO_E',2011,33.65,'M€/GW','');
INSERT INTO "CostFixed" VALUES ('PIE',2011,'ELC_HYD_RES_E',2011,13.29,'M€/GW','');
INSERT INTO "CostFixed" VALUES ('PIE',2011,'ELC_HYD_PUM_E',2011,20.76,'M€/GW','');

-- Planned technologies
INSERT INTO "CostFixed" VALUES ('PIE',2012,'ELC_NGA_CC_P',2012,12.91,'M€/GW','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'ELC_CHP_NGA_CC_P',2012,21.45,'M€/GW','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'ELC_CHP_NGA_TURB_P',2012,23.10,'M€/GW','');

-- New technologies
INSERT INTO "CostFixed" VALUES ('PIE',2012,'ELC_NGA_TURB_L80MW_N',2012,8.50,'M€/GW','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'ELC_WIN_N',2012,49.00,'M$/GW','ATB 2022');
INSERT INTO "CostFixed" VALUES ('PIE',2020,'ELC_WIN_N',2020,43.00,'M$/GW','ATB 2022');
INSERT INTO "CostFixed" VALUES ('PIE',2030,'ELC_WIN_N',2030,38.95,'M$/GW','ATB 2022');
INSERT INTO "CostFixed" VALUES ('PIE',2050,'ELC_WIN_N',2050,33.11,'M$/GW','ATB 2022');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'ELC_PV_GRO_N',2012,43.24,'M$/GW','ATB 2022');
INSERT INTO "CostFixed" VALUES ('PIE',2020,'ELC_PV_GRO_N',2020,22.62,'M$/GW','ATB 2022');
INSERT INTO "CostFixed" VALUES ('PIE',2030,'ELC_PV_GRO_N',2030,15.22,'M$/GW','ATB 2022');
INSERT INTO "CostFixed" VALUES ('PIE',2050,'ELC_PV_GRO_N',2050,13.25,'M$/GW','ATB 2022');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'ELC_PV_ROOF_N',2012,48.08,'M$/GW','ATB 2022');
INSERT INTO "CostFixed" VALUES ('PIE',2020,'ELC_PV_ROOF_N',2020,24.04,'M$/GW','ATB 2022');
INSERT INTO "CostFixed" VALUES ('PIE',2030,'ELC_PV_ROOF_N',2030,12.44,'M$/GW','ATB 2022');
INSERT INTO "CostFixed" VALUES ('PIE',2050,'ELC_PV_ROOF_N',2050,10.35,'M$/GW','ATB 2022');
INSERT INTO "CostFixed" VALUES ('PIE',2015,'ELC_BLQ_N',2015,150.85,'M$/GW','ATB 2022');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'ELC_BIO_5C_N',2012,75.00,'M€/GW','');
INSERT INTO "CostFixed" VALUES ('PIE',2014,'ELC_BIO_5C_N',2014,67.00,'M€/GW','');
INSERT INTO "CostFixed" VALUES ('PIE',2021,'ELC_BIO_5C_N',2021,60.00,'M€/GW','');
INSERT INTO "CostFixed" VALUES ('PIE',2030,'ELC_BIO_5C_N',2030,54.00,'M€/GW','');
INSERT INTO "CostFixed" VALUES ('PIE',2040,'ELC_BIO_5C_N',2040,50.00,'M€/GW','');
INSERT INTO "CostFixed" VALUES ('PIE',2050,'ELC_BIO_5C_N',2050,40.00,'M€/GW','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'ELC_HYD_MICRO_N',2012,78.00,'M€/GW','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'ELC_HYD_MINI_N',2012,33.00,'M€/GW','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'ELC_BIOGS_AGR_N',2012,75.00,'M€/GW','');
INSERT INTO "CostFixed" VALUES ('PIE',2015,'ELC_BIOGS_AGR_N',2015,73.70,'M€/GW','');
INSERT INTO "CostFixed" VALUES ('PIE',2021,'ELC_BIOGS_AGR_N',2021,55.00,'M€/GW','');
INSERT INTO "CostFixed" VALUES ('PIE',2030,'ELC_BIOGS_AGR_N',2030,45.00,'M€/GW','');
INSERT INTO "CostFixed" VALUES ('PIE',2040,'ELC_BIOGS_AGR_N',2040,40.00,'M€/GW','');

-- Secondary transformation
INSERT INTO "CostFixed" VALUES ('PIE',2011,'UPS_SEC_REF',2011,4.580E-02,'M€/PJ','');
-- Residential sector
-- Fuel technologies
INSERT INTO "CostFixed" VALUES ('PIE',2012,'RES_FT_NGA_N',2012,4.10E+00,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'RES_FT_DST_N',2012,6.15E+00,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'RES_FT_HFO_N',2012,6.15E+00,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'RES_FT_LPG_N',2012,6.15E+00,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'RES_FT_BIO_N',2012,6.97E+00,'M€/PJ','');
-- New technologies
INSERT INTO "CostFixed" VALUES ('PIE',2012,'RES_RF_CLB_N',2012,20.0,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'RES_RF_CLA_N',2012,20.0,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'RES_RF_CLA+_N',2012,30.0,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'RES_RF_CLA++_N',2012,40.0,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2020,'RES_RF_RFG_2020_N',2020,80.0,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'RES_RF_FRZ_CLB_N',2012,10.0,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'RES_RF_FRZ_CLA_N',2012,10.0,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'RES_RF_FRZ_CLA++_N',2012,20.0,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2020,'RES_RF_FRZ_2020_N',2020,40.0,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'RES_WH_DST_N',2012,2.42E-02,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'RES_WH_DST_COND_N',2012,3.60E-02,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'RES_WH_NGA_N',2012,2.06E-02,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'RES_WH_NGA_COND_N',2012,2.82E-02,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'RES_WH_LPG_N',2012,2.26E-02,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'RES_WH_HFO_N',2012,2.26E-02,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'RES_WH_LPG_COND_N',2012,2.89E-02,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'RES_WH_WPL_BIO_N',2012,5.00E-02,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'RES_WH_ELC_RES_N',2012,3.40E-02,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'RES_WH_AHP_ELC_N',2012,1.96E-01,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'RES_WH_HNS_ELC_N',2012,2.09E-01,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'RES_WH_SOL_N',2012,1.00E-02,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'RES_CW_ELC_N',2012,10,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'RES_CW_ELC_IMP_N',2012,20,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'RES_CW_ELC_ADV_N',2012,20,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2020,'RES_CW_2020_ELC_N',2020,30,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'RES_CD_ELC_N',2012,20,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'RES_CD_ELC_ADV_N',2012,30,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2020,'RES_CD_ELC_NEW_N',2020,40,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'RES_DW_ELC_STD_N',2012,20,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'RES_DW_ELC_IMP_N',2012,30,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'RES_DW_ELC_ADV_N',2012,30,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2020,'RES_DW_2020_ELC_N',2020,50,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'RES_CK_NGA_N',2012,2.300E+00,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'RES_CK_LPG_N',2012,3.449E+00,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'RES_CK_ELC_N',2012,4.599E+00,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'RES_CK_BIO_N',2012,4.963E+00,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'RES_LG_LHAL_N',2012,4.200E-01,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'RES_LG_SHAL_IMP_N',2012,8.200E-01,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'RES_LG_SHAL_N',2012,5.100E-01,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'RES_LG_MIN_N',2012,3.800E-01,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'RES_LG_SIN_N',2012,7.100E-01,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'RES_SH_DST_LC_N',2012,5.866E-02,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'RES_SH_DST_COND_LC_N',2012,8.720E-02,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'RES_SH_NGA_LC_N',2012,4.994E-02,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'RES_SH_NGA_COND_LC_N',2012,6.840E-02,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'RES_SH_LPG_LC_N',2012,5.470E-02,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'RES_SH_LPG_COND_LC_N',2012,7.000E-02,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'RES_SH_WST_BIO_LC_N',2012,2.000E-02,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'RES_SH_WPL_BIO_LC_N',2012,1.585E-01,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'RES_SH_AHP_ELC_LC_N',2012,4.756E-01,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'RES_SH_HNS_ELC_LC_N',2012,5.074E-01,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'RES_SH_HPP_ELC_LC_N',2012,6.659E-01,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'RES_SH_HEX_HET_LC_N',2012,2.880E-02,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'RES_SH_HP_HET_LC_N',2012,1.000E-04,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'RES_SH_HPTS_LC_N',2012,4.756E-01,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'RES_SH_SOL_DST_LC_N',2012,7.000E-02,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'RES_SH_SOL_LPG_LC_N',2012,6.000E-02,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'RES_SH_SOL_NGA_LC_N',2012,6.000E-02,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'RES_SH_DST_MC_N',2012,5.866E-02,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'RES_SH_DST_COND_MC_N',2012,8.720E-02,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'RES_SH_NGA_MC_N',2012,4.994E-02,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'RES_SH_NGA_COND_MC_N',2012,6.840E-02,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'RES_SH_LPG_MC_N',2012,5.470E-02,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'RES_SH_LPG_COND_MC_N',2012,7.000E-02,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'RES_SH_WST_BIO_MC_N',2012,2.000E-02,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'RES_SH_WPL_BIO_MC_N',2012,1.585E-01,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'RES_SH_AHP_ELC_MC_N',2012,4.756E-01,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'RES_SH_HNS_ELC_MC_N',2012,5.074E-01,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'RES_SH_HPP_ELC_MC_N',2012,6.659E-01,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'RES_SH_HEX_HET_MC_N',2012,2.880E-02,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'RES_SH_HP_HET_MC_N',2012,1.000E-04,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'RES_SH_HPTS_MC_N',2012,4.756E-01,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'RES_SH_SOL_DST_MC_N',2012,7.000E-02,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'RES_SH_SOL_LPG_MC_N',2012,6.000E-02,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'RES_SH_SOL_NGA_MC_N',2012,6.000E-02,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'RES_SH_DST_HC_N',2012,5.866E-02,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'RES_SH_DST_COND_HC_N',2012,8.720E-02,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'RES_SH_NGA_HC_N',2012,4.994E-02,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'RES_SH_NGA_COND_HC_N',2012,6.840E-02,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'RES_SH_LPG_HC_N',2012,5.470E-02,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'RES_SH_LPG_COND_HC_N',2012,7.000E-02,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'RES_SH_WST_BIO_HC_N',2012,2.000E-02,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'RES_SH_WPL_BIO_HC_N',2012,1.585E-01,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'RES_SH_AHP_ELC_HC_N',2012,4.756E-01,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'RES_SH_HNS_ELC_HC_N',2012,5.074E-01,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'RES_SH_HPP_ELC_HC_N',2012,6.659E-01,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'RES_SH_HEX_HET_HC_N',2012,2.880E-02,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'RES_SH_HP_HET_HC_N',2012,1.000E-04,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'RES_SH_HPTS_HC_N',2012,4.756E-01,'M€/PJ','');

INSERT INTO "CostFixed" VALUES ('PIE',2012,'RES_SC_AHP_ELC_STD_N',2012,6.309E-01,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'RES_SC_AHP_ELC_IMP_N',2012,7.344E-01,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'RES_SC_CEN_N',2012,9.631E-01,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'RES_SC_ROOM_N',2012,9.396E-01,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'RES_SC_AHP_ELC_ADV_N',2012,1.010E+00,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'RES_SC_ROOM_ELC_NEW_N',2012,1.163E+00,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'RES_SC_AHP_NGA_ADV_N',2012,8.079E-01,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'RES_SC_CEN_NGA_N',2012,1.299E+00,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2015,'RES_SC_AHP_NGA_N',2015,1.280E+00,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'RES_SC_HP_N',2012,1.000E-02,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'RES_MISC_EQP_N',2012,1.195E+01,'M€/PJ','');
-- Commercial sector
-- Fuel technologies
INSERT INTO "CostFixed" VALUES ('PIE',2011,'COM_FT_LPG_EN',2011,4.920E+00,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2025,'COM_FT_NGA_E',2025,3.280E+00,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2011,'COM_FT_ELC_EN',2011,3.280E+00,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'COM_FT_NGA_N',2012,3.280E+00,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'COM_FT_DST_N',2012,4.920E+00,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2011,'COM_FT_HET_EN',2011,4.920E+00,'M€/PJ','');

INSERT INTO "CostFixed" VALUES ('PIE',2012,'COM_FT_BIO_N',2012,5.576E+00,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2011,'COM_SH_HT_NGA_E',2011,4.920E+00,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2011,'COM_SC_ABS_NGA_E',2011,4.920E+00,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2011,'COM_SC_CCL_ELC_CNT_E',2011,4.920E+00,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2011,'COM_SC_AHP_ELC_E',2011,4.920E+00,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2011,'COM_SC_ROOM_ELC_E',2011,4.920E+00,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2011,'COM_SC_ROOF_ELC_E',2011,4.920E+00,'M€/PJ','');
-- New technologies
INSERT INTO "CostFixed" VALUES ('PIE',2012,'COM_SH_NGA_N',2012,4.99E-02,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'COM_SH_COND_NGA_N',2012,6.84E-02,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'COM_SH_LPG_N',2012,5.47E-02,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'COM_SH_COND_LPG_N',2012,7.00E-02,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'COM_LG_INC_N',2012,1.78E+00,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'COM_LG_SHAL_STD_N',2012,9.00E-01,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'COM_LG_HAL_IMP_N',2012,1.61E+00,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'COM_LG_SFL_N',2012,1.03E+00,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'COM_LG_LFL_N',2012,1.03E+00,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'COM_LG_CFL_N',2012,1.03E+00,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'COM_LG_MER_N',2012,1.03E+00,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'COM_LG_SOD_N',2012,1.03E+00,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'COM_WH_COND_DST_N',2012,3.60E-02,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'COM_WH_NGA_N',2012,2.06E-02,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'COM_WH_COND_NGA_N',2012,2.82E-02,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'COM_WH_LPG_N',2012,2.26E-02,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'COM_WH_COND_LPG_N',2012,2.89E-02,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'COM_WH_WPEL_BIO_N',2012,5.00E-02,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'COM_WH_ELC_N',2012,3.40E-02,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'COM_WH_AHP_ELC_N',2012,1.96E-01,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'COM_WH_HEX_HET_N',2012,0.00E+00,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'COM_SH_HEX_HET_N',2012,2.88E-02,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'COM_SH_HP_AIR_N',2012,4.76E-01,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'COM_SH_HP_PRB_N',2012,6.66E-01,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'COM_SH_HP_N',2012,4.76E-01,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'COM_SH_WPEL_N',2012,1.59E-01,'M€/PJ','');

INSERT INTO "CostFixed" VALUES ('PIE',2012,'COM_SC_HP_STD_N',2012,1.00E+00,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'COM_SC_HP_IMP_N',2012,1.28E+00,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'COM_SC_ROOF_STD_N',2012,6.27E-01,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'COM_SC_ROOF_ADV_N',2012,4.77E-01,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'COM_SC_REC_N',2012,3.23E-01,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'COM_SC_REC_IMP_N',2012,3.20E-01,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'COM_SC_CNF_N',2012,2.14E-01,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2015,'COM_SC_CNF_IMP_N',2016,2.15E-01,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'COM_SC_CNT_N',2012,2.62E-01,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'COM_SC_ROOM_N',2012,2.87E-01,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'COM_SC_ABS_NGA_N',2012,1.59E-01,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'COM_SC_NGA_STD_N',2012,3.08E-01,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'COM_SC_NGA_IMP_N',2012,3.11E-01,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'COM_CK_NGA_N',2012,2.78E+00,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'COM_CK_LPG_N',2012,3.50E+00,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'COM_CK_ELC_N',2012,2.22E+00,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'COM_CK_BIO_N',2012,4.17E+00,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'COM_OE_OFF_ELC_STD_N',2012,4.10E-01,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'COM_OE_OFF_ELC_IMP_N',2012,4.20E-01,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'COM_OE_OFF_ADV_N',2012,4.40E-01,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'COM_RF_STD_N',2012,6.30E-01,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'COM_RF_IMP_N',2012,7.90E-01,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'COM_RF_N',2012,9.20E-01,'M€/PJ','');

INSERT INTO "CostFixed" VALUES ('PIE',2030,'COM_H2G_C1',2030,1.6,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2030,'COM_H2G_C2',2030,1.6,'M€/PJ','');
-- Agriculture sector
-- Fuel technologies
INSERT INTO "CostFixed" VALUES ('PIE',2011,'AGR_FT_NGA_E',2011,4.31,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2011,'AGR_FT_DST_E',2011,6.46,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2011,'AGR_FT_GSL_E',2011,6.46,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2011,'AGR_FT_LPG_E',2011,6.46,'M€/PJ','');
-- Industrial sector
-- New technologies
-- Fuel technologies
INSERT INTO "CostFixed" VALUES ('PIE',2013,'IND_FT_NAP_N',2013,3.08E+00,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2013,'IND_FT_BFG_N',2013,1.64E+00,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2013,'IND_FT_BIO_N',2013,3.49E+00,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2013,'IND_FT_COA_N',2013,3.08E+00,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2013,'IND_FT_COG_EN',2013,3.08E+00,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2013,'IND_FT_COK_N',2013,3.08E+00,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2013,'IND_FT_ETH_N',2013,3.08E+00,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2013,'IND_FT_HFO_N',2013,3.08E+00,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2013,'IND_FT_LPG_N',2013,3.08E+00,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2013,'IND_FT_NGA_N',2013,2.05E+00,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2013,'IND_FT_OIL_N',2013,3.08E+00,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2013,'IND_FT_PTC_N',2013,3.08E+00,'M€/PJ','');
-- Machine drive and steam

INSERT INTO "CostFixed" VALUES ('PIE',2012,'IND_MD_LPG_N',2012,1.93,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'IND_MD_NGA_N',2012,2.31,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'IND_MD_ELC_N',2012,0.08,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'IND_STM_BIO_N',2012,1.52,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'IND_STM_BFG_N',2012,0.32,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'IND_STM_DST_N',2012,0.32,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'IND_STM_ETH_N',2012,0.32,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'IND_STM_HET_N',2012,0.32,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'IND_STM_LPG_N',2012,0.30,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'IND_STM_NGA_N',2012,0.32,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'IND_STM_PTC_N',2012,1.00,'M€/PJ','');
-- Chemicals
INSERT INTO "CostFixed" VALUES ('PIE',2012,'IND_CH_HVC_NAPSC_N',2012,2.14E+01,'M€/Mt','');
INSERT INTO "CostFixed" VALUES ('PIE',2030,'IND_CH_HVC_NAPSC_N',2030,1.66E+01,'M€/Mt','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'IND_CH_HVC_ETHSC_N',2012,1.55E+01,'M€/Mt','');
INSERT INTO "CostFixed" VALUES ('PIE',2030,'IND_CH_HVC_ETHSC_N',2030,9.30E+00,'M€/Mt','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'IND_CH_HVC_GSOSC_N',2012,2.43E+01,'M€/Mt','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'IND_CH_HVC_LPGSC_N',2012,1.98E+01,'M€/Mt','');
INSERT INTO "CostFixed" VALUES ('PIE',2030,'IND_CH_HVC_LPGSC_N',2030,1.25E+01,'M€/Mt','');
INSERT INTO "CostFixed" VALUES ('PIE',2020,'IND_CH_HVC_NCC_N',2020,3.41E+01,'M€/Mt','');
INSERT INTO "CostFixed" VALUES ('PIE',2020,'IND_CH_HVC_BDH_N',2020,3.32E+01,'M€/Mt','');
INSERT INTO "CostFixed" VALUES ('PIE',2015,'IND_CH_OLF_PDH_N',2015,4.23E+01,'M€/Mt','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'IND_CH_OLF_MTO_N',2012,1.19E+01,'M€/Mt','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'IND_CH_AMM_NGASR_N',2012,2.09E+00,'M€/Mt','');
INSERT INTO "CostFixed" VALUES ('PIE',2030,'IND_CH_AMM_NGASR_N',2030,1.73E+00,'M€/Mt','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'IND_CH_AMM_NAPPOX_N',2012,3.20E+00,'M€/Mt','');
INSERT INTO "CostFixed" VALUES ('PIE',2030,'IND_CH_AMM_NAPPOX_N',2030,2.81E+00,'M€/Mt','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'IND_CH_AMM_COAGSF_N',2012,2.06E+01,'M€/Mt','');
INSERT INTO "CostFixed" VALUES ('PIE',2030,'IND_CH_AMM_COAGSF_N',2030,1.78E+01,'M€/Mt','');
INSERT INTO "CostFixed" VALUES ('PIE',2025,'IND_CH_AMM_BIOGSF_N',2025,3.00E+02,'M€/Mt','');
INSERT INTO "CostFixed" VALUES ('PIE',2025,'IND_CH_AMM_ELCSYS_N',2025,2.60E+00,'M€/Mt','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'IND_CH_MTH_NGASR_N',2012,5.38E+00,'M€/Mt','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'IND_CH_MTH_COGSR_N',2012,3.31E+00,'M€/Mt','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'IND_CH_MTH_LPGSR_N',2012,5.51E+00,'M€/Mt','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'IND_CH_MTH_COAGSF_N',2012,2.73E+00,'M€/Mt','');
INSERT INTO "CostFixed" VALUES ('PIE',2025,'IND_CH_MTH_BIOGSF_N',2025,3.55E+01,'M€/Mt','');
INSERT INTO "CostFixed" VALUES ('PIE',2025,'IND_CH_MTH_ELCSYS_N',2025,1.10E+00,'M€/Mt','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'IND_CH_CHL_MERC_N',2012,4.72E+00,'M€/Mt','');
INSERT INTO "CostFixed" VALUES ('PIE',2030,'IND_CH_CHL_MERC_N',2030,3.64E+00,'M€/Mt','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'IND_CH_CHL_DIAP_N',2012,4.72E+00,'M€/Mt','');
INSERT INTO "CostFixed" VALUES ('PIE',2030,'IND_CH_CHL_DIAP_N',2030,3.64E+00,'M€/Mt','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'IND_CH_CHL_MEMB_N',2012,4.72E+00,'M€/Mt','');
INSERT INTO "CostFixed" VALUES ('PIE',2030,'IND_CH_CHL_MEMB_N',2030,3.64E+00,'M€/Mt','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'IND_CH_EC_N',2012,1.00E+00,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'IND_CH_OTH_COK_N',2012,5.30E-01,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'IND_CH_OTH_DST_N',2012,5.30E-01,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'IND_CH_OTH_ELC_N',2012,3.60E-01,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'IND_CH_OTH_ETH_N',2012,5.30E-01,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'IND_CH_OTH_NGA_N',2012,4.80E-01,'M€/PJ','');
-- Iron and steel
INSERT INTO "CostFixed" VALUES ('PIE',2012,'IND_IS_BOF_BFBOF_N',2012,3.19E+00,'M€/Mt','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'IND_IS_DRI_DRIEAF_N',2012,1.74E+01,'M€/Mt','');
INSERT INTO "CostFixed" VALUES ('PIE',2030,'IND_IS_DRI_HDREAF_N',2030,1.74E+01,'M€/Mt','');
INSERT INTO "CostFixed" VALUES ('PIE',2025,'IND_IS_BOF_HISBOF_N',2025,1.45E+01,'M€/Mt','');
INSERT INTO "CostFixed" VALUES ('PIE',2030,'IND_IS_BOF_ULCOWIN_N',2030,2.02E+01,'M€/Mt','');
INSERT INTO "CostFixed" VALUES ('PIE',2030,'IND_IS_BOF_ULCOLYSIS_N',2030,1.70E+01,'M€/Mt','');
-- Non-ferrous metals
INSERT INTO "CostFixed" VALUES ('PIE',2012,'IND_NF_AMN_BAY_N',2012,1.37E+02,'M€/Mt','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'IND_NF_ALU_HLH_N',2012,6.84E+01,'M€/Mt','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'IND_NF_ALU_SEC_N',2012,3.65E+02,'M€/Mt','');
INSERT INTO "CostFixed" VALUES ('PIE',2030,'IND_NF_ALU_HLHIA_N',2030,5.63E+01,'M€/Mt','');
INSERT INTO "CostFixed" VALUES ('PIE',2050,'IND_NF_ALU_CBT_N',2050,5.47E+01,'M€/Mt','');
INSERT INTO "CostFixed" VALUES ('PIE',2050,'IND_NF_ALU_KAO_N',2050,1.37E+02,'M€/Mt','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'IND_NF_COP_N',2012,1.00E+01,'M€/Mt','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'IND_NF_ZNC_N',2012,1.00E+01,'M€/Mt','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'IND_NF_EC_N',2012,5.28E+00,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'IND_NF_OTH_ELC_N',2012,3.00E-01,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'IND_NF_OTH_DST_N',2012,2.94E-01,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'IND_NF_OTH_NGA_N',2012,2.66E-01,'M€/PJ','');
-- Non-metallic minerals
INSERT INTO "CostFixed" VALUES ('PIE',2012,'IND_NM_CLK_DRY_N',2012,7.28E+01,'M€/Mt','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'IND_NM_CLK_WET_N',2012,7.28E+01,'M€/Mt','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'IND_NM_CEM_BLN_N',2012,3.00E+00,'M€/Mt','');
INSERT INTO "CostFixed" VALUES ('PIE',2020,'IND_NM_CLK_DRYCL_PCCS_N',2020,1.45E+02,'M€/Mt','');
INSERT INTO "CostFixed" VALUES ('PIE',2030,'IND_NM_CLK_DRYCL_OCCS_N',2030,8.77E+01,'M€/Mt','');
INSERT INTO "CostFixed" VALUES ('PIE',2030,'IND_NM_CEM_AAC_N',2030,2.30E+02,'M€/Mt','');
INSERT INTO "CostFixed" VALUES ('PIE',2030,'IND_NM_CEM_BEL_N',2030,7.58E+01,'M€/Mt','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'IND_NM_LIM_LRK_N',2012,1.99E+01,'M€/Mt','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'IND_NM_GLS_FOSS_N',2012,2.65E+01,'M€/Mt','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'IND_NM_GLS_ELEC_N',2012,2.65E+01,'M€/Mt','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'IND_NM_CRM_N',2012,1.50E+01,'M€/Mt','');
-- Pulp and paper
INSERT INTO "CostFixed" VALUES ('PIE',2012,'IND_PP_PUL_KRF_N',2012,4.00E+01,'M€/Mt','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'IND_PP_PUL_SUL_N',2012,4.00E+01,'M€/Mt','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'IND_PP_PUL_MEC_N',2012,1.50E+01,'M€/Mt','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'IND_PP_PUL_SCH_N',2012,2.80E+01,'M€/Mt','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'IND_PP_PUL_REC_N',2012,3.00E+01,'M€/Mt','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'IND_PP_PAP_N',2012,8.90E+01,'M€/Mt','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'IND_PP_PH_HFO_N',2012,5.00E+00,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'IND_PP_PH_NGA_N',2012,5.00E+00,'M€/PJ','');
-- Other energy use
INSERT INTO "CostFixed" VALUES ('PIE',2012,'IND_OTH_OTH_ELC_N',2012,0.01,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'IND_OTH_PH_DST_N',2012,0.85,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'IND_OTH_PH_HFO_N',2012,0.85,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'IND_OTH_PH_LPG_N',2012,0.50,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('PIE',2012,'IND_OTH_PH_NGA_N',2012,0.20,'M€/PJ','');

-- Hydrogen
INSERT INTO "CostFixed" VALUES ('PIE',2025,'IND_H2G_DE',2025,0.0,'M€/PJ','TEMOA_IT');
INSERT INTO "CostFixed" VALUES ('PIE',2025,'H2_SMR_DS',2025,1.41,'M€/PJ','TEMOA_IT');
INSERT INTO "CostFixed" VALUES ('PIE',2030,'H2_SMR_DS',2030,0.73,'M€/PJ','TEMOA_IT');
INSERT INTO "CostFixed" VALUES ('PIE',2020,'H2_SMR_CL',2020,0.31,'M€/PJ','TEMOA_IT');
INSERT INTO "CostFixed" VALUES ('PIE',2025,'H2_SMR_CL',2025,0.31,'M€/PJ','TEMOA_IT');
INSERT INTO "CostFixed" VALUES ('PIE',2030,'H2_SMR_CL',2030,0.24,'M€/PJ','TEMOA_IT');
INSERT INTO "CostFixed" VALUES ('PIE',2020,'H2_SMR_CS',2020,0.52,'M€/PJ','TEMOA_IT');
INSERT INTO "CostFixed" VALUES ('PIE',2025,'H2_SMR_CS',2025,0.52,'M€/PJ','TEMOA_IT');
INSERT INTO "CostFixed" VALUES ('PIE',2030,'H2_SMR_CS',2030,0.41,'M€/PJ','TEMOA_IT');
INSERT INTO "CostFixed" VALUES ('PIE',2020,'H2_HOPO',2020,0.68,'M€/PJ','TEMOA_IT');

INSERT INTO "CostFixed" VALUES ('PIE',2020,'H2_TRA_FT_GC1',2020,2.1,'M€/PJ','TEMOA_IT');
INSERT INTO "CostFixed" VALUES ('PIE',2025,'H2_TRA_FT_GC1',2025,1.9,'M€/PJ','TEMOA_IT');
INSERT INTO "CostFixed" VALUES ('PIE',2020,'H2_TRA_FT_GC2',2020,2.1,'M€/PJ','TEMOA_IT');
INSERT INTO "CostFixed" VALUES ('PIE',2025,'H2_TRA_FT_GC2',2025,1.9,'M€/PJ','TEMOA_IT');
INSERT INTO "CostFixed" VALUES ('PIE',2020,'H2_TRA_FT_GC3',2020,4.7,'M€/PJ','TEMOA_IT');
INSERT INTO "CostFixed" VALUES ('PIE',2025,'H2_TRA_FT_GC3',2025,4.3,'M€/PJ','TEMOA_IT');
INSERT INTO "CostFixed" VALUES ('PIE',2020,'H2_TRA_FT_GC4',2020,3.9,'M€/PJ','TEMOA_IT');
INSERT INTO "CostFixed" VALUES ('PIE',2025,'H2_TRA_FT_GC4',2025,3.5,'M€/PJ','TEMOA_IT');
INSERT INTO "CostFixed" VALUES ('PIE',2020,'H2_TRA_FT_GC5',2020,4.7,'M€/PJ','TEMOA_IT');
INSERT INTO "CostFixed" VALUES ('PIE',2025,'H2_TRA_FT_GC5',2025,4.3,'M€/PJ','TEMOA_IT');


CREATE TABLE "CapacityToActivity" (
   "regions"  text,
   "tech" text,
   "c2a"  real,
   "c2a_notes"    text,
   primary key("regions","tech"),
   foreign key("tech") references "technologies"("tech")
);
-- Electricity sector
-- Base year technologies
INSERT INTO "CapacityToActivity" VALUES ('PIE','ELC_NGA_CC_E',31.356,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('PIE','ELC_NGA_STM_REP_E',31.356,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('PIE','ELC_NGA_TURB_E',31.356,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('PIE','ELC_CHP_NGA_CC_E',31.356,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('PIE','ELC_CHP_NGA_TURB_E',31.356,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('PIE','ELC_CHP_NGA_STM_COND_E',31.356,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('PIE','ELC_CHP_BMU_E',31.356,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('PIE','ELC_CHP_BIO_E',31.356,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('PIE','ELC_BGS_E',31.356,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('PIE','ELC_BIO_E',31.356,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('PIE','ELC_SOL_E',31.356,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('PIE','ELC_WIN_E',31.356,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('PIE','ELC_HYD_FLO_E',31.356,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('PIE','ELC_HYD_RES_E',31.356,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('PIE','ELC_HYD_PUM_E',31.356,'PJ/GW');
-- Planned plants
INSERT INTO "CapacityToActivity" VALUES ('PIE','ELC_NGA_CC_P',31.356,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('PIE','ELC_CHP_NGA_CC_P',31.356,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('PIE','ELC_CHP_NGA_TURB_P',31.356,'PJ/GW');

-- New technologies
INSERT INTO "CapacityToActivity" VALUES ('PIE','ELC_NGA_TURB_L80MW_N',31.356,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('PIE','ELC_BLQ_N',31.356,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('PIE','ELC_BIO_5C_N',31.356,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('PIE','ELC_HYD_MICRO_N',31.356,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('PIE','ELC_HYD_MINI_N',31.356,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('PIE','ELC_WIN_N',31.536,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('PIE','ELC_PV_GRO_N',31.536,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('PIE','ELC_PV_ROOF_N',31.536,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('PIE','ELC_BIOGS_AGR_N',31.356,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('PIE','ELC_CHP_BMU_N',31.356,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('PIE','ELC_CHP_NGA_TURB_N',31.356,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('PIE','ELC_CHP_NGA_CC_N',31.356,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('PIE','ELC_CHP_NGA_CP_N',31.356,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('PIE','ELC_CHP_NGA_TAP_N',31.356,'PJ/GW');

-- Residential sector
-- Baseyear technologies
INSERT INTO "CapacityToActivity" VALUES ('PIE','RES_SH_BUR_NGA_LC_E',7.927,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('PIE','RES_SH_AHP_NGA_LC_E',7.927,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('PIE','RES_SH_BUR_DST_LC_E',7.927,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('PIE','RES_SH_BUR_HFO_LC_E',7.927,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('PIE','RES_SH_BUR_LPG_LC_E',7.927,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('PIE','RES_SH_HP_ELC_LC_E',7.927,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('PIE','RES_SH_HT_ELC_LC_E',7.927,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('PIE','RES_SH_HEX_HET_LC_E',7.927,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('PIE','RES_SH_WST_BIO_LC_E',7.927,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('PIE','RES_SH_BUR_NGA_MC_E',3.356,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('PIE','RES_SH_AHP_NGA_MC_E',3.356,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('PIE','RES_SH_BUR_DST_MC_E',3.356,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('PIE','RES_SH_BUR_HFO_MC_E',3.356,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('PIE','RES_SH_BUR_LPG_MC_E',3.356,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('PIE','RES_SH_HP_ELC_MC_E',3.356,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('PIE','RES_SH_HT_ELC_MC_E',3.356,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('PIE','RES_SH_HEX_HET_MC_E',3.356,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('PIE','RES_SH_WST_BIO_MC_E',3.356,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('PIE','RES_SH_BUR_NGA_HC_E',2.273,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('PIE','RES_SH_AHP_NGA_HC_E',2.273,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('PIE','RES_SH_BUR_DST_HC_E',2.273,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('PIE','RES_SH_BUR_HFO_HC_E',2.273,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('PIE','RES_SH_BUR_LPG_HC_E',2.273,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('PIE','RES_SH_HP_ELC_HC_E',2.273,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('PIE','RES_SH_HT_ELC_HC_E',2.273,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('PIE','RES_SH_HEX_HET_HC_E',2.273,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('PIE','RES_SH_WST_BIO_HC_E',2.273,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('PIE','RES_SC_CEN_E',8.5707,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('PIE','RES_SC_EHP_E',8.5707,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('PIE','RES_SC_ROOM_E',8.5707,'Mm2/PJ');

INSERT INTO "CapacityToActivity" VALUES ('PIE','RES_SC_AHP_ELC_STD_N',8.5707,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('PIE','RES_SC_AHP_ELC_IMP_N',8.5707,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('PIE','RES_SC_CEN_N',8.5707,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('PIE','RES_SC_ROOM_N',8.5707,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('PIE','RES_SC_AHP_ELC_ADV_N',8.5707,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('PIE','RES_SC_ROOM_ELC_NEW_N',8.5707,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('PIE','RES_SC_AHP_NGA_ADV_N',8.5707,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('PIE','RES_SC_CEN_NGA_N',8.5707,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('PIE','RES_SC_AHP_NGA_N',8.5707,'Mm2/PJ');

-- Micro-CHP
INSERT INTO "CapacityToActivity" VALUES ('PIE','RES_CHP_NGA_CI_N',31.356,'');
INSERT INTO "CapacityToActivity" VALUES ('PIE','RES_CHP_NGA_MICRO_N',31.356,'');
INSERT INTO "CapacityToActivity" VALUES ('PIE','RES_CHP_NGA_CC_N',31.356,'');
INSERT INTO "CapacityToActivity" VALUES ('PIE','RES_CHP_NGA_STR_N',31.356,'');

INSERT INTO "CapacityToActivity" VALUES ('PIE','RES_SH_DST_LC_N',7.93E+00,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('PIE','RES_SH_DST_COND_LC_N',7.93E+00,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('PIE','RES_SH_NGA_LC_N',7.93E+00,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('PIE','RES_SH_LPG_LC_N',7.93E+00,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('PIE','RES_SH_LPG_COND_LC_N',7.93E+00,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('PIE','RES_SH_AHP_ELC_LC_N',7.93E+00,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('PIE','RES_SH_HNS_ELC_LC_N',7.93E+00,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('PIE','RES_SH_HPP_ELC_LC_N',7.93E+00,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('PIE','RES_SH_HEX_HET_LC_N',7.93E+00,'Mm2/PJ');

INSERT INTO "CapacityToActivity" VALUES ('PIE','RES_SH_SOL_DST_LC_N',7.93E+00,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('PIE','RES_SH_SOL_LPG_LC_N',7.93E+00,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('PIE','RES_SH_SOL_NGA_LC_N',7.93E+00,'Mm2/PJ');

INSERT INTO "CapacityToActivity" VALUES ('PIE','RES_SH_DST_COND_MC_N',3.36E+00,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('PIE','RES_SH_NGA_MC_N',3.36E+00,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('PIE','RES_SH_DST_MC_N',3.36E+00,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('PIE','RES_SH_NGA_COND_MC_N',3.36E+00,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('PIE','RES_SH_LPG_MC_N',3.36E+00,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('PIE','RES_SH_LPG_COND_MC_N',3.36E+00,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('PIE','RES_SH_AHP_ELC_MC_N',3.36E+00,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('PIE','RES_SH_HNS_ELC_MC_N',3.36E+00,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('PIE','RES_SH_HPP_ELC_MC_N',3.36E+00,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('PIE','RES_SH_HEX_HET_MC_N',3.36E+00,'Mm2/PJ');

INSERT INTO "CapacityToActivity" VALUES ('PIE','RES_SH_HP_HET_LC_N',7.93E+00,'Mm2/PJ');

INSERT INTO "CapacityToActivity" VALUES ('PIE','RES_SH_HP_HET_MC_N',3.36E+00,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('PIE','RES_SH_SOL_DST_MC_N',3.36E+00,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('PIE','RES_SH_SOL_LPG_MC_N',3.36E+00,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('PIE','RES_SH_SOL_NGA_MC_N',3.36E+00,'Mm2/PJ');

INSERT INTO "CapacityToActivity" VALUES ('PIE','RES_SH_DST_HC_N',2.27,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('PIE','RES_SH_DST_COND_HC_N',2.27,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('PIE','RES_SH_NGA_HC_N',2.27,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('PIE','RES_SH_NGA_COND_HC_N',2.27,'Mm2/PJ');

INSERT INTO "CapacityToActivity" VALUES ('PIE','RES_SH_LPG_HC_N',2.27,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('PIE','RES_SH_LPG_COND_HC_N',2.27,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('PIE','RES_SH_AHP_ELC_HC_N',2.27,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('PIE','RES_SH_HNS_ELC_HC_N',2.27,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('PIE','RES_SH_HPP_ELC_HC_N',2.27,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('PIE','RES_SH_HEX_HET_HC_N',2.27,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('PIE','RES_SH_HP_HET_HC_N',2.27,'Mm2/PJ');


INSERT INTO "CapacityToActivity" VALUES ('PIE','RES_SH_WST_BIO_LC_N',7.93E+00,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('PIE','RES_SH_WPL_BIO_LC_N',7.93E+00,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('PIE','RES_SH_WST_BIO_MC_N',3.36E+00,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('PIE','RES_SH_WPL_BIO_MC_N',3.36E+00,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('PIE','RES_SH_WST_BIO_HC_N',2.27,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('PIE','RES_SH_WPL_BIO_HC_N',2.27,'Mm2/PJ');

-- Commercial sector
-- Micro-CHP
INSERT INTO "CapacityToActivity" VALUES ('PIE','COM_CHP_NGA_CI_N',31.356,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('PIE','COM_CHP_NGA_MICRO_N',31.356,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('PIE','COM_CHP_NGA_CC_N',31.356,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('PIE','COM_CHP_NGA_SOFC_N',31.356,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('PIE','COM_CHP_HH2_PEMFC_N',31.356,'PJ/GW');
-- Industrial sector
-- Micro-CHP
INSERT INTO "CapacityToActivity" VALUES ('PIE','IND_CHP_NGA_CI_N',31.356,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('PIE','IND_CHP_NGA_TG_N',31.356,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('PIE','IND_CHP_NGA_TV_N',31.356,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('PIE','IND_CHP_BLQ_CI_N',31.356,'PJ/GW');


CREATE TABLE "CapacityFactor" (
   "regions"  text,
   "tech" text,
   "vintage"  integer,
   "cf"   real,
   "cf_notes" text,
   primary key("regions","tech","vintage"),
   foreign key("tech") references "technologies"("tech"),
   foreign key("vintage") references "time_periods"("t_periods")
);

-- Electricity sector
INSERT INTO "CapacityFactor" VALUES ('PIE','ELC_NGA_CC_E',2011,0.20,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','ELC_NGA_STM_REP_E',2011,0.49,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','ELC_NGA_TURB_E',2011,0.01,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','ELC_CHP_NGA_CC_E',2011,0.50,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','ELC_CHP_NGA_TURB_E',2011,0.44,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','ELC_CHP_NGA_STM_COND_E',2011,0.30,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','ELC_CHP_BMU_E',2011,0.61,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','ELC_CHP_BIO_E',2011,0.42,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','ELC_BGS_E',2011,0.55,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','ELC_BIO_E',2011,0.42,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','ELC_HYD_FLO_E',2011,0.32,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','ELC_HYD_RES_E',2011,0.32,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','ELC_HYD_PUM_E',2011,0.11,'');
---- Base year technologies
-- Planned technologies
INSERT INTO "CapacityFactor" VALUES ('PIE','ELC_NGA_CC_P',2012,0.45,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','ELC_CHP_NGA_CC_P',2012,0.65,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','ELC_CHP_NGA_TURB_P',2012,0.60,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','ELC_NGA_CC_P',2030,0.80,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','ELC_CHP_NGA_CC_P',2030,0.72,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','ELC_CHP_NGA_TURB_P',2030,0.62,'');
-- New technologies
INSERT INTO "CapacityFactor" VALUES ('PIE','ELC_NGA_TURB_L80MW_N',2012,0.95,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','ELC_BLQ_N',2015,0.70,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','ELC_BIO_5C_N',2012,0.57,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','ELC_BIOGS_AGR_N',2012,0.58,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','ELC_BIOGS_AGR_N',2021,0.60,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','ELC_CHP_NGA_TURB_N',2012,0.57,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','ELC_CHP_NGA_CC_N',2012,0.34,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','ELC_CHP_NGA_CP_N',2012,0.74,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','ELC_CHP_NGA_TAP_N',2012,0.74,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','ELC_CHP_BMU_N',2012,0.70,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','ELC_CHP_BMU_N',2014,0.70,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','ELC_CHP_BMU_N',2021,0.78,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','ELC_CHP_BMU_N',2030,0.80,'');

-- Residential sector
-- Base year technologies
INSERT INTO "CapacityFactor" VALUES ('PIE','RES_SH_BUR_NGA_LC_E',2011,0.18,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','RES_SH_AHP_NGA_LC_E',2011,0.18,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','RES_SH_BUR_DST_LC_E',2011,0.18,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','RES_SH_BUR_HFO_LC_E',2011,0.18,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','RES_SH_BUR_LPG_LC_E',2011,0.18,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','RES_SH_HT_ELC_LC_E',2011,0.18,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','RES_SH_HP_ELC_LC_E',2011,0.18,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','RES_SH_HEX_HET_LC_E',2011,0.18,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','RES_SH_WST_BIO_LC_E',2011,0.18,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','RES_SH_BUR_NGA_MC_E',2011,0.18,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','RES_SH_AHP_NGA_MC_E',2011,0.18,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','RES_SH_BUR_DST_MC_E',2011,0.18,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','RES_SH_BUR_HFO_MC_E',2011,0.18,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','RES_SH_BUR_LPG_MC_E',2011,0.18,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','RES_SH_HP_ELC_MC_E',2011,0.18,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','RES_SH_HEX_HET_MC_E',2011,0.18,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','RES_SH_WST_BIO_MC_E',2011,0.18,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','RES_SH_BUR_NGA_HC_E',2011,0.18,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','RES_SH_AHP_NGA_HC_E',2011,0.18,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','RES_SH_BUR_DST_HC_E',2011,0.18,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','RES_SH_BUR_HFO_HC_E',2011,0.18,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','RES_SH_BUR_LPG_HC_E',2011,0.18,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','RES_SH_HP_ELC_HC_E',2011,0.18,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','RES_SH_HEX_HET_HC_E',2011,0.18,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','RES_SH_WST_BIO_HC_E',2011,0.18,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','RES_SC_CEN_E',2011,0.13,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','RES_SC_EHP_E',2011,0.13,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','RES_SC_ROOM_E',2011,0.13,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','RES_WH_NGA_E',2011,0.10,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','RES_WH_HFO_E',2011,0.10,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','RES_WH_DST_E',2011,0.10,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','RES_WH_LPG_E',2011,0.10,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','RES_WH_BIO_E',2011,0.10,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','RES_WH_ELC_E',2011,0.10,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','RES_WH_HET_E',2011,0.10,'');
-- New technologies
INSERT INTO "CapacityFactor" VALUES ('PIE','RES_WH_HFO_N',2012,0.30,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','RES_SH_HPTS_LC_N',2012,0.400,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','RES_SH_HPTS_MC_N',2012,0.400,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','RES_SH_HPTS_HC_N',2012,0.400,'');

INSERT INTO "CapacityFactor" VALUES ('PIE','RES_SC_AHP_ELC_STD_N',2012,0.13,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','RES_SC_AHP_ELC_IMP_N',2012,0.13,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','RES_SC_CEN_N',2012,0.13,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','RES_SC_ROOM_N',2012,0.13,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','RES_SC_AHP_ELC_ADV_N',2012,0.13,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','RES_SC_ROOM_ELC_NEW_N',2012,0.13,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','RES_SC_AHP_NGA_ADV_N',2012,0.13,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','RES_SC_CEN_NGA_N',2012,0.13,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','RES_SC_AHP_NGA_N',2016,0.13,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','RES_SH_HT_ELC_MC_E',2011,0.18,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','RES_SC_AHP_NGA_N',2015,0.13,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','RES_SH_WPL_BIO_HC_N',2012,0.10,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','RES_SH_WST_BIO_HC_N',2012,0.10,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','RES_SH_WPL_BIO_MC_N',2012,0.10,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','RES_SH_WST_BIO_MC_N',2012,0.10,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','RES_SH_WPL_BIO_LC_N',2012,0.10,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','RES_SH_WST_BIO_LC_N',2012,0.10,'');

INSERT INTO "CapacityFactor" VALUES ('PIE','RES_WH_SOL_N',2012,0.10,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','RES_WH_HNS_ELC_N',2012,0.10,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','RES_WH_AHP_ELC_N',2012,0.10,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','RES_WH_ELC_RES_N',2012,0.10,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','RES_WH_WPL_BIO_N',2012,0.10,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','RES_WH_LPG_COND_N',2012,0.10,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','RES_WH_LPG_N',2012,0.10,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','RES_WH_NGA_COND_N',2012,0.10,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','RES_WH_NGA_N',2012,0.10,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','RES_WH_DST_COND_N',2012,0.10,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','RES_WH_DST_N',2012,0.10,'');

INSERT INTO "CapacityFactor" VALUES ('PIE','RES_SH_HP_HET_HC_N',2012,0.18,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','RES_SH_HEX_HET_HC_N',2012,0.18,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','RES_SH_HPP_ELC_HC_N',2012,0.18,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','RES_SH_HNS_ELC_HC_N',2012,0.18,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','RES_SH_AHP_ELC_HC_N',2012,0.18,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','RES_SH_LPG_COND_HC_N',2012,0.18,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','RES_SH_LPG_HC_N',2012,0.18,'');

INSERT INTO "CapacityFactor" VALUES ('PIE','RES_SH_NGA_COND_HC_N',2012,0.18,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','RES_SH_NGA_HC_N',2012,0.18,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','RES_SH_DST_COND_HC_N',2012,0.18,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','RES_SH_DST_HC_N',2012,0.18,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','RES_SH_HP_HET_MC_N',2012,0.18,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','RES_SH_SOL_DST_MC_N',2012,0.18,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','RES_SH_SOL_LPG_MC_N',2012,0.18,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','RES_SH_SOL_NGA_MC_N',2012,0.18,'');


INSERT INTO "CapacityFactor" VALUES ('PIE','RES_SH_SOL_DST_LC_N',2012,0.18,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','RES_SH_SOL_LPG_LC_N',2012,0.18,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','RES_SH_SOL_NGA_LC_N',2012,0.18,'');

INSERT INTO "CapacityFactor" VALUES ('PIE','RES_SH_DST_COND_MC_N',2012,0.18,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','RES_SH_DST_MC_N',2012,0.18,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','RES_SH_NGA_MC_N',2012,0.18,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','RES_SH_NGA_COND_MC_N',2012,0.18,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','RES_SH_LPG_MC_N',2012,0.18,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','RES_SH_LPG_COND_MC_N',2012,0.18,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','RES_SH_AHP_ELC_MC_N',2012,0.18,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','RES_SH_HNS_ELC_MC_N',2012,0.18,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','RES_SH_HPP_ELC_MC_N',2012,0.18,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','RES_SH_HEX_HET_MC_N',2012,0.18,'');

INSERT INTO "CapacityFactor" VALUES ('PIE','RES_SH_DST_LC_N',2012,0.18,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','RES_SH_DST_COND_LC_N',2012,0.18,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','RES_SH_NGA_LC_N',2012,0.18,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','RES_SH_LPG_LC_N',2012,0.18,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','RES_SH_LPG_COND_LC_N',2012,0.18,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','RES_SH_AHP_ELC_LC_N',2012,0.18,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','RES_SH_HNS_ELC_LC_N',2012,0.18,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','RES_SH_HPP_ELC_LC_N',2012,0.18,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','RES_SH_HEX_HET_LC_N',2012,0.18,'');

-- Micro-CHP
INSERT INTO "CapacityFactor" VALUES ('PIE','RES_CHP_NGA_CI_N',2012,0.34,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','RES_CHP_NGA_MICRO_N',2012,0.34,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','RES_CHP_NGA_CC_N',2012,0.34,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','RES_CHP_NGA_STR_N',2023,0.34,'');
-- Commercial sector
-- Base year technologies
INSERT INTO "CapacityFactor" VALUES ('PIE','COM_SH_HT_NGA_E',2011,0.30,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','COM_SH_HP_NGA_E',2011,0.30,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','COM_SH_HT_DST_E',2011,0.30,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','COM_SH_HT_LPG_E',2011,0.30,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','COM_SH_RES_ELC_E',2011,0.30,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','COM_SH_HP_ELC_E',2011,0.30,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','COM_SC_ABS_NGA_E',2011,0.13,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','COM_SC_CHL_DST_E',2011,0.13,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','COM_SC_CCL_ELC_CNT_E',2011,0.13,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','COM_SC_AHP_ELC_E',2011,0.13,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','COM_SC_ROOM_ELC_E',2011,0.13,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','COM_SC_ROOF_ELC_E',2011,0.13,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','COM_WH_NGA_E',2011,0.10,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','COM_WH_DST_E',2011,0.10,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','COM_WH_LPG_E',2011,0.10,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','COM_WH_ELC_E',2011,0.10,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','COM_RF_RFR_ELC_E',2011,0.14,'');

-- New technologies
INSERT INTO "CapacityFactor" VALUES ('PIE','COM_WH_COND_DST_N',2012,0.10,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','COM_WH_NGA_N',2012,0.10,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','COM_WH_COND_NGA_N',2012,0.10,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','COM_WH_LPG_N',2012,0.10,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','COM_WH_COND_LPG_N',2012,0.10,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','COM_WH_WPEL_BIO_N',2012,0.10,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','COM_WH_ELC_N',2012,0.10,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','COM_WH_AHP_ELC_N',2012,0.10,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','COM_WH_HEX_HET_N',2012,0.10,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','COM_SH_NGA_N',2012,0.30,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','COM_SH_COND_NGA_N',2012,0.30,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','COM_SH_LPG_N',2012,0.30,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','COM_SH_COND_LPG_N',2012,0.30,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','COM_SH_HEX_HET_N',2012,0.30,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','COM_SH_HP_AIR_N',2012,0.30,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','COM_SH_HP_PRB_N',2012,0.30,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','COM_SH_HP_N',2012,0.50,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','COM_SH_WPEL_N',2012,0.30,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','COM_SC_HP_STD_N',2012,0.13,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','COM_SC_HP_IMP_N',2012,0.13,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','COM_SC_ROOF_STD_N',2012,0.13,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','COM_SC_ROOF_ADV_N',2012,0.13,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','COM_SC_REC_N',2012,0.13,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','COM_SC_REC_IMP_N',2012,0.13,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','COM_SC_CNF_N',2012,0.13,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','COM_SC_CNF_IMP_N',2015,0.13,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','COM_SC_CNT_N',2012,0.13,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','COM_SC_ROOM_N',2012,0.13,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','COM_SC_ABS_NGA_N',2012,0.13,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','COM_SC_NGA_STD_N',2012,0.13,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','COM_SC_NGA_IMP_N',2012,0.13,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','COM_RF_STD_N',2012,0.14,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','COM_RF_IMP_N',2012,0.14,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','COM_RF_N',2012,0.14,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','COM_H2G_C1',2030,0.70,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','COM_H2G_C2',2030,0.70,'');
-- Micro-CHP
INSERT INTO "CapacityFactor" VALUES ('PIE','COM_CHP_NGA_CI_N',2012,0.34,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','COM_CHP_NGA_MICRO_N',2012,0.34,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','COM_CHP_NGA_CC_N',2012,0.34,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','COM_CHP_NGA_SOFC_N',2030,0.90,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','COM_CHP_HH2_PEMFC_N',2030,0.90,'');

-- Industrial sector
-- Existing technologies
-- Machine drive and steam
INSERT INTO "CapacityFactor" VALUES ('PIE','IND_MD_ELC_E',2011,0.70,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','IND_STM_BIO_E',2011,0.75,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','IND_STM_DST_E',2011,0.75,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','IND_STM_COA_E',2011,0.75,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','IND_STM_HFO_E',2011,0.75,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','IND_STM_LPG_E',2011,0.75,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','IND_STM_NGA_E',2011,0.75,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','IND_STM_HET_E',2011,0.75,'');
-- New technologies
-- Machine drive and steam
INSERT INTO "CapacityFactor" VALUES ('PIE','IND_MD_LPG_N',2012,0.70,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','IND_MD_NGA_N',2012,0.70,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','IND_MD_ELC_N',2012,0.70,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','IND_STM_BIO_N',2012,0.75,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','IND_STM_BFG_N',2012,0.75,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','IND_STM_DST_N',2012,0.75,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','IND_STM_ETH_N',2012,0.75,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','IND_STM_HET_N',2012,0.75,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','IND_STM_LPG_N',2012,0.75,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','IND_STM_NGA_N',2012,0.75,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','IND_STM_PTC_N',2012,0.75,'');
-- Chemicals
INSERT INTO "CapacityFactor" VALUES ('PIE','IND_CH_HVC_NAPSC_N',2012,0.90,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','IND_CH_HVC_ETHSC_N',2012,0.85,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','IND_CH_HVC_GSOSC_N',2012,0.85,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','IND_CH_HVC_LPGSC_N',2012,0.85,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','IND_CH_HVC_NCC_N',2020,0.85,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','IND_CH_HVC_BDH_N',2020,0.85,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','IND_CH_OLF_PDH_N',2015,0.85,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','IND_CH_OLF_MTO_N',2012,0.85,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','IND_CH_AMM_NGASR_N',2012,0.90,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','IND_CH_AMM_NAPPOX_N',2012,0.90,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','IND_CH_AMM_COAGSF_N',2012,0.90,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','IND_CH_AMM_BIOGSF_N',2025,0.90,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','IND_CH_AMM_ELCSYS_N',2025,0.90,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','IND_CH_MTH_NGASR_N',2012,0.85,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','IND_CH_MTH_COGSR_N',2012,0.85,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','IND_CH_MTH_LPGSR_N',2012,0.85,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','IND_CH_MTH_COAGSF_N',2012,0.85,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','IND_CH_MTH_BIOGSF_N',2025,0.85,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','IND_CH_MTH_ELCSYS_N',2025,0.95,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','IND_CH_CHL_MERC_N',2012,0.95,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','IND_CH_CHL_DIAP_N',2012,0.95,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','IND_CH_CHL_MEMB_N',2012,0.95,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','IND_CH_EC_N',2012,0.80,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','IND_CH_OTH_COK_N',2012,0.80,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','IND_CH_OTH_DST_N',2012,0.80,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','IND_CH_OTH_ELC_N',2012,0.80,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','IND_CH_OTH_ETH_N',2012,0.80,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','IND_CH_OTH_NGA_N',2012,0.82,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','IND_CH_OTH_NGA_N',2020,0.85,'');
-- Iron and steel
INSERT INTO "CapacityFactor" VALUES ('PIE','IND_IS_BOF_BFBOF_N',2012,0.85,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','IND_IS_DRI_DRIEAF_N',2012,0.85,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','IND_IS_DRI_HDREAF_N',2030,0.85,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','IND_IS_BOF_HISBOF_N',2025,0.85,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','IND_IS_BOF_ULCOWIN_N',2030,0.85,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','IND_IS_BOF_ULCOLYSIS_N',2030,0.85,'');
-- Non-ferrous metals
INSERT INTO "CapacityFactor" VALUES ('PIE','IND_NF_ALU_HLH_N',2012,0.95,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','IND_NF_ALU_SEC_N',2012,0.95,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','IND_NF_ALU_HLHIA_N',2030,0.95,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','IND_NF_ALU_CBT_N',2050,0.95,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','IND_NF_ALU_KAO_N',2050,0.95,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','IND_NF_COP_N',2012,0.9,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','IND_NF_ZNC_N',2012,0.9,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','IND_NF_EC_N',2012,0.8,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','IND_NF_OTH_ELC_N',2012,0.8,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','IND_NF_OTH_DST_N',2012,0.8,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','IND_NF_OTH_NGA_N',2012,0.8,'');
-- Non-metallic minerals
INSERT INTO "CapacityFactor" VALUES ('PIE','IND_NM_CLK_DRY_N',2012,0.95,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','IND_NM_CLK_WET_N',2012,0.95,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','IND_NM_CEM_BLN_N',2012,0.95,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','IND_NM_CLK_DRYCL_PCCS_N',2020,0.95,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','IND_NM_CLK_DRYCL_OCCS_N',2030,0.95,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','IND_NM_CEM_AAC_N',2030,0.95,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','IND_NM_CEM_BEL_N',2030,0.95,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','IND_NM_LIM_LRK_N',2012,0.95,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','IND_NM_GLS_FOSS_N',2012,0.95,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','IND_NM_GLS_ELEC_N',2012,0.95,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','IND_NM_CRM_N',2012,0.90,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','IND_NM_EC_N',2012,0.80,'');
-- Pulp and paper
INSERT INTO "CapacityFactor" VALUES ('PIE','IND_PP_PUL_KRF_N',2012,0.95,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','IND_PP_PUL_SUL_N',2012,0.95,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','IND_PP_PUL_MEC_N',2012,0.95,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','IND_PP_PUL_SCH_N',2012,0.95,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','IND_PP_PUL_REC_N',2012,0.95,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','IND_PP_PAP_N',2012,0.95,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','IND_PP_PH_HFO_N',2012,0.8,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','IND_PP_PH_NGA_N',2012,0.8,'');
-- Other industries
INSERT INTO "CapacityFactor" VALUES ('PIE','IND_OTH_OTH_ELC_N',2012,0.35,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','IND_OTH_PH_DST_N',2012,0.70,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','IND_OTH_PH_HFO_N',2012,0.70,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','IND_OTH_PH_LPG_N',2012,0.70,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','IND_OTH_PH_NGA_N',2012,0.70,'');
-- Micro-CHP
INSERT INTO "CapacityFactor" VALUES ('PIE','IND_CHP_NGA_CI_N',2012,0.57,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','IND_CHP_NGA_TG_N',2012,0.74,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','IND_CHP_NGA_TV_N',2012,0.63,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','IND_CHP_BLQ_CI_N',2014,0.57,'');
-- Hydrogen
INSERT INTO "CapacityFactor" VALUES ('PIE','IND_H2G_DE',2025,0.70,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','H2_SMR_DS',2025,0.90,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','H2_SMR_CL',2020,0.90,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','H2_SMR_CS',2020,0.90,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','H2_HOPO',2020,0.90,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','H2_TRA_FT_GC1',2020,0.75,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','H2_TRA_FT_GC2',2020,0.75,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','H2_TRA_FT_GC3',2020,0.70,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','H2_TRA_FT_GC4',2020,0.80,'');
INSERT INTO "CapacityFactor" VALUES ('PIE','H2_TRA_FT_GC5',2020,0.70,'');


CREATE TABLE "CapacityFactorTech" (
   "regions"  text,
   "season_name"  text,
   "time_of_day_name" text,
   "tech" text,
   "cf_tech"  real check("cf_tech" >= 0 and "cf_tech" <= 1),
   "cf_tech_notes"    text,
   primary key("regions","season_name","time_of_day_name","tech"),
   foreign key("season_name") references "time_season"("t_season"),
   foreign key("time_of_day_name") references "time_of_day"("t_day"),
   foreign key("tech") references "technologies"("tech")
);
-- Electricity sector
-- Base year technologies
INSERT INTO "CapacityFactorTech" VALUES ('PIE','winter','night','ELC_WIN_N',0.296,'');
INSERT INTO "CapacityFactorTech" VALUES ('PIE','winter','morning','ELC_WIN_N',0.274,'');
INSERT INTO "CapacityFactorTech" VALUES ('PIE','winter','noon','ELC_WIN_N',0.259,'');
INSERT INTO "CapacityFactorTech" VALUES ('PIE','winter','afternoon','ELC_WIN_N',0.274,'');
INSERT INTO "CapacityFactorTech" VALUES ('PIE','spring','night','ELC_WIN_N',0.142,'');
INSERT INTO "CapacityFactorTech" VALUES ('PIE','spring','morning','ELC_WIN_N',0.122,'');
INSERT INTO "CapacityFactorTech" VALUES ('PIE','spring','noon','ELC_WIN_N',0.163,'');
INSERT INTO "CapacityFactorTech" VALUES ('PIE','spring','afternoon','ELC_WIN_N',0.138,'');
INSERT INTO "CapacityFactorTech" VALUES ('PIE','summer','night','ELC_WIN_N',0.118,'');
INSERT INTO "CapacityFactorTech" VALUES ('PIE','summer','morning','ELC_WIN_N',0.100,'');
INSERT INTO "CapacityFactorTech" VALUES ('PIE','summer','noon','ELC_WIN_N',0.129,'');
INSERT INTO "CapacityFactorTech" VALUES ('PIE','summer','afternoon','ELC_WIN_N',0.096,'');
INSERT INTO "CapacityFactorTech" VALUES ('PIE','fall','night','ELC_WIN_N',0.282,'');
INSERT INTO "CapacityFactorTech" VALUES ('PIE','fall','morning','ELC_WIN_N',0.257,'');
INSERT INTO "CapacityFactorTech" VALUES ('PIE','fall','noon','ELC_WIN_N',0.222,'');
INSERT INTO "CapacityFactorTech" VALUES ('PIE','fall','afternoon','ELC_WIN_N',0.254,'');
INSERT INTO "CapacityFactorTech" VALUES ('PIE','winter','night','ELC_PV_GRO_N',0.000,'');
INSERT INTO "CapacityFactorTech" VALUES ('PIE','winter','morning','ELC_PV_GRO_N',0.118,'');
INSERT INTO "CapacityFactorTech" VALUES ('PIE','winter','noon','ELC_PV_GRO_N',0.410,'');
INSERT INTO "CapacityFactorTech" VALUES ('PIE','winter','afternoon','ELC_PV_GRO_N',0.026,'');
INSERT INTO "CapacityFactorTech" VALUES ('PIE','spring','night','ELC_PV_GRO_N',0.000,'');
INSERT INTO "CapacityFactorTech" VALUES ('PIE','spring','morning','ELC_PV_GRO_N',0.244,'');
INSERT INTO "CapacityFactorTech" VALUES ('PIE','spring','noon','ELC_PV_GRO_N',0.487,'');
INSERT INTO "CapacityFactorTech" VALUES ('PIE','spring','afternoon','ELC_PV_GRO_N',0.063,'');
INSERT INTO "CapacityFactorTech" VALUES ('PIE','summer','night','ELC_PV_GRO_N',0.000,'');
INSERT INTO "CapacityFactorTech" VALUES ('PIE','summer','morning','ELC_PV_GRO_N',0.245,'');
INSERT INTO "CapacityFactorTech" VALUES ('PIE','summer','noon','ELC_PV_GRO_N',0.522,'');
INSERT INTO "CapacityFactorTech" VALUES ('PIE','summer','afternoon','ELC_PV_GRO_N',0.061,'');
INSERT INTO "CapacityFactorTech" VALUES ('PIE','fall','night','ELC_PV_GRO_N',0.000,'');
INSERT INTO "CapacityFactorTech" VALUES ('PIE','fall','morning','ELC_PV_GRO_N',0.107,'');
INSERT INTO "CapacityFactorTech" VALUES ('PIE','fall','noon','ELC_PV_GRO_N',0.321,'');
INSERT INTO "CapacityFactorTech" VALUES ('PIE','fall','afternoon','ELC_PV_GRO_N',0.005,'');
INSERT INTO "CapacityFactorTech" VALUES ('PIE','winter','night','ELC_PV_ROOF_N',0.000,'');
INSERT INTO "CapacityFactorTech" VALUES ('PIE','winter','morning','ELC_PV_ROOF_N',0.118,'');
INSERT INTO "CapacityFactorTech" VALUES ('PIE','winter','noon','ELC_PV_ROOF_N',0.410,'');
INSERT INTO "CapacityFactorTech" VALUES ('PIE','winter','afternoon','ELC_PV_ROOF_N',0.026,'');
INSERT INTO "CapacityFactorTech" VALUES ('PIE','spring','night','ELC_PV_ROOF_N',0.000,'');
INSERT INTO "CapacityFactorTech" VALUES ('PIE','spring','morning','ELC_PV_ROOF_N',0.244,'');
INSERT INTO "CapacityFactorTech" VALUES ('PIE','spring','noon','ELC_PV_ROOF_N',0.487,'');
INSERT INTO "CapacityFactorTech" VALUES ('PIE','spring','afternoon','ELC_PV_ROOF_N',0.063,'');
INSERT INTO "CapacityFactorTech" VALUES ('PIE','summer','night','ELC_PV_ROOF_N',0.000,'');
INSERT INTO "CapacityFactorTech" VALUES ('PIE','summer','morning','ELC_PV_ROOF_N',0.245,'');
INSERT INTO "CapacityFactorTech" VALUES ('PIE','summer','noon','ELC_PV_ROOF_N',0.522,'');
INSERT INTO "CapacityFactorTech" VALUES ('PIE','summer','afternoon','ELC_PV_ROOF_N',0.061,'');
INSERT INTO "CapacityFactorTech" VALUES ('PIE','fall','night','ELC_PV_ROOF_N',0.000,'');
INSERT INTO "CapacityFactorTech" VALUES ('PIE','fall','morning','ELC_PV_ROOF_N',0.107,'');
INSERT INTO "CapacityFactorTech" VALUES ('PIE','fall','noon','ELC_PV_ROOF_N',0.321,'');
INSERT INTO "CapacityFactorTech" VALUES ('PIE','fall','afternoon','ELC_PV_ROOF_N',0.005,'');

INSERT INTO "CapacityFactorTech" VALUES ('PIE','winter','night','ELC_HYD_FLO_E',0.260,'');
INSERT INTO "CapacityFactorTech" VALUES ('PIE','winter','morning','ELC_HYD_FLO_E',0.260,'');
INSERT INTO "CapacityFactorTech" VALUES ('PIE','winter','noon','ELC_HYD_FLO_E',0.260,'');
INSERT INTO "CapacityFactorTech" VALUES ('PIE','winter','afternoon','ELC_HYD_FLO_E',0.260,'');
INSERT INTO "CapacityFactorTech" VALUES ('PIE','spring','night','ELC_HYD_FLO_E',0.395,'');
INSERT INTO "CapacityFactorTech" VALUES ('PIE','spring','morning','ELC_HYD_FLO_E',0.395,'');
INSERT INTO "CapacityFactorTech" VALUES ('PIE','spring','noon','ELC_HYD_FLO_E',0.395,'');
INSERT INTO "CapacityFactorTech" VALUES ('PIE','spring','afternoon','ELC_HYD_FLO_E',0.395,'');
INSERT INTO "CapacityFactorTech" VALUES ('PIE','summer','night','ELC_HYD_FLO_E',0.351,'');
INSERT INTO "CapacityFactorTech" VALUES ('PIE','summer','morning','ELC_HYD_FLO_E',0.351,'');
INSERT INTO "CapacityFactorTech" VALUES ('PIE','summer','noon','ELC_HYD_FLO_E',0.351,'');
INSERT INTO "CapacityFactorTech" VALUES ('PIE','summer','afternoon','ELC_HYD_FLO_E',0.351,'');
INSERT INTO "CapacityFactorTech" VALUES ('PIE','fall','night','ELC_HYD_FLO_E',0.275,'');
INSERT INTO "CapacityFactorTech" VALUES ('PIE','fall','morning','ELC_HYD_FLO_E',0.275,'');
INSERT INTO "CapacityFactorTech" VALUES ('PIE','fall','noon','ELC_HYD_FLO_E',0.275,'');
INSERT INTO "CapacityFactorTech" VALUES ('PIE','fall','afternoon','ELC_HYD_FLO_E',0.275,'');

INSERT INTO "CapacityFactorTech" VALUES ('PIE','winter','night','ELC_HYD_RES_E',0.260,'');
INSERT INTO "CapacityFactorTech" VALUES ('PIE','winter','morning','ELC_HYD_RES_E',0.260,'');
INSERT INTO "CapacityFactorTech" VALUES ('PIE','winter','noon','ELC_HYD_RES_E',0.260,'');
INSERT INTO "CapacityFactorTech" VALUES ('PIE','winter','afternoon','ELC_HYD_RES_E',0.260,'');
INSERT INTO "CapacityFactorTech" VALUES ('PIE','spring','night','ELC_HYD_RES_E',0.395,'');
INSERT INTO "CapacityFactorTech" VALUES ('PIE','spring','morning','ELC_HYD_RES_E',0.395,'');
INSERT INTO "CapacityFactorTech" VALUES ('PIE','spring','noon','ELC_HYD_RES_E',0.395,'');
INSERT INTO "CapacityFactorTech" VALUES ('PIE','spring','afternoon','ELC_HYD_RES_E',0.395,'');
INSERT INTO "CapacityFactorTech" VALUES ('PIE','summer','night','ELC_HYD_RES_E',0.351,'');
INSERT INTO "CapacityFactorTech" VALUES ('PIE','summer','morning','ELC_HYD_RES_E',0.351,'');
INSERT INTO "CapacityFactorTech" VALUES ('PIE','summer','noon','ELC_HYD_RES_E',0.351,'');
INSERT INTO "CapacityFactorTech" VALUES ('PIE','summer','afternoon','ELC_HYD_RES_E',0.351,'');
INSERT INTO "CapacityFactorTech" VALUES ('PIE','fall','night','ELC_HYD_RES_E',0.275,'');
INSERT INTO "CapacityFactorTech" VALUES ('PIE','fall','morning','ELC_HYD_RES_E',0.275,'');
INSERT INTO "CapacityFactorTech" VALUES ('PIE','fall','noon','ELC_HYD_RES_E',0.275,'');
INSERT INTO "CapacityFactorTech" VALUES ('PIE','fall','afternoon','ELC_HYD_RES_E',0.275,'');


CREATE TABLE "CapacityFactorProcess" (
   "regions"  text,
   "season_name"  text,
   "time_of_day_name" text,
   "tech" text,
   "vintage"  integer,
   "cf_process"   real check("cf_process" >= 0 and "cf_process" <= 1),
   "cf_process_notes" text,
   primary key("regions","season_name","time_of_day_name","tech","vintage"),
   foreign key("tech") references "technologies"("tech"),
   foreign key("season_name") references "time_season"("t_season"),
   foreign key("time_of_day_name") references "time_of_day"("t_day")
);

CREATE TABLE "CapacityCredit" (
   "regions"  text,
   "periods"  integer,
   "tech" text,
   "vintage" integer,
   "cf_tech"  real check("cf_tech" >= 0 and "cf_tech" <= 1),
   "cf_tech_notes"    text,
   primary key("regions","periods","tech","vintage")
);
-- Electricity sector
INSERT INTO "CapacityCredit" VALUES ('PIE',2011,'ELC_SOL_E',2011,0.20,'');
INSERT INTO "CapacityCredit" VALUES ('PIE',2011,'ELC_WIN_E',2011,0.20,'');
INSERT INTO "CapacityCredit" VALUES ('PIE',2011,'ELC_HYD_FLO_E',2011,0.50,'');
INSERT INTO "CapacityCredit" VALUES ('PIE',2012,'ELC_HYD_MICRO_N',2012,0.32,'Dati storici di produzione TERNA');
INSERT INTO "CapacityCredit" VALUES ('PIE',2012,'ELC_HYD_MINI_N',2012,0.32,'Dati storici di produzione TERNA');
INSERT INTO "CapacityCredit" VALUES ('PIE',2012,'ELC_BIOGS_AGR_N',2012,0.70,'');
INSERT INTO "CapacityCredit" VALUES ('PIE',2012,'ELC_WIN_N',2012,0.20,'');
INSERT INTO "CapacityCredit" VALUES ('PIE',2012,'ELC_PV_GRO_N',2012,0.30,'TIMES-Italy');
INSERT INTO "CapacityCredit" VALUES ('PIE',2012,'ELC_PV_ROOF_N',2012,0.30,'TIMES-Italy');
INSERT INTO "CapacityCredit" VALUES ('PIE',2012,'ELC_CHP_BMU_N',2012,0.50,'');
INSERT INTO "CapacityCredit" VALUES ('PIE',2012,'ELC_CHP_NGA_TURB_N',2012,0.50,'');
INSERT INTO "CapacityCredit" VALUES ('PIE',2012,'ELC_CHP_NGA_CC_N',2012,0.50,'');
INSERT INTO "CapacityCredit" VALUES ('PIE',2012,'ELC_CHP_NGA_CP_N',2012,0.50,'');
INSERT INTO "CapacityCredit" VALUES ('PIE',2012,'ELC_CHP_NGA_TAP_N',2012,0.50,'');

-- Commercial sector
-- Micro-CHP
INSERT INTO "CapacityCredit" VALUES ('PIE',2012,'COM_CHP_NGA_CI_N',2012,0.20,'TIMES-Italy');
INSERT INTO "CapacityCredit" VALUES ('PIE',2012,'COM_CHP_NGA_MICRO_N',2012,0.20,'TIMES-Italy');
INSERT INTO "CapacityCredit" VALUES ('PIE',2012,'COM_CHP_NGA_CC_N',2012,0.20,'TIMES-Italy');
INSERT INTO "CapacityCredit" VALUES ('PIE',2030,'COM_CHP_NGA_SOFC_N',2030,0.20,'Assumption');

-- Residential sector
-- Micro-CHP
INSERT INTO "CapacityCredit" VALUES ('PIE',2012,'RES_CHP_NGA_CI_N',2012,0.20,'TIMES-Italy');
INSERT INTO "CapacityCredit" VALUES ('PIE',2012,'RES_CHP_NGA_MICRO_N',2012,0.20,'TIMES-Italy');
INSERT INTO "CapacityCredit" VALUES ('PIE',2012,'RES_CHP_NGA_CC_N',2012,0.20,'TIMES-Italy');
INSERT INTO "CapacityCredit" VALUES ('PIE',2023,'RES_CHP_NGA_STR_N',2023,0.20,'TIMES-Italy');

CREATE TABLE "MaxResource" (
   "regions"  text,
   "tech" text,
   "maxres"   real,
   "maxres_units" text,
   "maxres_notes" text,
   foreign key("tech") references "technologies"("tech"),
   primary key("regions","tech")
);
-- Upstream sector
INSERT INTO "MaxResource" VALUES ('PIE','UPS_MIN_RES_HOIL',2.46E+01,'PJ','');
INSERT INTO "MaxResource" VALUES ('PIE','UPS_MIN_RES_NGA',1.79E+01,'PJ','');
INSERT INTO "MaxResource" VALUES ('PIE','UPS_MIN_GRO_HOIL',6.32E+00,'PJ','');
INSERT INTO "MaxResource" VALUES ('PIE','UPS_MIN_DSC_HOIL',4.79E+00,'PJ','');
INSERT INTO "MaxResource" VALUES ('PIE','UPS_MIN_GRO_NGA',1.61E+01,'PJ','');
INSERT INTO "MaxResource" VALUES ('PIE','UPS_MIN_DSC_NGA',4.38E-01,'PJ','');

CREATE TABLE "MaterialIntensity" (
	"regions"	text,
	"comm_name" text,
	"tech"	text,
	"vintage"	integer,
	"mat_int"	real,
	"mat_int_units"	text,
	"mat_int_notes"	text,
	PRIMARY KEY("regions","tech","comm_name","vintage"),
	FOREIGN KEY("comm_name") REFERENCES "commodities"("comm_name"),
	FOREIGN KEY("tech") REFERENCES "technologies"("tech"),
	FOREIGN KEY("vintage") REFERENCES "time_periods"("t_periods")
);

CREATE TABLE "EmissionAggregation" (
	"emis_comm"	        text,
    "emis_agg"          text,
    "emis_agg_weight"   real,
    "emis_agg_units"     text,
    "emis_agg_notes"    text,
    PRIMARY KEY("emis_comm","emis_agg","emis_agg_weight")
);


INSERT INTO "EmissionAggregation" VALUES ('AGR_CO2','TOT_CO2',1.00,'[kt/act]','');
INSERT INTO "EmissionAggregation" VALUES ('COM_CO2','TOT_CO2',1.00,'[kt/act]','');
INSERT INTO "EmissionAggregation" VALUES ('RES_CO2','TOT_CO2',1.00,'[kt/act]','');
INSERT INTO "EmissionAggregation" VALUES ('TRA_CO2','TOT_CO2',1.00,'[kt/act]','');
INSERT INTO "EmissionAggregation" VALUES ('IND_CO2','TOT_CO2',1.00,'[kt/act]','');
INSERT INTO "EmissionAggregation" VALUES ('IND_CO2_PRC','TOT_CO2',1.00,'[kt/act]','');
INSERT INTO "EmissionAggregation" VALUES ('ELC_CO2','TOT_CO2',1.00,'[kt/act]','');
INSERT INTO "EmissionAggregation" VALUES ('ELC_CO2_PRC','TOT_CO2',1.00,'[kt/act]','');
INSERT INTO "EmissionAggregation" VALUES ('UPS_CO2','TOT_CO2',1.00,'[kt/act]','');
INSERT INTO "EmissionAggregation" VALUES ('UPS_CO2_PRC','TOT_CO2',1.00,'[kt/act]','');
INSERT INTO "EmissionAggregation" VALUES ('AGR_CH4','TOT_CH4',1.00E-03,'[kt/act]','');
INSERT INTO "EmissionAggregation" VALUES ('COM_CH4','TOT_CH4',1.00E-03,'[kt/act]','');
INSERT INTO "EmissionAggregation" VALUES ('RES_CH4','TOT_CH4',1.00E-03,'[kt/act]','');
INSERT INTO "EmissionAggregation" VALUES ('TRA_CH4','TOT_CH4',1.00E-03,'[kt/act]','');
INSERT INTO "EmissionAggregation" VALUES ('IND_CH4','TOT_CH4',1.00E-03,'[kt/act]','');
INSERT INTO "EmissionAggregation" VALUES ('ELC_CH4','TOT_CH4',1.00E-03,'[kt/act]','');
INSERT INTO "EmissionAggregation" VALUES ('ELC_CH4_PRC','TOT_CH4',1.00E-03,'[kt/act]','');
INSERT INTO "EmissionAggregation" VALUES ('UPS_CH4','TOT_CH4',1.00E-03,'[kt/act]','');
INSERT INTO "EmissionAggregation" VALUES ('AGR_N2O','TOT_N2O',1.00E-03,'[kt/act]','');
INSERT INTO "EmissionAggregation" VALUES ('COM_N2O','TOT_N2O',1.00E-03,'[kt/act]','');
INSERT INTO "EmissionAggregation" VALUES ('RES_N2O','TOT_N2O',1.00E-03,'[kt/act]','');
INSERT INTO "EmissionAggregation" VALUES ('TRA_N2O','TOT_N2O',1.00E-03,'[kt/act]','');
INSERT INTO "EmissionAggregation" VALUES ('IND_N2O','TOT_N2O',1.00E-03,'[kt/act]','');
INSERT INTO "EmissionAggregation" VALUES ('ELC_N2O','TOT_N2O',1.00E-03,'[kt/act]','');
INSERT INTO "EmissionAggregation" VALUES ('UPS_N2O','TOT_N2O',1.00E-03,'[kt/act]','');
INSERT INTO "EmissionAggregation" VALUES ('AGR_CO2','GWP_100',1.000,'[kt/act]','');
INSERT INTO "EmissionAggregation" VALUES ('COM_CO2','GWP_100',1.000,'[kt/act]','');
INSERT INTO "EmissionAggregation" VALUES ('RES_CO2','GWP_100',1.000,'[kt/act]','');
INSERT INTO "EmissionAggregation" VALUES ('TRA_CO2','GWP_100',1.000,'[kt/act]','');
INSERT INTO "EmissionAggregation" VALUES ('IND_CO2','GWP_100',1.000,'[kt/act]','');
INSERT INTO "EmissionAggregation" VALUES ('IND_CO2_PRC','GWP_100',1.000,'[kt/act]','');
INSERT INTO "EmissionAggregation" VALUES ('ELC_CO2','GWP_100',1.000,'[kt/act]','');
INSERT INTO "EmissionAggregation" VALUES ('ELC_CO2_PRC','GWP_100',1.000,'[kt/act]','');
INSERT INTO "EmissionAggregation" VALUES ('UPS_CO2','GWP_100',1.000,'[kt/act]','');
INSERT INTO "EmissionAggregation" VALUES ('UPS_CO2_PRC','GWP_100',1.000,'[kt/act]','');
INSERT INTO "EmissionAggregation" VALUES ('AGR_CH4','GWP_100',0.021,'[kt/act]','');
INSERT INTO "EmissionAggregation" VALUES ('COM_CH4','GWP_100',0.021,'[kt/act]','');
INSERT INTO "EmissionAggregation" VALUES ('RES_CH4','GWP_100',0.021,'[kt/act]','');
INSERT INTO "EmissionAggregation" VALUES ('TRA_CH4','GWP_100',0.021,'[kt/act]','');
INSERT INTO "EmissionAggregation" VALUES ('IND_CH4','GWP_100',0.021,'[kt/act]','');
INSERT INTO "EmissionAggregation" VALUES ('ELC_CH4','GWP_100',0.021,'[kt/act]','');
INSERT INTO "EmissionAggregation" VALUES ('ELC_CH4_PRC','GWP_100',0.021,'[kt/act]','');
INSERT INTO "EmissionAggregation" VALUES ('UPS_CH4','GWP_100',0.021,'[kt/act]','');
INSERT INTO "EmissionAggregation" VALUES ('AGR_N2O','GWP_100',0.310,'[kt/act]','');
INSERT INTO "EmissionAggregation" VALUES ('COM_N2O','GWP_100',0.310,'[kt/act]','');
INSERT INTO "EmissionAggregation" VALUES ('RES_N2O','GWP_100',0.310,'[kt/act]','');
INSERT INTO "EmissionAggregation" VALUES ('TRA_N2O','GWP_100',0.310,'[kt/act]','');
INSERT INTO "EmissionAggregation" VALUES ('IND_N2O','GWP_100',0.310,'[kt/act]','');
INSERT INTO "EmissionAggregation" VALUES ('ELC_N2O','GWP_100',0.310,'[kt/act]','');
INSERT INTO "EmissionAggregation" VALUES ('UPS_N2O','GWP_100',0.310,'[kt/act]','');


CREATE TABLE "Currency" (
	"curr"	text,
	"value"	real,
	"ref"   text,
	PRIMARY KEY("curr","value")
);
CREATE TABLE "CurrencyTech" (
	"tech"	text,
	"curr"	text,
	PRIMARY KEY("tech","curr")
);

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
CREATE TABLE "Output_V_Capacity" (
   "regions"  text,
   "scenario" text,
   "sector"   text,
   "tech" text,
   "vintage"  integer,
   "capacity" real,
   primary key("regions","scenario","tech","vintage"),
   foreign key("sector") references "sector_labels"("sector"),
   foreign key("tech") references "technologies"("tech"),
   foreign key("vintage") references "time_periods"("t_periods")
);

CREATE TABLE "Output_VFlow_Out" (
   "regions"  text,
   "scenario" text,
   "sector"   text,
   "t_periods"    integer,
   "t_season" text,
   "t_day"    text,
   "input_comm"   text,
   "tech" text,
   "vintage"  integer,
   "output_comm"  text,
   "vflow_out"    real,
   primary key("regions","scenario","t_periods","t_season","t_day","input_comm","tech","vintage","output_comm"),
   foreign key("output_comm") references "commodities"("comm_name"),
   foreign key("t_periods") references "time_periods"("t_periods"),
   foreign key("vintage") references "time_periods"("t_periods"),
   foreign key("t_season") references "time_periods"("t_periods"),
   foreign key("tech") references "technologies"("tech"),
   foreign key("sector") references "sector_labels"("sector"),
   foreign key("t_day") references "time_of_day"("t_day"),
   foreign key("input_comm") references "commodities"("comm_name")
);


CREATE TABLE "Output_VFlow_In" (
   "regions"  text,
   "scenario" text,
   "sector"   text,
   "t_periods"    integer,
   "t_season" text,
   "t_day"    text,
   "input_comm"   text,
   "tech" text,
   "vintage"  integer,
   "output_comm"  text,
   "vflow_in" real,
   primary key("regions","scenario","t_periods","t_season","t_day","input_comm","tech","vintage","output_comm"),
   foreign key("vintage") references "time_periods"("t_periods"),
   foreign key("output_comm") references "commodities"("comm_name"),
   foreign key("t_periods") references "time_periods"("t_periods"),
   foreign key("sector") references "sector_labels"("sector"),
   foreign key("t_season") references "time_periods"("t_periods"),
   foreign key("t_day") references "time_of_day"("t_day"),
   foreign key("input_comm") references "commodities"("comm_name"),
   foreign key("tech") references "technologies"("tech")
);


CREATE TABLE "Output_Objective" (
   "scenario" text,
   "objective_name"   text,
   "total_system_cost"    real
);
CREATE TABLE "Output_Emissions" (
   "regions"  text,
   "scenario" text,
   "sector"   text,
   "t_periods"    integer,
   "emissions_comm"   text,
   "tech" text,
   "vintage"  integer,
   "emissions"    real,
   primary key("regions","scenario","t_periods","emissions_comm","tech","vintage"),
   foreign key("vintage") references "time_periods"("t_periods"),
   foreign key("emissions_comm") references "EmissionActivity"("emis_comm"),
   foreign key("tech") references "technologies"("tech"),
   foreign key("sector") references "sector_labels"("sector"),
   foreign key("t_periods") references "time_periods"("t_periods")
);


CREATE TABLE "Output_Curtailment" (
   "regions"  text,
   "scenario" text,
   "sector"   text,
   "t_periods"    integer,
   "t_season" text,
   "t_day"    text,
   "input_comm"   text,
   "tech" text,
   "vintage"  integer,
   "output_comm"  text,
   "curtailment"  real,
   primary key("regions","scenario","t_periods","t_season","t_day","input_comm","tech","vintage","output_comm"),
   foreign key("tech") references "technologies"("tech"),
   foreign key("vintage") references "time_periods"("t_periods"),
   foreign key("input_comm") references "commodities"("comm_name"),
   foreign key("output_comm") references "commodities"("comm_name"),
   foreign key("t_periods") references "time_periods"("t_periods"),
   foreign key("t_season") references "time_periods"("t_periods"),
   foreign key("t_day") references "time_of_day"("t_day")
);


CREATE TABLE "Output_Costs" (
   "regions"  text,
   "scenario" text,
   "sector"   text,
   "output_name"  text,
   "tech" text,
   "vintage"  integer,
   "output_cost"  real,
   primary key("regions","scenario","output_name","tech","vintage"),
   foreign key("vintage") references "time_periods"("t_periods"),
   foreign key("sector") references "sector_labels"("sector"),
   foreign key("tech") references "technologies"("tech")
);


CREATE TABLE "Output_Duals" (
   "constraint_name"  text,
   "scenario" text,
   "dual" real,
   primary key("constraint_name","scenario")
);


CREATE TABLE "Output_CapacityByPeriodAndTech" (
   "regions"  text,
   "scenario" text,
   "sector"   text,
   "t_periods"    integer,
   "tech" text,
   "capacity" real,
   primary key("regions","scenario","t_periods","tech"),
   foreign key("sector") references "sector_labels"("sector"),
   foreign key("t_periods") references "time_periods"("t_periods"),
   foreign key("tech") references "technologies"("tech")
);

CREATE TABLE "Output_VMat_Cons" (
	"regions"	text,
	"scenario"	text,
	"sector"	text,
	"material_comm"	text,
	"tech"	text,
	"vintage"	integer,
	"vmat_cons"	real,
	PRIMARY KEY("regions","scenario","material_comm","tech","vintage"),
	FOREIGN KEY("vintage") REFERENCES "time_periods"("t_periods"),
	FOREIGN KEY("sector") REFERENCES "sector_labels"("sector"),
	FOREIGN KEY("material_comm") REFERENCES "commodities"("comm_name")
);
CREATE TABLE "Output_MaterialSupplyRisk" (
    "regions"   text,
	"scenario"	text,
	"t_periods" integer,
	"materialSR"	real,
	PRIMARY KEY("regions","scenario","t_periods"),
	FOREIGN KEY("t_periods") REFERENCES "time_periods"("t_periods"),
	FOREIGN KEY("regions") REFERENCES "regions"("regions")
);
CREATE TABLE "Output_EnergySupplyRisk" (
    "regions"   text,
	"scenario"	text,
	"t_periods" integer,
	"energySR"	real,
	PRIMARY KEY("regions","scenario","t_periods"),
	FOREIGN KEY("t_periods") REFERENCES "time_periods"("t_periods"),
	FOREIGN KEY("regions") REFERENCES "regions"("regions")
);
CREATE TABLE "Output_TotalCosts" (
    "regions"   text,
	"scenario"	text,
	"t_periods" integer,
	"total_costs"	real,
	PRIMARY KEY("regions","scenario","t_periods"),
	FOREIGN KEY("t_periods") REFERENCES "time_periods"("t_periods"),
	FOREIGN KEY("regions") REFERENCES "regions"("regions")
);
CREATE TABLE "Output_TotalEmissions" (
    "regions"   text,
	"scenario"	text,
	"t_periods" integer,
	"total_emissions"	real,
	PRIMARY KEY("regions","scenario","t_periods"),
	FOREIGN KEY("t_periods") REFERENCES "time_periods"("t_periods"),
	FOREIGN KEY("regions") REFERENCES "regions"("regions")
);
CREATE TABLE "Output_VSlack" (
	"scenario"	text,
	"moo_f"		text,
	"slack"		real,
	PRIMARY KEY("scenario","moo_f")
);
COMMIT;