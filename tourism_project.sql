-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 19, 2021 at 05:59 PM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tourism_project`
--

-- --------------------------------------------------------

--
-- Stand-in structure for view `avg_budget`
-- (See below for the actual view)
--
CREATE TABLE `avg_budget` (
`city_preferred` varchar(30)
,`avg_lodge_budget` decimal(14,6)
,`avg_food_budget` decimal(14,6)
,`avg_trans_budget` decimal(14,6)
,`avg_site_budget` decimal(14,6)
);

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

CREATE TABLE `city` (
  `Name` varchar(20) NOT NULL,
  `minReqdTimeInDays` int(11) NOT NULL,
  `photos` varchar(50) DEFAULT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `city`
--

INSERT INTO `city` (`Name`, `minReqdTimeInDays`, `photos`, `id`) VALUES
('KathmanduValley', 5, 'img/kathmandu.jpg', 1),
('Pokhara', 4, 'img/pokhara1.jpg', 2),
('Solukhumbu', 3, 'img/solukhumbu.jpg', 3);

-- --------------------------------------------------------

--
-- Stand-in structure for view `city_count`
-- (See below for the actual view)
--
CREATE TABLE `city_count` (
`city_preferred` varchar(30)
,`countnum` bigint(21)
);

-- --------------------------------------------------------

--
-- Table structure for table `hotels`
--

CREATE TABLE `hotels` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `contact` decimal(10,0) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `redirect` text DEFAULT NULL,
  `photos` longblob DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `minCost` decimal(10,2) DEFAULT NULL,
  `maxCost` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `hotels`
--

INSERT INTO `hotels` (`id`, `name`, `contact`, `email`, `description`, `redirect`, `photos`, `city`, `minCost`, `maxCost`) VALUES
(1, 'Hotel Everest View', '15412142', 'info@hoteleverestview.com', 'Hotel Everest View epitomises the adventurous spirit of the Himalayas. It is a perfect place to explore the nearby villages and enjoy the beautiful landscape filled with excellent service and delicious cuisine to make your stay an unforgettable experience', 'https://www.hoteleverestview.com', NULL, 'Solukhumbu', '5000.00', '15000.00'),
(2, 'Yeti Mountain Home', '9801249331', 'info@yetimountainhome.com', 'Yeti Mountain Home is a group of comfort lodges situated in the Everest region of Nepal. These lodges are offering panoramic views of some of the highest mountains in the world such as Mt. Everest.', 'https://yetimountainhome.com/', NULL, 'Solukhumbu', '10000.00', '18000.00'),
(3, 'Hotel Sherpaland', '9802009965', 'info@hotelsherpaland.com', 'Located at Namche Bazaar, KhumbuNepal, Hotel Sherpaland is situated in the heart of Namche Bazaar, at the elevation of 3450 meters from the sea level. Located in the Eastern part of the Nepal we are surrounded by some of the highest mountains in the world, the khumbu valley, home of the gentle and friendly Sherpas.', 'https://hotelsherpaland.com/', NULL, 'Solukhumbu', '6000.00', '15000.00'),
(4, 'Yak Hotel', '9852850019', 'info@yakhotel.com.np', 'Located at Namche Bazar, Yak Hotel is established in 2004 in Namche Bazar. It is located at the heart of Namche Bazar where you can get the easy access to varieties of shops, banks and Cyber café. Currently, we have 24 khumbu standard rooms with a very competitive price in town. It is family run business. It is equipped with Restaurant and Cyber café.', 'http://www.yakhotel.com.np/', NULL, 'Solukhumbu', '5000.00', '10000.00'),
(5, 'Hotel Edelweiss Pheriche', '9842867521', 'dalja2004@gmail.com', 'The Hotel Edelweiss Pheriche is situated in the Sagarmatha (Everest) National Park in Nepal, a UNESCO World Heritage Site, and the hotel offers a 360 degree view of the awe inspiring peaks. With stunning landscape from every room, visitors can immerse in this panoramic Himalayan views. ', 'http://edelweisspheriche.com/', NULL, 'Solukhumbu', '1000.00', '5000.00'),
(6, 'Hotel Barahi', '61460617', 'info@barahi.com', 'Located at Lakeside, Pokhara, Hotel Barahi boasts some stunning views of the Annapurna  Himalayas, Phewa Lake as well as easy access to the thriving lake street of Pokhara. We are situated adjacent to the Phewa Lake, a mere 3 KMS away from Pokhara domestic airport. We offer 80 rooms(70-Deluxe,8-Suite Wing Deluxe,2-Suite), swimming pool, restaurants, meeting rooms and SPA decorated with comfort and elegance in mind.', 'http://www.barahi.com/', NULL, 'Pokhara', '8000.00', '15000.00'),
(7, 'Glacier Hotel & Spa', '61463722', 'glacierht@mail.com', 'Located at Gaurighat, Lakeside, Pokhara famous for its view and services.', 'https://glacierboutique.com/', NULL, 'Pokhara', '14000.00', '20000.00'),
(8, 'Pokhara Grande', '61460210', 'info@pokharagrande.com', 'Pokhara Grande is the five star hotel of Pokhara, Nepal providing the right blend of service, luxury and quiet efficiency. Internationally acclaimed for all-round excellence and unparalleled levels of service, we have got our name listed among 10 best hotels of Nepal', 'http://www.pokharagrande.com/', NULL, 'Pokhara', '10000.00', '18000.00'),
(9, 'Hotel Peace Plaza', '61464365', 'book@hotelpeaceplaza.com', 'Hotel Peace Plaza is well known for its excellent services, frindlly staff, wounderful lake and mountain view. In an idyllic location right beside the Lake Phewa, surrounded by Himalayan peaks of the Annapurna range & Mt. Fishtail, you will find one of the Pokhara’s finest hotel', 'https://hotelpeaceplaza.com/', NULL, 'Pokhara', '5000.00', '10000.00'),
(10, 'Hotel Pokhara Batika', '61467450', 'info@pokharabatika.com', 'In the heart of Pokhara\'s natural splendor, Classic Hotel Pokhara Batika is the most glamorous destination for a pampering holiday gateway or a productive business trip. Modern urban amenities balance nature, culture, and luxury, with every moment elevated by our peerless service', 'http://www.hotelpokharabatika.com/', NULL, 'Pokhara', '8500.00', '17000.00'),
(11, 'Hotel Mala Pokhara', '61468116', 'info@hotelmala.com', 'Hotel Mala is a beloved boutique hotel in Pokhara and the perfect location for go-getters, trend-setters, families and not to miss the corporates. Enjoy the Tibetan/Nepali ambiance that is cheerful yet fully facilitated, from the artistic décor to the luxurious roof top pool and family-friendly restaurant at the 6th floor.', 'http://hotelmalapokhara.com/', NULL, 'Pokhara', '5000.00', '12000.00'),
(12, 'Kathmandu Grand Hotel', '14700694', 'kathmandugrandhotel@gmail.com', 'Located at Chakshibari Marga, Thamel, Kathmandu. Kathmandu Grand Hotel has become one of the most renowned names in the hospitality industry. Ever since it has been established in 2016, this two star hotel in Nepal, Kathmandu has changed the way moderately priced hotels operated by providing amenities of international standard at affordable rates. Our hotel has been designed keeping in mind safety, hygiene and comfort. Elegantly designed rooms, excellent services and other modern amenities make us stand apart from the rest.', 'https://www.kathmandugrandhotel.com', NULL, 'KathmanduValley', '7000.00', '11000.00'),
(13, 'The Malla Hotel', '14418385', 'info@themallahotel.com', 'On the outer edge of the busy tourist hub of Thamel, The Malla Hotel also has a long and storied past. Its rooms have all been newly renovated to provide modern, up to date comforts, and whether you’re here for business, leisure or an event, this is not just a place to stay, but a bit of history to savor. Wander in the beautiful garden, take a dip in the pool, try your luck at the casino, or visit the newly updated Shanti Spa, equipped with five massage rooms and a renovated steam and sauna room. Extensive yoga and meditation services are also available, for an unforgettable personalized experience.', 'http://themallahotel.com/', NULL, 'KathmanduValley', '14000.00', '36000.00'),
(14, 'The Everest Hotel', '14780100', 'reservations@theeveresthotel.com', 'Located at Madan Bhandari Road. Magnificent in the hues of its glorious past, Kathmandu is a cosmopolitan urban civilization in the foothills of Himalayas. The city was the royal capital of the Kingdom of Nepal and hosts palaces, mansions and gardens of the Nepalese aristocracy. Kathmandu, also known as City of Temple’s, stands at an elevation of 1400 Meters (4600 Ft) above sea level in the bowl shaped valley in central Nepal', 'http://www.theeveresthotel.com', NULL, 'KathmanduValley', '7500.00', '15000.00'),
(15, 'Hotel Yak & Yeti', '14248999', 'reservation@yakandyeti.com.np', 'The Yak & Yeti Hotel as it stands today is inextricably linked to Nepal’s colourful history, proudly showcasing the beautifully restored Lal Durbar space as part of Kathmandu’s biggest convention center. Artefacts and antiques have been lovingly preserved throughout the property maintaining the Rana splendor of long ago.', 'https://www.yakandyeti.com/', NULL, 'KathmanduValley', '8500.00', '110000.00'),
(16, 'Basera Boutique Hotel', '9851234862', 'info@baseraboutiquehotel.com.np', 'Located at Singh Durbar, Babar Mahal. Basera Boutique Hotel is one of the most authentic hotel where you can enjoy your valuable times with your friends, family and your loved ones. Located in Babar mahal, Kathmandu it is one of the most awaited visiting hotel. Also, you can spend your leisure time by visiting nearby attractions like art galleries.', 'http://www.baseraboutiquehotel.com.np/', NULL, 'KathmanduValley', '12000.00', '27000.00'),
(17, 'Hotel Himalaya', '15523909', 'reservation@hotelhimalaya.com.np', 'Situated in the epicenter of Kathmandu valley, offering great value for money with superb rooms and wonderful dining experience. Come and stay with us and allow us to make you feel at home with true Nepalese hospitability!', 'https://hotelhimalaya.com.np/', NULL, 'KathmanduValley', '7000.00', '18000.00');

-- --------------------------------------------------------

--
-- Stand-in structure for view `hotels_cost`
-- (See below for the actual view)
--
CREATE TABLE `hotels_cost` (
`city` varchar(20)
,`minCost` decimal(14,6)
,`maxCost` decimal(14,6)
);

-- --------------------------------------------------------

--
-- Table structure for table `preference`
--

CREATE TABLE `preference` (
  `id` int(11) NOT NULL,
  `tourist_id` int(11) NOT NULL,
  `city_preferred` varchar(30) NOT NULL,
  `duration_of_trip` int(11) NOT NULL,
  `no_of_tourist` int(11) NOT NULL,
  `lodging_budget` decimal(10,2) NOT NULL,
  `siteseeing_budget` decimal(10,2) NOT NULL,
  `transport_budget` decimal(10,2) NOT NULL,
  `current_location` varchar(30) NOT NULL,
  `activities` varchar(50) NOT NULL,
  `foodingBudget` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `preference`
--

INSERT INTO `preference` (`id`, `tourist_id`, `city_preferred`, `duration_of_trip`, `no_of_tourist`, `lodging_budget`, `siteseeing_budget`, `transport_budget`, `current_location`, `activities`, `foodingBudget`) VALUES
(1, 6, 'Pokhara', 3, 2, '341.00', '23.00', '78.00', 'Nepalgunj', 'Paragliding', '5000.00'),
(4, 1, 'KathmanduValley', 3, 3, '2000.00', '1000.00', '4000.00', 'Solukhumbu', 'Cultural Tours', '10000.00'),
(5, 1, 'Pokhara', 3, 2, '12000.00', '2000.00', '4000.00', 'Kathmandu', 'Paragliding', '2500.00'),
(6, 1, 'Pokhara', 8, 1, '10000.00', '8000.00', '1500.00', 'Bhairahwa', 'Trekking', '3000.00'),
(7, 1, 'KathmanduValley', 5, 2, '4000.00', '8000.00', '3000.00', 'Pokhara', 'Cultural Tours', '4000.00'),
(8, 1, 'Solukhumbu', 5, 1, '10000.00', '10000.00', '40000.00', 'Kathmandu', 'Trekking', '4500.00'),
(9, 1, 'Pokhara', 3, 6, '20000.00', '40000.00', '90000.00', 'Nepalgunj', 'Cultural Tours', '3000.00'),
(10, 1, 'KathmanduValley', 3, 5, '10000.00', '2000.00', '10000.00', 'Biratnagar', 'Cultural Tours', '6000.00'),
(12, 1, 'Pokhara', 2, 1, '4000.00', '1000.00', '2000.00', 'Bhairahwa', 'Boating', '6500.00'),
(13, 1, 'Pokhara', 10, 3, '10000.00', '4300.00', '4500.00', 'Solukhumbu', 'Boating', '3500.00'),
(63, 6, 'Solukhumbu', 2, 2, '4000.00', '2000.00', '5000.00', 'Biratnagar', 'Hiking', '4500.00'),
(64, 6, 'Solukhumbu', 2, 2, '4000.00', '2000.00', '5000.00', 'Biratnagar', 'Hiking', '5000.00'),
(65, 6, 'Solukhumbu', 2, 2, '4000.00', '2000.00', '5000.00', 'Biratnagar', 'Hiking', '5000.00'),
(66, 4, 'Pokhara', 12, 4, '12000.00', '5000.00', '4000.00', 'Nepalgunj', 'Paragliding', '15000.00'),
(68, 2, 'KathmanduValley', 2, 2, '233.00', '324.00', '5000.00', 'Pokhara', 'Paragliding', '12000.00'),
(69, 2, 'Pokhara', 3, 3, '324.00', '324.00', '324.00', 'Nepalgunj', 'Paragliding', '6000.00'),
(73, 6, 'Pokhara', 0, 4, '4000.00', '4000.00', '4000.00', 'Nepalgunj', 'Paragliding', '13000.00'),
(85, 5, 'Pokhara', 3, 2, '5000.00', '3000.00', '5000.00', 'Biratnagar', ' Boating', '12000.00'),
(88, 3, 'Pokhara', 3, 2, '5000.00', '3000.00', '5000.00', 'Kathmandu', 'Trekking', '10000.00'),
(101, 8, 'KathmanduValley', 6, 2, '4000.00', '1000.00', '2000.00', 'Pokhara', 'Cultural Tours', '4000.00'),
(102, 8, 'KathmanduValley', 6, 2, '4000.00', '1000.00', '2000.00', 'Pokhara', 'Cultural Tours', '8000.00'),
(103, 9, 'Solukhumbu', 4, 1, '10000.00', '3000.00', '10000.00', 'Biratnagar', 'Trekking', '5000.00'),
(104, 11, 'KathmanduValley', 5, 3, '10000.00', '5000.00', '10000.00', 'Nepalgunj', 'Cable Car Ride', '10000.00'),
(105, 11, 'KathmanduValley', 5, 3, '10000.00', '5000.00', '10000.00', 'Bhairahwa', 'Cultural Tours', '10000.00'),
(106, 12, 'Pokhara', 5, 3, '20000.00', '20000.00', '20000.00', 'Nepalgunj', 'Hiking', '20000.00'),
(107, 3, 'Solukhumbu', 3, 1, '5000.00', '10000.00', '10000.00', 'Pokhara', 'Trekking', '5000.00'),
(108, 13, 'KathmanduValley', 10, 2, '12000.00', '3000.00', '12000.00', 'Bhairahwa', 'Cultural Tours', '20000.00'),
(109, 14, 'Solukhumbu', 4, 2, '2000.00', '2000.00', '2000.00', 'Kathmandu', 'Hiking', '2000.00'),
(110, 15, 'Pokhara', 5, 2, '12000.00', '1200.00', '12000.00', 'Nepalgunj', 'Trekking', '12000.00'),
(111, 3, 'Pokhara', 5, 2, '10000.00', '5000.00', '10000.00', 'Bhairahwa', 'Paragliding', '10000.00'),
(112, 3, 'Pokhara', 2, 2, '20000.00', '0.00', '5000.00', 'Kathmandu', 'Boating', '10000.00'),
(113, 3, 'KathmanduValley', 2, 2, '20000.00', '0.00', '20000.00', 'Bhairahwa', 'Cultural Tours', '10000.00'),
(114, 18, 'KathmanduValley', 2, 1, '10000.00', '0.00', '5000.00', 'Biratnagar', 'Boating', '5000.00'),
(115, 18, 'KathmanduValley', 2, 1, '15000.00', '0.00', '5000.00', 'Biratnagar', 'Boating', '5000.00'),
(116, 19, 'KathmanduValley', 3, 1, '20000.00', '0.00', '5000.00', 'Bhairahwa', 'Cultural Tours', '5000.00'),
(117, 19, 'KathmanduValley', 3, 1, '25000.00', '0.00', '5000.00', 'Bhairahwa', 'Cultural Tours', '5000.00'),
(118, 20, 'Pokhara', 2, 1, '25000.00', '0.00', '10000.00', 'Pokhara', 'Cable Car Ride', '10000.00');

-- --------------------------------------------------------

--
-- Table structure for table `restaurants`
--

CREATE TABLE `restaurants` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `contact` decimal(10,0) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `redirect` text DEFAULT NULL,
  `photos` longblob DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `minCost` decimal(10,2) DEFAULT NULL,
  `maxCost` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `restaurants`
--

INSERT INTO `restaurants` (`id`, `name`, `contact`, `email`, `description`, `redirect`, `photos`, `city`, `minCost`, `maxCost`) VALUES
(1, 'Rosemary Kitchen and coffee shop', '9851194798', 'rosemarykitchenktm@gmail.com', 'Located at JP Marg, Thamel, Kathmandu', 'https://www.rosemarykitchen.com.np', NULL, 'KathmanduValley', '600.00', '1500.00'),
(2, 'Rosemary Kitchen and coffee shop', '9860712413', 'rosemarykitchenpkr@gmail.com', 'Located at Lalupate Marg, Lakeside, Pokhara', 'https://www.rosemarykitchen.com.np', NULL, 'Pokhara', '600.00', '2000.00'),
(3, 'Kantipur Tandoori House', '9851192705', 'info@kantipurtandoorihouse.com', 'Located at Brahmakumari Marg, Jyatha Thamel. We are specialized in various dishes like Vegetarian and Non Vegetarian, appetizers, chicken dishes, Indian tandoori specials -BBQ, Indian style breads, rice specialties, desserts, fresh coffee shop, lounge and bar.', 'https://kantipurtandoorihouse.com/', NULL, 'KathmanduValley', '1000.00', '1500.00'),
(4, 'The chimney Restaurant', '14227781', 'reservation@yakandyeti.com.np', 'Located at Paryatak Marg, Durbar Marg, Kathmandu District. The Chimney is Yak and Yeti hotel restaurant.A fun place to be! A trendy, yet classy restaurant, serving the most fashionable and innovative dishes and drinks.', 'https://www.yakandyeti.com/culinary-delights/the-chimney-fine-dining', NULL, 'KathmanduValley', '500.00', '2000.00'),
(5, 'Yala Cafe', '9801169212', '', 'Located at Kawabahal Street Thamel-17 Kathmandu.Yala Cafe is a Nepali restaurant tucked away in a quiet part of Thamel with no traffic.', 'https://yalacafe.com/', NULL, 'KathmanduValley', '300.00', '1200.00'),
(6, 'Kathmandu Steak House', '14264946', 'kathmandusteakhouse@gmail.com', 'Kathmandu’s newest steakhouse is conveniently located in the centre of Thamel, peacefully tucked away on the first floor of Hotel Trekkers’ Home.', 'http://www.kathmandusteakhouse.com/', NULL, 'KathmanduValley', '200.00', '3000.00'),
(7, 'Byanjan Grill', '61456271', 'info@byanjan.com', 'Byanjan Grill, bringing the modern tradition of himalayan cuisine. Byanjan means varieties of food in Sanskrit language. Warm and welcoming atmosphere, like no place else in lakeside.', 'https://byanjan.com/', NULL, 'Pokhara', '500.00', '3000.00'),
(8, 'Juicery Café', '9823781787', '', 'Established with a humble beginning in North Lakeside, the Juicery Cafe has grown from the first cold pressed juices bar into one of the must visit food destination', 'https://www.thejuicerycafe.com/', NULL, 'Pokhara', '200.00', '1000.00'),
(9, 'MoonDance Restaurant', '61461835', 'info.moondance@gmail.com', 'Moondance is the creation of the Lama (Tamang) Family. Simply put, we love what we do and take pride in Moondance. The term gets to the heart of how we see the restaurant business. Moondance is not just a business, but an extension of our family and our ideals. Moondance, as far as it has come over the past decade, will never be done. We are constantly working to improve our food and service, evolve our philosophy, change with the times, and please our customers. Through an incridible amount of hard work and sheer force of will, we now have 40+ tables, over 200 seats, a full bar, a patio, a remodeled kitchen, and a reputation for great food.', 'https://moondancepokhara.com/', NULL, 'Pokhara', '200.00', '1500.00'),
(10, 'Umbrella Cafe', '9806778551', 'umbrellacafenepal@gmail.com', 'Umbrella café - best vegan and vegetarian fusion cuisines! Fresh juices, smoothies, coffee, salads, sandwiches and creative main courses with organic items & tofu!', 'https://www.umbrellacafenepal.com/', NULL, 'Pokhara', '200.00', '500.00'),
(11, 'Sherpa Barista Bakery,Food & Coffee Shop', '38540490', '', 'Located at Namche Bazar.', 'http://sherpabarista.com/', NULL, 'Solukhumbu', '300.00', '1500.00'),
(12, 'Cafe de 8848', '38540460', '', 'Located at Namche Marg, Namche Bazaar', 'https://www.facebook.com/Cafe-de-8848-Illy-espresso-bar-104617926313223/', NULL, 'Solukhumbu', '500.00', '2000.00'),
(13, 'Himalayan Sherpa Coffee', '9843135753', '', 'Located at Chheplung, Chaurikharka', 'https://www.facebook.com/himalayansherpacoffee/', NULL, 'Solukhumbu', '300.00', '1500.00'),
(14, 'Tomadachi Japanese Restaurant', '3854014', '', 'Located at Namche Bazaar.', 'https://www.facebook.com/tomodachinamche/', NULL, 'Solukhumbu', '400.00', '1600.00');

-- --------------------------------------------------------

--
-- Stand-in structure for view `restaurant_cost`
-- (See below for the actual view)
--
CREATE TABLE `restaurant_cost` (
`city` varchar(20)
,`minCost` decimal(14,6)
,`maxCost` decimal(14,6)
);

-- --------------------------------------------------------

--
-- Table structure for table `touristspot`
--

CREATE TABLE `touristspot` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `city` varchar(20) NOT NULL,
  `openTime` time DEFAULT NULL,
  `closeTime` time DEFAULT NULL,
  `entryPrice` float(10,2) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `activities` varchar(50) DEFAULT NULL,
  `photos` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `touristspot`
--

INSERT INTO `touristspot` (`id`, `name`, `city`, `openTime`, `closeTime`, `entryPrice`, `description`, `activities`, `photos`) VALUES
(1, 'Pashupatinath Temple', 'KathmanduValley', '04:00:00', '17:00:00', 0.00, 'Pashupatinath is a famous sacred Hindu temple dedicated to Lord Shiva that is located in Gaushala, Kathmandu. In consideration of UNESCO World Heritage Sites, the temple has been listed since 1979.\n\nDedicated to Lord Shiva, Pashupatinath is one of the four most important religious sites in Asia for devotees of Shiva. Built in the 5th century and  later renovated by Malla kings, the site itself is said to have existed from the beginning of the millennium when a Shiva lingam was discovered here.\n\nThe largest temple complex in Nepal, it stretches on both sides of the Bagmati River which is considered holy by Hindus.  The main pagoda style temple has a gilded roof, four sides covered in silver, and exquisite wood carvings. Temples dedicated to several other Hindu and Buddhist deities surround the the temple of Pashupatinath.\n\nVisit Pashupatinath for an unmatched mix of religious, cultural and spiritual experiences.There are around 492 temples, 15 Shivalayas (shrines of Lord Shiva) and 12 Jyotirlinga (phallic shrines) to explore.\n\nPashupatinath is also one of the few living cultural heritage sites in the world. Unlike other cultural sites or museums, Pashupatinath is the centre of energy with active participation of people at all times of the day, every day.', 'Cultural Tours', 'img/pashupatinath.jpg'),
(2, 'Chandragiri Hills', 'KathmanduValley', '08:00:00', '17:00:00', 700.00, 'Chandragiri Hills is one of the Nepal\'s most loved day-trip destinations. It is also a famous hiking destination in Nepal. Walking around the hills provides a breath of fresh air, and you get to see the natural beauty of the country side and breath taking scenes. The main destination of Chandragiri Hill is the mountain top from where the spectacular views of the great Himalayan mountain ranges can be seen. The green valley of Kathmandu lies at the bottom where you can see the growing urbanization.\n\nChandragiri can be reached via cable car, driving or hiking. The second cable car in Nepal after Manakamana was commenced through this route. The cable car route is around 2.5 km and it takes about 9 to 14 minutes depending on the wind speed on the cable car. It is a thrilling and fun-filled experience to see Kathmandu valley, the landscape and the mountains from the cable car. The hill provides panoramic views of Kathmandu valley and the Himalayan ranges from Annapurna to Everest. It is an easy one-day trip from Central Kathmandu Valley. Chandragiri Cable Car runs from Thankot to Chandragiri hills. The cable car system consists of 38 gondolas that can carry 1000 people per hour.', 'Cable Car Ride', 'img/chandragiri.jpg'),
(3, 'Patan Durbar Square', 'KathmanduValley', '10:00:00', '22:00:00', 0.00, '\"Patan is 5 km away from the capital city, Kathmandu, and is reached by crossing the Bagmati River. Despite its proximity to Kathmandu, it still retains its old world charm and traditional professions such as woodcarving and especially metal crafts. As you walk through the city you still hear the tapping of tiny hammers as a craftsman works on a statuette or ornament. Patan is full of temples and monasteries which look similar in their pagoda style architecture and wood-carved windows. The district is known as Lalitpur which covers a vast area that includes the hills nearby.  \n\nPatan is a city of 55 major temples, 136 Buddhist monasteries and its artisans are known for their fine metal works. The city celebrates countless festivals both Hindu and Buddhist, many of which like the Rato Machhendranath Jatra and the display of Dipanker Buddhas are spectacular. Patan takes pride in producing great thangka and pauba painters whose works are exported to many countries. Such paintings can be seen in the little alleys of the city. Art still flourishes in this city of Newar craftsmen who have traditionally been supplying metal crafts to Buddhist monasteries around the country. The population is predominantly Newar whose castes generally determine whether they are Hindu or Buddhist.\n\nPatan Durbar Square, a UNESCO World Heritage Site is the major attraction with the old royal palace and a host of artistically designed temples all within the square. The Patan Museum within the palace has a fine collection of metal craft, wood carvings and a precious Malla era throne.', 'Cultural Tours', 'img/patan.jpg'),
(4, 'Shivapuri Nagarjun National Park', 'KathmanduValley', '07:00:00', '17:00:00', 100.00, '\"Shivapuri is the second highest peak among the hills surrounding the Kathmandu Valley. It is 2732m at its peak with numerous sharp ridges radiating to all sides. Situated towards the north of the Kathmandu Valley, due to its strategic location and convenience, Shivapuri was proclaimed as a watershed area supplying more than a million liters of natural spring water to the city. As recently as, in mid-2002 Shivapuri Watershed and Wildlife Reserve was officially given a National Park status.\n\nSince Shivapuri lies in the transition zone between subtropical and temperate climate, the vegetation consists of a variety of natural forest types, depending on altitude and aspects. Most of the areas below 1800m are covered with Schima castanopsis forest in which pines (Pinus roxburghii) appear on the southern dry ridges, with Utis (Alnus nepalensis) along the streams. A forest of oak species such as Quercus semicarpifolia and Quercus lamelosa mixed with rhododendron and a variety of orchids flourish on the northern slopes. A variety of medicinal herbs is found at higher altitudes. A hundred and twenty nine species of mushrooms have been so far identified and catalogued from the Shivapuri National Park.\n\nAmong the wild animals, Sloth Bear , Leopard, Muntjac, Pallasâ€™s Cat, Large Indian Civet, Himalayan Yellow Throated Marten, Indian Pangolin, Wild Boar, Goral Indian Porcupine, and Common Langur, etc. can be spotted around the park.', 'Hiking', 'img/shivapuri.jpg'),
(5, 'Bhaktapur Durbar Square', 'KathmanduValley', '07:00:00', '19:00:00', 0.00, '\"The historical monument on durbar square signifies medieval age culture and tradition of Nepal and this old city is inhabited by indigenous Newari people in large group. you can visit to this place to experience Nepali culture,tradition,religion from right way.\r\n\r\nBhaktapur Durbar Square is a part of the ancient Newari city of Bhaktapur (Bhadgaon or Khwopa-Newar à¤–à¥à¤µà¤ª ). The square contains a royal palace that took center stage as one of three royal capitals during the 15th century in the Kathmandu Valley.\r\n\r\nToday Bhaktapur Durbar Square is just one of four main attractions within the old city known as \"\"Bhaktapur\"\". It was during the reign of the Mallas that Durbar Square acquired most of its beautiful buildings and prominence as a great city in The Kathmandu Valley when it garnered the nickname \"\"city of devotees\"\". Once one of the capitals of Nepal in the 15th century, today it\'s Nepal\'s third largest city and renown as being a city of culture, temples and craft work. It\'s common that most tours or travel agents only focus on \"\"Bhaktapur Durbar Square\"\" however the city is much larger than it\'s most famous attraction.\r\n\r\nIf you have time it\'s worth spending a few days and nights in Bhaktapur. However if you are short on time then it\'s an easy day trip. Either way a trip to Nepal would not be complete without visiting this magnificent ancient city filled with many things to see and do. \r\n\r\nIf you plan on buying many Nepali souvenirs to take home, make sure you visit Bhaktapur before buying anything. It\'s reknown for producing pottery, puppets, masks and cultural handicrafts.\r\n\r\n\"\r\n', 'Cultural Tours', 'img/bhaktapur.jpg'),
(6, 'Begnas Lake', 'Pokhara', NULL, NULL, 0.00, 'Situated at a distance of about an hour from Pokhara, Begnas lake is literally a breath of fresh air. Jaw-dropping serene and much less crowded than the Phewa lake, Begnas lake is a true gem. You can choose to boat, stroll or picnic along the banks of this enchanting lake.\n\nBegnas Lake serves as a wonderful escape for those willing to escape the daily grind, and for those that wish to comprehend the beauty of nature. The Begnas Lake resides in the Pokhara Lekhnath Metropolis, on the southeastern part of Pokhara. It is the third largest lake in Nepal and is composed of freshwater. It is fed by the Syankhudi and Talbesi, whereas the water flows out from the Khudi Khola. The lake covers an area of 3.28 square kilometers, and the average depth is 22 feet.\n\nBegnas Lake sits about 15 kilometers away from Pokhara. It can be accessed by options like bus, taxi, and cycling. You can catch a bus from Prithvi Chowk, Pokhara and it takes you about 30 minutes to reach the lake. Another popular option to reach the lake is by bicycle. You can hire a mountain bike in Pokhara at a cost of Rs. 800 for 12 hours. The road is fairly built, and you can even take your time to admire the morning scenery.\n\nIf you don\'t want to do any sort of hard work, then you can rent a private vehicle. You can hire a vehicle from tour agency. It will save you the hassle and make the trip carefree.', ' Boating', 'img/begnas.jpg'),
(7, 'Sarangkot', 'Pokhara', NULL, NULL, 4000.00, 'Sarangkot is the most popular tourist destination from where the tourists can enjoy the great view of the Pokhara Valley and the magnificent view of the mountains such as Annapurna Massif, Fishtail Mountain, Dhaulagiri range, and Manaslu. Sarangkot is only 5 km from Lake Side from Pokhara and highest view point at 1592m high for Sunrise and Sunset view over the snowy peaks. Sarangkot can be reached easily by 45 minutes by a car ride to the top from Pokhara and then 45 minutes hike up to the main view point.\n\nParagliding can also be done from Sarangkot. From Sarangkot, on the northern direction we can see Dhaulagiri in the far west. Annapurna range is visible when the weather is clear on the same side. On the southern direction the village overlooks the city of Pokhara and its lake on the north-western outskirts of the city. Paragliding in Nepal can be a truly wonderful and fulfilling experience for the adventure seeker. A trip will take you over some of the best scenery on earth, as you share airspace with Himalayan griffin vultures, eagles, kites and float over villages, monasteries, temples, lakes and jungle, with a fantastic view of the majestic Himalaya. Paragliding is another adventurous activities being carried out in Nepal to amuse the visitors. There are various places suitable for organizing paragliding but Sarangkot (1592m) in Pokhara is the best among all. We would go for at least 30 to 45 minute flight which would provide an exiting experience that would cherish for the rest of life. For those who want to find out what paragliding is all about , the pilot will explain and about it and teach its use so that it would be easy for anyone to control the glider. October to April is the best period for paragliding in Nepal.', 'Paragliding', 'img/sarangkot.jpg'),
(8, 'Bindabasini Temple', 'Pokhara', NULL, NULL, 0.00, 'The Bindhyabasini Temple is the oldest temple in the city of Pokhara, Nepal and is located in Ward No. 2, Miruwa. It regularly attracts a large number of locals, Nepalis from across the country and foreigners alike. The main temple is devoted to goddess Bindhyabasini, a Bhagawati who is the incarnation of Kali.\n\nSituated in the northern part of this city, Bindhyabasini temple is one of the famous temples of Nepal. It is devoted to the Hindu goddess Bindhyabasini, a Bhagawati who is believed to be the guardian deity of the city of lakes. Besides that, the temple is a recognized sightseeing attraction in Pokhara.\n\nIt is the oldest temple in Pokhara. Enthroned on top of a small hill, the Bindhyabasini temple rests quietly beside an old busy bazaar, 3002 feet above sea level gawking at the glorious Himalayan ranges. The temple is like a breath of fresh air amid the hullabaloo of Pokhara.\n\nThe temple is of high religious importance to the locals of Pokhara and has even become a famous pilgrimage for Hindus from all over the world. It is dedicated to goddess Durga and more specifically Bhagwati, a bloodthirsty manifestation of the Goddess.\n\nBindhyabasini is a form of Bhagawati which is believed to be the replacement of the eighth child of Devaki and Vasudeva (Lord Krishna). When Kansa tried to kill their eighth child, she who had been exchanged, appeared as Devi Bindhyabasini. In the temple the goddess dwells as a Shaligram, an auspicious stone.\n\nThe pilgrims can visit the temple and worship there with their offerings. Just on the opposite side of Bindhyabasini temple, there is a Krishna Mandir where people celebrate his annual birthday, Krishna Janmashtami. Along with this, they can also go to other temples of Saraswati, Hanuman, Shiva, Vishnu, Ganesh, and Jogi Paati that are located nearby the main temple.\n\nIt can be a very spiritual and religious experience. A park-like setting surrounds the temple where people can enjoy their picnics with friends and family.', 'Cultural Tours', 'img/bindabasini.jpg'),
(9, 'Namche Bazaar', 'Solukhumbu', NULL, NULL, 0.00, 'Namche Bazaar (3,500 m) is the staging point for expeditions to Everest and other Himalayan peaks in the area. It has developed into a small, colorful market town selling everything from Tibetan artifacts to trekking and climbing equipment and everything you might need during your trip. The visitor center at park headquarters has detailed information on various climbs in the area, memorabilia from different mountaineering expeditions, and information on the lifestyle and culture of the Sherpa people. \n\nA historic trading hub, famous for its homemade yak cheese and butter, Namche is situated on the slope of an arch-shaped mountain, with amazing views of giant Himalayan peaks from anywhere in the valley. Once a major trading center of the Khumbu region, Sherpas from neighboring villages and traders from Tibet would gather to barter goods displaying exotic traditional arts and crafts. Despite its prosperity, Namche Bazaar still retains its ancient culture, traditions and heart-warming hospitality.', 'Trekking', 'img/namche.jpg'),
(10, 'Sagarmatha National Park', 'Solukhumbu', NULL, NULL, 100.00, 'Sagarmatha National Park is home to the highest peak in the world - Mt. Everest (8,848 m), Sagarmatha being the Nepali name for Everest. The area was designated a national park in 1976 and encompasses several other peaks all above 6,000 m. The park got recognition as a World Heritage Site in 1979.\r\n\r\nWith most of the park lying above 3,000 m, it is mostly rugged terrain made up of deep gorges, glaciers and massive rocks. The Park boasts of a wide variety of wildlife including more than 118 species of birds. While the forest is dominated by silver fir, birch, rhododendron and juniper trees, animals such as musk deer, the Himalayan tahr, the ghoral, the serow, the wolf, and the Himalayan black bear may be spotted by trekkers in this region.\r\n\r\nEndangered species which are rarely seen include: snow leopard, red panda, and two kinds of dazzling pheasants - the crimson-horned and the Impeyan, Nepal\'s national bird. Smaller animals like marmots, pikas and martens are also found in the park.\r\n\r\nThe region ranges in altitude from less than 2,000 m above sea level at Jiri to the high peaks of the Himalaya at over 8,000 m. Hence the parkâ€™s flora and fauna is diverse with dense forest of pine, oak and the flowering rhododendrons found up to 4,000 m above sea level. The latter are one reason to make a trip to Nepal in the spring when the hills between 2,000 m and 3,500 m are a riot of colors. \r\n\r\nThe best time to visit the park is during the autumn months of October-November and from March-May in spring/summer.\r\n\r\n', ' Mountaineering', 'img/sagarmatha.jpg'),
(11, 'Everest Base Camp', 'Solukhumbu', NULL, NULL, 350000.00, 'Everest Base Camp trek is quite simply the classic trek in Nepal. High in the priority list of trekkers, the Everest Base Camp is one of the most visited regions in the Himalaya. The two week trek starts and finishes at Lukla, an airstrip to the south of the region also known as the â€˜Gateway to Everestâ€™. Most trekkers fly to Lukla, to begin the trek.\n\nStarting from Lukla, a gentle two-day trek up the Dudh Koshi valley leads to the famous Namche Bazaar. The route has an abundance of tea houses. Phakding and Monjo are the popular stopovers on the first day and just beyond Monjo is the entrance to the Sagarmatha National Park at Jorsale check point where permits are checked. The trail that followed the Dudh Koshi River starts going uphill from the suspension bridge just a few minutes from Jorsale and Namche Bazaar is reached after a 3 hour hike. \n\nIt is good to halt here for a few days to acclimatize by walking in the surroundings of Namche as it canâ€™t be done in a hurry. A visit to Syangboche or some Sherpa villages such as Thame, Khumjung and Khunde just a few hours walk from Namche are good options for a hike to while away your time. \n\nLeaving Namche Bazaar, the trail follows the valley of Imja Khola with spectacular views of Thamserku, Kangtega and Ama Dablam mountains, while dominating the skyline ahead are the giants, Lhotse and Everest. The most common night halt after Namche is at the top of a steep climb from the Imja Khola at Tengboche. The Tengboche Monastery is one of the most famous monasteries, probably because of its unrivalled backdrop, Mt. Ama Dablam.', 'Mountaineering', 'img/everest.jpg'),
(12, 'Tengboche Monastery', 'Solukhumbu', NULL, NULL, 0.00, '\"Tengboche Monastery is one of the most famous monasteries of Nepal, probably because of its unrivalled backdrop of Mt. Ama Dablam. The monastery is the leading Buddhist centre in the Khumbu region with a residing Rinpoche who blesses pilgrims, mountaineers and travelers passing through. \r\n\r\nEvery October, Tengboche Monastery hosts the colorful Mani Rimdu festival, which is a culmination of Buddhist celebrations with a religious gathering, songs, ritual dances and  enactments of the lives of legendary figures. Visitors are always welcomed to partake in the festivities and many trekkers book their trek to coincide with the festival. Tours of the monastery are conducted every afternoon for visitors. Tengboche lies on the very popular trek route to the Everest region.\r\n\r\nAtop a hill across Imja Khola, Tengboche is the most common night halt after Namche. The monastery is perched on a high ridge across the canyon from Khunde. The original Tengboche Monastery was burnt down in 1989 and replaced with a more solid structure. \r\n\r\nPines, azaleas and colorful rhododendrons surround the attractive gompa (monastery), with a stunning panoramic view of Everest, Lhotse and Ama Dablam.  Tengboche has many rest houses and a large number of lodges as well as spacious camping sites.\r\n\r\nFrom Tengboche you can continue on to Pheriche, Kala Pattar and the hamlet of Gorakshep.  From here, the Everest Base Camp is easily reached, as is the summit of Kala Pattar (5,545 m), known for outstanding views of Mt. Everest. However, it is advisable to take time to acclimatize and avoid rapid gain in altitude to avoid altitude sickness.\"\r\n', 'Cultural Tours', 'img/teng.jpg'),
(13, 'Gokyo Valley', 'Solukhumbu', NULL, NULL, 0.00, 'One of the most picturesque valleys in Nepal, the Gokyo valley lies towards the west of the more famous Khumbu region of the Himalaya. The serene valley boasts extensive pastures for yaks to graze during summer and the pristine turquoise lakes are simply breathtaking. Gokyo can be visited after trekking up to Everest Base Camp by adding another five days to the itinerary.\r\n\r\nIf Gokyo is your main destination, then the trek goes up the Everest trail only as far as the teahouses at Kenjoma (where the trail from Khumjung joins the main trail). From this point on, the trail leads up towards Mong La pass before dropping steeply back down to the banks of the Dudh Koshi River. The trail then goes past rhododendron and oak forests and waterfalls which are often frozen. A couple of hours on this enchanting trail and you arrive in Dole, where you spend the night in a teahouse.\r\n\r\nOne of the eight-thousanders, Cho Oyu (8,153m) is seen towards the north from Gokyo. There are many great views all around the valley. The most popular among them is seen by ascending a ridge for 2-3 hours to the north-west to reach a small summit. Enjoy a spectacular panoramic view extending from Cho Oyu and Everest, to Lhotse all the way to Makalu. \r\n\r\n', 'Mountaineering', 'img/gokyo.jpg'),
(18, 'Fewa Lake', 'Pokhara', NULL, NULL, 0.00, 'Fewa Lake is a freshwater lake in Nepal formerly called Baidam Tal. The lake is famous for the reflection of mount Machhapuchhre and other mountain peaks of the Annapurna and Dhaulagiri ranges on its surface. \r\n\r\nPhewa Lake is the second largest lake in Pokhara, the lake bordering the forested hill. The view of Fishtail and other mountains reflected in the lake, the little island and the Tal Barahi temple in the middle, the white stupa on the top of the hill, the gliders jumping from Sarangkot, the Ultralight soaring up high and paralleled each other, buzzing, all at once can be seized in the mild breeze over the Phewa Lake.</br></br>\r\nAt Phewa Lake, you can choose a different type of boats; the traditional or old-fashioned, rowboats, and sailboats to modern fibred-body sailboats and wooden ones. You can do boating in Phewa Lake throughout the year except for monsoon season. The trip of boating highlights is View fishtail, nearest hills, and Sarangkot.\r\n\r\nYou can enjoy the sunrise and sunset from the Lakeside while doing boating.\r\nYou can experience a fascinating scene of Paragliding and Ultralight in the sky and the thick forest around the lake.\r\nYou can go to the little island and visit the temple of Tal Barahi and around it.\r\n\r\n', 'Boating', 'img/fewa.jpg'),
(19, 'World Peace Pagoda', 'Pokhara', '08:00:00', '18:00:00', 0.00, 'World Peace Pagoda, also known as Shanti Stupa, is a Buddhist pagoda style monument located on a hilltop overlooking the Fewa Lake. The Sanskrit word \'shanti\' means peace and as the name goes, this pagoda is dedicated to world peace. This is the second shanti stupa in Nepal after the one in Lumbini. This stupa which is now a leading tourist attraction in Pokhara offers amazing trekking option from the southeastern shore of Phewa Lake. Apart from stunning view of the mountains and lake, one can also enjoy a splendid view of sunrise and sunset from this stupa.\r\n\r\nBuilt just after World War 2 by Buddhist monks from the Japanese Nipponzan Myohoji organization this World Peace Pagoda is one of over 80 world peace pagodas in the world today. They are built to inspire peace for all races & creeds.\r\n</br></br> The World Peace Pagoda in Pokhara offers a lot more than just a stupa. It\'s a lake, a small trek and a mountain view. Add in some side trips and it\'s great little outing to do while in Pokhara.\r\n\r\nOnce at the top make you way to World Peace Pagoda. There are several small cafes nearby and an excellent viewing platform to see the Annapurna mountain range. To make your way back, either follow the trail back to the shore and hire a boat back to lakeside. Or continue on past the Pagoda to the main road, or the foot trail leading down to Chhorepatan or along Pardi Bazaar. Once there take a mini bus back to Lakeside in Pokhara.\r\n', 'Cultural Tours', 'img/pagoda.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `transport`
--

CREATE TABLE `transport` (
  `ID` int(11) NOT NULL,
  `Means` varchar(10) NOT NULL,
  `Source` varchar(20) NOT NULL,
  `Destination` varchar(20) NOT NULL,
  `Redirect` text DEFAULT NULL,
  `minCost` decimal(10,2) DEFAULT NULL,
  `maxCost` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transport`
