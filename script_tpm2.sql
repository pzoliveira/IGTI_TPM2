use coleta_pericles;

select * from stg_pesquisa;

select * from pessoa;

select count(pet.nome_animal) total, pet.nome_animal
	FROM pesquisa pesq
	JOIN animal_estimacao pet ON pet.cod_animal = pesq.cod_animal
	JOIN pessoa ON pessoa.cod_pessoa = pesq.cod_pessoa
	WHERE pessoa.genero = 'Masculino'
	GROUP BY pet.nome_animal
    ORDER BY total DESC;
    
SELECT count(pesq.cod_animal)
	FROM pesquisa pesq
	JOIN animal_estimacao animal ON animal.cod_animal = pesq.cod_animal
    WHERE animal.nome_animal = 'cachorro' OR animal.nome_animal = 'gato';

SELECT count(pesq.cod_animal)
	FROM pesquisa pesq
	JOIN animal_estimacao animal ON animal.cod_animal = pesq.cod_animal
    WHERE animal.nome_animal = 'cachorro';

SELECT count(pesq.cod_pessoa)
	FROM pesquisa pesq
    JOIN pessoa ON pessoa.cod_pessoa = pesq.cod_pessoa
    JOIN clima ON clima.cod_clima = pesq.cod_clima
    WHERE pessoa.genero = 'Masculino' AND clima.descr_clima = 'frio';
    
select * from clima;

SELECT avg(pessoa.idade)
FROM pesquisa pesq
JOIN pessoa ON pessoa.cod_pessoa = pesq.cod_pessoa
JOIN bebida ON bebida.cod_bebida = pesq.cod_bebida 
JOIN clima ON clima.cod_clima = pesq.cod_clima
WHERE pessoa.genero = 'Masculino' AND bebida.nome_bebida = 'Chá' AND clima.descr_clima = 'frio';

SELECT * FROM bebida;

SELECT count(pesq.cod_hobby) total, hobby.nome_hobby ndh
FROM pesquisa pesq
JOIN hobby ON hobby.cod_hobby = pesq.cod_hobby
JOIN pessoa ON pessoa.cod_pessoa = pesq.cod_pessoa
WHERE pessoa.genero = 'Masculino'
GROUP BY ndh
ORDER BY total ASC;

SELECT count(pesq.cod_hobby) total, hobby.nome_hobby ndh
FROM pesquisa pesq
JOIN hobby ON hobby.cod_hobby = pesq.cod_hobby
JOIN pessoa ON pessoa.cod_pessoa = pesq.cod_pessoa
WHERE pessoa.genero = 'Feminino'
GROUP BY ndh
ORDER BY total DESC;

SELECT count(pesq.cod_pessoa)
FROM pesquisa pesq
JOIN pessoa ON pessoa.cod_pessoa = pesq.cod_pessoa
JOIN hobby ON hobby.cod_hobby = pesq.cod_hobby
WHERE pessoa.genero = 'Masculino' AND hobby.nome_hobby = 'Praticar esporte' AND pessoa.idade > 70;

SELECT * FROM hobby;

SELECT count(pesq.cod_pessoa)
FROM pesquisa pesq
JOIN pessoa ON pessoa.cod_pessoa = pesq.cod_pessoa
JOIN animal_estimacao animal ON animal.cod_animal = pesq.cod_animal
JOIN hobby ON hobby.cod_hobby = pesq.cod_hobby
WHERE pessoa.genero = 'Feminino' AND animal.nome_animal = 'cachorro' AND hobby.nome_hobby = 'Ler livros';

SELECT stddev(pessoa.idade)
FROM pesquisa pesq
JOIN pessoa ON pessoa.cod_pessoa = pesq.cod_pessoa
JOIN hobby ON hobby.cod_hobby = pesq.cod_hobby
WHERE hobby.nome_hobby = 'Assistir TV';

SELECT * FROM hobby;

SELECT ae.nome_animal, count(1)
FROM pesquisa p
JOIN animal_estimacao ae ON ae.cod_animal = p.cod_animal
WHERE ae.nome_animal = 'gato'
GROUP BY nome_animal;