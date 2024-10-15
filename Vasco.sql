create database Vasco;
use Vasco;

create table Categoria (
	idCategoria int not null primary key,
    nome varchar(45)
);

create table Departamento (
	idDepartamento int not null primary key,
    nome varchar(45)
);

create table Estado (
	uf char(2) not null primary key,
    nome varchar(50) not null
);

create table TipoEndereco (
	idTipoEndereco int not null primary key,
    nome varchar(30)
);

create table Cidade (
	idCidade int not null primary key,
    uf char(2) not null,
    nome varchar(85)
);

create table Bairro (
	idBairro int not null primary key,
    idCidade int not null,
    foreign key fk_idCidade(idCidade) references Cidade(idCidade),
    nome varchar(45)
);

create table Endereco (
	idEndereco int not null primary key,
    idBairro int not null,
    idTipoEndereco int not null,
    foreign key fk_idTipoEndereco(idTipoEndereco) references tipoendereco(idTipoEndereco),
    foreign key fk_idBairro(idBairro) references bairro(idBairro),
    nome varchar(100),
    numero varchar(6),
    cep char(9)
);

create table Fornecedor (
	idFornecedor int not null primary key,
    idEndereco int,
    foreign key fk_idEndereco(idEndereco) references Fornecedor(idFornecedor),
    nomeFornecedor varchar(45) not null
);

create table Produto (
	idProduto int not null primary key,
    idFornecedor int not null,
    idCategoria int not null,
    foreign key fk_idFornecedor(idFornecedor) references Fornecedor(idFornecedor),
    foreign key fk_idCategoria (idCategoria) references Categoria(idCategoria),
    nome varchar(150) not null,
    quantidade int not null,
    valorUnitario float not null
);

create table Cliente (
	idCliente int not null primary key,
    idEndereco int,
    foreign key fk_idEndereco(idEndereco) references endereco(idEndereco),
    nome varchar(150),
    sexo char(1),
    idade int
);


create table Funcionario (
	idFuncionario int not null primary key,
    idSupervisor int not null,
    idEndereco int not null,
    foreign key fk_idSupervisor(idSupervisor) references Funcionario(idFuncionario),
    foreign key fk_idEndereco(idEndereco) references Endereco(idEndereco),
    nome varchar(150),
    idade int,
    sexo char(2),
    dataContratacao date,
    dataDemissao date,
    demissao tinyint(1),
    salario float
);

create table Compra (
	idCompra int not null primary key,
    idCliente int not null,
    idFuncionario int not null,
    foreign key fk_idCliente(idCliente) references Cliente(idCliente),
    foreign key fk_idFuncionario(idFuncionario) references Funcionario(idFuncionario),
    dataCompra date,
    valorTotalCompra float,
    finalizada tinyint(1),
    formaPagamento varchar(15)
);

create table ItemCompra (
	idCompra int not null,
    idProduto int not null,
	foreign key fk_idCompra(idCompra) references Compra(idCompra),
    foreign key fk_idProduto(idProduto) references Produto(idProduto),
    quantidade int not null,
    valorTotal float not null
);

create table Telefone (
	idCliente int not null,
    idFuncionario int not null,
	foreign key (idCliente) references cliente(idCliente),
    foreign key (idFuncionario) references funcionario(idFuncionario),
    numeroTelefone varchar(10)
);

create table Dependente (
	idDependente int not null primary key,
    idFuncionario int not null,
    foreign key fk_idFuncionario(idFuncionario) references Funcionario(idFuncionario),
    nome varchar(150),
    parentesco varchar(45),
    sexo char(2),
    idade int
);

create table DeptFunc (
	idDeptFunc int not null primary key,
    idDepartamento int not null,
	idFuncionario int not null, 
    foreign key (idFuncionario) references funcionario(idFuncionario),
	foreign key (idDepartamento) references departamento(idDepartamento),
    dataEntradaDept date,
    dataSaidaDept date
); 

Select * from Categoria; #30 insert 
insert into Categoria (nome, idCategoria) values ('Produtos', 1);
insert into Categoria (nome, idCategoria) values ('Bebidas', 2);
insert into Categoria (nome, idCategoria) values ('Alimentos', 3);
insert into Categoria (nome, idCategoria) values ('Roupas', 4);
insert into Categoria (nome, idCategoria) values ('Eletrônicos', 5);
insert into Categoria (nome, idCategoria) values ('Móveis', 6);
insert into Categoria (nome, idCategoria) values ('Livros', 7);
insert into Categoria (nome, idCategoria) values ('Cosméticos', 8);
insert into Categoria (nome, idCategoria) values ('Brinquedos', 9);
insert into Categoria (nome, idCategoria) values ('Eletrodomésticos', 10);
insert into Categoria (nome, idCategoria) values ('Material de Escritório', 11);
insert into Categoria (nome, idCategoria) values ('Acessórios', 12);
insert into Categoria (nome, idCategoria) values ('Esportes', 13);
insert into Categoria (nome, idCategoria) values ('Jardinagem', 14);
insert into Categoria (nome, idCategoria) values ('Saúde', 15);
insert into Categoria (nome, idCategoria) values ('Automotivo', 16);
insert into Categoria (nome, idCategoria) values ('Pets', 17);
insert into Categoria (nome, idCategoria) values ('Arte e Artesanato', 18);
insert into Categoria (nome, idCategoria) values ('Moda', 19);
insert into Categoria (nome, idCategoria) values ('Tecnologia', 20);
insert into Categoria (nome, idCategoria) values ('Vestuário Infantil', 21);
insert into Categoria (nome, idCategoria) values ('Calçados', 22);
insert into Categoria (nome, idCategoria) values ('Instrumentos Musicais', 23);
insert into Categoria (nome, idCategoria) values ('Decoração', 24);
insert into Categoria (nome, idCategoria) values ('Produtos de Limpeza', 25);
insert into Categoria (nome, idCategoria) values ('Sustentáveis', 26);
insert into Categoria (nome, idCategoria) values ('Ofertas Especiais', 27);
insert into Categoria (nome, idCategoria) values ('Novidades', 28);
insert into Categoria (nome, idCategoria) values ('Colecionáveis', 29);
insert into Categoria (nome, idCategoria) values ('Eventos', 30);

