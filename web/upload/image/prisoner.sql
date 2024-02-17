-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 26, 2019 at 08:55 AM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `prisoner`
--

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE `account` (
  `id` int(11) NOT NULL,
  `serial_no` varchar(200) NOT NULL,
  `username` varchar(300) NOT NULL,
  `password` varchar(200) NOT NULL,
  `zone` varchar(300) NOT NULL,
  `account_type` varchar(300) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`id`, `serial_no`, `username`, `password`, `zone`, `account_type`, `status`) VALUES
(27, '45321', 'biks', 'Biks1234', 'kamatch', 'comissioner', 1),
(107, '12', 'admin', 'Biks1234', 'assosa', 'adminstrator', 1),
(123, '12345', 'bantalem', 'Biks12345', 'kamatch', 'policeofficer', 1),
(124, '1', 'bihon', 'Biks1234', 'kamatch', 'inspector', 1);

-- --------------------------------------------------------

--
-- Table structure for table `admin_info`
--

CREATE TABLE `admin_info` (
  `serial_no` varchar(300) NOT NULL,
  `fname` varchar(300) NOT NULL,
  `lname` varchar(200) NOT NULL,
  `sex` varchar(20) NOT NULL,
  `age` int(11) NOT NULL,
  `photo` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin_info`
--

INSERT INTO `admin_info` (`serial_no`, `fname`, `lname`, `sex`, `age`, `photo`) VALUES
('12', 'biks', 'setegn', 'male', 21, 'IMG_20190323_105822.jpg'),
('4356', 'ban', 'asmare', 'female', 28, 'assosa.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `admin_message`
--

CREATE TABLE `admin_message` (
  `id` int(11) NOT NULL,
  `sender` varchar(300) NOT NULL,
  `message` text NOT NULL,
  `zone` varchar(300) NOT NULL,
  `status` int(11) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin_message`
--

INSERT INTO `admin_message` (`id`, `sender`, `message`, `zone`, `status`, `date`) VALUES
(4, 'policeofficer', 'please call me', 'assosa', 1, '2019-06-16'),
(5, 'comissioner', 'ggg', 'assosa', 1, '2019-06-16');

-- --------------------------------------------------------

--
-- Table structure for table `comissioner_information`
--

CREATE TABLE `comissioner_information` (
  `fname` varchar(300) NOT NULL,
  `serial_no` varchar(200) NOT NULL,
  `lname` varchar(200) NOT NULL,
  `sex` varchar(20) NOT NULL,
  `age` int(11) NOT NULL,
  `zone` varchar(300) NOT NULL,
  `photo` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `comissioner_information`
--

INSERT INTO `comissioner_information` (`fname`, `serial_no`, `lname`, `sex`, `age`, `zone`, `photo`) VALUES
('pice', '45321', 'loveeeee', 'male', 0, 'assosa', 'flag.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `comissioner_message`
--

CREATE TABLE `comissioner_message` (
  `id` int(11) NOT NULL,
  `sender` varchar(500) NOT NULL,
  `message` text NOT NULL,
  `zone` varchar(300) NOT NULL,
  `date` date NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `comissioner_message`
--

INSERT INTO `comissioner_message` (`id`, `sender`, `message`, `zone`, `date`, `status`) VALUES
(1, 'inspector', 'god is love ', '', '2019-03-23', 1),
(17, 'policeofficer', 'please call me back', 'assosa', '2019-06-16', 1);

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `id` int(11) NOT NULL,
  `sender` varchar(300) NOT NULL,
  `comment` text NOT NULL,
  `date` date NOT NULL,
  `zone` varchar(300) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`id`, `sender`, `comment`, `date`, `zone`, `status`) VALUES
(6, '3434', 'dedede', '2019-03-24', 'kamatch', 1),
(7, '3434', 'thanks for accepting ', '2019-03-24', 'kamatch', 1),
(8, '12', 'haw was ', '2019-06-16', 'assosa', 0);

-- --------------------------------------------------------

--
-- Table structure for table `forgive`
--

CREATE TABLE `forgive` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `serial_no` varchar(200) NOT NULL,
  `zone` varchar(100) NOT NULL,
  `description` varchar(5000) NOT NULL,
  `status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `forgive`
--

INSERT INTO `forgive` (`id`, `date`, `serial_no`, `zone`, `description`, `status`) VALUES
(1, '2019-03-24', '3434', 'kamatch', 'I want to go to other prison office', '1'),
(2, '2019-05-23', '12', 'assosa', 'biks ', '1'),
(3, '2019-05-26', '3232', 'kamatch', 'fg', '1'),
(4, '2019-05-26', '12', 'assosa', 'hay ', '1'),
(5, '2019-06-18', '12345', 'kamatch', 'g', '0'),
(6, '2019-06-18', '12345', 'kamatch', 'dfr', '0');

-- --------------------------------------------------------

--
-- Table structure for table `inspector_information`
--

CREATE TABLE `inspector_information` (
  `serial_no` varchar(300) NOT NULL,
  `fname` varchar(300) NOT NULL,
  `lname` varchar(300) NOT NULL,
  `sex` varchar(100) NOT NULL,
  `age` int(11) NOT NULL,
  `zone` varchar(300) NOT NULL,
  `photo` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `inspector_information`
--

INSERT INTO `inspector_information` (`serial_no`, `fname`, `lname`, `sex`, `age`, `zone`, `photo`) VALUES
('1', 'bihonegn', 'andarge', 'male', 25, 'kamatch', 'assosa.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `inspector_message`
--

CREATE TABLE `inspector_message` (
  `id` int(11) NOT NULL,
  `sender` varchar(300) NOT NULL,
  `message` text NOT NULL,
  `zone` varchar(300) NOT NULL,
  `status` int(11) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `inspector_message`
--

INSERT INTO `inspector_message` (`id`, `sender`, `message`, `zone`, `status`, `date`) VALUES
(3, 'adminstrator', 'god is love', 'metekel', 0, '2018-04-04'),
(5, 'comissioner', 'goooog', 'kamatch', 1, '2018-04-29'),
(6, 'comissioner', 'buy', 'assosa', 1, '2019-06-16');

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `id` int(11) NOT NULL,
  `description` varchar(300) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`id`, `description`, `date`) VALUES
(17, 'in Ethiopia all prison office are peace full today', '2019-03-22'),
(18, 'dghjfgjg', '2019-05-06'),
(19, ' today there is some conflict in metekel zone', '2019-06-16'),
(20, 'peace', '2019-06-18');

-- --------------------------------------------------------

--
-- Table structure for table `policeofficer_information`
--

CREATE TABLE `policeofficer_information` (
  `fname` varchar(200) NOT NULL,
  `lname` varchar(200) NOT NULL,
  `serial_no` varchar(200) NOT NULL,
  `sex` varchar(200) NOT NULL,
  `age` varchar(300) NOT NULL,
  `zone` varchar(300) NOT NULL,
  `photo` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `policeofficer_information`
--

INSERT INTO `policeofficer_information` (`fname`, `lname`, `serial_no`, `sex`, `age`, `zone`, `photo`) VALUES
('bantalem', 'andargie', '12345', 'male', '23', 'kamatch', 'assosa.png'),
('abebe', 'asmare', '3679', 'female', '28', 'metekel', 'assosa.jpg'),
('bantalem', 'asmare', '3683', 'female', '25', 'kamatch', 'assosa.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `policeofficer_message`
--

CREATE TABLE `policeofficer_message` (
  `id` int(11) NOT NULL,
  `sender` varchar(300) NOT NULL,
  `message` text NOT NULL,
  `zone` varchar(300) NOT NULL,
  `status` int(11) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `policeofficer_message`
--

INSERT INTO `policeofficer_message` (`id`, `sender`, `message`, `zone`, `status`, `date`) VALUES
(4, 'inspector', 'mare', 'kamatch', 1, '2019-03-20'),
(9, 'comissioner', 'your forgive is accepted!', '', 1, '2019-05-26');

-- --------------------------------------------------------

--
-- Table structure for table `prisoner_information`
--

CREATE TABLE `prisoner_information` (
  `serial_no` varchar(300) NOT NULL,
  `fname` varchar(300) NOT NULL,
  `mname` varchar(200) NOT NULL,
  `lname` varchar(300) NOT NULL,
  `sex` varchar(20) NOT NULL,
  `age` int(11) NOT NULL,
  `zone` varchar(300) NOT NULL,
  `height` double NOT NULL,
  `face_color` varchar(200) NOT NULL,
  `photo` text NOT NULL,
  `education_level` varchar(200) NOT NULL,
  `region` varchar(200) NOT NULL,
  `crimetype` varchar(300) NOT NULL,
  `parent_phone` varchar(13) NOT NULL,
  `tsp` date NOT NULL,
  `tcp` date NOT NULL,
  `dorm_no` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `prisoner_information`
--

INSERT INTO `prisoner_information` (`serial_no`, `fname`, `mname`, `lname`, `sex`, `age`, `zone`, `height`, `face_color`, `photo`, `education_level`, `region`, `crimetype`, `parent_phone`, `tsp`, `tcp`, `dorm_no`) VALUES
('1512', 'bihonegn', 'andargie', 'tesema', 'male', 23, 'kamatch', 1.8, 'black', 'IMG_20190307_110446.jpg', 'degree', 'amhara', 'leba', '+251937340430', '2019-06-18', '2039-06-18', 5),
('2121', 'biks', 'sisay', 'shumie', 'male', 23, 'kamatch', 2.3, 'black', 'IMG_20190307_110413.jpg', 'degree', 'tigray', 'leba', '+251937340430', '2019-06-17', '2023-06-17', 5),
('22222', 'abe', 'kebede', 'de', 'male', 23, 'kamatch', 1.5, 'black', 'IMG_20190323_091629.jpg', 'degree', 'tigray', 'leba', '+251937340430', '2019-06-18', '2023-06-18', 6),
('444455', 'abebu', 'gelaw', 'bantalem', 'female', 23, 'kamatch', 2.5, 'black', 'assosa 1.jpg', 'degree', 'afar', 'leba', '+251987654323', '2019-06-04', '2020-01-04', 4),
('444456', 'alemu', 'aseres', 'dejen', 'male', 56, 'kamatch', 2, 'black', 'assosa 1.jpg', 'degree', 'tigray', 'leba', '+251947483647', '2019-05-22', '2029-05-22', 4),
('6745', 'abebe', 'gelaw', 'bantalem', 'male', 23, 'assosa', 2.5, 'black', 'untitled.png', 'degree', 'tigray', 'leba', '+251998754323', '2019-05-26', '2026-05-26', 4);

-- --------------------------------------------------------

--
-- Table structure for table `prisoner_message`
--

CREATE TABLE `prisoner_message` (
  `id` int(11) NOT NULL,
  `sender` varchar(300) NOT NULL,
  `reciver` varchar(300) NOT NULL,
  `message` varchar(400) NOT NULL,
  `Date` date NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `prisoner_message`
--

INSERT INTO `prisoner_message` (`id`, `sender`, `reciver`, `message`, `Date`, `status`) VALUES
(16, 'inspector', '1223333', 'you are transfered from&nbsp;kamatch to metekel', '2019-06-08', 0),
(17, 'inspector', '1223333', 'you are transfered from&nbsp;kamatch to assosa', '2019-06-16', 0);

-- --------------------------------------------------------

--
-- Table structure for table `schedule`
--

CREATE TABLE `schedule` (
  `orderedtype` varchar(300) NOT NULL,
  `eating_time` varchar(200) NOT NULL,
  `monday` varchar(200) NOT NULL,
  `tusday` varchar(200) NOT NULL,
  `wednsday` varchar(200) NOT NULL,
  `thursday` varchar(200) NOT NULL,
  `friday` varchar(200) NOT NULL,
  `saturday` varchar(200) NOT NULL,
  `sunday` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `schedule`
--

INSERT INTO `schedule` (`orderedtype`, `eating_time`, `monday`, `tusday`, `wednsday`, `thursday`, `friday`, `saturday`, `sunday`) VALUES
('erat', '11:30 am-1:00 pm', 'atklt', 'shiro', 'keywet', 'pasta', 'shiro', 'pasta', 'shiro'),
('kurs', '12:30 am-2:00 am', 'rice', 'firfr', 'rice', 'firfr', 'firfr', 'rice', 'rice'),
('misa', '5:30 am-7:00 am', 'pasta', 'qeywet', 'qeywet', 'qeywet', 'qeywet', 'qeywet', 'qeywet');

-- --------------------------------------------------------

--
-- Table structure for table `t`
--

CREATE TABLE `t` (
  `id` int(11) NOT NULL,
  `serial_no` varchar(200) NOT NULL,
  `password` varchar(66) NOT NULL,
  `status` int(11) NOT NULL,
  `username` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t`
--

INSERT INTO `t` (`id`, `serial_no`, `password`, `status`, `username`) VALUES
(1, '1011', 'mCT81s', 0, ''),
(2, '445', 'If9nS1', 0, ''),
(3, '', '', 0, ''),
(4, '', '', 0, ''),
(5, '', '', 0, ''),
(6, '', '', 0, ''),
(7, '', '', 0, ''),
(8, '2323', 'kCmD73', 0, ''),
(9, '494', 'M1sk3A', 0, ''),
(10, '045', 'ae68TB', 0, ''),
(11, '44445', 'V0C6tz', 0, ''),
(12, '3434', 'e3Uk4I', 0, ''),
(13, '6745', 'TuP60q', 0, ''),
(14, '123', '7KctO5', 0, ''),
(15, '1223333', 't6oY4J', 0, ''),
(16, '1223333', '4Xl3gG', 0, ''),
(17, '444455', '2gLmR0', 0, ''),
(18, '5543', 'Pk3x5A', 0, 'tsega'),
(19, '2121', '0AWq9n', 0, 'biks'),
(20, '1512', '97dfJO', 0, 'bihonegn'),
(21, '1512', 'IGj65y', 0, 'bihonegn'),
(22, '1512', 'V8R3vk', 0, 'bihonegn'),
(23, '22222', 'qe79DF', 0, 'abe');

-- --------------------------------------------------------

--
-- Table structure for table `visitor`
--

CREATE TABLE `visitor` (
  `id` int(11) NOT NULL,
  `fname` varchar(300) NOT NULL,
  `mname` varchar(300) NOT NULL,
  `lname` varchar(300) NOT NULL,
  `age` int(11) NOT NULL,
  `sex` varchar(11) NOT NULL,
  `prisoner` varchar(300) NOT NULL,
  `relation` varchar(300) NOT NULL,
  `region` varchar(300) NOT NULL,
  `woreda` varchar(300) NOT NULL,
  `kebele` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `visitor`
--

INSERT INTO `visitor` (`id`, `fname`, `mname`, `lname`, `age`, `sex`, `prisoner`, `relation`, `region`, `woreda`, `kebele`) VALUES
(8, 'abebe', 'gelaw', 'bantalem', 23, 'rtg', 'hgh', 'e', 'd', '', ''),
(9, 'abebe', 'gelaw', 'bantalem', 23, 'rtg', 'hgh', 'e', 'kj', '', 'jjjj'),
(10, 'abebe', 'gelaw', 'bantalem', 23, 'rtg', '', 'bantalem', 'kj', '', 'jjjj'),
(11, 'abebe', 'gelaw', 'bantalem', 23, 'rtg', 'hgh', 'bantalem', 'hju', '', 'fff'),
(12, 'abebe', 'gelaw', 'bantalem', 23, 'female', 'hgh', 'brother', 'amhara', 'estie', '03');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `serial_no` (`serial_no`);

--
-- Indexes for table `admin_info`
--
ALTER TABLE `admin_info`
  ADD PRIMARY KEY (`serial_no`);

--
-- Indexes for table `admin_message`
--
ALTER TABLE `admin_message`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comissioner_information`
--
ALTER TABLE `comissioner_information`
  ADD PRIMARY KEY (`serial_no`);

--
-- Indexes for table `comissioner_message`
--
ALTER TABLE `comissioner_message`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `forgive`
--
ALTER TABLE `forgive`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inspector_information`
--
ALTER TABLE `inspector_information`
  ADD PRIMARY KEY (`serial_no`);

--
-- Indexes for table `inspector_message`
--
ALTER TABLE `inspector_message`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `policeofficer_information`
--
ALTER TABLE `policeofficer_information`
  ADD PRIMARY KEY (`serial_no`);

--
-- Indexes for table `policeofficer_message`
--
ALTER TABLE `policeofficer_message`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `prisoner_information`
--
ALTER TABLE `prisoner_information`
  ADD PRIMARY KEY (`serial_no`);

--
-- Indexes for table `prisoner_message`
--
ALTER TABLE `prisoner_message`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `schedule`
--
ALTER TABLE `schedule`
  ADD PRIMARY KEY (`eating_time`);

--
-- Indexes for table `t`
--
ALTER TABLE `t`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `visitor`
--
ALTER TABLE `visitor`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account`
--
ALTER TABLE `account`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=125;

--
-- AUTO_INCREMENT for table `admin_message`
--
ALTER TABLE `admin_message`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `comissioner_message`
--
ALTER TABLE `comissioner_message`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `forgive`
--
ALTER TABLE `forgive`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `inspector_message`
--
ALTER TABLE `inspector_message`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `policeofficer_message`
--
ALTER TABLE `policeofficer_message`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `prisoner_message`
--
ALTER TABLE `prisoner_message`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `t`
--
ALTER TABLE `t`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `visitor`
--
ALTER TABLE `visitor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
