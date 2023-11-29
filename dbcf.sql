drop database dbcleanfood;

create database dbcleanfood;

use dbcleanfood;


create table tbusuarios(
codUsuario int not null auto_increment,
datanasc date not null,
endereco varchar(50) not null,
cidade varchar(50) not null,
bairro varchar(50) not null,
cep char(9) not null,
nome varchar(100) not null,
cpf char(14) not null unique,
email varchar(40) not null,
telCel char(10) not null,
senha varchar(8) not null,
primary key(codUsuario)         
);
create table tbclientes(
codCliente int not null auto_increment,
nome varchar(100) not null,
sobrenome varchar(100) not null,
senha varchar(20) not null,
datanasc date not null,
cpf char(14) not null unique,
email varchar(40) not null,
primary key(codCliente)
);
create table tbreceitas(
codReceita int not null auto_increment,
rendeQted int default 0 check(rendeQted>=0),
rendeMedidas decimal (9,2),	
nomeReceita varchar(50) not null,
imagemDaReceita blob not null,
codCliente int not null,
primary key(codReceita),
foreign key(codCliente)references tbclientes(codCliente)
);
create table tbavaliacao(
codAvaliacao int not null auto_increment,
comentario varchar(100) not null,
dataComentario date not null,
horaComentario time not null,
codReceita int not null,
codCliente int not null,
primary key(codAvaliacao),
foreign key(codReceita)references tbreceitas(codReceita),
foreign key(codCliente)references tbclientes(codCliente)
);
create table tbingredientes(
codIngrediente int not null auto_increment,
nomeIngrediente varchar (50) not null,
codReceita int not null,
primary key(codIngrediente),
foreign key(codReceita)references tbreceitas(codReceita)
);
create table tbmedida(
codMedida int not null auto_increment,
grama char(1),
quilograma char(2) default 'kg',
mililitro char(2) default 'ml',
codIngrediente int not null,
primary key(codMedida),
foreign key (codIngrediente)references tbingredientes(codIngrediente)
);
create table tbquantidade(
codQtde int not null auto_increment,
nomeQtde varchar(50) not null,
qtdeIngrediente varchar(50) not null,
codMedida int not null,
primary key (codQtde),
foreign key (codMedida)references tbmedida(codMedida)
);
create table tbpasso(
codPasso int not null auto_increment,
mododePreparo varchar(100) not null,
tempodePreparo varchar(50) not null,
codReceita int not null,
primary key (codPasso),
foreign key (codReceita)references tbreceitas(codReceita)
);

show tables;

desc * from tbusuarios;
desc * from tbcliente;
desc * from tbreceitas;
desc * from tbavaliacao;
desc * from tbingredientes;
desc * from tbmedida;
desc * from tbquantidade;
desc * from tbpasso;