Select * from Departamento; #30 insert
insert into Departamento (nome, idDepartamento) values ('Vendas', 1);
insert into Departamento (nome, idDepartamento) values ('Compras', 2);
insert into Departamento (nome, idDepartamento) values ('Financeiro', 3);
insert into Departamento (nome, idDepartamento) values ('Recursos Humanos', 4);
insert into Departamento (nome, idDepartamento) values ('Marketing', 5);
insert into Departamento (nome, idDepartamento) values ('TI', 6);
insert into Departamento (nome, idDepartamento) values ('Logística', 7);
insert into Departamento (nome, idDepartamento) values ('Atendimento ao Cliente', 8);
insert into Departamento (nome, idDepartamento) values ('Pesquisa e Desenvolvimento', 9);
insert into Departamento (nome, idDepartamento) values ('Jurídico', 10);
insert into Departamento (nome, idDepartamento) values ('Qualidade', 11);
insert into Departamento (nome, idDepartamento) values ('Suprimentos', 12);
insert into Departamento (nome, idDepartamento) values ('Planejamento', 13);
insert into Departamento (nome, idDepartamento) values ('Produção', 14);
insert into Departamento (nome, idDepartamento) values ('Administração', 15);
insert into Departamento (nome, idDepartamento) values ('Comunicação', 16);
insert into Departamento (nome, idDepartamento) values ('Sustentabilidade', 17);
insert into Departamento (nome, idDepartamento) values ('Desenvolvimento de Produto', 18);
insert into Departamento (nome, idDepartamento) values ('Treinamento e Desenvolvimento', 19);
insert into Departamento (nome, idDepartamento) values ('Relações Públicas', 20);
insert into Departamento (nome, idDepartamento) values ('Segurança do Trabalho', 21);
insert into Departamento (nome, idDepartamento) values ('Gestão de Projetos', 22);
insert into Departamento (nome, idDepartamento) values ('Compliance', 23);
insert into Departamento (nome, idDepartamento) values ('Gestão de Crises', 24);
insert into Departamento (nome, idDepartamento) values ('Análise de Dados', 25);
insert into Departamento (nome, idDepartamento) values ('Desenvolvimento Web', 26);
insert into Departamento (nome, idDepartamento) values ('Manutenção', 27);
insert into Departamento (nome, idDepartamento) values ('Vigilância Sanitária', 28);
insert into Departamento (nome, idDepartamento) values ('Importação e Exportação', 29);
insert into Departamento (nome, idDepartamento) values ('Inovação', 30);

Select * from Estado; #30 insert 
insert into Estado (nome, uf) values ('São Paulo','SP');
insert into Estado (nome, uf) values ('Rio de Janeiro','RJ');
insert into Estado (nome, uf) values ('Espirito Santo','ES');
insert into Estado (nome, uf) values ('Goiás','GO');
insert into Estado (nome, uf) values ('Rio Grande do Sul','RS');
insert into Estado (nome, uf) values ('Paraná','PR');
insert into Estado (nome, uf) values ('Santa Catarina','SC');
insert into Estado (nome, uf) values ('Minas Gerais','MG');
insert into Estado (nome, uf) values ('Bahia','BA');
insert into Estado (nome, uf) values ('Piaui','PI');
insert into Estado (nome, uf) values ('Acre','AC');
insert into Estado (nome, uf) values ('Ceará','CE');
insert into Estado (nome, uf) values ('Tocantins','TO');
insert into Estado (nome, uf) values ('Mato Grosso','MT');
insert into Estado (nome, uf) values ('Paraíba','PB');
insert into Estado (nome, uf) values ('Pernambuco','PE');
insert into Estado (nome, uf) values ('Alagoas','AL');
insert into Estado (nome, uf) values ('Roraima','RR');
insert into Estado (nome, uf) values ('Distrito Federal','DF');
insert into Estado (nome, uf) values ('Rio Grande do Norte','RN');
insert into Estado (nome, uf) values ('Sergipe','SE');
insert into Estado (nome, uf) values ('Mato Grosso do Sul','MS');
insert into Estado (nome, uf) values ('Pará','PA');
insert into Estado (nome, uf) values ('Amapá','AP');
insert into Estado (nome, uf) values ('Amazonas','AM');
insert into Estado (nome, uf) values ('Rondônia','RO');
insert into Estado (nome, uf) values ('Maranhão','MA');


Select * from TipoEndereco; #30insert
insert into TipoEndereco (nome, idTipoEndereco) values ('Residencial', 1);
insert into TipoEndereco (nome, idTipoEndereco) values ('Comercial', 2);
insert into TipoEndereco (nome, idTipoEndereco) values ('Industrial', 3);
insert into TipoEndereco (nome, idTipoEndereco) values ('Rural', 4);
insert into TipoEndereco (nome, idTipoEndereco) values ('Público', 5);
insert into TipoEndereco (nome, idTipoEndereco) values ('Temporário', 6);
insert into TipoEndereco (nome, idTipoEndereco) values ('Estacionamento', 7);
insert into TipoEndereco (nome, idTipoEndereco) values ('Filial', 8);
insert into TipoEndereco (nome, idTipoEndereco) values ('Central', 9);
insert into TipoEndereco (nome, idTipoEndereco) values ('Sede', 10);
insert into TipoEndereco (nome, idTipoEndereco) values ('Representação', 11);
insert into TipoEndereco (nome, idTipoEndereco) values ('Agência', 12);
insert into TipoEndereco (nome, idTipoEndereco) values ('Loja', 13);
insert into TipoEndereco (nome, idTipoEndereco) values ('Centro de Distribuição', 14);
insert into TipoEndereco (nome, idTipoEndereco) values ('Posto de Atendimento', 15);
insert into TipoEndereco (nome, idTipoEndereco) values ('Showroom', 16);
insert into TipoEndereco (nome, idTipoEndereco) values ('Estação', 17);
insert into TipoEndereco (nome, idTipoEndereco) values ('Ponto de Vendas', 18);
insert into TipoEndereco (nome, idTipoEndereco) values ('Oficina', 19);
insert into TipoEndereco (nome, idTipoEndereco) values ('Depósito', 20);
insert into TipoEndereco (nome, idTipoEndereco) values ('Comitê', 21);
insert into TipoEndereco (nome, idTipoEndereco) values ('Centro de Serviços', 22);
insert into TipoEndereco (nome, idTipoEndereco) values ('Consultoria', 23);
insert into TipoEndereco (nome, idTipoEndereco) values ('Salas de Aula', 24);
insert into TipoEndereco (nome, idTipoEndereco) values ('Estabelecimento', 25);
insert into TipoEndereco (nome, idTipoEndereco) values ('Café', 26);
insert into TipoEndereco (nome, idTipoEndereco) values ('Bar', 27);
insert into TipoEndereco (nome, idTipoEndereco) values ('Restaurante', 28);
insert into TipoEndereco (nome, idTipoEndereco) values ('Salão de Beleza', 29);
insert into TipoEndereco (nome, idTipoEndereco) values ('Clube', 30);