--

INSERT INTO `transport` (`ID`, `Means`, `Source`, `Destination`, `Redirect`, `minCost`, `maxCost`) VALUES
(1, 'Airways', 'Bhairahwa', 'KathmanduValley', 'https://www.yetiairlines.com/', '3300.00', '5500.00'),
(2, 'Airways', 'Bhairahwa', 'Pokhara', 'https://www.yetiairlines.com/', '3500.00', '6500.00'),
(3, 'Airways', 'Bharatpur', 'KathmanduValley', 'https://www.yetiairlines.com/', '3000.00', '4000.00'),
(4, 'Airways', 'Bharatpur', 'Pokhara', 'https://www.yetiairlines.com/', '3500.00', '6000.00'),
(5, 'Airways', 'Biratnagar', 'KathmanduValley', 'https://www.yetiairlines.com/', '5000.00', '7500.00'),
(6, 'Airways', 'Kathmandu', 'Pokhara', 'https://www.yetiairlines.com/', '3000.00', '5000.00'),
(7, 'Airways', 'Kathmandu', 'Solukhumbu', 'https://www.yetiairlines.com/', '1500.00', '15000.00'),
(8, 'Airways', 'Nepalgunj', 'KathmanduValley', 'https://www.yetiairlines.com/', '4000.00', '4000.00'),
(9, 'Airways', 'Nepalgunj', 'Pokhara', 'https://www.yetiairlines.com/', '5000.00', '5000.00'),
(10, 'Airways', 'Pokhara', 'KathmanduValley', 'https://www.yetiairlines.com/', '3000.00', '5000.00'),
(11, 'Bus', 'Bhairahwa', 'KathmanduValley', 'https://bussewa.com/', '900.00', '1400.00'),
(12, 'Bus', 'Bhairahwa', 'Pokhara', 'https://bussewa.com/', '900.00', '1200.00'),
(13, 'Bus', 'Bhairahwa', 'Solukhumbu', 'https://bussewa.com/', '1800.00', '2000.00'),
(14, 'Bus', 'Bharatpur', 'KathmanduValley', 'https://bussewa.com/', '500.00', '900.00'),
(15, 'Bus', 'Bharatpur', 'Pokhara', 'https://bussewa.com/', '750.00', '950.00'),
(16, 'Bus', 'Bharatpur', 'Solukhumbu', 'https://bussewa.com/', '1400.00', '1800.00'),
(17, 'Bus', 'Biratnagar', 'KathmanduValley', 'https://bussewa.com/', '1300.00', '1500.00'),
(18, 'Bus', 'Biratnagar', 'Pokhara', 'https://bussewa.com/', '1000.00', '1500.00'),
(19, 'Bus', 'Biratnagar', 'Solukhumbu', 'https://bussewa.com/', '1000.00', '1500.00'),
(20, 'Bus', 'Kathmandu', 'Pokhara', 'https://bussewa.com/', '700.00', '1000.00'),
(21, 'Bus', 'Kathmandu', 'Solukhumbu', 'https://bussewa.com/', '1000.00', '1500.00'),
(22, 'Bus', 'Nepalgunj', 'KathmanduValley', 'https://bussewa.com/', '1600.00', '2000.00'),
(23, 'Bus', 'Nepalgunj', 'Pokhara', 'https://bussewa.com/', '1400.00', '1800.00'),
(24, 'Bus', 'Nepalgunj', 'Solukhumbu', 'https://bussewa.com/', '2000.00', '2500.00'),
(25, 'Bus', 'Pokhara', 'KathmanduValley', 'https://bussewa.com/', '700.00', '1000.00'),
(26, 'Bus', 'Pokhara', 'Solukhumbu', 'https://bussewa.com/', '1500.00', '2000.00'),
(27, 'Car', 'Bhairahwa', 'KathmanduValley', 'https://nepalvehiclerental.com/price/', '20000.00', '25000.00'),
(28, 'Car', 'Bhairahwa', 'Pokhara', 'http://www.tigertravel.com.np/service/vehicle-hire.html', '20000.00', '25000.00'),
(29, 'Car', 'Bhairahwa', 'Solukhumbu', 'http://www.tigertravel.com.np/service/vehicle-hire.html', '25000.00', '30000.00'),
(30, 'Car', 'Bharatpur', 'KathmanduValley', 'https://www.viator.com/tours/Kathmandu/Private-Transfer-Kathmandu-to-Chitwan-Hotels/d5109-8076P69', '17000.00', '25000.00'),
(31, 'Car', 'Bharatpur', 'Pokhara', 'http://www.tigertravel.com.np/service/vehicle-hire.html', '15000.00', '20000.00'),
(32, 'Car', 'Bharatpur', 'Solukhumbu', 'http://www.tigertravel.com.np/service/vehicle-hire.html', '20000.00', '30000.00'),
(33, 'Car', 'Biratnagar', 'KathmanduValley', 'https://nepalvehiclerental.com/price/', '15000.00', '30000.00'),
(34, 'Car', 'Biratnagar', 'Pokhara', 'http://www.tigertravel.com.np/service/vehicle-hire.html', '25000.00', '30000.00'),
(35, 'Car', 'Biratnagar', 'Solukhumbu', 'http://www.tigertravel.com.np/service/vehicle-hire.html', '15000.00', '20000.00'),
(36, 'Car', 'Kathmandu', 'Pokhara', 'https://www.viator.com/tours/Kathmandu/Private-transportation-to-Pokhara-from-Kathmandu/d5109-69301P10', '17000.00', '25000.00'),
(37, 'Car', 'Kathmandu', 'Solukhumbu', 'https://nepalvehiclerental.com/price/', '15000.00', '25000.00'),
(38, 'Car', 'Nepalgunj', 'KathmanduValley', 'https://nepalvehiclerental.com/price/', '25000.00', '35000.00'),
(39, 'Car', 'Nepalgunj', 'Pokhara', 'http://www.tigertravel.com.np/service/vehicle-hire.html', '25000.00', '30000.00'),
(40, 'Car', 'Nepalgunj', 'Solukhumbu', 'http://www.tigertravel.com.np/service/vehicle-hire.html', '35000.00', '40000.00'),
(41, 'Car', 'Pokhara', 'KathmanduValley', 'https://www.viator.com/tours/Kathmandu/Private-transportation-to-Pokhara-from-Kathmandu/d5109-69301P10', '20000.00', '30000.00'),
(42, 'Car', 'Pokhara', 'Solukhumbu', 'http://www.tigertravel.com.np/service/vehicle-hire.html', '25000.00', '35000.00');

