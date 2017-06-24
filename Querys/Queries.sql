-- Tela: Login_usuario.
 
-- Botão: Entrar.
 
SELECT * FROM tb_usuario where cpf_usuario = 21485255 AND pwd_usuario = 123;
-- ___________________________________________________________________________
 
-- Tela: Menu_config/Notas_usuario_2.
 
-- Botão: Minhas notas.
 
SELECT * FROM 
    tb_notas n,
    tb_curso c,
    tb_disciplina d,
    ta_usuario_cursos uc,
    ta_disciplina_cursos dc,
    tb_assunto a    
WHERE uc.cod_usuario = 1
    and c.cod_faculdade = 1
    and uc.cod_curso = 1
    and c.idt_curso = uc.cod_curso
    and dc.cod_curso = c.idt_curso
    and d.idt_disciplina = dc.cod_disciplina
    and d.idt_disciplina = 1
    and d.sem_disciplina = 1
    and a.cod_disciplina = dc.cod_disciplina
    and n.cod_assunto = a.idt_assunto
    and n.cod_usuario = 1
    and n.cod_assunto = a.idt_assunto
    and c.sts_curso = 1
    and d.sts_disciplina = 1
    and uc.sts_usuario_cursos = 1
    and dc.sts_disciplina_cursos = 1
    and a.sts_assunto = 1;
-- ___________________________________________________________________________
  
-- Tela: Menu_config/Cursos_usuario.
 
-- Botão: Meus Cursos.
 
SELECT *
FROM ta_usuario_cursos uc,
     	tb_curso c
WHERE uc.cod_usuario = 1
  AND c.cod_faculdade = 1
  AND c.idt_curso = uc.cod_curso
  AND c.cod_faculdade = 1
  AND c.sts_curso = 1;
-- ___________________________________________________________________________
 
-- Tela: Menu_config/Atividades_usuario.
 
-- Botão: Minhas atividades.
 
SELECT a.* FROM
    tb_curso c,
    tb_disciplina d,
    ta_usuario_cursos uc,
    ta_disciplina_cursos dc,
    tb_assunto a
WHERE uc.cod_usuario = 1
    AND c.cod_faculdade = 1
    AND c.idt_curso = uc.cod_curso
    AND dc.cod_curso = uc.cod_curso
    AND d.idt_disciplina = dc.cod_disciplina
    AND a.cod_disciplina = d.idt_disciplina
    AND d.sem_disciplina = 1
    AND c.sts_curso = 1
    AND d.sts_disciplina = 1
    AND uc.sts_usuario_cursos = 1
    AND dc.sts_disciplina_cursos = 1
    AND a.sts_assunto = 1;
-- ___________________________________________________________________________
-- Tela: Menu_config/Editar_usuario
 
-- Botão: Meus Dados.
 
SELECT * FROM tb_usuario u WHERE u.idt_usuario = 1 AND u.sts_usuario = 1;
-- ___________________________________________________________________________
 
 
-- Tela: Menu_admin_inst
 
-- Botão: Faculdades
 
SELECT * FROM tb_faculdade f WHERE f.cod_instituicao = 1;
 -- Botão: Assuntos
 
SELECT * FROM tb_assunto a, ta_usuario_faculdade uf WHERE uf.cod_faculdade = 1 AND uf.cod_usuario = 1 AND a.idt_usuario_criador = 1;
-- ___________________________________________________________________________
 
-- Tela: Manter_faculdade_admin_inst
 
-- Botão: Excluir
 
UPDATE tb_faculdade SET idt_faculdade = ?, nme_faculdade = ?, cod_instituicao = ?, sts_faculdade = 0, dta_insercao = ? WHERE idt_faculdade = ?;
-- ___________________________________________________________________________
 
-- Tela: Nova_faculdade_admin_inst
 
-- ComboBox: Admin. da Faculdade.
 
SELECT * FROM tb_usuario u, ta_usuario_faculdade uf WHERE uf.cod_faculdade = 1 AND u.idt_usuario = uf.cod_usuario AND u.tpo_usuario = 3;
 
-- Botão: Salvar
 
INSERT INTO tb_faculdade (idt_faculdade, nme_faculdade, cod_instituicao, sts_faculdade, dta_insercao) VALUES (?, ?, ?, ?, ?);
-- ___________________________________________________________________________
 
