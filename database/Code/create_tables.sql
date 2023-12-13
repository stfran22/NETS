IF EXISTS(SELECT * FROM sysobjects WHERE name='DunsLocation' and xtype='U')
	DROP TABLE DunsLocation;
GO
IF EXISTS(SELECT * FROM sysobjects WHERE name='BG_CC_TC_Xwalk' and xtype='U')
	DROP TABLE BG_CC_TC_Xwalk;
GO
IF EXISTS(SELECT * FROM sysobjects WHERE name='ClassifiedLong' and xtype='U')
	DROP TABLE ClassifiedLong;
GO
IF EXISTS(SELECT * FROM sysobjects WHERE name='DunsMove' and xtype='U')
	DROP TABLE DunsMove;
GO

IF EXISTS(SELECT * FROM sysobjects WHERE name='Address' and xtype='U')
	DROP TABLE Address;
GO

IF EXISTS(SELECT * FROM sysobjects WHERE name='CategoryDescriptions' and xtype='U')
	DROP TABLE CategoryDescriptions;
GO

IF EXISTS(SELECT * FROM sysobjects WHERE name='BusinessInfo' and xtype='U')
	DROP TABLE BusinessInfo;
GO

IF EXISTS(SELECT * FROM sysobjects WHERE name='TractDensities' and xtype='U')
	DROP TABLE TractDensities;
GO

IF EXISTS(SELECT * FROM sysobjects WHERE name='TractCounts' and xtype='U')
	DROP TABLE TractCounts;
GO

IF EXISTS(SELECT * FROM sysobjects WHERE name='ZCTADensities' and xtype='U')
	DROP TABLE ZCTADensities;
GO

IF EXISTS(SELECT * FROM sysobjects WHERE name='ZCTACounts' and xtype='U')
	DROP TABLE ZCTACounts;
GO

IF EXISTS(SELECT * FROM sysobjects WHERE name='ZCTAs' and xtype='U')
	DROP TABLE ZCTAs;
GO

IF EXISTS(SELECT * FROM sysobjects WHERE name='Tracts' and xtype='U')
	DROP TABLE Tracts;
GO
	
CREATE TABLE Address (
	AddressID		VARCHAR(10) PRIMARY KEY,
	GcAddress		VARCHAR(50),
	GcCity			VARCHAR(30),
	GcState			VARCHAR(2),
	GcZip			VARCHAR(5),
	GcZip4			VARCHAR(4),

)

CREATE TABLE BusinessInfo (

  DunsYear			VARCHAR(14) PRIMARY KEY,
  DunsNumber			VARCHAR(9),
  Year				SMALLINT,
  Company			VARCHAR(50),
  TradeName			VARCHAR(50),
  Emp				INT,
  Sales				INT,
  SIC				VARCHAR(8)

)

CREATE TABLE DunsMove (
	
	DunsYear		VARCHAR(14) PRIMARY KEY,
	DunsMove		VARCHAR(11),
	DunsNumber		VARCHAR(9),
	AddressID		VARCHAR(10),
	Year			SMALLINT,
	

	CONSTRAINT FQ_DunsMove_Address_AddressId FOREIGN KEY (AddressID) REFERENCES Address (AddressID),
	--CONSTRAINT FQ_DunsMove_BusinessInfo_DunsNumber FOREIGN KEY (DunsNumber) REFERENCES BusinessInfo (DunsNumber)
)


CREATE TABLE CategoryDescriptions (
	
	CategoryFullName		VARCHAR(100) PRIMARY KEY,
	Category			VARCHAR(3) UNIQUE,
	Domain				VARCHAR(40),
	Type				VARCHAR(20),
	Hierarchy			SMALLINT

)

CREATE TABLE ClassifiedLong(

	ClassificationId	INTEGER PRIMARY KEY IDENTITY,
	DunsYear			VARCHAR(14),
	BaseGroup			VARCHAR(3),

	CONSTRAINT FQ_ClassifiedLong_BusinessInfo_DunsYear FOREIGN KEY (DunsYear) REFERENCES BusinessInfo (DunsYear),
	CONSTRAINT FQ_ClassifiedLong_Category_BaseGroup FOREIGN KEY (BaseGroup) REFERENCES CategoryDescriptions (Category),
)

CREATE TABLE BG_CC_TC_Xwalk (

	BGHighLevelID	INTEGER PRIMARY KEY IDENTITY,
	BaseGroup		VARCHAR(3),
	HighLevel		VARCHAR(3),

	CONSTRAINT FQ_BGCCTCXwalk_Category_BaseGroup FOREIGN KEY (BaseGroup) REFERENCES CategoryDescriptions (Category),
	CONSTRAINT FQ_BGCCTCXwalk_Category_HighLevel FOREIGN KEY (HighLevel) REFERENCES CategoryDescriptions (Category)
)


CREATE TABLE DunsLocation (
	
	DunsLocationId		INTEGER PRIMARY KEY IDENTITY,
	AddressID			VARCHAR(10),
	Xcoord				FLOAT,
	Ycoord				FLOAT,
	DisplayX			FLOAT,
	DisplayY			FLOAT,
	GEOID10				VARCHAR(11),
	TractAreaLand		REAL,
	TractTotalArea		REAL,
	ZCTA5CE10			VARCHAR(5),
	ZCTAAreaLand		REAL,
	ZCTATotalArea		REAL,
	Addr_type			VARCHAR(20),
	Status				VARCHAR(1),
	Score				REAL,
	UHCMatchCodeRank	SMALLINT

	CONSTRAINT FQ_DunsLocation_Address_AddressId FOREIGN KEY (AddressID) REFERENCES Address (AddressID)
)

CREATE TABLE Tracts (
	Tract10Id		INTEGER PRIMARY KEY,
	Tract10			VARCHAR(11) NOT NULL

);

CREATE TABLE ZCTAs (
	ZCTA10Id		INTEGER PRIMARY KEY,
	ZCTA10			VARCHAR(5) NOT NULL

);