Select * from Cidade; #30 insert
insert into Cidade (nome, uf, idCidade) values ('São Paulo', 'SP', 1);
insert into Cidade (nome, uf, idCidade) values ('Rio de Janeiro', 'RJ', 2);
insert into Cidade (nome, uf, idCidade) values ('Belo Horizonte', 'MG', 3);
insert into Cidade (nome, uf, idCidade) values ('Curitiba', 'PR', 4);
insert into Cidade (nome, uf, idCidade) values ('Porto Alegre', 'RS', 5);
insert into Cidade (nome, uf, idCidade) values ('Salvador', 'BA', 6);
insert into Cidade (nome, uf, idCidade) values ('Fortaleza', 'CE', 7);
insert into Cidade (nome, uf, idCidade) values ('Brasília', 'DF', 8);
insert into Cidade (nome, uf, idCidade) values ('Manaus', 'AM', 9);
insert into Cidade (nome, uf, idCidade) values ('Recife', 'PE', 10);
insert into Cidade (nome, uf, idCidade) values ('Goiânia', 'GO', 11);
insert into Cidade (nome, uf, idCidade) values ('Teresina', 'PI', 12);
insert into Cidade (nome, uf, idCidade) values ('Maceió', 'AL', 13);
insert into Cidade (nome, uf, idCidade) values ('Natal', 'RN', 14);
insert into Cidade (nome, uf, idCidade) values ('Cuiabá', 'MT', 15);
insert into Cidade (nome, uf, idCidade) values ('João Pessoa', 'PB', 16);
insert into Cidade (nome, uf, idCidade) values ('Aracaju', 'SE', 17);
insert into Cidade (nome, uf, idCidade) values ('Florianópolis', 'SC', 18);
insert into Cidade (nome, uf, idCidade) values ('Campo Grande', 'MS', 19);
insert into Cidade (nome, uf, idCidade) values ('Palmas', 'TO', 20);
insert into Cidade (nome, uf, idCidade) values ('Rio Branco', 'AC', 21);
insert into Cidade (nome, uf, idCidade) values ('Macapá', 'AP', 22);
insert into Cidade (nome, uf, idCidade) values ('Boa Vista', 'RR', 23);
insert into Cidade (nome, uf, idCidade) values ('Porto Velho', 'RO', 24);
insert into Cidade (nome, uf, idCidade) values ('São Luís', 'MA', 25);
insert into Cidade (nome, uf, idCidade) values ('Belém', 'PA', 26);
insert into Cidade (nome, uf, idCidade) values ('Vitória', 'ES', 27);
insert into Cidade (nome, uf, idCidade) values ('Jaboatão dos Guararapes', 'PE', 28);
insert into Cidade (nome, uf, idCidade) values ('Santo André', 'SP', 29);
insert into Cidade (nome, uf, idCidade) values ('Osasco', 'SP', 30);


Select * from Bairro; #30 insert 
insert into Bairro (nome, idCidade, idBairro) values ('Centro', 1, 1);
insert into Bairro (nome, idCidade, idBairro) values ('Jardins', 1, 2);
insert into Bairro (nome, idCidade, idBairro) values ('Copacabana', 2, 3);
insert into Bairro (nome, idCidade, idBairro) values ('Botafogo', 2, 4);
insert into Bairro (nome, idCidade, idBairro) values ('Savassi', 3, 5);
insert into Bairro (nome, idCidade, idBairro) values ('Alto da XV', 4, 6);
insert into Bairro (nome, idCidade, idBairro) values ('Petrópolis', 5, 7);
insert into Bairro (nome, idCidade, idBairro) values ('Ipanema', 2, 8);
insert into Bairro (nome, idCidade, idBairro) values ('Bela Vista', 1, 9);
insert into Bairro (nome, idCidade, idBairro) values ('Lapa', 2, 10);
insert into Bairro (nome, idCidade, idBairro) values ('Jardim Botânico', 3, 11);
insert into Bairro (nome, idCidade, idBairro) values ('Recreio dos Bandeirantes', 2, 12);
insert into Bairro (nome, idCidade, idBairro) values ('Cidade Alta', 14, 13);
insert into Bairro (nome, idCidade, idBairro) values ('Gruta', 15, 14);
insert into Bairro (nome, idCidade, idBairro) values ('Setor Bueno', 11, 15);
insert into Bairro (nome, idCidade, idBairro) values ('Aflitos', 10, 16);
insert into Bairro (nome, idCidade, idBairro) values ('Tijuca', 2, 17);
insert into Bairro (nome, idCidade, idBairro) values ('Lagoa', 2, 18);
insert into Bairro (nome, idCidade, idBairro) values ('Morumbi', 1, 19);
insert into Bairro (nome, idCidade, idBairro) values ('Perdizes', 1, 20);
insert into Bairro (nome, idCidade, idBairro) values ('Pinheiros', 1, 21);
insert into Bairro (nome, idCidade, idBairro) values ('Vila Madalena', 1, 22);
insert into Bairro (nome, idCidade, idBairro) values ('Santa Teresa', 2, 23);
insert into Bairro (nome, idCidade, idBairro) values ('Barra da Tijuca', 2, 24);
insert into Bairro (nome, idCidade, idBairro) values ('Lagoa Santa', 3, 25);
insert into Bairro (nome, idCidade, idBairro) values ('São Francisco', 3, 26);
insert into Bairro (nome, idCidade, idBairro) values ('Praia do Canto', 27, 27);
insert into Bairro (nome, idCidade, idBairro) values ('Santa Lúcia', 27, 28);
insert into Bairro (nome, idCidade, idBairro) values ('Chácara Klabin', 1, 29);
insert into Bairro (nome, idCidade, idBairro) values ('Moema', 1, 30);


