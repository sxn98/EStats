--------------------------------------------------------
--  File created - Sunday-September-06-2020   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Sequence GRUPURI_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "SORUN"."GRUPURI_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 41 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence JOCURI_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "SORUN"."JOCURI_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence JOCURI_SEQ1
--------------------------------------------------------

   CREATE SEQUENCE  "SORUN"."JOCURI_SEQ1"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 61 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence JUCATORI_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "SORUN"."JUCATORI_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 41 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence JUCATORI_SEQ1
--------------------------------------------------------

   CREATE SEQUENCE  "SORUN"."JUCATORI_SEQ1"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence JUCATORI_SEQ2
--------------------------------------------------------

   CREATE SEQUENCE  "SORUN"."JUCATORI_SEQ2"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence JUCATORI_SEQ3
--------------------------------------------------------

   CREATE SEQUENCE  "SORUN"."JUCATORI_SEQ3"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence MECIURI_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "SORUN"."MECIURI_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence MECIURI_SEQ1
--------------------------------------------------------

   CREATE SEQUENCE  "SORUN"."MECIURI_SEQ1"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence TABLE1_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "SORUN"."TABLE1_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence TABLE2_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "SORUN"."TABLE2_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence TURNEETERMINATE_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "SORUN"."TURNEETERMINATE_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence TURNEETERMINATE_SEQ1
--------------------------------------------------------

   CREATE SEQUENCE  "SORUN"."TURNEETERMINATE_SEQ1"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence TURNEETERMINATE_SEQ2
--------------------------------------------------------

   CREATE SEQUENCE  "SORUN"."TURNEETERMINATE_SEQ2"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence TURNEE_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "SORUN"."TURNEE_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 41 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence UTILIZATORI_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "SORUN"."UTILIZATORI_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence UTILIZATORI_SEQ1
--------------------------------------------------------

   CREATE SEQUENCE  "SORUN"."UTILIZATORI_SEQ1"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence UTILIZATORI_SEQ2
--------------------------------------------------------

   CREATE SEQUENCE  "SORUN"."UTILIZATORI_SEQ2"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Table GRUPURI
