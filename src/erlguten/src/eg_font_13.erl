-module(eg_font_13).
-export([width/1, kern/2, fontName/0, firstChar/0,lastChar/0]).
-export([index/0,ascender/0,capHeight/0,descender/0,italicAngle/0]).
-export([xHeight/0, flags/0, type/0, stemV/0,fontBBox/0,widths/0]).
-export([encoding/0]).
fontName() -> "Times-Roman".
index() -> 13.
type() -> internal.
encoding() -> "AdobeStandardEncoding".
firstChar() ->32.
lastChar() ->255.
ascender() ->683.
capHeight() ->662.
descender() ->-217.
italicAngle() ->0.
xHeight() ->450.
flags() ->32.
stemV() ->0.
fontBBox() ->{-168,-218,1000,898}.
widths() ->[250,333,408,500,500,833,778,180,333,333,500,564,250,333,250,278,500,500,500,
 500,500,500,500,500,500,500,278,278,564,564,564,444,921,722,667,667,722,611,
 556,722,722,333,389,722,611,889,722,722,556,722,667,556,611,722,722,944,722,
 722,611,333,278,333,469,500,333,444,500,444,500,444,333,500,500,278,278,500,
 278,778,500,500,500,500,333,389,278,500,500,722,500,500,444,480,200,480,541,
 0,0,0,333,500,444,1000,500,500,333,1000,556,333,889,0,611,0,0,333,333,444,
 444,350,500,1000,333,980,389,333,722,0,444,722,0,333,500,500,500,500,200,500,
 333,760,276,500,564,564,760,333,400,564,300,300,333,500,453,250,333,300,310,
 500,750,750,750,444,722,722,722,722,722,722,889,667,611,611,611,611,333,333,
 333,333,722,722,722,722,722,722,722,564,722,722,722,722,722,722,556,500,444,
 444,444,444,444,444,667,444,444,444,444,444,278,278,278,278,500,500,500,500,
 500,500,500,564,500,500,500,500,500,500,500,500].