Select * from Endereco; #20 insert
insert into Endereco (nome, idEndereco, idBairro, idTipoEndereco, numero, cep) values ('Rua A', 1, 1, 1, '123', '01000-000');
insert into Endereco (nome, idEndereco, idBairro, idTipoEndereco, numero, cep) values ('Avenida B', 2, 2, 2, '456', '02000-000');
insert into Endereco (nome, idEndereco, idBairro, idTipoEndereco, numero, cep) values ('Praça C', 3, 3, 3, '789', '03000-000');
insert into Endereco (nome, idEndereco, idBairro, idTipoEndereco, numero, cep) values ('Rua D', 4, 4, 1, '101', '04000-000');
insert into Endereco (nome, idEndereco, idBairro, idTipoEndereco, numero, cep) values ('Avenida E', 5, 5, 2, '202', '05000-000');
insert into Endereco (nome, idEndereco, idBairro, idTipoEndereco, numero, cep) values ('Rua F', 6, 6, 3, '303', '06000-000');
insert into Endereco (nome, idEndereco, idBairro, idTipoEndereco, numero, cep) values ('Avenida G', 7, 7, 1, '404', '07000-000');
insert into Endereco (nome, idEndereco, idBairro, idTipoEndereco, numero, cep) values ('Praça H', 8, 8, 2, '505', '08000-000');
insert into Endereco (nome, idEndereco, idBairro, idTipoEndereco, numero, cep) values ('Rua I', 9, 9, 3, '606', '09000-000');
insert into Endereco (nome, idEndereco, idBairro, idTipoEndereco, numero, cep) values ('Avenida J', 10, 10, 1, '707', '10000-000');
insert into Endereco (nome, idEndereco, idBairro, idTipoEndereco, numero, cep) values ('Rua K', 11, 11, 2, '808', '11000-000');
insert into Endereco (nome, idEndereco, idBairro, idTipoEndereco, numero, cep) values ('Avenida L', 12, 12, 3, '909', '12000-000');
insert into Endereco (nome, idEndereco, idBairro, idTipoEndereco, numero, cep) values ('Rua M', 13, 13, 1, '111', '13000-000');
insert into Endereco (nome, idEndereco, idBairro, idTipoEndereco, numero, cep) values ('Avenida N', 14, 14, 2, '222', '14000-000');
insert into Endereco (nome, idEndereco, idBairro, idTipoEndereco, numero, cep) values ('Rua O', 15, 15, 3, '333', '15000-000');
insert into Endereco (nome, idEndereco, idBairro, idTipoEndereco, numero, cep) values ('Avenida P', 16, 16, 1, '444', '16000-000');
insert into Endereco (nome, idEndereco, idBairro, idTipoEndereco, numero, cep) values ('Rua Q', 17, 17, 2, '555', '17000-000');
insert into Endereco (nome, idEndereco, idBairro, idTipoEndereco, numero, cep) values ('Avenida R', 18, 18, 3, '666', '18000-000');
insert into Endereco (nome, idEndereco, idBairro, idTipoEndereco, numero, cep) values ('Rua S', 19, 19, 1, '777', '19000-000');
insert into Endereco (nome, idEndereco, idBairro, idTipoEndereco, numero, cep) values ('Avenida T', 20, 20, 2, '888', '20000-000');

Select * from Fornecedor; #30 insert
insert into Fornecedor (nomeFornecedor, idFornecedor, idEndereco) values ('Fornecedor A', 1, 1);
insert into Fornecedor (nomeFornecedor, idFornecedor, idEndereco) values ('Fornecedor B', 2, 2);
insert into Fornecedor (nomeFornecedor, idFornecedor, idEndereco) values ('Fornecedor C', 3, 3);
insert into Fornecedor (nomeFornecedor, idFornecedor, idEndereco) values ('Fornecedor D', 4, 4);
insert into Fornecedor (nomeFornecedor, idFornecedor, idEndereco) values ('Fornecedor E', 5, 5);
insert into Fornecedor (nomeFornecedor, idFornecedor, idEndereco) values ('Fornecedor F', 6, 6);
insert into Fornecedor (nomeFornecedor, idFornecedor, idEndereco) values ('Fornecedor G', 7, 7);
insert into Fornecedor (nomeFornecedor, idFornecedor, idEndereco) values ('Fornecedor H', 8, 8);
insert into Fornecedor (nomeFornecedor, idFornecedor, idEndereco) values ('Fornecedor I', 9, 9);
insert into Fornecedor (nomeFornecedor, idFornecedor, idEndereco) values ('Fornecedor J', 10, 10);
insert into Fornecedor (nomeFornecedor, idFornecedor, idEndereco) values ('Fornecedor K', 11, 11);
insert into Fornecedor (nomeFornecedor, idFornecedor, idEndereco) values ('Fornecedor L', 12, 12);
insert into Fornecedor (nomeFornecedor, idFornecedor, idEndereco) values ('Fornecedor M', 13, 13);
insert into Fornecedor (nomeFornecedor, idFornecedor, idEndereco) values ('Fornecedor N', 14, 14);
insert into Fornecedor (nomeFornecedor, idFornecedor, idEndereco) values ('Fornecedor O', 15, 15);
insert into Fornecedor (nomeFornecedor, idFornecedor, idEndereco) values ('Fornecedor P', 16, 16);
insert into Fornecedor (nomeFornecedor, idFornecedor, idEndereco) values ('Fornecedor Q', 17, 17);
insert into Fornecedor (nomeFornecedor, idFornecedor, idEndereco) values ('Fornecedor R', 18, 18);
insert into Fornecedor (nomeFornecedor, idFornecedor, idEndereco) values ('Fornecedor S', 19, 19);
insert into Fornecedor (nomeFornecedor, idFornecedor, idEndereco) values ('Fornecedor T', 20, 20);
insert into Fornecedor (nomeFornecedor, idFornecedor, idEndereco) values ('Fornecedor U', 21, 21);
insert into Fornecedor (nomeFornecedor, idFornecedor, idEndereco) values ('Fornecedor V', 22, 22);
insert into Fornecedor (nomeFornecedor, idFornecedor, idEndereco) values ('Fornecedor W', 23, 23);
insert into Fornecedor (nomeFornecedor, idFornecedor, idEndereco) values ('Fornecedor X', 24, 24);
insert into Fornecedor (nomeFornecedor, idFornecedor, idEndereco) values ('Fornecedor Y', 25, 25);
insert into Fornecedor (nomeFornecedor, idFornecedor, idEndereco) values ('Fornecedor Z', 26, 26);
insert into Fornecedor (nomeFornecedor, idFornecedor, idEndereco) values ('Fornecedor AA', 27, 27);
insert into Fornecedor (nomeFornecedor, idFornecedor, idEndereco) values ('Fornecedor AB', 28, 28);
insert into Fornecedor (nomeFornecedor, idFornecedor, idEndereco) values ('Fornecedor AC', 29, 29);
insert into Fornecedor (nomeFornecedor, idFornecedor, idEndereco) values ('Fornecedor AD', 30, 30);