CREATE TABLE TractCounts (
	
	TractYearId     INTEGER PRIMARY KEY,
	Tract10Id		INTEGER NOT NULL,
	Year			INTEGER NOT NULL,
	t10_net_aal_c	SMALLINT NOT NULL,
	t10_net_acm_c	SMALLINT NOT NULL,
	t10_net_acp_c	SMALLINT NOT NULL,
	t10_net_act_c	SMALLINT NOT NULL,
	t10_net_aec_c	SMALLINT NOT NULL,
	t10_net_aht_c	SMALLINT NOT NULL,
	t10_net_alm_c	SMALLINT NOT NULL,
	t10_net_amb_c	SMALLINT NOT NULL,
	t10_net_amp_c	SMALLINT NOT NULL,
	t10_net_amu_c	SMALLINT NOT NULL,
	t10_net_amw_c	SMALLINT NOT NULL,
	t10_net_apa_c	SMALLINT NOT NULL,
	t10_net_arc_c	SMALLINT NOT NULL,
	t10_net_arl_c	SMALLINT NOT NULL,
	t10_net_art_c	SMALLINT NOT NULL,
	t10_net_atr_c	SMALLINT NOT NULL,
	t10_net_aur_c	SMALLINT NOT NULL,
	t10_net_auu_c	SMALLINT NOT NULL,
	t10_net_avp_c	SMALLINT NOT NULL,
	t10_net_awk_c	SMALLINT NOT NULL,
	t10_net_bar_c	SMALLINT NOT NULL,
	t10_net_bds_c	SMALLINT NOT NULL,
	t10_net_beu_c	SMALLINT NOT NULL,
	t10_net_bha_c	SMALLINT NOT NULL,
	t10_net_bhh_c	SMALLINT NOT NULL,
	t10_net_bho_c	SMALLINT NOT NULL,
	t10_net_bio_c	SMALLINT NOT NULL,
	t10_net_bka_c	SMALLINT NOT NULL,
	t10_net_bkn_c	SMALLINT NOT NULL,
	t10_net_bks_c	SMALLINT NOT NULL,
	t10_net_bnk_c	SMALLINT NOT NULL,
	t10_net_bok_c	SMALLINT NOT NULL,
	t10_net_cab_c	SMALLINT NOT NULL,
	t10_net_cas_c	SMALLINT NOT NULL,
	t10_net_cbc_c	SMALLINT NOT NULL,
	t10_net_cch_c	SMALLINT NOT NULL,
	t10_net_cds_c	SMALLINT NOT NULL,
	t10_net_cer_c	SMALLINT NOT NULL,
	t10_net_ceu_c	SMALLINT NOT NULL,
	t10_net_cfa_c	SMALLINT NOT NULL,
	t10_net_cfn_c	SMALLINT NOT NULL,
	t10_net_cfs_c	SMALLINT NOT NULL,
	t10_net_chr_c	SMALLINT NOT NULL,
	t10_net_chs_c	SMALLINT NOT NULL,
	t10_net_clo_c	SMALLINT NOT NULL,
	t10_net_cls_c	SMALLINT NOT NULL,
	t10_net_cmb_c	SMALLINT NOT NULL,
	t10_net_cmn_c	SMALLINT NOT NULL,
	t10_net_cmp_c	SMALLINT NOT NULL,
	t10_net_cms_c	SMALLINT NOT NULL,
	t10_net_cmu_c	SMALLINT NOT NULL,
	t10_net_cmw_c	SMALLINT NOT NULL,
	t10_net_cna_c	SMALLINT NOT NULL,
	t10_net_cnd_c	SMALLINT NOT NULL,
	t10_net_cnf_c	SMALLINT NOT NULL,
	t10_net_cng_c	SMALLINT NOT NULL,
	t10_net_cnn_c	SMALLINT NOT NULL,
	t10_net_cnv_c	SMALLINT NOT NULL,
	t10_net_com_c	SMALLINT NOT NULL,
	t10_net_cos_c	SMALLINT NOT NULL,
	t10_net_cpc_c	SMALLINT NOT NULL,
	t10_net_crd_c	SMALLINT NOT NULL,
	t10_net_crp_c	SMALLINT NOT NULL,
	t10_net_crv_c	SMALLINT NOT NULL,
	t10_net_csd_c	SMALLINT NOT NULL,
	t10_net_cst_c	SMALLINT NOT NULL,
	t10_net_cul_c	SMALLINT NOT NULL,
	t10_net_cup_c	SMALLINT NOT NULL,
	t10_net_cvp_c	SMALLINT NOT NULL,
	t10_net_dcr_c	SMALLINT NOT NULL,
	t10_net_dcs_c	SMALLINT NOT NULL,
	t10_net_ddp_c	SMALLINT NOT NULL,
	t10_net_dds_c	SMALLINT NOT NULL,
	t10_net_dem_c	SMALLINT NOT NULL,
	t10_net_dep_c	SMALLINT NOT NULL,
	t10_net_dis_c	SMALLINT NOT NULL,
	t10_net_dlr_c	SMALLINT NOT NULL,
	t10_net_doc_c	SMALLINT NOT NULL,
	t10_net_dpa_c	SMALLINT NOT NULL,
	t10_net_dpt_c	SMALLINT NOT NULL,
	t10_net_dra_c	SMALLINT NOT NULL,
	t10_net_drg_c	SMALLINT NOT NULL,
	t10_net_drn_c	SMALLINT NOT NULL,
	t10_net_drw_c	SMALLINT NOT NULL,
	t10_net_eao_c	SMALLINT NOT NULL,
	t10_net_eap_c	SMALLINT NOT NULL,
	t10_net_ear_c	SMALLINT NOT NULL,
	t10_net_eat_c	SMALLINT NOT NULL,
	t10_net_edd_c	SMALLINT NOT NULL,
	t10_net_eep_c	SMALLINT NOT NULL,
	t10_net_eeu_c	SMALLINT NOT NULL,
	t10_net_ele_c	SMALLINT NOT NULL,
	t10_net_elw_c	SMALLINT NOT NULL,
	t10_net_emt_c	SMALLINT NOT NULL,
	t10_net_eta_c	SMALLINT NOT NULL,
	t10_net_etc_c	SMALLINT NOT NULL,
	t10_net_fcs_c	SMALLINT NOT NULL,
	t10_net_ffa_c	SMALLINT NOT NULL,
	t10_net_ffs_c	SMALLINT NOT NULL,
	t10_net_fin_c	SMALLINT NOT NULL,
	t10_net_fir_c	SMALLINT NOT NULL,
	t10_net_for_c	SMALLINT NOT NULL,
	t10_net_fsa_c	SMALLINT NOT NULL,
	t10_net_fsg_c	SMALLINT NOT NULL,
	t10_net_fsh_c	SMALLINT NOT NULL,
	t10_net_fsr_c	SMALLINT NOT NULL,
	t10_net_fsu_c	SMALLINT NOT NULL,
	t10_net_fvm_c	SMALLINT NOT NULL,
	t10_net_fwk_c	SMALLINT NOT NULL,
	t10_net_gam_c	SMALLINT NOT NULL,
	t10_net_ght_c	SMALLINT NOT NULL,
	t10_net_gmm_c	SMALLINT NOT NULL,
	t10_net_gmn_c	SMALLINT NOT NULL,
	t10_net_gnh_c	SMALLINT NOT NULL,
	t10_net_gpa_c	SMALLINT NOT NULL,
	t10_net_gry_c	SMALLINT NOT NULL,
	t10_net_gss_c	SMALLINT NOT NULL,
	t10_net_gun_c	SMALLINT NOT NULL,
	t10_net_gur_c	SMALLINT NOT NULL,
	t10_net_hhg_c	SMALLINT NOT NULL,
	t10_net_hob_c	SMALLINT NOT NULL,
	t10_net_hoi_c	SMALLINT NOT NULL,
	t10_net_hos_c	SMALLINT NOT NULL,
	t10_net_hpc_c	SMALLINT NOT NULL,
	t10_net_hsr_c	SMALLINT NOT NULL,
	t10_net_hsu_c	SMALLINT NOT NULL,
	t10_net_htl_c	SMALLINT NOT NULL,
	t10_net_hws_c	SMALLINT NOT NULL,
	t10_net_ibc_c	SMALLINT NOT NULL,
	t10_net_ifc_c	SMALLINT NOT NULL,
	t10_net_ilc_c	SMALLINT NOT NULL,
	t10_net_inv_c	SMALLINT NOT NULL,
	t10_net_ipc_c	SMALLINT NOT NULL,
	t10_net_irc_c	SMALLINT NOT NULL,
	t10_net_iuc_c	SMALLINT NOT NULL,
	t10_net_jco_c	SMALLINT NOT NULL,
	t10_net_kct_c	SMALLINT NOT NULL,
	t10_net_lau_c	SMALLINT NOT NULL,
	t10_net_lfs_c	SMALLINT NOT NULL,
	t10_net_lgm_c	SMALLINT NOT NULL,
	t10_net_lgn_c	SMALLINT NOT NULL,
	t10_net_lgs_c	SMALLINT NOT NULL,
	t10_net_lgw_c	SMALLINT NOT NULL,
	t10_net_lib_c	SMALLINT NOT NULL,
	t10_net_lin_c	SMALLINT NOT NULL,
	t10_net_liq_c	SMALLINT NOT NULL,
	t10_net_lis_c	SMALLINT NOT NULL,
	t10_net_lot_c	SMALLINT NOT NULL,
	t10_net_mag_c	SMALLINT NOT NULL,
	t10_net_mas_c	SMALLINT NOT NULL,
	t10_net_mbh_c	SMALLINT NOT NULL,
	t10_net_met_c	SMALLINT NOT NULL,
	t10_net_mfc_c	SMALLINT NOT NULL,
	t10_net_mha_c	SMALLINT NOT NULL,
	t10_net_mhh_c	SMALLINT NOT NULL,
	t10_net_mho_c	SMALLINT NOT NULL,
	t10_net_mir_c	SMALLINT NOT NULL,
	t10_net_mor_c	SMALLINT NOT NULL,
	t10_net_mpa_c	SMALLINT NOT NULL,
	t10_net_mpc_c	SMALLINT NOT NULL,
	t10_net_mst_c	SMALLINT NOT NULL,
	t10_net_mua_c	SMALLINT NOT NULL,
	t10_net_mul_c	SMALLINT NOT NULL,
	t10_net_nat_c	SMALLINT NOT NULL,
	t10_net_ncl_c	SMALLINT NOT NULL,
	t10_net_ngt_c	SMALLINT NOT NULL,
	t10_net_npi_c	SMALLINT NOT NULL,
	t10_net_nsd_c	SMALLINT NOT NULL,
	t10_net_nut_c	SMALLINT NOT NULL,
	t10_net_ofd_c	SMALLINT NOT NULL,
	t10_net_ofn_c	SMALLINT NOT NULL,
	t10_net_oms_c	SMALLINT NOT NULL,
	t10_net_opt_c	SMALLINT NOT NULL,
	t10_net_pbe_c	SMALLINT NOT NULL,
	t10_net_pbn_c	SMALLINT NOT NULL,
	t10_net_pcc_c	SMALLINT NOT NULL,
	t10_net_pct_c	SMALLINT NOT NULL,
	t10_net_pet_c	SMALLINT NOT NULL,
	t10_net_pht_c	SMALLINT NOT NULL,
	t10_net_phv_c	SMALLINT NOT NULL,
	t10_net_pin_c	SMALLINT NOT NULL,
	t10_net_pis_c	SMALLINT NOT NULL,
	t10_net_piz_c	SMALLINT NOT NULL,
	t10_net_plo_c	SMALLINT NOT NULL,
	t10_net_pol_c	SMALLINT NOT NULL,
	t10_net_pos_c	SMALLINT NOT NULL,
	t10_net_psc_c	SMALLINT NOT NULL,
	t10_net_ptm_c	SMALLINT NOT NULL,
	t10_net_qsv_c	SMALLINT NOT NULL,
	t10_net_rbs_c	SMALLINT NOT NULL,
	t10_net_rcc_c	SMALLINT NOT NULL,
	t10_net_rea_c	SMALLINT NOT NULL,
	t10_net_rel_c	SMALLINT NOT NULL,
	t10_net_ren_c	SMALLINT NOT NULL,
	t10_net_res_c	SMALLINT NOT NULL,
	t10_net_rfs_c	SMALLINT NOT NULL,
	t10_net_rlg_c	SMALLINT NOT NULL,
	t10_net_rsa_c	SMALLINT NOT NULL,
	t10_net_rsc_c	SMALLINT NOT NULL,
	t10_net_rsi_c	SMALLINT NOT NULL,
	t10_net_rtc_c	SMALLINT NOT NULL,
	t10_net_rua_c	SMALLINT NOT NULL,
	t10_net_saf_c	SMALLINT NOT NULL,
	t10_net_scb_c	SMALLINT NOT NULL,
	t10_net_scc_c	SMALLINT NOT NULL,
	t10_net_scl_c	SMALLINT NOT NULL,
	t10_net_scn_c	SMALLINT NOT NULL,
	t10_net_sct_c	SMALLINT NOT NULL,
	t10_net_ser_c	SMALLINT NOT NULL,
	t10_net_sfc_c	SMALLINT NOT NULL,
	t10_net_sfm_c	SMALLINT NOT NULL,
	t10_net_shp_c	SMALLINT NOT NULL,
	t10_net_sid_c	SMALLINT NOT NULL,
	t10_net_slc_c	SMALLINT NOT NULL,
	t10_net_sma_c	SMALLINT NOT NULL,
	t10_net_smk_c	SMALLINT NOT NULL,
	t10_net_smn_c	SMALLINT NOT NULL,
	t10_net_spa_c	SMALLINT NOT NULL,
	t10_net_spc_c	SMALLINT NOT NULL,
	t10_net_spn_c	SMALLINT NOT NULL,
	t10_net_spr_c	SMALLINT NOT NULL,
	t10_net_sps_c	SMALLINT NOT NULL,
	t10_net_srb_c	SMALLINT NOT NULL,
	t10_net_src_c	SMALLINT NOT NULL,
	t10_net_srg_c	SMALLINT NOT NULL,
	t10_net_sro_c	SMALLINT NOT NULL,
	t10_net_srv_c	SMALLINT NOT NULL,
	t10_net_stf_c	SMALLINT NOT NULL,
	t10_net_stl_c	SMALLINT NOT NULL,
	t10_net_tan_c	SMALLINT NOT NULL,
	t10_net_tat_c	SMALLINT NOT NULL,
	t10_net_tax_c	SMALLINT NOT NULL,
	t10_net_thc_c	SMALLINT NOT NULL,
	t10_net_tob_c	SMALLINT NOT NULL,
	t10_net_tou_c	SMALLINT NOT NULL,
	t10_net_trn_c	SMALLINT NOT NULL,
	t10_net_trs_c	SMALLINT NOT NULL,
	t10_net_tsc_c	SMALLINT NOT NULL,
	t10_net_tva_c	SMALLINT NOT NULL,
	t10_net_uni_c	SMALLINT NOT NULL,
	t10_net_urg_c	SMALLINT NOT NULL,
	t10_net_usr_c	SMALLINT NOT NULL,
	t10_net_usu_c	SMALLINT NOT NULL,
	t10_net_vid_c	SMALLINT NOT NULL,
	t10_net_vpa_c	SMALLINT NOT NULL,
	t10_net_wal_c	SMALLINT NOT NULL,
	t10_net_wat_c	SMALLINT NOT NULL,
	t10_net_wlr_c	SMALLINT NOT NULL,
	t10_net_woo_c	SMALLINT NOT NULL,
	t10_net_wps_c	SMALLINT NOT NULL,
	t10_net_wra_c	SMALLINT NOT NULL,
	t10_net_wrn_c	SMALLINT NOT NULL,
	t10_net_wrs_c	SMALLINT NOT NULL,
	t10_net_wtl_c	SMALLINT NOT NULL,
	t10_net_zoo_c 	SMALLINT NOT NULL,

	CONSTRAINT FQ_TractCounts_Tracts_Tract10Id FOREIGN KEY (Tract10Id) REFERENCES Tracts (Tract10Id),
	CONSTRAINT UQ_TractCounts_Tract10IdYear UNIQUE (Tract10Id, Year)
);

