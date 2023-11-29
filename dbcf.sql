drop database dbcleanfood;

create database dbcleanfood;

use dbcleanfood;

create table tbcliente(
codCliente int not null auto_increment,
nome varchar(100) not null,
sobrenome varchar(100) not null,
senha varchar(20) not null,
datanasc date not null,
cpf char(14) not null unique,
email varchar(40) not null,
primary key(codCliente)
);
create table tbavaliacao(
codAvaliacao int not null auto_increment,
codReceita int not null,
codCliente int not null,
codUsuario int not null,
primary key(codAvaliacao),
foreign key(codReceita)references tbreceitas(codReceita),
foreign key(codCliente)references tbcliente(codCliente),
foreign key(codUsuario)references tbusuario(codUsuario)
);
create table tbusuario(
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
);
create table tbreceitas(
codReceita int not null auto_increment,
rendeQuantidade int default 0 check(rendeQuantidade >= 0),
rendeMedidas real,
nomeReceita varchar(50) not null,
imagemDaReceita not null,
codUsuario int not null,
primary key(codReceita),
foreign key(codUsuario)references tbusuario(codUsuario)
);
create table tbpasso(
codPasso int,
codReceita int,
modeDePreparo varchar(500),
descricao varchar(500)
); 
create table tbingredientes(
codIngrediente int not null auto_increment,
nomeIngrediente varchar(100) not null,
codReceita int not null,
primary key(codIngrediente),
foreign key(codReceita)references tbreceitas(codReceita) 
);
create table tbingredientesreceitas(
codIngredienteReceita int not null auto_increment,
medidaIngrediente char(50) not null,
qtandIngrediente int not null,
codReceita int not null,
codIngrediente int not null,
primary key (codIngredienteReceita),
foreign key (codIngrediente) references tbingredientes (codIngrediente),
foreign key (codReceita) references tbreceitas (codReceita)
);
create table tbmedida(
codMedida int not  null auto_increment,
grama char(5),
quilograma char(5),
mililtro char(5),
codIngrediente int not null,
codQuantidade int not null,
primary key(codMedida),
foreign key(codIngrediente)references tbingredientes(codIngrediente)
);
create table tbquantidade(
codQuantidade int not null auto_increment,
nomeQuantidade varchar(50) not null,
codMedida int not null,
primary key(codQuantidade),
foreign key(codMedida)references tbmedida(codMedida)
);