width(32)->250;
width(33)->333;
width(34)->408;
width(35)->500;
width(36)->500;
width(37)->833;
width(38)->778;
width(39)->180;
width(40)->333;
width(41)->333;
width(42)->500;
width(43)->564;
width(44)->250;
width(45)->333;
width(46)->250;
width(47)->278;
width(48)->500;
width(49)->500;
width(50)->500;
width(51)->500;
width(52)->500;
width(53)->500;
width(54)->500;
width(55)->500;
width(56)->500;
width(57)->500;
width(58)->278;
width(59)->278;
width(60)->564;
width(61)->564;
width(62)->564;
width(63)->444;
width(64)->921;
width(65)->722;
width(66)->667;
width(67)->667;
width(68)->722;
width(69)->611;
width(70)->556;
width(71)->722;
width(72)->722;
width(73)->333;
width(74)->389;
width(75)->722;
width(76)->611;
width(77)->889;
width(78)->722;
width(79)->722;
width(80)->556;
width(81)->722;
width(82)->667;
width(83)->556;
width(84)->611;
width(85)->722;
width(86)->722;
width(87)->944;
width(88)->722;
width(89)->722;
width(90)->611;
width(91)->333;
width(92)->278;
width(93)->333;
width(94)->469;
width(95)->500;
width(96)->333;
width(97)->444;
width(98)->500;
width(99)->444;
width(100)->500;
width(101)->444;
width(102)->333;
width(103)->500;
width(104)->500;
width(105)->278;
width(106)->278;
width(107)->500;
width(108)->278;
width(109)->778;
width(110)->500;
width(111)->500;
width(112)->500;
width(113)->500;
width(114)->333;
width(115)->389;
width(116)->278;
width(117)->500;
width(118)->500;
width(119)->722;
width(120)->500;
width(121)->500;
width(122)->444;
width(123)->480;
width(124)->200;
width(125)->480;
width(126)->541;
width(130)->333;
width(131)->500;
width(132)->444;
width(133)->1000;
width(134)->500;
width(135)->500;
width(136)->333;
width(137)->1000;
width(138)->556;
width(139)->333;
width(140)->889;
width(142)->611;
width(145)->333;
width(146)->333;
width(147)->444;
width(148)->444;
width(149)->350;
width(150)->500;
width(151)->1000;
width(152)->333;
width(153)->980;
width(154)->389;
width(155)->333;
width(156)->722;
width(158)->444;
width(159)->722;
width(161)->333;
width(162)->500;
width(163)->500;
width(164)->500;
width(165)->500;
width(166)->200;
width(167)->500;
width(168)->333;
width(169)->760;
width(170)->276;
width(171)->500;
width(172)->564;
width(173)->564;
width(174)->760;
width(175)->333;
width(176)->400;
width(177)->564;
width(178)->300;
width(179)->300;
width(180)->333;
width(181)->500;
width(182)->453;
width(183)->250;
width(184)->333;
width(185)->300;
width(186)->310;
width(187)->500;
width(188)->750;
width(189)->750;
width(190)->750;
width(191)->444;
width(192)->722;
width(193)->722;
width(194)->722;
width(195)->722;
width(196)->722;
width(197)->722;
width(198)->889;
width(199)->667;
width(200)->611;
width(201)->611;
width(202)->611;
width(203)->611;
width(204)->333;
width(205)->333;
width(206)->333;
width(207)->333;
width(208)->722;
width(209)->722;
width(210)->722;
width(211)->722;
width(212)->722;
width(213)->722;
width(214)->722;
width(215)->564;
width(216)->722;
width(217)->722;
width(218)->722;
width(219)->722;
width(220)->722;
width(221)->722;
width(222)->556;
width(223)->500;
width(224)->444;
width(225)->444;
width(226)->444;
width(227)->444;
width(228)->444;
width(229)->444;
width(230)->667;
width(231)->444;
width(232)->444;
width(233)->444;
width(234)->444;
width(235)->444;
width(236)->278;
width(237)->278;
width(238)->278;
width(239)->278;
width(240)->500;
width(241)->500;
width(242)->500;
width(243)->500;
width(244)->500;
width(245)->500;
width(246)->500;
width(247)->564;
width(248)->500;
width(249)->500;
width(250)->500;
width(251)->500;
width(252)->500;
width(253)->500;
width(254)->500;
width(255)->500;
width(_)->unknown.
kern(122,101)->0;
kern(122,111)->0;
kern(121,97)->0;
kern(121,44)->-65;
kern(121,101)->0;
kern(121,111)->0;
kern(121,46)->-65;
kern(120,101)->-15;
kern(119,97)->-10;
kern(119,44)->-65;
kern(119,101)->0;
kern(119,104)->0;
kern(119,111)->-10;
kern(119,46)->-65;
kern(118,97)->-25;
kern(118,44)->-65;
kern(118,101)->-15;
kern(118,111)->-20;
kern(118,46)->-65;
kern(32,65)->-55;
kern(32,84)->-18;
kern(32,86)->-50;
kern(32,87)->-30;
kern(32,89)->-90;
kern(32,147)->0;
kern(32,145)->0;
kern(115,119)->0;
kern(114,97)->0;
kern(114,99)->0;
kern(114,44)->-40;
kern(114,100)->0;
kern(114,101)->0;
kern(114,103)->-18;
kern(114,45)->-20;
kern(114,105)->0;
kern(114,107)->0;
kern(114,108)->0;
kern(114,109)->0;
kern(114,110)->0;
kern(114,111)->0;
kern(114,112)->0;
kern(114,46)->-55;
kern(114,113)->0;
kern(114,114)->0;
kern(114,115)->0;
kern(114,116)->0;
kern(114,117)->0;
kern(114,118)->0;
kern(114,121)->0;
kern(146,100)->-50;
kern(146,108)->-10;
kern(146,148)->0;
kern(146,146)->-74;
kern(146,114)->-50;
kern(146,115)->-55;
kern(146,32)->-74;
kern(146,116)->-18;
kern(146,118)->-50;
kern(145,65)->-80;
kern(145,145)->-74;
kern(148,32)->0;
kern(147,65)->-80;
kern(147,145)->0;
kern(46,148)->-70;
kern(46,146)->-70;
kern(112,121)->-10;
kern(111,103)->0;
kern(111,118)->-15;
kern(111,119)->-25;
kern(111,120)->0;
kern(111,121)->-10;
kern(110,117)->0;
kern(110,118)->-40;
kern(110,121)->-15;
kern(109,117)->0;
kern(109,121)->0;
kern(108,119)->-10;
kern(108,121)->0;
kern(107,101)->-10;
kern(107,111)->-10;
kern(107,121)->-15;
kern(105,118)->-25;
kern(104,121)->-5;
kern(103,97)->-5;
kern(103,44)->0;
kern(103,101)->0;
kern(103,103)->0;
kern(103,105)->0;
kern(103,111)->0;
kern(103,46)->0;
kern(103,114)->0;
kern(103,121)->0;
kern(102,97)->-10;
kern(102,44)->0;
kern(102,101)->0;
kern(102,102)->-25;
kern(102,105)->-20;
kern(102,108)->0;
kern(102,111)->0;
kern(102,46)->0;
kern(102,148)->0;
kern(102,146)->55;
kern(101,98)->0;
kern(101,44)->0;
kern(101,103)->-15;
kern(101,112)->0;
kern(101,46)->0;
kern(101,118)->-25;
kern(101,119)->-25;
kern(101,120)->-15;
kern(101,121)->-15;
kern(100,44)->0;
kern(100,100)->0;
kern(100,46)->0;
kern(100,118)->0;
kern(100,119)->0;
kern(100,121)->0;
kern(44,148)->-70;
kern(44,146)->-70;
kern(44,32)->0;
kern(58,32)->0;
kern(99,44)->0;
kern(99,104)->0;
kern(99,107)->0;
kern(99,108)->0;
kern(99,46)->0;
kern(99,121)->-15;
kern(98,98)->0;
kern(98,44)->0;
kern(98,108)->0;
kern(98,46)->-40;
kern(98,117)->-20;
kern(98,118)->-15;
kern(98,121)->0;
kern(97,98)->0;
kern(97,103)->0;
kern(97,112)->0;
kern(97,116)->0;
kern(97,118)->-20;
kern(97,119)->-15;
kern(97,121)->0;
kern(89,65)->-120;
kern(89,79)->-30;
kern(89,97)->-100;
kern(89,58)->-92;
kern(89,44)->-129;
kern(89,101)->-100;
kern(89,45)->-111;
kern(89,105)->-55;
kern(89,111)->-110;
kern(89,46)->-129;
kern(89,59)->-92;
kern(89,117)->-111;
kern(87,65)->-120;
kern(87,79)->-10;
kern(87,97)->-80;
kern(87,58)->-37;
kern(87,44)->-92;
kern(87,101)->-80;
kern(87,104)->0;
kern(87,45)->-65;
kern(87,105)->-40;
kern(87,111)->-80;
kern(87,46)->-92;
kern(87,59)->-37;
kern(87,117)->-50;
kern(87,121)->-73;
kern(86,65)->-135;
kern(86,71)->-15;
kern(86,79)->-40;
kern(86,97)->-111;
kern(86,58)->-74;
kern(86,44)->-129;
kern(86,101)->-111;
kern(86,45)->-100;
kern(86,105)->-60;
kern(86,111)->-129;
kern(86,46)->-129;
kern(86,59)->-74;
kern(86,117)->-75;
kern(85,65)->-40;
kern(85,44)->0;
kern(85,46)->0;
kern(84,65)->-93;
kern(84,79)->-18;
kern(84,97)->-80;
kern(84,58)->-50;
kern(84,44)->-74;
kern(84,101)->-70;
kern(84,104)->0;
kern(84,45)->-92;
kern(84,105)->-35;
kern(84,111)->-80;
kern(84,46)->-74;
kern(84,114)->-35;
kern(84,59)->-55;
kern(84,117)->-45;
kern(84,119)->-80;
kern(84,121)->-80;
kern(83,44)->0;
kern(83,46)->0;
kern(82,79)->-40;
kern(82,84)->-60;
kern(82,85)->-40;
kern(82,86)->-80;
kern(82,87)->-55;
kern(82,89)->-65;
kern(81,85)->-10;
kern(81,44)->0;
kern(81,46)->0;
kern(80,65)->-92;
kern(80,97)->-15;
kern(80,44)->-111;
kern(80,101)->0;
kern(80,111)->0;
kern(80,46)->-111;
kern(79,65)->-35;
kern(79,84)->-40;
kern(79,86)->-50;
kern(79,87)->-35;
kern(79,88)->-40;
kern(79,89)->-50;
kern(79,44)->0;
kern(79,46)->0;
kern(78,65)->-35;
kern(78,44)->0;
kern(78,46)->0;
kern(76,84)->-92;
kern(76,86)->-100;
kern(76,87)->-74;
kern(76,89)->-100;
kern(76,148)->0;
kern(76,146)->-92;
kern(76,121)->-55;
kern(75,79)->-30;
kern(75,101)->-25;
kern(75,111)->-35;
kern(75,117)->-15;
kern(75,121)->-25;
kern(74,65)->-60;
kern(74,97)->0;
kern(74,44)->0;
kern(74,101)->0;
kern(74,111)->0;
kern(74,46)->0;
kern(74,117)->0;
kern(71,44)->0;
kern(71,46)->0;
kern(70,65)->-74;
kern(70,97)->-15;
kern(70,44)->-80;
kern(70,101)->0;
kern(70,105)->0;
kern(70,111)->-15;
kern(70,46)->-80;
kern(70,114)->0;
kern(68,65)->-40;
kern(68,86)->-40;
kern(68,87)->-30;
kern(68,89)->-55;
kern(68,44)->0;
kern(68,46)->0;
kern(66,65)->-35;
kern(66,85)->-10;
kern(66,44)->0;
kern(66,46)->0;
kern(65,67)->-40;
kern(65,71)->-40;
kern(65,79)->-55;
kern(65,81)->-55;
kern(65,84)->-111;
kern(65,85)->-55;
kern(65,86)->-135;
kern(65,87)->-90;
kern(65,89)->-105;
kern(65,112)->0;
kern(65,148)->0;
kern(65,146)->-111;
kern(65,117)->0;
kern(65,118)->-74;
kern(65,119)->-92;
kern(65,121)->-92;
kern(_,_) -> 0.
