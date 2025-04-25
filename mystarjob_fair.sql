-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 25, 2025 at 08:14 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mystarjob_fair`
--

-- --------------------------------------------------------

--
-- Table structure for table `career_talk`
--

CREATE TABLE `career_talk` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `session_name` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `career_talk`
--

INSERT INTO `career_talk` (`id`, `name`, `email`, `session_name`, `created_at`) VALUES
(1, 'Aisyah Tan', 'aisyah.tan@example.com', 'Resume Building Workshop', '2025-04-24 14:33:35'),
(2, 'John Teo', 'john.teo@example.com', 'Career in Tech Panel', '2025-04-24 14:34:15');

-- --------------------------------------------------------

--
-- Table structure for table `career_talks_sessions`
--

CREATE TABLE `career_talks_sessions` (
  `id` int(11) NOT NULL,
  `day` varchar(255) NOT NULL,
  `session_title` varchar(255) NOT NULL,
  `slot_label` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `career_talks_sessions`
--

INSERT INTO `career_talks_sessions` (`id`, `day`, `session_title`, `slot_label`) VALUES
(1, 'Day 1 - 24 May 2025, Saturday', 'Kickoff: Resume Writing 101', '10:00 AM - 10:30 AM'),
(2, 'Day 1 - 24 May 2025, Saturday', 'Kickoff: Resume Writing 101', '10:30 AM - 11:00 AM'),
(3, 'Day 1 - 24 May 2025, Saturday', 'Tech Careers Panel', '11:00 AM - 11:45 AM'),
(4, 'Day 1 - 24 May 2025, Saturday', 'Tech Careers Panel', '11:45 AM - 12:30 PM'),
(5, 'Day 1 - 24 May 2025, Saturday', 'Ace the Interview', '2:00 PM - 2:45 PM'),
(6, 'Day 1 - 24 May 2025, Saturday', 'Ace the Interview', '2:45 PM - 3:30 PM'),
(7, 'Day 2 - 25 May 2025, Sunday', 'LinkedIn Optimization', '10:00 AM - 10:30 AM'),
(8, 'Day 2 - 25 May 2025, Sunday', 'LinkedIn Optimization', '10:30 AM - 11:00 AM'),
(9, 'Day 2 - 25 May 2025, Sunday', 'Working Abroad Insights', '11:00 AM - 11:45 AM'),
(10, 'Day 2 - 25 May 2025, Sunday', 'Working Abroad Insights', '11:45 AM - 12:30 PM'),
(11, 'Day 2 - 25 May 2025, Sunday', 'Building a Personal Brand', '2:00 PM - 2:45 PM'),
(12, 'Day 2 - 25 May 2025, Sunday', 'Building a Personal Brand', '2:45 PM - 3:30 PM');

-- --------------------------------------------------------

--
-- Table structure for table `contact_messages`
--

CREATE TABLE `contact_messages` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `message` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contact_messages`
--

INSERT INTO `contact_messages` (`id`, `name`, `email`, `subject`, `message`, `created_at`) VALUES
(1, 'Daniel Lim', 'daniel.lim@example.com', 'Inquiry about Booth Setup', 'Hi, may I know what are the dimensions of the booth space?', '2025-04-24 14:33:51'),
(2, 'Siti Hajar', 'siti.hajar@example.com', 'Sponsorship Opportunities', 'We are interested in sponsoring the event. Please share the details.', '2025-04-24 14:34:25');

-- --------------------------------------------------------

--
-- Table structure for table `exhibitors`
--

CREATE TABLE `exhibitors` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `location` varchar(50) NOT NULL,
  `logo` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `exhibitors`
--

