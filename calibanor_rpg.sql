-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 21/10/2024 às 03:00
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `calibanor_rpg`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `armadura`
--

CREATE TABLE `armadura` (
  `id` int(11) NOT NULL,
  `id_tipo_armadura` int(11) NOT NULL,
  `titulo` varchar(50) NOT NULL,
  `descricao` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `armadura`
--

INSERT INTO `armadura` (`id`, `id_tipo_armadura`, `titulo`, `descricao`) VALUES
(1, 1, 'Armadura de Placas', 'Armadura pesada para proteção máxima'),
(2, 2, 'Armadura Leve', 'Armadura feita para mobilidade');

-- --------------------------------------------------------

--
-- Estrutura para tabela `classe`
--

CREATE TABLE `classe` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `descricao` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `classe`
--

INSERT INTO `classe` (`id`, `nome`, `descricao`) VALUES
(1, 'Mago', 'Classe especializada em magia'),
(2, 'Guerreiro', 'Classe especializada em combate corpo a corpo');

-- --------------------------------------------------------

--
-- Estrutura para tabela `clima`
--

CREATE TABLE `clima` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `descricao` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `clima`
--

INSERT INTO `clima` (`id`, `nome`, `descricao`) VALUES
(1, 'Ensolarado', 'Dia claro e ensolarado'),
(2, 'Chuvoso', 'Tempo com chuvas intensas');

-- --------------------------------------------------------

--
-- Estrutura para tabela `conta`
--

CREATE TABLE `conta` (
  `id` int(11) NOT NULL,
  `senha` varchar(256) NOT NULL,
  `email` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `conta`
--

INSERT INTO `conta` (`id`, `senha`, `email`) VALUES
(1, 'senha123', 'user1@example.com'),
(2, 'senha456', 'user2@example.com');

-- --------------------------------------------------------

--
-- Estrutura para tabela `efeito`
--

CREATE TABLE `efeito` (
  `id` int(11) NOT NULL,
  `titulo` varchar(50) NOT NULL,
  `descricao` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `efeito`
--

INSERT INTO `efeito` (`id`, `titulo`, `descricao`) VALUES
(1, 'Regeneração', 'Recupera pontos de vida ao longo do tempo'),
(2, 'Envenenamento', 'Causa dano contínuo ao alvo devido a veneno'),
(3, 'Queimadura', 'Causa dano contínuo ao alvo devido a queimaduras');

-- --------------------------------------------------------

--
-- Estrutura para tabela `elemento`
--

CREATE TABLE `elemento` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `descricao` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `elemento`
--

INSERT INTO `elemento` (`id`, `nome`, `descricao`) VALUES
(1, 'Fogo', 'Elemento de fogo'),
(2, 'Água', 'Elemento de água');

-- --------------------------------------------------------

--
-- Estrutura para tabela `guilda`
--

CREATE TABLE `guilda` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `descricao` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `guilda`
--

INSERT INTO `guilda` (`id`, `nome`, `descricao`) VALUES
(1, 'Guilda dos Magos', 'Uma guilda voltada para magos poderosos'),
(2, 'Guilda dos Guerreiros', 'Os guerreiros mais fortes do reino');

-- --------------------------------------------------------

--
-- Estrutura para tabela `habilidades`
--

CREATE TABLE `habilidades` (
  `id` int(11) NOT NULL,
  `titulo` varchar(50) NOT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `dano` int(11) NOT NULL,
  `id_efeito` int(11) DEFAULT NULL,
  `id_elemento` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `habilidades`
--

INSERT INTO `habilidades` (`id`, `titulo`, `descricao`, `dano`, `id_efeito`, `id_elemento`) VALUES
(3, 'Bola de Fogo', 'Dispara uma bola de fogo', 100, 3, 1),
(4, 'Cura Rápida', 'Recupera pontos de vida', 0, 1, 2);

-- --------------------------------------------------------

--
-- Estrutura para tabela `inventario`
--

CREATE TABLE `inventario` (
  `id` int(11) NOT NULL,
  `id_armor` int(11) DEFAULT NULL,
  `id_weapon` int(11) DEFAULT NULL,
  `tipo` varchar(50) DEFAULT NULL,
  `dinheiro` decimal(7,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `inventario`
--

INSERT INTO `inventario` (`id`, `id_armor`, `id_weapon`, `tipo`, `dinheiro`) VALUES
(1, 1, 1, 'Personagem', 100.00),
(2, 2, 2, 'Personagem', 150.00),
(3, 1, 2, 'Monstro', 150.00),
(4, 1, 2, 'Monstro', 100.00),
(5, 2, 2, 'NPC', 500.00),
(6, 2, 2, 'NPC', 1000.00);

-- --------------------------------------------------------

--
-- Estrutura para tabela `localizacao`
--

CREATE TABLE `localizacao` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `id_mundo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `localizacao`
--

INSERT INTO `localizacao` (`id`, `nome`, `descricao`, `id_mundo`) VALUES
(1, 'Floresta Sombria', 'Uma floresta cheia de perigos', 1),
(2, 'Valhala', 'O salão dos guerreiros', 2);

-- --------------------------------------------------------

--
-- Estrutura para tabela `localizacao_atual`
--

CREATE TABLE `localizacao_atual` (
  `id` int(11) NOT NULL,
  `id_local` int(11) NOT NULL,
  `coordenadas_x` int(11) DEFAULT NULL,
  `coordenadas_y` int(11) DEFAULT NULL,
  `id_clima` int(11) NOT NULL,
  `id_tempo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `localizacao_atual`
--

INSERT INTO `localizacao_atual` (`id`, `id_local`, `coordenadas_x`, `coordenadas_y`, `id_clima`, `id_tempo`) VALUES
(1, 1, 100, 200, 1, 1),
(2, 2, 300, 400, 2, 2);

-- --------------------------------------------------------

--
-- Estrutura para tabela `monstro`
--

CREATE TABLE `monstro` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `id_localizacao` int(11) NOT NULL,
  `id_inventario` int(11) NOT NULL,
  `hp` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `monstro`
--

INSERT INTO `monstro` (`id`, `nome`, `descricao`, `id_localizacao`, `id_inventario`, `hp`) VALUES
(1, 'Dragão', 'Um dragão feroz e perigoso', 1, 3, 1500),
(2, 'Troll', 'Uma criatura gigantesca e bruta', 2, 4, 150);

-- --------------------------------------------------------

--
-- Estrutura para tabela `mundo`
--

CREATE TABLE `mundo` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `descricao` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `mundo`
--

INSERT INTO `mundo` (`id`, `nome`, `descricao`) VALUES
(1, 'Terra Média', 'Um vasto mundo cheio de aventuras'),
(2, 'Asgard', 'O reino dos deuses nórdicos');

-- --------------------------------------------------------

--
-- Estrutura para tabela `npc`
--

CREATE TABLE `npc` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `id_localizacao` int(11) NOT NULL,
  `id_tipo_npc` int(11) NOT NULL,
  `id_inventario` int(11) NOT NULL,
  `hp` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `npc`
--

INSERT INTO `npc` (`id`, `nome`, `descricao`, `id_localizacao`, `id_tipo_npc`, `id_inventario`, `hp`) VALUES
(1, 'Zoltan', 'Ferreiro anão especialista', 1, 1, 5, 100),
(2, 'Merlin', 'Mago lendário', 2, 2, 6, 100);

-- --------------------------------------------------------

--
-- Estrutura para tabela `personagem`
--

CREATE TABLE `personagem` (
  `id` int(11) NOT NULL,
  `nickname` varchar(50) NOT NULL,
  `mortes` int(11) DEFAULT NULL,
  `habilidades` int(11) NOT NULL,
  `id_guilda` int(11) DEFAULT NULL,
  `id_classe` int(11) NOT NULL,
  `id_raca` int(11) NOT NULL,
  `id_inventario` int(11) NOT NULL,
  `id_localizacao_atual` int(11) NOT NULL,
  `hp` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `personagem`
--

INSERT INTO `personagem` (`id`, `nickname`, `mortes`, `habilidades`, `id_guilda`, `id_classe`, `id_raca`, `id_inventario`, `id_localizacao_atual`, `hp`) VALUES
(1, 'Gandalf', 5, 3, 1, 1, 2, 1, 1, 300),
(2, 'Aragorn', 10, 5, 2, 2, 1, 2, 2, 200);

-- --------------------------------------------------------

--
-- Estrutura para tabela `pet`
--

CREATE TABLE `pet` (
  `id` int(11) NOT NULL,
  `titulo` varchar(50) NOT NULL,
  `descricao` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `pet`
--

INSERT INTO `pet` (`id`, `titulo`, `descricao`) VALUES
(1, 'Lobo', 'Um lobo fiel e rápido'),
(2, 'Fênix', 'Uma fênix renascida das cinzas');

-- --------------------------------------------------------

--
-- Estrutura para tabela `quest`
--

CREATE TABLE `quest` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `id_localizacao` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `quest`
--

INSERT INTO `quest` (`id`, `nome`, `descricao`, `id_localizacao`) VALUES
(1, 'Missão do Dragão', 'Derrote o dragão que ameaça a cidade', 1),
(2, 'Resgate da Princesa', 'Resgate a princesa da masmorra', 2);

-- --------------------------------------------------------

--
-- Estrutura para tabela `raca`
--

CREATE TABLE `raca` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `descricao` varchar(255) NOT NULL,
  `idioma` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `raca`
--

INSERT INTO `raca` (`id`, `nome`, `descricao`, `idioma`) VALUES
(1, 'Humano', 'Uma raça versátil', 'Comum'),
(2, 'Elfo', 'Rápido e ágil', 'Élfico');

-- --------------------------------------------------------

--
-- Estrutura para tabela `recompensa`
--

CREATE TABLE `recompensa` (
  `id` int(11) NOT NULL,
  `id_quest` int(11) NOT NULL,
  `dinheiro` decimal(7,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `recompensa`
--

INSERT INTO `recompensa` (`id`, `id_quest`, `dinheiro`) VALUES
(1, 1, 500.00),
(2, 2, 1000.00);

-- --------------------------------------------------------

--
-- Estrutura para tabela `relacao_pet`
--

CREATE TABLE `relacao_pet` (
  `id` int(11) NOT NULL,
  `id_personagem` int(11) NOT NULL,
  `id_pet` int(11) NOT NULL,
  `nivel_amizade` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `relacao_pet`
--

INSERT INTO `relacao_pet` (`id`, `id_personagem`, `id_pet`, `nivel_amizade`) VALUES
(1, 1, 1, 50),
(2, 2, 2, 100);

-- --------------------------------------------------------

--
-- Estrutura para tabela `tempo`
--

CREATE TABLE `tempo` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `descricao` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tempo`
--

INSERT INTO `tempo` (`id`, `nome`, `descricao`) VALUES
(1, 'Dia', 'Período diurno'),
(2, 'Noite', 'Período noturno');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tipo_armadura`
--

CREATE TABLE `tipo_armadura` (
  `id` int(11) NOT NULL,
  `titulo` varchar(50) NOT NULL,
  `descricao` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tipo_armadura`
--

INSERT INTO `tipo_armadura` (`id`, `titulo`, `descricao`) VALUES
(1, 'Pesada', 'Armadura pesada para maior defesa'),
(2, 'Leve', 'Armadura leve para maior agilidade');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tipo_npc`
--

CREATE TABLE `tipo_npc` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `descricao` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tipo_npc`
--

INSERT INTO `tipo_npc` (`id`, `nome`, `descricao`) VALUES
(1, 'Ferreiro', 'Especialista em forjar armas'),
(2, 'Mago', 'Dominador das artes mágicas');

-- --------------------------------------------------------

--
-- Estrutura para tabela `weapon`
--

CREATE TABLE `weapon` (
  `id` int(11) NOT NULL,
  `titulo` varchar(50) NOT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `dano` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `weapon`
--

INSERT INTO `weapon` (`id`, `titulo`, `descricao`, `dano`) VALUES
(1, 'Espada Longa', 'Uma espada longa feita de aço', 50),
(2, 'Cajado Mágico', 'Cajado encantado com poderes mágicos', 30);

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `armadura`
--
ALTER TABLE `armadura`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_tipo_armor` (`id_tipo_armadura`);

--
-- Índices de tabela `classe`
--
ALTER TABLE `classe`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `clima`
--
ALTER TABLE `clima`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `conta`
--
ALTER TABLE `conta`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Índices de tabela `efeito`
--
ALTER TABLE `efeito`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `elemento`
--
ALTER TABLE `elemento`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `guilda`
--
ALTER TABLE `guilda`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `habilidades`
--
ALTER TABLE `habilidades`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_elemento` (`id_elemento`),
  ADD KEY `habilidades_ibfk_2` (`id_efeito`);

--
-- Índices de tabela `inventario`
--
ALTER TABLE `inventario`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_armor` (`id_armor`),
  ADD KEY `id_weapon` (`id_weapon`);

--
-- Índices de tabela `localizacao`
--
ALTER TABLE `localizacao`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_mundo` (`id_mundo`);

--
-- Índices de tabela `localizacao_atual`
--
ALTER TABLE `localizacao_atual`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_local` (`id_local`),
  ADD KEY `id_clima` (`id_clima`),
  ADD KEY `id_tempo` (`id_tempo`);

--
-- Índices de tabela `monstro`
--
ALTER TABLE `monstro`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_localizacao` (`id_localizacao`),
  ADD KEY `id_inventario` (`id_inventario`);

--
-- Índices de tabela `mundo`
--
ALTER TABLE `mundo`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `npc`
--
ALTER TABLE `npc`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_localizacao` (`id_localizacao`),
  ADD KEY `id_tipo_npc` (`id_tipo_npc`),
  ADD KEY `id_inventario` (`id_inventario`);

--
-- Índices de tabela `personagem`
--
ALTER TABLE `personagem`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nickname` (`nickname`),
  ADD KEY `id_guilda` (`id_guilda`),
  ADD KEY `id_classe` (`id_classe`),
  ADD KEY `id_raca` (`id_raca`),
  ADD KEY `personagem_ibfk_4` (`id_inventario`),
  ADD KEY `personagem_ibfk_5` (`id_localizacao_atual`);

--
-- Índices de tabela `pet`
--
ALTER TABLE `pet`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `quest`
--
ALTER TABLE `quest`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_localizacao` (`id_localizacao`);

--
-- Índices de tabela `raca`
--
ALTER TABLE `raca`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `recompensa`
--
ALTER TABLE `recompensa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_quest` (`id_quest`);

--
-- Índices de tabela `relacao_pet`
--
ALTER TABLE `relacao_pet`
  ADD PRIMARY KEY (`id`),
  ADD KEY `relacao_pet_ibfk_1` (`id_personagem`),
  ADD KEY `relacao_pet_ibfk_2` (`id_pet`);

--
-- Índices de tabela `tempo`
--
ALTER TABLE `tempo`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `tipo_armadura`
--
ALTER TABLE `tipo_armadura`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `tipo_npc`
--
ALTER TABLE `tipo_npc`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `weapon`
--
ALTER TABLE `weapon`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `armadura`
--
ALTER TABLE `armadura`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `classe`
--
ALTER TABLE `classe`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `clima`
--
ALTER TABLE `clima`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `conta`
--
ALTER TABLE `conta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `efeito`
--
ALTER TABLE `efeito`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `elemento`
--
ALTER TABLE `elemento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `guilda`
--
ALTER TABLE `guilda`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `habilidades`
--
ALTER TABLE `habilidades`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `inventario`
--
ALTER TABLE `inventario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de tabela `localizacao`
--
ALTER TABLE `localizacao`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `localizacao_atual`
--
ALTER TABLE `localizacao_atual`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `monstro`
--
ALTER TABLE `monstro`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `mundo`
--
ALTER TABLE `mundo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `npc`
--
ALTER TABLE `npc`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `personagem`
--
ALTER TABLE `personagem`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de tabela `pet`
--
ALTER TABLE `pet`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `quest`
--
ALTER TABLE `quest`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `raca`
--
ALTER TABLE `raca`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `recompensa`
--
ALTER TABLE `recompensa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `relacao_pet`
--
ALTER TABLE `relacao_pet`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `tempo`
--
ALTER TABLE `tempo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `tipo_armadura`
--
ALTER TABLE `tipo_armadura`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `tipo_npc`
--
ALTER TABLE `tipo_npc`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `weapon`
--
ALTER TABLE `weapon`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `armadura`
--
ALTER TABLE `armadura`
  ADD CONSTRAINT `armadura_ibfk_1` FOREIGN KEY (`id_tipo_armadura`) REFERENCES `tipo_armadura` (`id`);

--
-- Restrições para tabelas `habilidades`
--
ALTER TABLE `habilidades`
  ADD CONSTRAINT `habilidades_ibfk_1` FOREIGN KEY (`id_elemento`) REFERENCES `elemento` (`id`),
  ADD CONSTRAINT `habilidades_ibfk_2` FOREIGN KEY (`id_efeito`) REFERENCES `efeito` (`id`);

--
-- Restrições para tabelas `inventario`
--
ALTER TABLE `inventario`
  ADD CONSTRAINT `inventario_ibfk_1` FOREIGN KEY (`id_armor`) REFERENCES `armadura` (`id`),
  ADD CONSTRAINT `inventario_ibfk_2` FOREIGN KEY (`id_weapon`) REFERENCES `weapon` (`id`);

--
-- Restrições para tabelas `localizacao`
--
ALTER TABLE `localizacao`
  ADD CONSTRAINT `localizacao_ibfk_1` FOREIGN KEY (`id_mundo`) REFERENCES `mundo` (`id`);

--
-- Restrições para tabelas `localizacao_atual`
--
ALTER TABLE `localizacao_atual`
  ADD CONSTRAINT `localizacao_atual_ibfk_1` FOREIGN KEY (`id_local`) REFERENCES `localizacao` (`id`),
  ADD CONSTRAINT `localizacao_atual_ibfk_2` FOREIGN KEY (`id_clima`) REFERENCES `clima` (`id`),
  ADD CONSTRAINT `localizacao_atual_ibfk_3` FOREIGN KEY (`id_tempo`) REFERENCES `tempo` (`id`);

--
-- Restrições para tabelas `monstro`
--
ALTER TABLE `monstro`
  ADD CONSTRAINT `monstro_ibfk_1` FOREIGN KEY (`id_localizacao`) REFERENCES `localizacao` (`id`),
  ADD CONSTRAINT `monstro_ibfk_2` FOREIGN KEY (`id_inventario`) REFERENCES `inventario` (`id`);

--
-- Restrições para tabelas `npc`
--
ALTER TABLE `npc`
  ADD CONSTRAINT `npc_ibfk_1` FOREIGN KEY (`id_localizacao`) REFERENCES `localizacao` (`id`),
  ADD CONSTRAINT `npc_ibfk_2` FOREIGN KEY (`id_tipo_npc`) REFERENCES `tipo_npc` (`id`),
  ADD CONSTRAINT `npc_ibfk_3` FOREIGN KEY (`id_inventario`) REFERENCES `inventario` (`id`);

--
-- Restrições para tabelas `personagem`
--
ALTER TABLE `personagem`
  ADD CONSTRAINT `personagem_ibfk_1` FOREIGN KEY (`id_guilda`) REFERENCES `guilda` (`id`),
  ADD CONSTRAINT `personagem_ibfk_2` FOREIGN KEY (`id_classe`) REFERENCES `classe` (`id`),
  ADD CONSTRAINT `personagem_ibfk_3` FOREIGN KEY (`id_raca`) REFERENCES `raca` (`id`),
  ADD CONSTRAINT `personagem_ibfk_4` FOREIGN KEY (`id_inventario`) REFERENCES `inventario` (`id`),
  ADD CONSTRAINT `personagem_ibfk_5` FOREIGN KEY (`id_localizacao_atual`) REFERENCES `localizacao_atual` (`id`);

--
-- Restrições para tabelas `quest`
--
ALTER TABLE `quest`
  ADD CONSTRAINT `quest_ibfk_1` FOREIGN KEY (`id_localizacao`) REFERENCES `localizacao` (`id`);

--
-- Restrições para tabelas `recompensa`
--
ALTER TABLE `recompensa`
  ADD CONSTRAINT `recompensa_ibfk_1` FOREIGN KEY (`id_quest`) REFERENCES `quest` (`id`);

--
-- Restrições para tabelas `relacao_pet`
--
ALTER TABLE `relacao_pet`
  ADD CONSTRAINT `relacao_pet_ibfk_1` FOREIGN KEY (`id_personagem`) REFERENCES `personagem` (`id`),
  ADD CONSTRAINT `relacao_pet_ibfk_2` FOREIGN KEY (`id_pet`) REFERENCES `pet` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