Select * from Produto; #20 insert
insert into Produto (nome, idFornecedor, idProduto, idCategoria, quantidade, valorUnitario) values ('Produto A', 1, 1, 1, 100, 10.00);
insert into Produto (nome, idFornecedor, idProduto, idCategoria, quantidade, valorUnitario) values ('Produto B', 2, 2, 1, 200, 15.50);
insert into Produto (nome, idFornecedor, idProduto, idCategoria, quantidade, valorUnitario) values ('Produto C', 3, 3, 2, 150, 12.75);
insert into Produto (nome, idFornecedor, idProduto, idCategoria, quantidade, valorUnitario) values ('Produto D', 1, 4, 2, 120, 8.99);
insert into Produto (nome, idFornecedor, idProduto, idCategoria, quantidade, valorUnitario) values ('Produto E', 2, 5, 3, 80, 20.00);
insert into Produto (nome, idFornecedor, idProduto, idCategoria, quantidade, valorUnitario) values ('Produto F', 3, 6, 3, 90, 18.50);
insert into Produto (nome, idFornecedor, idProduto, idCategoria, quantidade, valorUnitario) values ('Produto G', 1, 7, 1, 60, 22.00);
insert into Produto (nome, idFornecedor, idProduto, idCategoria, quantidade, valorUnitario) values ('Produto H', 2, 8, 2, 50, 25.00);
insert into Produto (nome, idFornecedor, idProduto, idCategoria, quantidade, valorUnitario) values ('Produto I', 3, 9, 1, 40, 5.50);
insert into Produto (nome, idFornecedor, idProduto, idCategoria, quantidade, valorUnitario) values ('Produto J', 1, 10, 2, 30, 30.00);
insert into Produto (nome, idFornecedor, idProduto, idCategoria, quantidade, valorUnitario) values ('Produto K', 2, 11, 3, 20, 35.00);
insert into Produto (nome, idFornecedor, idProduto, idCategoria, quantidade, valorUnitario) values ('Produto L', 3, 12, 3, 10, 40.00);
insert into Produto (nome, idFornecedor, idProduto, idCategoria, quantidade, valorUnitario) values ('Produto M', 1, 13, 1, 25, 13.25);
insert into Produto (nome, idFornecedor, idProduto, idCategoria, quantidade, valorUnitario) values ('Produto N', 2, 14, 2, 15, 28.75);
insert into Produto (nome, idFornecedor, idProduto, idCategoria, quantidade, valorUnitario) values ('Produto O', 3, 15, 1, 5, 50.00);
insert into Produto (nome, idFornecedor, idProduto, idCategoria, quantidade, valorUnitario) values ('Produto P', 1, 16, 3, 35, 18.00);
insert into Produto (nome, idFornecedor, idProduto, idCategoria, quantidade, valorUnitario) values ('Produto Q', 2, 17, 1, 45, 14.50);
insert into Produto (nome, idFornecedor, idProduto, idCategoria, quantidade, valorUnitario) values ('Produto R', 3, 18, 2, 55, 23.75);
insert into Produto (nome, idFornecedor, idProduto, idCategoria, quantidade, valorUnitario) values ('Produto S', 1, 19, 1, 65, 11.99);
insert into Produto (nome, idFornecedor, idProduto, idCategoria, quantidade, valorUnitario) values ('Produto T', 2, 20, 2, 75, 19.99);

Select * from Cliente; #20 insert
insert into Cliente (nome, sexo, idade, idEndereco, idCliente) values ('Carlos Silva', 'M', 30, 1, 1);
insert into Cliente (nome, sexo, idade, idEndereco, idCliente) values ('Ana Oliveira', 'F', 25, 2, 2);
insert into Cliente (nome, sexo, idade, idEndereco, idCliente) values ('Marcos Pereira', 'M', 40, 3, 3);
insert into Cliente (nome, sexo, idade, idEndereco, idCliente) values ('Fernanda Souza', 'F', 28, 4, 4);
insert into Cliente (nome, sexo, idade, idEndereco, idCliente) values ('Luiz Santos', 'M', 35, 5, 5);
insert into Cliente (nome, sexo, idade, idEndereco, idCliente) values ('Juliana Lima', 'F', 32, 6, 6);
insert into Cliente (nome, sexo, idade, idEndereco, idCliente) values ('Roberto Costa', 'M', 29, 7, 7);
insert into Cliente (nome, sexo, idade, idEndereco, idCliente) values ('Patrícia Gomes', 'F', 27, 8, 8);
insert into Cliente (nome, sexo, idade, idEndereco, idCliente) values ('Rafael Mendes', 'M', 33, 9, 9);
insert into Cliente (nome, sexo, idade, idEndereco, idCliente) values ('Sofia Rocha', 'F', 24, 10, 10);
insert into Cliente (nome, sexo, idade, idEndereco, idCliente) values ('André Martins', 'M', 31, 11, 11);
insert into Cliente (nome, sexo, idade, idEndereco, idCliente) values ('Tatiane Alves', 'F', 22, 12, 12);
insert into Cliente (nome, sexo, idade, idEndereco, idCliente) values ('Eduardo Ferreira', 'M', 37, 13, 13);
insert into Cliente (nome, sexo, idade, idEndereco, idCliente) values ('Vanessa Cardoso', 'F', 26, 14, 14);
insert into Cliente (nome, sexo, idade, idEndereco, idCliente) values ('Gustavo Barros', 'M', 38, 15, 15);
insert into Cliente (nome, sexo, idade, idEndereco, idCliente) values ('Camila Nascimento', 'F', 29, 16, 16);
insert into Cliente (nome, sexo, idade, idEndereco, idCliente) values ('Thiago Dias', 'M', 34, 17, 17);
insert into Cliente (nome, sexo, idade, idEndereco, idCliente) values ('Renata Martins', 'F', 23, 18, 18);
insert into Cliente (nome, sexo, idade, idEndereco, idCliente) values ('Leonardo Lima', 'M', 39, 19, 19);
insert into Cliente (nome, sexo, idade, idEndereco, idCliente) values ('Bruna Ferreira', 'F', 20, 20, 20);

