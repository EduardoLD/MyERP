drop database condominio;
create database condominio;
use condominio;

create table tipo_unidade (
id_tipo_unidade int not null auto_increment,
tipo_unidade varchar(50),
primary key(id_tipo_unidade)
);

create table unidade (
id_unidade int not null auto_increment,
id_tipo_uni int,
primary key (id_unidade),
foreign key (id_tipo_uni)references tipo_unidade(id_tipo_unidade)
);

create table ocorrencia (
id_uni int,
descricao varchar(250),
foreign key (id_uni)references unidade(id_unidade)
);

create table veiculo (
id_uni int,
tipo varchar(25),
placa varchar(10),
foreign key (id_uni)references unidade(id_unidade)
);

create table tipo_id (
id_tipo_identificacao int not null auto_increment,
descricao varchar(200),
primary key(id_tipo_identificacao)
);

create table morador (
id_tipo_identi int,
id_uni int,
foreign key(id_tipo_identi)references tipo_id(id_tipo_identificacao),
foreign key(id_uni) references unidade(id_unidade)
);

create table visitante (
identificacao int not null auto_increment,
id_tipo_iden int,
id_uni int,
nome varchar(50),
primary key(identificacao),
foreign key(id_tipo_iden)references tipo_id(id_tipo_identificacao),
foreign key(id_uni)references unidade(id_unidade)
);

create table prestador_de_servicos (
id_tipo_identificacao int,
id_unidade int,
nome varchar(50),
foreign key(id_tipo_identificacao)references tipo_id(id_tipo_identificacao),
foreign key(id_unidade)references unidade(id_unidade)
);

create table empregado (
id_tipo_identificacao int,
funcao varchar(50),
nome varchar(50),
foreign key(id_tipo_identificacao)references tipo_id(id_tipo_identificacao)
);