-- Tela: Editar_faculdade_admin_inst
 
-- ComboBox: Admin. da Faculdade.
 
SELECT * FROM tb_usuario u, ta_usuario_faculdade uf WHERE uf.cod_faculdade = 1 AND u.idt_usuario = uf.cod_usuario AND u.tpo_usuario = 3;
 
-- Botão: Salvar
 
UPDATE tb_faculdade SET idt_faculdade = ?, nme_faculdade = ?, cod_instituicao = ?, sts_faculdade = ?, dta_insercao = ? WHERE idt_faculdade = ?;
-- ___________________________________________________________________________
 
-- Tela: Manter_assunto_admin_inst
 
-- Botão: Excluir.
 
UPDATE tb_assunto SET idt_assunto = ?, txt_tema_assunto = ?, dta_insercao = ?, sts_assunto = 0;
-- ___________________________________________________________________________
 
-- Tela: Novo_assunto_admin_inst_1
 
-- ComboBox: Curso relacionado
 
SELECT c.* FROM
     ta_usuario_faculdade uf,
     ta_usuario_cursos uc,
     tb_curso c,
     tb_usuario u
WHERE uf.cod_usuario = 1
  AND uf.cod_faculdade = 1
  AND uc.cod_usuario = uf.cod_usuario
  AND uc.cod_curso = c.idt_curso
  AND c.cod_faculdade = uf.cod_faculdade
  AND u.idt_usuario = uf.cod_usuario
  AND u.tpo_usuario = 2;
 
-- ComboBox: Disciplina relacionada
 
SELECT * FROM
     tb_disciplina d,
     ta_disciplina_cursos dc,
     tb_curso c
WHERE c.cod_faculdade = 1
  AND c.idt_curso = 1
  AND dc.cod_curso = c.idt_curso
  AND d.idt_disciplina = dc.cod_disciplina;
-- ___________________________________________________________________________
  
-- Tela: Menu_professor
 
-- Botão: Meus dados
 
SELECT * FROM tb_usuario u where u.idt_usuario = 1;
 
-- Botão: Minhas disciplinas
 
SELECT * FROM
     ta_usuario_cursos uc,
     ta_disciplina_cursos dc,
     tb_disciplina d,
     ta_usuario_faculdade uf,
     tb_curso c
WHERE uc.cod_usuario = 1
  AND c.idt_curso = uc.cod_curso
  AND uf.cod_faculdade = 1
  AND uf.cod_usuario = 1
  AND dc.cod_curso = c.idt_curso
  AND d.idt_disciplina = dc.cod_disciplina;
 
-- Botão: Assuntos
 
SELECT * FROM tb_assunto a WHERE a.idt_usuario_criador = 1;
 
-- ___________________________________________________________________________
 
-- Tela: Manter_assunto_professor
 
-- Botão: Novo
 
INSERT INTO tb_assunto (idt_assunto, txt_tema_assunto, cod_disciplina, dta_insercao, sts_assunto, dt_usuario_criador) VALUES (?, ?, ?, ?, ?, ?);
 
-- Botão: Editar
 
UPDATE tb_usuario SET idt_assunto = ?, txt_tema_assunto = ?, cod_disciplina = ?, dta_insercao = ?, sts_assunto = ?, dt_usuario_criador = ? WHERE idt_assunto = ?;
 
-- Botão: Excluir
 
UPDATE tb_usuario SET idt_assunto = ?, txt_tema_assunto = ?, cod_disciplina = ?, dta_insercao = ?, sts_assunto = 0, dt_usuario_criador = ? WHERE idt_assunto = ?;
-- ___________________________________________________________________________
 
-- Tela: Editar_usuario

SELECT *
FROM eduflix.tb_usuario
WHERE idt_usuario=?
  AND sts_usuario=1;

-- Botão: Salvar

UPDATE eduflix.tb_usuario
SET cpf_usuario=?,
    nme_usuario=?,
    eml_usuario=?,
    pwd_usuario=?,
    tpo_usuario=?,
    dta_insercao=?,
    sts_usuario=?,
    lgn_especial=?,
    tel_usuario=?
WHERE idt_usuario=?;