-- --------------------------------------------------------

--
-- Stand-in structure for view `transport_pref`
-- (See below for the actual view)
--
CREATE TABLE `transport_pref` (
`current_location` varchar(30)
,`city_preferred` varchar(30)
,`avg_trans` decimal(14,6)
);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `contact` decimal(10,0) DEFAULT NULL,
  `PASSWORD` varchar(20) DEFAULT NULL,
  `userType` varchar(20) DEFAULT 'tourist'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `address`, `email`, `contact`, `PASSWORD`, `userType`) VALUES
(1, 'Kaz Brekker', 'Illam', 'kazbrekker@gmail.com', '989898', '123', 'tourist'),
(2, 'Namrata Das', 'Butwal', 'dnamrata.2016@gmail.com', '9821557441', '12345', 'Admin'),
(3, 'Ram Sharma', 'Biratnagar', 'ramsharma@gmail.com', '9898982131', 'ram@123', 'tourist'),
(4, 'Sita Shrestha', 'Chitwan ', 'sita@gmail.com', '9812345678', 'sita@123', 'tourist'),
(5, 'Phillips V', 'Biratnagar', 'nh74266@gmail.com', '9898982131', '3444', 'tourist'),
(6, 'Mohan Sharma', 'Dhankuta', 'mohan@gmail.com', '9090909090', 'mohan@123', 'tourist'),
(7, 'Ian Howard', 'Nepalgunj', 'ian@gmail.com', '912345678', 'ian@123', 'tourist'),
(8, 'Hari Sharma', 'Nepalgunj', 'sharma@gmail.com', '980124560', 'sharma@123', 'tourist'),
(9, 'Shyam Sharma', 'Butwal', 'shyam@yahoo.com', '9812345671', 'shyam12345', 'tourist'),
(10, 'Abhinav Mishra', 'Dhading', 'mishra@gmail.com', '9876543210', 'mishra@12345', 'tourist'),
(11, 'Matthew Howard', 'Chitwan', 'howard@gmail.com', '9871234567', 'howard@12345', 'tourist'),
(12, 'Anirudh Arya', 'Doti', 'arya@gmail.com', '9898982131', '12345', 'tourist'),
(13, 'Rohan Malakar', 'Illam', 'malakar@gmail.com', '9876543224', 'malakar@123', 'tourist'),
(14, 'Adi', 'Kupondole', 'MayGodHelpYou@gmail.com', '98989988', 'YouAreSick', 'tourist'),
(15, 'Kapil Dewan', 'Butwal', 'dewan@gmail.com', '9878987898', 'dewan@123', 'tourist'),
(16, 'Neelam Karki', 'Kathmandu', 'neelamkarki643@gmail.com', '9812121212', 'nknk', 'Admin'),
(17, 'Rakshya Panta', 'Kathmandu', 'rakshyapnt@gmail.com', '9834343434', 'rakshya@123', 'Admin'),
(18, 'Jaya Singh', 'Gandaki', 'jaya@gmail.com', '984565166', 'jaya@123', 'tourist'),
(19, 'Mary Jane', 'Hetauda', 'mary@gmail.com', '9876543221', 'mary@123', 'tourist'),
(20, 'Astha Singh', 'Makwanpur', 'astha@gmail.com', '9876543219', '123', 'tourist');

