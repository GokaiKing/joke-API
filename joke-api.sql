-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 12, 2025 at 12:38 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `joke-api`
--

-- --------------------------------------------------------

--
-- Table structure for table `authors`
--

CREATE TABLE `authors` (
  `id` int(10) NOT NULL,
  `name` varchar(20) NOT NULL,
  `AI_Generated` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `authors`
--

INSERT INTO `authors` (`id`, `name`, `AI_Generated`) VALUES
(1, 'Ana Torres', 0),
(2, 'Luis Pérez', 0),
(3, 'Marta Gómez', 0),
(4, 'Carlos Ruiz', 0),
(5, 'Elena Ríos', 0),
(6, 'Javier Mora', 0),
(7, 'Lucía Ortega', 0),
(8, 'Sergio Díaz', 0),
(9, 'Isabel Martín', 0),
(10, 'Pedro López', 0),
(11, 'Laura Vega', 0),
(12, 'Andrés Soto', 0),
(13, 'ChatGPT', 1),
(14, 'Deepseek', 1),
(15, 'Copilot', 1);

-- --------------------------------------------------------

--
-- Table structure for table `jokes`
--

CREATE TABLE `jokes` (
  `id` int(10) NOT NULL,
  `content` varchar(200) NOT NULL,
  `authorId` int(10) NOT NULL,
  `rating` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `jokes`
--

INSERT INTO `jokes` (`id`, `content`, `authorId`, `rating`) VALUES
(1, '¿Qué hace una abeja en el gimnasio? Zuuuuuuuum-ba', 1, 2),
(2, '¿Por qué el libro de matemáticas está triste? Porque tiene demasiados problemas.', 2, 3),
(3, '¿Qué le dice una impresora a otra? ¿Esa hoja es tuya o es una impresión mía?', 3, 5),
(4, '¿Cómo se llama un boomerang que no vuelve? Un palo.', 4, 2),
(5, '¿Por qué el tomate se sonrojó? Porque vio al otro desnudo.', 5, 4),
(6, '¿Qué le dijo un pez a otro? ¡Nada, nada!', 6, 5),
(7, '¿Qué hace un perro con un taladro? ¡Taladrando!', 7, 3),
(8, '¿Por qué los pájaros no usan Facebook? Porque ya tienen Twitter.', 8, 4),
(9, '¿Cómo se despiden los químicos? Ácido un placer.', 9, 5),
(10, '¿Por qué los esqueletos no pelean entre ellos? Porque no tienen agallas.', 10, 3),
(11, '¿Qué hace una vaca en un terremoto? Leche agitada.', 11, 2),
(12, '¿Por qué el café fue al psicólogo? Porque tenía muchos problemas para expresarse.', 12, 3),
(13, '¿Qué hace una computadora en la playa? ¡Nada de bytes!', 13, 5),
(14, '¿Qué pasa si tiras un pato al agua? Nada.', 14, 3),
(15, '¿Cuál es el animal más antiguo? La cebra, porque está en blanco y negro.', 15, 2),
(16, '¿Por qué no se puede discutir con un número impar? Porque no se puede dividir.', 1, 4),
(17, '¿Cómo se llama el campeón de buceo japonés? Tokofondo.', 2, 3),
(18, '¿Y el subcampeón? Kasitoko.', 3, 3),
(19, '¿Cuál es el colmo de Aladdín? Tener mal genio.', 4, 4),
(20, '¿Qué le dice una cebolla a otra? Nos vemos en la sartén.', 5, 2),
(21, '¿Cuál es el colmo de un electricista? No encontrar su corriente de vida.', 6, 4),
(22, '¿Qué hace un pez? Nada y nada.', 7, 3),
(23, '¿Por qué lloraba el libro de historia? Porque siempre lo hacían recordar.', 8, 4),
(24, '¿Qué hace un gato cuando cae al agua? ¡Miau-darse!', 9, 5),
(25, '¿Qué hacen dos pollos en una caja fuerte? Pollos a la fuga.', 10, 3),
(26, '¿Qué hace un jardinero con un iPhone? Planta una llamada.', 11, 4),
(27, '¿Por qué los fantasmas no mienten? Porque se les ve a través.', 12, 2),
(28, '¿Qué hace un pirata en el baño? El abordaje.', 13, 4),
(29, '¿Por qué el sol nunca fue a la universidad? Porque ya tenía muchos grados.', 14, 3),
(30, '¿Qué pasa cuando lanzas un pato al agua? ¡Nada!', 15, 3),
(31, '¿Cuál es el colmo de un panadero? Que le dé miedo la masa.', 1, 3),
(32, '¿Qué hace una escoba en una fiesta? Barre el ambiente.', 2, 4),
(33, '¿Cómo se dice pañuelo en japonés? Saka-moko.', 3, 2),
(34, '¿Qué le dijo el cero al ocho? ¡Bonito cinturón!', 4, 5),
(35, '¿Por qué los peces no usan Facebook? Porque ya tienen su red.', 5, 3),
(36, '¿Qué hace un pájaro con una calculadora? Cuentas claras.', 6, 4),
(37, '¿Cuál es el animal más fiestero? El panda, porque siempre está de pachanga.', 7, 5),
(38, '¿Qué le dijo una piedra a otra? La vida es dura.', 8, 3),
(39, '¿Por qué los esqueletos no hacen deporte? Porque se les caen los huesos.', 9, 2),
(40, '¿Cómo se llama el campeón de buceo ruso? Sumergévich.', 10, 4),
(41, '¿Qué le dice un jardinero a otro? ¡Disfrutemos mientras podamos!', 11, 3),
(42, '¿Qué hace un pez fuera del agua? Nada raro.', 12, 4),
(43, '¿Por qué el plátano fue al médico? Porque no se pelaba bien.', 13, 3),
(44, '¿Qué hace un caracol en una tortuga? Viviendo rápido.', 14, 5),
(45, '¿Qué pasa si plantas una calculadora? Da cuentas claras.', 15, 4),
(46, '¿Por qué no se puede confiar en los ascensores? Porque siempre están subiendo y bajando.', 1, 3),
(47, '¿Qué hace una llave en una fiesta? Abre la pista.', 2, 5),
(48, '¿Qué hace un ladrón en una panadería? Roba el pan de cada día.', 3, 2),
(49, '¿Qué hacen dos computadoras enamoradas? Se conectan.', 4, 4),
(50, '¿Qué le dice un gusano a otro? Voy a dar una vuelta a la manzana.', 5, 5),
(51, '¿Por qué el lápiz está celoso del bolígrafo? Porque tiene más tinta.', 6, 3),
(52, '¿Qué hace un semáforo cuando se enoja? Se pone rojo.', 7, 4),
(53, '¿Por qué no se puede jugar al escondite con las montañas? Porque siempre se encuentran.', 8, 2),
(54, '¿Qué hace una silla en el mar? Silla-nado.', 9, 3),
(55, '¿Qué le dijo un reloj a otro? Nos vemos a tiempo.', 10, 4),
(56, '¿Cuál es el colmo de un astronauta? Estar en las nubes.', 11, 3),
(57, '¿Qué hace una naranja en la carretera? Jugando.', 12, 2),
(58, '¿Por qué el calendario siempre está estresado? Porque sus días están contados.', 13, 5),
(59, '¿Qué hace un pato con una pata rota? ¡Cojea-cuac!', 14, 4),
(60, '¿Cómo se despide un químico explosivo? ¡Ácido un placer, boom!', 15, 5),
(61, '¿Por qué los pájaros no usan WhatsApp? Porque ya tienen Twitter.', 1, 3),
(62, '¿Qué hace una cuchara en una fiesta? Revolviendo el ambiente.', 2, 4),
(63, '¿Qué hace una lámpara en el gimnasio? Ilumina el entrenamiento.', 3, 2),
(64, '¿Cuál es el colmo de un carpintero? Que siempre le midan el talento.', 4, 4),
(65, '¿Por qué el reloj fue al psicólogo? Porque no podía dejar de dar vueltas.', 5, 5),
(66, '¿Qué le dice el pan al otro pan? Te presento a mi miga.', 6, 3),
(67, '¿Qué hace un gato con una caja? ¡Un unboxing!', 7, 4),
(68, '¿Por qué el semáforo no tiene amigos? Porque siempre está cambiando.', 8, 3),
(70, '¿Qué le dice un tomate a otro? ¡Nos vemos en el ketchup!', 10, 5),
(71, '¿Cómo se despiden los programadores? Byte, byte.', 11, 4),
(72, '¿Qué le dice un diente a otro? ¡Muerde el polvo!', 12, 3),
(73, '¿Qué hace un plátano con una capa? ¡Banana-man!', 13, 2),
(74, '¿Cuál es el colmo de un fotógrafo? Revelar su vida privada.', 14, 4),
(75, '¿Qué hace un globo perdido? Nada, está desinflado.', 15, 3),
(76, '¿Por qué las focas miran siempre hacia arriba? ¡Porque ahí están los focos!', 1, 5),
(77, '¿Qué hace un ratón en la computadora? Navega por queso.com.', 2, 4),
(78, '¿Qué hace un dinosaurio con una caja fuerte? Guarda-saurios.', 3, 2),
(79, '¿Qué hace una oreja en la playa? Escuchando las olas.', 4, 3),
(80, '¿Cuál es el colmo de un escritor? Perder la palabra.', 5, 4),
(81, '¿Qué hace una batería triste? Se descarga emocionalmente.', 6, 3),
(82, '¿Cómo se llama el pez que cae bien? El simpatiche.', 7, 2),
(83, '¿Qué hace una nube en el colegio? ¡Va a clases de precipitación!', 8, 4),
(84, '¿Por qué el pez no pasa por el túnel? Porque nada lo detiene.', 9, 5),
(85, '¿Qué hace un dragón con dolor de garganta? Saca fuego bajito.', 10, 4),
(86, '¿Por qué la escoba se divorció del recogedor? Porque barría con todo.', 11, 3),
(87, '¿Qué hace un huevo en una fiesta? ¡Se revuelve!', 12, 3),
(88, '¿Cuál es el colmo de un relojero? No tener tiempo.', 13, 4),
(89, '¿Qué le dice una nube a otra? Te veo muy cargada.', 14, 3),
(90, '¿Por qué la luna rompió con el sol? Porque necesitaba espacio.', 15, 5),
(91, '¿Qué le dijo el semáforo al coche? No me mires que me estoy cambiando.', 1, 4),
(92, '¿Por qué los peces son malos jugando al básquet? Porque le tienen miedo a la red.', 2, 3),
(93, '¿Qué le dice una escoba a otra? ¡Nos vemos en la próxima barrida!', 3, 2),
(94, '¿Por qué los robots nunca tienen miedo? Porque tienen nervios de acero.', 4, 4),
(95, '¿Qué hace una abeja en el cine? ¡Ver una película con mucha miel-dramática!', 5, 3),
(96, '¿Cómo se llama el campeón de buceo alemán? Hundido.', 6, 2),
(97, '¿Por qué los relojes no se llevan bien? Porque siempre están contra el tiempo.', 7, 4),
(98, '¿Qué le dijo un tornillo a otro? ¡Vamos a dar una vuelta!', 8, 3),
(99, '¿Qué hace una roca en el gimnasio? ¡Levanta pesas pesadas!', 9, 4),
(100, '¿Por qué los fantasmas no usan zapatos? Porque se les traspasan los pies.', 10, 5),
(101, '¿Por qué los pájaros no usan Facebook? Porque ya tienen Twitter', 1, 4);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `authors`
--
ALTER TABLE `authors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jokes`
--
ALTER TABLE `jokes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `authorJoin` (`authorId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `authors`
--
ALTER TABLE `authors`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `jokes`
--
ALTER TABLE `jokes`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `jokes`
--
ALTER TABLE `jokes`
  ADD CONSTRAINT `authorJoin` FOREIGN KEY (`authorId`) REFERENCES `authors` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