--------------------------------------------------------

  CREATE TABLE "SORUN"."GRUPURI" 
   (	"ID" NUMBER, 
	"NUMEGRUP" VARCHAR2(50 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table JOCURI
--------------------------------------------------------

  CREATE TABLE "SORUN"."JOCURI" 
   (	"IDJOC" NUMBER, 
	"NUMEJOC" VARCHAR2(50 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table MECIURI
--------------------------------------------------------

  CREATE TABLE "SORUN"."MECIURI" 
   (	"IDTURNEU" NUMBER, 
	"IDGRUPA" NUMBER, 
	"IDGRUPB" NUMBER, 
	"JOCJUCAT" NUMBER, 
	"DATA" DATE, 
	"PREDICTIE" NUMBER(*,3), 
	"REZULTAT" VARCHAR2(1 BYTE), 
	"IDMECI" NUMBER, 
	"ORA" VARCHAR2(20 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table PARIURI
--------------------------------------------------------

  CREATE TABLE "SORUN"."PARIURI" 
   (	"IDMECI" NUMBER, 
	"IDUTILIZATOR" NUMBER, 
	"SUMAPARIATA" NUMBER, 
	"CASTIG" NUMBER DEFAULT NULL, 
	"SANSA" NUMBER(*,3), 
	"ECHIPA" VARCHAR2(20 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table TURNEE
--------------------------------------------------------

  CREATE TABLE "SORUN"."TURNEE" 
   (	"IDTURNEU" NUMBER, 
	"NUME" VARCHAR2(20 BYTE), 
	"DATAINCEPUT" DATE, 
	"DATASFARSIT" DATE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table UTILIZATORI
--------------------------------------------------------

  CREATE TABLE "SORUN"."UTILIZATORI" 
   (	"IDUTILIZATOR" NUMBER, 
	"NUME" VARCHAR2(20 BYTE), 
	"PAROLA" VARCHAR2(999 BYTE), 
	"EMAIL" VARCHAR2(20 BYTE), 
	"CONT" NUMBER DEFAULT 0, 
	"POZA" VARCHAR2(150 BYTE), 
	"ADMINISTRATOR" NUMBER(1,0) DEFAULT 0
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
REM INSERTING into SORUN.GRUPURI
SET DEFINE OFF;
Insert into SORUN.GRUPURI (ID,NUMEGRUP) values (3,'Cloud9');
Insert into SORUN.GRUPURI (ID,NUMEGRUP) values (1,'Fnatic');
Insert into SORUN.GRUPURI (ID,NUMEGRUP) values (2,'G2');
REM INSERTING into SORUN.JOCURI
SET DEFINE OFF;
Insert into SORUN.JOCURI (IDJOC,NUMEJOC) values (2,'Counter Strike: Global Offensive');
Insert into SORUN.JOCURI (IDJOC,NUMEJOC) values (3,'Hearthstone');
Insert into SORUN.JOCURI (IDJOC,NUMEJOC) values (1,'League Of Legends');
REM INSERTING into SORUN.MECIURI
SET DEFINE OFF;
Insert into SORUN.MECIURI (IDTURNEU,IDGRUPA,IDGRUPB,JOCJUCAT,DATA,PREDICTIE,REZULTAT,IDMECI,ORA) values (1,1,2,1,to_date('27-MAY-20','DD-MON-RR'),null,'W',1,'11:00');
Insert into SORUN.MECIURI (IDTURNEU,IDGRUPA,IDGRUPB,JOCJUCAT,DATA,PREDICTIE,REZULTAT,IDMECI,ORA) values (1,1,3,1,to_date('29-MAY-20','DD-MON-RR'),null,'W',2,'11:00');
Insert into SORUN.MECIURI (IDTURNEU,IDGRUPA,IDGRUPB,JOCJUCAT,DATA,PREDICTIE,REZULTAT,IDMECI,ORA) values (1,2,3,1,to_date('24-MAY-20','DD-MON-RR'),null,'L',3,'11:00');
Insert into SORUN.MECIURI (IDTURNEU,IDGRUPA,IDGRUPB,JOCJUCAT,DATA,PREDICTIE,REZULTAT,IDMECI,ORA) values (1,1,2,2,to_date('26-MAY-20','DD-MON-RR'),23.589,'L',4,'11:00');
Insert into SORUN.MECIURI (IDTURNEU,IDGRUPA,IDGRUPB,JOCJUCAT,DATA,PREDICTIE,REZULTAT,IDMECI,ORA) values (1,1,2,3,to_date('30-MAY-20','DD-MON-RR'),null,'W',5,'11:00');
Insert into SORUN.MECIURI (IDTURNEU,IDGRUPA,IDGRUPB,JOCJUCAT,DATA,PREDICTIE,REZULTAT,IDMECI,ORA) values (1,1,3,3,to_date('25-MAY-20','DD-MON-RR'),null,'L',6,'11:00');
Insert into SORUN.MECIURI (IDTURNEU,IDGRUPA,IDGRUPB,JOCJUCAT,DATA,PREDICTIE,REZULTAT,IDMECI,ORA) values (1,2,3,3,to_date('31-MAY-20','DD-MON-RR'),null,'W',7,'11:00');
Insert into SORUN.MECIURI (IDTURNEU,IDGRUPA,IDGRUPB,JOCJUCAT,DATA,PREDICTIE,REZULTAT,IDMECI,ORA) values (1,1,2,1,to_date('27-MAY-20','DD-MON-RR'),null,'L',8,'11:00');
Insert into SORUN.MECIURI (IDTURNEU,IDGRUPA,IDGRUPB,JOCJUCAT,DATA,PREDICTIE,REZULTAT,IDMECI,ORA) values (1,2,1,1,to_date('02-AUG-20','DD-MON-RR'),51.175,'L',25,'08:00');
Insert into SORUN.MECIURI (IDTURNEU,IDGRUPA,IDGRUPB,JOCJUCAT,DATA,PREDICTIE,REZULTAT,IDMECI,ORA) values (1,1,2,2,to_date('26-AUG-20','DD-MON-RR'),23.589,'L',27,'12:00');
Insert into SORUN.MECIURI (IDTURNEU,IDGRUPA,IDGRUPB,JOCJUCAT,DATA,PREDICTIE,REZULTAT,IDMECI,ORA) values (1,1,2,1,to_date('03-SEP-20','DD-MON-RR'),58.216,'L',29,'12:00');
Insert into SORUN.MECIURI (IDTURNEU,IDGRUPA,IDGRUPB,JOCJUCAT,DATA,PREDICTIE,REZULTAT,IDMECI,ORA) values (1,1,2,1,to_date('22-JUN-20','DD-MON-RR'),null,'L',9,'11:00');
Insert into SORUN.MECIURI (IDTURNEU,IDGRUPA,IDGRUPB,JOCJUCAT,DATA,PREDICTIE,REZULTAT,IDMECI,ORA) values (1,1,2,1,to_date('30-JUN-20','DD-MON-RR'),null,'W',10,'11:00');
Insert into SORUN.MECIURI (IDTURNEU,IDGRUPA,IDGRUPB,JOCJUCAT,DATA,PREDICTIE,REZULTAT,IDMECI,ORA) values (1,1,2,1,to_date('30-JUN-20','DD-MON-RR'),null,'W',11,'11:00');
Insert into SORUN.MECIURI (IDTURNEU,IDGRUPA,IDGRUPB,JOCJUCAT,DATA,PREDICTIE,REZULTAT,IDMECI,ORA) values (1,2,1,1,to_date('30-JUN-20','DD-MON-RR'),null,'W',12,'11:00');
Insert into SORUN.MECIURI (IDTURNEU,IDGRUPA,IDGRUPB,JOCJUCAT,DATA,PREDICTIE,REZULTAT,IDMECI,ORA) values (1,2,1,1,to_date('30-JUN-20','DD-MON-RR'),null,'L',13,'11:00');
Insert into SORUN.MECIURI (IDTURNEU,IDGRUPA,IDGRUPB,JOCJUCAT,DATA,PREDICTIE,REZULTAT,IDMECI,ORA) values (1,2,1,1,to_date('30-JUN-20','DD-MON-RR'),null,'W',14,'11:00');
Insert into SORUN.MECIURI (IDTURNEU,IDGRUPA,IDGRUPB,JOCJUCAT,DATA,PREDICTIE,REZULTAT,IDMECI,ORA) values (1,1,2,1,to_date('30-JUN-20','DD-MON-RR'),null,'W',15,'11:00');
Insert into SORUN.MECIURI (IDTURNEU,IDGRUPA,IDGRUPB,JOCJUCAT,DATA,PREDICTIE,REZULTAT,IDMECI,ORA) values (1,1,2,1,to_date('01-JAN-01','DD-MON-RR'),null,'L',16,'11:00');
Insert into SORUN.MECIURI (IDTURNEU,IDGRUPA,IDGRUPB,JOCJUCAT,DATA,PREDICTIE,REZULTAT,IDMECI,ORA) values (1,1,2,1,to_date('26-MAY-20','DD-MON-RR'),null,'L',17,'11:00');
Insert into SORUN.MECIURI (IDTURNEU,IDGRUPA,IDGRUPB,JOCJUCAT,DATA,PREDICTIE,REZULTAT,IDMECI,ORA) values (1,1,2,1,to_date('25-MAY-20','DD-MON-RR'),null,'W',18,'11:00');
Insert into SORUN.MECIURI (IDTURNEU,IDGRUPA,IDGRUPB,JOCJUCAT,DATA,PREDICTIE,REZULTAT,IDMECI,ORA) values (1,2,1,1,to_date('22-APR-20','DD-MON-RR'),53.818,'W',26,'11:00');
Insert into SORUN.MECIURI (IDTURNEU,IDGRUPA,IDGRUPB,JOCJUCAT,DATA,PREDICTIE,REZULTAT,IDMECI,ORA) values (1,2,1,1,to_date('10-SEP-20','DD-MON-RR'),56.223,null,28,'11:00');
Insert into SORUN.MECIURI (IDTURNEU,IDGRUPA,IDGRUPB,JOCJUCAT,DATA,PREDICTIE,REZULTAT,IDMECI,ORA) values (3,1,2,1,to_date('08-JUL-20','DD-MON-RR'),null,'L',19,'11:00');
REM INSERTING into SORUN.PARIURI
SET DEFINE OFF;
Insert into SORUN.PARIURI (IDMECI,IDUTILIZATOR,SUMAPARIATA,CASTIG,SANSA,ECHIPA) values (28,2,10,null,53.818,'Fnatic');
Insert into SORUN.PARIURI (IDMECI,IDUTILIZATOR,SUMAPARIATA,CASTIG,SANSA,ECHIPA) values (27,2,100,null,23.589,'Fnatic');
REM INSERTING into SORUN.TURNEE
SET DEFINE OFF;
Insert into SORUN.TURNEE (IDTURNEU,NUME,DATAINCEPUT,DATASFARSIT) values (1,'DreamHack',to_date('14-APR-20','DD-MON-RR'),to_date('15-SEP-20','DD-MON-RR'));
Insert into SORUN.TURNEE (IDTURNEU,NUME,DATAINCEPUT,DATASFARSIT) values (2,'ECS',to_date('16-JUN-20','DD-MON-RR'),to_date('14-JUL-20','DD-MON-RR'));
Insert into SORUN.TURNEE (IDTURNEU,NUME,DATAINCEPUT,DATASFARSIT) values (3,'LCS',to_date('16-JUN-20','DD-MON-RR'),to_date('16-JUL-20','DD-MON-RR'));
REM INSERTING into SORUN.UTILIZATORI
SET DEFINE OFF;
Insert into SORUN.UTILIZATORI (IDUTILIZATOR,NUME,PAROLA,EMAIL,CONT,POZA,ADMINISTRATOR) values (3,'test','WuOAhuLJ9R1M//y+fCzGHw==','asdf@',0,null,0);
Insert into SORUN.UTILIZATORI (IDUTILIZATOR,NUME,PAROLA,EMAIL,CONT,POZA,ADMINISTRATOR) values (2,'nume','fHjsDFigPb0LQtSWJnsWLA==','email',0,'danutzu.jpg',1);
--------------------------------------------------------
--  DDL for Index MECIURI_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SORUN"."MECIURI_PK" ON "SORUN"."MECIURI" ("IDMECI") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index TURNEE_UK2
--------------------------------------------------------

  CREATE UNIQUE INDEX "SORUN"."TURNEE_UK2" ON "SORUN"."TURNEE" ("NUME", "DATASFARSIT") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index JOCURI_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SORUN"."JOCURI_PK" ON "SORUN"."JOCURI" ("IDJOC") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index TURNEE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SORUN"."TURNEE_PK" ON "SORUN"."TURNEE" ("IDTURNEU") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index GRUPURI_UK1
--------------------------------------------------------

  CREATE UNIQUE INDEX "SORUN"."GRUPURI_UK1" ON "SORUN"."GRUPURI" ("NUMEGRUP") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index GRUPURI_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SORUN"."GRUPURI_PK" ON "SORUN"."GRUPURI" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index JOCURI_UK1
--------------------------------------------------------

  CREATE UNIQUE INDEX "SORUN"."JOCURI_UK1" ON "SORUN"."JOCURI" ("NUMEJOC") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index UTILIZATORI_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SORUN"."UTILIZATORI_PK" ON "SORUN"."UTILIZATORI" ("IDUTILIZATOR") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index TURNEE_UK1
--------------------------------------------------------

  CREATE UNIQUE INDEX "SORUN"."TURNEE_UK1" ON "SORUN"."TURNEE" ("NUME", "DATAINCEPUT") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Trigger GRUPURI_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "SORUN"."GRUPURI_TRG" 
BEFORE INSERT ON GRUPURI 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
IF INSERTING AND :NEW.ID IS NULL THEN
      SELECT MAX(ID)+1 INTO :NEW.ID FROM GRUPURI;
    END IF;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "SORUN"."GRUPURI_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger JOCURI_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "SORUN"."JOCURI_TRG" 
BEFORE INSERT ON JOCURI 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
IF INSERTING AND :NEW.IDJOC IS NULL THEN
      SELECT MAX(IDJOC)+1 INTO :NEW.IDJOC FROM JOCURI;
    END IF;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "SORUN"."JOCURI_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger MECIURI_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "SORUN"."MECIURI_TRG" 
BEFORE INSERT ON MECIURI 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW.IDMECI IS NULL THEN
      SELECT MAX(IDMECI)+1 INTO :NEW.IDMECI FROM MECIURI;
    END IF;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "SORUN"."MECIURI_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger TURNEE_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "SORUN"."TURNEE_TRG" 
BEFORE INSERT ON TURNEE 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW.IDTURNEU IS NULL THEN
      SELECT MAX(IDTURNEU)+1 INTO :NEW.IDTURNEU FROM TURNEE;
    END IF;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "SORUN"."TURNEE_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger UTILIZATORI_TRG1
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "SORUN"."UTILIZATORI_TRG1" 
BEFORE INSERT ON UTILIZATORI 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW.IDUTILIZATOR IS NULL THEN
      SELECT MAX(IDUTILIZATOR)+1 INTO :NEW.IDUTILIZATOR FROM UTILIZATORI;
    END IF;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "SORUN"."UTILIZATORI_TRG1" ENABLE;
--------------------------------------------------------
--  Constraints for Table TURNEE
--------------------------------------------------------

  ALTER TABLE "SORUN"."TURNEE" MODIFY ("IDTURNEU" NOT NULL ENABLE);
 
  ALTER TABLE "SORUN"."TURNEE" ADD CONSTRAINT "TURNEE_PK" PRIMARY KEY ("IDTURNEU")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "SORUN"."TURNEE" ADD CONSTRAINT "TURNEE_UK1" UNIQUE ("NUME", "DATAINCEPUT")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "SORUN"."TURNEE" ADD CONSTRAINT "TURNEE_UK2" UNIQUE ("NUME", "DATASFARSIT")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table UTILIZATORI
--------------------------------------------------------

  ALTER TABLE "SORUN"."UTILIZATORI" MODIFY ("IDUTILIZATOR" NOT NULL ENABLE);
 
  ALTER TABLE "SORUN"."UTILIZATORI" MODIFY ("NUME" NOT NULL ENABLE);
 
  ALTER TABLE "SORUN"."UTILIZATORI" MODIFY ("PAROLA" NOT NULL ENABLE);
 
  ALTER TABLE "SORUN"."UTILIZATORI" MODIFY ("EMAIL" NOT NULL ENABLE);
 
  ALTER TABLE "SORUN"."UTILIZATORI" ADD CONSTRAINT "UTILIZATORI_PK" PRIMARY KEY ("IDUTILIZATOR")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table JOCURI
--------------------------------------------------------

  ALTER TABLE "SORUN"."JOCURI" ADD CONSTRAINT "JOCURI_PK" PRIMARY KEY ("IDJOC")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "SORUN"."JOCURI" ADD CONSTRAINT "JOCURI_UK1" UNIQUE ("NUMEJOC")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "SORUN"."JOCURI" MODIFY ("IDJOC" NOT NULL ENABLE);
 
  ALTER TABLE "SORUN"."JOCURI" MODIFY ("NUMEJOC" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MECIURI
--------------------------------------------------------

  ALTER TABLE "SORUN"."MECIURI" ADD CONSTRAINT "MECIURI_PK" PRIMARY KEY ("IDMECI")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "SORUN"."MECIURI" MODIFY ("IDMECI" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table GRUPURI
--------------------------------------------------------

  ALTER TABLE "SORUN"."GRUPURI" ADD CONSTRAINT "GRUPURI_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "SORUN"."GRUPURI" ADD CONSTRAINT "GRUPURI_UK1" UNIQUE ("NUMEGRUP")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "SORUN"."GRUPURI" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "SORUN"."GRUPURI" MODIFY ("NUMEGRUP" NOT NULL ENABLE);
--------------------------------------------------------
--  Ref Constraints for Table MECIURI
--------------------------------------------------------

  ALTER TABLE "SORUN"."MECIURI" ADD CONSTRAINT "MECIGRUPA" FOREIGN KEY ("IDGRUPA")
	  REFERENCES "SORUN"."GRUPURI" ("ID") ENABLE;
 
  ALTER TABLE "SORUN"."MECIURI" ADD CONSTRAINT "MECIGRUPB_FK" FOREIGN KEY ("IDGRUPB")
	  REFERENCES "SORUN"."GRUPURI" ("ID") ENABLE;
 
  ALTER TABLE "SORUN"."MECIURI" ADD CONSTRAINT "MECIURIJOC_FK" FOREIGN KEY ("JOCJUCAT")
	  REFERENCES "SORUN"."JOCURI" ("IDJOC") ENABLE;
 
  ALTER TABLE "SORUN"."MECIURI" ADD CONSTRAINT "MECIURITURNEU_FK" FOREIGN KEY ("IDTURNEU")
	  REFERENCES "SORUN"."TURNEE" ("IDTURNEU") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table PARIURI
--------------------------------------------------------

  ALTER TABLE "SORUN"."PARIURI" ADD CONSTRAINT "PARIURI_FK1" FOREIGN KEY ("IDMECI")
	  REFERENCES "SORUN"."MECIURI" ("IDMECI") ENABLE;
 
  ALTER TABLE "SORUN"."PARIURI" ADD CONSTRAINT "PARIURI_FK2" FOREIGN KEY ("IDUTILIZATOR")
	  REFERENCES "SORUN"."UTILIZATORI" ("IDUTILIZATOR") ENABLE;