-- --------------------------------------------------------

--
-- Structure for view `avg_budget`
--
DROP TABLE IF EXISTS `avg_budget`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `avg_budget`  AS SELECT `preference`.`city_preferred` AS `city_preferred`, avg(`preference`.`lodging_budget`) AS `avg_lodge_budget`, avg(`preference`.`foodingBudget`) AS `avg_food_budget`, avg(`preference`.`transport_budget`) AS `avg_trans_budget`, avg(`preference`.`siteseeing_budget`) AS `avg_site_budget` FROM `preference` GROUP BY `preference`.`city_preferred` ;

-- --------------------------------------------------------

--
-- Structure for view `city_count`
--
DROP TABLE IF EXISTS `city_count`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `city_count`  AS SELECT `preference`.`city_preferred` AS `city_preferred`, count(`preference`.`city_preferred`) AS `countnum` FROM `preference` GROUP BY `preference`.`city_preferred` ;

-- --------------------------------------------------------

--
-- Structure for view `hotels_cost`
--
DROP TABLE IF EXISTS `hotels_cost`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `hotels_cost`  AS SELECT `hotels`.`city` AS `city`, avg(`hotels`.`minCost`) AS `minCost`, avg(`hotels`.`maxCost`) AS `maxCost` FROM `hotels` GROUP BY `hotels`.`city` ;

