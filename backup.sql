--
-- PostgreSQL database dump
--

-- Dumped from database version 17.5
-- Dumped by pg_dump version 17.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: Findable; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public."Findable" (
    id text NOT NULL,
    "mapId" text NOT NULL,
    name text NOT NULL,
    "imageUrl" text NOT NULL,
    "coordinateX" double precision NOT NULL,
    "coordinateY" double precision NOT NULL
);


ALTER TABLE public."Findable" OWNER TO neondb_owner;

--
-- Name: GameSession; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public."GameSession" (
    id text NOT NULL,
    "mapId" text NOT NULL,
    "playerId" text NOT NULL,
    "playerName" text,
    "startTime" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "endTime" timestamp(3) without time zone,
    "durationSeconds" integer,
    "assignedFindables" jsonb[],
    "foundFindables" text[],
    completed boolean DEFAULT false NOT NULL
);


ALTER TABLE public."GameSession" OWNER TO neondb_owner;

--
-- Name: Map; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public."Map" (
    id text NOT NULL,
    name text NOT NULL,
    slug text NOT NULL,
    "imageUrl" text NOT NULL,
    "thumbnailUrl" text NOT NULL,
    "imageCreator" text
);


ALTER TABLE public."Map" OWNER TO neondb_owner;

--
-- Data for Name: Findable; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public."Findable" (id, "mapId", name, "imageUrl", "coordinateX", "coordinateY") FROM stdin;
71725189-ce50-44ed-9ea6-3281b57147a5	ba96ebb4-dbe5-4980-b77a-8c3c7b71ae06	Luigi	https://res.cloudinary.com/dxt6txp6k/image/upload/v1750107486/smash_luigi_nfphya.png	1155	68
719b770d-5037-4ace-b323-7d67a134f9d2	ba96ebb4-dbe5-4980-b77a-8c3c7b71ae06	Zelda	https://res.cloudinary.com/dxt6txp6k/image/upload/v1750107487/smash_zelda_bpovsr.png	2011	480
eb6ebdd7-637d-4243-894e-af2e93fb6705	ba96ebb4-dbe5-4980-b77a-8c3c7b71ae06	Ivysaur	https://res.cloudinary.com/dxt6txp6k/image/upload/v1750107489/smash_ivysaur_w0y7e1.png	3920	680
6c8ea865-0212-4338-a0ab-9bc5bb71be37	b0359eee-d801-4fed-977d-4dcb230c9a4c	Swablu	https://res.cloudinary.com/dxt6txp6k/image/upload/v1750107892/pokemon_swablu_dsstnh.png	180	400
bde4e156-6b4f-40b8-8bd8-1a36b2bbd7e9	b0359eee-d801-4fed-977d-4dcb230c9a4c	Riolu	https://res.cloudinary.com/dxt6txp6k/image/upload/v1750107891/pokemon_riolu_ka2lql.png	564	760
a7776457-93dc-446c-a4ed-59ac173efdf5	b0359eee-d801-4fed-977d-4dcb230c9a4c	Umbreon	https://res.cloudinary.com/dxt6txp6k/image/upload/v1750107894/pokemon_umbreon_dhucz2.png	515	204
99b3ec93-fc90-469f-89de-bc24dd7c9a71	b0359eee-d801-4fed-977d-4dcb230c9a4c	Charmeleon	https://res.cloudinary.com/dxt6txp6k/image/upload/v1750574685/pokemon_charmeleon_ofgg2t.png	380	770
003d1f1e-522d-4d6c-a9b0-80031b2766cc	ba96ebb4-dbe5-4980-b77a-8c3c7b71ae06	Pokémon Trainer	https://res.cloudinary.com/dxt6txp6k/image/upload/v1751182946/smash_pokemon_trainer_ptogrb.png	3725	587
9314b29c-25c5-4647-ad7e-1f3f7a170e23	b0359eee-d801-4fed-977d-4dcb230c9a4c	Ampharos	https://res.cloudinary.com/dxt6txp6k/image/upload/v1751190767/pokemon_ampharos_u4gn95.png	682	740
7b92c682-a6ed-43b6-a963-fd5da7a56069	b0359eee-d801-4fed-977d-4dcb230c9a4c	Arbok	https://res.cloudinary.com/dxt6txp6k/image/upload/v1751190769/pokemon_arbok_stxesx.png	469	648
6a7ff6a8-3e42-48b6-acac-bf2948aea09d	b0359eee-d801-4fed-977d-4dcb230c9a4c	Azumarill	https://res.cloudinary.com/dxt6txp6k/image/upload/v1751190770/pokemon_azumarill_vw6haa.png	29	575
74eb9651-88f2-418c-9b4d-875920dca008	b0359eee-d801-4fed-977d-4dcb230c9a4c	Blastoise	https://res.cloudinary.com/dxt6txp6k/image/upload/v1751190771/pokemon_blastoise_qfgcud.png	403	305
cc5dcb0f-3cdc-4451-818c-7a1d0908c820	b0359eee-d801-4fed-977d-4dcb230c9a4c	Butterfree	https://res.cloudinary.com/dxt6txp6k/image/upload/v1751190773/pokemon_butterfree_udmg1n.png	239	660
15389af4-ab33-40a0-88c8-d9bb295bb416	b0359eee-d801-4fed-977d-4dcb230c9a4c	Cacnea	https://res.cloudinary.com/dxt6txp6k/image/upload/v1751190774/pokemon_cacnea_tqynlo.png	312	383
18697857-cb8d-4bdd-8bc8-624657bdec67	b0359eee-d801-4fed-977d-4dcb230c9a4c	Celebi	https://res.cloudinary.com/dxt6txp6k/image/upload/v1751190776/pokemon_celebi_golrso.png	704	117
6674f68b-e13b-4948-835a-234b4c4ee75c	b0359eee-d801-4fed-977d-4dcb230c9a4c	Charmander	https://res.cloudinary.com/dxt6txp6k/image/upload/v1751190777/pokemon_charmander_pi3c6x.png	219	964
4be696bc-80e5-4737-9640-93b33934f953	b0359eee-d801-4fed-977d-4dcb230c9a4c	Chespin	https://res.cloudinary.com/dxt6txp6k/image/upload/v1751190779/pokemon_chespin_znwoa4.png	502	46
312b7386-e096-4cb7-9db3-0a79a8170f3e	b0359eee-d801-4fed-977d-4dcb230c9a4c	Cinccino	https://res.cloudinary.com/dxt6txp6k/image/upload/v1751190780/pokemon_cinccino_vxbusu.png	764	327
d2d323f3-0766-490a-b447-c1b9c16d7124	b0359eee-d801-4fed-977d-4dcb230c9a4c	Cloyster	https://res.cloudinary.com/dxt6txp6k/image/upload/v1751190781/pokemon_cloyster_yux6p5.png	445	420
ae509fff-2feb-4093-b4aa-a2511206cf02	b0359eee-d801-4fed-977d-4dcb230c9a4c	Crobat	https://res.cloudinary.com/dxt6txp6k/image/upload/v1751190783/pokemon_crobat_hdquic.png	691	482
dc82f053-88f4-4d55-a99d-4ca1a522b8d3	b0359eee-d801-4fed-977d-4dcb230c9a4c	Dragonite	https://res.cloudinary.com/dxt6txp6k/image/upload/v1751190785/pokemon_dragonite_spqxpl.png	704	198
fb177eec-264c-4f2c-9e44-06fb29b8be32	b0359eee-d801-4fed-977d-4dcb230c9a4c	Dratini	https://res.cloudinary.com/dxt6txp6k/image/upload/v1751190787/pokemon_dratini_f7bm36.png	188	634
a92c1f52-7658-4699-b4cb-350f83648809	b0359eee-d801-4fed-977d-4dcb230c9a4c	Druddigon	https://res.cloudinary.com/dxt6txp6k/image/upload/v1751190788/pokemon_druddigon_oyfor0.png	104	458
619573c1-5a92-4057-bd5b-aa57c51f9cb1	b0359eee-d801-4fed-977d-4dcb230c9a4c	Duosion	https://res.cloudinary.com/dxt6txp6k/image/upload/v1751190789/pokemon_duosion_lf8tdy.png	665	371
37391641-8e15-451c-b95f-841d1f40d196	b0359eee-d801-4fed-977d-4dcb230c9a4c	Froslass	https://res.cloudinary.com/dxt6txp6k/image/upload/v1751190791/pokemon_froslass_cz3rit.png	158	235
b8859f0f-31f5-4c62-9eed-c18f09cc1b3a	b0359eee-d801-4fed-977d-4dcb230c9a4c	Gardevoir	https://res.cloudinary.com/dxt6txp6k/image/upload/v1751190792/pokemon_gardevoir_wckqlf.png	414	479
6933f367-7d7f-4157-8ee1-97f51df40309	b0359eee-d801-4fed-977d-4dcb230c9a4c	Gengar	https://res.cloudinary.com/dxt6txp6k/image/upload/v1751190794/pokemon_gengar_rbjhpd.png	291	440
0273e662-3a3d-4749-a7cf-2d1c6afd06a4	b0359eee-d801-4fed-977d-4dcb230c9a4c	Ghastly	https://res.cloudinary.com/dxt6txp6k/image/upload/v1751190795/pokemon_ghastly_mllfna.png	545	872
88adbc12-867e-4a3c-b640-36ebec3cde08	ba96ebb4-dbe5-4980-b77a-8c3c7b71ae06	Bayonetta	https://res.cloudinary.com/dxt6txp6k/image/upload/v1751182969/smash_bayonetta_nby0ib.png	860	99
fdb3ab00-20e2-407b-b182-d5bcd79eea50	ba96ebb4-dbe5-4980-b77a-8c3c7b71ae06	Banjo	https://res.cloudinary.com/dxt6txp6k/image/upload/v1751182968/smash_banjo_kqbavm.png	326	191
7dbf82da-b52e-47b9-a6da-acdeaa8892a6	ba96ebb4-dbe5-4980-b77a-8c3c7b71ae06	Bowser	https://res.cloudinary.com/dxt6txp6k/image/upload/v1751182918/smash_bowser_hvtsf8.png	1769	348
7266a61a-44ac-4230-ac73-c0b19b492cd5	ba96ebb4-dbe5-4980-b77a-8c3c7b71ae06	Bowser Jr.	https://res.cloudinary.com/dxt6txp6k/image/upload/v1751182918/smash_bowser_jr_ubeldg.png	3588	83
82c4d244-2939-484f-812e-6d22d895b014	ba96ebb4-dbe5-4980-b77a-8c3c7b71ae06	Byleth	https://res.cloudinary.com/dxt6txp6k/image/upload/v1751182918/smash_byleth_pyktbj.png	994	419
1d26ffaa-7313-41bf-809c-ae65d76c7434	ba96ebb4-dbe5-4980-b77a-8c3c7b71ae06	Captain Falcon	https://res.cloudinary.com/dxt6txp6k/image/upload/v1751182918/smash_captain_falcon_krfnjt.png	4791	285
70b51fbd-93b2-4756-98d4-0cbf33f57d14	ba96ebb4-dbe5-4980-b77a-8c3c7b71ae06	Charizard	https://res.cloudinary.com/dxt6txp6k/image/upload/v1751182918/smash_charizard_kzaqlm.png	4061	563
dfcd54a7-4a4c-4b66-97dd-765ee294e276	ba96ebb4-dbe5-4980-b77a-8c3c7b71ae06	Chrom	https://res.cloudinary.com/dxt6txp6k/image/upload/v1751182918/smash_chrom_gexexp.png	4836	433
7d876b5c-faef-475a-b944-ae51e720872e	ba96ebb4-dbe5-4980-b77a-8c3c7b71ae06	Cloud	https://res.cloudinary.com/dxt6txp6k/image/upload/v1751182918/smash_cloud_andnex.png	2038	627
74ce8a75-118b-44f7-b83c-c470905beea0	ba96ebb4-dbe5-4980-b77a-8c3c7b71ae06	Corrin	https://res.cloudinary.com/dxt6txp6k/image/upload/v1751182919/smash_corrin_hv7rub.png	148	464
5d8b2915-2710-4b2b-8e55-e3ba25dc7e29	ba96ebb4-dbe5-4980-b77a-8c3c7b71ae06	Daisy	https://res.cloudinary.com/dxt6txp6k/image/upload/v1751182919/smash_daisy_l7icps.png	705	555
29b278f2-e748-4317-a422-5979524a062c	ba96ebb4-dbe5-4980-b77a-8c3c7b71ae06	Dark Pit	https://res.cloudinary.com/dxt6txp6k/image/upload/v1751182919/smash_dark_pit_w7edoz.png	1574	129
1d102cd8-c224-4345-9521-fc37c2e20da5	ba96ebb4-dbe5-4980-b77a-8c3c7b71ae06	Dark Samus	https://res.cloudinary.com/dxt6txp6k/image/upload/v1751182920/smash_dark_samus_ynqyvg.png	2971	144
c37c76fb-f588-4aff-b3ea-3f6d9f1ebf8e	ba96ebb4-dbe5-4980-b77a-8c3c7b71ae06	Diddy Kong	https://res.cloudinary.com/dxt6txp6k/image/upload/v1751182920/smash_diddy_kong_oh42z9.png	2127	107
a27bfeec-e9dd-44d8-80d8-4135598d67ed	ba96ebb4-dbe5-4980-b77a-8c3c7b71ae06	Donkey Kong	https://res.cloudinary.com/dxt6txp6k/image/upload/v1751182921/smash_donkey_kong_fxjjtq.png	2644	189
a0fe1534-ef7e-4d34-aa14-aff3fbc77f82	ba96ebb4-dbe5-4980-b77a-8c3c7b71ae06	Dr. Mario	https://res.cloudinary.com/dxt6txp6k/image/upload/v1751182921/smash_dr_mario_lh5x5b.png	123	617
101e2035-a349-4ac7-a327-aa4da79a71fc	ba96ebb4-dbe5-4980-b77a-8c3c7b71ae06	Eleven	https://res.cloudinary.com/dxt6txp6k/image/upload/v1751182921/smash_eleven_nzszkp.png	3136	618
a5d98447-ccfe-448e-90d0-5895a41335ff	ba96ebb4-dbe5-4980-b77a-8c3c7b71ae06	Falco	https://res.cloudinary.com/dxt6txp6k/image/upload/v1751182922/smash_falco_wbhn88.png	1759	111
cc711b40-6100-4fc5-889f-2d75d2d64a23	ba96ebb4-dbe5-4980-b77a-8c3c7b71ae06	Fox	https://res.cloudinary.com/dxt6txp6k/image/upload/v1751182922/smash_fox_dynmae.png	2434	378
dd58c72e-e9cc-4dc8-a8b9-330472cbaf8c	ba96ebb4-dbe5-4980-b77a-8c3c7b71ae06	Ganondorf	https://res.cloudinary.com/dxt6txp6k/image/upload/v1751182923/smash_ganondorf_cnx0cf.png	3296	129
1864cdad-4677-4bf7-97b1-c6f0d0e4bf0f	ba96ebb4-dbe5-4980-b77a-8c3c7b71ae06	Greninja	https://res.cloudinary.com/dxt6txp6k/image/upload/v1751182923/smash_greninja_ds2wsi.png	860	726
4549f4d7-bca3-41e9-ac49-74c5667fdef9	ba96ebb4-dbe5-4980-b77a-8c3c7b71ae06	Ike	https://res.cloudinary.com/dxt6txp6k/image/upload/v1751182924/smash_ike_jauufi.png	1589	475
f63059c6-1efb-4d91-8798-124ae3dc7567	ba96ebb4-dbe5-4980-b77a-8c3c7b71ae06	Incineroar	https://res.cloudinary.com/dxt6txp6k/image/upload/v1751182924/smash_incineroar_jb7wcg.png	4184	502
bad39341-43bc-4c0b-ada9-d41090ebc3ce	ba96ebb4-dbe5-4980-b77a-8c3c7b71ae06	Inkling	https://res.cloudinary.com/dxt6txp6k/image/upload/v1751182924/smash_inkling_et5jio.png	2673	595
8c6edd35-cc4f-4854-8502-724c548efccc	ba96ebb4-dbe5-4980-b77a-8c3c7b71ae06	Isabelle	https://res.cloudinary.com/dxt6txp6k/image/upload/v1751182925/smash_isabelle_ea7q4z.png	1800	665
662e81d4-5eb9-4f51-8f94-9cfa789a5bfe	ba96ebb4-dbe5-4980-b77a-8c3c7b71ae06	Jigglypuff	https://res.cloudinary.com/dxt6txp6k/image/upload/v1751182925/smash_jigglypuff_dlwjxd.png	4045	697
bf278850-b50b-48e4-8f19-794f9f6ff8d8	ba96ebb4-dbe5-4980-b77a-8c3c7b71ae06	Joker	https://res.cloudinary.com/dxt6txp6k/image/upload/v1751182926/smash_joker_mxw3rp.png	3333	389
cfb277ab-7054-4592-a994-7e0be0355378	ba96ebb4-dbe5-4980-b77a-8c3c7b71ae06	Kazooie	https://res.cloudinary.com/dxt6txp6k/image/upload/v1751182926/smash_kazooie_h7idze.png	393	87
b630682e-7a94-483e-b3f2-93e5e51c5432	ba96ebb4-dbe5-4980-b77a-8c3c7b71ae06	Kazuya	https://res.cloudinary.com/dxt6txp6k/image/upload/v1751182926/smash_kazuya_lkbf9n.png	810	364
82b7e7e0-7a03-4ded-8d2a-9af00d07c44e	ba96ebb4-dbe5-4980-b77a-8c3c7b71ae06	Ken	https://res.cloudinary.com/dxt6txp6k/image/upload/v1751182927/smash_ken_mshttw.png	1130	257
e844c351-6afa-4d30-bf13-aab8190e40bc	ba96ebb4-dbe5-4980-b77a-8c3c7b71ae06	King DeDeDe	https://res.cloudinary.com/dxt6txp6k/image/upload/v1751182928/smash_king_dedede_v2ibxr.png	4517	550
266a3928-f8b5-41c6-9fba-702b54d8b58f	ba96ebb4-dbe5-4980-b77a-8c3c7b71ae06	King K. Rool	https://res.cloudinary.com/dxt6txp6k/image/upload/v1751182928/smash_king_k_rool_scprxe.png	1433	167
9b3fb9b9-c391-419e-82a5-68521f61b372	ba96ebb4-dbe5-4980-b77a-8c3c7b71ae06	Kirby	https://res.cloudinary.com/dxt6txp6k/image/upload/v1751182930/smash_kirby_mdsl6z.png	2517	254
1ccc7761-f630-4d93-8298-6586c5391087	ba96ebb4-dbe5-4980-b77a-8c3c7b71ae06	Link	https://res.cloudinary.com/dxt6txp6k/image/upload/v1751182929/smash_link_szqpe4.png	556	173
caf92d08-4441-4df1-bf54-ee7db6b1bf29	ba96ebb4-dbe5-4980-b77a-8c3c7b71ae06	Little Mac	https://res.cloudinary.com/dxt6txp6k/image/upload/v1751182930/smash_little_mac_znetvt.png	1686	552
5f6c2a4e-503f-4c50-a0fe-fec37818f1ee	ba96ebb4-dbe5-4980-b77a-8c3c7b71ae06	Lucario	https://res.cloudinary.com/dxt6txp6k/image/upload/v1751182930/smash_lucario_fhmahi.png	1504	365
9e0213bf-f709-42d2-924e-a61999ba4137	ba96ebb4-dbe5-4980-b77a-8c3c7b71ae06	Lucas	https://res.cloudinary.com/dxt6txp6k/image/upload/v1751182931/smash_lucas_dc5ljd.png	1301	391
24657783-cd77-45c3-9232-4aadbc6f1e3f	ba96ebb4-dbe5-4980-b77a-8c3c7b71ae06	Lucina	https://res.cloudinary.com/dxt6txp6k/image/upload/v1751182932/smash_lucina_ujquiw.png	4633	251
6347f925-1724-424a-bf59-5ee37d319f03	ba96ebb4-dbe5-4980-b77a-8c3c7b71ae06	Luma	https://res.cloudinary.com/dxt6txp6k/image/upload/v1751182933/smash_luma_in06ln.png	2879	303
78fb6f57-9b79-4ee9-8065-b7d0f93be61c	ba96ebb4-dbe5-4980-b77a-8c3c7b71ae06	Mario	https://res.cloudinary.com/dxt6txp6k/image/upload/v1751182933/smash_mario_ojzjal.png	4125	161
632761d9-1150-41ad-91a2-268aeaf0d525	ba96ebb4-dbe5-4980-b77a-8c3c7b71ae06	Marth	https://res.cloudinary.com/dxt6txp6k/image/upload/v1751182933/smash_marth_zfzx7f.png	3094	477
8db04bec-bab2-4fbc-84d3-24f5cdd9eacd	ba96ebb4-dbe5-4980-b77a-8c3c7b71ae06	Mega Man	https://res.cloudinary.com/dxt6txp6k/image/upload/v1751182933/smash_mega_man_d6z7xb.png	2967	659
c03315a3-fa7c-4259-b4f1-2aaafced1ebc	ba96ebb4-dbe5-4980-b77a-8c3c7b71ae06	Meta Knight	https://res.cloudinary.com/dxt6txp6k/image/upload/v1751182935/smash_meta_knight_eseehl.png	4696	162
ae05f892-4833-4ee4-8221-aec54f4add91	ba96ebb4-dbe5-4980-b77a-8c3c7b71ae06	Mewtwo	https://res.cloudinary.com/dxt6txp6k/image/upload/v1751182935/smash_mewtwo_orhlo6.png	1279	228
dd6cb348-0592-4cfe-a547-32c5a92f9766	ba96ebb4-dbe5-4980-b77a-8c3c7b71ae06	Mii Brawler	https://res.cloudinary.com/dxt6txp6k/image/upload/v1751182936/smash_mii_brawler_coyujn.png	828	274
4b1a48a6-f000-4824-9da5-fd22a4454bf3	ba96ebb4-dbe5-4980-b77a-8c3c7b71ae06	Mii Gunner	https://res.cloudinary.com/dxt6txp6k/image/upload/v1751182936/smash_mii_gunner_bq7qmp.png	947	322
16146c15-c11a-4d67-8ef4-6a2711a10659	ba96ebb4-dbe5-4980-b77a-8c3c7b71ae06	Mii Swordfighter	https://res.cloudinary.com/dxt6txp6k/image/upload/v1751182937/smash_mii_swordfighter_cjssnr.png	687	424
e80734f6-c353-44a3-ab55-953f949c589d	ba96ebb4-dbe5-4980-b77a-8c3c7b71ae06	Min Min	https://res.cloudinary.com/dxt6txp6k/image/upload/v1751183303/smash_min_min_bwfoj0.png	3462	598
9ad9a3af-3810-4572-87c8-0cbd45a1cf3a	ba96ebb4-dbe5-4980-b77a-8c3c7b71ae06	Morgana	https://res.cloudinary.com/dxt6txp6k/image/upload/v1751182938/smash_morgana_qbjqqq.png	3187	409
d1e871de-f04e-4182-994a-72f40cc166fc	ba96ebb4-dbe5-4980-b77a-8c3c7b71ae06	Mr. Saturn	https://res.cloudinary.com/dxt6txp6k/image/upload/v1751183410/smash_mr_saturn_xwjbhw.png	1482	749
ff0ae647-6428-483d-9da3-84f706bc4879	ba96ebb4-dbe5-4980-b77a-8c3c7b71ae06	Mythra	https://res.cloudinary.com/dxt6txp6k/image/upload/v1751182938/smash_mythra_rwbwyc.png	3826	166
410908fb-5b64-4f89-84e7-bb81b4949a8a	ba96ebb4-dbe5-4980-b77a-8c3c7b71ae06	Nana	https://res.cloudinary.com/dxt6txp6k/image/upload/v1751182939/smash_nana_q4gn9s.png	180	171
1bf61805-89d4-455f-9e12-2faa3589773c	ba96ebb4-dbe5-4980-b77a-8c3c7b71ae06	Ness	https://res.cloudinary.com/dxt6txp6k/image/upload/v1751182940/smash_ness_bwvugm.png	3871	326
27908d2c-3122-4129-a11c-4bca1e7246b7	ba96ebb4-dbe5-4980-b77a-8c3c7b71ae06	Olimar	https://res.cloudinary.com/dxt6txp6k/image/upload/v1751182941/smash_olimar_qipsll.png	1613	733
6d0f5809-6ff3-40e1-a765-6f0b5665b531	ba96ebb4-dbe5-4980-b77a-8c3c7b71ae06	Pac-Man	https://res.cloudinary.com/dxt6txp6k/image/upload/v1751182941/smash_pacman_beo6wu.png	2831	128
8b9ddb5f-8956-4bf5-be37-8bfd2715544d	ba96ebb4-dbe5-4980-b77a-8c3c7b71ae06	Palutena	https://res.cloudinary.com/dxt6txp6k/image/upload/v1751182943/smash_palutena_mcxodf.png	4279	116
fb6a481f-7d8f-48a6-a21d-cb96d4abb36c	ba96ebb4-dbe5-4980-b77a-8c3c7b71ae06	Peach	https://res.cloudinary.com/dxt6txp6k/image/upload/v1751182943/smash_peach_qfexcd.png	3922	108
f4711433-69be-4a1f-ad89-695fe06ee8f8	ba96ebb4-dbe5-4980-b77a-8c3c7b71ae06	Pichu	https://res.cloudinary.com/dxt6txp6k/image/upload/v1751182943/smash_pichu_pfxx1w.png	2340	557
a47dee30-a633-4320-ac35-2949111ff4b9	ba96ebb4-dbe5-4980-b77a-8c3c7b71ae06	Pikachu	https://res.cloudinary.com/dxt6txp6k/image/upload/v1751182943/smash_pikachu_nepodg.png	2387	770
9ba42131-9d1d-4c9f-9c8e-f60c8dd5be82	ba96ebb4-dbe5-4980-b77a-8c3c7b71ae06	Piranha Plant	https://res.cloudinary.com/dxt6txp6k/image/upload/v1751182946/smash_piranha_plant_vce8xu.png	1356	587
7b259b8a-805e-4c25-8fb7-1493a65bbd8a	ba96ebb4-dbe5-4980-b77a-8c3c7b71ae06	Pit	https://res.cloudinary.com/dxt6txp6k/image/upload/v1751182946/smash_pit_dvnjke.png	2446	129
7a171ec5-7e98-444c-8abf-bcbf1f0d90e8	ba96ebb4-dbe5-4980-b77a-8c3c7b71ae06	Popo	https://res.cloudinary.com/dxt6txp6k/image/upload/v1751182946/smash_popo_z2i0rj.png	195	284
851aab5a-2585-4665-a899-928428dcfa96	ba96ebb4-dbe5-4980-b77a-8c3c7b71ae06	Pyra	https://res.cloudinary.com/dxt6txp6k/image/upload/v1751182948/smash_pyra_rtxyc1.png	3666	145
2069e55d-c153-45bc-8b66-98e70328c7a3	ba96ebb4-dbe5-4980-b77a-8c3c7b71ae06	Richter	https://res.cloudinary.com/dxt6txp6k/image/upload/v1751182948/smash_richter_nyjvea.png	4443	367
c1fb28db-d680-4ccd-9b66-9852619cb05a	ba96ebb4-dbe5-4980-b77a-8c3c7b71ae06	R.O.B.	https://res.cloudinary.com/dxt6txp6k/image/upload/v1751182949/smash_rob_ww2an1.png	1221	131
98e67367-f516-429d-9787-c3e71540ef75	ba96ebb4-dbe5-4980-b77a-8c3c7b71ae06	Robin	https://res.cloudinary.com/dxt6txp6k/image/upload/v1751182949/smash_robin_vtxxmw.png	4751	661
bcb5cc84-241b-4940-aaea-adff6f6a92c8	ba96ebb4-dbe5-4980-b77a-8c3c7b71ae06	Ridley	https://res.cloudinary.com/dxt6txp6k/image/upload/v1751183547/smash_ridley_vu8ff2.png	29	117
885b1cb6-dcb1-4b3a-ab37-67c16c0a05f7	ba96ebb4-dbe5-4980-b77a-8c3c7b71ae06	Rosalina	https://res.cloudinary.com/dxt6txp6k/image/upload/v1751182951/smash_rosalina_ri6hat.png	2812	304
7ac9489e-2924-43a2-a858-3dd037f29871	ba96ebb4-dbe5-4980-b77a-8c3c7b71ae06	Ryu	https://res.cloudinary.com/dxt6txp6k/image/upload/v1751182951/smash_ryu_wko7yb.png	4395	138
35ae6367-33e8-4a2d-ab20-9c2874e3ec03	ba96ebb4-dbe5-4980-b77a-8c3c7b71ae06	Samus	https://res.cloudinary.com/dxt6txp6k/image/upload/v1751182951/smash_samus_cmdxbv.png	2288	183
451941ce-600e-4dce-85de-834aa92e363d	ba96ebb4-dbe5-4980-b77a-8c3c7b71ae06	Sephiroth	https://res.cloudinary.com/dxt6txp6k/image/upload/v1751182952/smash_sephiroth_vdwwmj.png	2264	383
e494371a-0696-428f-85e7-ec667c3cb258	ba96ebb4-dbe5-4980-b77a-8c3c7b71ae06	Sheik	https://res.cloudinary.com/dxt6txp6k/image/upload/v1751182952/smash_sheik_emysu0.png	1949	115
1c685fdd-7711-40a0-839b-8f73d3db34a6	ba96ebb4-dbe5-4980-b77a-8c3c7b71ae06	Shulk	https://res.cloudinary.com/dxt6txp6k/image/upload/v1751182954/smash_shulk_qubin2.png	3459	182
5fa3ddee-9d15-4c4a-a58f-c2b7e241d8f7	ba96ebb4-dbe5-4980-b77a-8c3c7b71ae06	Simon	https://res.cloudinary.com/dxt6txp6k/image/upload/v1751182955/smash_simon_nukgha.png	442	423
c2cb370c-f50a-43e0-8db0-3c272520fadf	ba96ebb4-dbe5-4980-b77a-8c3c7b71ae06	Slime	https://res.cloudinary.com/dxt6txp6k/image/upload/v1751182955/smash_slime_ov4epl.png	3293	654
3d025e39-4b02-484b-835f-9e9812830c69	ba96ebb4-dbe5-4980-b77a-8c3c7b71ae06	Snake	https://res.cloudinary.com/dxt6txp6k/image/upload/v1751182956/smash_snake_aafs7c.png	1119	585
94cc6806-1247-4e68-bf52-5e75bafe09e6	ba96ebb4-dbe5-4980-b77a-8c3c7b71ae06	Sonic	https://res.cloudinary.com/dxt6txp6k/image/upload/v1751182958/smash_sonic_tsrugn.png	465	705
9150e2e6-40b5-49dc-8b57-6d338fbf4f3b	ba96ebb4-dbe5-4980-b77a-8c3c7b71ae06	Sora	https://res.cloudinary.com/dxt6txp6k/image/upload/v1751182958/smash_sora_mjqdxf.png	3159	110
7b142898-94aa-4a7e-8c57-d45ac2851ea3	ba96ebb4-dbe5-4980-b77a-8c3c7b71ae06	Squirtle	https://res.cloudinary.com/dxt6txp6k/image/upload/v1751182958/smash_squirtle_wihk5i.png	3975	775
25fb82ff-9e35-4b6b-be8e-1c585d41828c	ba96ebb4-dbe5-4980-b77a-8c3c7b71ae06	Steve	https://res.cloudinary.com/dxt6txp6k/image/upload/v1751182959/smash_steve_jjmtit.png	723	713
02aa38fd-aa15-4b0f-ad07-fcee8139d1d6	ba96ebb4-dbe5-4980-b77a-8c3c7b71ae06	Terry	https://res.cloudinary.com/dxt6txp6k/image/upload/v1751182959/smash_terry_xx8day.png	3474	386
0e2860c8-1a8f-42f7-89ca-5f77bfb8e2d9	ba96ebb4-dbe5-4980-b77a-8c3c7b71ae06	Toon Link	https://res.cloudinary.com/dxt6txp6k/image/upload/v1751182962/smash_toon_link_tnmwgh.png	721	103
1a184918-ba21-441a-a3a3-f3ca28e7c6a9	ba96ebb4-dbe5-4980-b77a-8c3c7b71ae06	Villager	https://res.cloudinary.com/dxt6txp6k/image/upload/v1751182962/smash_villager_jkgpb9.png	4445	715
b9d4552e-d638-43e6-b1fd-eeb1ae05f0a4	ba96ebb4-dbe5-4980-b77a-8c3c7b71ae06	Wario	https://res.cloudinary.com/dxt6txp6k/image/upload/v1751182963/smash_wario_eq7y4s.png	4222	645
34c8c73f-e3ab-42e8-8dfb-10d6c3f9d1a5	ba96ebb4-dbe5-4980-b77a-8c3c7b71ae06	Wii Fit Trainer	https://res.cloudinary.com/dxt6txp6k/image/upload/v1751182964/smash_wii_fit_trainer_ata9wl.png	309	437
76c23a84-7177-40d8-b39f-e45c50efef36	ba96ebb4-dbe5-4980-b77a-8c3c7b71ae06	Wolf	https://res.cloudinary.com/dxt6txp6k/image/upload/v1751182964/smash_wolf_saftaf.png	2637	385
80a38215-e4b8-495a-8438-c1c1280cd3e5	ba96ebb4-dbe5-4980-b77a-8c3c7b71ae06	Yoshi	https://res.cloudinary.com/dxt6txp6k/image/upload/v1751182965/smash_yoshi_vqvbc0.png	1884	336
3f5594f3-c28f-409e-a09a-bf6623ec947f	ba96ebb4-dbe5-4980-b77a-8c3c7b71ae06	Young Link	https://res.cloudinary.com/dxt6txp6k/image/upload/v1751182967/smash_young_link_pjcpfd.png	3657	408
f158b814-a9c5-4e09-8fd8-7f36fcd57aad	ba96ebb4-dbe5-4980-b77a-8c3c7b71ae06	Zero Suit Samus	https://res.cloudinary.com/dxt6txp6k/image/upload/v1751182967/smash_zero_suit_samus_fzrth7.png	3110	314
e1d1677e-dab4-4db7-9a7e-337ac8e55faf	ba96ebb4-dbe5-4980-b77a-8c3c7b71ae06	Roy	https://res.cloudinary.com/dxt6txp6k/image/upload/v1751183724/smash_roy_lcnshn.png	2902	455
46e7db80-d6c6-447a-b9db-346736645aaf	b0359eee-d801-4fed-977d-4dcb230c9a4c	Infernape	https://res.cloudinary.com/dxt6txp6k/image/upload/v1751190797/pokemon_infernape_easvpg.png	66	361
58fa4053-2146-4eec-a71f-044fdce939d1	b0359eee-d801-4fed-977d-4dcb230c9a4c	Jigglypuff	https://res.cloudinary.com/dxt6txp6k/image/upload/v1751190798/pokemon_jigglypuff_anft7q.png	430	955
c051b03c-2721-4c85-b679-b51d3f549e4b	b0359eee-d801-4fed-977d-4dcb230c9a4c	Jynx	https://res.cloudinary.com/dxt6txp6k/image/upload/v1751190800/pokemon_jynx_a8diaa.png	80	708
bc0c1ef5-2164-4acb-a1d6-cb0d6a943de2	b0359eee-d801-4fed-977d-4dcb230c9a4c	Koffing	https://res.cloudinary.com/dxt6txp6k/image/upload/v1751190801/pokemon_koffing_knlvgq.png	702	809
ad1c5d53-f461-4ddb-8784-6eccf95bd6b1	b0359eee-d801-4fed-977d-4dcb230c9a4c	Krabby	https://res.cloudinary.com/dxt6txp6k/image/upload/v1751190803/pokemon_krabby_q4k0pn.png	31	869
731bc60b-98cd-479a-a70c-90d5b8f2e85b	b0359eee-d801-4fed-977d-4dcb230c9a4c	Latias	https://res.cloudinary.com/dxt6txp6k/image/upload/v1751190804/pokemon_latias_n4wpse.png	595	112
4306f16f-c96c-421b-b583-9293cfebc628	b0359eee-d801-4fed-977d-4dcb230c9a4c	Lileep	https://res.cloudinary.com/dxt6txp6k/image/upload/v1751190805/pokemon_lileep_sxh3x3.png	321	274
4022433c-401b-4fe4-89ea-92739aa695e2	b0359eee-d801-4fed-977d-4dcb230c9a4c	Litwick	https://res.cloudinary.com/dxt6txp6k/image/upload/v1751190734/pokemon_litwick_ykyxws.png	277	730
6cbf46d0-80ee-4a02-bc6e-b6f3132594e5	b0359eee-d801-4fed-977d-4dcb230c9a4c	Machamp	https://res.cloudinary.com/dxt6txp6k/image/upload/v1751190734/pokemon_machamp_kj7vmg.png	178	540
8461de07-bedf-4deb-99e0-300ff610c22c	b0359eee-d801-4fed-977d-4dcb230c9a4c	Mankey	https://res.cloudinary.com/dxt6txp6k/image/upload/v1751190735/pokemon_mankey_mh07mh.png	683	937
3491fe53-18e5-4a9f-b17f-c096689e51c7	b0359eee-d801-4fed-977d-4dcb230c9a4c	Maractus	https://res.cloudinary.com/dxt6txp6k/image/upload/v1751190736/pokemon_maractus_ftoebj.png	298	634
1404b981-2933-4ebb-80d3-1a031cddad4f	b0359eee-d801-4fed-977d-4dcb230c9a4c	Marill	https://res.cloudinary.com/dxt6txp6k/image/upload/v1751190737/pokemon_marill_u7zwll.png	586	977
97200f34-34a2-4a14-9bb9-65212152698f	b0359eee-d801-4fed-977d-4dcb230c9a4c	Mewtwo	https://res.cloudinary.com/dxt6txp6k/image/upload/v1751190738/pokemon_mewtwo_zbvnoq.png	308	134
de555393-6124-4bd7-b684-09abfa81f74e	b0359eee-d801-4fed-977d-4dcb230c9a4c	Milotic	https://res.cloudinary.com/dxt6txp6k/image/upload/v1751190739/pokemon_milotic_e8oqej.png	624	198
0ca22883-1da2-4278-9ff6-16453d0a1852	b0359eee-d801-4fed-977d-4dcb230c9a4c	Mime Jr.	https://res.cloudinary.com/dxt6txp6k/image/upload/v1751190740/pokemon_mime_jr_y0ksde.png	458	803
7c93941f-d3a5-4d12-bb71-36b1314d96e3	b0359eee-d801-4fed-977d-4dcb230c9a4c	Munchlax	https://res.cloudinary.com/dxt6txp6k/image/upload/v1751190741/pokemon_munchlax_cqv9h5.png	297	836
f3b9f590-31a5-438c-aba5-75128b362e56	b0359eee-d801-4fed-977d-4dcb230c9a4c	Phione	https://res.cloudinary.com/dxt6txp6k/image/upload/v1751190742/pokemon_phione_py8je8.png	83	84
5315e112-7d86-4ea1-b262-ce8d374d4653	b0359eee-d801-4fed-977d-4dcb230c9a4c	Pikachu	https://res.cloudinary.com/dxt6txp6k/image/upload/v1751190744/pokemon_pikachu_skahbr.png	88	970
ee74e0af-2de4-4429-8920-a1dcea7431ec	b0359eee-d801-4fed-977d-4dcb230c9a4c	Pineco	https://res.cloudinary.com/dxt6txp6k/image/upload/v1751190745/pokemon_pineco_m5lc9e.png	122	832
39bf6bc9-0e3a-4d99-817d-97d8ea4060da	b0359eee-d801-4fed-977d-4dcb230c9a4c	Roselia	https://res.cloudinary.com/dxt6txp6k/image/upload/v1751190746/pokemon_roselia_rg1l8c.png	709	616
0efbdc17-0e74-48f2-9577-81f84e5e0e22	b0359eee-d801-4fed-977d-4dcb230c9a4c	Salamence	https://res.cloudinary.com/dxt6txp6k/image/upload/v1751190747/pokemon_salamence_w2mjze.png	16	172
ac2b0aed-fcd2-486f-a68e-660f88262122	b0359eee-d801-4fed-977d-4dcb230c9a4c	Sceptile	https://res.cloudinary.com/dxt6txp6k/image/upload/v1751190748/pokemon_sceptile_l38j2x.png	590	424
d5fc2d55-29f0-43c3-ab7a-7d667de86d37	b0359eee-d801-4fed-977d-4dcb230c9a4c	Scraggy	https://res.cloudinary.com/dxt6txp6k/image/upload/v1751190749/pokemon_scraggy_uhyhum.png	563	563
d42deae1-a90d-4238-9ada-50b625d8085d	b0359eee-d801-4fed-977d-4dcb230c9a4c	Shaymin	https://res.cloudinary.com/dxt6txp6k/image/upload/v1751190751/pokemon_shaymin_usxecj.png	453	99
b8fc005a-af09-4da7-8104-d32bc77c49cb	b0359eee-d801-4fed-977d-4dcb230c9a4c	Shuppet	https://res.cloudinary.com/dxt6txp6k/image/upload/v1751190752/pokemon_shuppet_vcstb4.png	227	224
6a27b6c9-331c-4786-b702-21c7bc162246	b0359eee-d801-4fed-977d-4dcb230c9a4c	Slowpoke	https://res.cloudinary.com/dxt6txp6k/image/upload/v1751190753/pokemon_slowpoke_fjuudh.png	659	861
9db99490-877c-422a-9f37-85c05c728b9d	b0359eee-d801-4fed-977d-4dcb230c9a4c	Smoochum	https://res.cloudinary.com/dxt6txp6k/image/upload/v1751190754/pokemon_smoochum_jqcmkf.png	482	507
55137ad2-ba6e-42fc-ba8a-d711ba6d7db4	b0359eee-d801-4fed-977d-4dcb230c9a4c	Sneasel	https://res.cloudinary.com/dxt6txp6k/image/upload/v1751190755/pokemon_sneasel_savir3.png	473	717
9bed550c-a4fb-4128-8e2f-c3afd02f8711	b0359eee-d801-4fed-977d-4dcb230c9a4c	Typhlosion	https://res.cloudinary.com/dxt6txp6k/image/upload/v1751190757/pokemon_typhlosion_ironti.png	592	256
3bd53492-0b3f-4efe-8672-f11e92e1f0f1	b0359eee-d801-4fed-977d-4dcb230c9a4c	Vanillish	https://res.cloudinary.com/dxt6txp6k/image/upload/v1751190758/pokemon_vanillish_rhxlgw.png	232	160
43029ee5-e6ea-46e1-b33e-29ec35b97b8c	b0359eee-d801-4fed-977d-4dcb230c9a4c	Wartortle	https://res.cloudinary.com/dxt6txp6k/image/upload/v1751190759/pokemon_wartortle_fahifw.png	222	805
3c68bb63-3aa8-42e3-8f8e-10054734cf10	b0359eee-d801-4fed-977d-4dcb230c9a4c	Whiscash	https://res.cloudinary.com/dxt6txp6k/image/upload/v1751190761/pokemon_whiscash_hnlq8g.png	193	296
f20c9f4a-361d-40db-9c92-89eec15476c1	b0359eee-d801-4fed-977d-4dcb230c9a4c	Wooper	https://res.cloudinary.com/dxt6txp6k/image/upload/v1751190762/pokemon_wooper_ayarpb.png	257	897
045f4450-a95e-4e03-adfb-3521176a05b3	b0359eee-d801-4fed-977d-4dcb230c9a4c	Wynaut	https://res.cloudinary.com/dxt6txp6k/image/upload/v1751190763/pokemon_wynaut_g2plxe.png	628	636
476856fa-cc52-4989-9d9a-fee8f64b6048	b0359eee-d801-4fed-977d-4dcb230c9a4c	Xerneas	https://res.cloudinary.com/dxt6txp6k/image/upload/v1751190765/pokemon_xerneas_ibdgxm.png	285	41
feaa5a1c-b6b6-4de1-b8b7-93bf65b1cf33	b0359eee-d801-4fed-977d-4dcb230c9a4c	Yanmega	https://res.cloudinary.com/dxt6txp6k/image/upload/v1751190766/pokemon_yanmega_h2lb7q.png	83	236
\.


