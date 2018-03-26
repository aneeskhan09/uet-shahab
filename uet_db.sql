-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 26, 2018 at 09:04 AM
-- Server version: 10.1.9-MariaDB
-- PHP Version: 5.6.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `uet_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `charges`
--

CREATE TABLE `charges` (
  `CHARGE_ID` int(11) NOT NULL,
  `CHARGE` varchar(50) DEFAULT NULL,
  `CHARGE_TYPE` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `charges`
--

INSERT INTO `charges` (`CHARGE_ID`, `CHARGE`, `CHARGE_TYPE`) VALUES
(1, '1002', 'LAB FEE1'),
(2, '200', 'LIBRARY'),
(4, '500 ', 'DUMMY'),
(5, '800 ', 'DUMMY'),
(6, '1000 ', 'PARKING FEE'),
(7, '2000', 'EXTRA FEE'),
(8, '2500', 'TAX');

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE `invoice` (
  `INVOICE_NO` int(11) NOT NULL,
  `INVOICE_DATE` date DEFAULT NULL,
  `STUDENT_ID` int(11) DEFAULT NULL,
  `STATUS` int(2) NOT NULL DEFAULT '1',
  `DUE_DATE` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `invoice`
--

INSERT INTO `invoice` (`INVOICE_NO`, `INVOICE_DATE`, `STUDENT_ID`, `STATUS`, `DUE_DATE`) VALUES
(1, '2016-04-25', 1, 1, NULL),
(2, '2016-04-25', 1, 0, NULL),
(3, '2016-04-25', 1, 1, NULL),
(4, '2016-04-25', 1, 1, NULL),
(5, '2016-04-25', 2, 1, NULL),
(6, '2016-04-25', 1, 1, NULL),
(7, '2016-04-26', 2, 0, '2016-04-07'),
(8, '2016-05-03', 9, 1, '2016-05-17'),
(9, '2016-05-03', 12, 1, '2016-05-26'),
(10, '2016-05-03', 14, 1, '2016-05-19'),
(11, '2016-05-04', 9, 1, '2016-05-13');

-- --------------------------------------------------------

--
-- Table structure for table `invoice_log`
--

CREATE TABLE `invoice_log` (
  `INVOICE_LOG_ID` int(11) NOT NULL,
  `INVOICE_NO` int(11) DEFAULT NULL,
  `CHARGE_ID` int(11) DEFAULT NULL,
  `INVOICE_DATE` date DEFAULT NULL,
  `DUE_DATE` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `invoice_log`
--

INSERT INTO `invoice_log` (`INVOICE_LOG_ID`, `INVOICE_NO`, `CHARGE_ID`, `INVOICE_DATE`, `DUE_DATE`) VALUES
(6, 1, 1, '2016-04-25', NULL),
(7, 1, 4, '2016-04-25', NULL),
(8, 1, 6, '2016-04-25', NULL),
(9, 1, 7, '2016-04-25', NULL),
(10, 1, 8, '2016-04-25', NULL),
(11, 2, 2, '2016-04-25', NULL),
(12, 2, 4, '2016-04-25', NULL),
(13, 3, 2, '2016-04-25', NULL),
(14, 3, 3, '2016-04-25', NULL),
(15, 4, 2, '2016-04-25', NULL),
(16, 4, 4, '2016-04-25', NULL),
(17, 5, 3, '2016-04-25', NULL),
(18, 6, 1, '2016-04-25', NULL),
(19, 6, 3, '2016-04-25', NULL),
(20, 7, 2, '2016-04-26', NULL),
(21, 8, 1, '2016-05-03', '2016-05-17'),
(22, 8, 2, '2016-05-03', '2016-05-17'),
(23, 8, 3, '2016-05-03', '2016-05-17'),
(24, 8, 4, '2016-05-03', '2016-05-17'),
(25, 8, 5, '2016-05-03', '2016-05-17'),
(26, 8, 6, '2016-05-03', '2016-05-17'),
(27, 8, 7, '2016-05-03', '2016-05-17'),
(28, 8, 8, '2016-05-03', '2016-05-17'),
(29, 9, 2, '2016-05-03', '2016-05-26'),
(30, 9, 3, '2016-05-03', '2016-05-26'),
(31, 9, 4, '2016-05-03', '2016-05-26'),
(32, 9, 5, '2016-05-03', '2016-05-26'),
(33, 9, 6, '2016-05-03', '2016-05-26'),
(34, 9, 7, '2016-05-03', '2016-05-26'),
(35, 9, 8, '2016-05-03', '2016-05-26'),
(36, 10, 3, '2016-05-03', '2016-05-19'),
(37, 10, 4, '2016-05-03', '2016-05-19'),
(38, 10, 6, '2016-05-03', '2016-05-19'),
(39, 10, 7, '2016-05-03', '2016-05-19'),
(40, 11, 2, '2016-05-04', '2016-05-13');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `STUDENT_ID` int(11) NOT NULL,
  `REGISTERATION_NO` varchar(10) DEFAULT NULL,
  `STUDENT_NAME` varchar(50) DEFAULT NULL,
  `DEPARTMENT` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`STUDENT_ID`, `REGISTERATION_NO`, `STUDENT_NAME`, `DEPARTMENT`) VALUES
(8, '12PWMIN067', 'Muhammad Usman Fiaz', 'Dept of Mining Engg'),
(9, '12PWELE414', 'Fazle Samad', 'Dept of Electrical Engg'),
(10, '12PWELE410', 'Naveed Ahmad', 'Dept of Electrical Engg'),
(11, '12PWAGR067', 'Shahi Mulk', 'Dept of Agricultural Engg'),
(12, '12PWBCS033', 'Muhammad Kashif Akbar', 'Dept of CS and IT'),
(13, '12PWBCS033', 'Sadam Hussain', 'Dept of CS and IT'),
(14, '12PWELE409', 'Hikmat Ullah', 'Dept of Electrical Engg'),
(15, '12PWMEC334', 'Mehboob Ur Rehman', 'Dept of Mechanical Engg'),
(16, '13PWIND022', 'Farzand Ali', 'Dept of Industrial Engg'),
(17, '13PWCIV391', 'Abdul Baqi', 'Dept of Civil Engg'),
(18, '13PWCIV402', 'Abbas Ahmad', 'Dept of Civil Engg'),
(19, '13PWMEC359', 'Muhammad Qaisar Fahim', 'Dept of Mechanical Engg'),
(20, '13PWELE437', 'Muhammad Sajjad', 'Dept of Electrical Engg'),
(21, '13PWMEC360', 'Imad Ali Khan', 'Dept of Mechanical Engg'),
(22, '12PWCHE074', 'Malik Faisal Nawaz', 'Dept of Chemical Engg'),
(23, '12PWBCS030', 'Farhan Illahi Chishti', 'Dept of CS and IT'),
(24, '12PWBCS030', 'Khwaja Bilal Hassan', 'Dept of CS and IT'),
(25, '13PWCIV390', 'Assad Ullah', 'Dept of Civil Engg'),
(26, '13PWCIV395', 'Yousaf Shah', 'Dept of Civil Engg'),
(27, '13PWCIV390', 'Iftikhar Ahmad', 'Dept of Civil Engg'),
(28, '13PWCIV397', 'Abubakar  ', 'Dept of Civil Engg'),
(29, '13PWELE431', 'Hayat Ullah', 'Dept of Electrical Engg'),
(30, '13PWCIV397', 'M. Idris', 'Dept of Civil Engg'),
(31, '13PWCIV394', 'Imad Ur Rehman', 'Dept of Civil Engg'),
(32, '13PWELE433', 'Sajjad Khan', 'Dept of Electrical Engg'),
(33, '13PWCIV394', 'Sayel Wahab', 'Dept of Civil Engg'),
(34, '13PWCIV395', 'Nisar Ul Haq', 'Dept of Civil Engg'),
(35, '13PWCIV395', 'Safi Ur Rehman', 'Dept of Civil Engg'),
(36, '13PWCIV390', 'Faisal Pervez', 'Dept of Civil Engg'),
(37, '13PWCIV395', 'Imran Yahya', 'Dept of Civil Engg'),
(38, '13PWCHE079', 'M. Awais Ali', 'Dept of Chemical Engg'),
(39, '13PWCIV389', 'Shakir Ali', 'Dept of Civil Engg'),
(40, '13PWCIV391', 'Usman Sadiq', 'Dept of Civil Engg'),
(41, '13PWELE431', 'M. Idrees', 'Dept of Electrical Engg'),
(42, '13PWELE430', 'Naeem Khan', 'Dept of Electrical Engg'),
(43, '13PWELE432', 'Shakil M.', 'Dept of Electrical Engg'),
(44, '13PWCIV390', 'Sardar Ali', 'Dept of Civil Engg'),
(45, '13PWELE430', 'Saad Ahmad', 'Dept of Electrical Engg'),
(46, '13PWMEC351', 'Saqib Nasim', 'Dept of Mechanical Engg'),
(47, '13PWELE427', 'M. Ehtesham Khan', 'Dept of Electrical Engg'),
(48, '13PWELE428', 'Hasham Khan', 'Dept of Electrical Engg'),
(49, '13PWCIV395', 'Asif Shamim', 'Dept of Civil Engg'),
(50, '13PWIND023', 'Asfand Mudassir', 'Dept of Industrial Engg'),
(51, '13PWELE430', 'Muhammad Farooq', 'Dept of Electrical Engg'),
(52, '13PWELE432', 'Aamir Rasheed Khan', 'Dept of Electrical Engg'),
(53, '13PWELE430', 'M. Aqib', 'Dept of Electrical Engg'),
(54, '13PWMEC350', 'Fawad Ali', 'Dept of Mechanical Engg'),
(55, '13PWMEC352', 'Jamshaid Sami', 'Dept of Mechanical Engg'),
(56, '13PWMEC352', 'M. Waqas', 'Dept of Mechanical Engg'),
(57, '13PWMEC357', 'M. Zeeshan Jawad', 'Dept of Mechanical Engg'),
(58, '13PWMEC351', 'M. Saqib Marwat', 'Dept of Mechanical Engg'),
(59, '13PWMEC357', 'Shahzad Ali', 'Dept of Mechanical Engg'),
(60, '13PWMEC350', 'Nadeem Ur Rehman', 'Dept of Mechanical Engg'),
(61, '13PWMEC354', 'Mudassir Ali Khattak', 'Dept of Mechanical Engg'),
(62, '13PWMEC353', 'Faraz Ahmad', 'Dept of Mechanical Engg'),
(63, '13PWMEC355', 'Muhammad Suleman', 'Dept of Mechanical Engg'),
(64, '13PWMEC358', 'Izaz Raouf', 'Dept of Mechanical Engg'),
(65, '12PWCIV387', 'Arif Gul', 'Dept of Civil Engg'),
(66, '13PWCIV389', 'Ajab Khurshid', 'Dept of Civil Engg'),
(67, '13PWMCT028', 'Aqeel Nawaz', 'Dept of Mechatronics Engg'),
(68, '13PWMEC351', 'M. Usman', 'Dept of Mechanical Engg'),
(69, '13PWCHE082', 'M. Shahid', 'Dept of Chemical Engg'),
(70, '13PWCHE084', 'Kamran Khan', 'Dept of Chemical Engg'),
(71, '13PWCHE081', 'M. Saqib Haroon', 'Dept of Chemical Engg'),
(72, '13PWCHE084', 'Zia Shahid', 'Dept of Chemical Engg'),
(73, '13PWIND023', 'Jehangir Khan', 'Dept of Industrial Engg'),
(74, '13PWCHE084', 'S. Zia Ullah', 'Dept of Chemical Engg'),
(75, '13PWMEC351', 'Adnan Walidad', 'Dept of Mechanical Engg'),
(76, '13PWCHE083', 'Ehtisham Zaib', 'Dept of Chemical Engg'),
(77, '13PWCIV394', 'Hamza Ali Jadoon', 'Dept of Civil Engg'),
(78, '13PWAGR069', 'Insha Ullah', 'Dept of Agricultural Engg'),
(79, '12PWBCS031', 'Ameer Jan', 'Dept of CS and IT'),
(80, '13PWCSE104', 'Mubashir Ali', 'Dept of Computer System Engg'),
(81, '13PWELE428', 'Tajammul Hussain', 'Dept of Electrical Engg'),
(82, '13PWCSE104', 'Ilyas Hussain', 'Dept of Computer System Engg'),
(83, '13PWCSE108', 'Tanweer Afas', 'Dept of Computer System Engg'),
(84, '13PWMCT029', 'Burhan Sani', 'Dept of Mechatronics Engg'),
(85, '13PWCSE107', 'Atizaz Gohar', 'Dept of Computer System Engg'),
(86, '13PWMEC359', 'Gul Wali Khan', 'Dept of Mechanical Engg'),
(87, '13PWIND023', 'M. Waseem', 'Dept of Industrial Engg'),
(88, '13PWIND023', 'Hammad Hassan', 'Dept of Industrial Engg'),
(89, '13PWIND024', 'Meraj Malik', 'Dept of Industrial Engg'),
(90, '13PWMCT026', 'Faizan Khan', 'Dept of Mechatronics Engg'),
(91, '13PWMCT028', 'M. Mashhood Ur Rehman', 'Dept of Mechatronics Engg'),
(92, '13PWMCT027', 'Nasir Khan', 'Dept of Mechatronics Engg'),
(93, '13PWMEC350', 'M. Asif', 'Dept of Mechanical Engg'),
(94, '13PWMIN067', 'Ibrahim Amin', 'Dept of Mining Engg'),
(95, '13PWMIN068', 'Daud Jan', 'Dept of Mining Engg'),
(96, '12PWCIV385', 'Muhammad Roman Yousaf', 'Dept of Civil Engg'),
(97, '13PWAGR068', 'Waqas Inam', 'Dept of Agricultural Engg'),
(98, '13PWAGR069', 'Saqib Hamid', 'Dept of Agricultural Engg'),
(99, '13PWMIN069', 'Arif Khan', 'Dept of Mining Engg'),
(100, '13PWCSE108', 'Sikandar Iqbal', 'Dept of Computer System Engg'),
(101, '13PWAGR069', 'Nuaman Ejaz', 'Dept of Agricultural Engg'),
(102, '13PWCSE106', 'Yasir Iqbal', 'Dept of Computer System Engg'),
(103, '12PWMEC339', 'Adeel Ahmed Khan', 'Dept of Mechanical Engg'),
(104, '12PWMEC340', 'Waseem Ahmad', 'Dept of Mechanical Engg'),
(105, '12PWMEC340', 'Iftikhar Rasool', 'Dept of Mechanical Engg'),
(106, '12PWMEC333', 'Faheem Ullah', 'Dept of Mechanical Engg'),
(107, '13PWCHE084', 'Sheheryar Khan', 'Dept of Chemical Engg'),
(108, '12PWMEC332', 'Riaz Ali Khan', 'Dept of Mechanical Engg'),
(109, '12PWMEC341', 'Tahir Afareen', 'Dept of Mechanical Engg'),
(110, '12PWCIV368', 'Asmat Ullah', 'Dept of Civil Engg'),
(111, '13PWCIV392', 'Gohar Alam', 'Dept of Civil Engg'),
(112, '12PWAGR068', 'Kaleem Ullah', 'Dept of Agricultural Engg'),
(113, '12PWCIV384', 'Saleem Khan', 'Dept of Civil Engg'),
(114, '12PWCSE096', 'Muhammad Mehran', 'Dept of Computer System Engg'),
(115, '13PWCHE081', 'Yasir Hussain', 'Dept of Chemical Engg'),
(116, '13PWCHE083', 'Aamir Khan', 'Dept of Chemical Engg'),
(117, '12PWAGR067', 'Haroon Jan', 'Dept of Agricultural Engg'),
(118, '12PWMCT019', 'Khaista Wahab', 'Dept of Mechatronics Engg'),
(119, '12PWMCT019', 'Muhammad Shaur Khan', 'Dept of Mechatronics Engg'),
(120, '12PWMIN067', 'Sayed Muhammad Nijat', 'Dept of Mining Engg'),
(121, '12PWCIV371', 'Sartaj Ali', 'Dept of Civil Engg'),
(122, '12PWCIV384', 'Javed Islam', 'Dept of Civil Engg'),
(123, '12PWELE418', 'Muhammad Ishfaq', 'Dept of Electrical Engg'),
(124, '13PWCHE083', 'M. Islam', 'Dept of Chemical Engg'),
(125, '12PWELE413', 'Saddam Zahid', 'Dept of Electrical Engg'),
(126, '12PWCHE071', 'Zeeshan Nabi', 'Dept of Chemical Engg'),
(127, '12PWCHE075', 'Arif Ullah', 'Dept of Chemical Engg'),
(128, '12PWCHE075', 'Muhammad Shabir Khan', 'Dept of Chemical Engg'),
(129, '12PWIND018', 'Muhammad Hanif', 'Dept of Industrial Engg'),
(130, '12PWAGR066', 'Laiq Shah', 'Dept of Agricultural Engg'),
(131, '12PWIND018', 'Shaiq Ali', 'Dept of Industrial Engg'),
(132, '13PWCIV402', 'Umar Faran', 'Dept of Civil Engg'),
(133, '13PWCIV396', 'Majid Gul', 'Dept of Civil Engg'),
(134, '12PWIND019', 'Muhammad Nasir', 'Dept of Industrial Engg'),
(135, '12PWAGR067', 'Shafiq Ahmad', 'Dept of Agricultural Engg'),
(136, '12PWBCS034', 'Muhammad Younas', 'Dept of CS and IT'),
(137, '12PWCIV376', 'Syed Faizan Ali Shah', 'Dept of Civil Engg'),
(138, '12PWCIV376', 'Muhammad Salman', 'Dept of Civil Engg'),
(139, '12PWCIV387', 'Rizwan Sharif', 'Dept of Civil Engg'),
(140, '12PWCIV371', 'Muhammad Naeem Iqbal', 'Dept of Civil Engg'),
(141, '12PWELE416', 'Adnan Khan', 'Dept of Electrical Engg'),
(142, '12PWELE418', 'Noor Saleem Khan', 'Dept of Electrical Engg'),
(143, '12PWAGR067', 'Muhammad Wasim', 'Dept of Agricultural Engg'),
(144, '12PWELE409', 'Muhammad Adnan Khan', 'Dept of Electrical Engg'),
(145, '12PWELE417', 'Hashir Ali Khan', 'Dept of Electrical Engg'),
(146, '12PWELE417', 'Abdul Qadir', 'Dept of Electrical Engg'),
(147, '13PWCHE083', 'Abdul Aziz', 'Dept of Chemical Engg'),
(148, '12PWMEC335', 'Basit Khan', 'Dept of Mechanical Engg'),
(149, '12PWMEC335', 'Jauhar Ali', 'Dept of Mechanical Engg'),
(150, '13PWBCS036', 'Abdus Samad', 'Dept of CS and IT'),
(151, '12PWMEC336', 'Junaid Uzair', 'Dept of Mechanical Engg'),
(152, '13PWIND024', 'Jaffar Mahmood', 'Dept of Industrial Engg'),
(153, '13PWMCT029', 'Abdul Baseer', 'Dept of Mechatronics Engg'),
(154, '13PWCSE108', 'Muhammad Suliman', 'Dept of Computer System Engg'),
(155, '13PWIND024', 'Zia Ullah', 'Dept of Industrial Engg'),
(156, '13PWIND023', 'M.Wajahat Zafar', 'Dept of Industrial Engg'),
(157, '13PWCIV392', 'Amanullah Khan', 'Dept of Civil Engg'),
(158, '13PWCIV391', 'S. Saifullah Shah', 'Dept of Civil Engg'),
(159, '13PWCIV390', 'Junaid Khan', 'Dept of Civil Engg'),
(160, '13PWCIV390', 'Salman Hameed', 'Dept of Civil Engg'),
(161, '13PWCIV390', 'Abdul Wahid', 'Dept of Civil Engg'),
(162, '13PWELE429', 'Bilal Ahmad Abbasi', 'Dept of Electrical Engg'),
(163, '13PWCIV390', 'Wajid Ali', 'Dept of Civil Engg'),
(164, '13PWCIV393', 'Touqeer Hayat', 'Dept of Civil Engg'),
(165, '13PWCIV401', 'Subhan Ullah', 'Dept of Civil Engg'),
(166, '13PWCIV394', 'S. Shah Hasnain', 'Dept of Civil Engg'),
(167, '13PWAGR068', 'Zakir Khan', 'Dept of Agricultural Engg'),
(168, '13PWCIV393', 'Atta Ullah', 'Dept of Civil Engg'),
(169, '13PWCIV389', 'Hamid Qazi', 'Dept of Civil Engg'),
(170, '13PWCIV389', 'S. Ali Haider Shah', 'Dept of Civil Engg'),
(171, '13PWCIV389', 'Talha Javed', 'Dept of Civil Engg'),
(172, '13PWCIV396', 'M. Zeeshan Khan', 'Dept of Civil Engg'),
(173, '13PWCIV403', 'Muhammad Ishfaq', 'Dept of Civil Engg'),
(174, '13PWCIV403', 'Sadeequllah .', 'Dept of Civil Engg'),
(175, '13PWELE428', 'Fakherudin .', 'Dept of Electrical Engg'),
(176, '13PWELE430', 'M. Durri Aqil', 'Dept of Electrical Engg'),
(177, '13PWCHE082', 'Osama Rabi', 'Dept of Chemical Engg'),
(178, '13PWCHE084', 'M. Adnan', 'Dept of Chemical Engg'),
(179, '13PWCSE110', 'Arsalan Khan', 'Dept of Computer System Engg'),
(180, '13PWELE428', 'Zeeshan Dildar', 'Dept of Electrical Engg'),
(181, '13PWELE433', 'M. Aamir Qureshi', 'Dept of Electrical Engg'),
(182, '13PWELE434', 'Asad Ali', 'Dept of Electrical Engg'),
(183, '13PWELE432', 'Salman Khan', 'Dept of Electrical Engg'),
(184, '13PWELE437', 'Adnan Khan', 'Dept of Electrical Engg'),
(185, '13PWCSE108', 'Awais Khan', 'Dept of Computer System Engg'),
(186, '13PWELE434', 'Hikmat Ullah', 'Dept of Electrical Engg'),
(187, '13PWCHE081', 'Khizar Ayaz', 'Dept of Chemical Engg'),
(188, '13PWMEC352', 'M. Waqar', 'Dept of Mechanical Engg'),
(189, '13PWMEC352', 'Danyal Ahmed', 'Dept of Mechanical Engg'),
(190, '13PWMEC350', 'Hamza Pervez', 'Dept of Mechanical Engg'),
(191, '13PWMEC354', 'S. Abdul Basit Shah', 'Dept of Mechanical Engg'),
(192, '13PWCSE110', 'Muhammad Umar Danial', 'Dept of Computer System Engg'),
(193, '13PWMEC350', 'Daniyal Qazi', 'Dept of Mechanical Engg'),
(194, '13PWCHE082', 'Yasir Gul', 'Dept of Chemical Engg'),
(195, '13PWMEC353', 'Arslan Rahat Sultan', 'Dept of Mechanical Engg'),
(196, '13PWMEC353', 'Habib Ullah', 'Dept of Mechanical Engg'),
(197, '13PWMEC353', 'Adnan Ayaz', 'Dept of Mechanical Engg'),
(198, '13PWMEC354', 'Hussain Ahmad', 'Dept of Mechanical Engg'),
(199, '13PWMEC353', 'Zeeshan .', 'Dept of Mechanical Engg'),
(200, '13PWMEC357', 'Umer Raouf', 'Dept of Mechanical Engg'),
(201, '13PWMEC357', 'Shafi Ullah', 'Dept of Mechanical Engg'),
(202, '13PWMEC359', 'Ihsanullah .', 'Dept of Mechanical Engg'),
(203, '13PWMEC350', 'Ihsan -Ul-Haq', 'Dept of Mechanical Engg'),
(204, '13PWMEC351', 'Waqar Ullah', 'Dept of Mechanical Engg'),
(205, '13PWMEC357', 'Zakir M.', 'Dept of Mechanical Engg'),
(206, '13PWCHE082', 'Ihsan-Ur-Rahman .', 'Dept of Chemical Engg'),
(207, '13PWCHE080', 'Abdullah Shah', 'Dept of Chemical Engg'),
(208, '13PWAGR069', 'Maaz .', 'Dept of Agricultural Engg'),
(209, '13PWCHE080', 'Saad Bin Saeed', 'Dept of Chemical Engg'),
(210, '13PWMEC359', 'M. Husnain Shakir', 'Dept of Mechanical Engg'),
(211, '13PWCHE080', 'Shakeel Ahmad', 'Dept of Chemical Engg'),
(212, '13PWCHE081', 'M. Aftab Khan', 'Dept of Chemical Engg'),
(213, '13PWCHE084', 'Bakhtawar Shah', 'Dept of Chemical Engg'),
(214, '13PWCHE081', 'M. Shakir Hussain', 'Dept of Chemical Engg'),
(215, '13PWELE433', 'M. Umer Farooq', 'Dept of Electrical Engg'),
(216, '13PWCSE107', 'Alam Khan', 'Dept of Computer System Engg'),
(217, '13PWCSE106', 'Azaz Ali', 'Dept of Computer System Engg'),
(218, '13PWCSE110', 'Muhammad Ibrahim', 'Dept of Computer System Engg'),
(219, '13PWCSE109', 'Hamza .', 'Dept of Computer System Engg'),
(220, '13PWCIV393', 'Wakil Ahmad', 'Dept of Civil Engg'),
(221, '13PWCSE105', 'Talha Yousaf', 'Dept of Computer System Engg'),
(222, '13PWCSE105', 'Imran Khan', 'Dept of Computer System Engg'),
(223, '13PWELE428', 'Atta Ur Rehman', 'Dept of Electrical Engg'),
(224, '13PWMCT028', 'Ihsan .', 'Dept of Mechatronics Engg'),
(225, '13PWIND024', 'Tauseef .', 'Dept of Industrial Engg'),
(226, '13PWIND022', 'Shahab Ud Din Khattak', 'Dept of Industrial Engg'),
(227, '13PWMCT026', 'Umar Abbas', 'Dept of Mechatronics Engg'),
(228, '13PWMCT027', 'M. Kamran Ahmed Khan', 'Dept of Mechatronics Engg'),
(229, '13PWMCT029', 'Awais Ahmad', 'Dept of Mechatronics Engg'),
(230, '13PWMIN068', 'Ahmad Ullah', 'Dept of Mining Engg'),
(231, '13PWMIN067', 'Aamir Iqbal', 'Dept of Mining Engg'),
(232, '13PWMIN069', 'Muhammad Owais', 'Dept of Mining Engg'),
(233, '13PWAGR068', 'Bilal Khan', 'Dept of Agricultural Engg'),
(234, '13PWAGR069', 'Mir Ikram Ullah Jan', 'Dept of Agricultural Engg'),
(235, '13PWAGR069', 'Nadir Sher', 'Dept of Agricultural Engg'),
(236, '13PWBCS035', 'Sayyed Asim Ullah Jan', 'Dept of CS and IT'),
(237, '13PWBCS037', 'Abdullah .', 'Dept of CS and IT'),
(238, '13PWBCS037', 'Muhammad Mohsin', 'Dept of CS and IT'),
(239, '12PWMEC338', 'Hilal Jamal', 'Dept of Mechanical Engg'),
(240, '12PWMEC333', 'Rehman Ullah', 'Dept of Mechanical Engg'),
(241, '12PWMEC336', 'Zakir Ullah', 'Dept of Mechanical Engg');

-- --------------------------------------------------------

--
-- Table structure for table `usr_user`
--

CREATE TABLE `usr_user` (
  `USER_ID` int(11) NOT NULL,
  `USER_NAME` varchar(100) NOT NULL,
  `U_PASSWORD` varchar(500) NOT NULL,
  `EMP_NO` varchar(20) DEFAULT NULL,
  `IS_ACTIVE` varchar(1) NOT NULL,
  `GROUP_ID` int(11) NOT NULL,
  `E_USER_ID` int(11) DEFAULT NULL,
  `EUSERLOG_ID` int(11) DEFAULT NULL,
  `E_DATE_TIME` datetime DEFAULT NULL,
  `U_USER_ID` int(11) DEFAULT NULL,
  `UUSERLOG_ID` int(11) DEFAULT NULL,
  `U_DATE_TIME` datetime DEFAULT NULL,
  `FLAG` varchar(100) DEFAULT NULL,
  `SUP_ADMIN` varchar(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `usr_user`
--

INSERT INTO `usr_user` (`USER_ID`, `USER_NAME`, `U_PASSWORD`, `EMP_NO`, `IS_ACTIVE`, `GROUP_ID`, `E_USER_ID`, `EUSERLOG_ID`, `E_DATE_TIME`, `U_USER_ID`, `UUSERLOG_ID`, `U_DATE_TIME`, `FLAG`, `SUP_ADMIN`) VALUES
(1, 'superadmin', '17c4520f6cfd1ab53d8745e84681eb49', '0', '1', 0, 0, NULL, '2014-03-24 23:40:55', 1, 2646, '2016-01-18 14:54:03', NULL, 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `usr_user_copy`
--

CREATE TABLE `usr_user_copy` (
  `USER_ID` int(11) NOT NULL,
  `USER_NAME` varchar(100) NOT NULL,
  `U_PASSWORD` varchar(500) NOT NULL,
  `EMP_NO` varchar(20) DEFAULT NULL,
  `IS_ACTIVE` varchar(1) NOT NULL,
  `GROUP_ID` int(11) NOT NULL,
  `E_USER_ID` int(11) DEFAULT NULL,
  `EUSERLOG_ID` int(11) DEFAULT NULL,
  `E_DATE_TIME` datetime DEFAULT NULL,
  `U_USER_ID` int(11) DEFAULT NULL,
  `UUSERLOG_ID` int(11) DEFAULT NULL,
  `U_DATE_TIME` datetime DEFAULT NULL,
  `FLAG` varchar(100) DEFAULT NULL,
  `SUP_ADMIN` varchar(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `usr_user_copy`
--

INSERT INTO `usr_user_copy` (`USER_ID`, `USER_NAME`, `U_PASSWORD`, `EMP_NO`, `IS_ACTIVE`, `GROUP_ID`, `E_USER_ID`, `EUSERLOG_ID`, `E_DATE_TIME`, `U_USER_ID`, `UUSERLOG_ID`, `U_DATE_TIME`, `FLAG`, `SUP_ADMIN`) VALUES
(1, 'superadmin', '17c4520f6cfd1ab53d8745e84681eb49', '0', '1', 0, 0, NULL, '2014-03-24 23:40:55', 1, 2646, '2016-01-18 14:54:03', NULL, 'Y');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `charges`
--
ALTER TABLE `charges`
  ADD PRIMARY KEY (`CHARGE_ID`);

--
-- Indexes for table `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`INVOICE_NO`);