Select * from Funcionario; #20 insert
insert into Funcionario (nome, idade, sexo, idFuncionario, idSupervisor, idEndereco, salario, demissao, dataDemissao, dataContratacao) values ('Levi', 17, 'M', 1, NULL, 1, 1500.00, 'N', NULL, '2023-01-10');
insert into Funcionario (nome, idade, sexo, idFuncionario, idSupervisor, idEndereco, salario, demissao, dataDemissao, dataContratacao) values ('Heitor', 16, 'M', 2, NULL, 2, 1600.00, 'N', NULL, '2023-02-15');
insert into Funcionario (nome, idade, sexo, idFuncionario, idSupervisor, idEndereco, salario, demissao, dataDemissao, dataContratacao) values ('Kleber', 17, 'M', 3, NULL, 3, 1700.00, 'N', NULL, '2023-03-20');
insert into Funcionario (nome, idade, sexo, idFuncionario, idSupervisor, idEndereco, salario, demissao, dataDemissao, dataContratacao) values ('João', 18, 'M', 4, NULL, 4, 1800.00, 'N', NULL, '2023-04-25');
insert into Funcionario (nome, idade, sexo, idFuncionario, idSupervisor, idEndereco, salario, demissao, dataDemissao, dataContratacao) values ('Paulo', 19, 'M', 5, NULL, 5, 1900.00, 'N', NULL, '2023-05-30');
insert into Funcionario (nome, idade, sexo, idFuncionario, idSupervisor, idEndereco, salario, demissao, dataDemissao, dataContratacao) values ('Manuel', 20, 'M', 6, NULL, 6, 2000.00, 'N', NULL, '2023-06-10');
insert into Funcionario (nome, idade, sexo, idFuncionario, idSupervisor, idEndereco, salario, demissao, dataDemissao, dataContratacao) values ('Andrew', 21, 'M', 7, NULL, 7, 2100.00, 'N', NULL, '2023-07-15');
insert into Funcionario (nome, idade, sexo, idFuncionario, idSupervisor, idEndereco, salario, demissao, dataDemissao, dataContratacao) values ('Leonardo', 22, 'M', 8, NULL, 8, 2200.00, 'N', NULL, '2023-08-20');
insert into Funcionario (nome, idade, sexo, idFuncionario, idSupervisor, idEndereco, salario, demissao, dataDemissao, dataContratacao) values ('Pedro', 23, 'M', 9, NULL, 9, 2300.00, 'N', NULL, '2023-09-25');
insert into Funcionario (nome, idade, sexo, idFuncionario, idSupervisor, idEndereco, salario, demissao, dataDemissao, dataContratacao) values ('Davi', 24, 'M', 10, NULL, 10, 2400.00, 'N', NULL, '2023-10-30');
insert into Funcionario (nome, idade, sexo, idFuncionario, idSupervisor, idEndereco, salario, demissao, dataDemissao, dataContratacao) values ('Antônio', 25, 'M', 11, NULL, 11, 2500.00, 'N', NULL, '2023-11-05');
insert into Funcionario (nome, idade, sexo, idFuncionario, idSupervisor, idEndereco, salario, demissao, dataDemissao, dataContratacao) values ('Erico', 26, 'M', 12, NULL, 12, 2600.00, 'N', NULL, '2023-12-10');
insert into Funcionario (nome, idade, sexo, idFuncionario, idSupervisor, idEndereco, salario, demissao, dataDemissao, dataContratacao) values ('Vladimir', 27, 'M', 13, NULL, 13, 2700.00, 'N', NULL, '2023-01-15');
insert into Funcionario (nome, idade, sexo, idFuncionario, idSupervisor, idEndereco, salario, demissao, dataDemissao, dataContratacao) values ('Kelma', 28, 'F', 14, NULL, 14, 2800.00, 'N', NULL, '2023-02-20');
insert into Funcionario (nome, idade, sexo, idFuncionario, idSupervisor, idEndereco, salario, demissao, dataDemissao, dataContratacao) values ('Glaucia', 29, 'F', 15, NULL, 15, 2900.00, 'N', NULL, '2023-03-25');
insert into Funcionario (nome, idade, sexo, idFuncionario, idSupervisor, idEndereco, salario, demissao, dataDemissao, dataContratacao) values ('Altair', 30, 'M', 16, NULL, 16, 3000.00, 'N', NULL, '2023-04-30');
insert into Funcionario (nome, idade, sexo, idFuncionario, idSupervisor, idEndereco, salario, demissao, dataDemissao, dataContratacao) values ('Suzy', 31, 'F', 17, NULL, 17, 3100.00, 'N', NULL, '2023-05-05');
insert into Funcionario (nome, idade, sexo, idFuncionario, idSupervisor, idEndereco, salario, demissao, dataDemissao, dataContratacao) values ('Depay', 32, 'M', 18, NULL, 18, 3200.00, 'N', NULL, '2023-06-10');
insert into Funcionario (nome, idade, sexo, idFuncionario, idSupervisor, idEndereco, salario, demissao, dataDemissao, dataContratacao) values ('Gilberto', 33, 'M', 19, NULL, 19, 3300.00, 'N', NULL, '2023-07-15');
insert into Funcionario (nome, idade, sexo, idFuncionario, idSupervisor, idEndereco, salario, demissao, dataDemissao, dataContratacao) values ('Adailton', 34, 'M', 20, NULL, 20, 3400.00, 'N', NULL, '2023-08-20');

Select * from Compra; #20 insert
insert into Compra (idCliente, idCompra, idFuncionario, dataCompra, valorTotalCompra, finalizada, formaPagamento) values (1, 1, 1, '2023-10-01', 150.00, 'S', 'Cartão');
insert into Compra (idCliente, idCompra, idFuncionario, dataCompra, valorTotalCompra, finalizada, formaPagamento) values (2, 2, 2, '2023-10-02', 200.00, 'S', 'Dinheiro');
insert into Compra (idCliente, idCompra, idFuncionario, dataCompra, valorTotalCompra, finalizada, formaPagamento) values (3, 3, 3, '2023-10-03', 250.00, 'S', 'Cartão');
insert into Compra (idCliente, idCompra, idFuncionario, dataCompra, valorTotalCompra, finalizada, formaPagamento) values (4, 4, 4, '2023-10-04', 300.00, 'N', 'Dinheiro');
insert into Compra (idCliente, idCompra, idFuncionario, dataCompra, valorTotalCompra, finalizada, formaPagamento) values (5, 5, 5, '2023-10-05', 350.00, 'S', 'Cartão');
insert into Compra (idCliente, idCompra, idFuncionario, dataCompra, valorTotalCompra, finalizada, formaPagamento) values (6, 6, 6, '2023-10-06', 400.00, 'S', 'Dinheiro');
insert into Compra (idCliente, idCompra, idFuncionario, dataCompra, valorTotalCompra, finalizada, formaPagamento) values (7, 7, 7, '2023-10-07', 450.00, 'N', 'Cartão');
insert into Compra (idCliente, idCompra, idFuncionario, dataCompra, valorTotalCompra, finalizada, formaPagamento) values (8, 8, 8, '2023-10-08', 500.00, 'S', 'Dinheiro');
insert into Compra (idCliente, idCompra, idFuncionario, dataCompra, valorTotalCompra, finalizada, formaPagamento) values (9, 9, 9, '2023-10-09', 550.00, 'N', 'Cartão');
insert into Compra (idCliente, idCompra, idFuncionario, dataCompra, valorTotalCompra, finalizada, formaPagamento) values (10, 10, 10, '2023-10-10', 600.00, 'S', 'Dinheiro');
insert into Compra (idCliente, idCompra, idFuncionario, dataCompra, valorTotalCompra, finalizada, formaPagamento) values (11, 11, 11, '2023-10-11', 650.00, 'S', 'Cartão');
insert into Compra (idCliente, idCompra, idFuncionario, dataCompra, valorTotalCompra, finalizada, formaPagamento) values (12, 12, 12, '2023-10-12', 700.00, 'N', 'Dinheiro');
insert into Compra (idCliente, idCompra, idFuncionario, dataCompra, valorTotalCompra, finalizada, formaPagamento) values (13, 13, 13, '2023-10-13', 750.00, 'S', 'Cartão');
insert into Compra (idCliente, idCompra, idFuncionario, dataCompra, valorTotalCompra, finalizada, formaPagamento) values (14, 14, 14, '2023-10-14', 800.00, 'S', 'Dinheiro');
insert into Compra (idCliente, idCompra, idFuncionario, dataCompra, valorTotalCompra, finalizada, formaPagamento) values (15, 15, 15, '2023-10-15', 850.00, 'N', 'Cartão');
insert into Compra (idCliente, idCompra, idFuncionario, dataCompra, valorTotalCompra, finalizada, formaPagamento) values (16, 16, 16, '2023-10-16', 900.00, 'S', 'Dinheiro');
insert into Compra (idCliente, idCompra, idFuncionario, dataCompra, valorTotalCompra, finalizada, formaPagamento) values (17, 17, 17, '2023-10-17', 950.00, 'N', 'Cartão');
insert into Compra (idCliente, idCompra, idFuncionario, dataCompra, valorTotalCompra, finalizada, formaPagamento) values (18, 18, 18, '2023-10-18', 1000.00, 'S', 'Dinheiro');
insert into Compra (idCliente, idCompra, idFuncionario, dataCompra, valorTotalCompra, finalizada, formaPagamento) values (19, 19, 19, '2023-10-19', 1050.00, 'N', 'Cartão');
insert into Compra (idCliente, idCompra, idFuncionario, dataCompra, valorTotalCompra, finalizada, formaPagamento) values (20, 20, 20, '2023-10-20', 1100.00, 'S', 'Dinheiro');