--
-- Data for Name: GameSession; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public."GameSession" (id, "mapId", "playerId", "playerName", "startTime", "endTime", "durationSeconds", "assignedFindables", "foundFindables", completed) FROM stdin;
\.


--
-- Data for Name: Map; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public."Map" (id, name, slug, "imageUrl", "thumbnailUrl", "imageCreator") FROM stdin;
ba96ebb4-dbe5-4980-b77a-8c3c7b71ae06	Smash Bros.	smash	https://res.cloudinary.com/dxt6txp6k/image/upload/v1750102044/map1_smash_eohquf.png	https://res.cloudinary.com/dxt6txp6k/image/upload/v1750200209/map_smash_thumbnail_ufarp2.png	Nintendo
b0359eee-d801-4fed-977d-4dcb230c9a4c	Pokémon	pokemon	https://res.cloudinary.com/dxt6txp6k/image/upload/v1750101947/map2_pokemon_z2n7st.png	https://res.cloudinary.com/dxt6txp6k/image/upload/v1750200192/map_pokemon_thumbnail_vhox60.png	GreatMik
\.


--
-- Name: Findable Findable_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public."Findable"
    ADD CONSTRAINT "Findable_pkey" PRIMARY KEY (id);


--
-- Name: GameSession GameSession_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public."GameSession"
    ADD CONSTRAINT "GameSession_pkey" PRIMARY KEY (id);


--
-- Name: Map Map_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public."Map"
    ADD CONSTRAINT "Map_pkey" PRIMARY KEY (id);


--
-- Name: Map_slug_key; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE UNIQUE INDEX "Map_slug_key" ON public."Map" USING btree (slug);


--
-- Name: Findable Findable_mapId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public."Findable"
    ADD CONSTRAINT "Findable_mapId_fkey" FOREIGN KEY ("mapId") REFERENCES public."Map"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: GameSession GameSession_mapId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public."GameSession"
    ADD CONSTRAINT "GameSession_mapId_fkey" FOREIGN KEY ("mapId") REFERENCES public."Map"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: public; Owner: cloud_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE cloud_admin IN SCHEMA public GRANT ALL ON SEQUENCES TO neon_superuser WITH GRANT OPTION;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: public; Owner: cloud_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE cloud_admin IN SCHEMA public GRANT ALL ON TABLES TO neon_superuser WITH GRANT OPTION;


--
-- PostgreSQL database dump complete
--

