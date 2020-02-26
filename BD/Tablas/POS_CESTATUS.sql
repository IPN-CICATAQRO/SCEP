DROP TABLE SYSTEM.POS_CESTATUS CASCADE CONSTRAINTS;

CREATE TABLE SYSTEM.POS_CESTATUS
(
  PCE_PK_ESTATUS  NUMBER(2)                     NOT NULL,
  PCE_ESTATUS     VARCHAR2(50 BYTE)             NOT NULL
)
TABLESPACE SYSTEM
PCTUSED    40
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            FREELISTS        1
            FREELIST GROUPS  1
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE
MONITORING;


CREATE UNIQUE INDEX SYSTEM.POS_CESTATUS_PK ON SYSTEM.POS_CESTATUS
(PCE_PK_ESTATUS)
LOGGING
TABLESPACE SYSTEM
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            FREELISTS        1
            FREELIST GROUPS  1
            BUFFER_POOL      DEFAULT
           );

ALTER TABLE SYSTEM.POS_CESTATUS ADD (
  CONSTRAINT POS_CESTATUS_PK
  PRIMARY KEY
  (PCE_PK_ESTATUS)
  USING INDEX SYSTEM.POS_CESTATUS_PK
  ENABLE VALIDATE);