-- --------------------------------------------------------

--
-- Structure for view `restaurant_cost`
--
DROP TABLE IF EXISTS `restaurant_cost`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `restaurant_cost`  AS SELECT `restaurants`.`city` AS `city`, avg(`restaurants`.`minCost`) AS `minCost`, avg(`restaurants`.`maxCost`) AS `maxCost` FROM `restaurants` GROUP BY `restaurants`.`city` ;

-- --------------------------------------------------------

--
-- Structure for view `transport_pref`
--
DROP TABLE IF EXISTS `transport_pref`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `transport_pref`  AS SELECT `preference`.`current_location` AS `current_location`, `preference`.`city_preferred` AS `city_preferred`, avg(`preference`.`transport_budget`) AS `avg_trans` FROM `preference` GROUP BY `preference`.`current_location`, `preference`.`city_preferred` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `hotels`
--
ALTER TABLE `hotels`
  ADD PRIMARY KEY (`id`),
  ADD KEY `city` (`city`);

--
-- Indexes for table `preference`
--
ALTER TABLE `preference`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tourist_id` (`tourist_id`);

--
-- Indexes for table `restaurants`
--
ALTER TABLE `restaurants`
  ADD PRIMARY KEY (`id`),
  ADD KEY `city` (`city`);

--
-- Indexes for table `touristspot`
--
ALTER TABLE `touristspot`
  ADD PRIMARY KEY (`id`),
  ADD KEY `city` (`city`);

--
-- Indexes for table `transport`
--
ALTER TABLE `transport`
  ADD PRIMARY KEY (`ID`,`Means`,`Source`,`Destination`),
  ADD KEY `Destination` (`Destination`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `hotels`
--
ALTER TABLE `hotels`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `preference`
--
ALTER TABLE `preference`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=119;

--
-- AUTO_INCREMENT for table `restaurants`
--
ALTER TABLE `restaurants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `touristspot`
--
ALTER TABLE `touristspot`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `transport`
--
ALTER TABLE `transport`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `hotels`
--
ALTER TABLE `hotels`
  ADD CONSTRAINT `hotels_ibfk_1` FOREIGN KEY (`city`) REFERENCES `city` (`Name`);

--
-- Constraints for table `preference`
--
ALTER TABLE `preference`
  ADD CONSTRAINT `preference_ibfk_1` FOREIGN KEY (`tourist_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `restaurants`
--
ALTER TABLE `restaurants`
  ADD CONSTRAINT `restaurants_ibfk_1` FOREIGN KEY (`city`) REFERENCES `city` (`Name`);

--
-- Constraints for table `touristspot`
--
ALTER TABLE `touristspot`
  ADD CONSTRAINT `touristspot_ibfk_1` FOREIGN KEY (`city`) REFERENCES `city` (`Name`);

--
-- Constraints for table `transport`
--
ALTER TABLE `transport`
  ADD CONSTRAINT `transport_ibfk_1` FOREIGN KEY (`Destination`) REFERENCES `city` (`Name`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