Select * from itemCompra; #20 insert
insert into itemCompra (idCompra, idProduto, quantidade, valorTotal) values (1, 1, 2, 300.00);
insert into itemCompra (idCompra, idProduto, quantidade, valorTotal) values (1, 2, 1, 150.00);
insert into itemCompra (idCompra, idProduto, quantidade, valorTotal) values (2, 1, 3, 450.00);
insert into itemCompra (idCompra, idProduto, quantidade, valorTotal) values (3, 3, 5, 1250.00);
insert into itemCompra (idCompra, idProduto, quantidade, valorTotal) values (4, 4, 2, 600.00);
insert into itemCompra (idCompra, idProduto, quantidade, valorTotal) values (5, 5, 4, 1400.00);
insert into itemCompra (idCompra, idProduto, quantidade, valorTotal) values (6, 6, 1, 400.00);
insert into itemCompra (idCompra, idProduto, quantidade, valorTotal) values (7, 7, 3, 1350.00);
insert into itemCompra (idCompra, idProduto, quantidade, valorTotal) values (8, 8, 2, 1000.00);
insert into itemCompra (idCompra, idProduto, quantidade, valorTotal) values (9, 9, 5, 2750.00);
insert into itemCompra (idCompra, idProduto, quantidade, valorTotal) values (10, 10, 2, 1200.00);
insert into itemCompra (idCompra, idProduto, quantidade, valorTotal) values (11, 11, 3, 1950.00);
insert into itemCompra (idCompra, idProduto, quantidade, valorTotal) values (12, 12, 4, 2400.00);
insert into itemCompra (idCompra, idProduto, quantidade, valorTotal) values (13, 13, 1, 750.00);
insert into itemCompra (idCompra, idProduto, quantidade, valorTotal) values (14, 14, 2, 1600.00);
insert into itemCompra (idCompra, idProduto, quantidade, valorTotal) values (15, 15, 3, 2550.00);
insert into itemCompra (idCompra, idProduto, quantidade, valorTotal) values (16, 16, 1, 900.00);
insert into itemCompra (idCompra, idProduto, quantidade, valorTotal) values (17, 17, 2, 1900.00);
insert into itemCompra (idCompra, idProduto, quantidade, valorTotal) values (18, 18, 4, 4000.00);
insert into itemCompra (idCompra, idProduto, quantidade, valorTotal) values (19, 19, 1, 1050.00);
insert into itemCompra (idCompra, idProduto, quantidade, valorTotal) values (20, 20, 3, 3300.00);

Select * from Telefone; #30 insert
insert into Telefone (idCliente, idFuncionario, numeroTelefone) values (1, 1, '123456789');
insert into Telefone (idCliente, idFuncionario, numeroTelefone) values (2, 2, '987654321');
insert into Telefone (idCliente, idFuncionario, numeroTelefone) values (3, 3, '555123456');
insert into Telefone (idCliente, idFuncionario, numeroTelefone) values (4, 4, '444123456');
insert into Telefone (idCliente, idFuncionario, numeroTelefone) values (5, 5, '333123456');
insert into Telefone (idCliente, idFuncionario, numeroTelefone) values (6, 6, '222123456');
insert into Telefone (idCliente, idFuncionario, numeroTelefone) values (7, 7, '111123456');
insert into Telefone (idCliente, idFuncionario, numeroTelefone) values (8, 8, '666123456');
insert into Telefone (idCliente, idFuncionario, numeroTelefone) values (9, 9, '777123456');
insert into Telefone (idCliente, idFuncionario, numeroTelefone) values (10, 10, '888123456');
insert into Telefone (idCliente, idFuncionario, numeroTelefone) values (11, 11, '999123456');
insert into Telefone (idCliente, idFuncionario, numeroTelefone) values (12, 12, '000123456');
insert into Telefone (idCliente, idFuncionario, numeroTelefone) values (13, 13, '321654987');
insert into Telefone (idCliente, idFuncionario, numeroTelefone) values (14, 14, '654321789');
insert into Telefone (idCliente, idFuncionario, numeroTelefone) values (15, 15, '543216789');
insert into Telefone (idCliente, idFuncionario, numeroTelefone) values (16, 16, '432156789');
insert into Telefone (idCliente, idFuncionario, numeroTelefone) values (17, 17, '321987654');
insert into Telefone (idCliente, idFuncionario, numeroTelefone) values (18, 18, '987321654');
insert into Telefone (idCliente, idFuncionario, numeroTelefone) values (19, 19, '654123789');
insert into Telefone (idCliente, idFuncionario, numeroTelefone) values (20, 20, '789654321');