-- Botão: Alterar senha

SELECT *
FROM eduflix.tb_usuario
WHERE idt_usuario=?
  AND sts_usuario=1;


-- Botão: Confirmar(Alterar senha)
UPDATE eduflix.tb_usuario
SET cpf_usuario=?,
    nme_usuario=?,
    eml_usuario=?,
    pwd_usuario=?,
    tpo_usuario=?,
    dta_insercao=?,
    sts_usuario=?,
    lgn_especial=?,
    tel_usuario=?
WHERE idt_usuario=?;
 
-- ___________________________________________________________________________
 
 

-- Tela: Editar_usuario_admin_inst

SELECT *
FROM eduflix.tb_usuario
WHERE idt_usuario=?
  AND sts_usuario=1;

-- Botão: Salvar
UPDATE eduflix.tb_usuario
SET cpf_usuario=?,
    nme_usuario=?,
    eml_usuario=?,
    pwd_usuario=?,
    tpo_usuario=?,
    dta_insercao=?,
    sts_usuario=?,
    lgn_especial=?,
    tel_usuario=?
WHERE idt_usuario=?;

-- Botão: Alterar senha

SELECT *
FROM eduflix.tb_usuario
WHERE idt_usuario=?
  AND sts_usuario=1;

UPDATE eduflix.tb_usuario
SET cpf_usuario=?,
    nme_usuario=?,
    eml_usuario=?,
    pwd_usuario=?,
    tpo_usuario=?,
    dta_insercao=?,
    sts_usuario=?,
    lgn_especial=?,
    tel_usuario=?
WHERE idt_usuario=?;
-- ___________________________________________________________________________
 
-- Tela: Manter_cursos_admin_inst

SELECT c.*,
       f.nme_faculdade
FROM eduflix.tb_curso c,
     eduflix.tb_faculdade f
JOIN f ON c.cod_faculdade=f.idt_faculdade
AND c.sts_curso=1;

-- Barra de busca

SELECT c.*,
       f.nme_faculdade
FROM eduflix.tb_curso c,
     eduflix.tb_faculdade f
JOIN f ON c.cod_faculdade=f.idt_faculdade
AND c.nme_curso LIKE '%?%'
AND c.sts_curso=1;

-- Botão:  'Excluir' (exclusão lógica)

UPDATE eduflix.tb_curso
SET sts_curso=0
WHERE idt_curso=?;

-- Botão:  'Editar'

UPDATE eduflix.tb_curso
SET nme_curso=?,
    sem_curso=?,
    cod_faculdade=?,
    dta_insercao=?,
    sts_curso=?
WHERE idt_curso=?;

-- Query para o botão gera outra tela
 
-- ___________________________________________________________________________

-- Tela: Novo_curso_admin_inst


-- Combobox: Coordenador do curso

SELECT *
FROM eduflix.tb_usuario u,
     eduflix.tb_curso c,
     eduflix.tb_faculdade f
WHERE u.idt_usuario = c.cod_coordenador
  AND u.tpo_usuario = 2
  AND c.cod_faculdade = 1;
 
-- Combobox: Quantidade de semestres
 
SELECT c.qtd_semestres
FROM eduflix.tb_curso c
WHERE idt_curso = 1
  AND cod_faculdade = 1;
 

-- Botão: Salvar
INSERT INTO eduflix.tb_curso (idt_curso, nme_curso, sts_curso, cod_faculdade, cod_coordenador, qtd_semestre, dta_insercao)
VALUES (?,?,?,?,?);
 
-- ___________________________________________________________________________

-- Tela: Editar_curso_admin_inst

SELECT *
FROM eduflix.tb_usuario u,
     eduflix.tb_curso c,
     eduflix.tb_faculdade f
WHERE u.idt_usuario = c.cod_coordenador
  AND c.cod_faculdade=f.idt_faculdade
  AND u.tpo_usuario = 2;

-- Combobox: Coordenador do curso

SELECT *
FROM eduflix.tb_usuario u,
     eduflix.tb_curso c,
     eduflix.tb_faculdade f
WHERE u.idt_usuario = c.cod_coordenador
  AND u.tpo_usuario = 2
  AND c.cod_faculdade = 1;
 
-- Combobox: Faculdade relacionada
 
