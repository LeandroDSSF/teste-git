DROP TABLE MATRICULA;
DROP TABLE CLASSE;
DROP TABLE ALUNO;
DROP TABLE ESCOLA;
DROP TABLE GRAU;
DROP TABLE PERIODO;



CREATE TABLE PERIODO (
    
  CD_PERIODO NUMBER(2),
  NM_PERIODO VARCHAR2(50),
    
  CONSTRAINT CD_PERIODO_PK PRIMARY KEY(CD_PERIODO) );
  
  
  
CREATE TABLE GRAU (
    
  CD_GRAU NUMBER(2),
  NM_GRAU VARCHAR2(50) NOT NULL,
    
  CONSTRAINT CD_GRAU_PK PRIMARY KEY (CD_GRAU)  );
  
  
  
CREATE TABLE ESCOLA (
    
  CD_ESCOLA NUMBER(6),
  NM_ESCOLA VARCHAR2(50) NOT NULL,
  DS_ENDERECO VARCHAR2(50) NOT NULL,
  DS_BAIRRO VARCHAR2(40) NOT NULL,
  
  CONSTRAINT CD_NUMBER_PK PRIMARY KEY (CD_ESCOLA) );
  
  
  
CREATE TABLE ALUNO (
    
  NR_RGM        NUMBER(8),
  NM_NOME       VARCHAR2(40) NOT NULL,
  NM_PAI        VARCHAR2(40) NOT NULL,
  NM_MAE        VARCHAR2(40) NOT NULL,
  DT_NASCIMENTO DATE NOT NULL,
  ID_SEXO       CHAR(1) NOT NULL,
    
  CONSTRAINT NR_RGM_PK PRIMARY KEY (NR_RGM) );
  
  
  
CREATE TABLE CLASSE (
    
  CD_CLASSE    NUMBER(8),
  NR_ANOLETIVO NUMBER(4) NOT NULL,
  CD_ESCOLA    NUMBER(6),
  CD_GRAU      NUMBER(2),
  NR_SERIE     NUMBER(2) NOT NULL,
  SG_TURMA     VARCHAR2(2) NOT NULL,
  CD_PERIODO NUMBER(2),
    
  CONSTRAINT CD_CLASSE_PK PRIMARY KEY (CD_CLASSE),
  CONSTRAINT CD_PERIODO_FK FOREIGN KEY (CD_PERIODO) REFERENCES PERIODO(CD_PERIODO),
  CONSTRAINT CD_GRAU_FK FOREIGN KEY (CD_GRAU) REFERENCES GRAU(CD_GRAU),
  CONSTRAINT CD_ESCOLA_FK FOREIGN KEY (CD_ESCOLA) REFERENCES ESCOLA(CD_ESCOLA),
  CONSTRAINT NR_ANOLETIVO_CK CHECK (NR_ANOLETIVO > 2000) );
  
  
  
CREATE TABLE MATRICULA (
    
  CD_CLASSE    NUMBER(8),
  NR_RGM       NUMBER(8),
  DT_MATRICULA DATE NOT NULL,
    
  CONSTRAINT CD_CLASSE_RGM_PK PRIMARY KEY (NR_RGM, CD_CLASSE),
  CONSTRAINT NR_RGM_FK FOREIGN KEY(NR_RGM) REFERENCES ALUNO(NR_RGM),
  CONSTRAINT CD_CLASSE_FK FOREIGN KEY(CD_CLASSE) REFERENCES CLASSE(CD_CLASSE) ); 
  
  