CREATE TABLE TractDensities (

	TractYearId     INTEGER PRIMARY KEY,
	Tract10Id		INTEGER NOT NULL,
	Year			INTEGER NOT NULL,
	t10_net_aal_d	REAL NOT NULL,
	t10_net_acm_d	REAL NOT NULL,
	t10_net_acp_d	REAL NOT NULL,
	t10_net_act_d	REAL NOT NULL,
	t10_net_aec_d	REAL NOT NULL,
	t10_net_aht_d	REAL NOT NULL,
	t10_net_alm_d	REAL NOT NULL,
	t10_net_amb_d	REAL NOT NULL,
	t10_net_amp_d	REAL NOT NULL,
	t10_net_amu_d	REAL NOT NULL,
	t10_net_amw_d	REAL NOT NULL,
	t10_net_apa_d	REAL NOT NULL,
	t10_net_arc_d	REAL NOT NULL,
	t10_net_arl_d	REAL NOT NULL,
	t10_net_art_d	REAL NOT NULL,
	t10_net_atr_d	REAL NOT NULL,
	t10_net_aur_d	REAL NOT NULL,
	t10_net_auu_d	REAL NOT NULL,
	t10_net_avp_d	REAL NOT NULL,
	t10_net_awk_d	REAL NOT NULL,
	t10_net_bar_d	REAL NOT NULL,
	t10_net_bds_d	REAL NOT NULL,
	t10_net_beu_d	REAL NOT NULL,
	t10_net_bha_d	REAL NOT NULL,
	t10_net_bhh_d	REAL NOT NULL,
	t10_net_bho_d	REAL NOT NULL,
	t10_net_bio_d	REAL NOT NULL,
	t10_net_bka_d	REAL NOT NULL,
	t10_net_bkn_d	REAL NOT NULL,
	t10_net_bks_d	REAL NOT NULL,
	t10_net_bnk_d	REAL NOT NULL,
	t10_net_bok_d	REAL NOT NULL,
	t10_net_cab_d	REAL NOT NULL,
	t10_net_cas_d	REAL NOT NULL,
	t10_net_cbc_d	REAL NOT NULL,
	t10_net_cch_d	REAL NOT NULL,
	t10_net_cds_d	REAL NOT NULL,
	t10_net_cer_d	REAL NOT NULL,
	t10_net_ceu_d	REAL NOT NULL,
	t10_net_cfa_d	REAL NOT NULL,
	t10_net_cfn_d	REAL NOT NULL,
	t10_net_cfs_d	REAL NOT NULL,
	t10_net_chr_d	REAL NOT NULL,
	t10_net_chs_d	REAL NOT NULL,
	t10_net_clo_d	REAL NOT NULL,
	t10_net_cls_d	REAL NOT NULL,
	t10_net_cmb_d	REAL NOT NULL,
	t10_net_cmn_d	REAL NOT NULL,
	t10_net_cmp_d	REAL NOT NULL,
	t10_net_cms_d	REAL NOT NULL,
	t10_net_cmu_d	REAL NOT NULL,
	t10_net_cmw_d	REAL NOT NULL,
	t10_net_cna_d	REAL NOT NULL,
	t10_net_cnd_d	REAL NOT NULL,
	t10_net_cnf_d	REAL NOT NULL,
	t10_net_cng_d	REAL NOT NULL,
	t10_net_cnn_d	REAL NOT NULL,
	t10_net_cnv_d	REAL NOT NULL,
	t10_net_com_d	REAL NOT NULL,
	t10_net_cos_d	REAL NOT NULL,
	t10_net_cpc_d	REAL NOT NULL,
	t10_net_crd_d	REAL NOT NULL,
	t10_net_crp_d	REAL NOT NULL,
	t10_net_crv_d	REAL NOT NULL,
	t10_net_csd_d	REAL NOT NULL,
	t10_net_cst_d	REAL NOT NULL,
	t10_net_cul_d	REAL NOT NULL,
	t10_net_cup_d	REAL NOT NULL,
	t10_net_cvp_d	REAL NOT NULL,
	t10_net_dcr_d	REAL NOT NULL,
	t10_net_dcs_d	REAL NOT NULL,
	t10_net_ddp_d	REAL NOT NULL,
	t10_net_dds_d	REAL NOT NULL,
	t10_net_dem_d	REAL NOT NULL,
	t10_net_dep_d	REAL NOT NULL,
	t10_net_dis_d	REAL NOT NULL,
	t10_net_dlr_d	REAL NOT NULL,
	t10_net_doc_d	REAL NOT NULL,
	t10_net_dpa_d	REAL NOT NULL,
	t10_net_dpt_d	REAL NOT NULL,
	t10_net_dra_d	REAL NOT NULL,
	t10_net_drg_d	REAL NOT NULL,
	t10_net_drn_d	REAL NOT NULL,
	t10_net_drw_d	REAL NOT NULL,
	t10_net_eao_d	REAL NOT NULL,
	t10_net_eap_d	REAL NOT NULL,
	t10_net_ear_d	REAL NOT NULL,
	t10_net_eat_d	REAL NOT NULL,
	t10_net_edd_d	REAL NOT NULL,
	t10_net_eep_d	REAL NOT NULL,
	t10_net_eeu_d	REAL NOT NULL,
	t10_net_ele_d	REAL NOT NULL,
	t10_net_elw_d	REAL NOT NULL,
	t10_net_emt_d	REAL NOT NULL,
	t10_net_eta_d	REAL NOT NULL,
	t10_net_etc_d	REAL NOT NULL,
	t10_net_fcs_d	REAL NOT NULL,
	t10_net_ffa_d	REAL NOT NULL,
	t10_net_ffs_d	REAL NOT NULL,
	t10_net_fin_d	REAL NOT NULL,
	t10_net_fir_d	REAL NOT NULL,
	t10_net_for_d	REAL NOT NULL,
	t10_net_fsa_d	REAL NOT NULL,
	t10_net_fsg_d	REAL NOT NULL,
	t10_net_fsh_d	REAL NOT NULL,
	t10_net_fsr_d	REAL NOT NULL,
	t10_net_fsu_d	REAL NOT NULL,
	t10_net_fvm_d	REAL NOT NULL,
	t10_net_fwk_d	REAL NOT NULL,
	t10_net_gam_d	REAL NOT NULL,
	t10_net_ght_d	REAL NOT NULL,
	t10_net_gmm_d	REAL NOT NULL,
	t10_net_gmn_d	REAL NOT NULL,
	t10_net_gnh_d	REAL NOT NULL,
	t10_net_gpa_d	REAL NOT NULL,
	t10_net_gry_d	REAL NOT NULL,
	t10_net_gss_d	REAL NOT NULL,
	t10_net_gun_d	REAL NOT NULL,
	t10_net_gur_d	REAL NOT NULL,
	t10_net_hhg_d	REAL NOT NULL,
	t10_net_hob_d	REAL NOT NULL,
	t10_net_hoi_d	REAL NOT NULL,
	t10_net_hos_d	REAL NOT NULL,
	t10_net_hpc_d	REAL NOT NULL,
	t10_net_hsr_d	REAL NOT NULL,
	t10_net_hsu_d	REAL NOT NULL,
	t10_net_htl_d	REAL NOT NULL,
	t10_net_hws_d	REAL NOT NULL,
	t10_net_ibc_d	REAL NOT NULL,
	t10_net_ifc_d	REAL NOT NULL,
	t10_net_ilc_d	REAL NOT NULL,
	t10_net_inv_d	REAL NOT NULL,
	t10_net_ipc_d	REAL NOT NULL,
	t10_net_irc_d	REAL NOT NULL,
	t10_net_iuc_d	REAL NOT NULL,
	t10_net_jco_d	REAL NOT NULL,
	t10_net_kct_d	REAL NOT NULL,
	t10_net_lau_d	REAL NOT NULL,
	t10_net_lfs_d	REAL NOT NULL,
	t10_net_lgm_d	REAL NOT NULL,
	t10_net_lgn_d	REAL NOT NULL,
	t10_net_lgs_d	REAL NOT NULL,
	t10_net_lgw_d	REAL NOT NULL,
	t10_net_lib_d	REAL NOT NULL,
	t10_net_lin_d	REAL NOT NULL,
	t10_net_liq_d	REAL NOT NULL,
	t10_net_lis_d	REAL NOT NULL,
	t10_net_lot_d	REAL NOT NULL,
	t10_net_mag_d	REAL NOT NULL,
	t10_net_mas_d	REAL NOT NULL,
	t10_net_mbh_d	REAL NOT NULL,
	t10_net_met_d	REAL NOT NULL,
	t10_net_mfc_d	REAL NOT NULL,
	t10_net_mha_d	REAL NOT NULL,
	t10_net_mhh_d	REAL NOT NULL,
	t10_net_mho_d	REAL NOT NULL,
	t10_net_mir_d	REAL NOT NULL,
	t10_net_mor_d	REAL NOT NULL,
	t10_net_mpa_d	REAL NOT NULL,
	t10_net_mpc_d	REAL NOT NULL,
	t10_net_mst_d	REAL NOT NULL,
	t10_net_mua_d	REAL NOT NULL,
	t10_net_mul_d	REAL NOT NULL,
	t10_net_nat_d	REAL NOT NULL,
	t10_net_ncl_d	REAL NOT NULL,
	t10_net_ngt_d	REAL NOT NULL,
	t10_net_npi_d	REAL NOT NULL,
	t10_net_nsd_d	REAL NOT NULL,
	t10_net_nut_d	REAL NOT NULL,
	t10_net_ofd_d	REAL NOT NULL,
	t10_net_ofn_d	REAL NOT NULL,
	t10_net_oms_d	REAL NOT NULL,
	t10_net_opt_d	REAL NOT NULL,
	t10_net_pbe_d	REAL NOT NULL,
	t10_net_pbn_d	REAL NOT NULL,
	t10_net_pcc_d	REAL NOT NULL,
	t10_net_pct_d	REAL NOT NULL,
	t10_net_pet_d	REAL NOT NULL,
	t10_net_pht_d	REAL NOT NULL,
	t10_net_phv_d	REAL NOT NULL,
	t10_net_pin_d	REAL NOT NULL,
	t10_net_pis_d	REAL NOT NULL,
	t10_net_piz_d	REAL NOT NULL,
	t10_net_plo_d	REAL NOT NULL,
	t10_net_pol_d	REAL NOT NULL,
	t10_net_pos_d	REAL NOT NULL,
	t10_net_psc_d	REAL NOT NULL,
	t10_net_ptm_d	REAL NOT NULL,
	t10_net_qsv_d	REAL NOT NULL,
	t10_net_rbs_d	REAL NOT NULL,
	t10_net_rcc_d	REAL NOT NULL,
	t10_net_rea_d	REAL NOT NULL,
	t10_net_rel_d	REAL NOT NULL,
	t10_net_ren_d	REAL NOT NULL,
	t10_net_res_d	REAL NOT NULL,
	t10_net_rfs_d	REAL NOT NULL,
	t10_net_rlg_d	REAL NOT NULL,
	t10_net_rsa_d	REAL NOT NULL,
	t10_net_rsc_d	REAL NOT NULL,
	t10_net_rsi_d	REAL NOT NULL,
	t10_net_rtc_d	REAL NOT NULL,
	t10_net_rua_d	REAL NOT NULL,
	t10_net_saf_d	REAL NOT NULL,
	t10_net_scb_d	REAL NOT NULL,
	t10_net_scc_d	REAL NOT NULL,
	t10_net_scl_d	REAL NOT NULL,
	t10_net_scn_d	REAL NOT NULL,
	t10_net_sct_d	REAL NOT NULL,
	t10_net_ser_d	REAL NOT NULL,
	t10_net_sfc_d	REAL NOT NULL,
	t10_net_sfm_d	REAL NOT NULL,
	t10_net_shp_d	REAL NOT NULL,
	t10_net_sid_d	REAL NOT NULL,
	t10_net_slc_d	REAL NOT NULL,
	t10_net_sma_d	REAL NOT NULL,
	t10_net_smk_d	REAL NOT NULL,
	t10_net_smn_d	REAL NOT NULL,
	t10_net_spa_d	REAL NOT NULL,
	t10_net_spc_d	REAL NOT NULL,
	t10_net_spn_d	REAL NOT NULL,
	t10_net_spr_d	REAL NOT NULL,
	t10_net_sps_d	REAL NOT NULL,
	t10_net_srb_d	REAL NOT NULL,
	t10_net_src_d	REAL NOT NULL,
	t10_net_srg_d	REAL NOT NULL,
	t10_net_sro_d	REAL NOT NULL,
	t10_net_srv_d	REAL NOT NULL,
	t10_net_stf_d	REAL NOT NULL,
	t10_net_stl_d	REAL NOT NULL,
	t10_net_tan_d	REAL NOT NULL,
	t10_net_tat_d	REAL NOT NULL,
	t10_net_tax_d	REAL NOT NULL,
	t10_net_thc_d	REAL NOT NULL,
	t10_net_tob_d	REAL NOT NULL,
	t10_net_tou_d	REAL NOT NULL,
	t10_net_trn_d	REAL NOT NULL,
	t10_net_trs_d	REAL NOT NULL,
	t10_net_tsc_d	REAL NOT NULL,
	t10_net_tva_d	REAL NOT NULL,
	t10_net_uni_d	REAL NOT NULL,
	t10_net_urg_d	REAL NOT NULL,
	t10_net_usr_d	REAL NOT NULL,
	t10_net_usu_d	REAL NOT NULL,
	t10_net_vid_d	REAL NOT NULL,
	t10_net_vpa_d	REAL NOT NULL,
	t10_net_wal_d	REAL NOT NULL,
	t10_net_wat_d	REAL NOT NULL,
	t10_net_wlr_d	REAL NOT NULL,
	t10_net_woo_d	REAL NOT NULL,
	t10_net_wps_d	REAL NOT NULL,
	t10_net_wra_d	REAL NOT NULL,
	t10_net_wrn_d	REAL NOT NULL,
	t10_net_wrs_d	REAL NOT NULL,
	t10_net_wtl_d	REAL NOT NULL,
	t10_net_zoo_d	REAL NOT NULL,

	CONSTRAINT FQ_TractDensities_Tracts_Tract10Id FOREIGN KEY (Tract10Id) REFERENCES Tracts (Tract10Id),
	CONSTRAINT FQ_TractDensities_TractCounts_TractYearId FOREIGN KEY (TractYearId) REFERENCES TractCounts (TractYearId),
	CONSTRAINT UQ_TractDensities_Tract10IdYear UNIQUE (Tract10Id, Year)
);


