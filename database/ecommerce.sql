-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 09, 2024 at 01:56 PM
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
-- Database: `ecommerce`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_users`
--

CREATE TABLE `admin_users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admin_users`
--

INSERT INTO `admin_users` (`id`, `username`, `password`) VALUES
(1, 'admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `banner`
--

CREATE TABLE `banner` (
  `id` int(11) NOT NULL,
  `heading1` varchar(255) NOT NULL,
  `heading2` varchar(255) NOT NULL,
  `btn_txt` varchar(255) DEFAULT NULL,
  `btn_link` varchar(55) DEFAULT NULL,
  `image` varchar(255) NOT NULL,
  `order_no` int(11) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `banner`
--

INSERT INTO `banner` (`id`, `heading1`, `heading2`, `btn_txt`, `btn_link`, `image`, `order_no`, `status`) VALUES
(5, 'Fashionista', 'Collection 2024', 'shop now', 'product.php', '836649609_232597654_elegant-young-woman-wearing-summer-dress-straw-hat-sunglasses-thinking-about-her-summer-vacation-side-view-woman-with-hand-chin-isolated-pastel-blue-wall_231208-7995.jpg', 0, 1),
(6, 'Shopping', 'Premium products', 'Explore', 'product.php', '674167317_pexels-photo-2584269.jpeg', 0, 1),
(9, 'Season Shpping', 'Seasonal Outfits', 'Explore', 'product.php', '933220707_pexels-photo-2836486.jpg', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `categories` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `categories`, `status`) VALUES
(1, 'kid\'s section', 1),
(2, 'men\'s section', 1),
(4, 'Women\'s section', 1);

-- --------------------------------------------------------

--
-- Table structure for table `color_master`
--

CREATE TABLE `color_master` (
  `id` int(11) NOT NULL,
  `color` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `color_master`
--

INSERT INTO `color_master` (`id`, `color`, `status`) VALUES
(1, 'Red', 1),
(3, 'Black', 1),
(4, 'Pink', 1),
(5, 'Green', 1);

-- --------------------------------------------------------

--
-- Table structure for table `contact_us`
--

CREATE TABLE `contact_us` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(75) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `comment` text NOT NULL,
  `added_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `contact_us`
--

INSERT INTO `contact_us` (`id`, `name`, `email`, `mobile`, `comment`, `added_on`) VALUES
(5, 'rohit', 'rohit@gmail.com', '8285399278', 'rohit here.', '2024-07-08 11:54:42');

-- --------------------------------------------------------

--
-- Table structure for table `coupon_master`
--

