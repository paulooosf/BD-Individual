-- Criando banco de dados
create database policia;

-- Criando tabelas
create table endereco (
	end_se_id SERIAL not null primary key,
	end_int_cep INTEGER not null,
	end_tx_logradouro VARCHAR(255) not null,
	end_tx_bairro VARCHAR(50) not null,
	end_tx_uf VARCHAR(2) not null,
	end_int_numero INTEGER,
	end_tx_complemento VARCHAR(25),
	end_tx_referencia VARCHAR(50)
);

create table usuario (
	usu_se_id SERIAL not null primary key,
	usu_tx_nome VARCHAR(50) not null,
	usu_tx_email VARCHAR(50) not null, 
	usu_tx_telefone VARCHAR(11) not null,
	usu_tx_cpf VARCHAR(11) not null, 
	usu_tx_genero VARCHAR(20) not null,
	usu_fk_end INTEGER not null,
	
	foreign key (usu_fk_end)
	references endereco (end_se_id)
);

create table delegacia (
	del_se_id SERIAL not null primary key,
	del_int_num_policiais INTEGER not null,
	del_int_num_processos INTEGER not null,
	del_fk_end INTEGER not null,
	
	foreign key (del_fk_end)
	references endereco (end_se_id)
);

create table secao (
	sec_se_id SERIAL primary key not null,
	sec_tx_cat VARCHAR(30) not null,
	sec_int_num_processos INTEGER not null,
	sec_fk_del INTEGER not null,
	
	foreign key (sec_fk_del)
	references delegacia (del_se_id)
);

create table policial (
	pol_se_id SERIAL not null primary key,
	pol_tx_telefone VARCHAR(11) not null,
	pol_tx_nome VARCHAR(50) not null,
	pol_tx_cpf VARCHAR(11) not null,
	pol_fk_end INTEGER not null,
	pol_fk_sec INTEGER not null,
	
	foreign key (pol_fk_end)
	references endereco (end_se_id),
	
	foreign key (pol_fk_sec)
	references secao (sec_se_id)
);

create table denuncia (
	den_se_id SERIAL not null primary key,
	den_dt_data DATE not null,
	den_tx_detalhamento VARCHAR(255) not null,
	den_bl_anonimo BOOLEAN,
	den_fk_sec INTEGER not null,
	den_fk_usu INTEGER not null,
	den_fk_end INTEGER,
	
	foreign key (den_fk_sec)
	references secao (sec_se_id),
	
	foreign key (den_fk_usu)
	references usuario (usu_se_id),
	
	foreign key (den_fk_end)
	references endereco (end_se_id)
);

create table processo (
	pro_se_id SERIAL not null primary key,
	pro_tx_detalhamento VARCHAR(255) not null,
	pro_bl_ativo BOOLEAN not null,
	pro_fk_den INTEGER not null,
	pro_fk_pol INTEGER not null,
	pro_fk_sec INTEGER not null,
	
	foreign key (pro_fk_den)
	references denuncia (den_se_id),
	
	foreign key (pro_fk_pol)
	references policial (pol_se_id),
	
	foreign key (pro_fk_sec)
	references secao (sec_se_id)
);

-- Inserindo dados nas tabelas
insert into endereco (end_int_cep, end_tx_logradouro, end_tx_bairro, end_tx_uf, end_int_numero, end_tx_complemento, end_tx_referencia)
values
    (21350301, 'Rua Carvalho de Sousa', 'Madureira', 'RJ', 167, 'Casa 101', 'Próximo à estação de trem'),
    (21011405, 'Rua Padre Carlos Leôncio', 'Colégio', 'RJ', 254, NULL, 'Perto do mercado'),
    (21210874, 'Avenida Monsenhor Félix', 'Irajá', 'RJ', 1541, 'Loja 302', 'Próximo à escola'),
    (22041202, 'Rua Nossa Senhora de Copacabana', 'Copacabana', 'RJ', 45, 'Apt 408', 'Próximo ao metrô'),
    (20031645, 'Avenida Rio Branco', 'Centro', 'RJ', 76, 'Sala 502', 'Próximo à estação de trem'),
    (22080457, 'Rua Barata Ribeiro', 'Copacabana', 'RJ', 89, NULL, 'Próximo à praia'),
    (22021487, 'Rua Xavier da Silveira', 'Ipanema', 'RJ', 501, 'Casa 703', NULL),
    (22411123, 'Avenida Vieira Souto', 'Ipanema', 'RJ', 704, 'Apt 808', 'Em frente ao posto 9'),
    (22271794, 'Rua Visconde de Pirajá', 'Leblon', 'RJ', 67, 'Loja 910', 'Próximo ao comércio local'),
    (22420302, 'Rua Prudente de Morais', 'Lagoa', 'RJ', 745, 'Apt 1007', 'Perto do supermercado'),
    (22410504, 'Avenida Epitácio Pessoa', 'Jardim Botânico', 'RJ', 1100, NULL, 'Ao lado do parque'),
    (22793501, 'Rua Aroazes', 'Barra da Tijuca', 'RJ', 128, 'Apt 304', 'Condomínio XPTO'),
    (22640365, 'Avenida das Américas', 'Recreio dos Bandeirantes', 'RJ', 1380, 'Sala 1313', 'Shopping Valha'),
    (22775748, 'Estrada dos Bandeirantes', 'Vargem Grande', 'RJ', 1400, 'Casa 1401', 'Próximo ao centro comercial'),
    (22250741, 'Rua Sá Ferreira', 'Copacabana', 'RJ', 1554, NULL, 'Perto do ponto de ônibus'),
    (25650541, 'Rua Teresa', 'Centro', 'RJ', 115, 'Loja 101', 'Próximo à praça'),
    (25660784, 'Avenida Ipiranga', 'Quitandinha', 'RJ', 541, 'Casa 25', 'Ao lado do mercado'),
    (25670154, 'Rua do Imperador', 'Centro', 'RJ', 31, 'Sala 540', 'Próximo à prefeitura'),
    (25680234, 'Rua Montecaseros', 'Valparaíso', 'RJ', 78, NULL, 'Próximo ao parque'),
    (25690784, 'Estrada União e Indústria', 'Itaipava', 'RJ', 6457, 'Loja 5', 'Em frente ao restaurante');
 