CREATE TABLE ZCTACounts (

	ZCTAYearId		INTEGER PRIMARY KEY,
	ZCTA10Id		INTEGER NOT NULL,
	Year			INTEGER NOT NULL,
	z10_net_aal_c	SMALLINT NOT NULL,
	z10_net_acm_c	SMALLINT NOT NULL,
	z10_net_acp_c	SMALLINT NOT NULL,
	z10_net_act_c	SMALLINT NOT NULL,
	z10_net_aec_c	SMALLINT NOT NULL,
	z10_net_aht_c	SMALLINT NOT NULL,
	z10_net_alm_c	SMALLINT NOT NULL,
	z10_net_amb_c	SMALLINT NOT NULL,
	z10_net_amp_c	SMALLINT NOT NULL,
	z10_net_amu_c	SMALLINT NOT NULL,
	z10_net_amw_c	SMALLINT NOT NULL,
	z10_net_apa_c	SMALLINT NOT NULL,
	z10_net_arc_c	SMALLINT NOT NULL,
	z10_net_arl_c	SMALLINT NOT NULL,
	z10_net_art_c	SMALLINT NOT NULL,
	z10_net_atr_c	SMALLINT NOT NULL,
	z10_net_aur_c	SMALLINT NOT NULL,
	z10_net_auu_c	SMALLINT NOT NULL,
	z10_net_avp_c	SMALLINT NOT NULL,
	z10_net_awk_c	SMALLINT NOT NULL,
	z10_net_bar_c	SMALLINT NOT NULL,
	z10_net_bds_c	SMALLINT NOT NULL,
	z10_net_beu_c	SMALLINT NOT NULL,
	z10_net_bha_c	SMALLINT NOT NULL,
	z10_net_bhh_c	SMALLINT NOT NULL,
	z10_net_bho_c	SMALLINT NOT NULL,
	z10_net_bio_c	SMALLINT NOT NULL,
	z10_net_bka_c	SMALLINT NOT NULL,
	z10_net_bkn_c	SMALLINT NOT NULL,
	z10_net_bks_c	SMALLINT NOT NULL,
	z10_net_bnk_c	SMALLINT NOT NULL,
	z10_net_bok_c	SMALLINT NOT NULL,
	z10_net_cab_c	SMALLINT NOT NULL,
	z10_net_cas_c	SMALLINT NOT NULL,
	z10_net_cbc_c	SMALLINT NOT NULL,
	z10_net_cch_c	SMALLINT NOT NULL,
	z10_net_cds_c	SMALLINT NOT NULL,
	z10_net_cer_c	SMALLINT NOT NULL,
	z10_net_ceu_c	SMALLINT NOT NULL,
	z10_net_cfa_c	SMALLINT NOT NULL,
	z10_net_cfn_c	SMALLINT NOT NULL,
	z10_net_cfs_c	SMALLINT NOT NULL,
	z10_net_chr_c	SMALLINT NOT NULL,
	z10_net_chs_c	SMALLINT NOT NULL,
	z10_net_clo_c	SMALLINT NOT NULL,
	z10_net_cls_c	SMALLINT NOT NULL,
	z10_net_cmb_c	SMALLINT NOT NULL,
	z10_net_cmn_c	SMALLINT NOT NULL,
	z10_net_cmp_c	SMALLINT NOT NULL,
	z10_net_cms_c	SMALLINT NOT NULL,
	z10_net_cmu_c	SMALLINT NOT NULL,
	z10_net_cmw_c	SMALLINT NOT NULL,
	z10_net_cna_c	SMALLINT NOT NULL,
	z10_net_cnd_c	SMALLINT NOT NULL,
	z10_net_cnf_c	SMALLINT NOT NULL,
	z10_net_cng_c	SMALLINT NOT NULL,
	z10_net_cnn_c	SMALLINT NOT NULL,
	z10_net_cnv_c	SMALLINT NOT NULL,
	z10_net_com_c	SMALLINT NOT NULL,
	z10_net_cos_c	SMALLINT NOT NULL,
	z10_net_cpc_c	SMALLINT NOT NULL,
	z10_net_crd_c	SMALLINT NOT NULL,
	z10_net_crp_c	SMALLINT NOT NULL,
	z10_net_crv_c	SMALLINT NOT NULL,
	z10_net_csd_c	SMALLINT NOT NULL,
	z10_net_cst_c	SMALLINT NOT NULL,
	z10_net_cul_c	SMALLINT NOT NULL,
	z10_net_cup_c	SMALLINT NOT NULL,
	z10_net_cvp_c	SMALLINT NOT NULL,
	z10_net_dcr_c	SMALLINT NOT NULL,
	z10_net_dcs_c	SMALLINT NOT NULL,
	z10_net_ddp_c	SMALLINT NOT NULL,
	z10_net_dds_c	SMALLINT NOT NULL,
	z10_net_dem_c	SMALLINT NOT NULL,
	z10_net_dep_c	SMALLINT NOT NULL,
	z10_net_dis_c	SMALLINT NOT NULL,
	z10_net_dlr_c	SMALLINT NOT NULL,
	z10_net_doc_c	SMALLINT NOT NULL,
	z10_net_dpa_c	SMALLINT NOT NULL,
	z10_net_dpt_c	SMALLINT NOT NULL,
	z10_net_dra_c	SMALLINT NOT NULL,
	z10_net_drg_c	SMALLINT NOT NULL,
	z10_net_drn_c	SMALLINT NOT NULL,
	z10_net_drw_c	SMALLINT NOT NULL,
	z10_net_eao_c	SMALLINT NOT NULL,
	z10_net_eap_c	SMALLINT NOT NULL,
	z10_net_ear_c	SMALLINT NOT NULL,
	z10_net_eat_c	SMALLINT NOT NULL,
	z10_net_edd_c	SMALLINT NOT NULL,
	z10_net_eep_c	SMALLINT NOT NULL,
	z10_net_eeu_c	SMALLINT NOT NULL,
	z10_net_ele_c	SMALLINT NOT NULL,
	z10_net_elw_c	SMALLINT NOT NULL,
	z10_net_emt_c	SMALLINT NOT NULL,
	z10_net_eta_c	SMALLINT NOT NULL,
	z10_net_etc_c	SMALLINT NOT NULL,
	z10_net_fcs_c	SMALLINT NOT NULL,
	z10_net_ffa_c	SMALLINT NOT NULL,
	z10_net_ffs_c	SMALLINT NOT NULL,
	z10_net_fin_c	SMALLINT NOT NULL,
	z10_net_fir_c	SMALLINT NOT NULL,
	z10_net_for_c	SMALLINT NOT NULL,
	z10_net_fsa_c	SMALLINT NOT NULL,
	z10_net_fsg_c	SMALLINT NOT NULL,
	z10_net_fsh_c	SMALLINT NOT NULL,
	z10_net_fsr_c	SMALLINT NOT NULL,
	z10_net_fsu_c	SMALLINT NOT NULL,
	z10_net_fvm_c	SMALLINT NOT NULL,
	z10_net_fwk_c	SMALLINT NOT NULL,
	z10_net_gam_c	SMALLINT NOT NULL,
	z10_net_ght_c	SMALLINT NOT NULL,
	z10_net_gmm_c	SMALLINT NOT NULL,
	z10_net_gmn_c	SMALLINT NOT NULL,
	z10_net_gnh_c	SMALLINT NOT NULL,
	z10_net_gpa_c	SMALLINT NOT NULL,
	z10_net_gry_c	SMALLINT NOT NULL,
	z10_net_gss_c	SMALLINT NOT NULL,
	z10_net_gun_c	SMALLINT NOT NULL,
	z10_net_gur_c	SMALLINT NOT NULL,
	z10_net_hhg_c	SMALLINT NOT NULL,
	z10_net_hob_c	SMALLINT NOT NULL,
	z10_net_hoi_c	SMALLINT NOT NULL,
	z10_net_hos_c	SMALLINT NOT NULL,
	z10_net_hpc_c	SMALLINT NOT NULL,
	z10_net_hsr_c	SMALLINT NOT NULL,
	z10_net_hsu_c	SMALLINT NOT NULL,
	z10_net_htl_c	SMALLINT NOT NULL,
	z10_net_hws_c	SMALLINT NOT NULL,
	z10_net_ibc_c	SMALLINT NOT NULL,
	z10_net_ifc_c	SMALLINT NOT NULL,
	z10_net_ilc_c	SMALLINT NOT NULL,
	z10_net_inv_c	SMALLINT NOT NULL,
	z10_net_ipc_c	SMALLINT NOT NULL,
	z10_net_irc_c	SMALLINT NOT NULL,
	z10_net_iuc_c	SMALLINT NOT NULL,
	z10_net_jco_c	SMALLINT NOT NULL,
	z10_net_kct_c	SMALLINT NOT NULL,
	z10_net_lau_c	SMALLINT NOT NULL,
	z10_net_lfs_c	SMALLINT NOT NULL,
	z10_net_lgm_c	SMALLINT NOT NULL,
	z10_net_lgn_c	SMALLINT NOT NULL,
	z10_net_lgs_c	SMALLINT NOT NULL,
	z10_net_lgw_c	SMALLINT NOT NULL,
	z10_net_lib_c	SMALLINT NOT NULL,
	z10_net_lin_c	SMALLINT NOT NULL,
	z10_net_liq_c	SMALLINT NOT NULL,
	z10_net_lis_c	SMALLINT NOT NULL,
	z10_net_lot_c	SMALLINT NOT NULL,
	z10_net_mag_c	SMALLINT NOT NULL,
	z10_net_mas_c	SMALLINT NOT NULL,
	z10_net_mbh_c	SMALLINT NOT NULL,
	z10_net_met_c	SMALLINT NOT NULL,
	z10_net_mfc_c	SMALLINT NOT NULL,
	z10_net_mha_c	SMALLINT NOT NULL,
	z10_net_mhh_c	SMALLINT NOT NULL,
	z10_net_mho_c	SMALLINT NOT NULL,
	z10_net_mir_c	SMALLINT NOT NULL,
	z10_net_mor_c	SMALLINT NOT NULL,
	z10_net_mpa_c	SMALLINT NOT NULL,
	z10_net_mpc_c	SMALLINT NOT NULL,
	z10_net_mst_c	SMALLINT NOT NULL,
	z10_net_mua_c	SMALLINT NOT NULL,
	z10_net_mul_c	SMALLINT NOT NULL,
	z10_net_nat_c	SMALLINT NOT NULL,
	z10_net_ncl_c	SMALLINT NOT NULL,
	z10_net_ngt_c	SMALLINT NOT NULL,
	z10_net_npi_c	SMALLINT NOT NULL,
	z10_net_nsd_c	SMALLINT NOT NULL,
	z10_net_nut_c	SMALLINT NOT NULL,
	z10_net_ofd_c	SMALLINT NOT NULL,
	z10_net_ofn_c	SMALLINT NOT NULL,
	z10_net_oms_c	SMALLINT NOT NULL,
	z10_net_opt_c	SMALLINT NOT NULL,
	z10_net_pbe_c	SMALLINT NOT NULL,
	z10_net_pbn_c	SMALLINT NOT NULL,
	z10_net_pcc_c	SMALLINT NOT NULL,
	z10_net_pct_c	SMALLINT NOT NULL,
	z10_net_pet_c	SMALLINT NOT NULL,
	z10_net_pht_c	SMALLINT NOT NULL,
	z10_net_phv_c	SMALLINT NOT NULL,
	z10_net_pin_c	SMALLINT NOT NULL,
	z10_net_pis_c	SMALLINT NOT NULL,
	z10_net_piz_c	SMALLINT NOT NULL,
	z10_net_plo_c	SMALLINT NOT NULL,
	z10_net_pol_c	SMALLINT NOT NULL,
	z10_net_pos_c	SMALLINT NOT NULL,
	z10_net_psc_c	SMALLINT NOT NULL,
	z10_net_ptm_c	SMALLINT NOT NULL,
	z10_net_qsv_c	SMALLINT NOT NULL,
	z10_net_rbs_c	SMALLINT NOT NULL,
	z10_net_rcc_c	SMALLINT NOT NULL,
	z10_net_rea_c	SMALLINT NOT NULL,
	z10_net_rel_c	SMALLINT NOT NULL,
	z10_net_ren_c	SMALLINT NOT NULL,
	z10_net_res_c	SMALLINT NOT NULL,
	z10_net_rfs_c	SMALLINT NOT NULL,
	z10_net_rlg_c	SMALLINT NOT NULL,
	z10_net_rsa_c	SMALLINT NOT NULL,
	z10_net_rsc_c	SMALLINT NOT NULL,
	z10_net_rsi_c	SMALLINT NOT NULL,
	z10_net_rtc_c	SMALLINT NOT NULL,
	z10_net_rua_c	SMALLINT NOT NULL,
	z10_net_saf_c	SMALLINT NOT NULL,
	z10_net_scb_c	SMALLINT NOT NULL,
	z10_net_scc_c	SMALLINT NOT NULL,
	z10_net_scl_c	SMALLINT NOT NULL,
	z10_net_scn_c	SMALLINT NOT NULL,
	z10_net_sct_c	SMALLINT NOT NULL,
	z10_net_ser_c	SMALLINT NOT NULL,
	z10_net_sfc_c	SMALLINT NOT NULL,
	z10_net_sfm_c	SMALLINT NOT NULL,
	z10_net_shp_c	SMALLINT NOT NULL,
	z10_net_sid_c	SMALLINT NOT NULL,
	z10_net_slc_c	SMALLINT NOT NULL,
	z10_net_sma_c	SMALLINT NOT NULL,
	z10_net_smk_c	SMALLINT NOT NULL,
	z10_net_smn_c	SMALLINT NOT NULL,
	z10_net_spa_c	SMALLINT NOT NULL,
	z10_net_spc_c	SMALLINT NOT NULL,
	z10_net_spn_c	SMALLINT NOT NULL,
	z10_net_spr_c	SMALLINT NOT NULL,
	z10_net_sps_c	SMALLINT NOT NULL,
	z10_net_srb_c	SMALLINT NOT NULL,
	z10_net_src_c	SMALLINT NOT NULL,
	z10_net_srg_c	SMALLINT NOT NULL,
	z10_net_sro_c	SMALLINT NOT NULL,
	z10_net_srv_c	SMALLINT NOT NULL,
	z10_net_stf_c	SMALLINT NOT NULL,
	z10_net_stl_c	SMALLINT NOT NULL,
	z10_net_tan_c	SMALLINT NOT NULL,
	z10_net_tat_c	SMALLINT NOT NULL,
	z10_net_tax_c	SMALLINT NOT NULL,
	z10_net_thc_c	SMALLINT NOT NULL,
	z10_net_tob_c	SMALLINT NOT NULL,
	z10_net_tou_c	SMALLINT NOT NULL,
	z10_net_trn_c	SMALLINT NOT NULL,
	z10_net_trs_c	SMALLINT NOT NULL,
	z10_net_tsc_c	SMALLINT NOT NULL,
	z10_net_tva_c	SMALLINT NOT NULL,
	z10_net_uni_c	SMALLINT NOT NULL,
	z10_net_urg_c	SMALLINT NOT NULL,
	z10_net_usr_c	SMALLINT NOT NULL,
	z10_net_usu_c	SMALLINT NOT NULL,
	z10_net_vid_c	SMALLINT NOT NULL,
	z10_net_vpa_c	SMALLINT NOT NULL,
	z10_net_wal_c	SMALLINT NOT NULL,
	z10_net_wat_c	SMALLINT NOT NULL,
	z10_net_wlr_c	SMALLINT NOT NULL,
	z10_net_woo_c	SMALLINT NOT NULL,
	z10_net_wps_c	SMALLINT NOT NULL,
	z10_net_wra_c	SMALLINT NOT NULL,
	z10_net_wrn_c	SMALLINT NOT NULL,
	z10_net_wrs_c	SMALLINT NOT NULL,
	z10_net_wtl_c	SMALLINT NOT NULL,
	z10_net_zoo_c	SMALLINT NOT NULL,

	CONSTRAINT FQ_ZCTACounts_ZCTAs_ZCTA10Id FOREIGN KEY (ZCTA10Id) REFERENCES ZCTAs (ZCTA10Id),
	CONSTRAINT UQ_ZCTACounts_ZCTA10IdYear UNIQUE (ZCTA10Id, Year)

)