SELECT f.*
FROM eduflix.tb_faculdade f,
     eduflix.tb_instituicao i
WHERE f.cod_insituicao = i.idt_instituicao
  AND i.idt_insituicao = 1;
 
-- Combobox: Quantidade de semestres
 
SELECT c.qtd_semestres
FROM eduflix.tb_curso c
WHERE idt_curso = 1
  AND cod_faculdade = 1;
 
-- Botão: Salvar

UPDATE eduflix.tb_curso
SET idt_curso=?,
    nme_curso=?,
    sts_curso=?,
    cod_faculdade=?,
    cod_coordenador=?,
    qtd_semestre=?,
    dta_insercao=?
WHERE idt_curso=?;
 
-- ___________________________________________________________________________
 
-- Tela: Manter_disciplina_admin_inst
 -- Query de seleção de disciplinas

SELECT c.nme_curso,
       d.*
FROM eduflix.ta_disciplina_cursos dc
JOIN eduflix.tb_disciplina d ON d.idt_disciplina=dc.cod_disciplina
JOIN eduflix.tb_curso c ON c.idt_curso=dc.cod_curso
AND sts_disciplina=1
AND sts_curso=1
AND sts_disciplina_cursos=1;

-- Query de pesquisa na barra

SELECT c.nme_curso,
       d.*
FROM eduflix.ta_disciplina_cursos dc
JOIN eduflix.tb_disciplina d ON d.idt_disciplina=dc.cod_disciplina
JOIN eduflix.tb_curso c ON c.idt_curso=dc.cod_curso
AND d.nme_disciplina LIKE '%?%'
AND sts_disciplina=1
AND sts_curso=1
AND sts_disciplina_cursos=1;

-- Query para o botão 'Excluir' (exclusão lógica)

UPDATE eduflix.tb_disciplina
SET sts_disciplina=0
WHERE idt_disciplina=?;


-- ___________________________________________________________________________

-- Tela: Nova_disciplina_admin_inst


SELECT *
FROM eduflix.tb_curso;

-- Botão: Salvar
INSERT INTO eduflix.tb_disciplina (idt_disciplina, nme_disciplina, dta_insercao, sts_disciplina, sem_disciplina)
VALUES (?,?,?,1,?);

-- Tela: Editar_disciplina_admin_inst

SELECT c.*,
       d.*
FROM eduflix.ta_disciplina_cursos dc
JOIN eduflix.tb_disciplina d ON d.idt_disciplina=dc.cod_disciplina
JOIN eduflix.tb_curso c ON c.idt_curso=dc.cod_curso
AND sts_disciplina=1
AND sts_curso=1
AND sts_disciplina_cursos=1
AND idt_disciplina=1;

-- Botão: Salvar
UPDATE eduflix.tb_disciplina,
       eduflix.ta_disciplina_cursos
SET nme_disciplina=?,
    sem_disciplina=?,
    dta_insercao=?,
    sts_disciplina=?,
    cod_curso=idt_curso
WHERE idt_disciplina=?
  AND cod_disciplina=idt_disciplina;
 
-- ___________________________________________________________________________
 
-- Tela: Novo_assunto_admin_inst_3


-- Botão: Próximo
INSERT INTO eduflix.tb_assunto (idt_assunto, txt_tema_assunto, cod_disciplina, dta_insercao, sts_assunto)
VALUES (?,?,?,?,1);

-- Combobox: Tipos de Questão
SELECT * FROM eduflix.tb_tipo_questao;

-- Questão tipo: Atividade V ou F

INSERT INTO eduflix.tb_v_f (cod_assunto, sts_v_f, idt_v_f, txt_enunciado, ord_v_f, dta_insercao)
VALUES (?,?,?,?,?,?);
 
-- Botão: Adicionar alternativa

INSERT INTO eduflix.tb_v_f_alternativas (idt_v_f_alternativas, txt_item, vlr_v_f, cod_v_f, sts_v_f_alternativas)
VALUES (?,?,?,?,?);

-- Questão tipo: Atividade múltipla escolha

INSERT INTO eduflix.tb_mult_escolha (txt_enunciado, cod_assunto, sts_mul_escolha, idt_mult_escolha, ord_mult_escolha, dta_insercao, vlr_questao)
VALUES (?,?,?,?,?,?,?);