INSERT INTO `exhibitors` (`id`, `name`, `location`, `logo`) VALUES
(1, 'PERTUBUHAN KESELAMATAN SOSIAL (PERKESO)', 'PAV1', 'perkeso.png'),
(2, 'MYNEXT SDN BHD', 'D1', 'mynext.png'),
(3, 'AHAM ASSET MANAGEMENT BERHAD', 'BR29', 'aham.png'),
(4, 'QI SERVICES (M) SDN BHD', 'BR02', 'qi.png'),
(5, 'ABC COOKING STUDIO MALAYSIA SDN BHD', 'B32', 'abc.png'),
(6, 'AGENSI PEKERJAAN HAYS (MALAYSIA) SDN BHD', 'B26', 'hays.webp'),
(7, 'ALLIANZ LIFE INSURANCE MALAYSIA BERHAD', 'B02', 'allianz.png'),
(8, 'AONIC SDN BHD', 'B30', 'aonic.webp'),
(9, 'ASSOCIATION OF ACCOUNTING TECHNICIANS (AAT)', 'B31', 'aat.png'),
(10, 'BABA PRODUCTS (M) SDN BHD', 'B33', 'babas.png'),
(11, 'GREAT EASTERN LIFE ASSURANCE (MALAYSIA) BERHAD', 'B50 & B51', 'greatEastern.png'),
(12, 'HONG LEONG ASSURANCE BERHAD', 'B23', 'hongleong.webp'),
(13, 'KL FERTILITY & GYNAECOLOGY CENTRE SDN BHD', 'B36', 'klfertility.png'),
(14, 'KUMPULAN WANG SIMPANAN PEKERJA (KWSP)', 'A02', 'kwsp.png'),
(15, 'LYC MOTHER & CHILD CENTRE SDN BHD', 'B25', 'lyc.png'),
(16, 'MALAYSIAN INSTITUTE OF HUMAN RESOURCES MANAGEMENT (MIHRM)', 'A03', 'mihrm.webp'),
(17, 'PUBLIC BANK BERHAD', 'B03', 'publicBank.png'),
(18, 'SEATRIUM (SG) PTE LTD', 'B60', 'seatrium.png'),
(19, 'SETEL VENTURES SDN BHD', 'B28', 'setel.png'),
(20, 'SHA WEALTH PLANNERS SDN BHD', 'B35', 'sha.png'),
(21, 'STAR MEDIA GROUP BERHAD', 'A1', NULL),
(22, 'VISTA LASER EYE CENTER SDN BHD', 'B01', 'vista.png'),
(23, 'APAR TECHNOLOGIES SDN BHD', 'B22A', 'apar.png'),
(24, 'CIMB BANK BERHAD', 'B18', 'cimb.png'),
(25, 'COMPOSITE TECHNOLOGY RESEARCH MALAYSIA SDN BHD', 'B14', 'ctrm.png'),
(26, 'GUARDIAN HEALTH AND BEAUTY SDN BHD', 'B15', 'guardian.webp'),
(27, 'HABIB GROUP', 'B19', 'habib.png'),
(28, 'INTERCONTINENTAL KUALA LUMPUR', 'B21', 'intercontinental.webp'),
(29, 'MALAYSIA AVIATION GROUP', 'B11', 'mag.webp'),
(30, 'MARRIOTT INTERNATIONAL', 'B12', 'marriott.svg'),
(31, 'ONES.ONLY DESARU COAST', 'B16', 'desaru.svg'),
(32, 'PADINI HOLDINGS BERHAD', 'B13', 'padini.png'),
(33, 'SPORTS DIRECT MALAYSIA SDN BHD', 'B27', 'sportsdirect.png');

-- --------------------------------------------------------

--
-- Table structure for table `job_matching`
--

CREATE TABLE `job_matching` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `job_interest` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `job_matching`
--

INSERT INTO `job_matching` (`id`, `name`, `email`, `job_interest`, `created_at`) VALUES
(1, 'Nurul Iman', 'nurul.iman@example.com', 'Frontend Developer', '2025-04-24 14:33:59'),
(2, 'Arif Rahman', 'arif.rahman@example.com', 'Marketing Executive', '2025-04-24 14:34:34');

-- --------------------------------------------------------

--
-- Table structure for table `reservations`
--

CREATE TABLE `reservations` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `session_type` varchar(50) NOT NULL,
  `session_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `visitor_registrations`
--

CREATE TABLE `visitor_registrations` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `session` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `visitor_registrations`
--

INSERT INTO `visitor_registrations` (`id`, `name`, `email`, `phone`, `session`, `created_at`) VALUES
(1, 'test', 'test@email.com', '0123456789', 'Day 1 - 24 May 2025, Saturday - 9:00 AM', '2025-04-25 05:07:21');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `career_talk`
--
ALTER TABLE `career_talk`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `career_talks_sessions`
--
ALTER TABLE `career_talks_sessions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact_messages`
--
ALTER TABLE `contact_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `exhibitors`
--
ALTER TABLE `exhibitors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `job_matching`
--
ALTER TABLE `job_matching`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reservations`
--
ALTER TABLE `reservations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `visitor_registrations`
--
ALTER TABLE `visitor_registrations`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `career_talk`
--
ALTER TABLE `career_talk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `career_talks_sessions`
--
ALTER TABLE `career_talks_sessions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `contact_messages`
--
ALTER TABLE `contact_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `exhibitors`
--
ALTER TABLE `exhibitors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `job_matching`
--
ALTER TABLE `job_matching`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `reservations`
--
ALTER TABLE `reservations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `visitor_registrations`
--
ALTER TABLE `visitor_registrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
