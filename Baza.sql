/*
 Navicat Premium Data Transfer

 Source Server         : postgresql
 Source Server Type    : PostgreSQL
 Source Server Version : 120002
 Source Host           : localhost:5432
 Source Catalog        : predmeti
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 120002
 File Encoding         : 65001

 Date: 12/07/2020 01:24:01
*/


-- ----------------------------
-- Sequence structure for cached_subjects_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."cached_subjects_id_seq";
CREATE SEQUENCE "public"."cached_subjects_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for newsSources_internal_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."newsSources_internal_id_seq";
CREATE SEQUENCE "public"."newsSources_internal_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 32767
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for redired_table_uid_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."redired_table_uid_seq";
CREATE SEQUENCE "public"."redired_table_uid_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for sections_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."sections_id_seq";
CREATE SEQUENCE "public"."sections_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for subject_posts_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."subject_posts_id_seq";
CREATE SEQUENCE "public"."subject_posts_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Table structure for cached_subjects
-- ----------------------------
DROP TABLE IF EXISTS "public"."cached_subjects";
CREATE TABLE "public"."cached_subjects" (
  "id" int4 NOT NULL DEFAULT nextval('cached_subjects_id_seq'::regclass),
  "courseID" varchar(5) COLLATE "pg_catalog"."default" NOT NULL,
  "cachedCourse" text COLLATE "pg_catalog"."default" NOT NULL,
  "timestamp" int8 NOT NULL
)
;
COMMENT ON COLUMN "public"."cached_subjects"."courseID" IS 'The cached course ID';
COMMENT ON COLUMN "public"."cached_subjects"."cachedCourse" IS 'List of cached Subjects';
COMMENT ON COLUMN "public"."cached_subjects"."timestamp" IS 'Timestamp of caching, max cache date is 1 day';

-- ----------------------------
-- Records of cached_subjects
-- ----------------------------
INSERT INTO "public"."cached_subjects" VALUES (3, '117', '[{"courseName":"Praktična istraživanja i poslovne veštine","obavestenja":"5826","rezultati":"5827","kol1Pre":"5829","kol2Pre":"5835","ispitPre":"5837","dmPre":"5838","kol1Vez":"5839","kol2Vez":"5840","ispitVez":"5841","dmVez":"5842","title":["Profesor: Lazar Dražeta"]},{"courseName":"Distribuirani računarski sistemi","obavestenja":"6888","rezultati":"6889","kol1Pre":"6891","kol2Pre":"6892","ispitPre":"6893","dmPre":"6894","kol1Vez":"6895","kol2Vez":"6896","ispitVez":"6897","dmVez":"6898","title":["Profesor: Nebojša Bačanin Džakula","Asistent: Ivana Štrumberger"]},{"courseName":"Elektronsko poslovanje - BG","obavestenja":"6796","rezultati":"6797","kol1Pre":"6799","kol2Pre":"6800","ispitPre":"6801","dmPre":"6802","kol1Vez":"0","kol2Vez":"0","ispitVez":"6805","dmVez":"0","title":["Profesor: Dalibor Radovanović","Asistent: Miloš Mravik"]},{"courseName":"Poslovna analitika i izveštavanje","obavestenja":"6696","rezultati":"6697","kol1Pre":"6699","kol2Pre":"6700","ispitPre":"6701","dmPre":"6702","kol1Vez":"6703","kol2Vez":"6704","ispitVez":"6705","dmVez":"6706","title":["Profesor: Nemanja Stanišić"]},{"courseName":"Zaštita u računarskim mrežama","obavestenja":"5529","rezultati":"5530","kol1Pre":"5532","kol2Pre":"5533","ispitPre":"5534","dmPre":"5535","kol1Vez":"5536","kol2Vez":"5537","ispitVez":"5538","dmVez":"5539","title":["Profesor: Александар Јевремовић","Asistent: Милош Антонијевић"]},{"courseName":"Upravljanje ljudskim resursima","obavestenja":"2004","rezultati":"2005","kol1Pre":"2007","kol2Pre":"2008","ispitPre":"2009","dmPre":"2010","kol1Vez":"2011","kol2Vez":"2012","ispitVez":"2013","dmVez":"2014","title":["Profesor: Marina Savković"]},{"courseName":"Menadžment prodaje","obavestenja":"1552","rezultati":"1553","kol1Pre":"1555","kol2Pre":"1556","ispitPre":"1557","dmPre":"1558","kol1Vez":"1559","kol2Vez":"1560","ispitVez":"1561","dmVez":"1562","title":["Profesor: Ivana Brdar"]},{"courseName":"Društveno računarstvo","obavestenja":"6528","rezultati":"6529","kol1Pre":"6531","kol2Pre":"6532","ispitPre":"6533","dmPre":"6534","kol1Vez":"6535","kol2Vez":"6536","ispitVez":"6537","dmVez":"6538","title":["Profesor: Mlađan Jovanović"]},{"courseName":"Sistemi za podršku odlučivanju","obavestenja":"5655","rezultati":"5656","kol1Pre":"5658","kol2Pre":"5659","ispitPre":"5660","dmPre":"5661","kol1Vez":"5662","kol2Vez":"5663","ispitVez":"5664","dmVez":"5665","title":["Profesor: Vladislav Miškovic"]}]', 1592070272);
INSERT INTO "public"."cached_subjects" VALUES (7, '15', '[{"courseName":"Srpski jezik","obavestenja":"872","rezultati":"873","kol1Pre":"875","kol2Pre":"876","ispitPre":"877","dmPre":"878","kol1Vez":"879","kol2Vez":"880","ispitVez":"881","dmVez":"882","title":["Profesor: Mirjana Stakić-Savković"]},{"courseName":"Savremeni engleski jezik 1","obavestenja":"856","rezultati":"857","kol1Pre":"859","kol2Pre":"860","ispitPre":"861","dmPre":"862","kol1Vez":"863","kol2Vez":"864","ispitVez":"865","dmVez":"866","title":["Profesor: Pavle Pavlović","Profesor: Jasna Petrović","Asistent: Jovana Bošković","Asistent: Lucas Deighton Chrisostomides","Asistent: Valentina Gavranović"]},{"courseName":"Osnove informatike","obavestenja":"810","rezultati":"811","kol1Pre":"0","kol2Pre":"0","ispitPre":"815","dmPre":"0","kol1Vez":"817","kol2Vez":"818","ispitVez":"0","dmVez":"820","title":["Profesor: Dragan Cvetković","Asistent: Miloš Mravik"]},{"courseName":"Morfologija engleskog jezika","obavestenja":"717","rezultati":"718","kol1Pre":"720","kol2Pre":"721","ispitPre":"723","dmPre":"724","kol1Vez":"725","kol2Vez":"726","ispitVez":"727","dmVez":"728","title":["Profesor: Marijana Prodanović"]},{"courseName":"Fonetika i fonologija engleskog jezika","obavestenja":"670","rezultati":"671","kol1Pre":"673","kol2Pre":"674","ispitPre":"675","dmPre":"676","kol1Vez":"677","kol2Vez":"678","ispitVez":"679","dmVez":"680","title":["Profesor: Marijana Prodanović"]},{"courseName":"Drama, film i knjizevnost 1","obavestenja":"654","rezultati":"655","kol1Pre":"657","kol2Pre":"658","ispitPre":"659","dmPre":"660","kol1Vez":"661","kol2Vez":"662","ispitVez":"663","dmVez":"664","title":["Profesor: Ivana Đerić","Profesor: Mirjana Stakić-Savković"]},{"courseName":"Anglofone studije 1","obavestenja":"624","rezultati":"625","kol1Pre":"627","kol2Pre":"628","ispitPre":"629","dmPre":"630","kol1Vez":"631","kol2Vez":"632","ispitVez":"633","dmVez":"634","title":["Profesor: Pavle Pavlović","Asistent: Nina Pantelić"]},{"courseName":"Savremeni engleski jezik 2","obavestenja":"548","rezultati":"549","kol1Pre":"551","kol2Pre":"552","ispitPre":"553","dmPre":"554","kol1Vez":"555","kol2Vez":"556","ispitVez":"557","dmVez":"558","title":["Profesor: Tijana Gajić","Profesor: Nina Pantelić","Profesor: Pavle Pavlović","Asistent: Lucas Deighton Chrisostomides","Asistent: Valentina Gavranović"]}]', 1592449792);
INSERT INTO "public"."cached_subjects" VALUES (2, '39', '[{"courseName":"Praktikum - Internet i veb tehnologije","subjectID":"454","obavestenja":"5955","rezultati":"5956","kol1Pre":"5958","kol2Pre":"5964","ispitPre":"5966","dmPre":"5967","kol1Vez":"5968","kol2Vez":"5969","ispitVez":"5970","dmVez":"5972","title":["Profesor: Vladislav Miškovic","Milantex or not: Petar Jakić","Milantex or not: Milan Tair"]},{"courseName":"Praktikum - Zaštita u informacionim sistemima","subjectID":"465","obavestenja":"6125","rezultati":"6126","kol1Pre":"6128","kol2Pre":"6129","ispitPre":"6130","dmPre":"6131","kol1Vez":"6132","kol2Vez":"6133","ispitVez":"6134","dmVez":"6135","title":["Profesor: Saša Adamović"]},{"courseName":"Testiranje softvera","subjectID":"441","obavestenja":"5797","rezultati":"5798","kol1Pre":"5800","kol2Pre":"5801","ispitPre":"5802","dmPre":"5803","kol1Vez":"5804","kol2Vez":"5805","ispitVez":"5806","dmVez":"5807","title":["Profesor: Miodrag Živković","Milantex: Milan Tair"]},{"courseName":"Razvoj mobilnih aplikacija","subjectID":"436","obavestenja":"5738","rezultati":"5739","kol1Pre":"5741","kol2Pre":"5742","ispitPre":"5743","dmPre":"5744","kol1Vez":"5745","kol2Vez":"5746","ispitVez":"5747","dmVez":"5748","title":["Profesor: Miodrag Živković","Asistent: Uroš Arnaut"]},{"courseName":"Veštačka inteligencija","subjectID":"475","obavestenja":"6256","rezultati":"6258","kol1Pre":"6262","kol2Pre":"6265","ispitPre":"6267","dmPre":"6268","kol1Vez":"6269","kol2Vez":"6270","ispitVez":"6271","dmVez":"6275","title":["Profesor: Milan Milosavljević"]},{"courseName":"Kriptoanaliza i bezedno programiranje","subjectID":"998","obavestenja":"13351","rezultati":"13352","kol1Pre":"13354","kol2Pre":"13355","ispitPre":"13356","dmPre":"13357","kol1Vez":"13358","kol2Vez":"13359","ispitVez":"13360","dmVez":"13361","title":["Profesor: Saša Adamović"]},{"courseName":"Upravljanje rizicima u sajber prostoru","subjectID":"1073","obavestenja":"14502","rezultati":"14503","kol1Pre":"14505","kol2Pre":"14506","ispitPre":"14507","dmPre":"14508","kol1Vez":"14509","kol2Vez":"14510","ispitVez":"14511","dmVez":"14512","title":["Profesor: Goran Kunjadić"]},{"courseName":"Zaštita na vebu","subjectID":"996","obavestenja":"13335","rezultati":"13336","kol1Pre":"13338","kol2Pre":"13339","ispitPre":"13340","dmPre":"13341","kol1Vez":"13342","kol2Vez":"13343","ispitVez":"13344","dmVez":"13345","title":["Profesor: Александар Јевремовић","Asistent: Милош Антонијевић"]},{"courseName":"Interakcija čovek računar","subjectID":"452","obavestenja":"5899","rezultati":"5900","kol1Pre":"5902","kol2Pre":"5903","ispitPre":"5904","dmPre":"5905","kol1Vez":"5906","kol2Vez":"5907","ispitVez":"5908","dmVez":"5909","title":["Profesor: Mlađan Jovanović","Asistent: Nikola Savanović"]},{"courseName":"Praktična istraživanja i poslovne veštine","subjectID":"445","obavestenja":"5826","rezultati":"5827","kol1Pre":"5829","kol2Pre":"5835","ispitPre":"5837","dmPre":"5838","kol1Vez":"5839","kol2Vez":"5840","ispitVez":"5841","dmVez":"5842","title":["Profesor: Lazar Dražeta"]},{"courseName":"Zaštita u računarskim mrežama","subjectID":"3","obavestenja":"5529","rezultati":"5530","kol1Pre":"5532","kol2Pre":"5533","ispitPre":"5534","dmPre":"5535","kol1Vez":"5536","kol2Vez":"5537","ispitVez":"5538","dmVez":"5539","title":["Profesor: Александар Јевремовић","Asistent: Милош Антонијевић"]}]', 1593304832);
INSERT INTO "public"."cached_subjects" VALUES (8, '27', '[{"courseName":"Poslovno komuniciranje","obavestenja":"1277","rezultati":"1278","kol1Pre":"1280","kol2Pre":"1281","ispitPre":"1282","dmPre":"1283","kol1Vez":"1284","kol2Vez":"1285","ispitVez":"1286","dmVez":"1287","title":["Profesor: Gordana Dobrijević"]},{"courseName":"Strategijski Menadzment","obavestenja":"1754","rezultati":"1755","kol1Pre":"1757","kol2Pre":"1758","ispitPre":"1759","dmPre":"1760","kol1Vez":"1761","kol2Vez":"1762","ispitVez":"1763","dmVez":"1764","title":["Profesor: Miloš Petković"]},{"courseName":"Liderstvo","obavestenja":"2215","rezultati":"2216","kol1Pre":"2218","kol2Pre":"2219","ispitPre":"2220","dmPre":"2221","kol1Vez":"2222","kol2Vez":"2223","ispitVez":"2224","dmVez":"2225","title":["Profesor: Ana Radulović"]},{"courseName":"Pregovaranje i upravljanje konfliktima","obavestenja":"1277","rezultati":"1278","kol1Pre":"1280","kol2Pre":"1281","ispitPre":"1282","dmPre":"1283","kol1Vez":"1284","kol2Vez":"1285","ispitVez":"1286","dmVez":"1287","title":["Profesor: Gordana Dobrijević"]},{"courseName":"Razvoj zaposlenih","obavestenja":"2167","rezultati":"2168","kol1Pre":"2170","kol2Pre":"2171","ispitPre":"2172","dmPre":"2173","kol1Vez":"2174","kol2Vez":"2175","ispitVez":"2176","dmVez":"2177","title":["Profesor: Lazar Dražeta","Profesor: Miloš Petković"]},{"courseName":"Upravljanje znanjem","obavestenja":"2151","rezultati":"2152","kol1Pre":"2154","kol2Pre":"2155","ispitPre":"2156","dmPre":"2157","kol1Vez":"2158","kol2Vez":"2159","ispitVez":"2160","dmVez":"2161","title":["Profesor: Miloš Petković","Asistent: Ana Radulović"]},{"courseName":"Socijalna psihologija","obavestenja":"2136","rezultati":"2137","kol1Pre":"2139","kol2Pre":"2140","ispitPre":"2141","dmPre":"2142","kol1Vez":"2143","kol2Vez":"2144","ispitVez":"2145","dmVez":"2146","title":["Profesor: Milica Čolović"]},{"courseName":"Krizni menadžment","obavestenja":"2106","rezultati":"2107","kol1Pre":"2109","kol2Pre":"2110","ispitPre":"2111","dmPre":"2112","kol1Vez":"2113","kol2Vez":"2114","ispitVez":"2115","dmVez":"2116","title":["Profesor: Slavko Alčaković"]}]', 1592529536);
INSERT INTO "public"."cached_subjects" VALUES (9, '57', '[{"courseName":"Sistemi za podršku odlučivanju","obavestenja":"5655","rezultati":"5656","kol1Pre":"5658","kol2Pre":"5659","ispitPre":"5660","dmPre":"5661","kol1Vez":"5662","kol2Vez":"5663","ispitVez":"5664","dmVez":"5665","title":["Profesor: Vladislav Miškovic"]},{"courseName":"NoSQL baze","obavestenja":"14156","rezultati":"14157","kol1Pre":"14159","kol2Pre":"14160","ispitPre":"14161","dmPre":"14162","kol1Vez":"14163","kol2Vez":"14164","ispitVez":"14165","dmVez":"14166","title":["Profesor: Branko Perišić","Asistent: Petar Jakić"]},{"courseName":"Internet i veb programiranje","obavestenja":"5955","rezultati":"5956","kol1Pre":"5958","kol2Pre":"5964","ispitPre":"5966","dmPre":"5967","kol1Vez":"5968","kol2Vez":"5969","ispitVez":"5970","dmVez":"5972","title":["Profesor: Vladislav Miškovic","Milantex: Milan Tair"]},{"courseName":"Projektovanje softvera","obavestenja":"5598","rezultati":"5599","kol1Pre":"5601","kol2Pre":"5602","ispitPre":"5603","dmPre":"5604","kol1Vez":"5605","kol2Vez":"5606","ispitVez":"5607","dmVez":"5608","title":["Profesor: Violeta Tomašević","Asistent: Petar Jakić"]},{"courseName":"Sistemi za rad u realnom vremenu","obavestenja":"14355","rezultati":"14356","kol1Pre":"14358","kol2Pre":"14359","ispitPre":"14360","dmPre":"14361","kol1Vez":"14362","kol2Vez":"14363","ispitVez":"14364","dmVez":"14365","title":["Profesor: Marko Tanasković"]},{"courseName":"Internet stvari","obavestenja":"14400","rezultati":"14401","kol1Pre":"14403","kol2Pre":"14404","ispitPre":"14405","dmPre":"14406","kol1Vez":"14407","kol2Vez":"14408","ispitVez":"14409","dmVez":"14410","title":["Profesor: Marko Tanasković"]},{"courseName":"Interakcija čovek računar","obavestenja":"6558","rezultati":"6559","kol1Pre":"6561","kol2Pre":"6562","ispitPre":"6563","dmPre":"6564","kol1Vez":"6565","kol2Vez":"6566","ispitVez":"6567","dmVez":"6568","title":["Profesor: Mlađan Jovanović","Asistent: Nikola Savanović"]},{"courseName":"Praktična istraživanja i poslovne veštine","obavestenja":"5826","rezultati":"5827","kol1Pre":"5829","kol2Pre":"5835","ispitPre":"5837","dmPre":"5838","kol1Vez":"5839","kol2Vez":"5840","ispitVez":"5841","dmVez":"5842","title":["Profesor: Lazar Dražeta"]}]', 1592579584);
INSERT INTO "public"."cached_subjects" VALUES (6, '14', '[{"courseName":"Kvantitativne metode","obavestenja":"502","rezultati":"503","kol1Pre":"505","kol2Pre":"506","ispitPre":"508","dmPre":"509","kol1Vez":"510","kol2Vez":"511","ispitVez":"512","dmVez":"513","title":["Profesor: Ana Simićević"]},{"courseName":"Ekonomija","obavestenja":"470","rezultati":"471","kol1Pre":"473","kol2Pre":"474","ispitPre":"475","dmPre":"476","kol1Vez":"477","kol2Vez":"478","ispitVez":"479","dmVez":"480","title":["Profesor: Sanja Filipović"]},{"courseName":"Osnovi računarske tehnike","obavestenja":"382","rezultati":"383","kol1Pre":"0","kol2Pre":"0","ispitPre":"387","dmPre":"402","kol1Vez":"403","kol2Vez":"404","ispitVez":"405","dmVez":"406","title":["Profesor: Dragan Cvetković","Asistent: Dušan Marković"]},{"courseName":"Pravo","obavestenja":"142","rezultati":"143","kol1Pre":"145","kol2Pre":"146","ispitPre":"147","dmPre":"148","kol1Vez":"149","kol2Vez":"150","ispitVez":"151","dmVez":"152","title":["Profesor: Marija Kostić"]},{"courseName":"Psihologija","obavestenja":"127","rezultati":"128","kol1Pre":"130","kol2Pre":"131","ispitPre":"132","dmPre":"133","kol1Vez":"134","kol2Vez":"135","ispitVez":"136","dmVez":"137","title":["Profesor: Milica Čolović"]},{"courseName":"Menadžment - PFB","obavestenja":"112","rezultati":"113","kol1Pre":"115","kol2Pre":"116","ispitPre":"117","dmPre":"118","kol1Vez":"119","kol2Vez":"120","ispitVez":"121","dmVez":"122","title":["Profesor: Vladimir Džamić"]},{"courseName":"Računovodstvo","obavestenja":"80","rezultati":"81","kol1Pre":"83","kol2Pre":"84","ispitPre":"85","dmPre":"86","kol1Vez":"87","kol2Vez":"88","ispitVez":"89","dmVez":"90","title":["Profesor: Goranka Knežević","Asistent: Maja Kljajić"]}]', 1592580224);
INSERT INTO "public"."cached_subjects" VALUES (10, '134', '[{"courseName":"Praktična istraživanja i poslovne veštine","obavestenja":"2275","rezultati":"2276","kol1Pre":"2278","kol2Pre":"2279","ispitPre":"2280","dmPre":"2281","kol1Vez":"2282","kol2Vez":"2283","ispitVez":"2284","dmVez":"2285","title":[]},{"courseName":"Monitoring životne sredine","obavestenja":"13122","rezultati":"13123","kol1Pre":"13125","kol2Pre":"13126","ispitPre":"13127","dmPre":"13128","kol1Vez":"13129","kol2Vez":"13130","ispitVez":"13131","dmVez":"13132","title":["Profesor: Mirjana Perišić"]},{"courseName":"Procena uticaja na životnu sredinu","obavestenja":"13107","rezultati":"13108","kol1Pre":"13110","kol2Pre":"13111","ispitPre":"13112","dmPre":"13113","kol1Vez":"13114","kol2Vez":"13115","ispitVez":"13116","dmVez":"13117","title":["Profesor: Mirjana Perišić"]},{"courseName":"Upravljanje ekoprojektima","obavestenja":"13092","rezultati":"13093","kol1Pre":"13095","kol2Pre":"13096","ispitPre":"13097","dmPre":"13098","kol1Vez":"13099","kol2Vez":"13100","ispitVez":"13101","dmVez":"13102","title":["Profesor: Jelena Milovanović"]},{"courseName":"Klimatske promene i međunarodni odnosi","obavestenja":"13077","rezultati":"13078","kol1Pre":"13080","kol2Pre":"13081","ispitPre":"13082","dmPre":"13083","kol1Vez":"13084","kol2Vez":"13085","ispitVez":"13086","dmVez":"13087","title":["Profesor: Vladimir Džamić","Profesor: Andreja Stojić"]},{"courseName":"Zagađenje i zaštita vazduha","obavestenja":"13048","rezultati":"13049","kol1Pre":"13051","kol2Pre":"13052","ispitPre":"13053","dmPre":"13054","kol1Vez":"13055","kol2Vez":"13056","ispitVez":"13057","dmVez":"13058","title":["Profesor: Andreja Stojić"]},{"courseName":"Održivi turizam","obavestenja":"4564","rezultati":"4565","kol1Pre":"4567","kol2Pre":"4568","ispitPre":"4569","dmPre":"4570","kol1Vez":"4571","kol2Vez":"4572","ispitVez":"4573","dmVez":"4574","title":["Profesor: Gordana Dražić"]}]', 1592581376);
INSERT INTO "public"."cached_subjects" VALUES (11, '79', '[{"courseName":"Računovodstvo PE","obavestenja":"1331","rezultati":"1332","kol1Pre":"1334","kol2Pre":"1335","ispitPre":"1336","dmPre":"1337","kol1Vez":"1338","kol2Vez":"1339","ispitVez":"1340","dmVez":"1341","title":["Profesor: Vule Mizdraković","Asistent: Maja Kljajić"]},{"courseName":"Psihologija","obavestenja":"1317","rezultati":"1318","kol1Pre":"1320","kol2Pre":"1321","ispitPre":"1322","dmPre":"1323","kol1Vez":"1324","kol2Vez":"1325","ispitVez":"1326","dmVez":"1327","title":["Profesor: Gordana Nikić"]},{"courseName":"Pravo","obavestenja":"1291","rezultati":"1290","kol1Pre":"1293","kol2Pre":"1294","ispitPre":"1296","dmPre":"1295","kol1Vez":"1297","kol2Vez":"1298","ispitVez":"1300","dmVez":"1299","title":["Profesor: Marija Kostić"]},{"courseName":"Osnovi računarske tehnike","obavestenja":"1303","rezultati":"1304","kol1Pre":"0","kol2Pre":"0","ispitPre":"1308","dmPre":"1309","kol1Vez":"1310","kol2Vez":"1311","ispitVez":"0","dmVez":"0","title":["Profesor: Miloš Stojmenović","Asistent: Nebojša Nešić"]},{"courseName":"Menadžment","obavestenja":"1260","rezultati":"1261","kol1Pre":"1263","kol2Pre":"1264","ispitPre":"1265","dmPre":"1266","kol1Vez":"1267","kol2Vez":"1268","ispitVez":"1269","dmVez":"1270","title":["Profesor: Gordana Dobrijević","Asistent: Ana Radulović"]},{"courseName":"Kvantitativne metode","obavestenja":"1231","rezultati":"1232","kol1Pre":"1234","kol2Pre":"1235","ispitPre":"1236","dmPre":"1237","kol1Vez":"1238","kol2Vez":"1239","ispitVez":"1240","dmVez":"1241","title":["Profesor: Biljana Radičić"]},{"courseName":"Ekonomija","obavestenja":"1202","rezultati":"1203","kol1Pre":"1205","kol2Pre":"1206","ispitPre":"1207","dmPre":"1208","kol1Vez":"1209","kol2Vez":"1210","ispitVez":"1211","dmVez":"1212","title":["Profesor: Sanja Filipović","Asistent: Andy-Amanda Ivanković"]}]', 1592705920);
INSERT INTO "public"."cached_subjects" VALUES (12, '33', '[{"courseName":"Osnove programiranja","obavestenja":"11981","rezultati":"11982","kol1Pre":"11984","kol2Pre":"11985","ispitPre":"11986","dmPre":"11987","kol1Vez":"0","kol2Vez":"11989","ispitVez":"11990","dmVez":"0","title":["Profesor: Vladislav Miškovic","Asistent: Miloš Mravik"]},{"courseName":"Osnove informacionih tehnologija","obavestenja":"2289","rezultati":"2290","kol1Pre":"2292","kol2Pre":"2293","ispitPre":"2294","dmPre":"2295","kol1Vez":"2296","kol2Vez":"2297","ispitVez":"2298","dmVez":"2299","title":["Profesor: Miloš Stojmenović","Asistent: Dušan Marković"]},{"courseName":"Matematika","obavestenja":"2076","rezultati":"2077","kol1Pre":"2079","kol2Pre":"2080","ispitPre":"2081","dmPre":"2083","kol1Vez":"2084","kol2Vez":"2085","ispitVez":"2086","dmVez":"2087","title":["Profesor: Biljana Radičić","Asistent: Jelena Gavrilović"]},{"courseName":"Statistika","obavestenja":"2047","rezultati":"2048","kol1Pre":"2050","kol2Pre":"2051","ispitPre":"2052","dmPre":"2053","kol1Vez":"2054","kol2Vez":"2055","ispitVez":"2056","dmVez":"2057","title":["Profesor: Slađana Spasić"]},{"courseName":"Osnove ekonomije","obavestenja":"2232","rezultati":"2233","kol1Pre":"2235","kol2Pre":"2236","ispitPre":"2237","dmPre":"2238","kol1Vez":"2239","kol2Vez":"2240","ispitVez":"2241","dmVez":"2242","title":["Profesor: Dragiša Veličković"]},{"courseName":"Menadžment","obavestenja":"9777","rezultati":"9778","kol1Pre":"9780","kol2Pre":"9781","ispitPre":"9782","dmPre":"9783","kol1Vez":"9784","kol2Vez":"9785","ispitVez":"9786","dmVez":"9787","title":["Profesor: Gordana Dobrijević","Asistent: Timea Bezdan","Asistent: Ana Radulović"]},{"courseName":"Psihologija","obavestenja":"2031","rezultati":"2032","kol1Pre":"2034","kol2Pre":"2035","ispitPre":"2036","dmPre":"2037","kol1Vez":"2038","kol2Vez":"2039","ispitVez":"2040","dmVez":"2041","title":["Profesor: Milica Čolović"]}]', 1592706048);
INSERT INTO "public"."cached_subjects" VALUES (4, '137', '[{"courseName":"Introduction to machine learning","subjectID":"1011","obavestenja":"13548","rezultati":"13549","kol1Pre":"13551","kol2Pre":"13552","ispitPre":"13553","dmPre":"13554","kol1Vez":"13555","kol2Vez":"13556","ispitVez":"13557","dmVez":"13558","title":["Profesor: Marina Marjanović Jakovljević"]},{"courseName":"Electric measurments and instrumentation","subjectID":"1010","obavestenja":"13533","rezultati":"13534","kol1Pre":"13536","kol2Pre":"13537","ispitPre":"13538","dmPre":"13539","kol1Vez":"13540","kol2Vez":"13541","ispitVez":"13542","dmVez":"13543","title":["Profesor: Marko Tanasković","Asistent: Uroš Dragović"]},{"courseName":"Computer Graphics","subjectID":"1009","obavestenja":"13518","rezultati":"13519","kol1Pre":"13521","kol2Pre":"13522","ispitPre":"13523","dmPre":"13524","kol1Vez":"13525","kol2Vez":"13526","ispitVez":"13527","dmVez":"13528","title":["Profesor: Mlađan Jovanović","Asistent: Nikola Savanović"]},{"courseName":"No-relational database","subjectID":"1008","obavestenja":"13503","rezultati":"13504","kol1Pre":"13506","kol2Pre":"13507","ispitPre":"13508","dmPre":"13509","kol1Vez":"13510","kol2Vez":"13511","ispitVez":"13512","dmVez":"13513","title":["Profesor: Branko Perišić","Asistent: Ali Elsadai"]},{"courseName":"Cloud computing","subjectID":"1007","obavestenja":"13488","rezultati":"13489","kol1Pre":"13491","kol2Pre":"13492","ispitPre":"13493","dmPre":"13494","kol1Vez":"13495","kol2Vez":"13496","ispitVez":"13497","dmVez":"13498","title":["Profesor: Nebojša Bačanin Džakula","Asistent: Ivana Štrumberger"]},{"courseName":"Games design","subjectID":"1006","obavestenja":"13473","rezultati":"13474","kol1Pre":"13476","kol2Pre":"13477","ispitPre":"13478","dmPre":"13479","kol1Vez":"13480","kol2Vez":"13481","ispitVez":"13482","dmVez":"13483","title":["Profesor: Mlađan Jovanović"]},{"courseName":"Artificial inteligence","subjectID":"1005","obavestenja":"13458","rezultati":"13459","kol1Pre":"13461","kol2Pre":"13462","ispitPre":"13463","dmPre":"13464","kol1Vez":"13465","kol2Vez":"13466","ispitVez":"13467","dmVez":"13468","title":["Profesor: Milan Tuba"]},{"courseName":"Software testing and quality assurance","subjectID":"1004","obavestenja":"13443","rezultati":"13444","kol1Pre":"13446","kol2Pre":"13447","ispitPre":"13448","dmPre":"13449","kol1Vez":"13450","kol2Vez":"13451","ispitVez":"13452","dmVez":"13453","title":["Profesor: Miodrag Živković"]},{"courseName":"Internet technology and web services","subjectID":"1003","obavestenja":"13428","rezultati":"13429","kol1Pre":"13431","kol2Pre":"13432","ispitPre":"13433","dmPre":"13434","kol1Vez":"13435","kol2Vez":"13436","ispitVez":"13437","dmVez":"13438","title":["Profesor: Nebojša Bačanin Džakula","Asistent: Uroš Arnaut"]},{"courseName":"Applied probability and statistics","subjectID":"1002","obavestenja":"13413","rezultati":"13414","kol1Pre":"13416","kol2Pre":"13417","ispitPre":"13418","dmPre":"13419","kol1Vez":"13420","kol2Vez":"13421","ispitVez":"13422","dmVez":"13423","title":["Profesor: Miloš Stanković"]}]', 1593305088);
INSERT INTO "public"."cached_subjects" VALUES (1, '120', '[{"courseName":"Razvoj mobilnih aplikacija","subjectID":"436","obavestenja":"5738","rezultati":"5739","kol1Pre":"5741","kol2Pre":"5742","ispitPre":"5743","dmPre":"5744","kol1Vez":"5745","kol2Vez":"5746","ispitVez":"5747","dmVez":"5748","title":["Profesor: Miodrag Živković","Asistent: Uroš Arnaut"]},{"courseName":"Osnove digitalne forenzike","subjectID":"349","obavestenja":"4491","rezultati":"4492","kol1Pre":"4494","kol2Pre":"4495","ispitPre":"4496","dmPre":"4497","kol1Vez":"4498","kol2Vez":"4499","ispitVez":"4500","dmVez":"4501","title":["Profesor: Saša Adamović","Asistent: Jelena Gavrilović"]},{"courseName":"Upravljanje konfiguracijom softvera","subjectID":"826","obavestenja":"11802","rezultati":"11803","kol1Pre":"11805","kol2Pre":"11806","ispitPre":"11807","dmPre":"11808","kol1Vez":"11809","kol2Vez":"11810","ispitVez":"11811","dmVez":"11812","title":["Profesor: Branko Perišić"]},{"courseName":"Testiranje softvera i obezbeđenje kvaliteta","subjectID":"441","obavestenja":"5797","rezultati":"5798","kol1Pre":"5800","kol2Pre":"5801","ispitPre":"5802","dmPre":"5803","kol1Vez":"5804","kol2Vez":"5805","ispitVez":"5806","dmVez":"5807","title":["Profesor: Miodrag Živković","Milantex: Milan Tair"]},{"courseName":"Sistemi elektronskog plaćanja","subjectID":"825","obavestenja":"11816","rezultati":"11817","kol1Pre":"11819","kol2Pre":"11820","ispitPre":"11821","dmPre":"11822","kol1Vez":"11823","kol2Vez":"11824","ispitVez":"11825","dmVez":"11826","title":["Profesor: Vladislav Miškovic"]},{"courseName":"Klaud računarstvo","subjectID":"823","obavestenja":"11830","rezultati":"11831","kol1Pre":"11833","kol2Pre":"11834","ispitPre":"11835","dmPre":"11836","kol1Vez":"11837","kol2Vez":"11838","ispitVez":"11839","dmVez":"11840","title":["Profesor: Nebojša Bačanin Džakula","Asistent: Uroš Arnaut"]},{"courseName":"Kriptologija 1","subjectID":"235","obavestenja":"3054","rezultati":"3055","kol1Pre":"3057","kol2Pre":"3058","ispitPre":"3059","dmPre":"3060","kol1Vez":"3061","kol2Vez":"3062","ispitVez":"3063","dmVez":"3064","title":["Profesor: Mladen Veinović","Asistent: Dragomir Marjanović"]},{"courseName":"Veštačka inteligancija","subjectID":"475","obavestenja":"6256","rezultati":"6258","kol1Pre":"6262","kol2Pre":"6265","ispitPre":"6267","dmPre":"6268","kol1Vez":"6269","kol2Vez":"6270","ispitVez":"6271","dmVez":"6275","title":["Profesor: Milan Milosavljević"]},{"courseName":"Internet softverske arhitekture","subjectID":"820","obavestenja":"11872","rezultati":"11873","kol1Pre":"11875","kol2Pre":"11876","ispitPre":"11877","dmPre":"11878","kol1Vez":"11879","kol2Vez":"11880","ispitVez":"11881","dmVez":"11882","title":["Profesor: Nebojša Bačanin Džakula","Asistent: Uroš Arnaut"]},{"courseName":"Klijentske Web aplikacije","subjectID":"819","obavestenja":"11886","rezultati":"11887","kol1Pre":"11889","kol2Pre":"11890","ispitPre":"11891","dmPre":"11892","kol1Vez":"11893","kol2Vez":"11894","ispitVez":"11895","dmVez":"11896","title":["Profesor: Mlađan Jovanović","Asistent: Nikola Savanović"]},{"courseName":"Web bazirani informacioni sistemi","subjectID":"818","obavestenja":"11900","rezultati":"11901","kol1Pre":"11903","kol2Pre":"11904","ispitPre":"11905","dmPre":"11906","kol1Vez":"11907","kol2Vez":"11908","ispitVez":"11909","dmVez":"11910","title":["Profesor: Miloš Dobrojević"]},{"courseName":"Metodologija razvoja softvera","subjectID":"817","obavestenja":"11914","rezultati":"11915","kol1Pre":"11917","kol2Pre":"11918","ispitPre":"11919","dmPre":"11920","kol1Vez":"11921","kol2Vez":"11922","ispitVez":"11923","dmVez":"11924","title":["Profesor: Angelina Njeguš"]},{"courseName":"Verovatnoća i statistika","subjectID":"815","obavestenja":"11942","rezultati":"11943","kol1Pre":"11945","kol2Pre":"11946","ispitPre":"11947","dmPre":"11948","kol1Vez":"11949","kol2Vez":"11950","ispitVez":"11951","dmVez":"11952","title":["Profesor: Miloš Stanković"]}]', 1593428096);
INSERT INTO "public"."cached_subjects" VALUES (13, '49', '[{"courseName":"Digitalna obrada signala i slike","subjectID":"1070","obavestenja":"14430","rezultati":"14431","kol1Pre":"14433","kol2Pre":"14434","ispitPre":"14435","dmPre":"14436","kol1Vez":"14437","kol2Vez":"14438","ispitVez":"14439","dmVez":"14440","title":["Profesor: Marina Marjanović Jakovljević"]},{"courseName":"Društveno računarstvo","subjectID":"1069","obavestenja":"14415","rezultati":"14416","kol1Pre":"14418","kol2Pre":"14419","ispitPre":"14420","dmPre":"14421","kol1Vez":"14422","kol2Vez":"14423","ispitVez":"14424","dmVez":"14425","title":["Profesor: Mlađan Jovanović","Asistent: Nikola Savanović"]},{"courseName":"Internet stvari","subjectID":"1068","obavestenja":"14400","rezultati":"14401","kol1Pre":"14403","kol2Pre":"14404","ispitPre":"14405","dmPre":"14406","kol1Vez":"14407","kol2Vez":"14408","ispitVez":"14409","dmVez":"14410","title":["Profesor: Marko Tanasković","Asistent: Uroš Dragović"]},{"courseName":"Integracija softvera","subjectID":"1067","obavestenja":"14385","rezultati":"14386","kol1Pre":"14388","kol2Pre":"14389","ispitPre":"14390","dmPre":"14391","kol1Vez":"14392","kol2Vez":"14393","ispitVez":"14394","dmVez":"14395","title":["Profesor: Branko Perišić"]},{"courseName":"Praktikum - Sistemi ePoslovanja","subjectID":"454","obavestenja":"5955","rezultati":"5956","kol1Pre":"5958","kol2Pre":"5964","ispitPre":"5966","dmPre":"5967","kol1Vez":"5968","kol2Vez":"5969","ispitVez":"5970","dmVez":"5972","title":["Profesor: Vladislav Miškovic","Asistent: Petar Jakić"]},{"courseName":"Praktikum - Napredno softversko inženjerstvo","subjectID":"1063","obavestenja":"14325","rezultati":"14326","kol1Pre":"14328","kol2Pre":"14329","ispitPre":"14330","dmPre":"14331","kol1Vez":"14332","kol2Vez":"14333","ispitVez":"14334","dmVez":"14335","title":["Profesor: Angelina Njeguš"]},{"courseName":"Praktikum - Distribuirano računarstvo","subjectID":"1061","obavestenja":"14295","rezultati":"14296","kol1Pre":"14298","kol2Pre":"14299","ispitPre":"14300","dmPre":"14301","kol1Vez":"14302","kol2Vez":"14303","ispitVez":"14304","dmVez":"14305","title":[]},{"courseName":"Praktikum - Sajber bezbednost","subjectID":"465","obavestenja":"6125","rezultati":"6126","kol1Pre":"6128","kol2Pre":"6129","ispitPre":"6130","dmPre":"6131","kol1Vez":"6132","kol2Vez":"6133","ispitVez":"6134","dmVez":"6135","title":["Profesor: Saša Adamović"]},{"courseName":"Praktikum - Inteligentni softver","subjectID":"1059","obavestenja":"14265","rezultati":"14266","kol1Pre":"14268","kol2Pre":"14269","ispitPre":"14270","dmPre":"14271","kol1Vez":"14272","kol2Vez":"14273","ispitVez":"14274","dmVez":"14275","title":[]},{"courseName":"Sigurnost u računarskim mrežama","subjectID":"1066","obavestenja":"14370","rezultati":"14371","kol1Pre":"14373","kol2Pre":"14374","ispitPre":"14375","dmPre":"14376","kol1Vez":"14377","kol2Vez":"14378","ispitVez":"14379","dmVez":"14380","title":[]},{"courseName":"Sistemi za rad u realnom vremenu","subjectID":"1065","obavestenja":"14355","rezultati":"14356","kol1Pre":"14358","kol2Pre":"14359","ispitPre":"14360","dmPre":"14361","kol1Vez":"14362","kol2Vez":"14363","ispitVez":"14364","dmVez":"14365","title":["Profesor: Marko Tanasković","Asistent: Uroš Dragović"]},{"courseName":"Mašinsko učenje","subjectID":"1064","obavestenja":"14340","rezultati":"14341","kol1Pre":"14343","kol2Pre":"14344","ispitPre":"14345","dmPre":"14346","kol1Vez":"14347","kol2Vez":"14348","ispitVez":"14349","dmVez":"14350","title":["Profesor: Milan Milosavljević"]},{"courseName":"Upravljanje softverskim projektom","subjectID":"1058","obavestenja":"14250","rezultati":"14251","kol1Pre":"14253","kol2Pre":"14254","ispitPre":"14255","dmPre":"14256","kol1Vez":"14257","kol2Vez":"14258","ispitVez":"14259","dmVez":"14260","title":["Profesor: Branko Perišić"]},{"courseName":"Praktična istraživanja i poslovne veštine","subjectID":"445","obavestenja":"5826","rezultati":"5827","kol1Pre":"5829","kol2Pre":"5835","ispitPre":"5837","dmPre":"5838","kol1Vez":"5839","kol2Vez":"5840","ispitVez":"5841","dmVez":"5842","title":["Profesor: Lazar Dražeta"]},{"courseName":"Konkurentno i distribuirano programiranje","subjectID":"1057","obavestenja":"14232","rezultati":"14233","kol1Pre":"14235","kol2Pre":"14236","ispitPre":"14237","dmPre":"14238","kol1Vez":"14239","kol2Vez":"14240","ispitVez":"14241","dmVez":"14242","title":["Profesor: Nebojša Bačanin Džakula","Asistent: Ivana Štrumberger"]},{"courseName":"Upravljanje elektronskim dokumentima","subjectID":"1056","obavestenja":"14216","rezultati":"14217","kol1Pre":"14219","kol2Pre":"14220","ispitPre":"14221","dmPre":"14222","kol1Vez":"14223","kol2Vez":"14224","ispitVez":"14225","dmVez":"14226","title":[]},{"courseName":"Kriptologija 2","subjectID":"355","obavestenja":"4592","rezultati":"4593","kol1Pre":"4595","kol2Pre":"4596","ispitPre":"4597","dmPre":"4598","kol1Vez":"4599","kol2Vez":"4600","ispitVez":"4601","dmVez":"4602","title":["Profesor: Milan Milosavljević"]},{"courseName":"Analiza i istraživanje podataka","subjectID":"347","obavestenja":"11435","rezultati":"4475","kol1Pre":"4477","kol2Pre":"4478","ispitPre":"4479","dmPre":"4480","kol1Vez":"4481","kol2Vez":"4482","ispitVez":"4483","dmVez":"4484","title":["Profesor: Milan Milosavljević"]},{"courseName":"Sistemi za podršku odlučivanju","subjectID":"431","obavestenja":"5655","rezultati":"5656","kol1Pre":"5658","kol2Pre":"5659","ispitPre":"5660","dmPre":"5661","kol1Vez":"5662","kol2Vez":"5663","ispitVez":"5664","dmVez":"5665","title":["Profesor: Vladislav Miškovic"]},{"courseName":"NoSQL baze","subjectID":"1052","obavestenja":"14156","rezultati":"14157","kol1Pre":"14159","kol2Pre":"14160","ispitPre":"14161","dmPre":"14162","kol1Vez":"14163","kol2Vez":"14164","ispitVez":"14165","dmVez":"14166","title":["Profesor: Branko Perišić","Asistent: Petar Jakić"]},{"courseName":"Funkcionalno programiranje","subjectID":"1051","obavestenja":"14113","rezultati":"14114","kol1Pre":"14116","kol2Pre":"14117","ispitPre":"14118","dmPre":"14119","kol1Vez":"14120","kol2Vez":"14121","ispitVez":"14122","dmVez":"14123","title":["Profesor: Zora Konjović","Asistent: Petar Jakić"]},{"courseName":"Programabilni hardver i ugrađeni sistemi","subjectID":"1050","obavestenja":"14141","rezultati":"14142","kol1Pre":"14144","kol2Pre":"14145","ispitPre":"14146","dmPre":"14147","kol1Vez":"14148","kol2Vez":"14149","ispitVez":"14150","dmVez":"14151","title":["Profesor: Petar Spalević","Asistent: Petar Jakić"]},{"courseName":"Osnovi teorije informacija i kodovanja","subjectID":"229","obavestenja":"2976","rezultati":"2977","kol1Pre":"2979","kol2Pre":"2980","ispitPre":"2981","dmPre":"2982","kol1Vez":"2983","kol2Vez":"2984","ispitVez":"2985","dmVez":"2986","title":["Profesor: Milan Milosavljević","Asistent: Marina Marjanović Jakovljević"]},{"courseName":"Multimedijalni sistemi","subjectID":"1048","obavestenja":"14096","rezultati":"14097","kol1Pre":"14099","kol2Pre":"14100","ispitPre":"14101","dmPre":"14102","kol1Vez":"14103","kol2Vez":"14104","ispitVez":"14105","dmVez":"14106","title":["Profesor: Dragan Cvetković","Asistent: Nikola Savanović"]},{"courseName":"Interakcija čovek računar","subjectID":"1047","obavestenja":"14081","rezultati":"14082","kol1Pre":"14084","kol2Pre":"14085","ispitPre":"14086","dmPre":"14087","kol1Vez":"14088","kol2Vez":"14089","ispitVez":"14090","dmVez":"14091","title":["Profesor: Mlađan Jovanović","Asistent: Nikola Savanović"]}]', 1593440512);

-- ----------------------------
-- Table structure for courses
-- ----------------------------
DROP TABLE IF EXISTS "public"."courses";
CREATE TABLE "public"."courses" (
  "internal_id" int4 NOT NULL,
  "faculties_id" int4 NOT NULL,
  "years_id" int4 NOT NULL,
  "courses_id" int4 NOT NULL,
  "elementid" varchar(128) COLLATE "pg_catalog"."default" NOT NULL,
  "title" varchar(128) COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Records of courses
-- ----------------------------
INSERT INTO "public"."courses" VALUES (3, 2, 1, 9, 'type_category', '1 God');
INSERT INTO "public"."courses" VALUES (4, 3, 1, 34, 'expandable_branch_10_34', 'Informatika i računarstvo');
INSERT INTO "public"."courses" VALUES (5, 3, 1, 33, 'expandable_branch_10_33', 'Informacione tehnologije');
INSERT INTO "public"."courses" VALUES (6, 4, 1, 116, 'expandable_branch_10_116', 'Softversko i informaciono inženjerstvo');
INSERT INTO "public"."courses" VALUES (7, 4, 1, 50, 'expandable_branch_10_50', 'Software and Data Engineering');
INSERT INTO "public"."courses" VALUES (8, 5, 1, 63, 'expandable_branch_10_63', 'Fizičko vaspitanje i sport');
INSERT INTO "public"."courses" VALUES (9, 5, 1, 64, 'expandable_branch_10_64', 'Menadžment u sportu');
INSERT INTO "public"."courses" VALUES (10, 6, 1, 79, 'expandable_branch_10_79', 'Poslovna ekonomija');
INSERT INTO "public"."courses" VALUES (11, 6, 1, 83, 'expandable_branch_10_83', 'Turizam i hotelijerstvo');
INSERT INTO "public"."courses" VALUES (12, 6, 1, 91, 'expandable_branch_10_91', 'Informacione tehnologije');
INSERT INTO "public"."courses" VALUES (13, 6, 1, 94, 'expandable_branch_10_94', 'Softversko Informaciono Inženjerstvo');
INSERT INTO "public"."courses" VALUES (14, 7, 1, 102, 'expandable_branch_10_102', 'Poslovna ekonomija');
INSERT INTO "public"."courses" VALUES (15, 7, 1, 106, 'expandable_branch_10_106', 'Turizam i hotelijerstvo');
INSERT INTO "public"."courses" VALUES (16, 7, 1, 114, 'expandable_branch_10_114', 'Informacione tehnologije');
INSERT INTO "public"."courses" VALUES (17, 7, 1, 128, 'expandable_branch_10_128', 'Softversko Informaciono Inženjerstvo');
INSERT INTO "public"."courses" VALUES (18, 8, 1, 131, '131_tree_item', '1 God');
INSERT INTO "public"."courses" VALUES (19, 1, 2, 16, 'expandable_branch_10_16', 'Poslovna ekonomija');
INSERT INTO "public"."courses" VALUES (20, 1, 2, 17, 'expandable_branch_10_17', 'Anglistika');
INSERT INTO "public"."courses" VALUES (21, 2, 2, 10, 'type_category', '2 God');
INSERT INTO "public"."courses" VALUES (22, 3, 2, 36, 'expandable_branch_10_36', 'Informatika i računarstvo');
INSERT INTO "public"."courses" VALUES (23, 3, 2, 35, 'expandable_branch_10_35', 'Informacione tehnologije');
INSERT INTO "public"."courses" VALUES (24, 4, 2, 53, 'expandable_branch_10_53', 'Softversko i informaciono inženjerstvo');
INSERT INTO "public"."courses" VALUES (25, 4, 2, 123, 'expandable_branch_10_123', 'Software and Data Engineering');
INSERT INTO "public"."courses" VALUES (26, 5, 2, 65, 'expandable_branch_10_65', 'Fizičko vaspitanje i sport');
INSERT INTO "public"."courses" VALUES (27, 5, 2, 66, 'expandable_branch_10_66', 'Menadžment u sportu');
INSERT INTO "public"."courses" VALUES (28, 6, 2, 80, 'expandable_branch_10_80', 'Poslovna ekonomija');
INSERT INTO "public"."courses" VALUES (29, 6, 2, 84, 'expandable_branch_10_84', 'Turizam i hotelijerstvo');
INSERT INTO "public"."courses" VALUES (30, 6, 2, 92, 'expandable_branch_10_92', 'Informacione tehnologije');
INSERT INTO "public"."courses" VALUES (31, 6, 2, 95, 'expandable_branch_10_95', 'Softversko Informaciono Inženjerstvo');
INSERT INTO "public"."courses" VALUES (32, 7, 2, 103, 'expandable_branch_10_103', 'Poslovna ekonomija');
INSERT INTO "public"."courses" VALUES (33, 7, 2, 107, 'expandable_branch_10_107', 'Turizam i hotelijerstvo');
INSERT INTO "public"."courses" VALUES (34, 7, 2, 115, 'expandable_branch_10_115', 'Informacione tehnologije');
INSERT INTO "public"."courses" VALUES (35, 7, 2, 140, 'expandable_branch_10_140', 'Softversko Informaciono Inženjerstvo');
INSERT INTO "public"."courses" VALUES (36, 8, 2, 132, '132_tree_item', '2 God');
INSERT INTO "public"."courses" VALUES (37, 1, 3, 18, 'expandable_branch_10_18', 'Finansije i bankarstvo');
INSERT INTO "public"."courses" VALUES (38, 1, 3, 19, 'expandable_branch_10_19', 'Marketing i menadžment');
INSERT INTO "public"."courses" VALUES (39, 1, 3, 20, 'expandable_branch_10_20', 'Računovodstvo i revizija');
INSERT INTO "public"."courses" VALUES (40, 1, 3, 21, 'expandable_branch_10_21', 'Upravljanje ljudskim resursima');
INSERT INTO "public"."courses" VALUES (42, 2, 3, 11, 'type_category', '3 God');
INSERT INTO "public"."courses" VALUES (43, 3, 3, 38, 'expandable_branch_10_38', 'Informatika i računarstvo');
INSERT INTO "public"."courses" VALUES (44, 3, 3, 37, 'expandable_branch_10_37', 'Informacione tehnologije');
INSERT INTO "public"."courses" VALUES (45, 4, 3, 120, 'expandable_branch_10_120', 'Softversko i informaciono inženjerstvo');
INSERT INTO "public"."courses" VALUES (46, 4, 3, 137, 'expandable_branch_10_137', 'Software and Data Engineering');
INSERT INTO "public"."courses" VALUES (47, 5, 3, 67, 'expandable_branch_10_67', 'Fizičko vaspitanje i sport');
INSERT INTO "public"."courses" VALUES (48, 5, 3, 37, 'expandable_branch_10_68', 'Menadžment u sportu');
INSERT INTO "public"."courses" VALUES (49, 6, 3, 81, 'expandable_branch_10_81', 'Poslovna ekonomija');
INSERT INTO "public"."courses" VALUES (50, 6, 3, 85, 'expandable_branch_10_85', 'Turizam i hotelijerstvo');
INSERT INTO "public"."courses" VALUES (51, 6, 3, 89, 'expandable_branch_10_89', 'Informatika i računarstvo');
INSERT INTO "public"."courses" VALUES (52, 6, 3, 93, 'expandable_branch_10_93', 'Informacione tehnologije');
INSERT INTO "public"."courses" VALUES (53, 6, 3, 122, 'expandable_branch_10_122', 'Softversko Informaciono Inženjerstvo');
INSERT INTO "public"."courses" VALUES (54, 7, 3, 104, 'expandable_branch_10_104', 'Poslovna ekonomija');
INSERT INTO "public"."courses" VALUES (55, 7, 3, 108, 'expandable_branch_10_108', 'Turizam i hotelijerstvo');
INSERT INTO "public"."courses" VALUES (56, 7, 3, 119, 'expandable_branch_10_119', 'Informacione tehnologije');
INSERT INTO "public"."courses" VALUES (57, 8, 3, 133, '133_tree_item', '3 God');
INSERT INTO "public"."courses" VALUES (58, 1, 4, 24, 'expandable_branch_10_24', 'Finansije i bankarstvo');
INSERT INTO "public"."courses" VALUES (59, 1, 4, 25, 'expandable_branch_10_25', 'Marketing i menadžment');
INSERT INTO "public"."courses" VALUES (60, 1, 4, 26, 'expandable_branch_10_26', 'Računovodstvo i revizija');
INSERT INTO "public"."courses" VALUES (61, 1, 4, 27, 'expandable_branch_10_27', 'Upravljanje ljudskim resursima');
INSERT INTO "public"."courses" VALUES (62, 1, 4, 28, 'expandable_branch_10_28', 'Anglistika');
INSERT INTO "public"."courses" VALUES (63, 2, 4, 12, 'type_category', '4 God');
INSERT INTO "public"."courses" VALUES (64, 3, 4, 39, 'expandable_branch_10_39', 'Informatika i računarstvo');
INSERT INTO "public"."courses" VALUES (65, 3, 4, 117, 'expandable_branch_10_117', 'Informacione tehnologije');
INSERT INTO "public"."courses" VALUES (66, 4, 4, 49, 'expandable_branch_10_49', 'Softversko i informaciono inženjerstvo');
INSERT INTO "public"."courses" VALUES (67, 4, 4, 57, 'expandable_branch_10_57', 'Elektrotehnika i računarstvo');
INSERT INTO "public"."courses" VALUES (68, 5, 4, 69, 'expandable_branch_10_69', 'Fizičko vaspitanje i sport');
INSERT INTO "public"."courses" VALUES (69, 5, 4, 70, 'expandable_branch_10_70', 'Menadžment u sportu');
INSERT INTO "public"."courses" VALUES (70, 6, 4, 82, 'expandable_branch_10_82', 'Poslovna ekonomija');
INSERT INTO "public"."courses" VALUES (71, 6, 4, 86, 'expandable_branch_10_86', 'Turizam i hotelijerstvo');
INSERT INTO "public"."courses" VALUES (72, 6, 4, 90, 'expandable_branch_10_90', 'Informatika i računarstvo');
INSERT INTO "public"."courses" VALUES (73, 6, 4, 121, 'expandable_branch_10_121', 'Informacione tehnologije');
INSERT INTO "public"."courses" VALUES (74, 6, 4, 138, 'expandable_branch_10_138', 'Softversko Informaciono Inženjerstvo');
INSERT INTO "public"."courses" VALUES (75, 7, 4, 105, 'expandable_branch_10_105', 'Poslovna ekonomija');
INSERT INTO "public"."courses" VALUES (76, 7, 4, 109, 'expandable_branch_10_109', 'Turizam i hotelijerstvo');
INSERT INTO "public"."courses" VALUES (77, 7, 4, 113, 'expandable_branch_10_113', 'Elektrotehnika i računarstvo');
INSERT INTO "public"."courses" VALUES (78, 7, 4, 139, 'expandable_branch_10_139', 'Informacione tehnologije');
INSERT INTO "public"."courses" VALUES (79, 8, 4, 134, '134_tree_item', '4 God');
INSERT INTO "public"."courses" VALUES (41, 1, 3, 124, 'expandable_branch_10_124', 'Anglistika');
INSERT INTO "public"."courses" VALUES (1, 1, 1, 14, 'expandable_branch_10_14', 'Poslovna ekonomija');
INSERT INTO "public"."courses" VALUES (2, 1, 1, 15, 'expandable_branch_10_15', 'Anglistika');

-- ----------------------------
-- Table structure for faculties
-- ----------------------------
DROP TABLE IF EXISTS "public"."faculties";
CREATE TABLE "public"."faculties" (
  "internal_id" int4 NOT NULL,
  "id" varchar(32) COLLATE "pg_catalog"."default" NOT NULL,
  "title" varchar(128) COLLATE "pg_catalog"."default" NOT NULL,
  "exception" int4 NOT NULL
)
;

-- ----------------------------
-- Records of faculties
-- ----------------------------
INSERT INTO "public"."faculties" VALUES (1, 'poslovnibg', 'Poslovni Fakultet u Beogradu', 0);
INSERT INTO "public"."faculties" VALUES (2, 'turisticki', 'Fakultet za turistički i hotelijerski menadžment', 1);
INSERT INTO "public"."faculties" VALUES (3, 'informatika', 'Fakultet za informatiku i računarstvo', 0);
INSERT INTO "public"."faculties" VALUES (4, 'tehnicki', 'Tehnički fakultet', 0);
INSERT INTO "public"."faculties" VALUES (5, 'fizickomen', 'Fakultet za fizičku kulturu i menadžment u sportu', 0);
INSERT INTO "public"."faculties" VALUES (6, 'novisad', 'Centar Novi Sad', 0);
INSERT INTO "public"."faculties" VALUES (7, 'nis', 'Centar Niš', 0);
INSERT INTO "public"."faculties" VALUES (8, 'zivotna', 'Životna sredina i održivi razvoj', 1);

-- ----------------------------
-- Table structure for newsSources
-- ----------------------------
DROP TABLE IF EXISTS "public"."newsSources";
CREATE TABLE "public"."newsSources" (
  "faculty_id" int4 NOT NULL,
  "faculty_title" varchar(128) COLLATE "pg_catalog"."default" NOT NULL,
  "faculty_short" varchar(10) COLLATE "pg_catalog"."default" NOT NULL,
  "categories" varchar(10) COLLATE "pg_catalog"."default" NOT NULL,
  "text_background_hex" varchar(10) COLLATE "pg_catalog"."default" NOT NULL,
  "internal_id" int2 NOT NULL DEFAULT nextval('"newsSources_internal_id_seq"'::regclass)
)
;

-- ----------------------------
-- Records of newsSources
-- ----------------------------
INSERT INTO "public"."newsSources" VALUES (0, 'Univerzitet Singidunum', 'US', '3,4', 'A8011D', 1);
INSERT INTO "public"."newsSources" VALUES (1, 'Poslovni fakultet u Beogradu', 'PFB', '6,16,21', '010178', 2);
INSERT INTO "public"."newsSources" VALUES (2, 'Fakultet za turistički i hotelijerski menadžment', 'FTHM', '7,17,22', '008A94', 3);
INSERT INTO "public"."newsSources" VALUES (3, 'Fakultet za informatiku i računarstvo', 'FIR', '8,18,23,30', 'F15500', 4);
INSERT INTO "public"."newsSources" VALUES (4, 'Tehnički fakultet', 'TF', '9,19,24,31', '0F4405', 5);
INSERT INTO "public"."newsSources" VALUES (7, 'Fakultet za fizičku kulturu i menadžment u sportu', 'FFKMS', '46', 'FF911F', 6);

-- ----------------------------
-- Table structure for redirect_table
-- ----------------------------
DROP TABLE IF EXISTS "public"."redirect_table";
CREATE TABLE "public"."redirect_table" (
  "uid" int4 NOT NULL DEFAULT nextval('redired_table_uid_seq'::regclass),
  "id" varchar(32) COLLATE "pg_catalog"."default" NOT NULL,
  "actual_id" varchar(32) COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Records of redirect_table
-- ----------------------------
INSERT INTO "public"."redirect_table" VALUES (3, '87', '112');
INSERT INTO "public"."redirect_table" VALUES (4, '283', '283');
INSERT INTO "public"."redirect_table" VALUES (5, '295', '72');
INSERT INTO "public"."redirect_table" VALUES (6, '110', '27');
INSERT INTO "public"."redirect_table" VALUES (7, '1001', '1000');
INSERT INTO "public"."redirect_table" VALUES (8, '1053', '431');
INSERT INTO "public"."redirect_table" VALUES (9, '744', '192');
INSERT INTO "public"."redirect_table" VALUES (10, '623', '470');
INSERT INTO "public"."redirect_table" VALUES (11, '974', '353');
INSERT INTO "public"."redirect_table" VALUES (12, '699', '174');
INSERT INTO "public"."redirect_table" VALUES (13, '300', '88');
INSERT INTO "public"."redirect_table" VALUES (14, '619', '474');
INSERT INTO "public"."redirect_table" VALUES (15, '279', '279');
INSERT INTO "public"."redirect_table" VALUES (16, '417', '88');
INSERT INTO "public"."redirect_table" VALUES (17, '647', '491');
INSERT INTO "public"."redirect_table" VALUES (18, '24', '27');
INSERT INTO "public"."redirect_table" VALUES (19, '106', '32');
INSERT INTO "public"."redirect_table" VALUES (20, '768', '445');
INSERT INTO "public"."redirect_table" VALUES (21, '526', '445');
INSERT INTO "public"."redirect_table" VALUES (22, '163', '85');
INSERT INTO "public"."redirect_table" VALUES (23, '284', '284');
INSERT INTO "public"."redirect_table" VALUES (24, '908', '908');
INSERT INTO "public"."redirect_table" VALUES (25, '1054', '347');
INSERT INTO "public"."redirect_table" VALUES (26, '1030', '91');
INSERT INTO "public"."redirect_table" VALUES (27, '503', '1068');
INSERT INTO "public"."redirect_table" VALUES (28, '745', '195');
INSERT INTO "public"."redirect_table" VALUES (29, '624', '55');
INSERT INTO "public"."redirect_table" VALUES (30, '1039', '514');
INSERT INTO "public"."redirect_table" VALUES (31, '959', '55');
INSERT INTO "public"."redirect_table" VALUES (32, '135', '59');
INSERT INTO "public"."redirect_table" VALUES (33, '147', '147');
INSERT INTO "public"."redirect_table" VALUES (34, '769', '2');
INSERT INTO "public"."redirect_table" VALUES (35, '964', '34');
INSERT INTO "public"."redirect_table" VALUES (36, '710', '174');
INSERT INTO "public"."redirect_table" VALUES (37, '843', '134');
INSERT INTO "public"."redirect_table" VALUES (38, '100', '100');
INSERT INTO "public"."redirect_table" VALUES (39, '302', '83');
INSERT INTO "public"."redirect_table" VALUES (40, '867', '711');
INSERT INTO "public"."redirect_table" VALUES (41, '217', '216');
INSERT INTO "public"."redirect_table" VALUES (42, '94', '14');
INSERT INTO "public"."redirect_table" VALUES (43, '286', '134');
INSERT INTO "public"."redirect_table" VALUES (44, '670', '406');
INSERT INTO "public"."redirect_table" VALUES (45, '654', '514');
INSERT INTO "public"."redirect_table" VALUES (46, '787', '72');
INSERT INTO "public"."redirect_table" VALUES (47, '412', '103');
INSERT INTO "public"."redirect_table" VALUES (48, '630', '464');
INSERT INTO "public"."redirect_table" VALUES (49, '751', '216');
INSERT INTO "public"."redirect_table" VALUES (50, '1049', '229');
INSERT INTO "public"."redirect_table" VALUES (51, '177', '88');
INSERT INTO "public"."redirect_table" VALUES (52, '331', '428');
INSERT INTO "public"."redirect_table" VALUES (53, '828', '349');
INSERT INTO "public"."redirect_table" VALUES (54, '816', '441');
INSERT INTO "public"."redirect_table" VALUES (55, '125', '14');
INSERT INTO "public"."redirect_table" VALUES (56, '505', '3');
INSERT INTO "public"."redirect_table" VALUES (57, '327', '809');
INSERT INTO "public"."redirect_table" VALUES (58, '788', '91');
INSERT INTO "public"."redirect_table" VALUES (59, '700', '170');
INSERT INTO "public"."redirect_table" VALUES (60, '821', '475');
INSERT INTO "public"."redirect_table" VALUES (61, '752', '265');
INSERT INTO "public"."redirect_table" VALUES (62, '994', '1052');
INSERT INTO "public"."redirect_table" VALUES (63, '873', '149');
INSERT INTO "public"."redirect_table" VALUES (64, '695', '629');
INSERT INTO "public"."redirect_table" VALUES (65, '708', '27');
INSERT INTO "public"."redirect_table" VALUES (66, '16', '18');
INSERT INTO "public"."redirect_table" VALUES (67, '829', '436');
INSERT INTO "public"."redirect_table" VALUES (68, '627', '467');
INSERT INTO "public"."redirect_table" VALUES (69, '126', '126');
INSERT INTO "public"."redirect_table" VALUES (70, '138', '112');
INSERT INTO "public"."redirect_table" VALUES (71, '280', '280');
INSERT INTO "public"."redirect_table" VALUES (72, '1062', '454');
INSERT INTO "public"."redirect_table" VALUES (73, '547', '474');
INSERT INTO "public"."redirect_table" VALUES (74, '656', '359');
INSERT INTO "public"."redirect_table" VALUES (75, '995', '431');
INSERT INTO "public"."redirect_table" VALUES (76, '668', '403');
INSERT INTO "public"."redirect_table" VALUES (77, '753', '221');
INSERT INTO "public"."redirect_table" VALUES (78, '822', '235');
INSERT INTO "public"."redirect_table" VALUES (79, '523', '1065');
INSERT INTO "public"."redirect_table" VALUES (80, '599', '914');
INSERT INTO "public"."redirect_table" VALUES (81, '741', '834');
INSERT INTO "public"."redirect_table" VALUES (82, '620', '467');
INSERT INTO "public"."redirect_table" VALUES (83, '983', '170');
INSERT INTO "public"."redirect_table" VALUES (84, '276', '276');
INSERT INTO "public"."redirect_table" VALUES (85, '604', '468');
INSERT INTO "public"."redirect_table" VALUES (86, '160', '83');
INSERT INTO "public"."redirect_table" VALUES (87, '281', '281');
INSERT INTO "public"."redirect_table" VALUES (88, '1055', '355');
INSERT INTO "public"."redirect_table" VALUES (89, '1071', '445');
INSERT INTO "public"."redirect_table" VALUES (90, '306', '422');
INSERT INTO "public"."redirect_table" VALUES (91, '766', '454');
INSERT INTO "public"."redirect_table" VALUES (92, '1028', '134');
INSERT INTO "public"."redirect_table" VALUES (93, '633', '470');
INSERT INTO "public"."redirect_table" VALUES (94, '310', '420');
INSERT INTO "public"."redirect_table" VALUES (95, '277', '277');
INSERT INTO "public"."redirect_table" VALUES (96, '714', '91');
INSERT INTO "public"."redirect_table" VALUES (97, '86', '132');
INSERT INTO "public"."redirect_table" VALUES (98, '161', '91');
INSERT INTO "public"."redirect_table" VALUES (99, '294', '92');
INSERT INTO "public"."redirect_table" VALUES (100, '50', '14');
INSERT INTO "public"."redirect_table" VALUES (101, '1060', '465');
INSERT INTO "public"."redirect_table" VALUES (102, '501', '149');
INSERT INTO "public"."redirect_table" VALUES (103, '743', '200');
INSERT INTO "public"."redirect_table" VALUES (104, '1029', '91');
INSERT INTO "public"."redirect_table" VALUES (105, '795', '59');
INSERT INTO "public"."redirect_table" VALUES (106, '686', '776');
INSERT INTO "public"."redirect_table" VALUES (107, '840', '840');
INSERT INTO "public"."redirect_table" VALUES (108, '496', '112');
INSERT INTO "public"."redirect_table" VALUES (109, '19', '19');
INSERT INTO "public"."redirect_table" VALUES (110, '157', '92');
INSERT INTO "public"."redirect_table" VALUES (111, '715', '131');
INSERT INTO "public"."redirect_table" VALUES (112, '214', '134');
INSERT INTO "public"."redirect_table" VALUES (113, '606', '55');
INSERT INTO "public"."redirect_table" VALUES (114, '549', '464');
INSERT INTO "public"."redirect_table" VALUES (115, '129', '54');
INSERT INTO "public"."redirect_table" VALUES (116, '836', '136');
INSERT INTO "public"."redirect_table" VALUES (117, '166', '89');
INSERT INTO "public"."redirect_table" VALUES (118, '180', '90');
INSERT INTO "public"."redirect_table" VALUES (119, '808', '514');

-- ----------------------------
-- Table structure for sections
-- ----------------------------
DROP TABLE IF EXISTS "public"."sections";
CREATE TABLE "public"."sections" (
  "id" int4 NOT NULL DEFAULT nextval('sections_id_seq'::regclass),
  "subjectID" varchar(32) COLLATE "pg_catalog"."default" NOT NULL,
  "obavestenja" varchar(64) COLLATE "pg_catalog"."default" NOT NULL,
  "rezultati" varchar(64) COLLATE "pg_catalog"."default" NOT NULL,
  "kol1Pre" varchar(64) COLLATE "pg_catalog"."default" NOT NULL,
  "kol2Pre" varchar(64) COLLATE "pg_catalog"."default" NOT NULL,
  "ispitPre" varchar(64) COLLATE "pg_catalog"."default" NOT NULL,
  "dmPre" varchar(64) COLLATE "pg_catalog"."default" NOT NULL,
  "kol1Vez" varchar(64) COLLATE "pg_catalog"."default" NOT NULL,
  "kol2Vez" varchar(64) COLLATE "pg_catalog"."default" NOT NULL,
  "ispitVez" varchar(64) COLLATE "pg_catalog"."default" NOT NULL,
  "dmVez" varchar(64) COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Records of sections
-- ----------------------------
INSERT INTO "public"."sections" VALUES (1, '263', '3445', '3446', '3448', '3449', '3450', '3451', '3452', '3453', '3454', '3455');
INSERT INTO "public"."sections" VALUES (2, '258', '3373', '3374', '3376', '3377', '3378', '3379', '3380', '3381', '3382', '3383');
INSERT INTO "public"."sections" VALUES (4, '249', '3253', '3254', '3256', '3257', '3259', '3260', '3261', '3262', '3263', '3264');
INSERT INTO "public"."sections" VALUES (5, '247', '3209', '3210', '3212', '3213', '3214', '3215', '3216', '3217', '3218', '3219');
INSERT INTO "public"."sections" VALUES (6, '244', '3177', '3178', '3181', '3182', '3183', '3184', '3185', '3186', '3187', '3188');
INSERT INTO "public"."sections" VALUES (7, '204', '2692', '2693', '2695', '2696', '2697', '2698', '2699', '2700', '2701', '2702');
INSERT INTO "public"."sections" VALUES (8, '205', '2721', '2722', '2724', '2725', '2726', '2727', '2728', '2729', '2730', '2731');
INSERT INTO "public"."sections" VALUES (9, '188', '2486', '2487', '2489', '2490', '2491', '2492', '2493', '2494', '2495', '2496');
INSERT INTO "public"."sections" VALUES (10, '184', '2440', '2441', '2443', '2444', '2445', '2446', '2447', '2448', '2449', '2450');
INSERT INTO "public"."sections" VALUES (11, '672', '11981', '11982', '11984', '11985', '11986', '11987', '0', '11989', '11990', '0');
INSERT INTO "public"."sections" VALUES (12, '171', '2289', '2290', '2292', '2293', '2294', '2295', '2296', '2297', '2298', '2299');
INSERT INTO "public"."sections" VALUES (13, '151', '2076', '2077', '2079', '2080', '2081', '2083', '2084', '2085', '2086', '2087');
INSERT INTO "public"."sections" VALUES (14, '150', '2047', '2048', '2050', '2051', '2052', '2053', '2054', '2055', '2056', '2057');
INSERT INTO "public"."sections" VALUES (15, '167', '2232', '2233', '2235', '2236', '2237', '2238', '2239', '2240', '2241', '2242');
INSERT INTO "public"."sections" VALUES (16, '7', '2031', '2032', '2034', '2035', '2036', '2037', '2038', '2039', '2040', '2041');
INSERT INTO "public"."sections" VALUES (17, '296', '3857', '3858', '3860', '3861', '3862', '3863', '3864', '3865', '3866', '3867');
INSERT INTO "public"."sections" VALUES (18, '195', '2595', '2596', '2598', '2599', '2600', '2601', '2602', '2603', '2604', '0');
INSERT INTO "public"."sections" VALUES (19, '192', '2544', '2545', '2547', '2548', '2556', '2558', '2559', '2560', '0', '2567');
INSERT INTO "public"."sections" VALUES (20, '200', '2634', '2635', '2637', '2638', '2639', '2640', '2641', '2648', '2654', '2655');
INSERT INTO "public"."sections" VALUES (21, '834', '9777', '9778', '9780', '9781', '9782', '9783', '9784', '9785', '9786', '9787');
INSERT INTO "public"."sections" VALUES (22, '261', '3402', '3403', '3405', '3406', '3407', '3408', '3409', '3410', '3411', '3412');
INSERT INTO "public"."sections" VALUES (23, '299', '3902', '3903', '3905', '3906', '3907', '3908', '3909', '3910', '3911', '3912');
INSERT INTO "public"."sections" VALUES (24, '997', '13381', '13382', '13384', '13385', '13386', '13387', '13388', '13389', '13390', '13391');
INSERT INTO "public"."sections" VALUES (25, '322', '4133', '4134', '4136', '4137', '4138', '4139', '4140', '4141', '4142', '4143');
INSERT INTO "public"."sections" VALUES (26, '319', '4104', '4105', '4107', '4108', '4109', '4110', '4111', '4112', '4113', '4114');
INSERT INTO "public"."sections" VALUES (27, '313', '4040', '4041', '4043', '4044', '4045', '4046', '4047', '4048', '4049', '4050');
INSERT INTO "public"."sections" VALUES (28, '311', '3996', '3997', '3999', '4000', '4001', '4002', '4003', '4004', '4005', '4006');
INSERT INTO "public"."sections" VALUES (30, '614', '8035', '8036', '8038', '8039', '8040', '8041', '8042', '8043', '8044', '8045');
INSERT INTO "public"."sections" VALUES (31, '611', '7992', '7993', '7995', '7996', '7997', '7998', '7999', '8000', '8001', '8002');
INSERT INTO "public"."sections" VALUES (32, '610', '7977', '7978', '7980', '7981', '7982', '7983', '7984', '7985', '7986', '7987');
INSERT INTO "public"."sections" VALUES (33, '607', '7936', '7937', '7939', '7940', '7941', '7942', '7943', '7944', '7945', '7946');
INSERT INTO "public"."sections" VALUES (34, '605', '7920', '7921', '7923', '7924', '7925', '7926', '7927', '7928', '7929', '7930');
INSERT INTO "public"."sections" VALUES (35, '603', '7907', '7908', '7910', '7911', '7912', '7913', '7914', '7915', '7916', '7917');
INSERT INTO "public"."sections" VALUES (36, '952', '12621', '12622', '12624', '12625', '12626', '12627', '12628', '12629', '12630', '12631');
INSERT INTO "public"."sections" VALUES (37, '642', '8302', '8303', '8305', '8306', '8307', '8308', '8309', '8310', '8311', '8312');
INSERT INTO "public"."sections" VALUES (38, '636', '8256', '8257', '8259', '8260', '8261', '8262', '8263', '8264', '8265', '8266');
INSERT INTO "public"."sections" VALUES (39, '626', '8139', '8140', '8142', '8143', '8144', '8145', '8146', '8147', '8148', '8149');
INSERT INTO "public"."sections" VALUES (40, '617', '8093', '8094', '8096', '8097', '8098', '8099', '8100', '8101', '8102', '8103');
INSERT INTO "public"."sections" VALUES (41, '93', '1331', '1332', '1334', '1335', '1336', '1337', '1338', '1339', '1340', '1341');
INSERT INTO "public"."sections" VALUES (42, '168', '2245', '2246', '2248', '2249', '2250', '2251', '2252', '2253', '2254', '2255');
INSERT INTO "public"."sections" VALUES (43, '89', '1303', '1304', '0', '0', '1308', '1309', '1310', '1311', '0', '0');
INSERT INTO "public"."sections" VALUES (44, '85', '1231', '1232', '1234', '1235', '1236', '1237', '1238', '1239', '1240', '1241');
INSERT INTO "public"."sections" VALUES (45, '162', '2198', '2199', '2201', '2202', '2203', '2204', '2205', '2206', '2207', '2208');
INSERT INTO "public"."sections" VALUES (46, '83', '1202', '1203', '1205', '1206', '1207', '1208', '1209', '1210', '1211', '1212');
INSERT INTO "public"."sections" VALUES (47, '297', '3871', '3872', '3874', '3875', '3876', '3877', '3878', '3879', '3880', '3881');
INSERT INTO "public"."sections" VALUES (48, '246', '3222', '3223', '0', '0', '3227', '3228', '3229', '3230', '0', '0');
INSERT INTO "public"."sections" VALUES (49, '92', '1317', '1318', '1320', '1321', '1322', '1323', '1324', '1325', '1326', '1327');
INSERT INTO "public"."sections" VALUES (50, '423', '5542', '5543', '5545', '5546', '5547', '5548', '5549', '5550', '5551', '5552');
INSERT INTO "public"."sections" VALUES (51, '422', '10543', '5514', '5516', '5517', '5518', '5519', '5520', '5521', '5522', '5523');
INSERT INTO "public"."sections" VALUES (52, '421', '5499', '5500', '5502', '5503', '5504', '5505', '5506', '5507', '5508', '5509');
INSERT INTO "public"."sections" VALUES (53, '420', '9980', '9981', '9983', '9984', '9985', '9986', '9987', '9988', '9989', '9990');
INSERT INTO "public"."sections" VALUES (54, '419', '5484', '5485', '5487', '5488', '5489', '5490', '5491', '5492', '5493', '5494');
INSERT INTO "public"."sections" VALUES (55, '418', '9967', '9968', '9970', '9971', '9972', '9973', '9974', '9975', '9976', '9977');
INSERT INTO "public"."sections" VALUES (56, '476', '6308', '6309', '6311', '6312', '6313', '6314', '6315', '6316', '6317', '6318');
INSERT INTO "public"."sections" VALUES (57, '472', '6223', '6224', '6226', '6227', '6228', '6229', '6230', '6231', '6232', '6233');
INSERT INTO "public"."sections" VALUES (58, '432', '5697', '5698', '5700', '5701', '5702', '5703', '5704', '5705', '5706', '5707');
INSERT INTO "public"."sections" VALUES (59, '430', '5626', '5627', '5629', '5630', '5631', '5632', '5633', '5634', '5635', '5636');
INSERT INTO "public"."sections" VALUES (60, '464', '6111', '6112', '6114', '6115', '6116', '6117', '6118', '6119', '6120', '6121');
INSERT INTO "public"."sections" VALUES (61, '467', '6139', '6140', '6142', '6143', '6144', '6145', '6146', '6147', '6148', '6149');
INSERT INTO "public"."sections" VALUES (62, '470', '6195', '6196', '6198', '6199', '6200', '6201', '6202', '6203', '6204', '6205');
INSERT INTO "public"."sections" VALUES (63, '474', '6257', '6259', '6263', '6264', '6266', '6272', '6273', '6274', '6276', '6277');
INSERT INTO "public"."sections" VALUES (64, '468', '6167', '6168', '0', '6171', '6172', '6173', '0', '6175', '6176', '6177');
INSERT INTO "public"."sections" VALUES (65, '601', '7876', '7877', '7879', '7880', '7881', '7882', '7883', '7884', '7885', '7886');
INSERT INTO "public"."sections" VALUES (66, '916', '11516', '11517', '11519', '11520', '11521', '11522', '11523', '11524', '11525', '11526');
INSERT INTO "public"."sections" VALUES (67, '915', '11501', '11502', '11504', '11505', '11506', '11507', '11508', '11509', '11510', '11511');
INSERT INTO "public"."sections" VALUES (68, '914', '11486', '11487', '11489', '11490', '11491', '11492', '11493', '11494', '11495', '11496');
INSERT INTO "public"."sections" VALUES (69, '913', '11471', '11472', '11474', '11475', '11476', '11477', '11478', '11479', '11480', '11481');
INSERT INTO "public"."sections" VALUES (70, '912', '11456', '11457', '11459', '11460', '11461', '11462', '11463', '11464', '11465', '11466');
INSERT INTO "public"."sections" VALUES (71, '911', '11439', '11440', '11442', '11443', '11444', '11445', '11446', '11447', '11448', '11449');
INSERT INTO "public"."sections" VALUES (72, '910', '11418', '11419', '11421', '11422', '11423', '11424', '11425', '11426', '11427', '11428');
INSERT INTO "public"."sections" VALUES (73, '1076', '14574', '14575', '14577', '14578', '14579', '14580', '14581', '14582', '14583', '14584');
INSERT INTO "public"."sections" VALUES (74, '961', '12807', '12808', '12810', '12811', '12812', '12813', '12814', '12815', '12816', '12817');
INSERT INTO "public"."sections" VALUES (75, '957', '12747', '12748', '12750', '12751', '12752', '12753', '12754', '12755', '12756', '12757');
INSERT INTO "public"."sections" VALUES (76, '956', '12718', '12719', '12721', '12722', '12723', '12724', '12725', '12726', '12727', '12728');
INSERT INTO "public"."sections" VALUES (77, '954', '12702', '12704', '12706', '12707', '12708', '12709', '12710', '12711', '12712', '12713');
INSERT INTO "public"."sections" VALUES (78, '71', '1008', '1009', '1011', '1012', '1013', '1014', '1015', '1016', '1017', '1018');
INSERT INTO "public"."sections" VALUES (79, '70', '993', '994', '996', '997', '998', '999', '1000', '1001', '1002', '1003');
INSERT INTO "public"."sections" VALUES (80, '69', '978', '979', '981', '982', '983', '984', '985', '986', '987', '988');
INSERT INTO "public"."sections" VALUES (81, '68', '963', '964', '966', '967', '968', '969', '970', '971', '972', '973');
INSERT INTO "public"."sections" VALUES (82, '66', '943', '948', '950', '0', '952', '0', '0', '955', '0', '0');
INSERT INTO "public"."sections" VALUES (83, '65', '902', '903', '905', '906', '907', '908', '909', '910', '911', '912');
INSERT INTO "public"."sections" VALUES (84, '81', '1159', '1160', '1162', '1163', '1164', '1165', '1166', '1167', '1168', '1169');
INSERT INTO "public"."sections" VALUES (85, '80', '1143', '1144', '1146', '1147', '1148', '1149', '1150', '1151', '1152', '1153');
INSERT INTO "public"."sections" VALUES (86, '79', '1114', '1115', '1117', '1118', '1119', '1120', '1121', '1122', '1123', '1124');
INSERT INTO "public"."sections" VALUES (87, '77', '1099', '1100', '1102', '1103', '1104', '1105', '1106', '1107', '1108', '1109');
INSERT INTO "public"."sections" VALUES (88, '76', '1083', '1084', '1086', '1087', '1088', '1089', '1090', '1091', '1092', '1093');
INSERT INTO "public"."sections" VALUES (89, '75', '1068', '1069', '1071', '1072', '1073', '1074', '1075', '1076', '1077', '1078');
INSERT INTO "public"."sections" VALUES (90, '74', '1053', '1054', '1056', '1057', '1058', '1059', '1060', '1061', '1062', '1063');
INSERT INTO "public"."sections" VALUES (91, '73', '1038', '1039', '1041', '1042', '1043', '1044', '1045', '1046', '1047', '1048');
INSERT INTO "public"."sections" VALUES (92, '309', '4010', '4011', '4013', '4014', '0', '0', '4017', '0', '0', '0');
INSERT INTO "public"."sections" VALUES (93, '303', '3934', '3935', '3937', '3938', '3939', '3940', '3941', '3942', '3943', '3944');
INSERT INTO "public"."sections" VALUES (94, '292', '3826', '3827', '3829', '3830', '3832', '3833', '3834', '3835', '3836', '3838');
INSERT INTO "public"."sections" VALUES (95, '288', '3781', '3782', '3784', '3785', '3786', '3787', '3788', '3789', '3790', '3791');
INSERT INTO "public"."sections" VALUES (96, '285', '3737', '3738', '3740', '3741', '3742', '3743', '3744', '3745', '3746', '3747');
INSERT INTO "public"."sections" VALUES (97, '282', '3693', '3694', '3697', '3698', '0', '3700', '3701', '3702', '0', '3704');
INSERT INTO "public"."sections" VALUES (98, '278', '3663', '3664', '3666', '3667', '3668', '3669', '3670', '3671', '3672', '3673');
INSERT INTO "public"."sections" VALUES (99, '270', '3576', '3577', '3579', '3580', '3581', '3582', '3583', '3584', '3585', '3586');
INSERT INTO "public"."sections" VALUES (100, '268', '3532', '3533', '3535', '3536', '3537', '3538', '3539', '3540', '3541', '3542');
INSERT INTO "public"."sections" VALUES (101, '237', '3083', '3084', '3086', '3087', '3088', '3089', '3090', '3091', '3092', '3093');
INSERT INTO "public"."sections" VALUES (102, '226', '10692', '2933', '2935', '2936', '2937', '2938', '2939', '2940', '2941', '2942');
INSERT INTO "public"."sections" VALUES (103, '225', '2917', '2918', '2920', '2921', '2922', '2923', '2924', '2925', '2926', '2927');
INSERT INTO "public"."sections" VALUES (104, '223', '9823', '9824', '9826', '9827', '9828', '9829', '9830', '9831', '9832', '9833');
INSERT INTO "public"."sections" VALUES (105, '219', '10393', '10394', '10396', '10397', '10398', '10399', '10400', '10401', '10402', '10403');
INSERT INTO "public"."sections" VALUES (106, '213', '2796', '2797', '2799', '2800', '2801', '2802', '2803', '2804', '2805', '2806');
INSERT INTO "public"."sections" VALUES (107, '210', '2766', '2767', '2769', '2770', '2771', '2772', '2773', '2774', '2775', '2776');
INSERT INTO "public"."sections" VALUES (108, '221', '10617', '10618', '10620', '10621', '10622', '10623', '10624', '10625', '10626', '10627');
INSERT INTO "public"."sections" VALUES (109, '265', '3488', '3489', '3491', '3492', '3493', '3494', '3495', '3496', '3497', '3498');
INSERT INTO "public"."sections" VALUES (110, '216', '2811', '2812', '2814', '2815', '2816', '2817', '2818', '2819', '2820', '2821');
INSERT INTO "public"."sections" VALUES (111, '371', '4831', '4832', '4834', '4835', '4836', '4837', '4838', '4839', '4840', '4841');
INSERT INTO "public"."sections" VALUES (112, '370', '4816', '4817', '4819', '4820', '4821', '4822', '4823', '4824', '4825', '4826');
INSERT INTO "public"."sections" VALUES (113, '369', '4801', '4802', '4804', '4805', '4806', '4807', '4808', '4809', '4810', '4811');
INSERT INTO "public"."sections" VALUES (114, '367', '4771', '4772', '4774', '4775', '4776', '4777', '4778', '4779', '4780', '4781');
INSERT INTO "public"."sections" VALUES (115, '1000', '13367', '13368', '13370', '13371', '13372', '13373', '13374', '13375', '13376', '13377');
INSERT INTO "public"."sections" VALUES (116, '861', '11662', '11663', '0', '11666', '0', '11668', '11669', '0', '11671', '11672');
INSERT INTO "public"."sections" VALUES (117, '860', '11676', '11677', '11679', '11680', '11681', '11682', '11683', '11684', '11685', '11686');
INSERT INTO "public"."sections" VALUES (118, '858', '11704', '11705', '11707', '11708', '11709', '11710', '11711', '11712', '11713', '11714');
INSERT INTO "public"."sections" VALUES (119, '856', '11718', '11719', '11721', '11722', '11723', '11724', '11725', '11726', '11727', '11728');
INSERT INTO "public"."sections" VALUES (120, '855', '11732', '11733', '11735', '11736', '11737', '11738', '11739', '11740', '11741', '11742');
INSERT INTO "public"."sections" VALUES (121, '854', '11760', '11761', '11763', '11764', '11765', '11766', '11767', '11768', '11769', '11770');
INSERT INTO "public"."sections" VALUES (122, '853', '11746', '11747', '11749', '11750', '11751', '11752', '11753', '11754', '11755', '11756');
INSERT INTO "public"."sections" VALUES (123, '866', '10213', '10214', '10216', '10217', '10218', '10219', '10220', '10221', '10222', '10223');
INSERT INTO "public"."sections" VALUES (124, '778', '9373', '9374', '9376', '9377', '9378', '9379', '9380', '9381', '9382', '9383');
INSERT INTO "public"."sections" VALUES (125, '774', '9318', '9319', '9321', '9322', '9323', '9324', '9325', '9326', '9327', '9328');
INSERT INTO "public"."sections" VALUES (126, '770', '9288', '9289', '9291', '9292', '9293', '9294', '9295', '9296', '9297', '9298');
INSERT INTO "public"."sections" VALUES (127, '765', '9257', '9258', '9260', '9261', '9262', '9263', '9264', '9265', '9266', '9267');
INSERT INTO "public"."sections" VALUES (128, '764', '9242', '9243', '9245', '9246', '9247', '9248', '9249', '9250', '9251', '9252');
INSERT INTO "public"."sections" VALUES (129, '761', '9227', '9228', '9230', '9231', '9232', '9233', '9234', '9235', '9236', '9237');
INSERT INTO "public"."sections" VALUES (130, '789', '14474', '14475', '14477', '14478', '14479', '14480', '14481', '14482', '14483', '14484');
INSERT INTO "public"."sections" VALUES (131, '786', '9432', '9433', '9435', '9436', '9437', '9438', '9439', '9440', '9441', '9442');
INSERT INTO "public"."sections" VALUES (132, '784', '9417', '9418', '9420', '0', '9422', '0', '9424', '9425', '0', '9427');
INSERT INTO "public"."sections" VALUES (133, '781', '9390', '9391', '9393', '9394', '9395', '9396', '9397', '9398', '9399', '9400');
INSERT INTO "public"."sections" VALUES (134, '101', '1418', '1419', '1421', '1422', '1423', '1424', '1425', '1426', '1427', '1428');
INSERT INTO "public"."sections" VALUES (135, '99', '1403', '1404', '1406', '1407', '1408', '1409', '1410', '1411', '1412', '1413');
INSERT INTO "public"."sections" VALUES (136, '98', '1389', '1390', '1392', '1393', '1394', '1395', '1396', '1397', '1398', '1399');
INSERT INTO "public"."sections" VALUES (137, '96', '1375', '1376', '1378', '1379', '1380', '1381', '1382', '1383', '1384', '1385');
INSERT INTO "public"."sections" VALUES (138, '95', '1346', '1347', '1349', '1350', '1351', '1352', '1353', '1354', '1355', '1356');
INSERT INTO "public"."sections" VALUES (139, '1013', '13578', '13579', '13581', '13582', '13583', '13584', '13585', '13586', '13587', '13588');
INSERT INTO "public"."sections" VALUES (140, '183', '2412', '2413', '2415', '2416', '2427', '2432', '2433', '2434', '2435', '2436');
INSERT INTO "public"."sections" VALUES (141, '182', '9589', '9590', '9592', '9593', '9594', '9595', '9596', '9597', '9598', '9599');
INSERT INTO "public"."sections" VALUES (142, '90', '1291', '1290', '1293', '1294', '1296', '1295', '1297', '1298', '1300', '1299');
INSERT INTO "public"."sections" VALUES (143, '88', '1260', '1261', '1263', '1264', '1265', '1266', '1267', '1268', '1269', '1270');
INSERT INTO "public"."sections" VALUES (144, '176', '9575', '9576', '9578', '9579', '9580', '9581', '9582', '9583', '9584', '9585');
INSERT INTO "public"."sections" VALUES (145, '173', '2319', '2320', '2322', '2323', '2324', '2325', '2326', '2327', '2328', '2329');
INSERT INTO "public"."sections" VALUES (146, '329', '12076', '12077', '12079', '12080', '12081', '12082', '12083', '12084', '12085', '12086');
INSERT INTO "public"."sections" VALUES (147, '809', '9531', '9532', '9534', '9535', '9536', '9537', '9538', '9539', '9540', '9541');
INSERT INTO "public"."sections" VALUES (148, '326', '4207', '4208', '4210', '4211', '4212', '4213', '4214', '4215', '4216', '4217');
INSERT INTO "public"."sections" VALUES (149, '323', '4164', '4165', '4167', '4168', '4169', '4170', '4171', '4172', '4173', '4174');
INSERT INTO "public"."sections" VALUES (150, '320', '4147', '4148', '4150', '4151', '4152', '4153', '0', '0', '0', '0');
INSERT INTO "public"."sections" VALUES (151, '318', '4088', '4089', '4091', '4092', '4093', '4094', '4095', '4096', '4097', '4098');
INSERT INTO "public"."sections" VALUES (152, '438', '5752', '5753', '5755', '5756', '5757', '5758', '5759', '5760', '5761', '5762');
INSERT INTO "public"."sections" VALUES (153, '434', '5710', '5711', '5713', '5714', '5715', '5716', '5717', '5718', '5719', '5720');
INSERT INTO "public"."sections" VALUES (154, '433', '5668', '5669', '5671', '5678', '5679', '5681', '5682', '5684', '5688', '5691');
INSERT INTO "public"."sections" VALUES (155, '429', '5640', '5641', '5643', '5644', '5645', '5646', '5647', '5648', '5649', '5650');
INSERT INTO "public"."sections" VALUES (156, '428', '5613', '5614', '5616', '5617', '5618', '5619', '5620', '5621', '5622', '5623');
INSERT INTO "public"."sections" VALUES (157, '427', '5585', '5586', '5588', '5589', '5590', '5591', '5592', '5593', '5594', '5595');
INSERT INTO "public"."sections" VALUES (158, '425', '5569', '5570', '5572', '5573', '5574', '5575', '5576', '5577', '5578', '5579');
INSERT INTO "public"."sections" VALUES (159, '492', '10198', '10199', '10201', '10202', '10203', '10204', '10205', '10206', '10207', '10208');
INSERT INTO "public"."sections" VALUES (160, '488', '6468', '6469', '6471', '6472', '6473', '6474', '6475', '6476', '6477', '6478');
INSERT INTO "public"."sections" VALUES (161, '485', '6427', '6428', '6430', '6431', '6432', '6433', '6434', '6435', '6436', '6437');
INSERT INTO "public"."sections" VALUES (162, '484', '6397', '6398', '6400', '6401', '6402', '6403', '6404', '6405', '6406', '6407');
INSERT INTO "public"."sections" VALUES (163, '482', '6368', '6369', '6371', '6372', '6373', '6374', '6375', '6376', '6377', '6378');
INSERT INTO "public"."sections" VALUES (164, '481', '6352', '6353', '6355', '6356', '6357', '6358', '6359', '6360', '6361', '6362');
INSERT INTO "public"."sections" VALUES (165, '463', '6083', '6084', '6086', '6087', '6088', '6089', '6090', '6091', '6092', '6093');
INSERT INTO "public"."sections" VALUES (166, '461', '6014', '6015', '6017', '6018', '6019', '6020', '6021', '6022', '6023', '6024');
INSERT INTO "public"."sections" VALUES (167, '458', '5999', '6000', '6002', '6003', '6004', '6005', '6006', '6007', '6008', '6009');
INSERT INTO "public"."sections" VALUES (168, '455', '5981', '5982', '5984', '5985', '5986', '5987', '5988', '5989', '5990', '5991');
INSERT INTO "public"."sections" VALUES (169, '453', '5912', '5913', '5915', '5916', '5917', '5918', '5919', '5920', '5921', '5922');
INSERT INTO "public"."sections" VALUES (170, '448', '5871', '5872', '5874', '5875', '5876', '5877', '5878', '5879', '5880', '5881');
INSERT INTO "public"."sections" VALUES (171, '443', '5832', '5833', '5836', '5843', '5844', '5845', '5846', '5847', '5848', '5849');
INSERT INTO "public"."sections" VALUES (172, '650', '12091', '12092', '12094', '12095', '12096', '12097', '12098', '12099', '12100', '12101');
INSERT INTO "public"."sections" VALUES (173, '491', '6514', '6515', '6517', '6518', '6519', '6520', '6521', '6522', '6523', '6524');
INSERT INTO "public"."sections" VALUES (174, '645', '8331', '8332', '8334', '8335', '8336', '8337', '8338', '8339', '8340', '8341');
INSERT INTO "public"."sections" VALUES (175, '641', '8289', '8290', '8292', '8293', '8294', '8295', '8296', '8297', '8298', '8299');
INSERT INTO "public"."sections" VALUES (176, '637', '8243', '8244', '8246', '8247', '8248', '8249', '8250', '8251', '8252', '8253');
INSERT INTO "public"."sections" VALUES (177, '635', '8211', '8212', '8214', '8216', '8217', '8218', '8219', '8220', '8221', '8223');
INSERT INTO "public"."sections" VALUES (178, '631', '8169', '8170', '8172', '8173', '8174', '8175', '8176', '8177', '8178', '8179');
INSERT INTO "public"."sections" VALUES (179, '1046', '14066', '14067', '14069', '14070', '14071', '14072', '14073', '14074', '14075', '14076');
INSERT INTO "public"."sections" VALUES (180, '1045', '14051', '14052', '14054', '14055', '14056', '14057', '14058', '14059', '14060', '14061');
INSERT INTO "public"."sections" VALUES (181, '1044', '14036', '14037', '14039', '14040', '14041', '14042', '14043', '14044', '14045', '14046');
INSERT INTO "public"."sections" VALUES (182, '1043', '14021', '14022', '14024', '14025', '14026', '14027', '14028', '14029', '14030', '14031');
INSERT INTO "public"."sections" VALUES (183, '1042', '14006', '14007', '14009', '14010', '14011', '14012', '14013', '14014', '14015', '14016');
INSERT INTO "public"."sections" VALUES (184, '1041', '13991', '13992', '13994', '13995', '13996', '13997', '13998', '13999', '14000', '14001');
INSERT INTO "public"."sections" VALUES (185, '1040', '13977', '13978', '13980', '13981', '13982', '13983', '13984', '13985', '13986', '13987');
INSERT INTO "public"."sections" VALUES (186, '1077', '14590', '14591', '14593', '14594', '14595', '14596', '14597', '14598', '14599', '14600');
INSERT INTO "public"."sections" VALUES (187, '975', '13003', '13004', '13006', '13007', '13008', '13009', '13010', '13011', '13012', '13013');
INSERT INTO "public"."sections" VALUES (188, '973', '12987', '12988', '12990', '12991', '12992', '12993', '12994', '12995', '12996', '12997');
INSERT INTO "public"."sections" VALUES (189, '970', '12942', '12943', '12945', '12946', '12947', '12948', '12949', '12950', '12951', '12952');
INSERT INTO "public"."sections" VALUES (190, '968', '12913', '12914', '12916', '12917', '12918', '12919', '12920', '12921', '12922', '12923');
INSERT INTO "public"."sections" VALUES (191, '967', '12883', '12884', '12886', '12887', '12888', '12889', '12890', '12891', '12892', '12893');
INSERT INTO "public"."sections" VALUES (192, '965', '12867', '12868', '12870', '12871', '12872', '12873', '12874', '12875', '12876', '12877');
INSERT INTO "public"."sections" VALUES (193, '813', '9618', '9619', '9621', '9622', '9623', '9624', '9625', '9626', '9627', '9628');
INSERT INTO "public"."sections" VALUES (194, '812', '9603', '9604', '9606', '9607', '9608', '9609', '9610', '9611', '9612', '9613');
INSERT INTO "public"."sections" VALUES (195, '44', '610', '611', '613', '614', '615', '616', '617', '618', '619', '620');
INSERT INTO "public"."sections" VALUES (196, '41', '576', '577', '579', '580', '581', '582', '584', '585', '586', '0');
INSERT INTO "public"."sections" VALUES (197, '38', '532', '533', '535', '536', '537', '538', '539', '540', '541', '542');
INSERT INTO "public"."sections" VALUES (198, '35', '488', '489', '491', '492', '493', '494', '495', '496', '497', '498');
INSERT INTO "public"."sections" VALUES (199, '30', '411', '412', '414', '415', '416', '417', '418', '419', '420', '421');
INSERT INTO "public"."sections" VALUES (200, '67', '932', '933', '935', '936', '937', '938', '939', '940', '941', '942');
INSERT INTO "public"."sections" VALUES (201, '64', '916', '917', '919', '920', '921', '922', '923', '924', '925', '926');
INSERT INTO "public"."sections" VALUES (202, '62', '886', '887', '889', '890', '891', '892', '893', '894', '895', '896');
INSERT INTO "public"."sections" VALUES (203, '61', '842', '843', '845', '846', '847', '848', '849', '850', '851', '852');
INSERT INTO "public"."sections" VALUES (204, '58', '781', '782', '784', '785', '786', '787', '788', '789', '790', '791');
INSERT INTO "public"."sections" VALUES (205, '52', '703', '704', '706', '707', '708', '709', '710', '711', '712', '713');
INSERT INTO "public"."sections" VALUES (206, '121', '11966', '11967', '11969', '11970', '11971', '11972', '11973', '11974', '11975', '11976');
INSERT INTO "public"."sections" VALUES (207, '118', '1630', '1631', '1633', '1634', '1635', '1636', '1637', '1638', '1639', '1640');
INSERT INTO "public"."sections" VALUES (208, '115', '1584', '1585', '1587', '1588', '1589', '1590', '1591', '1592', '1593', '1594');
INSERT INTO "public"."sections" VALUES (209, '32', '443', '444', '446', '447', '448', '449', '450', '451', '452', '453');
INSERT INTO "public"."sections" VALUES (210, '102', '1434', '1435', '1437', '1438', '1439', '1440', '1441', '1442', '1443', '1444');
INSERT INTO "public"."sections" VALUES (211, '21', '266', '267', '269', '270', '271', '272', '273', '274', '275', '276');
INSERT INTO "public"."sections" VALUES (212, '18', '220', '221', '223', '224', '225', '226', '227', '228', '229', '230');
INSERT INTO "public"."sections" VALUES (213, '148', '1989', '1990', '14626', '14627', '14628', '14629', '14630', '14631', '14632', '14633');
INSERT INTO "public"."sections" VALUES (214, '144', '1931', '1932', '1934', '1935', '1936', '1937', '1938', '1939', '1940', '1941');
INSERT INTO "public"."sections" VALUES (215, '54', '764', '765', '767', '768', '769', '770', '771', '772', '773', '774');
INSERT INTO "public"."sections" VALUES (216, '14', '174', '175', '177', '178', '179', '180', '181', '182', '183', '184');
INSERT INTO "public"."sections" VALUES (217, '885', '10910', '10911', '10913', '10914', '10915', '10916', '10917', '10918', '10919', '10920');
INSERT INTO "public"."sections" VALUES (218, '889', '10972', '10973', '10975', '10976', '10977', '10978', '10979', '10980', '10981', '10982');
INSERT INTO "public"."sections" VALUES (219, '890', '10988', '10989', '10991', '10992', '10993', '10994', '10995', '10996', '10997', '10998');
INSERT INTO "public"."sections" VALUES (220, '906', '11227', '11228', '11230', '11231', '11232', '11233', '11234', '11235', '11236', '11237');
INSERT INTO "public"."sections" VALUES (221, '898', '11093', '11094', '11096', '11097', '11098', '11099', '11100', '11101', '11102', '11103');
INSERT INTO "public"."sections" VALUES (222, '899', '11122', '11123', '11125', '11126', '11127', '11128', '11129', '11130', '11131', '11132');
INSERT INTO "public"."sections" VALUES (223, '904', '11197', '11198', '11200', '11201', '11202', '11203', '11204', '11205', '11206', '11207');
INSERT INTO "public"."sections" VALUES (224, '895', '11062', '11063', '11065', '11066', '11067', '11068', '11069', '11070', '11071', '11072');
INSERT INTO "public"."sections" VALUES (225, '335', '4343', '4344', '4346', '4347', '4348', '4349', '4350', '4351', '4352', '4353');
INSERT INTO "public"."sections" VALUES (226, '332', '4284', '4285', '4287', '4288', '4289', '4290', '4291', '4292', '4293', '4294');
INSERT INTO "public"."sections" VALUES (227, '328', '4237', '4238', '4240', '4241', '0', '4243', '4244', '4245', '0', '4247');
INSERT INTO "public"."sections" VALUES (228, '325', '4193', '4194', '4196', '4197', '4198', '4199', '4200', '4201', '4202', '4203');
INSERT INTO "public"."sections" VALUES (229, '321', '4119', '4120', '4122', '4123', '4124', '4125', '4126', '4127', '4128', '4129');
INSERT INTO "public"."sections" VALUES (230, '316', '4073', '4074', '4076', '4077', '4078', '4079', '4080', '4081', '4082', '4083');
INSERT INTO "public"."sections" VALUES (231, '831', '9746', '9747', '9749', '9750', '9751', '9752', '9753', '9754', '9755', '9756');
INSERT INTO "public"."sections" VALUES (232, '830', '9731', '9732', '9734', '9735', '9736', '9737', '9738', '9739', '9740', '9741');
INSERT INTO "public"."sections" VALUES (233, '827', '9714', '9715', '9717', '9718', '9719', '9720', '9721', '9722', '9723', '9724');
INSERT INTO "public"."sections" VALUES (234, '824', '9698', '9699', '9701', '9702', '9703', '9704', '9705', '9706', '9707', '9708');
INSERT INTO "public"."sections" VALUES (235, '341', '4387', '4388', '4390', '4391', '4392', '4393', '4394', '4395', '4396', '4397');
INSERT INTO "public"."sections" VALUES (236, '349', '4491', '4492', '4494', '4495', '4496', '4497', '4498', '4499', '4500', '4501');
INSERT INTO "public"."sections" VALUES (237, '826', '11802', '11803', '11805', '11806', '11807', '11808', '11809', '11810', '11811', '11812');
INSERT INTO "public"."sections" VALUES (238, '825', '11816', '11817', '11819', '11820', '11821', '11822', '11823', '11824', '11825', '11826');
INSERT INTO "public"."sections" VALUES (239, '823', '11830', '11831', '11833', '11834', '11835', '11836', '11837', '11838', '11839', '11840');
INSERT INTO "public"."sections" VALUES (240, '235', '3054', '3055', '3057', '3058', '3059', '3060', '3061', '3062', '3063', '3064');
INSERT INTO "public"."sections" VALUES (241, '820', '11872', '11873', '11875', '11876', '11877', '11878', '11879', '11880', '11881', '11882');
INSERT INTO "public"."sections" VALUES (242, '819', '11886', '11887', '11889', '11890', '11891', '11892', '11893', '11894', '11895', '11896');
INSERT INTO "public"."sections" VALUES (243, '818', '11900', '11901', '11903', '11904', '11905', '11906', '11907', '11908', '11909', '11910');
INSERT INTO "public"."sections" VALUES (244, '817', '11914', '11915', '11917', '11918', '11919', '11920', '11921', '11922', '11923', '11924');
INSERT INTO "public"."sections" VALUES (245, '815', '11942', '11943', '11945', '11946', '11947', '11948', '11949', '11950', '11951', '11952');
INSERT INTO "public"."sections" VALUES (246, '1011', '13548', '13549', '13551', '13552', '13553', '13554', '13555', '13556', '13557', '13558');
INSERT INTO "public"."sections" VALUES (247, '1010', '13533', '13534', '13536', '13537', '13538', '13539', '13540', '13541', '13542', '13543');
INSERT INTO "public"."sections" VALUES (248, '1009', '13518', '13519', '13521', '13522', '13523', '13524', '13525', '13526', '13527', '13528');
INSERT INTO "public"."sections" VALUES (249, '1008', '13503', '13504', '13506', '13507', '13508', '13509', '13510', '13511', '13512', '13513');
INSERT INTO "public"."sections" VALUES (250, '1007', '13488', '13489', '13491', '13492', '13493', '13494', '13495', '13496', '13497', '13498');
INSERT INTO "public"."sections" VALUES (251, '1006', '13473', '13474', '13476', '13477', '13478', '13479', '13480', '13481', '13482', '13483');
INSERT INTO "public"."sections" VALUES (252, '1005', '13458', '13459', '13461', '13462', '13463', '13464', '13465', '13466', '13467', '13468');
INSERT INTO "public"."sections" VALUES (253, '1004', '13443', '13444', '13446', '13447', '13448', '13449', '13450', '13451', '13452', '13453');
INSERT INTO "public"."sections" VALUES (254, '1003', '13428', '13429', '13431', '13432', '13433', '13434', '13435', '13436', '13437', '13438');
INSERT INTO "public"."sections" VALUES (255, '1002', '13413', '13414', '13416', '13417', '13418', '13419', '13420', '13421', '13422', '13423');
INSERT INTO "public"."sections" VALUES (256, '711', '9029', '9030', '9032', '9033', '9034', '9035', '9036', '9037', '9038', '9039');
INSERT INTO "public"."sections" VALUES (257, '629', '8185', '8186', '8188', '8189', '8190', '8191', '8192', '8193', '8194', '8195');
INSERT INTO "public"."sections" VALUES (258, '690', '8874', '8875', '8877', '8878', '8879', '8880', '8881', '8882', '8883', '8884');
INSERT INTO "public"."sections" VALUES (259, '689', '8859', '8860', '8862', '8863', '8864', '8865', '8866', '8867', '8868', '8869');
INSERT INTO "public"."sections" VALUES (260, '688', '8844', '8845', '8847', '8848', '8849', '8850', '8851', '8852', '8853', '8854');
INSERT INTO "public"."sections" VALUES (261, '687', '8829', '8830', '8832', '8833', '8834', '8835', '8836', '8837', '8838', '8839');
INSERT INTO "public"."sections" VALUES (262, '776', '9347', '9348', '9350', '9351', '9352', '9353', '9354', '9355', '9356', '9357');
INSERT INTO "public"."sections" VALUES (263, '685', '8813', '8814', '8816', '8817', '8818', '8819', '8820', '8821', '8822', '8823');
INSERT INTO "public"."sections" VALUES (264, '683', '8797', '8798', '8800', '8801', '8802', '8803', '8804', '8805', '8806', '8807');
INSERT INTO "public"."sections" VALUES (265, '680', '8752', '8753', '8755', '8756', '8757', '8758', '8759', '8760', '8761', '8762');
INSERT INTO "public"."sections" VALUES (266, '333', '4303', '4305', '4309', '4312', '4318', '4319', '4320', '4321', '4322', '4323');
INSERT INTO "public"."sections" VALUES (267, '314', '4268', '4269', '4271', '4272', '4273', '4274', '4275', '4276', '4277', '4278');
INSERT INTO "public"."sections" VALUES (268, '312', '10332', '10333', '10335', '10336', '10337', '10338', '0', '0', '10341', '0');
INSERT INTO "public"."sections" VALUES (269, '308', '3981', '3982', '3984', '3985', '3986', '3987', '3988', '3989', '3990', '3991');
INSERT INTO "public"."sections" VALUES (270, '304', '3949', '3950', '3952', '3953', '3954', '3955', '3956', '3957', '3958', '3959');
INSERT INTO "public"."sections" VALUES (271, '301', '3918', '3919', '0', '0', '3923', '3924', '3925', '3926', '0', '3928');
INSERT INTO "public"."sections" VALUES (272, '298', '3886', '3887', '3889', '3890', '3891', '3892', '3893', '3894', '3895', '3896');
INSERT INTO "public"."sections" VALUES (273, '72', '1023', '1024', '1026', '1027', '1028', '1029', '1030', '1031', '1032', '1033');
INSERT INTO "public"."sections" VALUES (274, '810', '9547', '9548', '9550', '9551', '9552', '9553', '9554', '9555', '9556', '9557');
INSERT INTO "public"."sections" VALUES (275, '59', '825', '826', '828', '829', '830', '831', '832', '833', '834', '835');
INSERT INTO "public"."sections" VALUES (276, '122', '12121', '12122', '12124', '12125', '12126', '12127', '12128', '12129', '12130', '12131');
INSERT INTO "public"."sections" VALUES (277, '120', '1658', '1659', '1661', '1662', '1663', '1664', '1665', '1666', '1667', '1668');
INSERT INTO "public"."sections" VALUES (278, '119', '1643', '1644', '1646', '1647', '1648', '1649', '1650', '1651', '1652', '1653');
INSERT INTO "public"."sections" VALUES (279, '117', '1614', '1615', '1617', '1618', '1619', '1620', '1621', '1622', '1623', '1624');
INSERT INTO "public"."sections" VALUES (280, '114', '1598', '1599', '1601', '1602', '1603', '1604', '1605', '1606', '1607', '1608');
INSERT INTO "public"."sections" VALUES (281, '113', '1566', '1567', '1569', '1570', '1571', '1572', '1573', '1574', '1575', '1576');
INSERT INTO "public"."sections" VALUES (282, '111', '1536', '1537', '1539', '1540', '1541', '1542', '1543', '1544', '1545', '1546');
INSERT INTO "public"."sections" VALUES (283, '202', '2663', '2664', '2666', '2667', '2668', '2669', '2670', '2671', '2672', '2673');
INSERT INTO "public"."sections" VALUES (284, '201', '2645', '2646', '2649', '2650', '2651', '2652', '2653', '2656', '2657', '2658');
INSERT INTO "public"."sections" VALUES (285, '198', '2619', '2620', '2622', '2623', '2624', '2625', '2626', '2627', '2628', '2629');
INSERT INTO "public"."sections" VALUES (286, '191', '2530', '2531', '2533', '2534', '2535', '2536', '2537', '2538', '2539', '2540');
INSERT INTO "public"."sections" VALUES (287, '186', '2470', '2471', '2473', '2474', '2475', '2477', '2478', '2479', '2480', '2481');
INSERT INTO "public"."sections" VALUES (288, '190', '2513', '2514', '2516', '2517', '2518', '2519', '2520', '2521', '2522', '2523');
INSERT INTO "public"."sections" VALUES (289, '274', '3605', '3606', '3608', '3609', '3610', '3611', '3612', '3613', '3614', '3615');
INSERT INTO "public"."sections" VALUES (290, '415', '5454', '5455', '5457', '5459', '5460', '0', '0', '0', '5464', '0');
INSERT INTO "public"."sections" VALUES (291, '413', '5428', '5429', '5431', '5432', '5433', '5434', '5435', '5436', '5437', '5438');
INSERT INTO "public"."sections" VALUES (292, '103', '1447', '1448', '1450', '1451', '1452', '1453', '1454', '1455', '1456', '1457');
INSERT INTO "public"."sections" VALUES (293, '264', '3474', '3475', '3477', '3478', '0', '3480', '0', '0', '3483', '0');
INSERT INTO "public"."sections" VALUES (294, '409', '5396', '5397', '5399', '5400', '5401', '5402', '5403', '5404', '5405', '5406');
INSERT INTO "public"."sections" VALUES (295, '408', '5382', '5383', '5385', '5386', '5387', '5388', '5389', '5390', '5391', '5392');
INSERT INTO "public"."sections" VALUES (296, '407', '5368', '5369', '5371', '5372', '5373', '5374', '5375', '5376', '5377', '5378');
INSERT INTO "public"."sections" VALUES (297, '865', '10184', '10185', '10187', '10188', '10189', '10190', '10191', '10192', '10193', '10194');
INSERT INTO "public"."sections" VALUES (298, '863', '10154', '10155', '10157', '10158', '10159', '10160', '10161', '10162', '10163', '10164');
INSERT INTO "public"."sections" VALUES (299, '862', '10139', '10140', '10142', '10143', '10144', '10145', '10146', '10147', '10148', '10149');
INSERT INTO "public"."sections" VALUES (300, '857', '10122', '10123', '10125', '10126', '10127', '10128', '10129', '10130', '10131', '10132');
INSERT INTO "public"."sections" VALUES (301, '852', '10101', '10102', '10104', '10105', '10106', '10107', '10108', '10109', '10110', '10111');
INSERT INTO "public"."sections" VALUES (302, '851', '10086', '10087', '10089', '10090', '10091', '10092', '10093', '10094', '10095', '10096');
INSERT INTO "public"."sections" VALUES (303, '849', '10056', '10057', '10059', '10060', '10061', '10062', '10063', '10064', '10065', '10066');
INSERT INTO "public"."sections" VALUES (304, '846', '10025', '10026', '10028', '10029', '10030', '10031', '10032', '10033', '10034', '10035');
INSERT INTO "public"."sections" VALUES (305, '845', '10010', '10011', '10013', '10014', '10015', '10016', '10017', '10018', '10019', '10020');
INSERT INTO "public"."sections" VALUES (306, '844', '9995', '9996', '9998', '9999', '10000', '10001', '10002', '10003', '10004', '10005');
INSERT INTO "public"."sections" VALUES (307, '511', '6766', '6767', '6769', '6770', '6771', '6772', '6773', '6774', '6775', '6776');
INSERT INTO "public"."sections" VALUES (308, '510', '6736', '6737', '6739', '6740', '6741', '6742', '6743', '6744', '6745', '6746');
INSERT INTO "public"."sections" VALUES (309, '506', '12106', '12107', '12109', '12110', '12111', '12112', '12113', '12114', '12115', '12116');
INSERT INTO "public"."sections" VALUES (310, '504', '6681', '6682', '6684', '6685', '6686', '6687', '6688', '6689', '6690', '6691');
INSERT INTO "public"."sections" VALUES (311, '502', '6639', '6641', '6645', '6647', '6648', '6650', '6652', '6653', '6655', '6656');
INSERT INTO "public"."sections" VALUES (312, '499', '6607', '6608', '6610', '6611', '6612', '6613', '6614', '6615', '6616', '6617');
INSERT INTO "public"."sections" VALUES (313, '497', '6589', '6590', '6592', '6593', '6594', '6595', '6596', '6597', '6598', '6599');
INSERT INTO "public"."sections" VALUES (314, '495', '6572', '6573', '6575', '6576', '6577', '6578', '0', '0', '6581', '6582');
INSERT INTO "public"."sections" VALUES (315, '486', '6454', '6455', '6457', '6458', '6459', '6460', '6461', '6462', '6463', '6464');
INSERT INTO "public"."sections" VALUES (316, '478', '6382', '6383', '6385', '6386', '6387', '6388', '6389', '6390', '6391', '6392');
INSERT INTO "public"."sections" VALUES (317, '477', '10250', '10251', '10253', '10254', '10255', '10256', '10257', '10258', '10259', '10260');
INSERT INTO "public"."sections" VALUES (318, '471', '6210', '6211', '6213', '6214', '6215', '6216', '6217', '6218', '6219', '6220');
INSERT INTO "public"."sections" VALUES (319, '466', '6154', '6155', '6157', '6158', '6159', '6160', '6161', '6162', '6163', '6164');
INSERT INTO "public"."sections" VALUES (320, '662', '8532', '8533', '8535', '8536', '8537', '8538', '8539', '8540', '8541', '8542');
INSERT INTO "public"."sections" VALUES (321, '661', '8502', '8503', '8505', '8506', '8507', '8508', '8509', '8510', '8511', '8512');
INSERT INTO "public"."sections" VALUES (322, '660', '8487', '8488', '8490', '8491', '8492', '8493', '8494', '8495', '8496', '8497');
INSERT INTO "public"."sections" VALUES (323, '659', '8472', '8473', '8475', '8476', '8477', '8478', '8479', '8480', '8481', '8482');
INSERT INTO "public"."sections" VALUES (324, '657', '8457', '8458', '8460', '8461', '8462', '8463', '8464', '8465', '8466', '8467');
INSERT INTO "public"."sections" VALUES (325, '655', '8440', '8441', '8443', '8444', '8445', '8446', '8447', '8448', '8449', '8450');
INSERT INTO "public"."sections" VALUES (326, '652', '8410', '8411', '8413', '8414', '8415', '8416', '0', '0', '8419', '8420');
INSERT INTO "public"."sections" VALUES (327, '1078', '14606', '14607', '14609', '14610', '14611', '14612', '14613', '14614', '14615', '14616');
INSERT INTO "public"."sections" VALUES (328, '972', '12972', '12973', '12975', '12976', '12977', '12978', '12979', '12980', '12981', '12982');
INSERT INTO "public"."sections" VALUES (329, '969', '12928', '12929', '12931', '12932', '12933', '12934', '12935', '12936', '12937', '12938');
INSERT INTO "public"."sections" VALUES (330, '966', '12897', '12898', '12900', '12901', '12902', '12903', '12904', '12905', '12906', '12907');
INSERT INTO "public"."sections" VALUES (331, '960', '12793', '12794', '12796', '12797', '12798', '12799', '12800', '12801', '12802', '12803');
INSERT INTO "public"."sections" VALUES (332, '958', '12763', '12764', '12766', '12767', '12768', '12769', '12770', '12771', '12772', '12773');
INSERT INTO "public"."sections" VALUES (333, '955', '12733', '12734', '12736', '12737', '12738', '12739', '12740', '12741', '12742', '12743');
INSERT INTO "public"."sections" VALUES (334, '701', '11996', '11997', '11999', '12000', '12001', '12002', '12003', '12004', '12005', '12006');
INSERT INTO "public"."sections" VALUES (335, '97', '1362', '1363', '1365', '1366', '1367', '1368', '1369', '1370', '1371', '1372');
INSERT INTO "public"."sections" VALUES (336, '84', '1189', '1190', '1192', '1193', '1194', '1195', '1196', '1197', '1198', '1199');
INSERT INTO "public"."sections" VALUES (337, '82', '1173', '1174', '1176', '1177', '1178', '1179', '1180', '1181', '1182', '1183');
INSERT INTO "public"."sections" VALUES (338, '27', '343', '344', '351', '352', '0', '354', '0', '0', '359', '0');
INSERT INTO "public"."sections" VALUES (339, '130', '1739', '1740', '1742', '1743', '1744', '1745', '1746', '1747', '1748', '1749');
INSERT INTO "public"."sections" VALUES (340, '116', '1722', '1723', '1725', '1726', '1727', '1728', '1729', '1730', '1731', '1732');
INSERT INTO "public"."sections" VALUES (341, '108', '1507', '1508', '1510', '1511', '1512', '1513', '1514', '1515', '1516', '1517');
INSERT INTO "public"."sections" VALUES (342, '174', '2334', '2335', '2337', '2338', '2340', '2341', '2342', '2343', '2344', '2345');
INSERT INTO "public"."sections" VALUES (343, '152', '2091', '2092', '2094', '2095', '2096', '2097', '2098', '2099', '2100', '2101');
INSERT INTO "public"."sections" VALUES (344, '143', '2062', '2063', '2065', '2066', '2067', '2068', '2069', '2070', '2071', '2072');
INSERT INTO "public"."sections" VALUES (345, '140', '1886', '1887', '1889', '1890', '1891', '1892', '1893', '1894', '1895', '1896');
INSERT INTO "public"."sections" VALUES (346, '133', '1797', '1798', '1800', '1801', '1802', '1803', '1804', '1805', '1806', '1807');
INSERT INTO "public"."sections" VALUES (347, '132', '1782', '1783', '1785', '1786', '1787', '1788', '1789', '1790', '1791', '1792');
INSERT INTO "public"."sections" VALUES (348, '131', '1754', '1755', '1757', '1758', '1759', '1760', '1761', '1762', '1763', '1764');
INSERT INTO "public"."sections" VALUES (349, '165', '2215', '2216', '2218', '2219', '2220', '2221', '2222', '2223', '2224', '2225');
INSERT INTO "public"."sections" VALUES (350, '91', '1277', '1278', '1280', '1281', '1282', '1283', '1284', '1285', '1286', '1287');
INSERT INTO "public"."sections" VALUES (351, '158', '2167', '2168', '2170', '2171', '2172', '2173', '2174', '2175', '2176', '2177');
INSERT INTO "public"."sections" VALUES (352, '156', '2151', '2152', '2154', '2155', '2156', '2157', '2158', '2159', '2160', '2161');
INSERT INTO "public"."sections" VALUES (353, '155', '2136', '2137', '2139', '2140', '2141', '2142', '2143', '2144', '2145', '2146');
INSERT INTO "public"."sections" VALUES (354, '153', '2106', '2107', '2109', '2110', '2111', '2112', '2113', '2114', '2115', '2116');
INSERT INTO "public"."sections" VALUES (355, '366', '4757', '4758', '4760', '4761', '4762', '4763', '4764', '4765', '4766', '4767');
INSERT INTO "public"."sections" VALUES (356, '365', '4741', '4742', '4744', '4745', '4746', '4747', '4748', '4749', '4750', '4751');
INSERT INTO "public"."sections" VALUES (357, '364', '4726', '4727', '4729', '4730', '4731', '4732', '4733', '4734', '4735', '4736');
INSERT INTO "public"."sections" VALUES (358, '362', '4683', '4684', '4686', '4687', '4688', '4689', '4690', '4691', '4692', '4693');
INSERT INTO "public"."sections" VALUES (359, '356', '4607', '4608', '4610', '4611', '4612', '4613', '4614', '4615', '4616', '4617');
INSERT INTO "public"."sections" VALUES (360, '340', '4401', '4402', '4404', '4405', '4406', '4407', '4408', '4409', '4410', '4411');
INSERT INTO "public"."sections" VALUES (361, '343', '4429', '4430', '4432', '4433', '4434', '4435', '4436', '4437', '4438', '4439');
INSERT INTO "public"."sections" VALUES (362, '441', '5797', '5798', '5800', '5801', '5802', '5803', '5804', '5805', '5806', '5807');
INSERT INTO "public"."sections" VALUES (363, '436', '5738', '5739', '5741', '5742', '5743', '5744', '5745', '5746', '5747', '5748');
INSERT INTO "public"."sections" VALUES (364, '475', '6256', '6258', '6262', '6265', '6267', '6268', '6269', '6270', '6271', '6275');
INSERT INTO "public"."sections" VALUES (365, '998', '13351', '13352', '13354', '13355', '13356', '13357', '13358', '13359', '13360', '13361');
INSERT INTO "public"."sections" VALUES (366, '1073', '14502', '14503', '14505', '14506', '14507', '14508', '14509', '14510', '14511', '14512');
INSERT INTO "public"."sections" VALUES (367, '996', '13335', '13336', '13338', '13339', '13340', '13341', '13342', '13343', '13344', '13345');
INSERT INTO "public"."sections" VALUES (368, '452', '5899', '5900', '5902', '5903', '5904', '5905', '5906', '5907', '5908', '5909');
INSERT INTO "public"."sections" VALUES (369, '521', '6888', '6889', '6891', '6892', '6893', '6894', '6895', '6896', '6897', '6898');
INSERT INTO "public"."sections" VALUES (370, '515', '6796', '6797', '6799', '6800', '6801', '6802', '0', '0', '6805', '0');
INSERT INTO "public"."sections" VALUES (371, '509', '6696', '6697', '6699', '6700', '6701', '6702', '6703', '6704', '6705', '6706');
INSERT INTO "public"."sections" VALUES (372, '3', '5529', '5530', '5532', '5533', '5534', '5535', '5536', '5537', '5538', '5539');
INSERT INTO "public"."sections" VALUES (373, '112', '1552', '1553', '1555', '1556', '1557', '1558', '1559', '1560', '1561', '1562');
INSERT INTO "public"."sections" VALUES (374, '493', '6528', '6529', '6531', '6532', '6533', '6534', '6535', '6536', '6537', '6538');
INSERT INTO "public"."sections" VALUES (375, '1070', '14430', '14431', '14433', '14434', '14435', '14436', '14437', '14438', '14439', '14440');
INSERT INTO "public"."sections" VALUES (376, '1069', '14415', '14416', '14418', '14419', '14420', '14421', '14422', '14423', '14424', '14425');
INSERT INTO "public"."sections" VALUES (377, '1067', '14385', '14386', '14388', '14389', '14390', '14391', '14392', '14393', '14394', '14395');
INSERT INTO "public"."sections" VALUES (378, '1063', '14325', '14326', '14328', '14329', '14330', '14331', '14332', '14333', '14334', '14335');
INSERT INTO "public"."sections" VALUES (379, '1061', '14295', '14296', '14298', '14299', '14300', '14301', '14302', '14303', '14304', '14305');
INSERT INTO "public"."sections" VALUES (380, '465', '6125', '6126', '6128', '6129', '6130', '6131', '6132', '6133', '6134', '6135');
INSERT INTO "public"."sections" VALUES (381, '1059', '14265', '14266', '14268', '14269', '14270', '14271', '14272', '14273', '14274', '14275');
INSERT INTO "public"."sections" VALUES (382, '1066', '14370', '14371', '14373', '14374', '14375', '14376', '14377', '14378', '14379', '14380');
INSERT INTO "public"."sections" VALUES (383, '1064', '14340', '14341', '14343', '14344', '14345', '14346', '14347', '14348', '14349', '14350');
INSERT INTO "public"."sections" VALUES (384, '1058', '14250', '14251', '14253', '14254', '14255', '14256', '14257', '14258', '14259', '14260');
INSERT INTO "public"."sections" VALUES (385, '1057', '14232', '14233', '14235', '14236', '14237', '14238', '14239', '14240', '14241', '14242');
INSERT INTO "public"."sections" VALUES (386, '1056', '14216', '14217', '14219', '14220', '14221', '14222', '14223', '14224', '14225', '14226');
INSERT INTO "public"."sections" VALUES (387, '355', '4592', '4593', '4595', '4596', '4597', '4598', '4599', '4600', '4601', '4602');
INSERT INTO "public"."sections" VALUES (388, '347', '11435', '4475', '4477', '4478', '4479', '4480', '4481', '4482', '4483', '4484');
INSERT INTO "public"."sections" VALUES (389, '1051', '14113', '14114', '14116', '14117', '14118', '14119', '14120', '14121', '14122', '14123');
INSERT INTO "public"."sections" VALUES (390, '1050', '14141', '14142', '14144', '14145', '14146', '14147', '14148', '14149', '14150', '14151');
INSERT INTO "public"."sections" VALUES (391, '229', '2976', '2977', '2979', '2980', '2981', '2982', '2983', '2984', '2985', '2986');
INSERT INTO "public"."sections" VALUES (392, '1048', '14096', '14097', '14099', '14100', '14101', '14102', '14103', '14104', '14105', '14106');
INSERT INTO "public"."sections" VALUES (393, '1047', '14081', '14082', '14084', '14085', '14086', '14087', '14088', '14089', '14090', '14091');
INSERT INTO "public"."sections" VALUES (394, '431', '5655', '5656', '5658', '5659', '5660', '5661', '5662', '5663', '5664', '5665');
INSERT INTO "public"."sections" VALUES (395, '1052', '14156', '14157', '14159', '14160', '14161', '14162', '14163', '14164', '14165', '14166');
INSERT INTO "public"."sections" VALUES (396, '454', '5955', '5956', '5958', '5964', '5966', '5967', '5968', '5969', '5970', '5972');
INSERT INTO "public"."sections" VALUES (397, '2', '5598', '5599', '5601', '5602', '5603', '5604', '5605', '5606', '5607', '5608');
INSERT INTO "public"."sections" VALUES (398, '1065', '14355', '14356', '14358', '14359', '14360', '14361', '14362', '14363', '14364', '14365');
INSERT INTO "public"."sections" VALUES (399, '1068', '14400', '14401', '14403', '14404', '14405', '14406', '14407', '14408', '14409', '14410');
INSERT INTO "public"."sections" VALUES (400, '494', '6558', '6559', '6561', '6562', '6563', '6564', '6565', '6566', '6567', '6568');
INSERT INTO "public"."sections" VALUES (401, '445', '5826', '5827', '5829', '5835', '5837', '5838', '5839', '5840', '5841', '5842');
INSERT INTO "public"."sections" VALUES (402, '870', '10416', '10417', '10419', '10420', '10421', '10422', '10423', '10424', '10425', '10426');
INSERT INTO "public"."sections" VALUES (403, '869', '10377', '10378', '10380', '10381', '10382', '10383', '10384', '10385', '10386', '10387');
INSERT INTO "public"."sections" VALUES (404, '393', '5164', '5165', '5167', '5168', '5169', '5170', '5171', '5172', '5173', '5174');
INSERT INTO "public"."sections" VALUES (405, '383', '5018', '5019', '5021', '5022', '5023', '5024', '5025', '5026', '5027', '5028');
INSERT INTO "public"."sections" VALUES (406, '378', '4944', '4945', '4947', '4948', '4949', '4950', '4951', '4952', '4953', '4954');
INSERT INTO "public"."sections" VALUES (407, '772', '9302', '9303', '9305', '9306', '9307', '9308', '9309', '9310', '9311', '9312');
INSERT INTO "public"."sections" VALUES (408, '373', '4860', '4861', '4863', '4864', '4865', '4866', '4867', '4868', '4869', '4870');
INSERT INTO "public"."sections" VALUES (409, '767', '9271', '9272', '9274', '9275', '9276', '9277', '9278', '9279', '9280', '9281');
INSERT INTO "public"."sections" VALUES (410, '874', '10519', '10520', '10522', '10523', '10524', '10525', '10526', '10527', '10528', '10529');
INSERT INTO "public"."sections" VALUES (411, '149', '2004', '2005', '2007', '2008', '2009', '2010', '2011', '2012', '2013', '2014');
INSERT INTO "public"."sections" VALUES (412, '872', '10480', '10481', '10483', '10484', '10485', '10486', '10487', '10488', '10489', '10490');
INSERT INTO "public"."sections" VALUES (413, '405', '5339', '5340', '5342', '5343', '5344', '5345', '5346', '5347', '5348', '5349');
INSERT INTO "public"."sections" VALUES (414, '403', '5309', '5310', '5312', '5313', '5314', '5315', '5316', '5317', '5318', '5319');
INSERT INTO "public"."sections" VALUES (415, '400', '5264', '5265', '5267', '5268', '5269', '5270', '5271', '5272', '5273', '5274');
INSERT INTO "public"."sections" VALUES (416, '397', '5219', '5220', '5222', '5223', '5224', '5225', '5226', '5227', '5228', '5229');
INSERT INTO "public"."sections" VALUES (417, '811', '9562', '9563', '9565', '9566', '9567', '9568', '9569', '9570', '9571', '9572');
INSERT INTO "public"."sections" VALUES (418, '146', '2017', '2018', '2020', '2021', '2022', '2023', '2024', '2025', '2026', '2027');
INSERT INTO "public"."sections" VALUES (419, '145', '1944', '1945', '1947', '1948', '1949', '1950', '1951', '1952', '1953', '1954');
INSERT INTO "public"."sections" VALUES (420, '142', '1914', '1915', '1917', '1918', '1919', '1920', '1921', '1922', '1923', '1924');
INSERT INTO "public"."sections" VALUES (421, '141', '1899', '1900', '1902', '1903', '1904', '1905', '1906', '1907', '1908', '1909');
INSERT INTO "public"."sections" VALUES (422, '139', '1871', '1872', '1874', '1875', '1876', '1877', '1878', '1879', '1880', '1881');
INSERT INTO "public"."sections" VALUES (423, '137', '1842', '1843', '1845', '1846', '1847', '1848', '1849', '1850', '1851', '1852');
INSERT INTO "public"."sections" VALUES (424, '128', '1767', '1768', '1770', '1771', '0', '1773', '0', '0', '1776', '0');
INSERT INTO "public"."sections" VALUES (425, '215', '12659', '12660', '12662', '12663', '12664', '12665', '12666', '12667', '12668', '12669');
INSERT INTO "public"."sections" VALUES (426, '212', '2780', '2781', '2783', '2784', '2785', '2786', '2787', '2788', '2789', '2790');
INSERT INTO "public"."sections" VALUES (427, '211', '9631', '9632', '9634', '9635', '9636', '9637', '9638', '9639', '9640', '9641');
INSERT INTO "public"."sections" VALUES (428, '208', '9644', '9645', '9647', '9648', '9649', '9650', '9651', '9652', '9653', '9654');
INSERT INTO "public"."sections" VALUES (429, '206', '2707', '2708', '2710', '2711', '2712', '2713', '2714', '2715', '2716', '2717');
INSERT INTO "public"."sections" VALUES (430, '293', '9940', '9941', '9943', '9944', '9945', '9946', '9947', '9948', '9949', '9950');
INSERT INTO "public"."sections" VALUES (431, '291', '3809', '3810', '3812', '3813', '3814', '3815', '3816', '3817', '3818', '3819');
INSERT INTO "public"."sections" VALUES (432, '290', '3794', '3795', '3797', '3798', '3799', '3800', '3801', '3802', '3803', '3804');
INSERT INTO "public"."sections" VALUES (433, '289', '3766', '3767', '3769', '3770', '3771', '3772', '3773', '3774', '3775', '3776');
INSERT INTO "public"."sections" VALUES (434, '287', '3751', '3752', '3754', '3755', '3756', '3758', '3759', '3760', '3761', '3762');
INSERT INTO "public"."sections" VALUES (435, '842', '9912', '9913', '9915', '9916', '9917', '9918', '0', '0', '9921', '0');
INSERT INTO "public"."sections" VALUES (436, '841', '9897', '9898', '9900', '9901', '9902', '9903', '0', '0', '9906', '0');
INSERT INTO "public"."sections" VALUES (437, '839', '9867', '9868', '9870', '9871', '9872', '9873', '9874', '9875', '9876', '9877');
INSERT INTO "public"."sections" VALUES (438, '838', '12644', '12645', '12647', '12648', '12649', '12650', '12651', '12652', '12653', '12654');
INSERT INTO "public"."sections" VALUES (439, '837', '9837', '9838', '9840', '9841', '9842', '9843', '9844', '9845', '9846', '9847');
INSERT INTO "public"."sections" VALUES (440, '136', '1826', '1827', '1829', '1830', '1831', '1832', '1833', '1834', '1835', '1836');
INSERT INTO "public"."sections" VALUES (441, '835', '9792', '9793', '9795', '9796', '9797', '9798', '9799', '9800', '9801', '9802');
INSERT INTO "public"."sections" VALUES (442, '134', '1812', '1813', '1815', '1816', '1817', '1818', '1819', '1820', '1821', '1822');
INSERT INTO "public"."sections" VALUES (443, '1027', '13788', '13789', '13791', '13792', '13793', '13794', '13795', '13796', '13797', '13798');
INSERT INTO "public"."sections" VALUES (444, '1026', '13773', '13774', '13776', '13777', '13778', '13779', '13780', '13781', '13782', '13783');
INSERT INTO "public"."sections" VALUES (445, '1025', '13758', '13759', '13761', '13762', '13763', '13764', '13765', '13766', '13767', '13768');
INSERT INTO "public"."sections" VALUES (446, '1024', '13743', '13744', '13746', '13747', '13748', '13749', '13750', '13751', '13752', '13753');
INSERT INTO "public"."sections" VALUES (447, '1023', '13728', '13729', '13731', '13732', '13733', '13734', '13735', '13736', '13737', '13738');
INSERT INTO "public"."sections" VALUES (448, '1022', '13713', '13714', '13716', '13717', '13718', '13719', '13720', '13721', '13722', '13723');
INSERT INTO "public"."sections" VALUES (449, '1021', '13698', '13699', '13701', '13702', '13703', '13704', '13705', '13706', '13707', '13708');
INSERT INTO "public"."sections" VALUES (450, '1020', '13683', '13684', '13686', '13687', '13688', '13689', '13690', '13691', '13692', '13693');
INSERT INTO "public"."sections" VALUES (451, '1019', '13668', '13669', '13671', '13672', '13673', '13674', '13675', '13676', '13677', '13678');
INSERT INTO "public"."sections" VALUES (452, '1018', '13653', '13654', '13656', '13657', '13658', '13659', '13660', '13661', '13662', '13663');
INSERT INTO "public"."sections" VALUES (453, '1017', '13638', '13639', '13641', '13642', '13643', '13644', '13645', '13646', '13647', '13648');
INSERT INTO "public"."sections" VALUES (454, '1016', '13623', '13624', '13626', '13627', '13628', '13629', '13630', '13631', '13632', '13633');
INSERT INTO "public"."sections" VALUES (455, '1014', '13593', '13594', '13596', '13597', '13598', '13599', '13600', '13601', '13602', '13603');
INSERT INTO "public"."sections" VALUES (456, '530', '6994', '6995', '6997', '6998', '6999', '7000', '7001', '7002', '7003', '7004');
INSERT INTO "public"."sections" VALUES (457, '529', '6965', '6966', '6968', '6969', '6970', '6971', '6972', '6973', '6974', '6975');
INSERT INTO "public"."sections" VALUES (458, '528', '6951', '6952', '6954', '6955', '6956', '6957', '6958', '6959', '6960', '6961');
INSERT INTO "public"."sections" VALUES (459, '525', '6924', '6925', '6927', '6928', '6929', '6930', '6931', '6932', '6933', '6934');
INSERT INTO "public"."sections" VALUES (460, '522', '6881', '6882', '6884', '6899', '6900', '6901', '6902', '6903', '6904', '6905');
INSERT INTO "public"."sections" VALUES (461, '520', '6867', '6868', '6870', '6871', '6872', '6873', '6874', '6875', '6876', '6877');
INSERT INTO "public"."sections" VALUES (462, '518', '6824', '6825', '6827', '6828', '6829', '6830', '6831', '6832', '6833', '6834');
INSERT INTO "public"."sections" VALUES (463, '517', '6811', '6812', '6814', '6815', '6816', '6817', '6818', '6819', '6820', '6821');
INSERT INTO "public"."sections" VALUES (464, '359', '4653', '4654', '4656', '4657', '4658', '4659', '4660', '4661', '4662', '4663');
INSERT INTO "public"."sections" VALUES (465, '524', '6938', '6939', '6941', '6942', '6943', '6944', '6945', '6946', '6947', '6948');
INSERT INTO "public"."sections" VALUES (466, '516', '6852', '6853', '6855', '6856', '6857', '6858', '6859', '6860', '6861', '6862');
INSERT INTO "public"."sections" VALUES (467, '507', '6709', '6710', '6712', '6713', '6714', '6715', '6716', '6717', '6718', '6719');
INSERT INTO "public"."sections" VALUES (468, '500', '6637', '6640', '6644', '6646', '6649', '6651', '6654', '6657', '6658', '6659');
INSERT INTO "public"."sections" VALUES (469, '1072', '14460', '14461', '14463', '14464', '14465', '14466', '14467', '14468', '14469', '14470');
INSERT INTO "public"."sections" VALUES (470, '868', '12010', '12011', '12013', '12014', '12015', '12016', '12017', '12018', '12019', '12020');
INSERT INTO "public"."sections" VALUES (471, '618', '8079', '8080', '8082', '8083', '8084', '8085', '8086', '8087', '8088', '8089');
INSERT INTO "public"."sections" VALUES (472, '612', '8019', '8020', '8022', '8023', '8024', '8025', '8026', '8027', '8028', '8029');
INSERT INTO "public"."sections" VALUES (473, '608', '7963', '7964', '7966', '7967', '7968', '7969', '7970', '7971', '7972', '7973');
INSERT INTO "public"."sections" VALUES (474, '600', '7863', '7864', '7866', '7867', '7868', '7869', '7870', '7871', '7872', '7873');
INSERT INTO "public"."sections" VALUES (475, '514', '12182', '12183', '12185', '12186', '12187', '12188', '12189', '12190', '12191', '12192');
INSERT INTO "public"."sections" VALUES (476, '1038', '13946', '13947', '13949', '13950', '13951', '13952', '13953', '13954', '13955', '13956');
INSERT INTO "public"."sections" VALUES (477, '1037', '13931', '13932', '13934', '13935', '13936', '13937', '0', '0', '13940', '13941');
INSERT INTO "public"."sections" VALUES (478, '1036', '13916', '13917', '13919', '13920', '13921', '13922', '13923', '13924', '13925', '13926');
INSERT INTO "public"."sections" VALUES (479, '1034', '13886', '13887', '13889', '13890', '13891', '13892', '13893', '13894', '13895', '13896');
INSERT INTO "public"."sections" VALUES (480, '1033', '13871', '13872', '13874', '13875', '13876', '13877', '13878', '13879', '13880', '13881');
INSERT INTO "public"."sections" VALUES (481, '1032', '13856', '13857', '13859', '13860', '13861', '13862', '13863', '13864', '13865', '13866');
INSERT INTO "public"."sections" VALUES (482, '1031', '13841', '13842', '13844', '13845', '13846', '13847', '13848', '13849', '13850', '13851');
INSERT INTO "public"."sections" VALUES (483, '170', '2275', '2276', '2278', '2279', '2280', '2281', '2282', '2283', '2284', '2285');
INSERT INTO "public"."sections" VALUES (484, '982', '13122', '13123', '13125', '13126', '13127', '13128', '13129', '13130', '13131', '13132');
INSERT INTO "public"."sections" VALUES (485, '981', '13107', '13108', '13110', '13111', '13112', '13113', '13114', '13115', '13116', '13117');
INSERT INTO "public"."sections" VALUES (486, '980', '13092', '13093', '13095', '13096', '13097', '13098', '13099', '13100', '13101', '13102');
INSERT INTO "public"."sections" VALUES (487, '979', '13077', '13078', '13080', '13081', '13082', '13083', '13084', '13085', '13086', '13087');
INSERT INTO "public"."sections" VALUES (488, '976', '13048', '13049', '13051', '13052', '13053', '13054', '13055', '13056', '13057', '13058');
INSERT INTO "public"."sections" VALUES (489, '353', '4564', '4565', '4567', '4568', '4569', '4570', '4571', '4572', '4573', '4574');
INSERT INTO "public"."sections" VALUES (490, '37', '502', '503', '505', '506', '508', '509', '510', '511', '512', '513');
INSERT INTO "public"."sections" VALUES (491, '34', '470', '471', '473', '474', '475', '476', '477', '478', '479', '480');
INSERT INTO "public"."sections" VALUES (492, '12', '382', '383', '0', '0', '387', '402', '403', '404', '405', '406');
INSERT INTO "public"."sections" VALUES (493, '10', '142', '143', '145', '146', '147', '148', '149', '150', '151', '152');
INSERT INTO "public"."sections" VALUES (494, '9', '127', '128', '130', '131', '132', '133', '134', '135', '136', '137');
INSERT INTO "public"."sections" VALUES (495, '8', '112', '113', '115', '116', '117', '118', '119', '120', '121', '122');
INSERT INTO "public"."sections" VALUES (496, '6', '80', '81', '83', '84', '85', '86', '87', '88', '89', '90');
INSERT INTO "public"."sections" VALUES (497, '63', '872', '873', '875', '876', '877', '878', '879', '880', '881', '882');
INSERT INTO "public"."sections" VALUES (498, '60', '856', '857', '859', '860', '861', '862', '863', '864', '865', '866');
INSERT INTO "public"."sections" VALUES (499, '55', '810', '811', '0', '0', '815', '0', '817', '818', '0', '820');
INSERT INTO "public"."sections" VALUES (500, '51', '717', '718', '720', '721', '723', '724', '725', '726', '727', '728');
INSERT INTO "public"."sections" VALUES (501, '48', '670', '671', '673', '674', '675', '676', '677', '678', '679', '680');
INSERT INTO "public"."sections" VALUES (502, '46', '654', '655', '657', '658', '659', '660', '661', '662', '663', '664');
INSERT INTO "public"."sections" VALUES (503, '43', '624', '625', '627', '628', '629', '630', '631', '632', '633', '634');
INSERT INTO "public"."sections" VALUES (504, '39', '548', '549', '551', '552', '553', '554', '555', '556', '557', '558');
INSERT INTO "public"."sections" VALUES (3, '252', '3314', '3315', '0', '0', '3319', '3320', '3321', '3322', '3323', '3324');
INSERT INTO "public"."sections" VALUES (29, '305', '3963', '3964', '3966', '3967', '3968', '3969', '3970', '3971', '3972', '3973');

-- ----------------------------
-- Table structure for subject_posts
-- ----------------------------
DROP TABLE IF EXISTS "public"."subject_posts";
CREATE TABLE "public"."subject_posts" (
  "id" int4 NOT NULL DEFAULT nextval('subject_posts_id_seq'::regclass),
  "post_id" int4 NOT NULL,
  "post_title" varchar(128) COLLATE "pg_catalog"."default" NOT NULL,
  "post_teacher" text COLLATE "pg_catalog"."default" NOT NULL,
  "post_datetime" int8 NOT NULL,
  "post_content" text COLLATE "pg_catalog"."default" NOT NULL,
  "attachmentLink" text COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Records of subject_posts
-- ----------------------------
INSERT INTO "public"."subject_posts" VALUES (5, 19248, 'Rezultati II kolokvijuma', 'Milan Milosavljević', 1590040680000, '<div >
 <p>Rezultati II kolokvijuma<br></p>
 <div class="attachedimages"></div>
</div>', '[{"attachmentLink":"http://predmet.singidunum.ac.rs/pluginfile.php/7778/mod_forum/attachment/19343/VI%20-%20II%20kolokvijum.pdf","attachmentTitle":"VI - II kolokvijum.pdf"}]');
INSERT INTO "public"."subject_posts" VALUES (7, 19758, 'Popravni kolokvijumi (I i II)', 'Ana Obradović', 1591077840000, '<div >
 <p>Poštovane koleginice i kolege,</p>
 <p>Popravni I i II kolokvijum iz predmeta Računovodstvo održaće se u&nbsp;<b>utorak 09.06.2020. godine</b>&nbsp;prema sledećem rasporedu:</p>
 <p><b>GRUPA 2:</b></p>
 <p>-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>09:45 – 10:00 časova – popravni I kolokvijum</b></p>
 <p>-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>10:00 – 10:30 časova – popravni II kolokvijum</b></p>
 <p><b>GRUPA 1 I STUDENTI U RADNOM ODNOSU:</b></p>
 <p>-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>17:45 – 18:00 časova – popravni I kolokvijum</b></p>
 <p>-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>18:00 – 18:30 časova – popravni II kolokvijum</b></p>
 <p><b>Važne napomene: Pre popravnih kolokvijuma biće održan po jedan čas vežbi u terminima obe grupe. Na popravnim kolokvijumima računaju se poslednji ostvareni rezultati. U slučaju nepoštovanja grupe, rezultat neće biti priznat.</b></p>
 <p>Oba kolokvijuma se rade u formi elektronskog testa. Vreme izrade kolokvijuma je 15 minuta za I kolokvijum, odnosno 30 minuta za II kolokvijum.</p>
 <p>Strukturu I i II kolokvijuma možete pogledati na sledećem linku:&nbsp;<a href="http://predmet.singidunum.ac.rs/mod/page/view.php?id=3443" target="_blank" rel="noreferrer noopener">http://predmet.singidunum.ac.rs/mod/page/view.php?id=3443</a></p>
 <p>Kolokvijum će se realizovati putem elektronske platforme mTutor, pristupom putem linka:&nbsp;<a href="https://testus.singidunum.ac.rs/" target="_blank" rel="noreferrer noopener">https://testus.singidunum.ac.rs/&nbsp;</a></p>
 <p><b>Izrada kolokvijuma:&nbsp;</b>Test se realizuje samostalno na osnovu sopstvenog znanja i pripremljenog kolokvijuma. Platforma poseduje zaštitne mehanizme kako bi se osujetili pokušaji manipulacije testom.&nbsp;</p>
 <p>•&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Test radite sa stabilne, po mogućstvu žičane Internet veze.</p>
 <p>•&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Preporuka je da za vreme izrade testa koristite Google Chrome ili Mozilla Firefox pretraživač.&nbsp;</p>
 <p>•&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;U vreme testa potrebno je da od programskih paketa bude aktivan samo pretraživač (browser) otvoren sa samo jednim tab-om u okviru koga će se realizovati test.</p>
 <p>•&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Preporuka je da za vreme testa ugasite firewall i/ili antivirusni softver.</p>
 <p>•&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>Upotreba kamere je obavezna&nbsp;</b>– studenti koji nemaju kameru na svojim računarima mogu pristupiti izradi testa korišćenjem pametnog telefona (pristupa se linku platforme mTutor)</p>
 <p>•&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>Maksimalno kašnjenje za početak testa je pet minuta, nakon toga neće biti moguće ponovo pokrenuti test.</b></p>
 <p>•&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>Za prijavu na sistem koristi se broj indeksa u formatu godina upisa, pa broj indeksa bez znakova interpunkcije npr: 2017123456. Nakon prijave odabraćete test i pokrenuti rad.</b></p>
 <p>Sve vreme trajanja testa predmetni profesor biće dostupan na Google Meet platformi kako bi odgovorio na eventualne tehničke probleme pri pokretanju testa. Na link se prijavljujete isključivo ukoliko se javio neki problem. Link za Google Meet:&nbsp;<a href="https://meet.google.com/pap-didh-vzf" target="_blank" rel="noreferrer noopener">https://meet.google.com/pap-didh-vzf</a></p>
 <p><br></p>
 <p>Želimo vam puno uspeha.</p>
 <p>Vule Mizdraković</p>
 <p>Ana Obradović</p>
 <div class="attachedimages"></div>
</div>', '[]');
INSERT INTO "public"."subject_posts" VALUES (8, 19988, 'Popravni kolokvijum', 'Uroš Arnaut', 1591282440000, '<div >
 Poštovane koleginice i kolege,
 <p><br></p>
 <p>Naredne, XV nastavne nedelje možete da radite popravni prvog kolokvijuma u terminu vežbi. Popravni će se održati 08.06.2020. godine na drugom času. Dakle raspored je sledeći:</p>
 <p></p>
 <ul>
  <li>Od 10:00 održaće se redovan termin vežbi do 10:45</li>
  <li>Od 11:05 održaće se popravni prvi kolokvijum (elektronski test)</li>
  <li>Drugi kolokvijum se popravlja u ispitnom roku u vidu završnog projekta</li>
 </ul>
 <p>Kada su u pitanju pravila vezana za polaganje prvog kolokvijuma, važe ista ona koja možete pronaći na obaveštenjima za prethodna polaganja. U daljem tekstu se možete podsetiti pravila koja su važila ranije. Uz napomenu da je obavezno korišćenje kamere.</p>
 <p></p>
 <p><span lang="sr-latn-rs" xml:lang="sr-latn-rs">I Kolokvijum se radi u formi elektronskog testa. Vreme izrade kolokvijuma je 25 minuta, test sadrži 30 pitanja.</span></p>
 <p><span lang="sr-latn-rs" xml:lang="sr-latn-rs">Pitanja su formirana iz knjige: Razvoj mobilnih aplikacija, Android Java programiranje, Univerzitet Singidunum, M. Živković, 2020. kao i iz slajdova sa predavanja i vežbi predviđenih za prvi kolokvijum.</span></p>
 <p><span lang="sr-latn-rs" xml:lang="sr-latn-rs">Gradivo obuhvaćeno prvim kolokvijumom u udžbeniku obrađeno je kroz poglavlja:</span></p>
 <p></p>
 <ol>
  <li><span lang="sr-latn-rs" xml:lang="sr-latn-rs">Uvod,</span></li>
  <li><span lang="sr-latn-rs" xml:lang="sr-latn-rs">Android platforma,</span></li>
  <li><span lang="sr-latn-rs" xml:lang="sr-latn-rs">Android Studio</span></li>
  <li><span lang="sr-latn-rs" xml:lang="sr-latn-rs">Grafički korisnički interfejs</span></li>
  <li><span lang="sr-latn-rs" xml:lang="sr-latn-rs">Aktivnosti</span></li>
  <li><span lang="sr-latn-rs" xml:lang="sr-latn-rs">Niti</span></li>
 </ol>
 <p><span lang="sr-latn-rs" xml:lang="sr-latn-rs">Gradivo obuhvaćeno prvim kolokvijumom takođe sadrži pitanja iz prezentacija i praktičnih primera sa stranice predmeta iz sekcije Predavanja – gradivo za prvi kolokvijum, kao i iz materijala koji se nalaze u sekciji Vežbe – gradivo za prvi kolokvijum.</span></p>
 <p><span lang="sr-latn-rs" xml:lang="sr-latn-rs">Kolokvijum će se realizovati putem elektronske platforme mTutor, pristupom putem linka:&nbsp;<a href="https://test.singidunum.ac.rs/"><b>https://test.singidunum.ac.rs/</b></a></span></p>
 <p><span lang="sr-latn-rs" xml:lang="sr-latn-rs">u&nbsp;<b>11:05</b>&nbsp;časova za sve brojeve indeksa. Zaposleni studenti rade kolokvijum po istim pravilima kao i regularni studenti.</span></p>
 <p><span lang="sr-latn-rs" xml:lang="sr-latn-rs">Test se realizuje samostalno na osnovu sopstvenog znanja i pripremljenog ispita. Platforma poseduje zaštitne mehanizme kako bi se osujetili pokušaji manipulacije testom.</span></p>
 <p><span lang="sr-latn-rs" xml:lang="sr-latn-rs"></span></p>
 <ul>
  <li><span lang="sr-latn-rs" xml:lang="sr-latn-rs">Test radite sa stabilne, po mogućstvu žične Internet veze.</span></li>
  <li><span lang="sr-latn-rs" xml:lang="sr-latn-rs">Preporuka je da za vreme izrade testa koristite&nbsp;<b>Google Chrome</b>&nbsp;ili&nbsp;<b>Mozilla Firefox</b>&nbsp;Internet pregledač.</span></li>
  <li>U vreme testa potrebno je da od programskih paketa bude aktivan samo pregledač (browser) otvoren sa samo jednim tab-om u okviru koga će se realizovati test.</li>
 </ul>
 <p><b>⚠️ Maksimalno kašnjenje za početak testa je 5 minuta, nakon toga neće biti moguće ponovo pokrenuti test.</b><br></p>
 <p><span lang="sr-latn-rs" xml:lang="sr-latn-rs">Za prijavu na sistem koristi se broj indeksa u formatu godina upisa, pa broj indeksa bez znakova interpunkcije npr: 2017123456. Nakon prijave odabraćete test i pokrenuti rad.</span></p>
 <p><span lang="sr-latn-rs" xml:lang="sr-latn-rs"></span></p>
 <p><span lang="sr-latn-rs" xml:lang="sr-latn-rs">⚠️&nbsp;<b>Napomene</b>:</span></p>
 <p><span lang="sr-latn-rs" xml:lang="sr-latn-rs"></span></p>
 <ul>
  <li><b>Za elektronski test obavezna je upotreba kamere za davanje validnosti rezultatu testa.</b></li>
  <li><b>Studenti će moći da pokrenu test i bez odobravanja pristupa kameri (ukoliko nemaju raspoloživu kameru na računaru). U tom slučaju, student treba da instalira Google Meet aplikaciju na mobilnom telefonu i aktivira je za vreme izrade kolokvijuma prijavljivanjem na link na kome će biti aktivan asistent</b>:&nbsp;<span lang="sr-latn-rs" xml:lang="sr-latn-rs"><a href="https://meet.google.com/iyr-teaz-hva" target="_blank" rel="noreferrer noopener"><b>https://meet.google.com/iyr-teaz-hva</b></a></span></li>
  <li>Međutim, u slučaju da student ne pokrene test sa odobrenjem korišćenja kamere, profesor će zakazati usmenu odbranu rezultata testa, video prenosom preko Google Meet platforme, sa obaveznim korišćenjem kamere sa strane studenta za vreme trajanja usmenog ispitivanja.</li>
 </ul>
 <p><span lang="sr-latn-rs" xml:lang="sr-latn-rs">Sve vreme trajanja testa predmetni profesor i asistent biće dostupni na Google Meet platformi kako bi odgovorili na eventualne tehničke probleme pri pokretanju testa. Na link se prijavljujete isključivo ukoliko se javio neki problem ili ukoliko koristite mobilnu Google Meet aplikaciju za davanje validnosti testu. Link za Google Meet:&nbsp;<a href="https://meet.google.com/iyr-teaz-hva" target="_blank" rel="noreferrer noopener"><b>https://meet.google.com/iyr-teaz-hva</b></a></span></p>
 <p><span lang="sr-latn-rs" xml:lang="sr-latn-rs"></span></p>
 <p><span lang="sr-latn-rs" xml:lang="sr-latn-rs">&nbsp;</span></p>
 <p><span lang="sr-latn-rs" xml:lang="sr-latn-rs">Želimo vam srećan i uspešan rad.</span></p>
 <div class="attachedimages"></div>
</div>', '[]');
INSERT INTO "public"."subject_posts" VALUES (9, 16705, 'Važno obaveštenje!', 'Uroš Arnaut', 1586432760000, '<div >
 <p>Poštovane koleginice i kolege,</p>
 <p>Samo za studente kojima se poklapaju termini kolokvijuma sa drugim praktikumima mogu da polažu u terminu od 20.00 časova, ali uz obavezno slanje mejla i predmetnom profesoru i asistentu.</p>
 <div class="attachedimages"></div>
</div>', '[]');
INSERT INTO "public"."subject_posts" VALUES (10, 15814, 'Elektronska realizacija I kolokvijum', 'Miodrag Živković', 1585841280000, '<div >
 <p></p>
 <p><span lang="sr-latn-rs" xml:lang="sr-latn-rs">Poštovane koleginice i kolege,</span></p> 
 <p><span lang="sr-latn-rs" xml:lang="sr-latn-rs">Za četvrtak, 09.04.2020. u 19 časova zakazan je I kolokvijum iz predmeta Razvoj mobilnih aplikacija (za oba smera, IR i SII).</span></p> 
 <p><span lang="sr-latn-rs" xml:lang="sr-latn-rs">I Kolokvijum se radi u formi elektronskog testa. Vreme izrade kolokvijuma je 25 minuta, test sadrži 30 pitanja. </span></p> 
 <p><span lang="sr-latn-rs" xml:lang="sr-latn-rs">Pitanja su formirana iz knjige: Razvoj mobilnih aplikacija, Android Java programiranje, Univerzitet Singidunum, M. Živković, 2020. kao i iz slajdova sa predavanja i vežbi predviđenih za prvi kolokvijum. </span></p> 
 <p><span lang="sr-latn-rs" xml:lang="sr-latn-rs">Gradivo obuhvaćeno prvim kolokvijumom u udžbeniku obrađeno je kroz poglavlja:</span></p> 
 <p><span lang="sr-latn-rs" xml:lang="sr-latn-rs">1. Uvod, </span></p> 
 <p><span lang="sr-latn-rs" xml:lang="sr-latn-rs">2. Android platforma, </span></p> 
 <p><span lang="sr-latn-rs" xml:lang="sr-latn-rs">3. Android Studio</span></p> 
 <p><span lang="sr-latn-rs" xml:lang="sr-latn-rs">4. Grafički korisnički interfejs</span></p> 
 <p><span lang="sr-latn-rs" xml:lang="sr-latn-rs">5. Aktivnosti</span></p> 
 <p><span lang="sr-latn-rs" xml:lang="sr-latn-rs">6. Niti</span></p> 
 <p><span lang="sr-latn-rs" xml:lang="sr-latn-rs">Gradivo obuhvaćeno prvim kolokvijumom takođe sadrži pitanja iz prezentacija i praktičnih primera sa stranice predmeta iz sekcije Predavanja – gradivo za prvi kolokvijum, kao i iz materijala koji se nalaze u sekciji Vežbe – gradivo za prvi kolokvijum.</span></p> 
 <p><span lang="sr-latn-rs" xml:lang="sr-latn-rs">Kolokvijum će se realizovati putem elektronske platforme mTutor, pristupom putem linka: https://test.singidunum.ac.rs/ </span></p> 
 <p><span lang="sr-latn-rs" xml:lang="sr-latn-rs">u 19 časova za neparne brojeve indeksa, odnosno 19:30 za parne brojeve indeksa. Zaposleni studenti rade kolokvijum po istim pravilima kao i regularni studenti.</span></p> 
 <p><span lang="sr-latn-rs" xml:lang="sr-latn-rs">Test se realizuje samostalno na osnovu sopstvenog znanja i pripremljenog ispita. Platforma poseduje zaštitne mehanizme kako bi se osujetili pokušaji manipulacije testom. </span></p> 
 <p><span lang="sr-latn-rs" xml:lang="sr-latn-rs">Test radite sa stabilne, po mogućstvu žične Internet veze.</span></p> 
 <p><span lang="sr-latn-rs" xml:lang="sr-latn-rs">Preporuka je da za vreme izrade testa koristite Google Chrome ili Mozilla Firefox pretraživač. </span></p> 
 <p><span lang="sr-latn-rs" xml:lang="sr-latn-rs">U vreme testa potrebno je da od programskih paketa bude aktivan samo pretraživač (browser) otvoren sa samo jednim tab-om u okviru koga će se realizovati test.</span></p> 
 <p><span lang="sr-latn-rs" xml:lang="sr-latn-rs">Preporuka je da za vreme testa ugasite firewall i/ili antivirusni softver.</span></p> 
 <p><span lang="sr-latn-rs" xml:lang="sr-latn-rs">Maksimalno kašnjenje za početak testa je pet minuta, nakon toga neće biti moguće ponovo pokrenuti test.</span></p> 
 <p><span lang="sr-latn-rs" xml:lang="sr-latn-rs">Za prijavu na sistem koristi se broj indeksa u formatu godina upisa, pa broj indeksa bez znakova interpunkcije npr: 2017123456. Nakon prijave odabraćete test i pokrenuti rad.</span></p>
 <p><span lang="sr-latn-rs" xml:lang="sr-latn-rs"></span></p>
 <p><span lang="sr-latn-rs" xml:lang="sr-latn-rs">Napomena:</span></p>
 <p><span lang="sr-latn-rs" xml:lang="sr-latn-rs"></span></p>
 <ul>
  <li>Za elektronski test je preporučeno odobravanje pristupa kameri za davanje validnosti rezultatu testa.</li>
  <li>Studenti će moći da pokrenu test i bez odobravanja pristupa kameri.</li>
  <li>Međutim, u slučaju da student ne pokrene test sa odobrenjem korišćenja kamere, profesor može da zakaže usmenu odbranu rezultata testa, video prenosom preko Google Meet platforme, sa obaveznim korišćenjem kamere sa strane studenta za vreme trajanja usmenog ispitivanja.</li>
 </ul>
 <br> 
 <p><span lang="sr-latn-rs" xml:lang="sr-latn-rs">Sve vreme trajanja testa predmetni profesor i asistent biće dostupni na Google Meet platformi kako bi odgovorili na eventualne tehničke probleme pri pokretanju testa. Na link se prijavljujete isključivo ukoliko se javio neki problem. Link za Google Meet:&nbsp; </span><a href="https://meet.google.com/qgp-royz-uhg"><span lang="sr-latn-rs" xml:lang="sr-latn-rs">https://meet.google.com/qgp-royz-uhg</span></a><span lang="sr-latn-rs" xml:lang="sr-latn-rs"> </span></p> 
 <p><span lang="sr-latn-rs" xml:lang="sr-latn-rs">Rezultati kolokvijuma biće objavljeni u petak 10.04.2020. na stranici predmeta.</span></p> 
 <p><span lang="sr-latn-rs" xml:lang="sr-latn-rs">&nbsp;</span></p> 
 <p><span lang="sr-latn-rs" xml:lang="sr-latn-rs">Ukoliko iz nekog razloga ne budete u mogućnosti da test realizujete 09.04.2020., popravni kolokvijum biće organizovan u naknadnom terminu.</span></p> 
 <p><span lang="sr-latn-rs" xml:lang="sr-latn-rs">&nbsp;</span></p> 
 <p><span lang="sr-latn-rs" xml:lang="sr-latn-rs">Želimo vam srećan i uspešan rad.</span></p>
 <br>
 <div class="attachedimages"></div>
</div>', '[]');
INSERT INTO "public"."subject_posts" VALUES (11, 14428, 'Elektronske vežbe', 'Uroš Arnaut', 1584952380000, '<div >
 <p></p>
 <p dir="ltr"><b>Obaveštavaju se studenti da je, usled proglašenja vanrednog stanja na teritoriji Republike Srbije i zabrane okupljanja koja onemogućava održavanje nastave u prostorijama Univerziteta Singidunum, prema ranije određenim rasporedima, Univerzitet Singidunum obezbedio studentima mehanizam praćenja nastave od kuće korišćenjem platforme Google Meet.</b></p>
 <p dir="ltr"><b>Vežbe</b>&nbsp;iz predmeta Razvoj mobilnih aplikacija kod asistenta Uroša Arnauta će biti održane elektronskim putem u vidu video prenosa koji studenti mogu da prate putem linka<br><b><a href="https://meet.google.com/iyr-teaz-hva" target="_blank" rel="noreferrer noopener">https://meet.google.com/iyr-teaz-hva</a></b>&nbsp;prema ranije utvrđenom rasporedu nastave.</p><b></b>
 <p dir="ltr"><b>Studenti na Google Meet platformu ne moraju da se prijavljuju sa posebnim nalozima (da se loguju), već mogu direktno da prate predavanje otvaranjem gore navedenog linka, s tim da, zbog potrebe za preciznom evidencijom aktivnosti na nastavi, u delu gde je potrebno da unesu svoje ime, treba da upišu ime, prezime i broj indeksa. Studenti moraju obavezno da upišu svoj broj indeksa u polju za unos imena, pre pristupanja praćenju predavanja. Ukoliko slučajno zaborave da upišu broj indeksa, to mogu da učine tako što će napustiti video prenos gašenjem prozora Internet pregledača, a zatim, kada ponovo otvore link video prenosa, trena obavezno da unesu pored imena i prezimena i svoj broj indeksa.</b></p><b></b>
 <p dir="ltr"><b>Ukoliko imate problem sa pristupom video prenosu predavanja, neophodno je da još jednom osvežite stranicu ovog obaveštenja za slučaj da je obaveštenje ažurirano i da je postavljen izmenjeni link za pristup video prenosu, kao i da pogledate da na stranici predmeta nije dodato novo obaveštenje sa dopunskim informacijama i uputstvima za pristup video prenosu.</b></p>
 <br>
 <div class="attachedimages"></div>
</div>', '[]');
INSERT INTO "public"."subject_posts" VALUES (12, 18100, 'Elektronska realizacija popravnog prvog kolokvijuma u 11. nedelji', 'Miodrag Živković', 1588702920000, '<div >
 <p></p>
 <p><span lang="sr-latn-rs" xml:lang="sr-latn-rs">Poštovane koleginice i kolege,</span></p>
 <p><span lang="sr-latn-rs" xml:lang="sr-latn-rs">Za četvrtak, 14.05.2020. u <b>17:10</b> časova zakazan je popravni I kolokvijum iz predmeta Razvoj mobilnih aplikacija (za oba smera, IR i SII).</span></p>
 <p><span lang="sr-latn-rs" xml:lang="sr-latn-rs"><b>Studenti moraju najaviti prisustvo na popravnom kolokvijumu preko sledećeg linka: <a href="https://docs.google.com/forms/d/e/1FAIpQLSfA1_AtzIPvLduH8Y8Os2EQVVr1XKxxLWWwXPRHLZ_4OzDL1Q/viewform?usp=sf_link">link za prijavu</a></b></span></p>
 <p><span lang="sr-latn-rs" xml:lang="sr-latn-rs">I Kolokvijum se radi u formi elektronskog testa. Vreme izrade kolokvijuma je 25 minuta, test sadrži 30 pitanja.</span></p>
 <p><span lang="sr-latn-rs" xml:lang="sr-latn-rs">Pitanja su formirana iz knjige: Razvoj mobilnih aplikacija, Android Java programiranje, Univerzitet Singidunum, M. Živković, 2020. kao i iz slajdova sa predavanja i vežbi predviđenih za prvi kolokvijum.</span></p>
 <p><span lang="sr-latn-rs" xml:lang="sr-latn-rs">Gradivo obuhvaćeno prvim kolokvijumom u udžbeniku obrađeno je kroz poglavlja:</span></p>
 <p><span lang="sr-latn-rs" xml:lang="sr-latn-rs">1. Uvod,</span></p>
 <p><span lang="sr-latn-rs" xml:lang="sr-latn-rs">2. Android platforma,</span></p>
 <p><span lang="sr-latn-rs" xml:lang="sr-latn-rs">3. Android Studio</span></p>
 <p><span lang="sr-latn-rs" xml:lang="sr-latn-rs">4. Grafički korisnički interfejs</span></p>
 <p><span lang="sr-latn-rs" xml:lang="sr-latn-rs">5. Aktivnosti</span></p>
 <p><span lang="sr-latn-rs" xml:lang="sr-latn-rs">6. Niti</span></p>
 <p><span lang="sr-latn-rs" xml:lang="sr-latn-rs">Gradivo obuhvaćeno prvim kolokvijumom takođe sadrži pitanja iz prezentacija i praktičnih primera sa stranice predmeta iz sekcije Predavanja – gradivo za prvi kolokvijum, kao i iz materijala koji se nalaze u sekciji Vežbe – gradivo za prvi kolokvijum.</span></p>
 <p><span lang="sr-latn-rs" xml:lang="sr-latn-rs">Kolokvijum će se realizovati putem elektronske platforme mTutor, pristupom putem linka: <a href="https://test.singidunum.ac.rs/">https://test.singidunum.ac.rs/</a></span></p>
 <p><span lang="sr-latn-rs" xml:lang="sr-latn-rs">u <b>17:10</b> časova za sve brojeve indeksa. Zaposleni studenti rade kolokvijum po istim pravilima kao i regularni studenti.</span></p>
 <p><span lang="sr-latn-rs" xml:lang="sr-latn-rs">Test se realizuje samostalno na osnovu sopstvenog znanja i pripremljenog ispita. Platforma poseduje zaštitne mehanizme kako bi se osujetili pokušaji manipulacije testom.</span></p>
 <p><span lang="sr-latn-rs" xml:lang="sr-latn-rs"></span></p>
 <ul>
  <li><span lang="sr-latn-rs" xml:lang="sr-latn-rs">Test radite sa stabilne, po mogućstvu žične Internet veze.</span></li>
  <li><span lang="sr-latn-rs" xml:lang="sr-latn-rs">Preporuka je da za vreme izrade testa koristite&nbsp;<b>Google Chrome</b>&nbsp;ili&nbsp;<b>Mozilla Firefox</b>&nbsp;Internet pregledač.</span></li>
  <li>U vreme testa potrebno je da od programskih paketa bude aktivan samo pregledač (browser) otvoren sa samo jednim tab-om u okviru koga će se realizovati test.</li>
 </ul>
 <p><b>⚠️ Maksimalno kašnjenje za početak testa je 5 minuta, nakon toga neće biti moguće ponovo pokrenuti test.</b><br></p>
 <p><span lang="sr-latn-rs" xml:lang="sr-latn-rs">Za prijavu na sistem koristi se broj indeksa u formatu godina upisa, pa broj indeksa bez znakova interpunkcije npr: 2017123456. Nakon prijave odabraćete test i pokrenuti rad.</span></p>
 <p><span lang="sr-latn-rs" xml:lang="sr-latn-rs"></span></p>
 <p><span lang="sr-latn-rs" xml:lang="sr-latn-rs">⚠️&nbsp;<b>Napomene</b>:</span></p>
 <p><span lang="sr-latn-rs" xml:lang="sr-latn-rs"></span></p>
 <ul>
  <li><b>Za elektronski test obavezna je upotreba kamere za davanje validnosti rezultatu testa.</b></li>
  <li><b>Studenti će moći da pokrenu test i bez odobravanja pristupa kameri (ukoliko nemaju raspoloživu kameru na računaru). U tom slučaju, student treba da instalira Google Meet aplikaciju na mobilnom telefonu i aktivira je za vreme izrade kolokvijuma prijavljivanjem na link na kome će biti aktivni profesor i asistent</b>:&nbsp;<a href="https://meet.google.com/qgp-royz-uhg"><span lang="sr-latn-rs" xml:lang="sr-latn-rs">https://meet.google.com/qgp-royz-uhg</span></a></li>
  <li>Međutim, u slučaju da student ne pokrene test sa odobrenjem korišćenja kamere, profesor će zakazati usmenu odbranu rezultata testa, video prenosom preko Google Meet platforme, sa obaveznim korišćenjem kamere sa strane studenta za vreme trajanja usmenog ispitivanja.</li>
 </ul>
 <p><span lang="sr-latn-rs" xml:lang="sr-latn-rs">Sve vreme trajanja testa predmetni profesor i asistent biće dostupni na Google Meet platformi kako bi odgovorili na eventualne tehničke probleme pri pokretanju testa. Na link se prijavljujete isključivo ukoliko se javio neki problem ili ukoliko koristite mobilnu Google Meet aplikaciju za davanje validnosti testu. Link za Google Meet:&nbsp;&nbsp;</span><a href="https://meet.google.com/qgp-royz-uhg"><span lang="sr-latn-rs" xml:lang="sr-latn-rs">https://meet.google.com/qgp-royz-uhg</span></a></p>
 <p><span lang="sr-latn-rs" xml:lang="sr-latn-rs"></span></p>
 <p><span lang="sr-latn-rs" xml:lang="sr-latn-rs">&nbsp;</span></p>
 <p><span lang="sr-latn-rs" xml:lang="sr-latn-rs">Želimo vam srećan i uspešan rad.</span></p>
 <br>
 <div class="attachedimages"></div>
</div>', '[]');
INSERT INTO "public"."subject_posts" VALUES (13, 19343, 'Rezultati drugog kolokvijuma, 21.05.2020.', 'Miodrag Živković', 1590150600000, '<div >
 <p>Rezultati drugog kolokvijuma su u prilogu.</p>
 <div class="attachedimages"></div>
</div>', '[{"type":"/images/file_pdf.svg","attachmentLink":"http://predmet.singidunum.ac.rs/pluginfile.php/7142/mod_forum/attachment/19439/RMA%20drugi%20kolokvijum.pdf","attachmentTitle":"RMA drugi kolokvijum.pdf"}]');
INSERT INTO "public"."subject_posts" VALUES (14, 14098, 'Video materijali sa predavanja', 'Miodrag Živković', 1584641700000, '<div >
 <p>Snimljeni materijali sa elektronskih predavanja će biti dostupni na linku:<br></p>
 <p><a href="https://drive.google.com/drive/folders/1ODiF2XX2fMyKY28riYTvuwU7yKDfGEpb">https://drive.google.com/drive/folders/1ODiF2XX2fMyKY28riYTvuwU7yKDfGEpb</a><br></p>
 <div class="attachedimages"></div>
</div>', '[]');
INSERT INTO "public"."subject_posts" VALUES (15, 12636, 'Važno! Projekti za završni ispit', 'Uroš Arnaut', 1580301900000, '<div >
 <p>Poštovane koleginice i kolege,</p>
 <p><b>Ko ima projektni zadatak, mora da dođe u terminu od 17.00 časova u Kumodraškoj u E-118.</b> Za popravne kolokvijume, redovni studenti imaju termin od 09.00 časova u Kumodraškoj u E-117.</p>
 <div class="attachedimages"></div>
</div>', '[]');
INSERT INTO "public"."subject_posts" VALUES (16, 58, 'Konsultacije u prvoj nedelji oktobra', 'Miodrag Živković', 1538492880000, '<div >
 <p>Konsultacije će biti održane u sredu 3.10.2018 u 18h, u zbornici na drugom spratu u Danijelovoj. Za dalji raspored konsultacija pogledati online raspored.</p>
 <div class="attachedimages"></div>
</div>', '[]');
INSERT INTO "public"."subject_posts" VALUES (17, 3797, 'Obaveštenje o konsultacijama u nedelji 11.02-15.02.2019', 'Miodrag Živković', 1550001480000, '<div >
 <p></p>
 <p>Obaveštavaju se studenti da u ovoj nedelji (11.02-15.02.2019) zbog godišnjeg odmora neće biti održane konsultacije kod profesora Miodraga Živkovića.&nbsp;</p>
 <p>Konsultacije se od sledeće nedelje održavaju po planu.</p>
 <br>
 <div class="attachedimages"></div>
</div>', '[]');
INSERT INTO "public"."subject_posts" VALUES (18, 15975, 'Važno obaveštenje u vezi sa polaganjem prvog kolokvijuma', 'Nikola Savanović', 1586190180000, '<div >
 <p></p>
 <p>Poštovane koleginice i kolege,</p> 
 <p>&nbsp;</p> 
 <p>Slede detaljna uputstva za polaganje kolokvijuma.</p> 
 <p>&nbsp;</p> 
 <p><b><u>Satnica polaganja</u></b></p> 
 <p>Datum: 06.04.2020.</p> 
 <p>Vreme: <b>19:07 časova</b></p> 
 <p><u>Zaposleni studenti u svom terminu pristupaju (<b>samo oni koji su dostavili potvrdu o zaposlenju studentskoj službi</b>): <b>20:07 časova </b>- prijava na sistem samo minut ranije (nema potrebe pre, pročitati smernice ispod)</u></p>
 <p><u><br></u></p> 
 <p style="text-align:center;"><b><span>-----------------------------------------------------------------------------------------------------------------------------------------</span></b></p>
 <p style="text-align:center;"><b><u></u></b></p>
 <h4 style="text-align:center;"><b><u><b><u>I kolokvijum - neophodno je da aktivirate kameru</u></b></u></b></h4><b><u></u></b>
 <p style="text-align:center;"><br></p>
 <h4 style="text-align:center;"><b>Zamolio bih sve da se nikako ne prijavljuju na sistem pre 19:06 - kako bi imali nesmetani ulaz na sistem. Ukupno 20 pitanja (30 poena), 25 minuta za rad</b></h4>
 <h4 style="text-align:center;"><b>Test će biti aktivan tek od 19:07 na sledećem linku&nbsp;</b></h4>
 <p style="text-align:center;">https://test.singidunum.ac.rs/Student?Module=MMTutor_Student&amp;Method=Login</p>
 <p><br></p>
 <p style="text-align:center;"><b><span>-----------------------------------------------------------------------------------------------------------------------------------------</span></b><br></p>
 <p><b><br></b></p>
 <p style="text-align:center;"><b>Link za Meet - samo ukoliko ne možete da se ulogujete ili ukoliko ne koristite kameru na telefonu</b></p>
 <p style="text-align:center;"><b>Naziv tog testa biće jasno naznačen (sufiksom MEET). Svi studenti koji se nađu na navedenom testu, a nisu se prijavili putem MEET-a na navedeni link (indeksom i imenom i prezimenom) - neće biti priznat kolokvijum</b></p>
 <p style="text-align:center;"><b><br></b></p>
 <h4 style="text-align:center;"><b>Link za Meet (na ovom linku obavezno držati mikforon ugašenim i ne koristiti čet):</b></h4> 
 <p style="text-align:center;"><b><u><b></b></u></b></p>
 <p dir="ltr" style="text-align:center;">https://meet.google.com/djx-dazm-buq</p>
 <p style="text-align:center;"><br></p>
 <p style="text-align:center;"><b><span></span></b></p>
 <p style="text-align:center;"><b><b><span>-----------------------------------------------------------------------------------------------------------------------------------------</span></b><br></b></p><span></span>
 <p style="text-align:center;"><span style="font-weight:700;"><br></span></p>
 <br>
 <h4><b><u>Uputstvo za logovanje i neophodne smernice:</u></b></h4> 
 <p>Test se radi u sistemu mTutor - isti sistem za elektronsko testiranje koji se koristi u prostorijama Univerziteta Singidunum za elektronsko testiranje. Test obuhvata gradivo koje je dogovoreno i obrađeno tokom nastavnih jedinica. </p> 
 <p>&nbsp;</p> 
 <p>U toku testa je zabranjeno otvaranje bilo kog drugog prozora ili novog tab-a u pretraživaču. Sistem će Vas sam upozoriti ukoliko kliknete bilo gde van testa, a nakon tri upozorenja sistem automatski isključuje sa polaganja. Test će biti aktivan tačno u trenutku kada počinje termin za testiranje a koji je naveden u ovom obaveštenju.</p> 
 <p>Potrebno da se ulogujete sa vašim brojem indeksa, kao i da izaberete fakultet na kome pohađate nastavu. Broj indeksa se unosi u formatu godina upisa i u nastavku bez razmaka ili bilo kojih drugih simbola ostalih šest cifara koji čine broj indeksa (primer 2018111222). Nakon prijave počinje se sa radom na testu i po završetku potrebno je da se odjavite sa sistema. <b><u>Povratak na prethodna pitanja nije moguće</u></b>, već se svaki dat odgovor beleži.</p>
 <p><br></p> 
 <h4 style="text-align:center;"><b><u>Tokom testiranja, nemojte otvarati nijedan drugi prozor. Fokus miša mora da ostane samo na pretraživaču (browser-u). Preporuka je da isključite sva moguća obaveštenja operativnog sistema, anti-virus softvera, ekstenzije unutar pretraživača (ukoliko su instalirane) – drugim rečima, apsolutno sve što može da se pojavi kao pop-up prozor.</u></b></h4> 
 <p>&nbsp;</p> 
 <p>Ukoliko postoji problem sa testom, predmetni profesor i predmetni asistent biće dostupni putem email-a. Na svaki mejl biće dostavljen link za Meet (ukoliko je složen problem), gde će se utvrditi šta je bio eventualni problem.</p> 
 <p><b>Studenti koji ne žele da uključe kameru</b> – mogu da polažu naknadno (ponovo koristeći kameru), usmeno u odvojenom sastanku - direktno sa predmetnim profesorom ili predmetnim asistenom.&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</p> 
 <p><b>Studenti koji ne žele ili se izjasne da nemaju kameru</b> – za njih će biti moguće polaganje u zgradi univerziteta, nakon završetka vanredne situacije kada je moguće izvršiti kontrolu u učionici.</p>
 <p><br></p> 
 <p><b><u>Polaganje bez uključene kamere koja stoji ispred studenta - nije moguće. Biće moguće u terminu kada se završi vanredna situacija.</u></b></p> 
 <p><br></p>
 <p>Ukoliko postoji problem sa pristupom studentskim nalozima – obratite se na <a href="mailto:erc@singidunum.ac.rs">erc@singidunum.ac.rs</a>. Termini polaganja nisu vreme kada je potrebno da se utvrdi da li ste u mogućnosti ili niste da pristupite studentskom mejlu.</p> 
 <p>Zadatke radite samostalno i odgovorno. Svaki zadatak će proći kroz alate za digitalnu forenziku, kako bi se utvrdilo kretanje fajla/linka kroz mrežu. </p> 
 <p>&nbsp;</p> 
 <p><b><u>Za svaki zadatak za koji se posumnja da nije samostalno urađen – profesor/asistent zadržava potpuno pravo da proveri validnost testa online putem Meet-a, u terminu kada se odredi i da ne prihvati (trenutno) ostvaren rezultat.</u></b></p> 
 <p>&nbsp;</p> 
 <p>Za sve nejasnoće i nedumice stojimo na raspolaganju putem mejla ili u terminu konsultacija.</p>
 <div class="attachedimages"></div>
</div>', '[]');
INSERT INTO "public"."subject_posts" VALUES (29, 18715, 'Elektronska realizacija drugog kolokvijuma u 12. nedelji', 'Miodrag Živković', 1589381520000, '<div >
 <p></p>
 <p><b>Način polaganja redovnog drugog kolokvijuma</b><br></p>
 <p></p>
 <ul>
  <li>Za ovaj vid polaganja, koji podrazumeva prezentaciju progresa praktičnog projekta za završni ispit, studenti će svoje projekte prezentovati preko video linka. Odbrana projekata će se obaviti&nbsp;u četvrtak, 21. 5. 2020.&nbsp;u<b>&nbsp;19.00,&nbsp;</b>sa obavezno aktivnom kamerom sa strane studenta.</li>
 </ul>
 <ul>
  <li>Link za odbranu:&nbsp;<a href="https://meet.google.com/qgp-royz-uhg" target="_blank" rel="noreferrer noopener"><span lang="sr-latn-rs" xml:lang="sr-latn-rs">https://meet.google.com/qgp-royz-uhg</span></a></li>
 </ul>
 <br>
 <div class="attachedimages"></div>
</div>', '[]');
INSERT INTO "public"."subject_posts" VALUES (30, 17462, 'Završni projekat - specifikacija zahteva', 'Miodrag Živković', 1587564120000, '<div >
 <p></p>
 <p>Poštovani studenti,</p>
 <p>Uzimajući u obzir da uskoro treba da počnete sa implementacijom projekta,&nbsp; definisali smo zahteve za projektnu aplikaciju:</p>
 <p></p>
 <ul>
  <li>Aplikacija treba da ima više aktivnosti (minimum 3) i da omogućuje navigaciju i prenos podataka između aktivnosti</li>
  <li>Za maksimalne bodove, aplikacija treba da komunicira sa eksternim APIjem asinhrono (preko async task-a)</li>
  <li>Treba da skladišti neke podatke lokalno, unutar aplikacije</li>
  <li>Rad sa APIjem se može zameniti lokalnom SQLite bazom, ali u tom slučaju nije moguće ostvariti max bodove</li>
  <li>Ukoliko poslovna logika to dozvoljava, funkcionalnosti treba podeliti na fragmente, i implementirati komunikaciju između fragmenata</li>
  <li>Ukoliko aplikacija rukuje većom količinom podataka, potrebno je, pored osnovnog CRUD-a, implementirati i pretragu</li>
 </ul>
 <p>Tema Vaše aplikacije je naravno slobodna, ali je potrebno da se javite profesoru i asistentu sa predlogom teme, kako bismo Vam i zvanično potvrdili tu temu (i eventualno predložili neke izmene u skladu sa zahtevima projekta).</p>
 <br>
 <div class="attachedimages"></div>
</div>', '[]');
INSERT INTO "public"."subject_posts" VALUES (32, 20109, 'Popravni kolokvijumi', 'Uroš Arnaut', 1591966140000, '<div >
 <p>Poštovane koleginice i kolege,</p>
 <p>Popravni prvog i drugog kolokvijuma ce se održati u terminu vežbi u petak 12.06.2020.. Na prvom času ćemo raditi novo gradivo, dok će drugi čas biti rezervisan za popravne.</p>
 <p>Link kom pristupate je sledeći:</p>
 <p><b><a href="http://test.singidunum.ac.rs/" target="_blank" rel="noreferrer noopener">test.singidunum.ac.rs</a></b></p>
 <p>U slučaju da imate problem sa pokretanjem testa, asisten je dostupan na linku za konsultacije.</p>
 <p>Srećan rad!</p>
 <div class="attachedimages"></div>
</div>', '[]');
INSERT INTO "public"."subject_posts" VALUES (33, 17322, 'Video Links 16.4.2020.', 'Marina Marjanović Jakovljević', 1587057540000, '<div >
 <p></p>
 <table border="1" cellspacing="0" cellpadding="0" width="623"> 
  <tbody>
   <tr> 
    <td width="108" valign="top"> <p>30.03.2020.</p> </td> 
    <td width="484" valign="top"> <p>1. Introduction to Machine Learning</p> <p><a href="https://drive.google.com/file/d/17gpMxUyjN8zphe5ofGN62YK9M3xZ2L-j/view">https://drive.google.com/file/d/17gpMxUyjN8zphe5ofGN62YK9M3xZ2L-j/view</a></p> <p>2. Linear Regression and Gradient Descent</p> <p><a href="https://drive.google.com/file/d/14fCrterffR64FEyXSpsvVnUhNU4T5rgb/view">https://drive.google.com/file/d/14fCrterffR64FEyXSpsvVnUhNU4T5rgb/view</a></p> <p>&nbsp;</p> <p>3. Test and partial derivative calculation</p> <p><a href="https://drive.google.com/file/d/1wiwG4jBIAFgPmjINykBpTz2XV68ewxOl/view">https://drive.google.com/file/d/1wiwG4jBIAFgPmjINykBpTz2XV68ewxOl/view</a></p> <p>&nbsp;</p> </td> 
    <td width="16" valign="top"> <p>&nbsp;</p> </td> 
    <td width="16" valign="top"> <p>&nbsp;</p> </td> 
   </tr> 
   <tr> 
    <td width="108" valign="top"> <p>1.4.2020.</p> </td> 
    <td width="484" valign="top"> <p>4. Linear Regression and Gradient Descent implementation and vectorising</p> <p><a href="https://drive.google.com/file/d/12lkgCpHFAaMItqWUhPU_2IRXFcWY5CCw/view">https://drive.google.com/file/d/12lkgCpHFAaMItqWUhPU_2IRXFcWY5CCw/view</a></p> <p>&nbsp;</p> <p>5. Linear Algebra</p> <p><a href="https://drive.google.com/file/d/1zi9Iic4u1tSbMJgUDrs41SK5XVryLPjz/view">https://drive.google.com/file/d/1zi9Iic4u1tSbMJgUDrs41SK5XVryLPjz/view</a></p> <p>6. Linear algebra and test</p> <p><a href="https://drive.google.com/file/d/13NY30ypQH_N6JW9TQLToqONb-uQ7o-tz/view">https://drive.google.com/file/d/13NY30ypQH_N6JW9TQLToqONb-uQ7o-tz/view</a></p> <p>&nbsp;</p> <p>&nbsp;</p> </td> 
    <td width="16" valign="top"> <p>&nbsp;</p> </td> 
    <td width="16" valign="top"> <p>&nbsp;</p> </td> 
   </tr> 
   <tr> 
    <td width="108" valign="top"> <p>2.4.2020.</p> </td> 
    <td width="484" valign="top"> <p>7. Gradient descent algorithm homework discussion</p> <p><a href="https://mail.google.com/mail/u/0/#inbox/FMfcgxwHMZSBHrRZCfWQwxLRJmZtVvrM?projector=1">https://mail.google.com/mail/u/0/#inbox/FMfcgxwHMZSBHrRZCfWQwxLRJmZtVvrM?projector=1</a></p> <p>&nbsp;</p> <p>8. Linear Algebra theory</p> <p><a href="https://drive.google.com/file/d/1Ak_HNkXtROJJNF76Rj4oV3RRQs-pfZ6D/view">https://drive.google.com/file/d/1Ak_HNkXtROJJNF76Rj4oV3RRQs-pfZ6D/view</a></p> <p>&nbsp;</p> <p>9. Linear Algebra implementation Python</p> <p><a href="https://drive.google.com/file/d/1LEbq7VKQ4u1NlHVJn9O2EdQOlnO8f4BK/view">https://drive.google.com/file/d/1LEbq7VKQ4u1NlHVJn9O2EdQOlnO8f4BK/view</a></p> <p>&nbsp;</p> <p>10. MTutor discussion and Multivariate Gradient Descent </p> <p><a href="https://drive.google.com/file/d/1AtPypH5PY9QOtvXN1aNO1d6-Oe8Ez-9K/view">https://drive.google.com/file/d/1AtPypH5PY9QOtvXN1aNO1d6-Oe8Ez-9K/view</a></p> <p>&nbsp;</p> </td> 
    <td width="16" valign="top"> <p>&nbsp;</p> </td> 
    <td width="16" valign="top"> <p>&nbsp;</p> </td> 
   </tr> 
   <tr> 
    <td width="108" valign="top"> <p>3.4.2020.</p> </td> 
    <td width="484" valign="top"> <p>11. Homework discussion (Normal equation implementation in Python)</p> <p><a href="https://drive.google.com/file/d/1Fl70o7dhwaGk5KjCmr14kIfZapxvsH9m/view">https://drive.google.com/file/d/1Fl70o7dhwaGk5KjCmr14kIfZapxvsH9m/view</a></p> <p>&nbsp;</p> <p>12. Multivariate Gradient descent implementation I part</p> <p><a href="https://drive.google.com/file/d/1BVjtCrSQzVwgD00H1PghifusUAq7VFuz/view">https://drive.google.com/file/d/1BVjtCrSQzVwgD00H1PghifusUAq7VFuz/view</a></p> <p>&nbsp;</p> <p>13.&nbsp; Multivariate Gradient descent implementation II part</p> <p><a href="https://drive.google.com/file/d/1Gkq3vYRawtxsuB-Ve71JGysXk9Gf5ZEy/view">https://drive.google.com/file/d/1Gkq3vYRawtxsuB-Ve71JGysXk9Gf5ZEy/view</a></p> <p>14. MTutor test and discussion</p> <p>&nbsp;</p> </td> 
    <td width="16" valign="top"> <p>&nbsp;</p> </td> 
    <td width="16" valign="top"> <p>&nbsp;</p> </td> 
   </tr> 
   <tr> 
    <td width="108" valign="top"> <p><a></a>4.4.2020.</p> </td> 
    <td width="484" valign="top"> <p>weekend</p> </td> 
    <td width="16" valign="top"> <p>&nbsp;</p> </td> 
    <td width="16" valign="top"> <p>&nbsp;</p> </td> 
   </tr> 
   <tr> 
    <td width="108" valign="top"> <p>5.4.2020.</p> </td> 
    <td width="484" valign="top"> <p>weekend</p> </td> 
    <td width="16" valign="top"> <p>&nbsp;</p> </td> 
    <td width="16" valign="top"> <p>&nbsp;</p> </td> 
   </tr> 
   <tr> 
    <td width="108" valign="top"> <p>6.4.2020.</p> </td> 
    <td width="484" valign="top"> <p>15. Homework discussion, Multivariate Linear Regression and Logistic Regression theory 1. part</p> <p><a href="https://drive.google.com/file/d/1k4ADC_GGb5BKMFSLwA66jcw3zyj9jy7J/view">https://drive.google.com/file/d/1k4ADC_GGb5BKMFSLwA66jcw3zyj9jy7J/view</a></p> <p>16. Logistic Regression theory 2. part</p> <p><a href="https://drive.google.com/file/d/1sUZ6INc-abdMcKUopSQFfpWFU_JyLSAw/view">https://drive.google.com/file/d/1sUZ6INc-abdMcKUopSQFfpWFU_JyLSAw/view</a></p> <p>&nbsp;</p> <p>17. Logistic Regression Python implementation part 1.</p> <p><a href="https://drive.google.com/file/d/14GOK64Mc584m7qaMwq07IpmqLqXU1Kku/view">https://drive.google.com/file/d/14GOK64Mc584m7qaMwq07IpmqLqXU1Kku/view</a></p> <p>18. Logistic Regression Python implementation part 2.</p> <p><a href="https://drive.google.com/file/d/14nGDY9tDJv0866sh0t10Y92YgVMhbbNv/view">https://drive.google.com/file/d/14nGDY9tDJv0866sh0t10Y92YgVMhbbNv/view</a></p> <p>19. Mtutor test discussion and doubts clarification</p> <p><a href="https://drive.google.com/file/d/1vAU_0FunLnIMrUVLvfB-s1CxWsMfIYDe/view">https://drive.google.com/file/d/1vAU_https://drive.google.com/file/d/1vAU_0FunLnIMrUVLvfB-s1CxWsMfIYDe/view0FunLnIMrUVLvfB-s1CxWsMfIYDe/view</a></p> <p>&nbsp;</p> </td> 
    <td width="16" valign="top"> <p>&nbsp;</p> </td> 
    <td width="16" valign="top"> <p>&nbsp;</p> </td> 
   </tr> 
   <tr> 
    <td width="108" valign="top"> <p>7.4.2020.</p> </td> 
    <td width="484" valign="top"> <p>Tuesday</p> </td> 
    <td width="16" valign="top"> <p>&nbsp;</p> </td> 
    <td width="16" valign="top"> <p>&nbsp;</p> </td> 
   </tr> 
   <tr> 
    <td width="108" valign="top"> <p>8.4.2020.</p> </td> 
    <td width="484" valign="top"> <p>20. Homework discussion, Multiclass logistic regression and Overfitting</p> <p><a href="https://drive.google.com/file/d/15wyeQyB7C4ra458X4JUOUtO64iAptEtp/view">https://drive.google.com/file/d/15wyeQyB7C4ra458X4JUOUtO64iAptEtp/view</a></p> <p>21. Regularization and Neural Networks Introduction</p> <p><a href="https://drive.google.com/file/d/1UwOdOQk-GNDtkFDUm9HWs7TikeuXfvwK/view">https://drive.google.com/file/d/1UwOdOQk-GNDtkFDUm9HWs7TikeuXfvwK/view</a></p> <p>22. Neural Networks</p> <p><a href="https://drive.google.com/file/d/1NceSFJhFYptVg4a6u4uoO-8rkExe-zD1/view">https://drive.google.com/file/d/1NceSFJhFYptVg4a6u4uoO-8rkExe-zD1/view</a></p> <p>23. Neural Networks-Feedforward implementation</p> <p><a href="https://drive.google.com/file/d/1OWQZy7LNZrURbv5dDgNAS-x8_Fgy_fKU/view">https://drive.google.com/file/d/1OWQZy7LNZrURbv5dDgNAS-x8_Fgy_fKU/view</a></p> <p>24. Neural Networks-Feedforward implementation and mtutor discussion</p> <p><a href="https://drive.google.com/file/d/1cBn2P3jxbSBcAPwFxUw3kfv3n76haXWk/view">https://drive.google.com/file/d/1cBn2P3jxbSBcAPwFxUw3kfv3n76haXWk/view</a></p> <p>&nbsp;</p> </td> 
    <td width="16" valign="top"> <p>&nbsp;</p> </td> 
    <td width="16" valign="top"> <p>&nbsp;</p> </td> 
   </tr> 
   <tr> 
    <td width="108" valign="top"> <p>9.4.2020.</p> </td> 
    <td width="484" valign="top"> <p>25. Homework discussion (regularization implementation) and feedforward network</p> <p><a href="https://drive.google.com/file/d/1RsjwIrxXdLZPjlogtOTB_rKPZ6U98j6y/view">https://drive.google.com/file/d/1RsjwIrxXdLZPjlogtOTB_rKPZ6U98j6y/view</a></p> <p>26. Feed forward network implementation in Python</p> <p><a href="https://drive.google.com/file/d/1zMwW8Ibwi6Jx-IvDhSBym7l7U9dReLY_/view">https://drive.google.com/file/d/1zMwW8Ibwi6Jx-IvDhSBym7l7U9dReLY_/view</a></p> <p>First Midterm test</p> </td> 
    <td width="16" valign="top"> <p>&nbsp;</p> </td> 
    <td width="16" valign="top"> <p>&nbsp;</p> </td> 
   </tr> 
   <tr> 
    <td width="108" valign="top"> <p>10.4.2020.</p> </td> 
    <td width="484" valign="top"> <p>27. Homework discussion and Backward propagation</p> <p><a href="https://drive.google.com/file/d/13pTJNgNK96Dyksd-Q0bn39cmlSDXi_5J/view">https://drive.google.com/file/d/13pTJNgNK96Dyksd-Q0bn39cmlSDXi_5J/view</a></p> <p>28. Backward propagation</p> <p><a href="https://drive.google.com/file/d/1Mtb29DAX-yrnJj6liTjsNpn5uXKJlhzF/view">https://drive.google.com/file/d/1Mtb29DAX-yrnJj6liTjsNpn5uXKJlhzF/view</a></p> <p>29. Backward propagation implementation 1.part</p> <p><a href="https://drive.google.com/file/d/1ou2H5Q4xU07CQuxk23MXTFiSR-tPfZoD/view">https://drive.google.com/file/d/1ou2H5Q4xU07CQuxk23MXTFiSR-tPfZoD/view</a></p> <p>30. Backward propagation implementation 2.part</p> <p><a href="https://drive.google.com/file/d/1bhOxaWHlXP5QZG_IAGs-3st0r22rum53/view">https://drive.google.com/file/d/1bhOxaWHlXP5QZG_IAGs-3st0r22rum53/view</a></p> <p>31. Mtutor test</p> <p>&nbsp;</p> </td> 
    <td width="16" valign="top"> <p>&nbsp;</p> </td> 
    <td width="16" valign="top"> <p>&nbsp;</p> </td> 
   </tr> 
   <tr> 
    <td width="108" valign="top"> <p>11.4.2020.</p> </td> 
    <td width="484" valign="top"> <p>weekend</p> </td> 
    <td width="16" valign="top"> <p>&nbsp;</p> </td> 
    <td width="16" valign="top"> <p>&nbsp;</p> </td> 
   </tr> 
   <tr> 
    <td width="108" valign="top"> <p>12.4.2020.</p> </td> 
    <td width="484" valign="top"> <p>weekend</p> </td> 
    <td width="16" valign="top"> <p>&nbsp;</p> </td> 
    <td width="16" valign="top"> <p>&nbsp;</p> </td> 
   </tr> 
   <tr> 
    <td width="108" valign="top"> <p>13.4.2020.</p> </td> 
    <td width="484" valign="top"> <p>32. Homework discussion (feedforward propagation) and backward propagation</p> <p><a href="https://drive.google.com/file/d/1HaiqEDYnLhJOWsct70tlu6sls5shmVSe/view">https://drive.google.com/file/d/1HaiqEDYnLhJOWsct70tlu6sls5shmVSe/view</a></p> <p>33. Backward propagation implementation 1. part</p> <p><a href="https://drive.google.com/file/d/1HaiqEDYnLhJOWsct70tlu6sls5shmVSe/view">https://drive.google.com/file/d/1HaiqEDYnLhJOWsct70tlu6sls5shmVSe/view</a></p> <p>34. Backward propagation implementation 2. part, video is not recorded, but the code is uploaded on the course page</p> <p>35. Backward propagation implementation 3. Part</p> <p><a href="https://drive.google.com/file/d/13dGTrHaMLDiabzoBfnfjxLCxXoKSDd1K/view">https://drive.google.com/file/d/13dGTrHaMLDiabzoBfnfjxLCxXoKSDd1K/view</a></p> <p>36. Mtutor test discussion</p> <p><a href="https://drive.google.com/file/d/13WGPUStuNkbmJsE4HF0gbp9q5Zo14ipi/view">https://drive.google.com/file/d/13WGPUStuNkbmJsE4HF0gbp9q5Zo14ipi/view</a></p> </td> 
    <td width="16" valign="top"> <p>&nbsp;</p> </td> 
    <td width="16" valign="top"> <p>&nbsp;</p> </td> 
   </tr> 
   <tr> 
    <td width="108" valign="top"> <p>14.4.2020.</p> </td> 
    <td width="484" valign="top"> <p>Tuesday, no class</p> </td> 
    <td width="16" valign="top"> <p>&nbsp;</p> </td> 
    <td width="16" valign="top"> <p>&nbsp;</p> </td> 
   </tr> 
   <tr> 
    <td width="108" valign="top"> <p>15.4.2020.</p> </td> 
    <td width="484" valign="top"> <p>37. Homework discussion (Backward prop) and Nonlinear Classifiers tutorial</p> <p><a href="https://drive.google.com/file/d/10QdDa4cFHWLJqkHDOeC7vjIUla73SeUT/view">https://drive.google.com/file/d/10QdDa4cFHWLJqkHDOeC7vjIUla73SeUT/view</a></p> <p>38. Kmeans theory</p> <p><a href="https://drive.google.com/file/d/1_2mE-s1yv5OtZBtYqVPzWvOsilshe8_0/view">https://drive.google.com/file/d/1_2mE-s1yv5OtZBtYqVPzWvOsilshe8_0/view</a></p> <p>39. Kmeans implementation</p> <p><a href="https://drive.google.com/file/d/1ocsUnhya7zxum0CnnvPB6DPi1fpOrCHQ/view">https://drive.google.com/file/d/1ocsUnhya7zxum0CnnvPB6DPi1fpOrCHQ/view</a></p> <p>40. Kmeans implementation</p> <p><a href="https://drive.google.com/file/d/166jwFS71OiyYk_f6SgkfUVYjM-CQ5_iv/view">https://drive.google.com/file/d/166jwFS71OiyYk_f6SgkfUVYjM-CQ5_iv/view</a></p> <p>41. Kmeans implementation</p> <p><a href="https://drive.google.com/file/d/1ketcEZYZhcd-hK5seq0HZbElJdBTLR6T/view">https://drive.google.com/file/d/1ketcEZYZhcd-hK5seq0HZbElJdBTLR6T/view</a></p> <p>&nbsp;</p> </td> 
    <td width="16" valign="top"> <p>&nbsp;</p> </td> 
    <td width="16" valign="top"> <p>&nbsp;</p> </td> 
   </tr> 
   <tr> 
    <td width="108" valign="top"> <p>16.4.2020.</p> </td> 
    <td width="484" valign="top"> <p>42. Homework discussion (Kmeans)</p> <p><a href="https://drive.google.com/file/d/10pU1qqHYe3Akzc6oVVHvjuwdSvbemC8d/view">https://drive.google.com/file/d/10pU1qqHYe3Akzc6oVVHvjuwdSvbemC8d/view</a></p> <p>43. Kmeans</p> <p><a href="https://drive.google.com/file/d/1wJrWbG2tI1MqgS_HkFAppoqQ7VNdR0aR/view">https://drive.google.com/file/d/1wJrWbG2tI1MqgS_HkFAppoqQ7VNdR0aR/view</a></p> <p>44. Kmeans</p> <p><a href="https://drive.google.com/file/d/1LRa-crerdh-8hCg2s5HDoxNckHhHDbne/view">https://drive.google.com/file/d/1LRa-crerdh-8hCg2s5HDoxNckHhHDbne/view</a></p> <p>45. clarification of different doubts </p> <p><a href="https://drive.google.com/file/d/1vCIXg_HCgl4KAG-H2gLbUNp5TkEUGFBF/view">https://drive.google.com/file/d/1vCIXg_HCgl4KAG-H2gLbUNp5TkEUGFBF/view</a></p> </td> 
    <td width="16" valign="top"> <p>&nbsp;</p> </td> 
    <td width="16" valign="top"> <p>&nbsp;</p> </td> 
   </tr> 
   <tr> 
    <td width="108" valign="top"> <p>17.4.2020.</p> </td> 
    <td width="484" valign="top"> <p>&nbsp;</p> </td> 
    <td width="16" valign="top"> <p>&nbsp;</p> </td> 
    <td width="16" valign="top"> <p>&nbsp;</p> </td> 
   </tr> 
   <tr> 
    <td width="108" valign="top"> <p>18.4.2020.</p> </td> 
    <td width="484" valign="top"> <p>&nbsp;</p> </td> 
    <td width="16" valign="top"> <p>&nbsp;</p> </td> 
    <td width="16" valign="top"> <p>&nbsp;</p> </td> 
   </tr> 
   <tr> 
    <td width="108" valign="top"> <p>19.4.2020.</p> </td> 
    <td width="484" valign="top"> <p>&nbsp;</p> </td> 
    <td width="16" valign="top"> <p>&nbsp;</p> </td> 
    <td width="16" valign="top"> <p>&nbsp;</p> </td> 
   </tr> 
   <tr> 
    <td width="108" valign="top"> <p>20.4.2020.</p> </td> 
    <td width="484" valign="top"> <p>&nbsp;</p> </td> 
    <td width="16" valign="top"> <p>&nbsp;</p> </td> 
    <td width="16" valign="top"> <p>&nbsp;</p> </td> 
   </tr> 
   <tr> 
    <td width="108" valign="top"> <p>21.4.2020.</p> </td> 
    <td width="484" valign="top"> <p>&nbsp;</p> </td> 
    <td width="16" valign="top"> <p>&nbsp;</p> </td> 
    <td width="16" valign="top"> <p>&nbsp;</p> </td> 
   </tr> 
  </tbody>
 </table>
 <br>
 <div class="attachedimages"></div>
</div>', '[]');
INSERT INTO "public"."subject_posts" VALUES (34, 19077, 'Video - 18.05.2020.', 'Mlađan Jovanović', 1589815980000, '<div >
 <p>https://drive.google.com/file/d/1lLuKvwNq1xcp1FCtN1vySPI6Vw8VlBZt/view?usp=sharing<br></p>
 <p>Best,</p>
 <p>Mladjan</p>
 <div class="attachedimages"></div>
</div>', '[]');
INSERT INTO "public"."subject_posts" VALUES (19, 125, 'Projektni zadatak', 'Miloš Dobrojević', 1540152240000, '<div >
 <h2>Projektni zadatak</h2> 
 <h3>Opis projektnog zadatka</h3> 
 <p>Kroz projektni zadatak treba izraditi informacioni sistem u formi web aplikacije koja će da sadrži sledeće elemente:</p> 
 <h4>I deo projekta</h4> 
 <ul> 
  <li>Struktura ekrana</li> 
  <li>Navigacija</li> 
  <li> Ograničenje prava pristupa informacijama u skladu sa ovlašćenjima korisnika 
   <ul> 
    <li> Aplikacija treba da ima najmanje dva korisnička nivoa 
     <ul> 
      <li>Anonimus</li> 
      <li>Administrator</li> 
     </ul> </li> 
    <li>Korisnik se identifikuje putem login obrasca unošenjem korisničkog imena i lozinke</li> 
   </ul> </li> 
  <li> Prikupljanje podataka 
   <ul> 
    <li>Ručni unos putem web obrazaca i/ili</li> 
    <li>Automatizovani unos podataka dostupnih preko mreže ili interneta</li> 
   </ul> </li> 
  <li>Skladištenje i čuvanje podataka na disku i/ili u bazi podataka</li> 
 </ul> 
 <h4>II deo projekta</h4> 
 <ul> 
  <li>Statistička obrada i prikaz podataka</li> 
  <li>Import i/ili eksport informacija u XML formatu</li> 
 </ul> 
 <h3>Tema projektnog zadatka</h3> 
 <ul> 
  <li>Studenti samostalno biraju temu projektnog zadatka u skladu sa svojim zaposlenjem i interesovanjima.</li> 
  <li>Tema se prijavljuje slanjem maila sa spiskom članova tima na adresu mdobrojevic [at] singidunum.ac.rs<br></li> 
 </ul> 
 <h3>Realizacija projektnog zadatka</h3> 
 <ul> 
  <li>Projekat se realizuje u timovima od 2 ili 3 studenta.</li> 
  <li>Projekat se realizuje u formi web aplikacije</li> 
  <li> Za izradu projekta, koristiti sledeće tehnologije: 
   <ul> 
    <li> Backend 
     <ul> 
      <li>PHP programski jezik</li> 
      <li>Baza podataka MySQL/MariaDB</li> 
     </ul> </li> 
    <li> Frontend 
     <ul> 
      <li>HTML</li> 
      <li>CSS</li> 
      <li>JavaScript</li> 
     </ul> </li> 
   </ul> </li> 
 </ul> 
 <h3>Ostale napomene</h3> 
 <ul> 
  <li>Ukoliko se prikupljeni podaci čuvaju na disku, smestiti ih u zaseban direktorijum. Pristup fajlovima u ovom direktorijumu preko web pretraživača mora biti zabranjen.</li> 
  <li>U slučaju poziva nepostojeće stranice, prikazati odgovarajuću poruku (Greška 404)</li> 
  <li>Ukoliko sistem radi sa slikama ili drugim multimedijalnim dokumentima, čuvati ih u zasebnim direktorijumima.</li> 
  <li>Za izradu projekta možete koristiti sopstveni kod, delove koda sa predavanja ili već gotov kod. Ono što morate znati, jeste da objasnite/odbranite šta upotrebljeni kod radi, da li je moglo drugačije rešenje i eventualno kakvo?</li> 
 </ul>
 <div class="attachedimages"></div>
</div>', '[]');
INSERT INTO "public"."subject_posts" VALUES (20, 19841, 'VAŽNO - INSTRUKCIJE ZA ZAVRŠNI ISPIT', 'Nebojša Bačanin Džakula', 1591163400000, '<div >
 <p>Poštovane i drage koleginice i kolege,</p>
 <p><br></p>
 <p>u prilogu možete da pronađete detaljne instrukcije za završni ispit.</p>
 <p>Puno pozdava.</p>
 <p><br></p>
 <p>Nastavnik</p>
 <p><br></p>
 <div class="attachedimages"></div>
</div>', '[{"type":"/images/file_pdf.svg","attachmentLink":"http://predmet.singidunum.ac.rs/pluginfile.php/14803/mod_forum/attachment/19942/Internet%20softverske%20arhitekture%20-%20zavrsni%20ispit%20instrukcije.pdf","attachmentTitle":"Internet softverske arhitekture - zavrsni ispit instrukcije.pdf"}]');
INSERT INTO "public"."subject_posts" VALUES (21, 19941, 'Snimak predavanja od 3.6.2020. godine', 'Nebojša Bačanin Džakula', 1591348740000, '<div >
 <p></p>
 <p>Poštovane i drage koleginice i kolege,</p>
 <p><br></p>
 <p>na sledećem linku možete da pogledate snimak predavanja od 3.6.2020. godine.</p>
 <p>https://drive.google.com/file/d/1Go2Pbi0iKH97Ncd5znigS-m-XHREb-j3/view?usp=sharing<br></p>
 <p>Puno pozdrava</p>
 <p>Profesor</p>
 <br>
 <div class="attachedimages"></div>
</div>', '[]');
INSERT INTO "public"."subject_posts" VALUES (22, 18764, 'ВАЖНО! Надокнада наставе за радну суботу 16.05.', 'Uroš Arnaut', 1590054840000, '<div >
 <p>Поштоване колегинице и колеге,</p>
 <p>Према прошлонедељном, усменом, договору на часу, часове који су планирани за суботу 16.05. надокнадићемо сутра (петак) 15.05. од 12.00 часова.</p>
 <p>То занчи да ћемо прво урадити надокнаду од 12.00 часова до 14.00 часова (с обзиром на то да тад немате наставу), а затим ћемо наставити са редовном наставом од 14.00 часова до 16.00 часова.</p>
 <p><b>Замолио бих Вас да се договорите и да обавестите све колеге и да ми било ко од Вас потрврди мејлом да су сви обавештени. Уколико не буду сви обавештени, наставу ћемо одржати у суботу, као што је било и планирано.</b></p>
 <p>Хвала!<br></p>
 <div class="attachedimages"></div>
</div>', '[]');
INSERT INTO "public"."subject_posts" VALUES (23, 9036, 'Rezultati ispita u roku septembar 2', 'Miodrag Živković', 1568326740000, '<div >
 <p>Rezultati ispita su u prilogu.</p>
 <div class="attachedimages"></div>
</div>', '[{"type":"/images/file_pdf.svg","attachmentLink":"http://predmet.singidunum.ac.rs/pluginfile.php/7142/mod_forum/attachment/9052/RMA%20septembar%202.pdf","attachmentTitle":"RMA septembar 2.pdf"}]');
INSERT INTO "public"."subject_posts" VALUES (24, 4731, 'Rezultati julskog isptnog roka', 'Ivana Kostić Kovačević', 1562596200000, '<div >
 <p>Rezultati</p>
 <p>Uvid u radove, usmeni deo ispita i upis ocena u sredu 03.07 u 17h<br></p>
 <div class="attachedimages"></div>
</div>', '[{"type":"/images/file_excel.svg","attachmentLink":"http://predmet.singidunum.ac.rs/pluginfile.php/3231/mod_forum/attachment/4743/IR%20bodovi%20%E2%80%93%20kopija.xls","attachmentTitle":"IR bodovi – kopija.xls"},{"type":"/images/file_excel.svg","attachmentLink":"http://predmet.singidunum.ac.rs/pluginfile.php/3231/mod_forum/attachment/4743/SI%20bodovi%20%E2%80%93%20kopija.xls","attachmentTitle":"SI bodovi – kopija.xls"}]');
INSERT INTO "public"."subject_posts" VALUES (25, 20107, 'Predavanja za završni deo ispita', 'Vule Mizdraković', 1591552620000, '<div >
 <p></p>
 <p>Poštovani studenti, <br></p>
 <p>U nastavku se nalaze linkovi video snimaka predavanja koja se odnose na završni deo ispita: <br></p>
 <p></p>
 <div> 
  <div>
   04.06.2020: 
   <br>
  </div>
  <div>
   <a href="https://drive.google.com/file/d/1KAf1hakloZbWxtdZRUWewVIpyG8Cjm2p/view?usp=sharing" target="_blank" rel="noreferrer noopener">https://drive.google.com/file/d/1KAf1hakloZbWxtdZRUWewVIpyG8Cjm2p/view?usp=sharing</a>
  </div>
  <div>
   28.06.2020: 
   <br>
  </div>
  <div>
   <a href="https://drive.google.com/file/d/17RSiJIjaH_oXdnD3VPxwrh0gJF8XvXyF/view?usp=sharing" target="_blank" rel="noreferrer noopener">https://drive.google.com/file/d/17RSiJIjaH_oXdnD3VPxwrh0gJF8XvXyF/view?usp=sharing</a>
  </div> 
 </div>
 <p></p>
 <br>
 <div class="attachedimages"></div>
</div>', '[]');
INSERT INTO "public"."subject_posts" VALUES (26, 19737, 'Video predavanja- 1.6.20.', 'Marija Kostić', 1591029480000, '<div >
 <p>Snimak predavanja je na linkovima:</p>
 <p><br></p>
 <p><a href="https://drive.google.com/file/d/1-dWH02buG8hn_pOvwVP5RARKYrC-8Ujo/view">https://drive.google.com/file/d/1-dWH02buG8hn_pOvwVP5RARKYrC-8Ujo/view</a><br></p>
 <p><br></p>
 <p><a href="https://drive.google.com/file/d/1t6k4yhBqhPRyRxcFkzqRn2oSRFv100Xw/view">https://drive.google.com/file/d/1t6k4yhBqhPRyRxcFkzqRn2oSRFv100Xw/view</a><br></p>
 <div class="attachedimages"></div>
</div>', '[]');
INSERT INTO "public"."subject_posts" VALUES (27, 16566, 'Ocene - april', 'Nebojša Nešić', 1586335620000, '<div >
 <p></p>
 <p>Kolege,</p>
 <p>U prilogu su ocene. Molim Vas proverite da li postoje evenutalne greske ili pogresno uneseni poeni.</p>
 <p> Do nedelje imate vremena da mi javite, posle toga se ocene iz ovoga roka zakljucuju.</p>
 <p>Pozdrav,</p>
 <br>
 <p></p>
 <div class="attachedimages"></div>
</div>', '[{"type":"/images/file_pdf.svg","attachmentLink":"http://predmet.singidunum.ac.rs/pluginfile.php/1716/mod_forum/attachment/16613/ORT%20april.pdf","attachmentTitle":"ORT april.pdf"},{"type":"/images/file_pdf.svg","attachmentLink":"http://predmet.singidunum.ac.rs/pluginfile.php/1716/mod_forum/attachment/16613/PI%20april.pdf","attachmentTitle":"PI april.pdf"}]');
INSERT INTO "public"."subject_posts" VALUES (28, 16132, 'Odbrana projekata 06.04.2020.', 'Jelena Gavrilović', 1585912560000, '<div >
 <p>Poštovani studenti</p>
 <p>&nbsp;odbrana projekta&nbsp; biće organizovana u ponedeljak 06.04.2020. u 15h.</p>
 <p>Studenti treba da na mail jgavrilovic@singidunum.ac.rs, dostave svoje prezentacije do 12h u ponedeljak 06.04.2020.</p>
 <p>Odbrana je usmena putem aplikacije google meet . Prustup preko linka</p>
 <p><a href="https://meet.google.com/jnp-yvyc-owq">https://meet.google.com/jnp-yvyc-owq</a><br></p>
 <div class="attachedimages"></div>
</div>', '[]');
INSERT INTO "public"."subject_posts" VALUES (31, 20054, 'Popravni 1. kolokvijuma', 'Miodrag Živković', 1591624800000, '<div >
 <p></p>
 <p><span lang="sr-latn-rs" xml:lang="sr-latn-rs">Poštovane koleginice i kolege,</span></p>
 <p><span lang="sr-latn-rs" xml:lang="sr-latn-rs">Za ponedeljak, 8. 6. 2020. u&nbsp;<b>16.05</b>&nbsp;zakazan je termin za popravni 1. kolokvijum iz predmeta&nbsp;<b>Testiranje softvera</b>.</span></p>
 <p><span lang="sr-latn-rs" xml:lang="sr-latn-rs">Popravni drugog kolokvijuma se radi u formi elektronskog testa. Vreme izrade kolokvijuma je&nbsp;<b>30 minuta</b>, test sadrži&nbsp;<b>30 pitanja</b>.</span></p>
 <p>Kolokvijum će se realizovati putem elektronske platforme MMTutor, pristupom putem linka:&nbsp;<a href="https://test.singidunum.ac.rs/" target="_blank" rel="noreferrer noopener">test.singidunum.ac.rs</a>.<br></p>
 <p><span lang="sr-latn-rs" xml:lang="sr-latn-rs">Studenti u programu podrške zaposlenim studentima (PZS) rade popravni 1. kolokvijuma po istim pravilima kao i regularni studenti i u istom terminu, u&nbsp;<b>16.05</b>.</span></p>
 <p><span lang="sr-latn-rs" xml:lang="sr-latn-rs">Test se realizuje samostalno na osnovu sopstvenog znanja i rada. Platforma poseduje zaštitne mehanizme kako bi se osujetili pokušaji manipulacije testom.</span></p>
 <p><span lang="sr-latn-rs" xml:lang="sr-latn-rs"></span></p>
 <ul>
  <li><span lang="sr-latn-rs" xml:lang="sr-latn-rs">Test radite sa stabilne, po mogućstvu žične Internet veze.</span></li>
  <li><span lang="sr-latn-rs" xml:lang="sr-latn-rs">Preporuka je da za vreme izrade testa koristite&nbsp;<b>Google Chrome</b>&nbsp;ili&nbsp;<b>Mozilla Firefox</b>&nbsp;Internet pregledač na računaru, a ne na mobilnom telefonu (ne garantuje se stabilan rad sa mobilnog telefona).</span></li>
  <li>U vreme testa potrebno je da od programskih paketa bude aktivan samo pregledač (browser) otvoren sa samo jednim tab-om u okviru koga će se realizovati test.</li>
  <li>Deaktivirati sve druge programe koji mogu izazvati iskakanje prozora (pop up ili obaveštenja/notifikacije) koje bi izazvale gubljenje fokusa prozora Internet pregledača. MMTutor ne može da razlikuje namerne i slučajne izlaske iz fokusa prozora i sve ih tretira na isti način, kao eventualni pokušaj varanja na testu.</li>
 </ul>
 <p><b>⚠️ Maksimalno kašnjenje za početak testa je 5 minuta, nakon toga neće biti moguće ponovo pokrenuti test.</b><br></p>
 <p><span lang="sr-latn-rs" xml:lang="sr-latn-rs">Za prijavu na sistem koristi se broj indeksa u formatu godina upisa, pa broj indeksa bez znakova interpunkcije npr: 2017123456. Nakon prijave odabraćete test i pokrenuti rad.</span></p>
 <p><span lang="sr-latn-rs" xml:lang="sr-latn-rs"></span></p>
 <p><span lang="sr-latn-rs" xml:lang="sr-latn-rs">⚠️&nbsp;<b>Napomene</b>:</span></p>
 <p><span lang="sr-latn-rs" xml:lang="sr-latn-rs"></span></p>
 <ul>
  <li><b>Za elektronski test obavezna je upotreba kamere za davanje validnosti rezultatu testa.</b></li>
  <li><b>Studenti će moći da pokrenu test i bez odobravanja pristupa kameri (ukoliko nemaju raspoloživu kameru na računaru). U tom slučaju, student treba da instalira Google Meet aplikaciju na mobilnom telefonu i aktivira je za vreme izrade kolokvijuma prijavljivanjem na link na kome će biti aktivni profesor i asistent</b>:&nbsp;<span lang="sr-latn-rs" xml:lang="sr-latn-rs"><a href="https://meet.google.com/qgp-royz-uhg">https://meet.google.com/qgp-royz-uhg</a>.</span></li>
  <li>Međutim, u slučaju da student ne pokrene test sa odobrenjem korišćenja kamere, profesor će zakazati usmenu odbranu rezultata testa, video prenosom preko Google Meet platforme, sa obaveznim korišćenjem kamere sa strane studenta za vreme trajanja usmenog ispitivanja.</li>
 </ul>
 <p><span lang="sr-latn-rs" xml:lang="sr-latn-rs">Sve vreme trajanja testa predmetni profesor ili asistent biće dostupni na Google Meet platformi kako bi odgovorili na eventualne tehničke probleme pri pokretanju testa. Na link se prijavljujete isključivo ukoliko se javio neki problem ili ukoliko koristite mobilnu Google Meet aplikaciju za davanje validnosti testu. Link za Google Meet:&nbsp;<a href="https://meet.google.com/qgp-royz-uhg">https://meet.google.com/qgp-royz-uhg</a><a href="https://meet.google.com/vts-rdwd-mpd" target="_blank" rel="noreferrer noopener"></a>.</span></p>
 <br>
 <div class="attachedimages"></div>
</div>', '[]');
INSERT INTO "public"."subject_posts" VALUES (35, 18477, 'Exam information and project description', 'Mlađan Jovanović', 1590054360000, '<div >
 <p>Dear All,</p>
 <p>they are enclosed.</p>
 <p>Best,</p>
 <p>Mladjan</p>
 <div class="attachedimages"></div>
</div>', '[{"type":"/images/file_pdf.svg","attachmentLink":"http://predmet.singidunum.ac.rs/pluginfile.php/17240/mod_forum/attachment/18553/Exam%20structure%20and%20project%20description%202020.pdf","attachmentTitle":"Exam structure and project description 2020.pdf"}]');
INSERT INTO "public"."subject_posts" VALUES (36, 17243, 'video links 15.04.2020.', 'Marina Marjanović Jakovljević', 1586973420000, '<div >
 <p></p>
 <table border="1" cellspacing="0" cellpadding="0" width="623"> 
  <tbody>
   <tr> 
    <td width="108" valign="top"> <p>30.03.2020.</p> </td> 
    <td width="484" valign="top"> <p>1. Introduction to Machine Learning</p> <p><a href="https://drive.google.com/file/d/17gpMxUyjN8zphe5ofGN62YK9M3xZ2L-j/view">https://drive.google.com/file/d/17gpMxUyjN8zphe5ofGN62YK9M3xZ2L-j/view</a></p> <p>2. Linear Regression and Gradient Descent</p> <p><a href="https://drive.google.com/file/d/14fCrterffR64FEyXSpsvVnUhNU4T5rgb/view">https://drive.google.com/file/d/14fCrterffR64FEyXSpsvVnUhNU4T5rgb/view</a></p> <p>&nbsp;</p> <p>3. Test and partial derivative calculation</p> <p><a href="https://drive.google.com/file/d/1wiwG4jBIAFgPmjINykBpTz2XV68ewxOl/view">https://drive.google.com/file/d/1wiwG4jBIAFgPmjINykBpTz2XV68ewxOl/view</a></p> <p>&nbsp;</p> </td> 
    <td width="16" valign="top"> <p>&nbsp;</p> </td> 
    <td width="16" valign="top"> <p>&nbsp;</p> </td> 
   </tr> 
   <tr> 
    <td width="108" valign="top"> <p>1.4.2020.</p> </td> 
    <td width="484" valign="top"> <p>4. Linear Regression and Gradient Descent implementation and vectorising</p> <p><a href="https://drive.google.com/file/d/12lkgCpHFAaMItqWUhPU_2IRXFcWY5CCw/view">https://drive.google.com/file/d/12lkgCpHFAaMItqWUhPU_2IRXFcWY5CCw/view</a></p> <p>&nbsp;</p> <p>5. Linear Algebra</p> <p><a href="https://drive.google.com/file/d/1zi9Iic4u1tSbMJgUDrs41SK5XVryLPjz/view">https://drive.google.com/file/d/1zi9Iic4u1tSbMJgUDrs41SK5XVryLPjz/view</a></p> <p>6. Linear algebra and test</p> <p><a href="https://drive.google.com/file/d/13NY30ypQH_N6JW9TQLToqONb-uQ7o-tz/view">https://drive.google.com/file/d/13NY30ypQH_N6JW9TQLToqONb-uQ7o-tz/view</a></p> <p>&nbsp;</p> <p>&nbsp;</p> </td> 
    <td width="16" valign="top"> <p>&nbsp;</p> </td> 
    <td width="16" valign="top"> <p>&nbsp;</p> </td> 
   </tr> 
   <tr> 
    <td width="108" valign="top"> <p>2.4.2020.</p> </td> 
    <td width="484" valign="top"> <p>7. Gradient descent algorithm homework discussion</p> <p><a href="https://mail.google.com/mail/u/0/#inbox/FMfcgxwHMZSBHrRZCfWQwxLRJmZtVvrM?projector=1">https://mail.google.com/mail/u/0/#inbox/FMfcgxwHMZSBHrRZCfWQwxLRJmZtVvrM?projector=1</a></p> <p>&nbsp;</p> <p>8. Linear Algebra theory</p> <p><a href="https://drive.google.com/file/d/1Ak_HNkXtROJJNF76Rj4oV3RRQs-pfZ6D/view">https://drive.google.com/file/d/1Ak_HNkXtROJJNF76Rj4oV3RRQs-pfZ6D/view</a></p> <p>&nbsp;</p> <p>9. Linear Algebra implementation Python</p> <p><a href="https://drive.google.com/file/d/1LEbq7VKQ4u1NlHVJn9O2EdQOlnO8f4BK/view">https://drive.google.com/file/d/1LEbq7VKQ4u1NlHVJn9O2EdQOlnO8f4BK/view</a></p> <p>&nbsp;</p> <p>10. MTutor discussion and Multivariate Gradient Descent </p> <p><a href="https://drive.google.com/file/d/1AtPypH5PY9QOtvXN1aNO1d6-Oe8Ez-9K/view">https://drive.google.com/file/d/1AtPypH5PY9QOtvXN1aNO1d6-Oe8Ez-9K/view</a></p> <p>&nbsp;</p> </td> 
    <td width="16" valign="top"> <p>&nbsp;</p> </td> 
    <td width="16" valign="top"> <p>&nbsp;</p> </td> 
   </tr> 
   <tr> 
    <td width="108" valign="top"> <p>3.4.2020.</p> </td> 
    <td width="484" valign="top"> <p>11. Homework discussion (Normal equation implementation in Python)</p> <p><a href="https://drive.google.com/file/d/1Fl70o7dhwaGk5KjCmr14kIfZapxvsH9m/view">https://drive.google.com/file/d/1Fl70o7dhwaGk5KjCmr14kIfZapxvsH9m/view</a></p> <p>&nbsp;</p> <p>12. Multivariate Gradient descent implementation I part</p> <p><a href="https://drive.google.com/file/d/1BVjtCrSQzVwgD00H1PghifusUAq7VFuz/view">https://drive.google.com/file/d/1BVjtCrSQzVwgD00H1PghifusUAq7VFuz/view</a></p> <p>&nbsp;</p> <p>13.&nbsp; Multivariate Gradient descent implementation II part</p> <p><a href="https://drive.google.com/file/d/1Gkq3vYRawtxsuB-Ve71JGysXk9Gf5ZEy/view">https://drive.google.com/file/d/1Gkq3vYRawtxsuB-Ve71JGysXk9Gf5ZEy/view</a></p> <p>14. MTutor test and discussion</p> <p>&nbsp;</p> </td> 
    <td width="16" valign="top"> <p>&nbsp;</p> </td> 
    <td width="16" valign="top"> <p>&nbsp;</p> </td> 
   </tr> 
   <tr> 
    <td width="108" valign="top"> <p><a></a>4.4.2020.</p> </td> 
    <td width="484" valign="top"> <p>weekend</p> </td> 
    <td width="16" valign="top"> <p>&nbsp;</p> </td> 
    <td width="16" valign="top"> <p>&nbsp;</p> </td> 
   </tr> 
   <tr> 
    <td width="108" valign="top"> <p>5.4.2020.</p> </td> 
    <td width="484" valign="top"> <p>weekend</p> </td> 
    <td width="16" valign="top"> <p>&nbsp;</p> </td> 
    <td width="16" valign="top"> <p>&nbsp;</p> </td> 
   </tr> 
   <tr> 
    <td width="108" valign="top"> <p>6.4.2020.</p> </td> 
    <td width="484" valign="top"> <p>15. Homework discussion, Multivariate Linear Regression and Logistic Regression theory 1. part</p> <p><a href="https://drive.google.com/file/d/1k4ADC_GGb5BKMFSLwA66jcw3zyj9jy7J/view">https://drive.google.com/file/d/1k4ADC_GGb5BKMFSLwA66jcw3zyj9jy7J/view</a></p> <p>16. Logistic Regression theory 2. part</p> <p><a href="https://drive.google.com/file/d/1sUZ6INc-abdMcKUopSQFfpWFU_JyLSAw/view">https://drive.google.com/file/d/1sUZ6INc-abdMcKUopSQFfpWFU_JyLSAw/view</a></p> <p>&nbsp;</p> <p>17. Logistic Regression Python implementation part 1.</p> <p><a href="https://drive.google.com/file/d/14GOK64Mc584m7qaMwq07IpmqLqXU1Kku/view">https://drive.google.com/file/d/14GOK64Mc584m7qaMwq07IpmqLqXU1Kku/view</a></p> <p>18. Logistic Regression Python implementation part 2.</p> <p><a href="https://drive.google.com/file/d/14nGDY9tDJv0866sh0t10Y92YgVMhbbNv/view">https://drive.google.com/file/d/14nGDY9tDJv0866sh0t10Y92YgVMhbbNv/view</a></p> <p>19. Mtutor test discussion and doubts clarification</p> <p><a href="https://drive.google.com/file/d/1vAU_0FunLnIMrUVLvfB-s1CxWsMfIYDe/view">https://drive.google.com/file/d/1vAU_https://drive.google.com/file/d/1vAU_0FunLnIMrUVLvfB-s1CxWsMfIYDe/view0FunLnIMrUVLvfB-s1CxWsMfIYDe/view</a></p> <p>&nbsp;</p> </td> 
    <td width="16" valign="top"> <p>&nbsp;</p> </td> 
    <td width="16" valign="top"> <p>&nbsp;</p> </td> 
   </tr> 
   <tr> 
    <td width="108" valign="top"> <p>7.4.2020.</p> </td> 
    <td width="484" valign="top"> <p>Tuesday</p> </td> 
    <td width="16" valign="top"> <p>&nbsp;</p> </td> 
    <td width="16" valign="top"> <p>&nbsp;</p> </td> 
   </tr> 
   <tr> 
    <td width="108" valign="top"> <p>8.4.2020.</p> </td> 
    <td width="484" valign="top"> <p>20. Homework discussion, Multiclass logistic regression and Overfitting</p> <p><a href="https://drive.google.com/file/d/15wyeQyB7C4ra458X4JUOUtO64iAptEtp/view">https://drive.google.com/file/d/15wyeQyB7C4ra458X4JUOUtO64iAptEtp/view</a></p> <p>21. Regularization and Neural Networks Introduction</p> <p><a href="https://drive.google.com/file/d/1UwOdOQk-GNDtkFDUm9HWs7TikeuXfvwK/view">https://drive.google.com/file/d/1UwOdOQk-GNDtkFDUm9HWs7TikeuXfvwK/view</a></p> <p>22. Neural Networks</p> <p><a href="https://drive.google.com/file/d/1NceSFJhFYptVg4a6u4uoO-8rkExe-zD1/view">https://drive.google.com/file/d/1NceSFJhFYptVg4a6u4uoO-8rkExe-zD1/view</a></p> <p>23. Neural Networks-Feedforward implementation</p> <p><a href="https://drive.google.com/file/d/1OWQZy7LNZrURbv5dDgNAS-x8_Fgy_fKU/view">https://drive.google.com/file/d/1OWQZy7LNZrURbv5dDgNAS-x8_Fgy_fKU/view</a></p> <p>24. Neural Networks-Feedforward implementation and mtutor discussion</p> <p><a href="https://drive.google.com/file/d/1cBn2P3jxbSBcAPwFxUw3kfv3n76haXWk/view">https://drive.google.com/file/d/1cBn2P3jxbSBcAPwFxUw3kfv3n76haXWk/view</a></p> <p>&nbsp;</p> </td> 
    <td width="16" valign="top"> <p>&nbsp;</p> </td> 
    <td width="16" valign="top"> <p>&nbsp;</p> </td> 
   </tr> 
   <tr> 
    <td width="108" valign="top"> <p>9.4.2020.</p> </td> 
    <td width="484" valign="top"> <p>25. Homework discussion (regularization implementation) and feedforward network</p> <p><a href="https://drive.google.com/file/d/1RsjwIrxXdLZPjlogtOTB_rKPZ6U98j6y/view">https://drive.google.com/file/d/1RsjwIrxXdLZPjlogtOTB_rKPZ6U98j6y/view</a></p> <p>26. Feed forward network implementation in Python</p> <p><a href="https://drive.google.com/file/d/1zMwW8Ibwi6Jx-IvDhSBym7l7U9dReLY_/view">https://drive.google.com/file/d/1zMwW8Ibwi6Jx-IvDhSBym7l7U9dReLY_/view</a></p> <p>First Midterm test</p> </td> 
    <td width="16" valign="top"> <p>&nbsp;</p> </td> 
    <td width="16" valign="top"> <p>&nbsp;</p> </td> 
   </tr> 
   <tr> 
    <td width="108" valign="top"> <p>10.4.2020.</p> </td> 
    <td width="484" valign="top"> <p>27. Homework discussion and Backward propagation</p> <p><a href="https://drive.google.com/file/d/13pTJNgNK96Dyksd-Q0bn39cmlSDXi_5J/view">https://drive.google.com/file/d/13pTJNgNK96Dyksd-Q0bn39cmlSDXi_5J/view</a></p> <p>28. Backward propagation</p> <p><a href="https://drive.google.com/file/d/1Mtb29DAX-yrnJj6liTjsNpn5uXKJlhzF/view">https://drive.google.com/file/d/1Mtb29DAX-yrnJj6liTjsNpn5uXKJlhzF/view</a></p> <p>29. Backward propagation implementation 1.part</p> <p><a href="https://drive.google.com/file/d/1ou2H5Q4xU07CQuxk23MXTFiSR-tPfZoD/view">https://drive.google.com/file/d/1ou2H5Q4xU07CQuxk23MXTFiSR-tPfZoD/view</a></p> <p>30. Backward propagation implementation 2.part</p> <p><a href="https://drive.google.com/file/d/1bhOxaWHlXP5QZG_IAGs-3st0r22rum53/view">https://drive.google.com/file/d/1bhOxaWHlXP5QZG_IAGs-3st0r22rum53/view</a></p> <p>31. Mtutor test</p> <p>&nbsp;</p> </td> 
    <td width="16" valign="top"> <p>&nbsp;</p> </td> 
    <td width="16" valign="top"> <p>&nbsp;</p> </td> 
   </tr> 
   <tr> 
    <td width="108" valign="top"> <p>11.4.2020.</p> </td> 
    <td width="484" valign="top"> <p>weekend</p> </td> 
    <td width="16" valign="top"> <p>&nbsp;</p> </td> 
    <td width="16" valign="top"> <p>&nbsp;</p> </td> 
   </tr> 
   <tr> 
    <td width="108" valign="top"> <p>12.4.2020.</p> </td> 
    <td width="484" valign="top"> <p>weekend</p> </td> 
    <td width="16" valign="top"> <p>&nbsp;</p> </td> 
    <td width="16" valign="top"> <p>&nbsp;</p> </td> 
   </tr> 
   <tr> 
    <td width="108" valign="top"> <p>13.4.2020.</p> </td> 
    <td width="484" valign="top"> <p>32. Homework discussion (feedforward propagation) and backward propagation</p> <p><a href="https://drive.google.com/file/d/1HaiqEDYnLhJOWsct70tlu6sls5shmVSe/view">https://drive.google.com/file/d/1HaiqEDYnLhJOWsct70tlu6sls5shmVSe/view</a></p> <p>33. Backward propagation implementation 1. part</p> <p><a href="https://drive.google.com/file/d/1HaiqEDYnLhJOWsct70tlu6sls5shmVSe/view">https://drive.google.com/file/d/1HaiqEDYnLhJOWsct70tlu6sls5shmVSe/view</a></p> <p>34. Backward propagation implementation 2. part, video is not recorded, but the code is uploaded on the course page</p> <p>35. Backward propagation implementation 3. Part</p> <p><a href="https://drive.google.com/file/d/13dGTrHaMLDiabzoBfnfjxLCxXoKSDd1K/view">https://drive.google.com/file/d/13dGTrHaMLDiabzoBfnfjxLCxXoKSDd1K/view</a></p> <p>36. Mtutor test discussion</p> <p><a href="https://drive.google.com/file/d/13WGPUStuNkbmJsE4HF0gbp9q5Zo14ipi/view">https://drive.google.com/file/d/13WGPUStuNkbmJsE4HF0gbp9q5Zo14ipi/view</a></p> </td> 
    <td width="16" valign="top"> <p>&nbsp;</p> </td> 
    <td width="16" valign="top"> <p>&nbsp;</p> </td> 
   </tr> 
   <tr> 
    <td width="108" valign="top"> <p>14.4.2020.</p> </td> 
    <td width="484" valign="top"> <p>Tuesday, no class</p> </td> 
    <td width="16" valign="top"> <p>&nbsp;</p> </td> 
    <td width="16" valign="top"> <p>&nbsp;</p> </td> 
   </tr> 
   <tr> 
    <td width="108" valign="top"> <p>15.4.2020.</p> </td> 
    <td width="484" valign="top"> <p>37. Homework discussion (Backward prop) and Nonlinear Classifiers tutorial</p> <p><a href="https://drive.google.com/file/d/10QdDa4cFHWLJqkHDOeC7vjIUla73SeUT/view">https://drive.google.com/file/d/10QdDa4cFHWLJqkHDOeC7vjIUla73SeUT/view</a></p> <p>38. Kmeans theory</p> <p><a href="https://drive.google.com/file/d/1_2mE-s1yv5OtZBtYqVPzWvOsilshe8_0/view">https://drive.google.com/file/d/1_2mE-s1yv5OtZBtYqVPzWvOsilshe8_0/view</a></p> <p>39. Kmeans implementation</p> <p><a href="https://drive.google.com/file/d/1ocsUnhya7zxum0CnnvPB6DPi1fpOrCHQ/view">https://drive.google.com/file/d/1ocsUnhya7zxum0CnnvPB6DPi1fpOrCHQ/view</a></p> <p>40. Kmeans implementation</p> <p><a href="https://drive.google.com/file/d/166jwFS71OiyYk_f6SgkfUVYjM-CQ5_iv/view">https://drive.google.com/file/d/166jwFS71OiyYk_f6SgkfUVYjM-CQ5_iv/view</a></p> <p>41. Kmeans implementation</p> <p><a href="https://drive.google.com/file/d/1ketcEZYZhcd-hK5seq0HZbElJdBTLR6T/view">https://drive.google.com/file/d/1ketcEZYZhcd-hK5seq0HZbElJdBTLR6T/view</a></p> <p>&nbsp;</p> </td> 
    <td width="16" valign="top"> <p>&nbsp;</p> </td> 
    <td width="16" valign="top"> <p>&nbsp;</p> </td> 
   </tr> 
   <tr> 
    <td width="108" valign="top"> <p>16.4.2020.</p> </td> 
    <td width="484" valign="top"> <p>&nbsp;</p> </td> 
    <td width="16" valign="top"> <p>&nbsp;</p> </td> 
    <td width="16" valign="top"> <p>&nbsp;</p> </td> 
   </tr> 
   <tr> 
    <td width="108" valign="top"> <p>17.4.2020.</p> </td> 
    <td width="484" valign="top"> <p>&nbsp;</p> </td> 
    <td width="16" valign="top"> <p>&nbsp;</p> </td> 
    <td width="16" valign="top"> <p>&nbsp;</p> </td> 
   </tr> 
   <tr> 
    <td width="108" valign="top"> <p>18.4.2020.</p> </td> 
    <td width="484" valign="top"> <p>&nbsp;</p> </td> 
    <td width="16" valign="top"> <p>&nbsp;</p> </td> 
    <td width="16" valign="top"> <p>&nbsp;</p> </td> 
   </tr> 
   <tr> 
    <td width="108" valign="top"> <p>19.4.2020.</p> </td> 
    <td width="484" valign="top"> <p>&nbsp;</p> </td> 
    <td width="16" valign="top"> <p>&nbsp;</p> </td> 
    <td width="16" valign="top"> <p>&nbsp;</p> </td> 
   </tr> 
   <tr> 
    <td width="108" valign="top"> <p>20.4.2020.</p> </td> 
    <td width="484" valign="top"> <p>&nbsp;</p> </td> 
    <td width="16" valign="top"> <p>&nbsp;</p> </td> 
    <td width="16" valign="top"> <p>&nbsp;</p> </td> 
   </tr> 
   <tr> 
    <td width="108" valign="top"> <p>21.4.2020.</p> </td> 
    <td width="484" valign="top"> <p>&nbsp;</p> </td> 
    <td width="16" valign="top"> <p>&nbsp;</p> </td> 
    <td width="16" valign="top"> <p>&nbsp;</p> </td> 
   </tr> 
  </tbody>
 </table>
 <br>
 <div class="attachedimages"></div>
</div>', '[]');
INSERT INTO "public"."subject_posts" VALUES (37, 17412, 'Midterm tests results 21.4.2020.', 'Marina Marjanović Jakovljević', 1587489660000, '<div >
 <p></p>
 <div>
  Second Midterm Test
 </div>2018230172&nbsp;28
 <br>
 <div>
  2018230210&nbsp;27
 </div>
 <div>
  2017230094&nbsp;25
 </div>
 <div>
  2017230018&nbsp;24
 </div>
 <div>
  2017230127&nbsp;26
  <br>
 </div>
 <div>
  2017230266&nbsp;27
 </div>
 <div>
  2017230189&nbsp;23
  <br>
 </div>
 <div>
  2017230143&nbsp;15
 </div>
 <div>
  2017203893&nbsp;20&nbsp;
  <br>
 </div>
 <div>
  2017201512&nbsp;19
 </div>
 <div>
  2017230087&nbsp;18
  <br>
 </div>
 <div>
  2017230170&nbsp;15&nbsp;
  <br>
 </div>
 <div>
  <br>
 </div>
 <div>
  First Midterm Test&nbsp;&nbsp;
  <br>
 </div>
 <div>
  2017201512&nbsp;20
 </div>
 <div>
  2017230143&nbsp;20
  <br>
 </div>
 <div>
  2017230087&nbsp;17
 </div>
 <div>
  2017230170&nbsp;12
  <br>
 </div>
 <div>
  2017230127&nbsp; 24
 </div>
 <br>
 <div class="attachedimages"></div>
</div>', '[]');
INSERT INTO "public"."subject_posts" VALUES (38, 16902, 'viideo links 10.04.2020.', 'Marina Marjanović Jakovljević', 1586625720000, '<div >
 <p></p>
 <table border="1" cellspacing="0" cellpadding="0" width="623"> 
  <tbody>
   <tr> 
    <td width="108" valign="top"> <p>30.3.2020.</p> </td> 
    <td width="484" valign="top"> <p>1. Introduction to Machine Learning</p> <p><a href="https://drive.google.com/file/d/17gpMxUyjN8zphe5ofGN62YK9M3xZ2L-j/view">https://drive.google.com/file/d/17gpMxUyjN8zphe5ofGN62YK9M3xZ2L-j/view</a></p> <p>2. Linear Regression and Gradient Descent</p> <p><a href="https://drive.google.com/file/d/14fCrterffR64FEyXSpsvVnUhNU4T5rgb/view">https://drive.google.com/file/d/14fCrterffR64FEyXSpsvVnUhNU4T5rgb/view</a></p> <p>&nbsp;</p> <p>3. Test and partial derivative calculation</p> <p><a href="https://drive.google.com/file/d/1wiwG4jBIAFgPmjINykBpTz2XV68ewxOl/view">https://drive.google.com/file/d/1wiwG4jBIAFgPmjINykBpTz2XV68ewxOl/view</a></p> <p>&nbsp;</p> </td> 
    <td width="16" valign="top"> <p>&nbsp;</p> </td> 
    <td width="16" valign="top"> <p>&nbsp;</p> </td> 
   </tr> 
   <tr> 
    <td width="108" valign="top"> <p>1.4.2020.</p> </td> 
    <td width="484" valign="top"> <p>4. Linear Regression and Gradient Descent implementation and vectorising</p> <p><a href="https://drive.google.com/file/d/12lkgCpHFAaMItqWUhPU_2IRXFcWY5CCw/view">https://drive.google.com/file/d/12lkgCpHFAaMItqWUhPU_2IRXFcWY5CCw/view</a></p> <p>&nbsp;</p> <p>5. Linear Algebra</p> <p><a href="https://drive.google.com/file/d/1zi9Iic4u1tSbMJgUDrs41SK5XVryLPjz/view">https://drive.google.com/file/d/1zi9Iic4u1tSbMJgUDrs41SK5XVryLPjz/view</a></p> <p>6. Linear algebra and test</p> <p><a href="https://drive.google.com/file/d/13NY30ypQH_N6JW9TQLToqONb-uQ7o-tz/view">https://drive.google.com/file/d/13NY30ypQH_N6JW9TQLToqONb-uQ7o-tz/view</a></p> <p>&nbsp;</p> <p>&nbsp;</p> </td> 
    <td width="16" valign="top"> <p>&nbsp;</p> </td> 
    <td width="16" valign="top"> <p>&nbsp;</p> </td> 
   </tr> 
   <tr> 
    <td width="108" valign="top"> <p>2.4.2020.</p> </td> 
    <td width="484" valign="top"> <p>7. Gradient descent algorithm homework discussion</p> <p><a href="https://mail.google.com/mail/u/0/#inbox/FMfcgxwHMZSBHrRZCfWQwxLRJmZtVvrM?projector=1">https://mail.google.com/mail/u/0/#inbox/FMfcgxwHMZSBHrRZCfWQwxLRJmZtVvrM?projector=1</a></p> <p>&nbsp;</p> <p>8. Linear Algebra theory</p> <p><a href="https://drive.google.com/file/d/1Ak_HNkXtROJJNF76Rj4oV3RRQs-pfZ6D/view">https://drive.google.com/file/d/1Ak_HNkXtROJJNF76Rj4oV3RRQs-pfZ6D/view</a></p> <p>&nbsp;</p> <p>9. Linear Algebra implementation Python</p> <p><a href="https://drive.google.com/file/d/1LEbq7VKQ4u1NlHVJn9O2EdQOlnO8f4BK/view">https://drive.google.com/file/d/1LEbq7VKQ4u1NlHVJn9O2EdQOlnO8f4BK/view</a></p> <p>&nbsp;</p> <p>10. MTutor discussion and Multivariate Gradient Descent </p> <p><a href="https://drive.google.com/file/d/1AtPypH5PY9QOtvXN1aNO1d6-Oe8Ez-9K/view">https://drive.google.com/file/d/1AtPypH5PY9QOtvXN1aNO1d6-Oe8Ez-9K/view</a></p> <p>&nbsp;</p> </td> 
    <td width="16" valign="top"> <p>&nbsp;</p> </td> 
    <td width="16" valign="top"> <p>&nbsp;</p> </td> 
   </tr> 
   <tr> 
    <td width="108" valign="top"> <p>3.4.2020.</p> </td> 
    <td width="484" valign="top"> <p>11. Homework discussion (Normal equation implementation in Python)</p> <p><a href="https://drive.google.com/file/d/1Fl70o7dhwaGk5KjCmr14kIfZapxvsH9m/view">https://drive.google.com/file/d/1Fl70o7dhwaGk5KjCmr14kIfZapxvsH9m/view</a></p> <p>&nbsp;</p> <p>12. Multivariate Gradient descent implementation I part</p> <p><a href="https://drive.google.com/file/d/1BVjtCrSQzVwgD00H1PghifusUAq7VFuz/view">https://drive.google.com/file/d/1BVjtCrSQzVwgD00H1PghifusUAq7VFuz/view</a></p> <p>&nbsp;</p> <p>13.&nbsp; Multivariate Gradient descent implementation II part</p> <p><a href="https://drive.google.com/file/d/1Gkq3vYRawtxsuB-Ve71JGysXk9Gf5ZEy/view">https://drive.google.com/file/d/1Gkq3vYRawtxsuB-Ve71JGysXk9Gf5ZEy/view</a></p> <p>14. MTutor test and discussion</p> <p>&nbsp;</p> </td> 
    <td width="16" valign="top"> <p>&nbsp;</p> </td> 
    <td width="16" valign="top"> <p>&nbsp;</p> </td> 
   </tr> 
   <tr> 
    <td width="108" valign="top"> <p><a></a>4.4.2020.</p> </td> 
    <td width="484" valign="top"> <p>weekend</p> </td> 
    <td width="16" valign="top"> <p>&nbsp;</p> </td> 
    <td width="16" valign="top"> <p>&nbsp;</p> </td> 
   </tr> 
   <tr> 
    <td width="108" valign="top"> <p>5.4.2020.</p> </td> 
    <td width="484" valign="top"> <p>weekend</p> </td> 
    <td width="16" valign="top"> <p>&nbsp;</p> </td> 
    <td width="16" valign="top"> <p>&nbsp;</p> </td> 
   </tr> 
   <tr> 
    <td width="108" valign="top"> <p>6.4.2020.</p> </td> 
    <td width="484" valign="top"> <p>15. Homework discussion, Multivariate Linear Regression and Logistic Regression theory 1. part</p> <p><a href="https://drive.google.com/file/d/1k4ADC_GGb5BKMFSLwA66jcw3zyj9jy7J/view">https://drive.google.com/file/d/1k4ADC_GGb5BKMFSLwA66jcw3zyj9jy7J/view</a></p> <p>16. Logistic Regression theory 2. part</p> <p><a href="https://drive.google.com/file/d/1sUZ6INc-abdMcKUopSQFfpWFU_JyLSAw/view">https://drive.google.com/file/d/1sUZ6INc-abdMcKUopSQFfpWFU_JyLSAw/view</a></p> <p>&nbsp;</p> <p>17. Logistic Regression Python implementation part 1.</p> <p><a href="https://drive.google.com/file/d/14GOK64Mc584m7qaMwq07IpmqLqXU1Kku/view">https://drive.google.com/file/d/14GOK64Mc584m7qaMwq07IpmqLqXU1Kku/view</a></p> <p>18. Logistic Regression Python implementation part 2.</p> <p><a href="https://drive.google.com/file/d/14nGDY9tDJv0866sh0t10Y92YgVMhbbNv/view">https://drive.google.com/file/d/14nGDY9tDJv0866sh0t10Y92YgVMhbbNv/view</a></p> <p>19. Mtutor test discussion and doubts clarification</p> <p><a href="https://drive.google.com/file/d/1vAU_0FunLnIMrUVLvfB-s1CxWsMfIYDe/view">https://drive.google.com/file/d/1vAU_https://drive.google.com/file/d/1vAU_0FunLnIMrUVLvfB-s1CxWsMfIYDe/view0FunLnIMrUVLvfB-s1CxWsMfIYDe/view</a></p> <p>&nbsp;</p> </td> 
    <td width="16" valign="top"> <p>&nbsp;</p> </td> 
    <td width="16" valign="top"> <p>&nbsp;</p> </td> 
   </tr> 
   <tr> 
    <td width="108" valign="top"> <p>7.4.2020.</p> </td> 
    <td width="484" valign="top"> <p>Tuesday</p> </td> 
    <td width="16" valign="top"> <p>&nbsp;</p> </td> 
    <td width="16" valign="top"> <p>&nbsp;</p> </td> 
   </tr> 
   <tr> 
    <td width="108" valign="top"> <p>8.4.2020.</p> </td> 
    <td width="484" valign="top"> <p>20. Homework discussion, Multiclass logistic regression and Overfitting</p> <p><a href="https://drive.google.com/file/d/15wyeQyB7C4ra458X4JUOUtO64iAptEtp/view">https://drive.google.com/file/d/15wyeQyB7C4ra458X4JUOUtO64iAptEtp/view</a></p> <p>21. Regularization and Neural Networks Introduction</p> <p><a href="https://drive.google.com/file/d/1UwOdOQk-GNDtkFDUm9HWs7TikeuXfvwK/view">https://drive.google.com/file/d/1UwOdOQk-GNDtkFDUm9HWs7TikeuXfvwK/view</a></p> <p>22. Neural Networks</p> <p><a href="https://drive.google.com/file/d/1NceSFJhFYptVg4a6u4uoO-8rkExe-zD1/view">https://drive.google.com/file/d/1NceSFJhFYptVg4a6u4uoO-8rkExe-zD1/view</a></p> <p>23. Neural Networks-Feedforward implementation</p> <p><a href="https://drive.google.com/file/d/1OWQZy7LNZrURbv5dDgNAS-x8_Fgy_fKU/view">https://drive.google.com/file/d/1OWQZy7LNZrURbv5dDgNAS-x8_Fgy_fKU/view</a></p> <p>24. Neural Networks-Feedforward implementation and mtutor discussion</p> <p><a href="https://drive.google.com/file/d/1cBn2P3jxbSBcAPwFxUw3kfv3n76haXWk/view">https://drive.google.com/file/d/1cBn2P3jxbSBcAPwFxUw3kfv3n76haXWk/view</a></p> <p>&nbsp;</p> </td> 
    <td width="16" valign="top"> <p>&nbsp;</p> </td> 
    <td width="16" valign="top"> <p>&nbsp;</p> </td> 
   </tr> 
   <tr> 
    <td width="108" valign="top"> <p>9.4.2020.</p> </td> 
    <td width="484" valign="top"> <p>25. Homework discussion (regularization implementation) and feedforward network</p> <p><a href="https://drive.google.com/file/d/1RsjwIrxXdLZPjlogtOTB_rKPZ6U98j6y/view">https://drive.google.com/file/d/1RsjwIrxXdLZPjlogtOTB_rKPZ6U98j6y/view</a></p> <p>26. Feed forward network implementation in Python</p> <p><a href="https://drive.google.com/file/d/1zMwW8Ibwi6Jx-IvDhSBym7l7U9dReLY_/view">https://drive.google.com/file/d/1zMwW8Ibwi6Jx-IvDhSBym7l7U9dReLY_/view</a></p> <p>First Midterm test</p> </td> 
    <td width="16" valign="top"> <p>&nbsp;</p> </td> 
    <td width="16" valign="top"> <p>&nbsp;</p> </td> 
   </tr> 
   <tr> 
    <td width="108" valign="top"> <p>10.4.2020.</p> </td> 
    <td width="484" valign="top"> <p>27. Homework discussion and Backward propagation</p> <p><a href="https://drive.google.com/file/d/13pTJNgNK96Dyksd-Q0bn39cmlSDXi_5J/view">https://drive.google.com/file/d/13pTJNgNK96Dyksd-Q0bn39cmlSDXi_5J/view</a></p> <p>28. Backward propagation</p> <p><a href="https://drive.google.com/file/d/1Mtb29DAX-yrnJj6liTjsNpn5uXKJlhzF/view">https://drive.google.com/file/d/1Mtb29DAX-yrnJj6liTjsNpn5uXKJlhzF/view</a></p> <p>29. Backward propagation implementation 1.part</p> <p><a href="https://drive.google.com/file/d/1ou2H5Q4xU07CQuxk23MXTFiSR-tPfZoD/view">https://drive.google.com/file/d/1ou2H5Q4xU07CQuxk23MXTFiSR-tPfZoD/view</a></p> <p>30. Backward propagation implementation 2.part</p> <p><a href="https://drive.google.com/file/d/1bhOxaWHlXP5QZG_IAGs-3st0r22rum53/view">https://drive.google.com/file/d/1bhOxaWHlXP5QZG_IAGs-3st0r22rum53/view</a></p> <p>31. Mtutor test</p> <p>&nbsp;</p> <p>&nbsp;</p> <p>&nbsp;</p> <p>&nbsp;</p> <p>&nbsp;</p> </td> 
    <td width="16" valign="top"> <p>&nbsp;</p> </td> 
    <td width="16" valign="top"> <p>&nbsp;</p> </td> 
   </tr> 
   <tr> 
    <td width="108" valign="top"> <p>11.4.2020.</p> </td> 
    <td width="484" valign="top"> <p>&nbsp;</p> </td> 
    <td width="16" valign="top"> <p>&nbsp;</p> </td> 
    <td width="16" valign="top"> <p>&nbsp;</p> </td> 
   </tr> 
   <tr> 
    <td width="108" valign="top"> <p>12.4.2020.</p> </td> 
    <td width="484" valign="top"> <p>&nbsp;</p> </td> 
    <td width="16" valign="top"> <p>&nbsp;</p> </td> 
    <td width="16" valign="top"> <p>&nbsp;</p> </td> 
   </tr> 
   <tr> 
    <td width="108" valign="top"> <p>13.4.2020.</p> </td> 
    <td width="484" valign="top"> <p>&nbsp;</p> </td> 
    <td width="16" valign="top"> <p>&nbsp;</p> </td> 
    <td width="16" valign="top"> <p>&nbsp;</p> </td> 
   </tr> 
   <tr> 
    <td width="108" valign="top"> <p>14.4.2020.</p> </td> 
    <td width="484" valign="top"> <p>&nbsp;</p> </td> 
    <td width="16" valign="top"> <p>&nbsp;</p> </td> 
    <td width="16" valign="top"> <p>&nbsp;</p> </td> 
   </tr> 
   <tr> 
    <td width="108" valign="top"> <p>15.4.2020.</p> </td> 
    <td width="484" valign="top"> <p>&nbsp;</p> </td> 
    <td width="16" valign="top"> <p>&nbsp;</p> </td> 
    <td width="16" valign="top"> <p>&nbsp;</p> </td> 
   </tr> 
   <tr> 
    <td width="108" valign="top"> <p>16.4.2020.</p> </td> 
    <td width="484" valign="top"> <p>&nbsp;</p> </td> 
    <td width="16" valign="top"> <p>&nbsp;</p> </td> 
    <td width="16" valign="top"> <p>&nbsp;</p> </td> 
   </tr> 
   <tr> 
    <td width="108" valign="top"> <p>17.4.2020.</p> </td> 
    <td width="484" valign="top"> <p>&nbsp;</p> </td> 
    <td width="16" valign="top"> <p>&nbsp;</p> </td> 
    <td width="16" valign="top"> <p>&nbsp;</p> </td> 
   </tr> 
   <tr> 
    <td width="108" valign="top"> <p>18.4.2020.</p> </td> 
    <td width="484" valign="top"> <p>&nbsp;</p> </td> 
    <td width="16" valign="top"> <p>&nbsp;</p> </td> 
    <td width="16" valign="top"> <p>&nbsp;</p> </td> 
   </tr> 
   <tr> 
    <td width="108" valign="top"> <p>19.4.2020.</p> </td> 
    <td width="484" valign="top"> <p>&nbsp;</p> </td> 
    <td width="16" valign="top"> <p>&nbsp;</p> </td> 
    <td width="16" valign="top"> <p>&nbsp;</p> </td> 
   </tr> 
   <tr> 
    <td width="108" valign="top"> <p>20.4.2020.</p> </td> 
    <td width="484" valign="top"> <p>&nbsp;</p> </td> 
    <td width="16" valign="top"> <p>&nbsp;</p> </td> 
    <td width="16" valign="top"> <p>&nbsp;</p> </td> 
   </tr> 
   <tr> 
    <td width="108" valign="top"> <p>21.4.2020.</p> </td> 
    <td width="484" valign="top"> <p>&nbsp;</p> </td> 
    <td width="16" valign="top"> <p>&nbsp;</p> </td> 
    <td width="16" valign="top"> <p>&nbsp;</p> </td> 
   </tr> 
  </tbody>
 </table>
 <br>
 <div class="attachedimages"></div>
</div>', '[]');
INSERT INTO "public"."subject_posts" VALUES (39, 16657, 'video links 8.4.2020.', 'Marina Marjanović Jakovljević', 1586380140000, '<div >
 <p></p>
 <table border="1" cellspacing="0" cellpadding="0" width="623"> 
  <tbody>
   <tr> 
    <td width="108" valign="top"> <p>30.3.2020.</p> </td> 
    <td width="484" valign="top"> <p>1. Introduction to Machine Learning</p> <p><a href="https://drive.google.com/file/d/17gpMxUyjN8zphe5ofGN62YK9M3xZ2L-j/view">https://drive.google.com/file/d/17gpMxUyjN8zphe5ofGN62YK9M3xZ2L-j/view</a></p> <p>2. Linear Regression and Gradient Descent</p> <p><a href="https://drive.google.com/file/d/14fCrterffR64FEyXSpsvVnUhNU4T5rgb/view">https://drive.google.com/file/d/14fCrterffR64FEyXSpsvVnUhNU4T5rgb/view</a></p> <p>&nbsp;</p> <p>3. Test and partial derivative calculation</p> <p><a href="https://drive.google.com/file/d/1wiwG4jBIAFgPmjINykBpTz2XV68ewxOl/view">https://drive.google.com/file/d/1wiwG4jBIAFgPmjINykBpTz2XV68ewxOl/view</a></p> <p>&nbsp;</p> </td> 
   </tr> 
   <tr> 
    <td width="108" valign="top"> <p>1.4.2020.</p> </td> 
    <td width="484" valign="top"> <p>4. Linear Regression and Gradient Descent implementation and vectorising</p> <p><a href="https://drive.google.com/file/d/12lkgCpHFAaMItqWUhPU_2IRXFcWY5CCw/view">https://drive.google.com/file/d/12lkgCpHFAaMItqWUhPU_2IRXFcWY5CCw/view</a></p> <p>&nbsp;</p> <p>5. Linear Algebra</p> <p><a href="https://drive.google.com/file/d/1zi9Iic4u1tSbMJgUDrs41SK5XVryLPjz/view">https://drive.google.com/file/d/1zi9Iic4u1tSbMJgUDrs41SK5XVryLPjz/view</a></p> <p>6. Linear algebra and test</p> <p><a href="https://drive.google.com/file/d/13NY30ypQH_N6JW9TQLToqONb-uQ7o-tz/view">https://drive.google.com/file/d/13NY30ypQH_N6JW9TQLToqONb-uQ7o-tz/view</a></p> <p>&nbsp;</p> <p>&nbsp;</p> </td> 
   </tr> 
   <tr> 
    <td width="108" valign="top"> <p>2.4.2020.</p> </td> 
    <td width="484" valign="top"> <p>7. Gradient descent algorithm homework discussion</p> <p><a href="https://mail.google.com/mail/u/0/#inbox/FMfcgxwHMZSBHrRZCfWQwxLRJmZtVvrM?projector=1">https://mail.google.com/mail/u/0/#inbox/FMfcgxwHMZSBHrRZCfWQwxLRJmZtVvrM?projector=1</a></p> <p>&nbsp;</p> <p>8. Linear Algebra theory</p> <p><a href="https://drive.google.com/file/d/1Ak_HNkXtROJJNF76Rj4oV3RRQs-pfZ6D/view">https://drive.google.com/file/d/1Ak_HNkXtROJJNF76Rj4oV3RRQs-pfZ6D/view</a></p> <p>&nbsp;</p> <p>9. Linear Algebra implementation Python</p> <p><a href="https://drive.google.com/file/d/1LEbq7VKQ4u1NlHVJn9O2EdQOlnO8f4BK/view">https://drive.google.com/file/d/1LEbq7VKQ4u1NlHVJn9O2EdQOlnO8f4BK/view</a></p> <p>&nbsp;</p> <p>10. MTutor discussion and Multivariate Gradient Descent </p> <p><a href="https://drive.google.com/file/d/1AtPypH5PY9QOtvXN1aNO1d6-Oe8Ez-9K/view">https://drive.google.com/file/d/1AtPypH5PY9QOtvXN1aNO1d6-Oe8Ez-9K/view</a></p> <p>&nbsp;</p> </td> 
   </tr> 
   <tr> 
    <td width="108" valign="top"> <p>3.4.2020.</p> </td> 
    <td width="484" valign="top"> <p>11. Homework discussion (Normal equation implementation in Python)</p> <p><a href="https://drive.google.com/file/d/1Fl70o7dhwaGk5KjCmr14kIfZapxvsH9m/view">https://drive.google.com/file/d/1Fl70o7dhwaGk5KjCmr14kIfZapxvsH9m/view</a></p> <p>&nbsp;</p> <p>12. Multivariate Gradient descent implementation I part</p> <p><a href="https://drive.google.com/file/d/1BVjtCrSQzVwgD00H1PghifusUAq7VFuz/view">https://drive.google.com/file/d/1BVjtCrSQzVwgD00H1PghifusUAq7VFuz/view</a></p> <p>&nbsp;</p> <p>13.&nbsp; Multivariate Gradient descent implementation II part</p> <p><a href="https://drive.google.com/file/d/1Gkq3vYRawtxsuB-Ve71JGysXk9Gf5ZEy/view">https://drive.google.com/file/d/1Gkq3vYRawtxsuB-Ve71JGysXk9Gf5ZEy/view</a></p> <p>14. MTutor test and discussion</p> <p>&nbsp;</p> </td> 
   </tr> 
   <tr> 
    <td width="108" valign="top"> <p><a></a>4.4.2020.</p> </td> 
    <td width="484" valign="top"> <p>weekend</p> </td> 
   </tr> 
   <tr> 
    <td width="108" valign="top"> <p>5.4.2020.</p> </td> 
    <td width="484" valign="top"> <p>weekend</p> </td> 
   </tr> 
   <tr> 
    <td width="108" valign="top"> <p>6.4.2020.</p> </td> 
    <td width="484" valign="top"> <p>15. Homework discussion, Multivariate Linear Regression and Logistic Regression theory 1. part</p> <p><a href="https://drive.google.com/file/d/1k4ADC_GGb5BKMFSLwA66jcw3zyj9jy7J/view">https://drive.google.com/file/d/1k4ADC_GGb5BKMFSLwA66jcw3zyj9jy7J/view</a></p> <p>16. Logistic Regression theory 2. part</p> <p><a href="https://drive.google.com/file/d/1sUZ6INc-abdMcKUopSQFfpWFU_JyLSAw/view">https://drive.google.com/file/d/1sUZ6INc-abdMcKUopSQFfpWFU_JyLSAw/view</a></p> <p>&nbsp;</p> <p>17. Logistic Regression Python implementation part 1.</p> <p><a href="https://drive.google.com/file/d/14GOK64Mc584m7qaMwq07IpmqLqXU1Kku/view">https://drive.google.com/file/d/14GOK64Mc584m7qaMwq07IpmqLqXU1Kku/view</a></p> <p>18. Logistic Regression Python implementation part 2.</p> <p><a href="https://drive.google.com/file/d/14nGDY9tDJv0866sh0t10Y92YgVMhbbNv/view">https://drive.google.com/file/d/14nGDY9tDJv0866sh0t10Y92YgVMhbbNv/view</a></p> <p>19. Mtutor test discussion and doubts clarification</p> <p><a href="https://drive.google.com/file/d/1vAU_0FunLnIMrUVLvfB-s1CxWsMfIYDe/view">https://drive.google.com/file/d/1vAU_https://drive.google.com/file/d/1vAU_0FunLnIMrUVLvfB-s1CxWsMfIYDe/view0FunLnIMrUVLvfB-s1CxWsMfIYDe/view</a></p> <p>&nbsp;</p> </td> 
   </tr> 
   <tr> 
    <td width="108" valign="top"> <p>7.4.2020.</p> </td> 
    <td width="484" valign="top"> <p>Tuesday</p> </td> 
   </tr> 
   <tr> 
    <td width="108" valign="top"> <p>8.4.2020.</p> </td> 
    <td width="484" valign="top"> <p>20. Homework discussion, Multiclass logistic regression and Overfitting</p> <p><a href="https://drive.google.com/file/d/15wyeQyB7C4ra458X4JUOUtO64iAptEtp/view">https://drive.google.com/file/d/15wyeQyB7C4ra458X4JUOUtO64iAptEtp/view</a></p> <p>21. Regularization and Neural Networks Introduction</p> <p><a href="https://drive.google.com/file/d/1UwOdOQk-GNDtkFDUm9HWs7TikeuXfvwK/view">https://drive.google.com/file/d/1UwOdOQk-GNDtkFDUm9HWs7TikeuXfvwK/view</a></p> <p>22. Neural Networks</p> <p><a href="https://drive.google.com/file/d/1NceSFJhFYptVg4a6u4uoO-8rkExe-zD1/view">https://drive.google.com/file/d/1NceSFJhFYptVg4a6u4uoO-8rkExe-zD1/view</a></p> <p>23. Neural Networks-Feedforward implementation</p> <p><a href="https://drive.google.com/file/d/1OWQZy7LNZrURbv5dDgNAS-x8_Fgy_fKU/view">https://drive.google.com/file/d/1OWQZy7LNZrURbv5dDgNAS-x8_Fgy_fKU/view</a></p> <p>24. Neural Networks-Feedforward implementation and mtutor discussion</p> <p><a href="https://drive.google.com/file/d/1cBn2P3jxbSBcAPwFxUw3kfv3n76haXWk/view">https://drive.google.com/file/d/1cBn2P3jxbSBcAPwFxUw3kfv3n76haXWk/view</a></p> <p>&nbsp;</p> </td> 
   </tr> 
  </tbody>
 </table>
 <br>
 <div class="attachedimages"></div>
</div>', '[]');
INSERT INTO "public"."subject_posts" VALUES (40, 19845, 'Links to electronic sessions', 'Branko Perišić', 1591168920000, '<div >
 <p><a href="https://drive.google.com/file/d/1zz1BIAKKHAm9n6_RRYWIo3_qkZNDuZ8d/view?usp=sharing">https://drive.google.com/file/d/1zz1BIAKKHAm9n6_RRYWIo3_qkZNDuZ8d/view?usp=sharing</a><br></p>
 <div class="attachedimages"></div>
</div>', '[]');
INSERT INTO "public"."subject_posts" VALUES (41, 19845, 'Links to electronic sessions', 'Branko Perišić', 1591168920000, '<div >
 <p><a href="https://drive.google.com/file/d/1zz1BIAKKHAm9n6_RRYWIo3_qkZNDuZ8d/view?usp=sharing">https://drive.google.com/file/d/1zz1BIAKKHAm9n6_RRYWIo3_qkZNDuZ8d/view?usp=sharing</a><br></p>
 <div class="attachedimages"></div>
</div>', '[]');
INSERT INTO "public"."subject_posts" VALUES (42, 18907, 'Video - 15.05.2020.', 'Mlađan Jovanović', 1589557320000, '<div >
 <p></p>
 <p>https://drive.google.com/file/d/1oulhWQ7pfeHeqKkXMBObBBgNHwzlD2ja/view?usp=sharing<br></p>
 <p>Best,</p>
 <p>Mladjan</p>
 <div class="attachedimages"></div>
</div>', '[]');
INSERT INTO "public"."subject_posts" VALUES (43, 10850, 'MidTerm Exam 1 Results', 'Nebojša Bačanin Džakula', 1575870000000, '<div >
 <p>Dear Students,</p>
 <p><br></p>
 <p>in the attachment you may find MidTerm Exam 1 results.</p>
 <p><br></p>
 <p>See you today.</p>
 <p><br></p>
 <p>Warmest and best regards,</p>
 <p>Professor</p>
 <p><br></p>
 <div class="attachedimages">
  <br>
  <img src="http://predmet.singidunum.ac.rs/pluginfile.php/17205/mod_forum/attachment/10867/MidTerm%201%20results.JPG" alt="">
 </div>
</div>', '[]');
INSERT INTO "public"."subject_posts" VALUES (44, 10851, 'MidTerm Exam 1 Results', 'Nebojša Bačanin Džakula', 1575870000000, '<div >
 <p>Dear Students,</p>
 <p><br></p>
 <p>in the attachment you may find MidTerm Exam 1 results.</p>
 <p><br></p>
 <p>See you today.</p>
 <p><br></p>
 <p>Warmest and best regards,</p>
 <p>Professor</p>
 <p><br></p>
 <div class="attachedimages">
  <br>
  <img src="http://predmet.singidunum.ac.rs/pluginfile.php/17205/mod_forum/attachment/10868/MidTerm%201%20results.JPG" alt="">
 </div>
</div>', '[]');
INSERT INTO "public"."subject_posts" VALUES (45, 16741, 'First Midterm results', 'Marina Marjanović Jakovljević', 1586450580000, '<div >
 <p>Dear colleagues,</p>
 <p>In the attached file, you can find the first midterm results</p>
 <p><br></p>
 <div class="attachedimages"></div>
</div>', '[{"type":"/images/file_pdf.svg","attachmentLink":"http://predmet.singidunum.ac.rs/pluginfile.php/17276/mod_forum/attachment/16788/FirstMidtermResultsIndex9.4..xlsx.pdf","attachmentTitle":"FirstMidtermResultsIndex9.4..xlsx.pdf"}]');
INSERT INTO "public"."subject_posts" VALUES (46, 15380, 'video links', 'Marina Marjanović Jakovljević', 1585745580000, '<div >
 <p>Video Links</p>
 <div class="attachedimages"></div>
</div>', '[{"type":"http://predmet.singidunum.ac.rs/theme/image.php/clean/core/1589271127/f/document","attachmentLink":"http://predmet.singidunum.ac.rs/pluginfile.php/17276/mod_forum/attachment/15413/tabela%20sa%20linkovima%20%281%29.docx","attachmentTitle":"tabela sa linkovima (1).docx"}]');
INSERT INTO "public"."subject_posts" VALUES (47, 16288, 'video links 3.4.2020.', 'Marina Marjanović Jakovljević', 1585950060000, '<div >
 <p></p>
 <table border="1" cellspacing="0" cellpadding="0"> 
  <tbody>
   <tr> 
    <td width="119" valign="top"> <p>30.3.2020.</p> </td> 
    <td width="475" valign="top"> <p>1. Introduction to Machine Learning</p> <p><a href="https://drive.google.com/file/d/17gpMxUyjN8zphe5ofGN62YK9M3xZ2L-j/view">https://drive.google.com/file/d/17gpMxUyjN8zphe5ofGN62YK9M3xZ2L-j/view</a></p> <p>2. Linear Regression and Gradient Descent</p> <p><a href="https://drive.google.com/file/d/14fCrterffR64FEyXSpsvVnUhNU4T5rgb/view">https://drive.google.com/file/d/14fCrterffR64FEyXSpsvVnUhNU4T5rgb/view</a></p> <p>&nbsp;</p> <p>3. Test and partial derivative calculation</p> <p><a href="https://drive.google.com/file/d/1wiwG4jBIAFgPmjINykBpTz2XV68ewxOl/view">https://drive.google.com/file/d/1wiwG4jBIAFgPmjINykBpTz2XV68ewxOl/view</a></p> <p>&nbsp;</p> </td> 
   </tr> 
   <tr> 
    <td width="119" valign="top"> <p>1.4.2020.</p> </td> 
    <td width="475" valign="top"> <p>4. Linear Regression and Gradient Descent implementation and vectorising</p> <p><a href="https://drive.google.com/file/d/12lkgCpHFAaMItqWUhPU_2IRXFcWY5CCw/view">https://drive.google.com/file/d/12lkgCpHFAaMItqWUhPU_2IRXFcWY5CCw/view</a></p> <p>&nbsp;</p> <p>5. Linear Algebra</p> <p><a href="https://drive.google.com/file/d/1zi9Iic4u1tSbMJgUDrs41SK5XVryLPjz/view">https://drive.google.com/file/d/1zi9Iic4u1tSbMJgUDrs41SK5XVryLPjz/view</a></p> <p>6. Linear algebra and test</p> <p><a href="https://drive.google.com/file/d/13NY30ypQH_N6JW9TQLToqONb-uQ7o-tz/view">https://drive.google.com/file/d/13NY30ypQH_N6JW9TQLToqONb-uQ7o-tz/view</a></p> <p>&nbsp;</p> <p>&nbsp;</p> <p>&nbsp;</p> </td> 
   </tr> 
   <tr> 
    <td width="119" valign="top"> <p>2.4.2020.</p> </td> 
    <td width="475" valign="top"> <p>7. Gradient descent algorithm homework discussion</p> <p><a href="https://mail.google.com/mail/u/0/#inbox/FMfcgxwHMZSBHrRZCfWQwxLRJmZtVvrM?projector=1">https://mail.google.com/mail/u/0/#inbox/FMfcgxwHMZSBHrRZCfWQwxLRJmZtVvrM?projector=1</a></p> <p>&nbsp;</p> <p>8. Linear Algebra theory</p> <p><a href="https://drive.google.com/file/d/1Ak_HNkXtROJJNF76Rj4oV3RRQs-pfZ6D/view">https://drive.google.com/file/d/1Ak_HNkXtROJJNF76Rj4oV3RRQs-pfZ6D/view</a></p> <p>&nbsp;</p> <p>9. Linear Algebra implementation Python</p> <p><a href="https://drive.google.com/file/d/1LEbq7VKQ4u1NlHVJn9O2EdQOlnO8f4BK/view">https://drive.google.com/file/d/1LEbq7VKQ4u1NlHVJn9O2EdQOlnO8f4BK/view</a></p> <p>&nbsp;</p> <p>10. MTutor discussion and Multivariate Gradient Descent </p> <p><a href="https://drive.google.com/file/d/1AtPypH5PY9QOtvXN1aNO1d6-Oe8Ez-9K/view">https://drive.google.com/file/d/1AtPypH5PY9QOtvXN1aNO1d6-Oe8Ez-9K/view</a></p> <p>&nbsp;</p> <p>&nbsp;</p> <p>&nbsp;</p> <p>&nbsp;</p> <p>&nbsp;</p> </td> 
   </tr> 
   <tr> 
    <td width="119" valign="top"> <p>3.4.2020.</p> </td> 
    <td width="475" valign="top"> <p>11. Homework discussion (Normal equation implementation in Python)</p> <p><a href="https://drive.google.com/file/d/1Fl70o7dhwaGk5KjCmr14kIfZapxvsH9m/view">https://drive.google.com/file/d/1Fl70o7dhwaGk5KjCmr14kIfZapxvsH9m/view</a></p> <p>&nbsp;</p> <p>12. Multivariate Gradient descent implementation I part</p> <p><a href="https://drive.google.com/file/d/1BVjtCrSQzVwgD00H1PghifusUAq7VFuz/view">https://drive.google.com/file/d/1BVjtCrSQzVwgD00H1PghifusUAq7VFuz/view</a></p> <p>&nbsp;</p> <p>13. &nbsp;Multivariate Gradient descent implementation II part</p> <p><a href="https://drive.google.com/file/d/1Gkq3vYRawtxsuB-Ve71JGysXk9Gf5ZEy/view">https://drive.google.com/file/d/1Gkq3vYRawtxsuB-Ve71JGysXk9Gf5ZEy/view</a></p> <p>14. mtutor test and discussion</p> <p>&nbsp;</p> </td> 
   </tr> 
  </tbody>
 </table>
 <br>
 <div class="attachedimages"></div>
</div>', '[]');
INSERT INTO "public"."subject_posts" VALUES (48, 21100, 'Kvalifikacioni test za pristup završnom ispitu', 'Miodrag Živković', 1592434920000, '<div >
 <p></p>
 <p>Poštovane koleginice i kolege,</p>
 <p><br></p>
 <p>kvalifikacioni test za pristup završnom ispitu se polaže prema unapred definisanom rasporedu koji je objavljen na sajtu Fakulteta.</p>
 <p>Molim Vas da u definisano vreme dođete na Google Meet link:</p>
 <p><a href="https://meet.google.com/qgp-royz-uhg">https://meet.google.com/qgp-royz-uhg</a><br></p>
 <p>Nakon toga, dobićete dalje instrukcije.</p>
 <p><br></p>
 <p>Puno pozdrava.</p>
 <p>Profesor</p>
 <br>
 <div class="attachedimages"></div>
</div>', '[]');
INSERT INTO "public"."subject_posts" VALUES (49, 21108, 'Kvalifikacioni test za pristup završnom ispitu', 'Miodrag Živković', 1592435220000, '<div >
 <p></p>
 <p>Poštovane koleginice i kolege,</p>
 <p><br></p>
 <p>kvalifikacioni test za pristup završnom ispitu se polaže prema unapred definisanom rasporedu koji je objavljen na sajtu Fakulteta.</p>
 <p>Molim Vas da u definisano vreme dođete na Google Meet link:</p>
 <p><a href="https://meet.google.com/qgp-royz-uhg">https://meet.google.com/qgp-royz-uhg</a><br></p>
 <p>Nakon toga, dobićete dalje instrukcije.</p>
 <p><br></p>
 <p>Puno pozdrava.</p>
 <p>Profesor</p>
 <br>
 <br>
 <div class="attachedimages"></div>
</div>', '[]');
INSERT INTO "public"."subject_posts" VALUES (50, 20813, 'Način polaganja Kvalifikacionog testa za pristup završnom ispitu', 'Milan Milosavljević', 1592379780000, '<div >
 <p></p>
 <p><b>Način polaganja Kvalifikacionog testa za pristup završnom ispitu</b>&nbsp;</p> 
 <p><span>Z<span>a&nbsp;<span>sredu 24.06.2020. u 13 časova</span></span></span><span>&nbsp;zakazan je Kvalifikacioni test za pristup završnom ispitu za regularne studente, odnosno za <span>1</span><span>7 časova</span> za zaposlene studente FIR-a i TF-a iz predmeta Veštačka inteligencija.&nbsp;</span></p> 
 <p><span>Kvalifikacioni testa za pristup završnom ispitu se radi iz dva dela:</span></p> 
 <p><span>A)&nbsp; &nbsp; &nbsp;U&nbsp;formi elektronskog testa.&nbsp;<span><span>Vreme izrade kolokvijuma je 20 minuta, test sadrži 30 pitanja</span>. </span>Pitanja su formirana iz knjige: Milosavljević M.<i>&nbsp;„</i>Veštačka inteligencija“,<i>&nbsp;</i>Univerzitet Singidunum, 2015. (Poglavlja&nbsp; 10, 11, i 12, odnosno od str.149 do str.229), kao i iz slajdova sa predavanja i vežbi predviđenih za završni ispit.&nbsp;<span>(<span>max broj bodova 25</span>)</span></span></p> 
 <p><span>B)&nbsp;&nbsp;&nbsp;&nbsp; Izrade mini projekta u programskom jeziku Python i Colab okruženju, prema zadatku koji će biti objavljen 24.06.2020 u 14 časova na stranici predmeta u odeljku Obaveštenja za regularne studente, odnosno u 18 časova za zaposlene studente. Notebook sa rešenjem mora biti poslat na email&nbsp;<a href="mailto:dejan.bulaja.16@singimail.rs">dejan.bulaja.16@singimail.rs</a>&nbsp;do 15 časova istog dana za regularne studente, odnosno do 19 časova za zaposlene studente (dakle na raspolaganju je 1 sat za samostalno rešavanje zadatka). Svaki zadatak će biti personalizovan u zavisnosti od broja indeksa onoga ko zadatak rešava.<span> (<span>max broj bodova 5</span>)</span></span></p> 
 <p>Kvalifikacioni test za pristup završnom ispitu&nbsp; će se realizovati putem elektronske platforme mTutor, pristupom putem linka:&nbsp;<a href="https://test.singidunum.ac.rs/">https://test.singidunum.ac.rs/</a>&nbsp;</p> 
 <p><span><span>Za pokretanje testa obavezno je korišćenje kamere</span>. Ako neko nema kameru, treba da instalira Google Meet aplikaciju na svom mobilnom telefonu i da je aktivira prilikom polaganja. Stoga će student dobiti obaveštenje da je korišćenje kamere preporučeno za davanje veće validnosti rezultatatima testa,&nbsp;<span>ali da svakako može da pokrene test i bez kamere, s tim da će tada profesor imati pravo i obavezu da usmeno ispitaju takve studente kako bi potvrdio njihov rezultat.</span></span></p> 
 <p>Test se realizuje samostalno na osnovu sopstvenog znanja i pripremljenog ispita. Platforma poseduje zaštitne mehanizme kako bi se osujetili pokušaji manipulacije testom.&nbsp;</p> 
 <p>·&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Test radite sa stabilne, po mogućstvu žične Internet veze.</p> 
 <p>·&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Preporuka je da za vreme izrade testa koristite Google Chrome ili Mozilla Firefox pretraživač.&nbsp;</p> 
 <p>·&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span> <span>U vreme testa potrebno je da od programskih paketa bude aktivan samo pretraživač (browser) otvoren sa samo jednim tab-om u okviru koga će se realizovati test.</span></span></p> 
 <p>·&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Preporuka je da za vreme testa ugasite firewall i/ili antivirusni softver.</p> 
 <p>·&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Maksimalno kašnjenje za početak testa je pet minuta, nakon toga neće biti moguće ponovo pokrenuti test.</p> 
 <p>·&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Za prijavu na sistem koristi se broj indeksa u formatu godina upisa, pa broj indeksa bez znakova interpunkcije npr: 2017123456. Nakon prijave odabraćete test i pokrenuti rad.</p> 
 <p>Sve vreme trajanja testa predmetni profesor biće dostupan na Google Meet platformi kako bi odgovorio na eventualne tehničke probleme pri pokretanju testa. Na link se prijavljujete isključivo ukoliko se javio neki problem. Link za Google Meet&nbsp;<a href="https://meet.google.com/vmh-tpnp-qck">https://meet.google.com/vmh-tpnp-qck</a></p> 
 <p>&nbsp;</p>
 <br>
 <div class="attachedimages"></div>
</div>', '[]');
INSERT INTO "public"."subject_posts" VALUES (51, 20879, 'Kvalifikacioni test za pristup završnom ispitu', 'Nebojša Bačanin Džakula', 1592326320000, '<div >
 <p>Poštovane i drage koleginice i kolege,</p>
 <p><br></p>
 <p>kvalifikacioni test za pristup završnom ispitu polagaćete prema rasporedu koji je objavljen na sajtu Fakulteta.</p>
 <p><br></p>
 <p>Molim vas da u definisano vreme dođete na Google Meet link:</p>
 <p>https://meet.google.com/son-fqkb-gik</p>
 <p><br></p>
 <p>Nakon toga, dobićete dalje instrukcije.</p>
 <p><br></p>
 <p>Puno pozdrava.</p>
 <p><br></p>
 <p>Profesor</p>
 <p><br></p>
 <div class="attachedimages"></div>
</div>', '[]');
INSERT INTO "public"."subject_posts" VALUES (52, 13292, 'Tema semestralnog projekta i informacije o ispitu 2020', 'Mlađan Jovanović', 1584002340000, '<div >
 <p>Poštovani studenti,</p>
 <p>opis teme semestralnog projekta i informacije o načinu polaganja ispita se nalaze u nastavku.</p>
 <p>Pozdrav,</p>
 <p>Mlađan i Nikola</p>
 <p><br></p>
 <p><br></p>
 <div class="attachedimages"></div>
</div>', '[{"type":"/images/file_pdf.svg","attachmentLink":"http://predmet.singidunum.ac.rs/pluginfile.php/14819/mod_forum/attachment/13317/Ispit_informacije_2020.pdf","attachmentTitle":"Ispit_informacije_2020.pdf"},{"type":"/images/file_pdf.svg","attachmentLink":"http://predmet.singidunum.ac.rs/pluginfile.php/14819/mod_forum/attachment/13317/Tema%20za%20semestralni%20projekat%202020.pdf","attachmentTitle":"Tema za semestralni projekat 2020.pdf"}]');
INSERT INTO "public"."subject_posts" VALUES (53, 21172, 'Polaganje 01.07.2020.', 'Ana Simićević', 1592480580000, '<div >
 <p></p>
 <p>Dragi studenti,</p>
 <p><b>U sredu 01.07.2020.</b>&nbsp;obaviće se polaganje prema sledećem rasporedu:</p>
 <p><b></b></p>
 <br>
 <p><b>&nbsp;&nbsp;</b>16.00h završni test<b><br></b></p>
 <p><b></b>&nbsp;&nbsp;17.00h I kolokvijum&nbsp;(ko nije položio ili želi da popravi)</p>
 <p>&nbsp; 18.00h II kolokvijum (ko nije položio ili želi da popravi)</p>
 <p><br></p><b><b><b><b></b></b></b></b>
 <p>Ako student popravlja ranije položen kolokvijum treba da ima u vidu da se&nbsp;računa poslednji rezultat.</p><b></b>
 <p>Kolokvijumi i test će se realizovati putem elektronske platforme mTutor, pristupom putem linka:&nbsp;<br></p>
 <p><a href="https://testus.singidunum.ac.rs/">https://testus.singidunum.ac.rs</a><br></p><b></b>
 <h5><b>Napomena:&nbsp;<i>Upotreba kamere&nbsp; je obavezna (bez obzira koji se deo polaže)</i></b></h5>
 <div>
  <b></b>
  <div>
   <b><b><i><br></i></b></b>
  </div><b></b>
 </div><b></b>
 <p>Ukoliko se tokom rada kolokvijuma pojave neki tehnički problemi, ja ću biti dostupna na linku<i>:</i></p>
 <p><i>https://meet.google.com/qsa-fwjd-edm&nbsp;&nbsp;</i></p>
 <p><b>Bez obzira koji deo polažete neophodno je da ispit bude prijavljen!</b></p>
 <br>
 <div class="attachedimages"></div>
</div>', '[]');
INSERT INTO "public"."subject_posts" VALUES (54, 17247, 'Rezultati testa održanog 14.04.2020.', 'Ana Simićević', 1586976360000, '<div >
 <p>Dragi studenti,</p>
 <p>Poeni su uneti u sistem i možete ih pogledati na estudent-u.<br></p>
 <div class="attachedimages"></div>
</div>', '[]');
INSERT INTO "public"."subject_posts" VALUES (55, 21188, '❗ Polaganja popravnih kolokvijuma i kvalifikacionog testa', 'Miodrag Živković', 1592493180000, '<div >
 <p></p>
 <p>⚠️&nbsp;<b>Način polaganja popravnog kolokvijuma</b><br></p>
 <p></p>
 <ul>
  <li>Popravni kolokvijumi će biti održani u vidu elektronskih testova koji će biti dostupni na linku&nbsp;<b><a href="https://testus.singidunum.ac.rs/" target="_blank" rel="noreferrer noopener">test.singidunum.ac.rs</a></b>&nbsp;u ponedeljak, 29. 06. 2020.&nbsp;u<b>&nbsp;13.00 </b>za redovne, odnosno u <b>18:00 </b>za zaposlene studente.</li>
  <li>Preporučeno je da se test radi sa računara korišćenjem Internet pregledača Google Chrome ili Mozilla Firefox.</li>
  <li>Aktivirajte Focus mode ili No Distractions mode na svom računaru kako biste sprečili iskakanje bilo kakvih notifikacija na sistemu koje mogu da izazovu izlazak iz fokusa taba Internet pregledača u kojem se vrši testiranje i ni slučajno mišem ne izlazite iz fokusa viewport-a taba (čak ni na scroll bar), tokom rada elektronskog testa! U suprotnom će izlazak iz fokusa biti detektovan kao mogući pokušaj varanja.</li>
  <li><b>Za elektronski test obavezna je upotreba kamere za davanje validnosti rezultatu testa.</b></li>
  <li><b>Studenti će moći da pokrenu test i bez odobravanja pristupa kameri (ukoliko nemaju raspoloživu kameru na računaru). U tom slučaju, student treba da instalira Google Meet aplikaciju na mobilnom telefonu i aktivira je za vreme izrade kolokvijuma prijavljivanjem na link na kome će biti aktivni profesor i asistent</b>:&nbsp;<span lang="sr-latn-rs" xml:lang="sr-latn-rs"><a href="https://meet.google.com/qgp-royz-uhg">https://meet.google.com/qgp-royz-uhg</a></span></li>
  <li>Međutim, u slučaju da student ne pokrene test sa odobrenjem korišćenja kamere, profesor će zakazati usmenu odbranu rezultata testa, video prenosom preko Google Meet platforme, sa obaveznim korišćenjem kamere sa strane studenta za vreme trajanja usmenog ispitivanja.</li>
 </ul>
 <p></p>
 <p>⚠️<b>&nbsp;Način polaganja kvalifikacionog testa</b></p>
 <p>Za ovaj vid polaganja, koji će i dalje podrazumevati odbranu praktičnog projekta, studenti mogu da se prijave 29.06.2020. već od 13h na link:&nbsp;<a href="https://meet.google.com/qgp-royz-uhg">https://meet.google.com/qgp-royz-uhg</a>, i prezentuju svoje projekte. Prezentacija projekata je moguća i nakon urađenih kolokvijuma. Za zaposlene studente, projekte je moguće prezentovati od 17h do 18:30.</p>
 <br>
 <div class="attachedimages"></div>
</div>', '[]');
INSERT INTO "public"."subject_posts" VALUES (56, 21197, 'Kvalifikacioni test', 'Miloš Mravik', 1592492160000, '<div >
 <p></p>
 <p>S obzirom na trenutne okolnosti, gde tokom trajanja vanrednog stanja u državi, ne može da se organizuje polaganje u prostorijama Univerziteta na računarskoj opremi koja je dostupna u elektronskim učionicama, polaganje praktičnog zadatka će biti realizovan tako da studenti praktičan zadatak rade od kuće.<br></p>
 <p>⚠️ <b>Način polaganja popravnog 1. i popravnog 2. </b><b>dela kvalifikacionog testa</b><br></p>
 <p></p>
 <ul>
  <li>Popravni <b>1. dela kvalifikacionog testa </b>će biti održan u vidu elektronskog testa koji će biti dostupan na linku <a href="https://test.singidunum.ac.rs" target="_blank" rel="noreferrer noopener"><b>test.singidunum.ac.rs</b></a> u petak, 26. 06. 2020. u<b> 12.00 redovni studenti i u 17.00 časova zaposleni studenti</b>.</li>
  <li>Popravni <b>2. dela kvalifikacionog testa </b>će biti održan u vidu elektronskog testa koji će biti dostupan na linku <a href="https://test.singidunum.ac.rs" target="_blank" rel="noreferrer noopener"><b>test.singidunum.ac.rs</b></a> u petak, 26. 06. 2020. u<b> 12.20 redovni studenti i u 17.20 časova zaposleni studenti</b>.</li>
  <li>Preporučeno je da se test radi sa računara korišćenjem Internet pregledača <b>Google Chrome</b> ili <b>Mozilla Firefox</b>.</li>
  <li>Za elektronski test je <b>preporučeno odobravanje pristupa kameri</b> za davanje validnosti rezultatu testa.</li>
  <li>Studenti će moći da pokrenu test i bez odobravanja pristupa kameri.</li>
  <li>Međutim, u slučaju da student ne pokrene test sa odobrenjem korišćenja kamere, profesor može da zakaže usmenu odbranu rezultata testa, video prenosom preko Google Meet platforme, sa obaveznim korišćenjem kamere sa strane studenta za vreme trajanja usmenog ispitivanja.</li>
 </ul>
 <p></p>
 <p>⚠️<b> Način polaganja praktičnog dela</b><br></p>
 <p></p>
 <ul>
  <li>Za ovaj vid polaganja, koji će i dalje podrazumevati praktičan zadatak, studenti su u obavezi da obezbede sledeće uslove za rad:</li>
 </ul>
 <p></p>
 <p></p>
 <ol>
  <li>Neometanu <b>Internet konekciju</b> za vreme trajanja rada;</li>
  <li>Instaliran <b>Python 3.5, 3.6, 3.7 ili 3.8</b> sa <b>IDLE okruženjem</b> za pisanje Python programa.</li>
 </ol>
 <ul>
  <li>Postavka zadatka će biti postavljena u tekstu ovog obaveštenja (koje će biti izmenjeno) u petak, 26. 6. 2020. godine u <b>13</b><b>.00 za redovne studente i u 18.00 za zaposlene studente</b>.</li>
  <li><b>Postavka zadatka će biti dostupna na ovom linku</b>: <a href="https://zadatak.singidunum.ac.rs/preuzmi/?id=1586952750-0e2d9ff5fd834ee1fccb">LINK </a><br></li>
  <li>Studenti treba da preuzmu postavku zadatka sa instrukcijama za rad i instrukcijama za dostavljanje rešenja zadatka.</li>
  <li>Vreme za rad će je ograničeno tako da platforma za prijem rešenja zadataka <b>neće</b>&nbsp;<b>prihvatiti ni jedan zadatak poslat ni sekund nakon isteka vremena za rad i predaju zadatka</b> prema propisanim uputstvima iz <b>postavke zadatka</b>. <br></li>
  <li>Vreme trajanja testa je <b>1 sat.</b></li>
  <li><b>Predaja rada: </b><b><a href="http://zadatak.singidunum.ac.rs" target="_blank" rel="noreferrer noopener">zadatak.singidunum.ac.rs</a> </b>(prijavite se sa svojim brojem indeksa<br>i JMBG i u aktivnost pod imenom "Osnove programiranja - Python" pošaljite zapakovanu ZIP arhivu projekta)</li>
  <li><b>Poslednji trenutak</b> kada će platforma za predaju rešenja zadatka, prema instrukcijama iz uputstva, biti aktivna je <b>14.10</b><b> za redovne studente i u 19.10 za zaposlene studente</b>.<br></li>
  <li>Nakon toga, zadatak ne može nikako drugačije da bude dostavljen. Zadaci poslati elektronskom poštom <b>ne mogu i neće </b>biti uvaženi<b>.</b></li>
 </ul>
 <p></p>
 <p>⚠️ <b>Opšte informacije</b><br></p>
 <p></p>
 <ul>
  <li>S obzirom na okolnosti, u kojima nije moguća direktna kontrola prostorije u kojoj se rad sprovodi, kao ni nadzor nastavnika, profesor i asistent mogu i hoće vršiti proveru na taj način što će, po potrebi, zakazivati usmenu odbranu priloženog rešenja zadatka, koja će biti sprovođena 1-na-1 sa studentom i tom prilikom će verifikovati da student poseduje sva znanja koja su bila potrebna za realizaciju pojedinih delova. Ako student usmeno ne bude mogao da odbrani svoj rad i pokaže da poseduje sva znanja koja su potrebna da se obavi deo zadatka na način kako je rešen onaj koji je dostavio, profesor ima pravo da na osnovu usmene provere znanja izvrši korekciju predložene ocene. Biće korišćena Google Meet platforma, sa obavezno aktivnom kamerom sa starne studenta.</li>
  <li>Link za Google Meet za sva pitanja tokom rada će biti objavljen ovde pred početak termina za rad: <b><a href="https://meet.google.com/xbi-ecaj-pkv" target="_blank" rel="noreferrer noopener">https://meet.google.com/xbi-ecaj-pkv</a></b></li>
 </ul>
 <p></p>
 <div class="attachedimages"></div>
</div>', '[]');
INSERT INTO "public"."subject_posts" VALUES (57, 14847, 'Video materijali sa vežbi', 'Uroš Arnaut', 1592341080000, '<div >
 <p>Poštovane koleginice i kolege,</p>
 <p>Na sledećim linkovima možete pronaći sačuvane video materijale sa vežbi održanih putem Google Meet platforme.</p>
 <p>Zamolio bih Vas za razumevanje, da prezentacije nisu dodatno obrađivane i da su postavljene u obliku kakva je bila i realizacija. Moguće je da sami materijali sadrže neku od informacija koja je naknadno korigovana, ili usklađena sa daljim razvojem situacije.</p>
 <p>Materijale sa vežbi možete pronaći na sledećim linkovima:</p>
 <p></p>
 <ul>
  <li><b><a href="https://drive.google.com/file/d/1VlwSH6073EMTMIAN7jgL1jM2LI6nAbHZ/view?usp=sharing" target="_blank" rel="noreferrer noopener">Vežbe 03 - 20.03.2020.</a></b></li>
  <li><b><a href="https://drive.google.com/drive/folders/11xclUd6iF7AgTg-jLeGTeqHUTwIVUJ3O?usp=sharing" target="_blank" rel="noreferrer noopener">Vežbe 04 - 27.03.2020.</a></b></li>
  <li><b><a href="https://drive.google.com/open?id=1Qbp0vF1gBblj4pzcN2vUAsJJClUGbXnz" target="_blank" rel="noreferrer noopener">Vežbe 05 - 03.04.2020.</a></b></li>
  <li><b><a href="https://drive.google.com/drive/folders/1rt78TvXqgGbuAvAhlPq0dNDEvrekdlHe?usp=sharing" target="_blank" rel="noreferrer noopener">Vežbe 08 - 24.04.2020.</a></b></li>
  <li><b><a href="https://drive.google.com/drive/folders/1VqzWfYXKJk-lPe_BzJBVK-AZZZOJW1I1?usp=sharing" target="_blank" rel="noreferrer noopener">Vežbe 09 - 08.05.2020.</a></b></li>
  <li><b><a href="https://drive.google.com/drive/folders/1Pkg7PK59889Y2EJWnigL0pPRBcsg7Qvl?usp=sharing" target="_blank" rel="noreferrer noopener">Vežbe 10 i Vežbe 11 - 15.05.2020.</a></b></li>
  <li><b><a href="https://drive.google.com/drive/folders/1q5etrEm5oP7It1wHFJfZUHpV8EGYLLnC?usp=sharing" target="_blank" rel="noreferrer noopener">Vežbe 13 - 29.05.2020.</a></b></li>
  <li><b><a href="https://drive.google.com/drive/folders/1mrQJooIGJ_DqpWxk_irxFtiAxGm3EJor?usp=sharing" target="_blank" rel="noreferrer noopener">Vežbe 14 - 05.06.2020.</a></b></li>
  <li><b><a href="https://drive.google.com/drive/folders/1HvZozcKNSYKu53qRo7Utk3u8J7Oj65Nt?usp=sharing" target="_blank" rel="noreferrer noopener">Vežbe 15 - 12.06.2020.</a></b></li>
 </ul>
 <div class="attachedimages"></div>
</div>', '[]');
INSERT INTO "public"."subject_posts" VALUES (58, 21325, 'ISA - Lista predispitnih bodova', 'Nebojša Bačanin Džakula', 1592636100000, '<div >
 <p>Poštovane i drage kolege i kolege,</p>
 <p><br></p>
 <p>u prilogu se nalazi lista predispitnih bodova (kol1 + kol2 + prisustvo/aktivnosti).</p>
 <p><br></p>
 <p>Napominjemo da u prisustvo/aktivnosti sa predavanja i vežbi ulaze i blogovi koji su rađeni na časovima u formi aktivnosti na nastavi.</p>
 <p><br></p>
 <p>Ako imate bilo kakve sugestije, obratite se profesoru ili asistentu.</p>
 <p><br></p>
 <p>Puno pozdrava i prijatan vikend vam želimo.</p>
 <p><br></p>
 <p>Profesor i asistent</p>
 <p><br></p>
 <div class="attachedimages"></div>
</div>', '[{"type":"/images/file_pdf.svg","attachmentLink":"http://predmet.singidunum.ac.rs/pluginfile.php/14804/mod_forum/attachment/21436/ISA%20bodovi.pdf","attachmentTitle":"ISA bodovi.pdf"}]');
INSERT INTO "public"."subject_posts" VALUES (59, 19267, 'Резултати 2. колоквијума', 'Uroš Arnaut', 1590054780000, '<div >
 <p>Поштоване колегинице и колеге,</p>
 <p>У прилогу се налазе резултати другог колоквијума.</p>
 <div class="attachedimages"></div>
</div>', '[{"type":"/images/file_pdf.svg","attachmentLink":"http://predmet.singidunum.ac.rs/pluginfile.php/14803/mod_forum/attachment/19362/%D0%98%D0%A1%D0%90%20-%202.%20%D0%BA%D0%BE%D0%BB%D0%BE%D0%BA%D0%B2%D0%B8%D1%98%D1%83%D0%BC.pdf","attachmentTitle":"ИСА - 2. колоквијум.pdf"}]');
INSERT INTO "public"."subject_posts" VALUES (60, 19549, 'Lab recordings', 'Uroš Arnaut', 1592340120000, '<div >
 <p>Dear Colleagues,</p>
 <p>At the following links you can find saved videos from exercises held through the Google Meet platform.</p>
 <p>I would like to ask you to understand that the presentations were not further processed and that they were set in the form in which the realization was. It is possible that the materials themselves contain some of the information that was subsequently corrected, or <span>synchronized&nbsp;</span>with the further development of the situation.</p>
 <p>Lab materials can be found at the following links:</p>
 <p></p>
 <ul>
  <li><b><a href="https://drive.google.com/drive/folders/1t9u54zUt58tYQTnFIo459yDecEB34eMQ?usp=sharing" target="_blank" rel="noreferrer noopener">Lab 01 - 25.05.2020.</a></b></li>
  <li><b><a href="https://drive.google.com/drive/folders/10TTvXQBxWrntRV8svixijNfsd_y_h-RC?usp=sharing" target="_blank" rel="noreferrer noopener">Lab 02 - 26.05.2020.</a></b></li>
  <li><b><a href="https://drive.google.com/drive/folders/1ZQrN8CBPX8H3772g-7bJ6JTjNEtOmrVe?usp=sharing" target="_blank" rel="noreferrer noopener">Lab 03 - 27.05.2020.</a></b></li>
  <li><b><a href="https://drive.google.com/drive/folders/1aaTm-EaoO4rBtfPVjihDsq4pyYrs_mw1?usp=sharing" target="_blank" rel="noreferrer noopener">Lab 04 - 28.05.2020.</a></b></li>
  <li><b><a href="https://drive.google.com/drive/folders/1CuATver2cld7-uSkzW1nmg_eXVb-OTns?usp=sharing" target="_blank" rel="noreferrer noopener">Lab 05 - 01.06.2020.</a></b></li>
  <li><b><a href="https://drive.google.com/drive/folders/1_7zUtO64kzbHD0s9ntZUoTiw8bEQND8U?usp=sharing" target="_blank" rel="noreferrer noopener">Lab 06 - 02.06.2020.</a></b></li>
  <li><b><a href="https://drive.google.com/drive/folders/13LmFSJ7hNbxsoLmK9shBO7C78xDtD6Ts?usp=sharing" target="_blank" rel="noreferrer noopener">Lab 07 - 03.06.2020.</a></b></li>
  <li><a href="https://drive.google.com/drive/folders/14G4MGaNy4LmpoyvWOq72X63dQcmUVziL?usp=sharing" target="_blank" rel="noreferrer noopener"><b>Lab 08 - 04.06.2020.</b></a></li>
  <li><b><a href="https://drive.google.com/drive/folders/1QqBB2eTg2mbwmfv0baT5Z1mJPsiTr-w4?usp=sharing" target="_blank" rel="noreferrer noopener">Lab 09 - 08.06.2020.</a></b></li>
  <li><b><a href="https://drive.google.com/drive/folders/1ceG17rwdvd-F372GE6RuBI9n55raSbVd?usp=sharing" target="_blank" rel="noreferrer noopener">Lab 10 - 09.06.2020.</a></b></li>
  <li><b><a href="https://drive.google.com/drive/folders/19hYdWa-r7IhVNtkrLAhfWcWstw13pR6z?usp=sharing" target="_blank" rel="noreferrer noopener">Lab 11 - 10.06.2020.</a></b></li>
  <li><b><a href="https://drive.google.com/drive/folders/1uaQZ0kMWvYG_garXkPab9Cv1F2LWf7z9?usp=sharing" target="_blank" rel="noreferrer noopener">Lab 12 - 11.06.2020.</a></b></li>
  <li><b><a href="https://drive.google.com/drive/folders/1yCQxLz9uP4kqNyNXwLZwu_Et90S1KJ4R?usp=sharing" target="_blank" rel="noreferrer noopener">Lab 13 - 12.06.2020.</a></b></li>
 </ul>
 <div class="attachedimages"></div>
</div>', '[]');

-- ----------------------------
-- Table structure for years
-- ----------------------------
DROP TABLE IF EXISTS "public"."years";
CREATE TABLE "public"."years" (
  "year_id" int4 NOT NULL,
  "year" int4 NOT NULL,
  "year_title" varchar(64) COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Records of years
-- ----------------------------
INSERT INTO "public"."years" VALUES (1, 1, 'I Godina');
INSERT INTO "public"."years" VALUES (2, 2, 'II Godina');
INSERT INTO "public"."years" VALUES (3, 3, 'III Godina');
INSERT INTO "public"."years" VALUES (4, 4, 'IV Godina');

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."cached_subjects_id_seq"
OWNED BY "public"."cached_subjects"."id";
SELECT setval('"public"."cached_subjects_id_seq"', 14, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."newsSources_internal_id_seq"
OWNED BY "public"."newsSources"."internal_id";
SELECT setval('"public"."newsSources_internal_id_seq"', 7, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."redired_table_uid_seq"
OWNED BY "public"."redirect_table"."uid";
SELECT setval('"public"."redired_table_uid_seq"', 122, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."sections_id_seq"
OWNED BY "public"."sections"."id";
SELECT setval('"public"."sections_id_seq"', 505, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."subject_posts_id_seq"
OWNED BY "public"."subject_posts"."id";
SELECT setval('"public"."subject_posts_id_seq"', 61, true);

-- ----------------------------
-- Indexes structure for table cached_subjects
-- ----------------------------
CREATE UNIQUE INDEX "courseID_index" ON "public"."cached_subjects" USING btree (
  "courseID" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Indexes structure for table courses
-- ----------------------------
CREATE INDEX "fk_faculties_courses" ON "public"."courses" USING btree (
  "faculties_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "fk_years_courses" ON "public"."courses" USING btree (
  "years_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table courses
-- ----------------------------
ALTER TABLE "public"."courses" ADD CONSTRAINT "courses_pkey" PRIMARY KEY ("internal_id");

-- ----------------------------
-- Primary Key structure for table faculties
-- ----------------------------
ALTER TABLE "public"."faculties" ADD CONSTRAINT "faculties_pkey" PRIMARY KEY ("internal_id");

-- ----------------------------
-- Primary Key structure for table newsSources
-- ----------------------------
ALTER TABLE "public"."newsSources" ADD CONSTRAINT "newsSources_pkey" PRIMARY KEY ("internal_id");

-- ----------------------------
-- Primary Key structure for table redirect_table
-- ----------------------------
ALTER TABLE "public"."redirect_table" ADD CONSTRAINT "redired_table_pkey" PRIMARY KEY ("uid");

-- ----------------------------
-- Primary Key structure for table years
-- ----------------------------
ALTER TABLE "public"."years" ADD CONSTRAINT "years_pkey" PRIMARY KEY ("year_id");

-- ----------------------------
-- Foreign Keys structure for table courses
-- ----------------------------
ALTER TABLE "public"."courses" ADD CONSTRAINT "fk_faculties_courses" FOREIGN KEY ("faculties_id") REFERENCES "public"."faculties" ("internal_id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."courses" ADD CONSTRAINT "fk_years_courses" FOREIGN KEY ("years_id") REFERENCES "public"."years" ("year_id") ON DELETE NO ACTION ON UPDATE NO ACTION;
