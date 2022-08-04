-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 04-Ago-2022 às 14:44
-- Versão do servidor: 10.4.24-MariaDB
-- versão do PHP: 7.1.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `biblioteca`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `emprestimos`
--

CREATE TABLE `emprestimos` (
  `Id` int(11) NOT NULL,
  `DataEmprestimo` datetime(6) NOT NULL,
  `DataDevolucao` datetime(6) NOT NULL,
  `NomeUsuario` longtext DEFAULT NULL,
  `Telefone` longtext DEFAULT NULL,
  `Devolvido` tinyint(1) NOT NULL,
  `LivroId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `emprestimos`
--

INSERT INTO `emprestimos` (`Id`, `DataEmprestimo`, `DataDevolucao`, `NomeUsuario`, `Telefone`, `Devolvido`, `LivroId`) VALUES
(9, '2022-08-15 00:00:00.000000', '2022-08-17 00:00:00.000000', 'Gabriel', '2222', 0, 11),
(10, '2022-08-10 00:00:00.000000', '2022-08-13 00:00:00.000000', 'Daniel', '3333', 0, 12),
(15, '2022-08-01 00:00:00.000000', '2022-08-02 00:00:00.000000', 'Tiago', '121212', 1, 13),
(16, '2022-08-12 00:00:00.000000', '2022-08-16 00:00:00.000000', 'Ricardo', '123123', 0, 14),
(17, '2022-08-13 00:00:00.000000', '2022-08-14 00:00:00.000000', 'Leonardo', '12312', 0, 15),
(18, '2022-07-31 00:00:00.000000', '2022-08-02 00:00:00.000000', 'Mauro', '1223', 0, 16),
(19, '2022-08-04 00:00:00.000000', '2022-08-12 00:00:00.000000', 'Maria', '123', 0, 17),
(20, '2022-08-05 00:00:00.000000', '2022-08-09 00:00:00.000000', 'Tania', '12231', 0, 18),
(21, '2022-08-05 00:00:00.000000', '2022-08-19 00:00:00.000000', 'Roberto', '121', 0, 19),
(22, '2022-08-26 00:00:00.000000', '2022-08-28 00:00:00.000000', 'Lucas', '12312', 0, 20),
(23, '2022-08-01 00:00:00.000000', '2022-08-03 00:00:00.000000', 'Paulo', '12312', 0, 21);

-- --------------------------------------------------------

--
-- Estrutura da tabela `livros`
--

CREATE TABLE `livros` (
  `Id` int(11) NOT NULL,
  `Titulo` longtext DEFAULT NULL,
  `Autor` longtext DEFAULT NULL,
  `Ano` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `livros`
--

INSERT INTO `livros` (`Id`, `Titulo`, `Autor`, `Ano`) VALUES
(11, '20 mil léguas submarinas', 'Julio Verne', 1900),
(12, 'Planeta dos Macacos', 'Pierre Boulle', 1963),
(13, 'Assassinato no Expresso Oriente', 'Agatha Christie', 1934),
(14, 'Viagem ao Centro da Terra', 'Julio Verne', 1864),
(15, 'As Viagens de Gulliver', 'Jonathan Swift', 1726),
(16, 'Morte no Nilo', 'Agatha Christie', 1937),
(17, 'A Volta ao Mundo em 80 Dias', 'Júlio Verne', 1873),
(18, 'Fahrenheit 451', 'Ray Bradbury', 1953),
(19, 'Perdido em Marte', 'Andy Weir', 2011),
(20, 'A Ilha Misteriosa', 'Júlio Verne', 1875),
(21, 'Atribulações de um Chinês na China', 'Júlio Verne', 1879),
(22, 'Unicecular', 'José Lins', 2020);

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `login` varchar(30) DEFAULT NULL,
  `senha` varchar(50) DEFAULT NULL,
  `privilegio` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `usuarios`
--

INSERT INTO `usuarios` (`id`, `login`, `senha`, `privilegio`) VALUES
(1, 'admin', '202cb962ac59075b964b07152d234b70', 'adm'),
(5, 'teste', '7815696ecbf1c96e6894b779456d330e', 'fun');

-- --------------------------------------------------------

--
-- Estrutura da tabela `__efmigrationshistory`
--

CREATE TABLE `__efmigrationshistory` (
  `MigrationId` varchar(95) NOT NULL,
  `ProductVersion` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `__efmigrationshistory`
--

INSERT INTO `__efmigrationshistory` (`MigrationId`, `ProductVersion`) VALUES
('20220726151839_CreateDatabase', '3.0.0');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `emprestimos`
--
ALTER TABLE `emprestimos`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IX_Emprestimos_LivroId` (`LivroId`);

--
-- Índices para tabela `livros`
--
ALTER TABLE `livros`
  ADD PRIMARY KEY (`Id`);

--
-- Índices para tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `__efmigrationshistory`
--
ALTER TABLE `__efmigrationshistory`
  ADD PRIMARY KEY (`MigrationId`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `emprestimos`
--
ALTER TABLE `emprestimos`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de tabela `livros`
--
ALTER TABLE `livros`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `emprestimos`
--
ALTER TABLE `emprestimos`
  ADD CONSTRAINT `FK_Emprestimos_Livros_LivroId` FOREIGN KEY (`LivroId`) REFERENCES `livros` (`Id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
