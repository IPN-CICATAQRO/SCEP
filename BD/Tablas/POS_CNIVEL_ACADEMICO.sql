DROP TABLE SYSTEM.POS_CNIVEL_ACADEMICO CASCADE CONSTRAINTS;

CREATE TABLE SYSTEM.POS_CNIVEL_ACADEMICO
(
  CNA_PK_NIVEL_ACADEMICO  NUMBER(10)            NOT NULL,
  CNA_NIVEL_ACADEMICO     VARCHAR2(200 BYTE)    NOT NULL,
  CNA_FK_ESTATUS          NUMBER(2)             DEFAULT 2                     NOT NULL
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


CREATE UNIQUE INDEX SYSTEM.POS_CNIVEL_ACADEMICO_PK ON SYSTEM.POS_CNIVEL_ACADEMICO
(CNA_PK_NIVEL_ACADEMICO)
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

ALTER TABLE SYSTEM.POS_CNIVEL_ACADEMICO ADD (
  CONSTRAINT POS_CNIVEL_ACADEMICO_PK
  PRIMARY KEY
  (CNA_PK_NIVEL_ACADEMICO)
  USING INDEX SYSTEM.POS_CNIVEL_ACADEMICO_PK
  ENABLE VALIDATE);

ALTER TABLE SYSTEM.POS_CNIVEL_ACADEMICO ADD (
  CONSTRAINT POS_CNIVEL_ACADEMICO_R01 
  FOREIGN KEY (CNA_FK_ESTATUS) 
  REFERENCES SYSTEM.POS_CESTATUS (PCE_PK_ESTATUS)
  ENABLE VALIDATE);
