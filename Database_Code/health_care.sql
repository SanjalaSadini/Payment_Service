-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 06, 2020 at 12:42 PM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `health_care`
--

-- --------------------------------------------------------

--
-- Table structure for table `appoinment`
--

CREATE TABLE `appoinment` (
  `appoinment_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `time` varchar(10) COLLATE utf8_bin NOT NULL,
  `patient_patient_id` int(11) NOT NULL,
  `doctor_doc_id` int(11) NOT NULL,
  `hospital_hosp_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `appoinment`
--

INSERT INTO `appoinment` (`appoinment_id`, `date`, `time`, `patient_patient_id`, `doctor_doc_id`, `hospital_hosp_id`) VALUES
(1, '2020-05-13', '10.00 am', 1, 2, 1),
(2, '2020-06-09', '9.00am', 4, 3, 5),
(3, '2020-04-30', '1.00 pm', 2, 2, 2),
(4, '2020-07-29', '12.00 am', 1, 1, 1),
(5, '2020-05-02', '4.00 pm', 4, 3, 4),
(6, '2020-06-23', '9.45 am', 5, 4, 2),
(7, '2020-06-30', '5.00 pm', 3, 5, 3);

-- --------------------------------------------------------

--
-- Table structure for table `doctor`
--

CREATE TABLE `doctor` (
  `doc_id` int(11) NOT NULL,
  `doc_nic` varchar(45) COLLATE utf8_bin NOT NULL,
  `doc_fname` varchar(45) COLLATE utf8_bin NOT NULL,
  `doc_lname` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `doc_email` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `doc_gender` varchar(45) COLLATE utf8_bin NOT NULL,
  `liscen_no_` varchar(45) COLLATE utf8_bin NOT NULL,
  `specialization` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `phone` varchar(45) COLLATE utf8_bin NOT NULL,
  `doc_charge` float NOT NULL,
  `user_user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `doctor`
--

INSERT INTO `doctor` (`doc_id`, `doc_nic`, `doc_fname`, `doc_lname`, `doc_email`, `doc_gender`, `liscen_no_`, `specialization`, `phone`, `doc_charge`, `user_user_id`) VALUES
(1, '567218634V', 'Dr Suu', 'Leeniyagoda', 'suu65@gmail.com', 'Female', 'D764364', 'Dentist', '0776545222', 1200, 6),
(2, '408735678V', 'Dr Sasini', 'De silva', 'sasi@gmail.com', 'Female', 'D765645', 'Cardinology', '0775432123', 1500, 7),
(3, '645678987V', 'Dr Sameera', 'Weerathunga', 'sameera@gmail.com', 'Male', 'D098765', 'Cardiac Sergeon', '0786756456', 1000, 8),
(4, '404765123V', 'Dr Dinesh', 'Weerasinghe', 'dinesh@gmail.com', 'Male', 'D765432', 'Endrology', '0771423555', 1300, 9),
(5, '635454677V', 'Dr Hashini ', 'Perera', 'hasini@gmail.com', 'Female', 'D986543', 'Cardiology', '0771423555', 1800, 10);

-- --------------------------------------------------------

--
-- Table structure for table `doctor_has_hospital`
--

CREATE TABLE `doctor_has_hospital` (
  `doctor_doc_id` int(11) NOT NULL,
  `hospital_hosp_id` int(11) NOT NULL,
  `date` varchar(20) COLLATE utf8_bin NOT NULL,
  `time` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `doctor_has_hospital`
--

INSERT INTO `doctor_has_hospital` (`doctor_doc_id`, `hospital_hosp_id`, `date`, `time`) VALUES
(1, 3, 'Wednesday', '11:00:00'),
(2, 4, 'Sunday', '16:30:00'),
(3, 1, 'Monday', '16:00:00'),
(3, 2, 'Saturday', '11:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `hospital`
--

CREATE TABLE `hospital` (
  `hosp_id` int(11) NOT NULL,
  `hosp_name` varchar(45) COLLATE utf8_bin NOT NULL,
  `hosp_address` varchar(100) COLLATE utf8_bin NOT NULL,
  `hosp_email` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `hosp_phone` varchar(12) COLLATE utf8_bin NOT NULL,
  `hosp_reg_date` date NOT NULL,
  `hosp_charge` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `hospital`
--

INSERT INTO `hospital` (`hosp_id`, `hosp_name`, `hosp_address`, `hosp_email`, `hosp_phone`, `hosp_reg_date`, `hosp_charge`) VALUES
(1, 'Hemas Hospital', 'Hemas Hospital, Colombo', 'hemas@gmail.com', '0114534234', '2020-02-02', 2000),
(2, 'Southern', 'Hakmana rd, Mathara', 'southern@gmail.com', '0948876543', '2019-10-07', 1000),
(3, 'Celon Health', 'Ambalangoda Rd, Alpitiya', 'celon@gmail.com', '0912267543', '2019-01-10', 950),
(4, 'Ruhunu Hospital', 'Karapitiya Rd,Galle', 'ruhunu@gmail.com', '0917765456', '2018-08-15', 1100),
(5, 'NIiroga Hospital', 'Thihalgoda Rd,Mathara', 'niroga@gmail.com', '0917789899', '2020-01-14', 850);

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
  `patient_id` int(11) NOT NULL,
  `p_nic` varchar(45) COLLATE utf8_bin NOT NULL,
  `p_fname` varchar(45) COLLATE utf8_bin NOT NULL,
  `p_lname` varchar(45) COLLATE utf8_bin NOT NULL,
  `p_dob` date NOT NULL,
  `p_address` varchar(100) COLLATE utf8_bin NOT NULL,
  `p_phone` varchar(45) COLLATE utf8_bin NOT NULL,
  `p_email` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `p_gender` varchar(45) COLLATE utf8_bin NOT NULL,
  `user_user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`patient_id`, `p_nic`, `p_fname`, `p_lname`, `p_dob`, `p_address`, `p_phone`, `p_email`, `p_gender`, `user_user_id`) VALUES
(1, '987200499V', 'Shalini', 'Perera', '1998-08-07', '611,Station road, Wattala', '0712054147', 'shalinip437@gmail.com', 'female', 1),
(2, '976535656V', 'Kamal', 'Fernando', '1997-01-03', 'no 252,Hekitta road , Piliyandala', '0763412678', 'kamal@gmail.com', 'male', 2),
(3, '917283765V', 'Supun', 'Kariyawasam', '1991-02-03', 'no 9, dulupitiya road, mattakkuliya', '0724534934', 'supun@gmail.com', 'male', 3),
(4, '678251622V', 'Devon', 'Samith', '1965-05-08', 'no 12,Egodauyana road,Moratuwa', '0789765456', 'devon@gmail.com', 'male', 4),
(5, '987654321V', 'Nimal', 'Perera', '1999-09-09', 'No 5, Station Rd,Ragama', '0712244141', 'nimal@gmail.com', 'male', 5);

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `payment_id` int(11) NOT NULL,
  `card_type` varchar(45) COLLATE utf8_bin NOT NULL,
  `card_number` varchar(45) COLLATE utf8_bin NOT NULL,
  `name_on_card` varchar(45) COLLATE utf8_bin NOT NULL,
  `cvc` varchar(45) COLLATE utf8_bin NOT NULL,
  `expire_date` date NOT NULL,
  `status` varchar(45) COLLATE utf8_bin NOT NULL,
  `sub_amount` double NOT NULL,
  `date` date NOT NULL,
  `tax_tax_id` int(11) NOT NULL,
  `appoinment_appoinment_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`payment_id`, `card_type`, `card_number`, `name_on_card`, `cvc`, `expire_date`, `status`, `sub_amount`, `date`, `tax_tax_id`, `appoinment_appoinment_id`) VALUES
(1, 'master', '74541233', 'Shalini Perera', '545', '2022-02-01', 'done', 4600, '2020-05-10', 5, 1),
(2, 'visa', '98675432', 'Devon Samith', '876', '2023-02-01', 'done', 2950, '2020-06-08', 6, 2),
(3, 'visa', '98675432', 'Kamal fernando', '432', '2023-02-01', 'done', 3600, '2020-04-29', 5, 3),
(4, 'master', '74541233', 'Shalini Perera', '545', '2023-02-01', 'done', 4300, '2020-07-28', 6, 4),
(5, 'visa', '98675432', 'Devon Samith', '876', '2023-02-01', 'done', 4300, '2020-05-01', 5, 5),
(6, 'master', '7777', 'amila', '772', '2022-06-02', 'done', 3400, '2020-04-03', 5, 6);

-- --------------------------------------------------------

--
-- Table structure for table `tax`
--

CREATE TABLE `tax` (
  `tax_id` int(11) NOT NULL,
  `tax_amount` float NOT NULL,
  `valid_from` date NOT NULL,
  `valid_to` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `tax`
--

INSERT INTO `tax` (`tax_id`, `tax_amount`, `valid_from`, `valid_to`) VALUES
(2, 1000, '2020-01-01', '2020-02-01'),
(3, 1100, '2020-02-01', '2020-03-01'),
(4, 1100, '2020-03-02', '2020-04-01'),
(5, 1100, '2020-04-02', '2020-06-01'),
(6, 1100, '2020-06-02', '2020-08-01'),
(7, 2000, '2020-10-10', '2020-11-10'),
(8, 1000, '2020-11-10', '2020-12-10'),
(9, 1000, '2020-11-10', '2020-12-10');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(45) COLLATE utf8_bin NOT NULL,
  `password` varchar(10) COLLATE utf8_bin NOT NULL,
  `user_type` varchar(45) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `user_name`, `password`, `user_type`) VALUES
(1, 'Shalini', 'shalini123', 'Patient'),
(2, 'Kamal', 'kamal123', 'Patient'),
(3, 'Supun', 'supun999', 'Patient'),
(4, 'Devon', 'devon/333', 'Patient'),
(5, 'Nimal', 'nimal888', 'Patient'),
(6, 'suu', 'suu65', 'Doctor'),
(7, 'Sasini', 'sasini60', 'Doctor'),
(8, 'Sameera', 'sam50', 'Doctor'),
(9, 'Dinesh', 'dinesh83', 'Doctor'),
(10, 'Hasini', 'hash84', 'Doctor');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appoinment`
--
ALTER TABLE `appoinment`
  ADD PRIMARY KEY (`appoinment_id`,`patient_patient_id`,`doctor_doc_id`,`hospital_hosp_id`),
  ADD KEY `fk_appoinment_patient1_idx` (`patient_patient_id`),
  ADD KEY `fk_appoinment_doctor1_idx` (`doctor_doc_id`),
  ADD KEY `fk_appoinment_hospital1_idx` (`hospital_hosp_id`);

--
-- Indexes for table `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`doc_id`,`user_user_id`),
  ADD KEY `fk_doctor_user1` (`user_user_id`);

--
-- Indexes for table `doctor_has_hospital`
--
ALTER TABLE `doctor_has_hospital`
  ADD PRIMARY KEY (`doctor_doc_id`,`hospital_hosp_id`),
  ADD KEY `fk_doctor_has_hospital_hospital1_idx` (`hospital_hosp_id`),
  ADD KEY `fk_doctor_has_hospital_doctor1_idx` (`doctor_doc_id`);

--
-- Indexes for table `hospital`
--
ALTER TABLE `hospital`
  ADD PRIMARY KEY (`hosp_id`);

--
-- Indexes for table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`patient_id`,`user_user_id`),
  ADD KEY `fk_patient_user_idx` (`user_user_id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`payment_id`,`tax_tax_id`,`appoinment_appoinment_id`),
  ADD KEY `fk_payment_tax1_idx` (`tax_tax_id`),
  ADD KEY `fk_payment_appoinment1_idx` (`appoinment_appoinment_id`);