CREATE TABLE `coupon_master` (
  `id` int(11) NOT NULL,
  `coupon_code` varchar(50) NOT NULL,
  `coupon_value` int(11) NOT NULL,
  `coupon_type` varchar(10) NOT NULL,
  `cart_min_value` int(11) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `coupon_master`
--

INSERT INTO `coupon_master` (`id`, `coupon_code`, `coupon_value`, `coupon_type`, `cart_min_value`, `status`) VALUES
(1, 'First50', 1000, 'Rupee', 1500, 1),
(2, 'First60', 20, 'Percentage', 1000, 1);

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `address` varchar(250) NOT NULL,
  `city` varchar(50) NOT NULL,
  `pincode` int(11) NOT NULL,
  `payment_type` varchar(20) NOT NULL,
  `total_price` float NOT NULL,
  `payment_status` varchar(20) NOT NULL,
  `order_status` int(11) NOT NULL,
  `coupon_id` varchar(11) NOT NULL,
  `coupon_value` varchar(50) NOT NULL,
  `coupon_code` varchar(50) NOT NULL,
  `added_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`id`, `user_id`, `address`, `city`, `pincode`, `payment_type`, `total_price`, `payment_status`, `order_status`, `coupon_id`, `coupon_value`, `coupon_code`, `added_on`) VALUES
(27, 4, 'nethues', 'delhi', 123456, 'COD', 899, 'pending', 2, '', '', '', '2024-07-09 03:01:52'),
(28, 4, 'nethues', 'delhi', 123456, 'COD', 1504, 'pending', 1, '2', '376', 'First60', '2024-07-09 03:30:12'),
(29, 4, 'nethues', 'delhi', 123456, 'COD', 300, 'pending', 1, '', '', '', '2024-07-09 03:32:57');

-- --------------------------------------------------------

--
-- Table structure for table `order_detail`
--

CREATE TABLE `order_detail` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `price` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `order_detail`
--

INSERT INTO `order_detail` (`id`, `order_id`, `product_id`, `qty`, `price`) VALUES
(26, 27, 61, 1, 899),
(27, 28, 62, 1, 1400),
(28, 28, 57, 1, 300),
(29, 28, 58, 1, 180),
(30, 29, 57, 1, 300);

-- --------------------------------------------------------

--
-- Table structure for table `order_status`
--

CREATE TABLE `order_status` (
  `id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `order_status`
--

INSERT INTO `order_status` (`id`, `name`) VALUES
(1, 'Pending'),
(2, 'Processing'),
(3, 'Shipped'),
(4, 'Canceled'),
(5, 'Complete');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `categories_id` int(11) NOT NULL,
  `sub_categories_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `mrp` float NOT NULL,
  `price` float NOT NULL,
  `qty` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `short_desc` varchar(2000) NOT NULL,
  `description` text NOT NULL,
  `best_seller` int(11) NOT NULL,
  `meta_title` varchar(2000) NOT NULL,
  `meta_desc` varchar(2000) NOT NULL,
  `meta_keyword` varchar(2000) NOT NULL,
  `status` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `categories_id`, `sub_categories_id`, `name`, `mrp`, `price`, `qty`, `image`, `short_desc`, `description`, `best_seller`, `meta_title`, `meta_desc`, `meta_keyword`, `status`) VALUES
(17, 2, 1, 'Men\'s polo neck tshirt', 599, 449, 23, '972653525_4xl-db1024-3bros-original-imagt7byhhrqdkym.jpg', 'A sophisticated and versatile essential, the polo neck men\'s t-shirt combines classic style with modern comfort, featuring a high neckline that adds a touch of refinement to casual wear. Perfect for layering or wearing solo, it offers timeless appeal with a contemporary twist.', 'A polo neck men\'s t-shirt is a stylish and practical garment that features a high, close-fitting neckline, typically extending up to the chin or slightly below. This design provides extra warmth and coverage, making it a versatile choice for cooler weather or layering under jackets and sweaters. The t-shirt itself is usually made from soft and breathable materials like cotton or a blend, ensuring comfort throughout the day. Its minimalist yet elegant appearance makes it suitable for both casual and semi-formal occasions, offering a sleek alternative to traditional crew-neck or V-neck styles. Whether paired with jeans for a relaxed look or under a blazer for a more polished ensemble, the polo neck t-shirt effortlessly blends comfort with understated sophistication.', 1, '\"Men\'s Polo Neck T-Shirts: Timeless Style and Comfort\"', 'Discover timeless style and comfort with our men\'s polo neck t-shirts. Perfect for layering or wearing solo, these shirts offer a sophisticated look with a high neckline for added warmth and versatility. Crafted from soft, breathable materials, they provide all-day comfort and effortlessly elevate your casual or semi-formal attire.', 'polo neck t-shirt', 1),
(18, 2, 1, 'Men\'s self design round neck', 299, 149, 12, '739959284_s-tsrt-22-kajaru-original-imahfuynsmqcgbzc.jpg', 'Elevate your casual wardrobe with our men\'s self-designed round neck t-shirt. Featuring a unique self-design pattern, this t-shirt blends contemporary style with ultimate comfort. Perfect for everyday wear, it pairs effortlessly with jeans or shorts, making it a versatile addition to your collection.', 'Discover the epitome of style and comfort with our men\'s self-design round neck t-shirt. Crafted for the modern man, this t-shirt boasts a unique self-design pattern that adds a touch of individuality to your wardrobe. Made from high-quality materials, it offers a soft and breathable feel, ensuring all-day comfort. Whether you\'re lounging at home, heading to a casual outing, or meeting friends, this t-shirt is a perfect choice. Pair it with your favorite jeans or shorts for a laid-back yet stylish look that exudes confidence and personality. Ideal for every occasion, our men\'s self-design round neck t-shirt is a must-have staple in any fashion-conscious man\'s closet.', 0, '\"Men\'s Self-Design Round Neck T-Shirt: Style and Comfort Combined\"', 'Discover our men\'s self-design round neck t-shirt, combining unique patterns with comfort. Perfect for any occasion, crafted for modern style.', 'self design round neck', 1),
(19, 2, 1, 'Henley neck cotton tshirt', 299, 249, 21, '162330317_s-tsbuhn-dp-d126-tripr-original-imah25g87ynysyzu.jpg', 'A classic staple redefined, our Henley neck cotton t-shirt blends timeless charm with modern comfort. Featuring a buttoned placket and crafted from soft cotton, it\'s perfect for casual elegance in any setting.', 'Embrace casual sophistication with our Henley neck cotton t-shirt, a versatile addition to your wardrobe. This shirt features a stylish buttoned placket at the neckline, adding a touch of refinement to its classic design. Crafted from premium cotton, it offers exceptional comfort and breathability, making it ideal for everyday wear. Whether paired with jeans for a relaxed look or layered under a jacket for a more polished ensemble, our Henley neck t-shirt effortlessly combines style and comfort, ensuring you look and feel great throughout the day.', 0, '\"Men\'s Henley Neck Cotton T-Shirt: Casual Elegance and Comfort\"', 'Discover comfort and casual elegance with our men\'s Henley neck cotton t-shirt. Crafted for style and comfort, perfect for any occasion.', 'Meta keywords are no longer used by major search engines like Google for ranking purposes. It\'s more effective to focus on creating high-quality content that accurately describes your product or service. For a men\'s Henley neck cotton t-shirt, relevant keywords could include \"Henley neck t-shirt,\" \"men\'s cotton t-shirt,\" \"casual elegance,\" \"comfortable men\'s clothing,\" and \"stylish men\'s fashion.', 1),
(20, 2, 1, 'Men\'s striped round neck', 250, 199, 21, '553376421_4xl-dv24solidgrey-diversify-original-imagczhkgb4ezgqr.jpg', 'Upgrade your casual wardrobe with our men\'s striped round neck t-shirt. Featuring classic stripes and a comfortable fit, it\'s the perfect blend of style and versatility.', 'Step up your casual style with our men\'s striped round neck t-shirt. Designed for effortless sophistication, this t-shirt combines classic stripes with a modern silhouette, offering a versatile addition to any wardrobe. Crafted from premium materials, it ensures exceptional comfort and durability throughout the day. Whether you\'re heading out for a relaxed weekend or layering it under a jacket for a smart-casual look, our striped round neck t-shirt promises both comfort and timeless appeal. Perfect for pairing with jeans or chinos, it\'s an essential piece for every fashion-forward man.', 0, '\"Men\'s Striped Round Neck T-Shirt: Classic Style and Comfort\"', 'Explore timeless style and comfort with our men\'s striped round neck t-shirt. Crafted for versatility and featuring classic stripes, perfect for any occasion.', 'striped t-shirt', 1),
(21, 2, 1, 'Green Plain Tshirt', 150, 100, 16, '932790130_m-tstsrt-21-kajaru-original-imah2ffqwf4ghwqz.jpg', 'A classic plain t-shirt, versatile and comfortable, perfect for everyday wear and easy to style.', 'A plain t-shirt is a staple piece of clothing characterized by its simplicity and versatility. Typically made from cotton or a cotton-blend fabric, it offers comfort and breathability, making it ideal for various occasions and climates. Its minimalist design allows it to be easily paired with jeans, shorts, skirts, or layered under jackets and sweaters. Available in a spectrum of colors and fits, from crew neck to V-neck styles, plain t-shirts cater to diverse tastes and preferences while remaining a timeless wardrobe essential.', 0, '\"Essential Plain T-Shirts: Versatile Comfort for Every Wardrobe\"', '\"Discover our collection of plain t-shirts, crafted for comfort and versatility. Available in various colors and styles, these wardrobe essentials are perfect for effortless everyday wear and easy layering.\"', 'plain tshirt', 1),
(22, 2, 1, 'Men\'s checkered polo neck', 999, 749, 13, '338384355_s-ausk0578-ausk-original-imagt4syqg7fafzb.jpg', '\"Men\'s checkered polo neck: A stylish blend of classic design and modern comfort, perfect for casual outings and relaxed settings.\"', '\"A men\'s checkered polo neck offers a timeless yet contemporary look, combining the charm of checkered patterns with the casual comfort of a polo shirt. Ideal for both casual and semi-formal occasions, it pairs effortlessly with jeans or chinos for a smart and laid-back style.\"', 0, '\"Men\'s Checkered Polo Neck Shirts: Classic Style with Modern Comfort\"', '\"Explore men\'s checkered polo neck shirts, blending classic style with modern comfort. Perfect for casual and semi-formal occasions, pair effortlessly with jeans or chinos for a versatile look.\"', 'checkered polo neck', 1),
(23, 4, 6, 'floral printed daily wear saree', 1299, 999, 21, '718408697_free-daily-wear-saree-print-saree-saree-new-2023-simple-chiffon-original-imagwgwhbnebkfbt.jpg', '\"A floral printed daily wear saree, designed for effortless elegance and comfort in everyday settings.\"', 'This floral printed daily wear saree combines the charm of traditional motifs with contemporary comfort, making it an ideal choice for daily wear. The lightweight fabric ensures ease of movement throughout the day, while the vibrant floral patterns add a touch of elegance. Perfect for various occasions, from work to casual outings, it pairs beautifully with minimal accessories for a stylish yet effortless look.', 1, '\"Floral Printed Daily Wear Saree: Effortless Elegance for Everyday Comfort\"', '\"Discover our floral printed daily wear saree, blending traditional charm with modern comfort. Ideal for everyday elegance, perfect for versatile styling and effortless wear.\"', 'floral saree', 1),
(24, 4, 6, 'Embroided Georgette saree', 1500, 1399, 11, '588226692_free-fk-ys-p1-bhargvi-purple-yashika-unstitched-original-imah2cxhkhsefmzh.jpg', '\"An embroidered georgette saree, exuding elegance and sophistication, ideal for special occasions and formal gatherings.\"', 'An embroidered georgette saree embodies grace and refinement, crafted for those special occasions where elegance is paramount. Georgette, known for its lightweight and flowing drape, enhances the saree\'s allure. The intricate embroidery adds a touch of artistry and intricacy, elevating its appeal further. Perfect for weddings, parties, or formal events, this saree effortlessly combines tradition with contemporary style, making it a cherished addition to any wardrobe seeking sophistication and timeless beauty.', 0, '\"Embroidered Georgette Saree: Timeless Elegance for Special Occasions\"', '\"Elevate your elegance with our embroidered georgette sarees, perfect for special occasions. Discover intricate designs that blend tradition and sophistication beautifully.\"', 'embroided saree', 1),
(25, 4, 6, 'Lyca blend saree', 899, 799, 14, '650873783_free-dbghst071020osg-desh-bidesh-unstitched-original-imafwfnfqagy9qmv.jpg', '\"A lycra blend saree offers a modern twist on traditional elegance, combining comfort with a sleek, drapey look.\"', 'A lycra blend saree represents a contemporary take on traditional attire, blending the elegance of a saree with the comfort and flexibility of lycra fabric. This blend ensures a smooth, sleek drape that flatters the body while allowing ease of movement. Ideal for various occasions, from formal events to casual gatherings, lycra blend sarees are often favored for their versatility and modern appeal. They come in a variety of colors, patterns, and embellishments, catering to diverse tastes and preferences while maintaining the timeless charm of traditional Indian attire.', 0, '\"Lycra Blend Sarees: Modern Comfort with Timeless Elegance\"', '\"Discover lycra blend sarees, combining modern comfort with timeless elegance. Perfect for various occasions, these sarees offer a sleek drape and contemporary appeal.\"', 'lyca saree', 1),
(26, 4, 6, 'Banarasi blend saree', 1100, 1000, 12, '990625703_free-kara115-pink-sariya-original-imafjhruh82javzs.jpg', '\"A Banarasi saree is a timeless symbol of elegance and craftsmanship, renowned for its luxurious silk fabric and intricate zari work, perfect for weddings and special occasions.\"', 'A Banarasi saree is a hallmark of exquisite craftsmanship and opulence, originating from the city of Varanasi (formerly known as Banaras) in India. These sarees are characterized by their rich silk fabric and intricate zari work, which often includes elaborate patterns of gold and silver threads. The weaving technique used in Banarasi sarees is centuries-old, passed down through generations of skilled artisans.\r\n\r\nEach Banarasi saree is a masterpiece, meticulously handcrafted to perfection. They are revered for their luxurious texture, shimmering appearance, and timeless appeal, making them a preferred choice for weddings, grand celebrations, and festive occasions. The sarees typically feature motifs inspired by Mughal designs, floral patterns, or geometric shapes, adding to their regal allure.\r\n\r\nIn addition to their aesthetic beauty, Banarasi sarees hold cultural significance in Indian tradition and are often passed down as heirlooms from one generation to the next. They are available in a spectrum of colors, from vibrant hues to subtle pastels, catering to varied tastes and preferences. Whether draped for a bridal ensemble or worn as an elegant statement piece, a Banarasi saree epitomizes grace, heritage, and the enduring legacy of Indian craftsmanship.', 0, '\"Banarasi Sarees: Timeless Elegance and Craftsmanship\"', '\"Explore the timeless elegance and intricate craftsmanship of Banarasi sarees. Perfect for weddings and special occasions, these luxurious silk sarees are adorned with exquisite zari work and cherished for their cultural significance.\"', 'banarasi saree', 1),
(27, 4, 6, 'Self design georgette saree', 999, 899, 13, '702002373_free-1051d-fashion-day-original-imafnmmjgzj8pwsh.jpg', '\"A self-designed georgette saree, crafted with intricate patterns and textures, combining elegance with modern style for a sophisticated look.\"', 'A self-designed georgette saree embodies contemporary elegance with its intricate patterns and textures meticulously crafted into the fabric. Georgette, known for its lightweight and flowing drape, enhances the saree\'s graceful appearance. These sarees often feature unique designs created through techniques like printing, embossing, or weaving, reflecting modern trends while preserving traditional craftsmanship.\r\n\r\nPerfect for a variety of occasions, from formal gatherings to festive celebrations, self-designed georgette sarees offer versatility and sophistication. They come in a range of colors and embellishments, catering to diverse tastes and preferences. Whether adorned with subtle motifs or bold prints, these sarees make a statement of individual style and cultural heritage, making them a beloved choice among fashion enthusiasts seeking a blend of classic charm and contemporary flair.', 0, '\"Self-Designed Georgette Sarees: Contemporary Elegance and Craftsmanship\"', '\"Discover our collection of self-designed georgette sarees, blending contemporary elegance with intricate craftsmanship. Perfect for various occasions, these sarees offer a graceful drape and modern style.\"', 'self design sarees', 1),
(28, 4, 6, 'Colored silk saree', 1299, 1199, 14, '192159863_free-karishma-navy-quexle-unstitched-original-imagyxhezx6phne8.jpg', '\"The colored navy Quaxelle saree exudes sophistication and charm, featuring a rich hue that complements various skin tones. Its luxurious fabric and intricate design make it ideal for both formal events and casual gatherings, ensuring a graceful and stylish appearance.\"', 'The colored navy Quaxelle saree is a striking blend of elegance and contemporary design. Made from high-quality fabric, it boasts a rich navy hue that adds a touch of sophistication to any occasion. The saree is adorned with intricate detailing and embellishments, showcasing meticulous craftsmanship. Its lightweight and flowing texture ensure comfort while draping beautifully, enhancing the wearer\'s grace and poise. Whether worn at weddings, parties, or cultural festivities, the navy Quaxelle saree stands out as a timeless choice for those who appreciate both tradition and modern aesthetics.', 0, '\"Colored Navy Quaxelle Saree: Elegance and Sophistication for Special Occasions\"', '\"Elevate your style with our colored navy Quaxelle saree, combining elegance and sophistication. Perfect for special occasions, this saree features intricate detailing and luxurious fabric for a graceful drape.\"', 'colored quaxelle saree', 1),
(29, 2, 4, 'Men\'s regular fit solid', 499, 350, 17, '923402497_l-frml-st2-vebnor-original-imahftaagqgqhmqr.jpg', '\"Men\'s regular fit solid shirts offer timeless style and comfort, perfect for everyday wear with a classic silhouette and versatile color options.\"', 'A men\'s regular fit solid shirt is a wardrobe staple that combines timeless style with everyday comfort. Designed with a classic silhouette that flatters most body types, these shirts are characterized by their solid color and versatility. Made from quality fabrics like cotton or blends, they offer breathability and ease of movement throughout the day.\r\n\r\nWhether paired with jeans for a casual outing or tucked into trousers for a more formal setting, these shirts adapt effortlessly to various occasions. Their simplicity allows for easy accessorizing with ties, jackets, or casual layers, making them a practical choice for both professional environments and leisure activities.\r\n\r\nAvailable in a spectrum of colors from muted tones to bold hues, men\'s regular fit solid shirts cater to diverse preferences and personal styles. Their enduring popularity lies in their ability to provide a polished, put-together look while ensuring comfort and ease of wear, making them an essential part of every man\'s wardrobe.', 0, '\"Men\'s Regular Fit Solid Shirts: Timeless Style and Comfort\"', '\"Discover men\'s regular fit solid shirts, offering timeless style and everyday comfort. Perfect for any occasion, these shirts come in a variety of versatile colors to complement your wardrobe.\"', 'regular fit shirt', 1),
(30, 2, 4, 'Men\'s relaxed Fit', 699, 456, 11, '286475984_xl-lmsh016805-locomotive-original-imahfuyjjeg6yrxv.jpg', '\"A men\'s relaxed fit shirt offers comfort and casual style with a looser silhouette, perfect for everyday wear and relaxed settings.\"', 'A men\'s relaxed fit shirt is designed for comfort and ease, offering a looser silhouette compared to traditional or slim fits. These shirts provide ample room in the chest, shoulders, and sleeves, ensuring unrestricted movement and a laid-back look. They are crafted from soft and breathable fabrics like cotton or blends, ideal for casual wear and relaxed environments.\r\n\r\nThe relaxed fit shirt is versatile, suitable for a variety of occasions from weekend outings to informal gatherings. It pairs well with jeans or chinos for a casual ensemble, allowing for effortless styling. Available in a range of colors and patterns, from classic solids to casual plaids, these shirts cater to different tastes and preferences.\r\n\r\nWhether worn untucked for a more casual vibe or tucked in for a slightly polished appearance, men\'s relaxed fit shirts offer a balance of comfort and style. They are favored by those who prioritize comfort without compromising on a smart and laid-back aesthetic.', 0, '\"Men\'s Relaxed Fit Shirts: Comfortable Style for Every Day\"', '\"Discover men\'s relaxed fit shirts, combining comfort with casual style for everyday wear. Available in various colors and patterns, perfect for relaxed settings and versatile styling.\"', 'relaxed fit', 1),
(31, 2, 4, 'formal fit', 497, 450, 13, '646783386_xl-prshct00-provogue-original-imahfj4fkfxg9wcd.jpg', '\"A formal fit shirt exudes sophistication with its tailored silhouette, ideal for professional settings and formal occasions.\"', 'A formal fit shirt epitomizes refined elegance and professionalism with its impeccably tailored silhouette. Designed to fit snugly without being restrictive, these shirts are crafted from high-quality fabrics such as cotton or blends, ensuring both comfort and durability. They often feature details like a pointed collar, French cuffs, and precise stitching, enhancing their sophisticated appeal.\r\n\r\nThese shirts are versatile pieces that can be paired with dress pants or suits for business meetings, conferences, or formal events. Their structured design creates a polished look that exudes confidence and competence in professional settings. Available in a variety of colors and patterns, from classic whites and blues to subtle stripes or checks, formal fit shirts offer options to suit individual preferences and corporate dress codes.\r\n\r\nWhether worn alone or layered under a blazer or suit jacket, a formal fit shirt remains a cornerstone of men\'s formal attire, representing timeless style and meticulous craftsmanship. Its ability to convey professionalism and attention to detail makes it an essential component of every wardrobe tailored for success.', 0, '\"Formal Fit Shirts: Sophisticated Style for Business and Events\"', '\"Explore our collection of formal fit shirts, crafted for sophistication and professionalism. Perfect for business settings and formal occasions, these shirts offer tailored comfort and timeless style.\"', 'formal fit', 1),
(32, 2, 4, 'Regular fit self design', 456, 234, 11, '341927170_xl-sscs24-csmssrt6019-campus-sutra-original-imagyzrskenp3fdm.jpg', '\"A regular fit self-designed shirt offers a balance of comfort and style, featuring unique patterns and textures that complement casual and semi-formal attire.\"', 'A regular fit self-designed shirt combines comfort with individual style, showcasing unique patterns and textures that set it apart. These shirts are crafted from quality materials, often cotton or blends, ensuring a comfortable fit throughout the day. The self-design aspect refers to intricate patterns, prints, or textures created specifically for the shirt, adding a touch of personality and flair.\r\n\r\nIdeal for both casual and semi-formal occasions, these shirts offer versatility in styling. They can be paired with jeans or chinos for a laid-back look, or dressed up with trousers and a blazer for a more polished appearance. The tailored fit provides a neat silhouette without being too snug, allowing for ease of movement and a flattering drape.\r\n\r\nAvailable in a range of colors and designs, from subtle motifs to bold prints, regular fit self-designed shirts cater to various tastes and preferences. They appeal to individuals who appreciate attention to detail and seek to express their personal style through their wardrobe choices. Whether worn at work, social gatherings, or weekend outings, these shirts make a statement of confident, stylish dressing.', 0, '\"Formal Fit Shirts: Sophisticated Style for Business and Events\"', '\"Explore our collection of regular fit self-designed shirts, blending comfort with unique patterns and textures. Perfect for casual and semi-formal settings, these shirts offer versatile styling options and individualized flair.\"', 'regular fit', 1),
(33, 2, 4, 'Regular fit checkerd', 496, 400, 12, '128765287_xl-a-wanted-allwin-paul-original-imahyhgcrhhdschf.jpg', '\"A regular fit checkered shirt combines classic style with comfort, featuring a timeless pattern that suits various casual and semi-formal occasions.\"', 'A regular fit checkered shirt blends timeless style with comfort, making it a versatile addition to any wardrobe. Crafted from quality fabrics like cotton or blends, these shirts offer a balance of breathability and durability. The checkered pattern, characterized by intersecting horizontal and vertical lines, adds a touch of classic elegance and versatility.\r\n\r\nIdeal for both casual and semi-formal settings, these shirts can be effortlessly paired with jeans or chinos for a relaxed look, or dressed up with trousers and a blazer for a more polished appearance. The regular fit ensures a comfortable silhouette that allows for ease of movement without being too loose or restrictive.\r\n\r\nAvailable in various colors and sizes, regular fit checkered shirts cater to different tastes and preferences. They appeal to individuals who appreciate traditional patterns and seek to incorporate timeless fashion elements into their wardrobe. Whether worn for a day at the office, a weekend brunch, or a casual outing, these shirts provide a stylish and adaptable choice for everyday wear.', 0, '\"Regular Fit Checkered Shirts: Timeless Style for Casual and Semi-Formal Wear\"', '\"Discover our collection of regular fit checkered shirts, blending timeless style with comfort. Perfect for casual and semi-formal occasions, these shirts offer versatile and classic patterns to complement any wardrobe.\"', 'regular fit checkered', 1),
(34, 2, 4, 'Slim fit printed shirt', 900, 900, 12, '165416830_s-4mss2693-02-snitch-original-imahy7h25jnymhxp.jpg', '\"A slim fit printed shirt combines modern style with a tailored silhouette, featuring eye-catching prints that add personality to any wardrobe.\"', 'A slim fit printed shirt merges contemporary fashion with a sleek, tailored silhouette, making it a standout piece in any wardrobe. Crafted from high-quality fabrics like cotton or blends, these shirts offer a close-fitting cut that accentuates the body\'s contours while allowing for comfortable movement.\r\n\r\nThe defining feature of these shirts is their eye-catching prints, which range from geometric patterns and abstract designs to floral motifs and artistic illustrations. These prints add a touch of personality and flair, making the shirt suitable for both casual outings and semi-formal occasions.\r\n\r\nIdeal for those who appreciate modern trends and want to make a stylish statement, slim fit printed shirts can be paired with jeans or chinos for a casual look, or dressed up with tailored trousers and a blazer for a more polished ensemble. Their versatility and ability to transition seamlessly between different settings make them a versatile choice for men looking to showcase their individuality through their attire.', 0, '\"Slim Fit Printed Shirts: Modern Style with Personalized Flair\"', '\"Elevate your wardrobe with our collection of slim fit printed shirts, blending modern style with personalized flair. Perfect for casual and semi-formal occasions, featuring a variety of eye-catching prints to suit your unique taste.\"', 'slim fit printed', 1),
(35, 2, 5, 'slim fit black trouser', 899, 899, 14, '555345090_32-bi-trouser-combraided-original-imagqtjmgrqzuhsz.jpg', 'Slim fit men\'s black trousers are a versatile wardrobe staple, combining modern style with classic sophistication. Tailored to contour the body without being overly tight, they offer a sleek silhouette that enhances any outfit. Perfect for both formal and casual occasions, these trousers exude confidence and are effortlessly paired with dress shirts or casual tees. Ideal for the fashion-forward man who values both comfort and sharp looks, they remain a timeless choice in any gentleman\'s collection.', 'Slim fit men\'s black trousers are tailored to provide a sleek and modern look while maintaining comfort and versatility. With a trimmer cut through the legs and a slightly tapered ankle, they flatter the silhouette and create a polished appearance. These trousers can effortlessly transition from office attire when paired with a crisp shirt and blazer to a more relaxed setting with a casual shirt or sweater. The black color adds a touch of elegance and pairs well with a variety of shoes, making them a wardrobe essential for any man seeking a stylish and contemporary aesthetic.', 0, '\"Shop Stylish Slim Fit Men\'s Black Trousers | Versatile & Modern\"', 'Discover slim fit men\'s black trousers, designed for a sleek and modern silhouette. Ideal for both formal and casual settings, these versatile pants combine comfort with sophistication. Perfect for pairing with shirts or sweaters, they elevate any outfit with timeless style and effortless elegance.', 'slim fit trouser', 1),
(36, 2, 5, 'men\'s regular fit grey trouser', 799, 799, 11, '828210410_30-phtr000006-highlander-original-imagwg5bbzukn7da.jpg', 'Men\'s regular fit grey trousers offer a classic and comfortable option for everyday wear. With a relaxed fit through the legs and a traditional waistline, these trousers provide ease of movement while maintaining a smart appearance. The neutral grey color complements various shirts and jackets, making them a versatile choice for both professional settings and casual outings. Perfect for men who prefer a timeless and comfortable style, these trousers are a wardrobe essential.', 'Men\'s regular fit grey trousers are a versatile wardrobe staple, offering comfort and classic style. Designed with a relaxed fit through the legs and a standard waistline, they provide ease of movement without compromising on a polished appearance. The neutral grey hue enhances their versatility, effortlessly pairing with a range of shirts and outerwear. Whether for the office or casual outings, these trousers are a reliable choice for men seeking a timeless and comfortable option that never goes out of fashion.', 0, '\"Men\'s Regular Fit Grey Trousers | Classic Comfort and Versatility\"', 'Discover men\'s regular fit grey trousers, offering timeless comfort and versatility. Perfect for both office and casual wear, these trousers provide a relaxed fit and pair effortlessly with a variety of outfits.', 'men\'s regular fit grey', 1),
(37, 2, 5, 'Men\'s slim fit khaki trouser', 1100, 1000, 12, '912772319_32-bi-trouser-combraided-original-imagyytzjcdmba5c.jpg', 'Slim fit khaki trousers combine modern style with casual comfort. Designed to hug the legs without being restrictive, they offer a sleek and tailored appearance. The khaki color adds versatility, easily transitioning from professional settings with a dress shirt to more relaxed outings with a casual tee. Ideal for the fashion-conscious man looking to balance style and ease, these trousers are a wardrobe essential for any season.', 'Slim fit khaki trousers are a contemporary wardrobe essential, blending sleek style with everyday comfort. These trousers are tailored to provide a streamlined silhouette that enhances the wearer\'s appearance while allowing freedom of movement. The khaki color adds a touch of versatility, making them suitable for a variety of occasions—from business casual settings paired with a crisp shirt to more relaxed outings with a sweater or polo. Perfect for the modern man who values both fashion and functionality, slim fit khaki trousers effortlessly combine sophistication with ease.', 0, '\"Shop Slim Fit Khaki Trousers for Men | Contemporary Style & Comfort\"', 'Discover slim fit khaki trousers for men, offering contemporary style and comfort. Perfect for various occasions, these tailored pants combine a streamlined silhouette with versatility, ideal for both business and casual wear.', 'slim fit khaki', 1),
(38, 2, 5, 'Men\'s loose fit green', 1500, 1200, 12, '654271631_34-hhmwts2402-fg-hubberholme-original-imahfps7jr5xehew.jpg', 'Men\'s loose fit green clothing typically offers a relaxed and comfortable style. The loose fit allows for ease of movement and breathability, making it ideal for casual wear or activities where comfort is key. The color green adds a natural and refreshing touch to the outfit, often associated with tranquility and the outdoors. Whether it\'s a loose green t-shirt, hoodie, or pants, this style combines practicality with a laid-back aesthetic.', 'Sure, here\'s a more detailed description of men\'s loose fit green clothing:\r\n\r\nMen\'s loose fit green clothing combines comfort with a casual, relaxed style. Typically made from soft and breathable fabrics like cotton or blends, these garments offer ample room for movement without clinging to the body. The loose fit is designed to provide a comfortable feel throughout the day, making it a popular choice for leisure activities, lounging at home, or casual outings.\r\n\r\nThe color green adds a versatile and nature-inspired element to the attire. Depending on the shade, green can range from vibrant and eye-catching to muted and earthy tones, allowing for a variety of styling options. Lighter greens evoke a sense of freshness and vitality, while darker greens can lend a more sophisticated or rugged look.\r\n\r\nCommon pieces of men\'s loose fit green clothing include t-shirts, hoodies, sweatshirts, and even pants or shorts. These items are often chosen for their practicality and ease of wear, suitable for both indoor and outdoor settings. Whether paired with jeans for a laid-back weekend look or worn with athletic shorts for a workout, loose fit green clothing offers versatility and comfort without sacrificing style.', 0, '\"Discover Comfort and Style: Men\'s Loose Fit Green Clothing\"', 'Explore men\'s loose fit green clothing for comfort and style. Discover a range of casual wear including t-shirts, hoodies, and more, designed for relaxed everyday wear.', 'loose fit green', 1),
(39, 2, 5, 'Formal fit black', 1500, 1499, 14, '526255081_32-el-p-cot-el-cielo-original-imah26hz6wvzb4hs.jpg', 'A men\'s formal fit in black exudes timeless elegance and sophistication. It combines sleek tailoring with a classic color that is versatile and authoritative. Perfect for various formal occasions, it commands attention while maintaining a sense of understated style and refinement.', 'The trousers are tailored to fit well, typically with a straight leg that falls neatly from the hips to the hem. The fit is neither too tight nor too loose, ensuring comfort while maintaining a sleek silhouette. The waistband sits at the natural waist or slightly below, depending on the style and preference.', 0, '\"Men\'s Formal Black Trousers: Timeless Elegance for Every Occasion\"', '\"Discover timeless elegance with men\'s formal black trousers, crafted from premium fabrics for a polished look. Perfect for weddings, business meetings, or special events.\"', 'black formal fit', 1),
(40, 2, 4, 'Men\'s loose fit brown', 1600, 1400, 13, '297703332_28-hhmwts2402-bn-hubberholme-original-imahfps8pgb85prf.jpg', '\"Men\'s loose fit brown trousers offer relaxed comfort with a stylish edge. Ideal for casual settings, they blend versatility with a modern aesthetic, perfect for everyday wear.\"', 'Men\'s loose-fit brown trousers combine comfort with a contemporary style. They feature a relaxed fit that allows ease of movement, making them ideal for casual and semi-formal settings. Crafted from breathable fabrics like cotton or blends, these trousers often include practical details such as pockets and belt loops. Their earthy brown hue complements various outfits, offering a laid-back yet refined appearance suitable for both work and leisure.', 0, '\"Men\'s Loose Fit Brown Trousers: Comfortable and Stylish Casual Wear\"', '\"Explore men\'s loose fit brown trousers, blending comfort and style effortlessly. Ideal for casual settings, these trousers offer a relaxed fit and versatile appeal for everyday wear.\"', 'loose fit brown', 1),
(41, 1, 10, 'kids Striped jumpsuit', 799, 699, 10, '554234104_2-3-years-flipkart-special-jump-suit-khuku-fashion-original-imah2cfhxcrhmt5m.jpg', '\"Kids\' jumpsuits offer playful and practical style in one-piece designs. Perfect for active play or casual outings, they provide comfort and ease with charming patterns and durable fabrics, making dressing up fun and effortless.\"', 'A kids\' jumpsuit is a versatile one-piece garment designed for comfort and playfulness. Typically made from soft, durable fabrics such as cotton or jersey, jumpsuits provide freedom of movement for active children. They come in a variety of styles, from sleeveless rompers perfect for warm weather to long-sleeved options for cooler days. \r\n\r\nThese outfits often feature convenient details like snap or zipper closures for easy dressing and diaper changes. Many jumpsuits are adorned with fun patterns, vibrant colors, or cute designs that appeal to children and their parents alike. Whether for playdates, outings, or lounging at home, kids\' jumpsuits offer practicality without sacrificing style, making them a popular choice in children\'s wardrobes.', 0, '\"Kids\' Jumpsuits: Comfortable and Playful One-Piece Outfits\"', '\"Discover kids\' jumpsuits, crafted for comfort and play with soft fabrics and fun designs. Perfect for active days or casual outings, these one-piece outfits make dressing easy and stylish.\"', 'baby jumpsuit', 1),
(42, 1, 10, 'Solid red jumpsuit', 2000, 1700, 12, '698034299_7-8-years-western-jumpsuit-glamour-world-garments-original-imahfja3hxj4exhf.jpg', '\"A solid red jumpsuit for kids combines vibrant color with practical style. Ideal for play and special occasions alike, it offers comfort and versatility in a single, eye-catching outfit.\"', 'A solid red jumpsuit for kids is a standout piece that blends bold color with practicality. Made from soft and durable materials like cotton or jersey, it provides comfort and ease of movement, making it perfect for active play or special events. The jumpsuit typically features a sleeveless or short-sleeved design with a comfortable fit around the waist and legs, ensuring freedom and flexibility. It\'s often adorned with practical details such as pockets and easy-to-use closures like snaps or zippers for hassle-free dressing. This versatile garment transitions effortlessly from casual outings to more formal occasions, offering a stylish and convenient option for any young adventurer.', 1, '\"Kids\' Solid Red Jumpsuit: Vibrant Comfort for Play and Events\"', '\"Explore our kids\' solid red jumpsuit, blending vibrant style with comfort for playtime and special occasions. Crafted from soft materials with practical features, it\'s an ideal choice for active young adventurers.\"', 'red jumpsuit', 1),
(43, 1, 10, 'Embroided girl jumpsuit', 2100, 1800, 15, '665346233_8-9-years-karate-blue-noorfashion-original-imagtvuqsc9n5vfm.jpg', 'A stylish blue jumpsuit featuring intricate embroidery, blending elegance with modern flair.', 'Imagine a striking blue jumpsuit that captivates with its intricate embroidery. The vibrant hue complements the delicate patterns that adorn the fabric, adding a touch of sophistication and charm. This jumpsuit seamlessly blends classic design with contemporary fashion, making it a versatile choice for various occasions. Its flattering silhouette and attention to detail ensure that it stands out effortlessly, offering both comfort and style. Whether worn casually or dressed up, this embroidered blue jumpsuit is sure to make a statement wherever it goes.', 0, '\"Embroidered Blue Jumpsuit: Elegance Meets Modern Style\"', 'Discover elegance and modern style with our embroidered blue jumpsuit. Perfect for any occasion, this piece features intricate embroidery on a vibrant blue backdrop, blending sophistication with contemporary fashion effortlessly.', 'embroided blue jumpsuit', 1),
(44, 1, 10, 'Purple jumpsuit', 900, 849, 11, '674782371_2-3-years-kids-jumpsuit-western-glamour-world-garments-original-imagn25qdpqhrybn.jpg', 'A chic purple jumpsuit that exudes effortless style, perfect for making a bold statement with its vibrant color and sleek design.', 'Picture a stunning purple jumpsuit that effortlessly combines elegance and modernity. This garment boasts a vibrant shade of purple that catches the eye, complemented by its sleek and flattering silhouette. Whether for a special occasion or a night out, its design ensures both comfort and sophistication. The jumpsuit\'s versatility allows it to be dressed up with accessories or worn casually, making it a must-have for any fashion-forward wardrobe. Flaunt your style with confidence in this striking purple jumpsuit that promises to turn heads wherever you go.', 0, '\"Chic Purple Jumpsuit: Effortless Elegance for Every Occasion\"', 'Discover the allure of our chic purple jumpsuit, offering effortless elegance and versatility for any occasion. Perfect your style with this sleek silhouette and vibrant color choice.', 'purple jumpsuit', 1),
(45, 1, 10, 'Floral printed girls jumpsuit', 1300, 1100, 19, '411456699_5-6-years-fdgjmp00043-bgn-fashion-dream-original-imagzgfbhr4duzvb.jpg', 'A floral printed jumpsuit that blends playful charm with contemporary style, featuring vibrant patterns on a flattering silhouette.', 'Imagine a stunning floral printed jumpsuit that embodies the essence of springtime elegance. This jumpsuit boasts a lively array of blooming flowers in vibrant hues, set against a backdrop of soft, flowing fabric. The design gracefully enhances the silhouette, offering a blend of comfort and sophistication. Whether worn casually or dressed up for a special occasion, its cheerful patterns and flattering fit make it a versatile and eye-catching addition to any wardrobe. Embrace the beauty of nature with every step in this delightful floral printed jumpsuit.', 0, '\"Floral Printed Jumpsuit: Effortlessly Elegant Blossoms\"', 'Explore our floral printed jumpsuit collection, where elegance meets vibrant blossoms. Perfect for any occasion, discover the beauty of floral patterns on a flattering silhouette.', 'floral printed jumpsuit', 1),
(46, 1, 10, 'Printed baby girl jumpsuit', 1100, 999, 15, '297996823_0-6-months-tb-js951co-black-multicolor-tiny-biny-original-imahyg7yhs4tzkzm.jpg', 'A charming printed jumpsuit designed for baby girls, featuring delightful patterns and cozy comfort for everyday wear.', 'Imagine a darling printed jumpsuit designed especially for baby girls, adorned with playful patterns that capture the joy of childhood. This jumpsuit offers both adorable style and practical comfort, crafted from soft, breathable fabrics to keep little ones cozy throughout the day. Whether it\'s a casual outing or a special occasion, this outfit ensures easy dressing with its convenient snaps or buttons. With its cute prints and gentle materials, this jumpsuit is a perfect choice for dressing your little princess in style and comfort.', 0, '\"Printed Baby Girl Jumpsuits: Adorable Style and Comfort\"', 'Discover adorable printed jumpsuits for baby girls, combining playful patterns with comfort and ease. Perfect for any occasion, crafted from soft fabrics for all-day wear.', '', 1),
(47, 1, 9, 'Mickey mouse pink top', 380, 200, 16, '500614545_6-7-years-dmegft095-6-disney-by-wear-your-mind-original-imagqkkzdpwkhyfn.jpg', 'A cute pink top featuring Mickey Mouse, perfect for adding a touch of playful charm to any outfit.', 'Imagine a delightful pink top adorned with the iconic Mickey Mouse, capturing the whimsy and joy associated with Disney\'s beloved character. This charming garment blends nostalgia with contemporary fashion, making it a fun and versatile addition to any wardrobe. Crafted from soft, comfortable fabric, it offers both style and comfort for casual outings or playful occasions. The Mickey Mouse design adds a playful touch, making this top a favorite among fans of all ages. Whether paired with jeans for a relaxed look or dressed up with skirts or shorts, this pink top brings a cheerful vibe wherever it goes.', 0, '\"Mickey Mouse Pink Top: Playful Charm for Every Occasion\"', 'Discover the charm of our Mickey Mouse pink top, blending nostalgia with contemporary style. Perfect for casual wear, crafted from soft, comfortable fabric adorned with the iconic Mickey Mouse design.', 'printed top', 1),
(48, 1, 9, 'printed spot top', 299, 199, 13, '679294929_14-15-years-1742-l-white-blue-biskid-original-imah27shfmh3frnq.jpg', 'A printed sport top combining style and functionality, perfect for active days with its vibrant designs and comfortable fit.', 'Imagine a vibrant printed sport top designed to elevate your active wardrobe. This stylish garment not only stands out with its eye-catching patterns but also offers exceptional comfort and functionality. Crafted from breathable, moisture-wicking fabrics, it ensures you stay cool and dry during workouts or outdoor activities. The athletic cut provides a flattering silhouette while allowing for unrestricted movement, making it ideal for yoga sessions, gym workouts, or simply lounging in style. Whether paired with leggings, shorts, or joggers, this printed sport top is your go-to choice for both performance and fashion-forward flair.', 0, '\"Printed Sport Tops: Vibrant Styles for Active Days\"', 'Elevate your activewear with our vibrant printed sport tops. Designed for style and functionality, these tops feature eye-catching patterns and comfortable, moisture-wicking fabrics, perfect for workouts and everyday wear.', 'spot top', 1),
(49, 1, 9, 'Casual polyester full sleeve top', 179, 160, 13, '839303307_5-6-years-ck20210452-cutiekins-original-imaghjyq4xzkwrzy.jpg', 'A versatile full-sleeve top, perfect for casual wear with its comfortable fit and stylish design.', 'Imagine a versatile full-sleeve top that effortlessly combines comfort and style for your casual wardrobe. This essential piece offers a relaxed fit and is crafted from soft, breathable fabric, ensuring all-day comfort. Whether you\'re lounging at home, running errands, or meeting friends for coffee, this top provides effortless style with its understated yet chic design. Pair it with jeans, leggings, or skirts for a laid-back yet polished look that transitions seamlessly from day to night. With its timeless appeal and practicality, this casual full-sleeve top is a must-have staple for every closet.', 0, '\"Casual Full-Sleeve Tops: Comfort and Style Combined\"', 'Discover comfort and style with our casual full-sleeve tops, crafted from soft, breathable fabrics for everyday wear. Perfect for mixing and matching with your favorite bottoms.', 'Polyester full sleeve top', 1),
(50, 1, 9, 'cotton blend top', 200, 100, 21, '849855130_4-5-years-cpe1606-crazypenguin-elite-original-imagq46udtbmtfzf.jpg', 'A casual cotton blend top, perfect for everyday wear with its softness and versatility in style.', 'Imagine a casual cotton blend top that effortlessly combines comfort and versatility for your everyday wardrobe. This essential piece is crafted from a soft and breathable fabric, ensuring a comfortable fit throughout the day. Whether you\'re relaxing at home, running errands, or meeting friends for a casual outing, this top offers easy-to-wear style. Its simple yet timeless design makes it a perfect match for various bottoms, from jeans to skirts, allowing you to create effortless and laid-back looks. With its comfort and versatility, this casual cotton blend top is a staple that you\'ll reach for again and again.', 0, '\"Casual Cotton Blend Tops: Comfortable Everyday Style\"', 'Explore our collection of casual cotton blend tops, designed for comfort and versatility. Perfect for everyday wear, crafted from soft fabrics to keep you comfortable all day long.', 'cotton blend top', 1),
(51, 1, 9, 'Black printed top', 200, 149, 16, '676978826_11-12-years-onl-1195-1335-blk-ginie-original-imagy2tczvhtgyj4.jpg', 'A chic black printed top, blending sophistication with modern flair for versatile and stylish wear.', 'Imagine a chic black printed top that effortlessly combines sophistication with modern style. This versatile garment features a striking print against a classic black backdrop, adding a touch of elegance to any outfit. Crafted from high-quality fabric, it offers both comfort and a flattering fit, making it suitable for various occasions. Whether paired with jeans for a casual look or dressed up with a skirt or trousers for more formal settings, this top is sure to make a statement. Embrace the bold yet timeless appeal of this black printed top and elevate your wardrobe with its versatile charm.', 0, '\"Black Printed Tops: Chic and Versatile Fashion Statements\"', 'Discover chic black printed tops that combine modern style with versatility. Perfect for any occasion, crafted from quality fabrics for comfort and elegance.', 'black printed top', 1),
(52, 1, 9, 'casual rayon top', 800, 699, 20, '661447246_8-9-years-dmp383-dmp-fashion-original-imagk6c5mm8w784k.jpg', 'A casual rayon top, offering comfort and style with a lightweight and breathable fabric, ideal for everyday wear.', 'Imagine a casual rayon top that effortlessly blends comfort with style for your everyday wardrobe. Crafted from lightweight and breathable rayon fabric, this versatile piece ensures a soft and smooth feel against your skin, perfect for all-day wear. Whether you\'re lounging at home, running errands, or meeting friends for a casual outing, this top offers relaxed elegance. Its flowing silhouette drapes gracefully, offering a flattering fit that pairs well with jeans, shorts, or skirts. With its easy-to-wear design and understated charm, this casual rayon top is a must-have staple that combines comfort with effortless style.', 0, '\"Casual Rayon Tops: Comfortable and Stylish Everyday Wear\"', 'Discover our collection of casual rayon tops, designed for comfort and style. Perfect for everyday wear, crafted from lightweight and breathable fabrics to keep you comfortable all day long.', 'rayon top', 1),
(53, 4, 8, 'Printed round neck cotton', 399, 250, 15, '713574517_s-grl-fs49-red-groovy-c1-leotude-original-imagshn9gsmnnfhv.jpg', 'A comfortable and stylish round neck cotton printed t-shirt, perfect for casual outings with its soft fabric and trendy designs.', 'Imagine a stylish round neck cotton printed t-shirt that combines comfort with contemporary flair. Crafted from soft, breathable cotton fabric, this versatile piece ensures a comfortable fit for everyday wear. The round neck offers a classic look, while the printed designs add a touch of personality and charm. Whether you\'re relaxing at home, running errands, or meeting friends, this t-shirt provides effortless style and comfort. Pair it with jeans, shorts, or skirts to create casual yet trendy outfits for any occasion. Embrace the comfort and fashion-forward appeal of this round neck cotton printed t-shirt, a wardrobe essential that complements your casual ensemble with ease.', 1, '\"Round Neck Cotton Printed T-Shirts: Casual Comfort and Style\"', 'Discover comfort and style with our round neck cotton printed t-shirts, perfect for casual outings. Crafted from soft, breathable cotton with trendy designs for everyday wear.', 'round neck cotton tshirt', 1);
INSERT INTO `product` (`id`, `categories_id`, `sub_categories_id`, `name`, `mrp`, `price`, `qty`, `image`, `short_desc`, `description`, `best_seller`, `meta_title`, `meta_desc`, `meta_keyword`, `status`) VALUES
(54, 4, 8, 'plain black tshirt', 460, 350, 11, '657058602_l-women-oversize-lilheart-black-being-wanted-original-imah23ghyjacdhby.jpg', 'A classic plain black t-shirt for women, offering timeless style and versatility for everyday wear.', 'Imagine a wardrobe staple: the classic plain black t-shirt tailored for women. This essential piece embodies timeless simplicity and versatility, ideal for effortlessly stylish everyday wear. Crafted from soft and breathable fabric, it promises comfort throughout the day. The clean, minimalist design makes it easy to pair with any bottoms, from jeans to skirts, for a casual yet polished look. Whether lounging at home, running errands, or meeting friends, this black t-shirt ensures you always look and feel your best. Embrace the understated elegance and practicality of this essential piece, a must-have in every woman\'s closet.', 0, '\"Women\'s Plain Black T-Shirt: Timeless Style and Versatility\"', 'Discover timeless style and versatility with our women\'s plain black t-shirt. Perfect for everyday wear, crafted from soft and breathable fabric for comfort all day long.', 'plain black tshirt', 1),
(55, 4, 8, 'Typography printed tshirt', 699, 650, 12, '774341934_xl-metro-oversize-new-503-metronaut-original-imah26m4u27zwwfx.jpg', 'A typography printed t-shirt featuring stylish text designs, perfect for adding a contemporary flair to your casual wardrobe.', 'Imagine a typography printed t-shirt that effortlessly blends modern design with personal expression. This stylish garment features intricate text designs or bold statements that add a unique flair to your casual wardrobe. Crafted from soft and breathable fabric, it ensures comfort throughout the day. Whether you prefer witty slogans, inspirational quotes, or artistic lettering, this t-shirt allows you to showcase your personality with every wear. Pair it with jeans or shorts for a laid-back look, or layer it under a jacket for added versatility. Embrace the creativity and individuality of typography printed t-shirts, a standout choice for making a fashion statement.', 0, '\"Typography Printed T-Shirts: Expressive and Stylish Designs\"', 'Explore our collection of typography printed t-shirts, featuring stylish text designs that add a contemporary flair to your casual wardrobe. Crafted for comfort from soft fabrics, perfect for expressing your unique style.', 'typography tshirt', 1),
(56, 4, 8, 'Multiple cotton printed tshirt', 499, 350, 13, '869690779_xl-rzw01blackprint-rodzen-original-imagmptntfyfgw2p.jpg', 'A collection of printed t-shirts featuring multiple stylish designs, perfect for adding variety and flair to your casual wardrobe.', 'Imagine a collection of printed t-shirts that showcase multiple stylish designs, offering versatility and flair for your casual wardrobe. These shirts feature a variety of prints, ranging from bold graphics to intricate patterns and artistic motifs. Crafted from comfortable, breathable fabrics, each t-shirt is designed to provide both style and comfort throughout the day. Whether you prefer vibrant colors or subtle hues, these printed t-shirts allow you to express your personality and individuality effortlessly. Pair them with jeans, shorts, or skirts for a trendy and relaxed look that suits any occasion. Embrace the diversity and creativity of multiple printed t-shirts, each one adding a unique touch to your personal style.', 0, '\"Versatile Printed T-Shirts: Stylish Designs for Every Wardrobe\"', 'Explore our collection of versatile printed t-shirts, featuring a variety of stylish designs to suit your casual wardrobe. Crafted for comfort from quality fabrics, perfect for expressing your unique sense of style.', 'multi printed tshirt', 1),
(57, 4, 8, 'Round neck plain black teshirt', 400, 300, 21, '507550758_s-3413-buynewtrend-original-imah2gbt3xzz5rsn.jpg', 'A staple plain black round neck t-shirt, offering timeless simplicity and versatility for effortless everyday wear.', 'Imagine a wardrobe essential: the plain black round neck t-shirt, a versatile piece that embodies timeless simplicity and comfort. Crafted from soft, breathable fabric, this classic t-shirt ensures a comfortable fit throughout the day. Its round neck design offers a clean and minimalist aesthetic, making it easy to pair with any bottoms, whether jeans, shorts, or skirts. Whether you\'re lounging at home, running errands, or meeting friends, this black t-shirt provides a stylish and understated option. Embrace the versatility and practicality of this essential piece, perfect for creating effortless and chic looks for any occasion.', 0, '\"Plain Black Round Neck T-Shirt: Timeless Comfort and Versatility\"', 'Sure, here\'s a meta description for a plain black round neck t-shirt:\r\n\r\n\"Elevate your wardrobe with our timeless plain black round neck t-shirt. Crafted from soft, breathable fabric for all-day comfort and versatility. Perfect for pairing with any outfit, whether casual or dressed up.\"', 'round neck black tshirt', 1),
(58, 4, 8, 'Multi printed white tshirt', 200, 180, 10, '743143341_s-tsh-cartoon-wht-juneberry-original-imag5gqyp4xbsty4.jpg', 'A multi-printed women\'s t-shirt featuring a variety of stylish designs, perfect for adding vibrancy and personality to your wardrobe.', 'Imagine a vibrant multi-printed women\'s t-shirt that brings a burst of personality to your wardrobe. This versatile garment features an array of stylish designs, from bold graphics to intricate patterns and artistic motifs. Crafted from soft and comfortable fabric, it ensures a pleasant feel against the skin throughout the day. Whether you prefer florals, geometric shapes, abstract art, or playful illustrations, these multi-printed t-shirts allow you to express your individuality effortlessly. Pair them with jeans, shorts, or skirts for a trendy and expressive look that suits various occasions. Embrace the creativity and diversity of multi-printed women\'s t-shirts, each one enhancing your style with its unique charm.', 0, '\"Multi-Printed Women\'s T-Shirts: Vibrant Designs for Every Style\"', 'Explore our collection of vibrant multi-printed women\'s t-shirts, featuring stylish designs that add personality and flair to your wardrobe. Crafted for comfort from soft fabrics, perfect for expressing your unique sense of style.', 'white tshirt', 1),
(59, 4, 7, 'Flared high rise black', 1100, 1000, 12, '284124155_28-gtsladiesjeans122-guti-original-imagsbbgpj2gxft9.jpg', 'High-rise flare jeans in classic black, combining retro style with modern comfort for a flattering silhouette.', 'Imagine slipping into a pair of high-rise flare jeans in timeless black, where retro charm meets contemporary comfort. These jeans boast a flattering silhouette that accentuates the waist while elongating the legs with their flared bottoms. Crafted from quality denim, they offer a comfortable fit and durability for everyday wear. Perfect for adding a touch of vintage flair to your wardrobe, they pair effortlessly with both casual tops and dressier blouses. Whether you\'re aiming for a laid-back vibe or a chic evening look, these high-rise flare black jeans promise versatility and style that never goes out of fashion.', 0, '\"High-Rise Flare Black Jeans: Timeless Style and Comfort\"', 'Discover high-rise flare black jeans, blending retro style with modern comfort for a flattering silhouette. Perfect for versatile and timeless fashion statements.', 'high flare rise', 1),
(60, 4, 7, 'Regular high rise black', 500, 449, 17, '600270456_28-kttladiesjeans848-kotty-original-imahfdh8bu532eua.jpg', '\"High-Rise Flare Black Jeans: Timeless Style and Comfort\"', 'Imagine a pair of classic regular high-rise black jeans that effortlessly blend timeless style with everyday versatility. These jeans feature a flattering high-rise waistline, providing comfort and a sleek silhouette. Crafted from durable denim, they offer both resilience and flexibility, making them suitable for various activities and occasions. Whether you\'re dressing casually for a day out or pairing them with a blouse for a more polished look, these black jeans are a wardrobe essential. Their neutral color ensures easy coordination with any top or footwear, while their simple yet elegant design makes them a go-to choice for effortless fashion. Embrace the enduring appeal and practicality of regular high-rise black jeans, perfect for complementing your personal style with ease.', 0, '\"Regular High-Rise Black Jeans: Timeless Style and Versatility\"', 'Discover timeless style and versatility with our collection of regular high-rise black jeans. Crafted for comfort and durability, perfect for everyday wear and effortless styling.', 'regular fit black', 1),
(61, 4, 7, 'relaxed fit mild rise', 999, 899, 14, '300039539_28-wl-l-blue1-zayla-original-imahfgby8qtpbzpy.jpg', 'Loose-fit jeans with a mild rise, offering relaxed comfort and a casual style for everyday wear.', 'Imagine slipping into a pair of loose-fit jeans with a mild rise, where comfort meets casual style effortlessly. These jeans offer a relaxed fit that allows for ease of movement and comfort throughout the day. With a mild rise, they sit comfortably on the hips without being too low or too high, making them a versatile choice for various outfits. Crafted from durable denim or other comfortable fabrics, they are designed to withstand daily wear and maintain their shape. Whether you\'re running errands, lounging at home, or meeting friends for a casual outing, these jeans provide a laid-back yet stylish option. Pair them with your favorite t-shirt or blouse for a relaxed and chic look that suits any occasion. Embrace the comfort and versatility of loose-fit jeans with a mild rise, a wardrobe staple for effortless everyday style.', 0, '\"Loose Fit Mild Rise Jeans: Comfortable and Casual Style\"', 'Discover comfort and casual style with our collection of loose-fit jeans featuring a mild rise. Perfect for everyday wear, crafted from durable materials for lasting comfort and versatility.', 'loose fit jeans', 1),
(62, 4, 7, 'slim mid rise blue', 1500, 1400, 13, '675902079_26-1-button-highrise-blue-tyffyn-original-imafwyffmw6n8fg9-bb.jpg', 'Slim mid-rise blue jeans offer a sleek, flattering fit with a modern silhouette, perfect for versatile and stylish everyday wear.', 'Imagine slipping into a pair of slim mid-rise blue jeans that effortlessly combine a sleek, flattering fit with modern style. These jeans sit comfortably at the natural waistline, offering a streamlined silhouette that enhances your curves while providing a comfortable feel throughout the day. Crafted from high-quality denim, they offer durability and flexibility, making them ideal for various activities and occasions. The classic blue color adds versatility to your wardrobe, easily pairing with casual tops for a laid-back look or dressing up with a blouse for a more polished ensemble. Whether you\'re running errands, meeting friends, or enjoying a casual outing, these slim mid-rise jeans are a wardrobe essential that promises both comfort and style.', 0, '\"Slim Mid-Rise Blue Jeans: Versatile and Stylish Everyday Wear\"', 'Discover sleek and versatile slim mid-rise blue jeans, perfect for stylish everyday wear. Crafted from high-quality denim for durability and comfort, ideal for pairing with any outfit.', 'slim mid rise blue jeans', 1),
(63, 4, 7, 'Loose high rise blue jeans', 770, 770, 14, '904185325_30-kttladiesjeans817-kotty-original-imagys5jwzf3fczp.jpg', 'Loose fit blue jeans with a mild rise, offering relaxed comfort and casual style for everyday wear.', 'Imagine slipping into a pair of loose-fit blue jeans with a mild rise, where comfort meets casual style effortlessly. These jeans offer a relaxed fit that allows for ease of movement and comfort throughout the day. With a mild rise, they sit comfortably on the hips without being too low or too high, making them a versatile choice for various outfits. Crafted from durable denim or other comfortable fabrics, they are designed to withstand daily wear and maintain their shape. Whether you\'re running errands, lounging at home, or meeting friends for a casual outing, these jeans provide a laid-back yet stylish option. Pair them with your favorite t-shirt or blouse for a relaxed and chic look that suits any occasion. Embrace the comfort and versatility of loose-fit blue jeans with a mild rise, a wardrobe staple for effortless everyday style.', 0, '\"Loose Fit Blue Jeans with Mild Rise: Comfortable Casual Wear\"', 'Discover comfort and style with our collection of loose-fit blue jeans featuring a mild rise. Perfect for everyday wear, crafted from durable materials for lasting comfort and versatility.', 'loosefit mildrise', 1),
(64, 4, 8, 'regular high rise blue fit', 1700, 1599, 10, '334535957_26-bell-bottom-jeans-parasnath-original-imagf7jcbhgqpsck.jpg', 'Regular high-rise blue jeans offer a classic fit with a flattering rise that sits comfortably at the natural waistline. Ideal for versatile and stylish everyday wear, these jeans provide a timeless silhouette that pairs well with any outfit.', 'Imagine a pair of regular high-rise blue jeans, designed to offer both style and comfort for everyday wear. These jeans sit comfortably at the natural waistline, providing a flattering fit that enhances your silhouette. Crafted from high-quality denim, they offer durability and flexibility, making them suitable for various activities and occasions. The classic blue color adds versatility to your wardrobe, allowing you to easily pair them with casual tops for a relaxed look or dress them up with a blouse for a more polished ensemble. Whether you\'re running errands, meeting friends, or enjoying a day out, these regular high-rise blue jeans are a wardrobe staple that combines timeless style with everyday comfort.', 0, '\"Regular High-Rise Blue Jeans: Timeless Style and Comfort\"', 'Discover versatile regular high-rise blue jeans, crafted for comfort and style. Perfect for everyday wear, offering a flattering fit and classic denim durability.', 'high rise blue fit', 1);

-- --------------------------------------------------------

--
-- Table structure for table `product_review`
--

CREATE TABLE `product_review` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `rating` varchar(20) NOT NULL,
  `review` text NOT NULL,
  `status` int(11) NOT NULL,
  `added_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_review`
--

INSERT INTO `product_review` (`id`, `product_id`, `user_id`, `rating`, `review`, `status`, `added_on`) VALUES
(2, 9, 1, 'Good', 'asAS', 0, '2021-05-05 08:31:39');

-- --------------------------------------------------------

--
-- Table structure for table `size_master`
--

CREATE TABLE `size_master` (
  `id` int(11) NOT NULL,
  `size` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `order_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `size_master`
--

INSERT INTO `size_master` (`id`, `size`, `status`, `order_by`) VALUES
(1, 'X', 1, 3),
(2, 'XL', 1, 4),
(4, 'M', 1, 2),
(5, 'S', 1, 1),
(6, 'XXL', 1, 5);

-- --------------------------------------------------------

--
-- Table structure for table `sub_categories`
--

CREATE TABLE `sub_categories` (
  `id` int(11) NOT NULL,
  `categories_id` int(11) NOT NULL,
  `sub_categories` varchar(100) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `sub_categories`
--

INSERT INTO `sub_categories` (`id`, `categories_id`, `sub_categories`, `status`) VALUES
(1, 2, 'T-Shirts', 1),
(4, 2, 'Shirts', 1),
(5, 2, 'Trousers', 1),
(6, 4, 'Sarees', 1),
(7, 4, 'Jeans', 1),
(8, 4, 'T-Shirts', 1),
(9, 1, 'Tops', 1),
(10, 1, 'Jumpsuits', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `password` varchar(100) NOT NULL,
  `email` varchar(50) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `added_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `password`, `email`, `mobile`, `added_on`) VALUES
(4, 'jammy spacerr', '$2y$10$8XWXslnwfcfMtprn3kFbrOJQ62/qAS8.F2lUP5tH3On1bXteh83m2', 'lh@123.com', '8285399278', '2024-07-09 11:30:21');

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `added_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_users`
--
ALTER TABLE `admin_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `banner`
--
ALTER TABLE `banner`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `color_master`
--
ALTER TABLE `color_master`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact_us`
--
ALTER TABLE `contact_us`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupon_master`
--
ALTER TABLE `coupon_master`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_status`
--
ALTER TABLE `order_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_review`
--
ALTER TABLE `product_review`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `size_master`
--
ALTER TABLE `size_master`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sub_categories`
--
ALTER TABLE `sub_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_users`
--
ALTER TABLE `admin_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `banner`
--
ALTER TABLE `banner`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `color_master`
--
ALTER TABLE `color_master`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `contact_us`
--
ALTER TABLE `contact_us`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `coupon_master`
--
ALTER TABLE `coupon_master`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `order_detail`
--
ALTER TABLE `order_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `order_status`
--
ALTER TABLE `order_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `product_review`
--
ALTER TABLE `product_review`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `size_master`
--
ALTER TABLE `size_master`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `sub_categories`
--
ALTER TABLE `sub_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