CREATE TABLE ZCTADensities (

	ZCTAYearId		INTEGER PRIMARY KEY,
	ZCTA10Id		INTEGER NOT NULL,
	Year			INTEGER NOT NULL,
	z10_net_aal_d	REAL NOT NULL,
	z10_net_acm_d	REAL NOT NULL,
	z10_net_acp_d	REAL NOT NULL,
	z10_net_act_d	REAL NOT NULL,
	z10_net_aec_d	REAL NOT NULL,
	z10_net_aht_d	REAL NOT NULL,
	z10_net_alm_d	REAL NOT NULL,
	z10_net_amb_d	REAL NOT NULL,
	z10_net_amp_d	REAL NOT NULL,
	z10_net_amu_d	REAL NOT NULL,
	z10_net_amw_d	REAL NOT NULL,
	z10_net_apa_d	REAL NOT NULL,
	z10_net_arc_d	REAL NOT NULL,
	z10_net_arl_d	REAL NOT NULL,
	z10_net_art_d	REAL NOT NULL,
	z10_net_atr_d	REAL NOT NULL,
	z10_net_aur_d	REAL NOT NULL,
	z10_net_auu_d	REAL NOT NULL,
	z10_net_avp_d	REAL NOT NULL,
	z10_net_awk_d	REAL NOT NULL,
	z10_net_bar_d	REAL NOT NULL,
	z10_net_bds_d	REAL NOT NULL,
	z10_net_beu_d	REAL NOT NULL,
	z10_net_bha_d	REAL NOT NULL,
	z10_net_bhh_d	REAL NOT NULL,
	z10_net_bho_d	REAL NOT NULL,
	z10_net_bio_d	REAL NOT NULL,
	z10_net_bka_d	REAL NOT NULL,
	z10_net_bkn_d	REAL NOT NULL,
	z10_net_bks_d	REAL NOT NULL,
	z10_net_bnk_d	REAL NOT NULL,
	z10_net_bok_d	REAL NOT NULL,
	z10_net_cab_d	REAL NOT NULL,
	z10_net_cas_d	REAL NOT NULL,
	z10_net_cbc_d	REAL NOT NULL,
	z10_net_cch_d	REAL NOT NULL,
	z10_net_cds_d	REAL NOT NULL,
	z10_net_cer_d	REAL NOT NULL,
	z10_net_ceu_d	REAL NOT NULL,
	z10_net_cfa_d	REAL NOT NULL,
	z10_net_cfn_d	REAL NOT NULL,
	z10_net_cfs_d	REAL NOT NULL,
	z10_net_chr_d	REAL NOT NULL,
	z10_net_chs_d	REAL NOT NULL,
	z10_net_clo_d	REAL NOT NULL,
	z10_net_cls_d	REAL NOT NULL,
	z10_net_cmb_d	REAL NOT NULL,
	z10_net_cmn_d	REAL NOT NULL,
	z10_net_cmp_d	REAL NOT NULL,
	z10_net_cms_d	REAL NOT NULL,
	z10_net_cmu_d	REAL NOT NULL,
	z10_net_cmw_d	REAL NOT NULL,
	z10_net_cna_d	REAL NOT NULL,
	z10_net_cnd_d	REAL NOT NULL,
	z10_net_cnf_d	REAL NOT NULL,
	z10_net_cng_d	REAL NOT NULL,
	z10_net_cnn_d	REAL NOT NULL,
	z10_net_cnv_d	REAL NOT NULL,
	z10_net_com_d	REAL NOT NULL,
	z10_net_cos_d	REAL NOT NULL,
	z10_net_cpc_d	REAL NOT NULL,
	z10_net_crd_d	REAL NOT NULL,
	z10_net_crp_d	REAL NOT NULL,
	z10_net_crv_d	REAL NOT NULL,
	z10_net_csd_d	REAL NOT NULL,
	z10_net_cst_d	REAL NOT NULL,
	z10_net_cul_d	REAL NOT NULL,
	z10_net_cup_d	REAL NOT NULL,
	z10_net_cvp_d	REAL NOT NULL,
	z10_net_dcr_d	REAL NOT NULL,
	z10_net_dcs_d	REAL NOT NULL,
	z10_net_ddp_d	REAL NOT NULL,
	z10_net_dds_d	REAL NOT NULL,
	z10_net_dem_d	REAL NOT NULL,
	z10_net_dep_d	REAL NOT NULL,
	z10_net_dis_d	REAL NOT NULL,
	z10_net_dlr_d	REAL NOT NULL,
	z10_net_doc_d	REAL NOT NULL,
	z10_net_dpa_d	REAL NOT NULL,
	z10_net_dpt_d	REAL NOT NULL,
	z10_net_dra_d	REAL NOT NULL,
	z10_net_drg_d	REAL NOT NULL,
	z10_net_drn_d	REAL NOT NULL,
	z10_net_drw_d	REAL NOT NULL,
	z10_net_eao_d	REAL NOT NULL,
	z10_net_eap_d	REAL NOT NULL,
	z10_net_ear_d	REAL NOT NULL,
	z10_net_eat_d	REAL NOT NULL,
	z10_net_edd_d	REAL NOT NULL,
	z10_net_eep_d	REAL NOT NULL,
	z10_net_eeu_d	REAL NOT NULL,
	z10_net_ele_d	REAL NOT NULL,
	z10_net_elw_d	REAL NOT NULL,
	z10_net_emt_d	REAL NOT NULL,
	z10_net_eta_d	REAL NOT NULL,
	z10_net_etc_d	REAL NOT NULL,
	z10_net_fcs_d	REAL NOT NULL,
	z10_net_ffa_d	REAL NOT NULL,
	z10_net_ffs_d	REAL NOT NULL,
	z10_net_fin_d	REAL NOT NULL,
	z10_net_fir_d	REAL NOT NULL,
	z10_net_for_d	REAL NOT NULL,
	z10_net_fsa_d	REAL NOT NULL,
	z10_net_fsg_d	REAL NOT NULL,
	z10_net_fsh_d	REAL NOT NULL,
	z10_net_fsr_d	REAL NOT NULL,
	z10_net_fsu_d	REAL NOT NULL,
	z10_net_fvm_d	REAL NOT NULL,
	z10_net_fwk_d	REAL NOT NULL,
	z10_net_gam_d	REAL NOT NULL,
	z10_net_ght_d	REAL NOT NULL,
	z10_net_gmm_d	REAL NOT NULL,
	z10_net_gmn_d	REAL NOT NULL,
	z10_net_gnh_d	REAL NOT NULL,
	z10_net_gpa_d	REAL NOT NULL,
	z10_net_gry_d	REAL NOT NULL,
	z10_net_gss_d	REAL NOT NULL,
	z10_net_gun_d	REAL NOT NULL,
	z10_net_gur_d	REAL NOT NULL,
	z10_net_hhg_d	REAL NOT NULL,
	z10_net_hob_d	REAL NOT NULL,
	z10_net_hoi_d	REAL NOT NULL,
	z10_net_hos_d	REAL NOT NULL,
	z10_net_hpc_d	REAL NOT NULL,
	z10_net_hsr_d	REAL NOT NULL,
	z10_net_hsu_d	REAL NOT NULL,
	z10_net_htl_d	REAL NOT NULL,
	z10_net_hws_d	REAL NOT NULL,
	z10_net_ibc_d	REAL NOT NULL,
	z10_net_ifc_d	REAL NOT NULL,
	z10_net_ilc_d	REAL NOT NULL,
	z10_net_inv_d	REAL NOT NULL,
	z10_net_ipc_d	REAL NOT NULL,
	z10_net_irc_d	REAL NOT NULL,
	z10_net_iuc_d	REAL NOT NULL,
	z10_net_jco_d	REAL NOT NULL,
	z10_net_kct_d	REAL NOT NULL,
	z10_net_lau_d	REAL NOT NULL,
	z10_net_lfs_d	REAL NOT NULL,
	z10_net_lgm_d	REAL NOT NULL,
	z10_net_lgn_d	REAL NOT NULL,
	z10_net_lgs_d	REAL NOT NULL,
	z10_net_lgw_d	REAL NOT NULL,
	z10_net_lib_d	REAL NOT NULL,
	z10_net_lin_d	REAL NOT NULL,
	z10_net_liq_d	REAL NOT NULL,
	z10_net_lis_d	REAL NOT NULL,
	z10_net_lot_d	REAL NOT NULL,
	z10_net_mag_d	REAL NOT NULL,
	z10_net_mas_d	REAL NOT NULL,
	z10_net_mbh_d	REAL NOT NULL,
	z10_net_met_d	REAL NOT NULL,
	z10_net_mfc_d	REAL NOT NULL,
	z10_net_mha_d	REAL NOT NULL,
	z10_net_mhh_d	REAL NOT NULL,
	z10_net_mho_d	REAL NOT NULL,
	z10_net_mir_d	REAL NOT NULL,
	z10_net_mor_d	REAL NOT NULL,
	z10_net_mpa_d	REAL NOT NULL,
	z10_net_mpc_d	REAL NOT NULL,
	z10_net_mst_d	REAL NOT NULL,
	z10_net_mua_d	REAL NOT NULL,
	z10_net_mul_d	REAL NOT NULL,
	z10_net_nat_d	REAL NOT NULL,
	z10_net_ncl_d	REAL NOT NULL,
	z10_net_ngt_d	REAL NOT NULL,
	z10_net_npi_d	REAL NOT NULL,
	z10_net_nsd_d	REAL NOT NULL,
	z10_net_nut_d	REAL NOT NULL,
	z10_net_ofd_d	REAL NOT NULL,
	z10_net_ofn_d	REAL NOT NULL,
	z10_net_oms_d	REAL NOT NULL,
	z10_net_opt_d	REAL NOT NULL,
	z10_net_pbe_d	REAL NOT NULL,
	z10_net_pbn_d	REAL NOT NULL,
	z10_net_pcc_d	REAL NOT NULL,
	z10_net_pct_d	REAL NOT NULL,
	z10_net_pet_d	REAL NOT NULL,
	z10_net_pht_d	REAL NOT NULL,
	z10_net_phv_d	REAL NOT NULL,
	z10_net_pin_d	REAL NOT NULL,
	z10_net_pis_d	REAL NOT NULL,
	z10_net_piz_d	REAL NOT NULL,
	z10_net_plo_d	REAL NOT NULL,
	z10_net_pol_d	REAL NOT NULL,
	z10_net_pos_d	REAL NOT NULL,
	z10_net_psc_d	REAL NOT NULL,
	z10_net_ptm_d	REAL NOT NULL,
	z10_net_qsv_d	REAL NOT NULL,
	z10_net_rbs_d	REAL NOT NULL,
	z10_net_rcc_d	REAL NOT NULL,
	z10_net_rea_d	REAL NOT NULL,
	z10_net_rel_d	REAL NOT NULL,
	z10_net_ren_d	REAL NOT NULL,
	z10_net_res_d	REAL NOT NULL,
	z10_net_rfs_d	REAL NOT NULL,
	z10_net_rlg_d	REAL NOT NULL,
	z10_net_rsa_d	REAL NOT NULL,
	z10_net_rsc_d	REAL NOT NULL,
	z10_net_rsi_d	REAL NOT NULL,
	z10_net_rtc_d	REAL NOT NULL,
	z10_net_rua_d	REAL NOT NULL,
	z10_net_saf_d	REAL NOT NULL,
	z10_net_scb_d	REAL NOT NULL,
	z10_net_scc_d	REAL NOT NULL,
	z10_net_scl_d	REAL NOT NULL,
	z10_net_scn_d	REAL NOT NULL,
	z10_net_sct_d	REAL NOT NULL,
	z10_net_ser_d	REAL NOT NULL,
	z10_net_sfc_d	REAL NOT NULL,
	z10_net_sfm_d	REAL NOT NULL,
	z10_net_shp_d	REAL NOT NULL,
	z10_net_sid_d	REAL NOT NULL,
	z10_net_slc_d	REAL NOT NULL,
	z10_net_sma_d	REAL NOT NULL,
	z10_net_smk_d	REAL NOT NULL,
	z10_net_smn_d	REAL NOT NULL,
	z10_net_spa_d	REAL NOT NULL,
	z10_net_spc_d	REAL NOT NULL,
	z10_net_spn_d	REAL NOT NULL,
	z10_net_spr_d	REAL NOT NULL,
	z10_net_sps_d	REAL NOT NULL,
	z10_net_srb_d	REAL NOT NULL,
	z10_net_src_d	REAL NOT NULL,
	z10_net_srg_d	REAL NOT NULL,
	z10_net_sro_d	REAL NOT NULL,
	z10_net_srv_d	REAL NOT NULL,
	z10_net_stf_d	REAL NOT NULL,
	z10_net_stl_d	REAL NOT NULL,
	z10_net_tan_d	REAL NOT NULL,
	z10_net_tat_d	REAL NOT NULL,
	z10_net_tax_d	REAL NOT NULL,
	z10_net_thc_d	REAL NOT NULL,
	z10_net_tob_d	REAL NOT NULL,
	z10_net_tou_d	REAL NOT NULL,
	z10_net_trn_d	REAL NOT NULL,
	z10_net_trs_d	REAL NOT NULL,
	z10_net_tsc_d	REAL NOT NULL,
	z10_net_tva_d	REAL NOT NULL,
	z10_net_uni_d	REAL NOT NULL,
	z10_net_urg_d	REAL NOT NULL,
	z10_net_usr_d	REAL NOT NULL,
	z10_net_usu_d	REAL NOT NULL,
	z10_net_vid_d	REAL NOT NULL,
	z10_net_vpa_d	REAL NOT NULL,
	z10_net_wal_d	REAL NOT NULL,
	z10_net_wat_d	REAL NOT NULL,
	z10_net_wlr_d	REAL NOT NULL,
	z10_net_woo_d	REAL NOT NULL,
	z10_net_wps_d	REAL NOT NULL,
	z10_net_wra_d	REAL NOT NULL,
	z10_net_wrn_d	REAL NOT NULL,
	z10_net_wrs_d	REAL NOT NULL,
	z10_net_wtl_d	REAL NOT NULL,
	z10_net_zoo_d	REAL NOT NULL,

	CONSTRAINT FQ_ZCTADensities_ZCTAs_ZCTA10Id FOREIGN KEY (ZCTA10Id) REFERENCES ZCTAs (ZCTA10Id),
	CONSTRAINT FQ_ZCTADensities_ZCTACountss_ZCTA10Id FOREIGN KEY (ZCTAYearId) REFERENCES ZCTACounts (ZCTAYearId),
	CONSTRAINT UQ_ZCTADensities_ZCTA10IdYear UNIQUE (ZCTA10Id, Year)

)
