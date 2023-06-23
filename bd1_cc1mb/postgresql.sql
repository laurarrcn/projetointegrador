--Criar tabelas
CREATE TABLE coordenador (
                coordenador_id NUMERIC(20)  NOT NULL,
                nome           VARCHAR(255) NOT NULL,
                email          VARCHAR(30)  NOT NULL,
                senha          VARCHAR(255) NOT NULL,
                telefone       VARCHAR(20)  NOT NULL,
                CONSTRAINT coordenador_id_pk PRIMARY KEY (coordenador_id)
);
COMMENT ON TABLE  coordenador                IS 'Informações do coordenador';
COMMENT ON COLUMN coordenador.coordenador_id IS 'ID do coordenador';
COMMENT ON COLUMN coordenador.nome           IS 'Nome do coordenador';
COMMENT ON COLUMN coordenador.email          IS 'Email do coordenador para login';
COMMENT ON COLUMN coordenador.senha          IS 'Senha do coordenador para login';
COMMENT ON COLUMN coordenador.telefone       IS 'Telefone do coordenador';


CREATE TABLE aluno (
                matricula_aluno NUMERIC(9)   NOT NULL,
                nome            VARCHAR(255) NOT NULL,
                email           VARCHAR(30)  NOT NULL,
                senha           VARCHAR(255) NOT NULL,
                curso           VARCHAR(255) NOT NULL,
                telefone        VARCHAR(20)  NOT NULL,
                coordenador_id  NUMERIC(20)  NOT NULL,
                CONSTRAINT matricula_aluno PRIMARY KEY (matricula_aluno)
);
COMMENT ON TABLE  aluno                 IS 'Informações dos alunos da instituição';
COMMENT ON COLUMN aluno.matricula_aluno IS 'numero de matricula do aluno';
COMMENT ON COLUMN aluno.nome            IS 'Nome completo do aluno';
COMMENT ON COLUMN aluno.email           IS 'Email do aluno para cadastro';
COMMENT ON COLUMN aluno.senha           IS 'Senha do aluno para cadastro';
COMMENT ON COLUMN aluno.curso           IS 'Curso do aluno';
COMMENT ON COLUMN aluno.telefone        IS 'Telefone do aluno';
COMMENT ON COLUMN aluno.coordenador_id  IS 'ID do coordenador do aluno';


CREATE TABLE certificado (
                certificado_id  NUMERIC(20)  NOT NULL,
                coordenador_id  NUMERIC(20)  NOT NULL,
                matricula_aluno NUMERIC(9)   NOT NULL,
                nome_atividade  VARCHAR(255) NOT NULL,
                pontuacao       NUMERIC      NOT NULL,
                data_emissao    DATE         NOT NULL,
                PDF             BYTEA        NOT NULL,
                CONSTRAINT certificado_id_pk PRIMARY KEY (certificado_id, coordenador_id, matricula_aluno)
);
COMMENT ON TABLE  certificado                 IS 'Dados do certificado';
COMMENT ON COLUMN certificado.certificado_id  IS 'ID do certificado';
COMMENT ON COLUMN certificado.coordenador_id  IS 'ID do coordenador que avaliou o certificado';
COMMENT ON COLUMN certificado.matricula_aluno IS 'Matricula do aluno que enviou o certificado';
COMMENT ON COLUMN certificado.nome_atividade  IS 'Atividade relacionada ao certificado';
COMMENT ON COLUMN certificado.pontuacao       IS 'Pontuacao atribuida ao certificado ';
COMMENT ON COLUMN certificado.data_emissao    IS 'Data que o certificado foi emitido';
COMMENT ON COLUMN certificado.PDF             IS 'PDF do certificado';


--Adicionar FK
ALTER TABLE certificado ADD CONSTRAINT coordenador_certificado_fk
FOREIGN KEY (coordenador_id)
REFERENCES coordenador (coordenador_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE aluno ADD CONSTRAINT coordenador_aluno_fk
FOREIGN KEY (coordenador_id)
REFERENCES coordenador (coordenador_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE certificado ADD CONSTRAINT aluno_certificado_fk
FOREIGN KEY (matricula_aluno)
REFERENCES aluno (matricula_aluno)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