--
-- Indexes for table `invoice_log`
--
ALTER TABLE `invoice_log`
  ADD PRIMARY KEY (`INVOICE_LOG_ID`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`STUDENT_ID`);

--
-- Indexes for table `usr_user`
--
ALTER TABLE `usr_user`
  ADD PRIMARY KEY (`USER_ID`),
  ADD UNIQUE KEY `UK_USER_NAME` (`USER_NAME`) USING BTREE,
  ADD KEY `FK_usr_user_hrm_employees_emp_no` (`EMP_NO`) USING BTREE,
  ADD KEY `FK_usr_user_usr_group_group_id` (`GROUP_ID`) USING BTREE,
  ADD KEY `fk_usr_user_e_user_id_userlog_id` (`EUSERLOG_ID`,`E_USER_ID`) USING BTREE,
  ADD KEY `fk_usr_user_u_user_id_userlog_id` (`UUSERLOG_ID`,`U_USER_ID`) USING BTREE;

--
-- Indexes for table `usr_user_copy`
--
ALTER TABLE `usr_user_copy`
  ADD PRIMARY KEY (`USER_ID`),
  ADD UNIQUE KEY `UK_USER_NAME` (`USER_NAME`),
  ADD KEY `FK_usr_user_hrm_employees_emp_no` (`EMP_NO`),
  ADD KEY `FK_usr_user_usr_group_group_id` (`GROUP_ID`),
  ADD KEY `fk_usr_user_e_user_id_userlog_id` (`EUSERLOG_ID`,`E_USER_ID`),
  ADD KEY `fk_usr_user_u_user_id_userlog_id` (`UUSERLOG_ID`,`U_USER_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `charges`
--
ALTER TABLE `charges`
  MODIFY `CHARGE_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `invoice_log`
--
ALTER TABLE `invoice_log`
  MODIFY `INVOICE_LOG_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;
--
-- AUTO_INCREMENT for table `student`
--
ALTER TABLE `student`
  MODIFY `STUDENT_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=242;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