-- Botão: Adicionar alternativa

INSERT INTO eduflix.tb_mult_alternativas (idt_alternativas, txt_item, correto, cod_mult_escolha, sts_mult_alternativas)
VALUES (?,?,?,?,?);

-- Questão tipo: Atividade completar

INSERT INTO eduflix.tb_completar (txt_enunciado, cod_assunto, sts_completar, idt_completar, ord_completar, qtd_campos, txt_frase, dta_insercao)
VALUES (?,?,?,?,?,?,?,?);

-- Botão: Adicionar alternativa

INSERT INTO eduflix.tb_completar_alternativas (idt_completar_alternativas, ord_completar_alternativas, txt_palavra, cod_completar, sts_completar_alternativas)
VALUES (?,?,?,?,?);

-- Questão tipo: Atividade somatório

INSERT INTO eduflix.tb_somatorio (idt_somatorio, txt_enunciado, cod_assunto, sts_somatorio, soma, ord_somatorio, dta_insercao)
VALUES (?, ?, ?,?,?, ?, ?);

-- Botão: Adicionar alternativa

INSERT INTO eduflix.tb_somatorio_alternativas (idt_somatorio_alternativas, txt_item, vlr_somatorio_alternativas, cod_somatorio, sts_somatorio_alternativas)
VALUES (?,?,?,?,?);
 
-- ___________________________________________________________________________
 
-- Tela: Cadastro_IES_3
 
-- Botão: Cadastrar
INSERT INTO tb_instituicao ('idt_instituicao', 'cnpj_instituicao', 'nme_instituicao', 'end_instituicao', 'cep_instituicao', 'tel_instituicao_1', 'tel_instituicao_2', 'eml_instituicao', 'url_instituicao', 'dta_insercao', 'sts_instituicao', 'razao_social') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);
-- ___________________________________________________________________________
 
-- Tela: Credenciar_usuarios
 
-- Botão: Cadastrar
INSERT INTO tb_usuario ('idt_usuario', 'cpf_usuario', 'nme_usuario', 'eml_usuario', 'pwd_usuario', 'tpo_usuario', 'dta_insercao', 'sts_usuario', 'lgn_especial', 'tel_usuario') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?);
 
-- ___________________________________________________________________________
 
-- Tela: Novo_usuario_admin_inst
 
-- Botão: Salvar
INSERT INTO tb_usuario ('idt_usuario', 'cpf_usuario', 'nme_usuario', 'eml_usuario', 'pwd_usuario', 'tpo_usuario', 'dta_insercao', 'sts_usuario', 'lgn_especial', 'tel_usuario') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?);
 
-- ___________________________________________________________________________
-- Tela: Editar_usuario_admin_inst
 
-- Botão: Salvar
UPDATE tb_usuario SET cpf_usuario=?, nme_usuario=?, eml_usuario=?,  dta_insercao=? , sts_usuario=?, tel_usuario=? WHERE idt_usuario=?;
 
-- Botão: Alterar Senha
UPDATE tb_usuario SET pwd_usuario=? where idt_usuario=?;
 
-- ___________________________________________________________________________ 
 
-- Tela: Feed
 
-- Botão: Thumbnail
 
SELECT vf.*, com.*, mult.*, s.* FROM 
    ta_usuario_faculdade uf,
    ta_usuario_cursos uc,
    ta_disciplina_cursos dc,
    tb_disciplina d,
    tb_assunto a,
    tb_curso c,
    tb_v_f vf,
    tb_completar com,
    tb_mult_escolha mult,
    tb_somatorio s    
WHERE uf.cod_usuario = 1
    AND uf.cod_faculdade = 1
    AND c.idt_curso = 1
    AND c.cod_faculdade = 1
    AND uc.cod_usuario = uf.cod_usuario
    AND uc.cod_curso = c.idt_curso
    AND dc.cod_curso = uc.cod_curso
    AND d.idt_disciplina = dc.cod_disciplina
    AND a.cod_disciplina = d.idt_disciplina
    AND s.cod_assunto = 1
    AND mult.cod_assunto = 1
    AND com.cod_assunto = 1
    AND vf.cod_assunto = 1;