Select * from Dependente; #20 insert
insert into Dependente (nome, parentesco, sexo, idade, idDependente, idFuncionario) values ('Greice', 'Filha', 'F', 10, 1, 1);
insert into Dependente (nome, parentesco, sexo, idade, idDependente, idFuncionario) values ('Gleice', 'Filha', 'F', 8, 2, 2);
insert into Dependente (nome, parentesco, sexo, idade, idDependente, idFuncionario) values ('André', 'Filho', 'M', 12, 3, 3);
insert into Dependente (nome, parentesco, sexo, idade, idDependente, idFuncionario) values ('Yuri', 'Filho', 'M', 6, 4, 4);
insert into Dependente (nome, parentesco, sexo, idade, idDependente, idFuncionario) values ('Rodrigo', 'Filho', 'M', 15, 5, 5);
insert into Dependente (nome, parentesco, sexo, idade, idDependente, idFuncionario) values ('Gabriel', 'Filho', 'M', 9, 6, 6);
insert into Dependente (nome, parentesco, sexo, idade, idDependente, idFuncionario) values ('Marcos', 'Filho', 'M', 14, 7, 7);
insert into Dependente (nome, parentesco, sexo, idade, idDependente, idFuncionario) values ('Arthur', 'Filho', 'M', 11, 8, 8);
insert into Dependente (nome, parentesco, sexo, idade, idDependente, idFuncionario) values ('Evellyn', 'Filha', 'F', 5, 9, 9);
insert into Dependente (nome, parentesco, sexo, idade, idDependente, idFuncionario) values ('Claudionor', 'Filho', 'M', 13, 10, 10);
insert into Dependente (nome, parentesco, sexo, idade, idDependente, idFuncionario) values ('Leticia', 'Filha', 'F', 4, 11, 11);
insert into Dependente (nome, parentesco, sexo, idade, idDependente, idFuncionario) values ('Luana', 'Filha', 'F', 3, 12, 12);
insert into Dependente (nome, parentesco, sexo, idade, idDependente, idFuncionario) values ('Sofia', 'Filha', 'F', 2, 13, 13);
insert into Dependente (nome, parentesco, sexo, idade, idDependente, idFuncionario) values ('Rogério', 'Filho', 'M', 1, 14, 14);
insert into Dependente (nome, parentesco, sexo, idade, idDependente, idFuncionario) values ('Renata', 'Filha', 'F', 7, 15, 15);
insert into Dependente (nome, parentesco, sexo, idade, idDependente, idFuncionario) values ('Evandro', 'Filho', 'M', 17, 16, 16);
insert into Dependente (nome, parentesco, sexo, idade, idDependente, idFuncionario) values ('Alex', 'Filho', 'M', 16, 17, 17);
insert into Dependente (nome, parentesco, sexo, idade, idDependente, idFuncionario) values ('Felipe', 'Filho', 'M', 19, 18, 18);
insert into Dependente (nome, parentesco, sexo, idade, idDependente, idFuncionario) values ('Igor', 'Filho', 'M', 18, 19, 19);
insert into Dependente (nome, parentesco, sexo, idade, idDependente, idFuncionario) values ('Roberto', 'Filho', 'M', 20, 20, 20);

Select * from DeptFunc; #20 insert
insert into DeptFunc (idFuncionario, idDeptFunc, idDepartamento, dataEntradaDept, dataSaidaDept) values (1, 1, 1, '2023-01-01', NULL);
insert into DeptFunc (idFuncionario, idDeptFunc, idDepartamento, dataEntradaDept, dataSaidaDept) values (2, 2, 1, '2023-02-01', NULL);
insert into DeptFunc (idFuncionario, idDeptFunc, idDepartamento, dataEntradaDept, dataSaidaDept) values (3, 3, 2, '2023-03-01', NULL);
insert into DeptFunc (idFuncionario, idDeptFunc, idDepartamento, dataEntradaDept, dataSaidaDept) values (4, 4, 2, '2023-04-01', NULL);
insert into DeptFunc (idFuncionario, idDeptFunc, idDepartamento, dataEntradaDept, dataSaidaDept) values (5, 5, 3, '2023-05-01', NULL);
insert into DeptFunc (idFuncionario, idDeptFunc, idDepartamento, dataEntradaDept, dataSaidaDept) values (6, 6, 3, '2023-06-01', NULL);
insert into DeptFunc (idFuncionario, idDeptFunc, idDepartamento, dataEntradaDept, dataSaidaDept) values (7, 7, 4, '2023-07-01', NULL);
insert into DeptFunc (idFuncionario, idDeptFunc, idDepartamento, dataEntradaDept, dataSaidaDept) values (8, 8, 4, '2023-08-01', NULL);
insert into DeptFunc (idFuncionario, idDeptFunc, idDepartamento, dataEntradaDept, dataSaidaDept) values (9, 9, 5, '2023-09-01', NULL);
insert into DeptFunc (idFuncionario, idDeptFunc, idDepartamento, dataEntradaDept, dataSaidaDept) values (10, 10, 5, '2023-10-01', NULL);
insert into DeptFunc (idFuncionario, idDeptFunc, idDepartamento, dataEntradaDept, dataSaidaDept) values (11, 11, 6, '2023-11-01', NULL);
insert into DeptFunc (idFuncionario, idDeptFunc, idDepartamento, dataEntradaDept, dataSaidaDept) values (12, 12, 6, '2023-12-01', NULL);
insert into DeptFunc (idFuncionario, idDeptFunc, idDepartamento, dataEntradaDept, dataSaidaDept) values (13, 13, 7, '2023-01-02', NULL);
insert into DeptFunc (idFuncionario, idDeptFunc, idDepartamento, dataEntradaDept, dataSaidaDept) values (14, 14, 7, '2023-02-02', NULL);
insert into DeptFunc (idFuncionario, idDeptFunc, idDepartamento, dataEntradaDept, dataSaidaDept) values (15, 15, 8, '2023-03-02', NULL);
insert into DeptFunc (idFuncionario, idDeptFunc, idDepartamento, dataEntradaDept, dataSaidaDept) values (16, 16, 8, '2023-04-02', NULL);
insert into DeptFunc (idFuncionario, idDeptFunc, idDepartamento, dataEntradaDept, dataSaidaDept) values (17, 17, 9, '2023-05-02', NULL);
insert into DeptFunc (idFuncionario, idDeptFunc, idDepartamento, dataEntradaDept, dataSaidaDept) values (18, 18, 9, '2023-06-02', NULL);
insert into DeptFunc (idFuncionario, idDeptFunc, idDepartamento, dataEntradaDept, dataSaidaDept) values (19, 19, 10, '2023-07-02', NULL);
insert into DeptFunc (idFuncionario, idDeptFunc, idDepartamento, dataEntradaDept, dataSaidaDept) values (20, 20, 10, '2023-08-02', NULL);