insert into usuario (usu_tx_nome, usu_tx_email, usu_tx_telefone, usu_tx_cpf, usu_tx_genero, usu_fk_end)
values 
	('Roberto Carlos', 'robertao@gmail.com', '21985678704', '16532498712', 'masculino', 1),
	('Ana Claudia', 'claudinha.oi45@hotmail.com', '21984563278', '15298115610', 'feminino', 2),
	('Giulia Meirelles', 'meirellesgiu.2019@outlook.com', '21986542465', '07978455460', 'feminino', 3),
	('Claudio Ferreira', 'claudinhosacana@bol.com.br', '24972506480', '13645812720', 'masculino', 4),
	('Valentina Oliveira', 'vavaishere@gmail.com', '21985134567', '02565497312', 'fluido', 5);

insert into delegacia (del_int_num_policiais, del_int_num_processos, del_fk_end)
values 
	(394, 1250, 6),
	(290, 764, 7),
	(92, 270, 8),
	(540, 1571, 9),
	(462, 364, 10);
	
insert into secao (sec_tx_cat, sec_int_num_processos, sec_fk_del)
values 
	('Crimes Ciberneticos', 584, 1),
	('Defesa a Mulher', 789, 2),
	('Combate ao Trafico', 1290, 3),
	('Homicidios', 360, 4),
	('Sequestros', 290, 5);
	
insert into policial (pol_tx_telefone, pol_tx_nome, pol_tx_cpf, pol_fk_end, pol_fk_sec)
values 
	('21956425567', 'Felipe Andrade da Silva', '07546548710', 11, 1),
	('24995355236', 'Andre Teixeira Gomes', '15465789475', 12, 2),
	('2196478742', 'Fabio Freitas Ferreira', '53245678482', 13, 3),
	('21945324795', 'Joao Kennedy Pinheiro', '05241774712', 14, 4),
	('21984547345', 'Leonardo Fernandez Gomes', '24654845615', 15, 5);
	
insert into denuncia (den_dt_data, den_tx_detalhamento, den_bl_anonimo, den_fk_sec, den_fk_usu, den_fk_end)
values 
	('2023-12-02', 'Sofri cyberbullying', null, 1, 1, null),
	('2023-12-01', 'Existe uma boca de fumo ao lado da minha casa', true, 3, 2, 16),
	('2023-11-25', 'Meu tio foi sequestrado por um corolla preto', null, 5, 3, 17),
	('2023-11-02', 'Ocorreu um assassinato no meu bairro durante a noite', true, 4, 4, 18),
	('2023-10-11', 'O marido de uma vizinha lhe agride', true, 2, 5, 19);
	
insert into processo (pro_tx_detalhamento, pro_bl_ativo, pro_fk_den, pro_fk_pol, pro_fk_sec)
values 
	('A denuncia esta sendo averiguada pelo policial', true, 5, 5, 5),
	('O infrator foi localizado e devidamente punido', false, 1, 1, 1),
	('Esta sendo montada uma equipe para fazer uma operacao', true, 2, 3, 3),
	('Esta aberta uma investigacao sobre o sequestro', true, 3, 5, 5),
	('O caso foi solucionado e o infrator detido', false, 4, 4, 4);
	
-- Consultas

-- Retorna total de processos ativos por delegacia
select 
	d.del_se_id as "ID da Delegacia", 
	count(p.pro_se_id) as "Total de Processos Ativos"
from 
	delegacia d
left join 
	secao s on
	d.del_se_id = s.sec_fk_del
left join 
	processo p on
	s.sec_se_id = p.pro_fk_sec
where 
	p.pro_bl_ativo = true
group by 
	d.del_se_id;

-- Retorna total de policiais por bairro
select 
	e.end_tx_bairro as "Bairro", 
	sum(d.del_int_num_policiais) as "Total de Policiais"
from delegacia d
inner join endereco e on d.del_fk_end = e.end_se_id
group by e.end_tx_bairro;

-- Retorna relação de endereços de cada policial/usuario/delegacia
select
	e.end_tx_logradouro as "Rua",
	e.end_int_numero as "Número",
	e.end_tx_bairro as "Bairro",
	p.pol_tx_nome as "Nome do Policial",
	u.usu_tx_nome as "Nome do Usuario",
	d.del_se_id as "ID da Delegacia"
from
	endereco e
left join policial p on
	e.end_se_id = p.pol_fk_end
left join usuario u on
	e.end_se_id = u.usu_fk_end
left join delegacia d on
	e.end_se_id = d.del_fk_end;