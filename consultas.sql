-- --------------------------------------------------
-- Consulta 1: Professores e suas turmas orientadas
-- --------------------------------------------------
select pr.Nome_Professor, t.Nome_Turma 
from Professores pr 
join Turmas t on pr.ID_Professor = t.ID_Professor_Orientador;


-- --------------------------------------------------
-- Consulta 2: Aluno com a melhor nota em Matemática
-- --------------------------------------------------
select a.nome_aluno, n.nota from Alunos a
join Notas n on a.ID_Aluno = n.ID_Aluno
join Disciplinas d on n.ID_Disciplina = d.ID_Disciplina
where d.Nome_Disciplina = 'Matemática'
order by n.Nota DESC
limit 1

-- --------------------------------------
-- Consulta 3: Total de alunos por turma
-- --------------------------------------
select t.Nome_Turma, count(ta.id_aluno) QuantidadeDeAlunos 
from Turma_Alunos ta
join Turmas t on t.ID_Turma = ta.ID_Turma 
group by ta.ID_Turma, t.Nome_Turma;

-- -----------------------------------------------
-- Consulta 4: Alunos e disciplinas matriculados
-- -----------------------------------------------
select a.Nome_Aluno, d.Nome_Disciplina from Disciplinas d
join Turma_Disciplinas td on d.ID_Disciplina = td.ID_Disciplina
join Turma_Alunos ta on ta.ID_Turma = td.ID_Turma
join Alunos a on a.ID_Aluno = ta.ID_Aluno
order by nome_aluno;

-- ----------------------------------------------
-- Consulta 5: View com nome, disciplina e nota
-- ----------------------------------------------
create view Infos AS
select A.Nome_Aluno, D.Nome_Disciplina, N.Nota from Alunos A
join Notas N on N.ID_Aluno = A.ID_Aluno
JOIN Disciplinas D ON D.ID_Disciplina = N.ID_Disciplina;