--
-- Indexes for table `tax`
--
ALTER TABLE `tax`
  ADD PRIMARY KEY (`tax_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appoinment`
--
ALTER TABLE `appoinment`
  MODIFY `appoinment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `doctor`
--
ALTER TABLE `doctor`
  MODIFY `doc_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `hospital`
--
ALTER TABLE `hospital`
  MODIFY `hosp_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `patient`
--
ALTER TABLE `patient`
  MODIFY `patient_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tax`
--
ALTER TABLE `tax`
  MODIFY `tax_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appoinment`
--
ALTER TABLE `appoinment`
  ADD CONSTRAINT `fk_appoinment_doctor1` FOREIGN KEY (`doctor_doc_id`) REFERENCES `doctor` (`doc_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_appoinment_hospital1` FOREIGN KEY (`hospital_hosp_id`) REFERENCES `hospital` (`hosp_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_appoinment_patient1` FOREIGN KEY (`patient_patient_id`) REFERENCES `patient` (`patient_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `doctor`
--
ALTER TABLE `doctor`
  ADD CONSTRAINT `fk_doctor_user1` FOREIGN KEY (`user_user_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `doctor_has_hospital`
--
ALTER TABLE `doctor_has_hospital`
  ADD CONSTRAINT `fk_doctor_has_hospital_doctor1` FOREIGN KEY (`doctor_doc_id`) REFERENCES `doctor` (`doc_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_doctor_has_hospital_hospital1` FOREIGN KEY (`hospital_hosp_id`) REFERENCES `hospital` (`hosp_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `patient`
--
ALTER TABLE `patient`
  ADD CONSTRAINT `fk_patient_user` FOREIGN KEY (`user_user_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `fk_payment_appoinment1` FOREIGN KEY (`appoinment_appoinment_id`) REFERENCES `appoinment` (`appoinment_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_payment_tax1` FOREIGN KEY (`tax_tax_id`) REFERENCES `tax` (`tax_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
