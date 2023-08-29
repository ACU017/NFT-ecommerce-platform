DROP TABLE if exists product_order;
DROP TABLE if exists orders;
DROP TABLE if exists users;
DROP TABLE if exists payments;
DROP TABLE if exists products;
DROP TABLE if exists artists;

CREATE TABLE `payments`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `approved` TINYINT(1) NOT NULL,
    `address_1` VARCHAR(255) NOT NULL,
    `address_2` VARCHAR(255) NULL,
    `postal_code` INT NOT NULL,
    `city` VARCHAR(255) NOT NULL,
    `country` VARCHAR(255) NOT NULL
);
CREATE TABLE `orders`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `user_id` BIGINT UNSIGNED NULL,
    `total` DECIMAL(8, 2) NOT NULL,
    `payment_id` BIGINT UNSIGNED NOT NULL,
    `fulfilled` TINYINT(1) NOT NULL,
    `cancelled` TINYINT(1) NOT NULL DEFAULT 0,
    `date` DATE NOT NULL
);


CREATE TABLE `users`(
    `id` BIGINT UNSIGNED NULL AUTO_INCREMENT UNIQUE KEY,
    `firstname` VARCHAR(255) NOT NULL,
    `lastname` VARCHAR(255) NOT NULL,
    `email` VARCHAR(255) NOT NULL,
    `password` VARCHAR(255) NULL,
    `guest` TINYINT(1) NOT NULL,
    `marketing` TINYINT(1) NOT NULL DEFAULT 0
);


CREATE TABLE `artists`(
    `id` BIGINT UNSIGNED NULL AUTO_INCREMENT UNIQUE KEY,
    `brand` VARCHAR(255) NOT NULL
);


CREATE TABLE `products`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(255) NOT NULL,
    `price` DECIMAL(8, 2) NOT NULL,
    `currency` VARCHAR (255) NOT NULL, 
    `description` LONGTEXT NOT NULL,
    `collection` VARCHAR(255) NULL,
    `units` INT NOT NULL DEFAULT 1,
    `artist_id` BIGINT UNSIGNED NULL,
    `image_1` VARCHAR(255) NOT NULL,
    `image_2` VARCHAR(255) NULL,
    `image_3` VARCHAR(255) NULL
);


CREATE TABLE `product_order`(
    `product_id` BIGINT UNSIGNED NOT NULL,
    `order_id` BIGINT UNSIGNED NOT NULL,
    `product_quantity` INT NOT NULL
);




ALTER TABLE
    `product_order` ADD INDEX `product_order_product_id_index`(`product_id`);
ALTER TABLE
    `product_order` ADD INDEX `product_order_order_id_index`(`order_id`);
ALTER TABLE
    `orders` ADD CONSTRAINT `orders_payment_id_foreign` FOREIGN KEY(`payment_id`) REFERENCES `payments`(`id`) ON DELETE CASCADE;
ALTER TABLE
    `orders` ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`) ON DELETE SET NULL;
ALTER TABLE
    `product_order` ADD CONSTRAINT `product_order_product_id_foreign` FOREIGN KEY(`product_id`) REFERENCES `products`(`id`) ON DELETE CASCADE;
ALTER TABLE
    `product_order` ADD CONSTRAINT `product_order_order_id_foreign` FOREIGN KEY(`order_id`) REFERENCES `orders`(`id`) ON DELETE CASCADE;
ALTER TABLE
    `products` ADD CONSTRAINT `products_artist_id_foreign` FOREIGN KEY(`artist_id`) REFERENCES `artists`(`id`) ON DELETE SET NULL;      

   -- Insert statements for artist table 

INSERT INTO artists (brand) VALUES ("Vogue");
INSERT INTO artists (brand) VALUES ("DRESSX");
INSERT INTO artists (brand) VALUES ("Neoteric");
INSERT INTO artists (brand) VALUES ("Eter Studio");
INSERT INTO artists (brand) VALUES ("Camey Liu");
INSERT INTO artists (brand) VALUES ("Holodrop");
INSERT INTO artists (brand) VALUES ("Astroporcelain");
INSERT INTO artists (brand) VALUES ("NAOWAO");
INSERT INTO artists (brand) VALUES ("SHOE 53045");
INSERT INTO artists (brand) VALUES ("Asespa x PAPER X DMAT");
INSERT INTO artists (brand) VALUES ("Onyx Veil");
INSERT INTO artists (brand) VALUES ("Chaos Lab");
INSERT INTO artists (brand) VALUES ("Balmlabs");
INSERT INTO artists (brand) VALUES ("DMAT");
INSERT INTO artists (brand) VALUES ("EBIT™");
INSERT INTO artists (brand) VALUES ("Shek Leung");
INSERT INTO artists (brand) VALUES ("KAI KAI");
INSERT INTO artists (brand) VALUES ("Rebecca Minkoff");
INSERT INTO artists (brand) VALUES ("DMAT");


   -- Insert statements into products table 

INSERT INTO products (name, price, currency, description, units, image_1, image_2, image_3) VALUES ("HIP-HOP AT FIFTY East Coast Fit", 20.00, "USD", "New York in the 80’s was definitely a vibe and now you can relive the golden era of Hip-Hop with an iconic first-of-its-kind virtual streetwear look. With statement pieces like the classic bucket hat, cazal-inspired shades and matching tracksuit, your avatars and digital prints will most definitely be Fresh To Def. Purchase the suit, upload an image of yourself, and get back a fully styled photo in this iconic HIP-HOP AT FIFTY design.", 18, "https://dressx.com/cdn/shop/files/IMG_5596_540x.jpg?v=1691783730", "https://dressx.com/cdn/shop/files/HH50_East_Coast_2_Custom_View_2_1_540x.png?v=1691783730", "https://dressx.com/cdn/shop/files/HH50_East_Coast_2_Custom_View_3_1_540x.png?v=1691783730");
INSERT INTO products (name, price, currency, description, units, image_1, image_2, image_3) VALUES (" BISHOP black", 70.00, "USD", "Midi dress with asymmetric cut embellished with the cape. The headpiece represents the top of the bishop figure. THIS IS A DIGITAL ITEM, IT ONLY EXISTS DIGITALLY AND WILL BE APPLIED TO YOUR PHOTO(s). Material: digital mesh.    Digital clothes fit all sizes.    Material: digital mesh.neoteric.collab", 41, "https://dressx.com/cdn/shop/files/04_bishop_black_front_neoteric.collab_720x.png?v=1692621916", "https://dressx.com/cdn/shop/files/04_bishop_black_side_neoteric.collab_720x.png?v=1692621916", "https://dressx.com/cdn/shop/files/04_bishop_black_back_neoteric.collab_720x.png?v=1692621916");
INSERT INTO products (name, price, currency, description, units, image_1, image_2, image_3) VALUES ("Sueño Necklace x SIMES", 30.00, "USD", "A metal hard necklace with melting colored glass endings wraps around the neck almost becoming part of the wearer’s body. Co-created with stylist duo Antonella and Aldana SIMES.THIS IS A DIGITAL ITEM, IT ONLY EXISTS DIGITALLY AND WILL BE APPLIED TO YOUR PHOTO(s).", 25, "https://dressx.com/cdn/shop/files/04_bishop_black_front_neoteric.collab_720x.png?v=1692621916", "https://dressx.com/cdn/shop/files/04_bishop_black_side_neoteric.collab_720x.png?v=1692621916", "https://dressx.com/cdn/shop/files/04_bishop_black_back_neoteric.collab_720x.png?v=1692621916");
INSERT INTO products (name, price, currency, description, units, image_1, image_2, image_3) VALUES ("Rainbow Mirage", 40.00, "USD", "The Rainbow Mirage pants are a dazzling and vibrant creation that brings the magic of a rainbow to life. THIS IS A DIGITAL ITEM, IT ONLY EXISTS DIGITALLY AND WILL BE APPLIED TO YOUR PHOTO(s) Color: multicolor. Material: digital sequins. Digital clothes fit all sizes.", 39, "https://dressx.com/cdn/shop/files/RAINBOW_MIRAGE_HOLODROP_PEOPLE_540x.jpg?v=1691592999", "https://dressx.com/cdn/shop/files/RAINBOW_MIRAGE_HOLODROP_FRONT_540x.png?v=1691592999", "https://dressx.com/cdn/shop/files/RAINBOW_MIRAGE_HOLODROP_SIDE_540x.png?v=1691592999");
INSERT INTO products (name, price, currency, description, units, image_1, image_2, image_3) VALUES ("Amphitrite Deformed midi dress", 100.00, "USD", "Deformed midi dress made from digital fluid fabric. THIS IS A DIGITAL ITEM, IT ONLY EXISTS DIGITALLY AND WILL BE APPLIED TO YOUR PHOTO(s). Color: graphite. Material: digital fluid fabric. Digital clothes fit all sizes.", 42, "https://dressx.com/cdn/shop/files/04_AmphitritedressAccessory_OnBody1_CameyLiu_720x.png?v=1683214095", "https://dressx.com/cdn/shop/files/04_AmphitritedressAccessory_Front_CameyLiu_720x.png?v=1683215551", "https://dressx.com/cdn/shop/files/04_AmphitritedressAccessory_OnBody3_CameyLiu_720x.png?v=1683215551");
INSERT INTO products (name, price, currency, description, units, image_1, image_2, image_3) VALUES ("Aqua Organza mini dress", 160.00, "USD", "Organza mini dress embellished with plisse cape. THIS IS A DIGITAL ITEM, IT ONLY EXISTS DIGITALLY AND WILL BE APPLIED TO YOUR PHOTO(s) Color: blue. Material: digital fluid fabric, digital organza.", 32, "https://dressx.com/cdn/shop/files/03_Aqua_dress_Front_Camey_Liu_720x.png?v=1683213729", "https://dressx.com/cdn/shop/files/03_Aqua_dress_Left_Camey_Liu_1c2ce5b4-0905-4b7f-b4b0-9e8c79ef2a80_720x.png?v=1683213782", "https://dressx.com/cdn/shop/files/03_Aqua_dress_Back_Camey_Liu_630be797-738d-4263-8b81-aa95baf87e5e_720x.png?v=1683213782");
INSERT INTO products (name, price, currency, description, units, image_1, image_2, image_3) VALUES ("Bubble Dream", 40.00, "USD", "The iridescent pink dress with its top and long skirt manipulated like soap bubbles is a captivating and evocative creation. It embodies the playful and magical nature of fashion, reminding us that clothing can be more than just an outfit.Color: iridescent pink. Material: digital silk. Digital clothes fit all sizes.", 18, "https://dressx.com/cdn/shop/files/BUBBLE_DREAM_HOLODROP_people_720x.jpg?v=1691604264", "https://dressx.com/cdn/shop/files/BUBBLE_DREAM_HOLODROP_FRONT_720x.png?v=1691604264", "https://dressx.com/cdn/shop/files/BUBBLE_DREAM_HOLODROP_BACK_720x.png?v=1691604264");
INSERT INTO products (name, price, currency, description, units, image_1, image_2, image_3) VALUES ("Nabillera Iridescent Butterfly accessory", 80.00, "USD", "Butterfly accessory. THIS IS A DIGITAL ITEM, IT ONLY EXISTS DIGITALLY AND WILL BE APPLIED TO YOUR PHOTO(s) Color: pink. Material: digital plastic. ", 45, "https://dressx.com/cdn/shop/files/06_NabilleraIridescentButterfly_Front_CameyLiu_720x.png?v=1683213880", "https://dressx.com/cdn/shop/files/06_NabilleraIridescentButterfly_Back_CameyLiu_720x.png?v=1683213942", "https://dressx.com/cdn/shop/files/06_NabilleraIridescentButterfly_Side2_CameyLiu_720x.png?v=1683213942");
INSERT INTO products (name, price, currency, description, units, image_1, image_2, image_3) VALUES ("Ramari Bikini", 30.00, "USD", "Ramari in Māori means a rare event. This two-piece bikini represents a rare phenomenon where an organism breaks free from the rigid embrace of deep water coral, which is now worn as a symbol of bravery in the form of a jacket. Color: white. Material: digital ice, digital coral. Digital clothes fit all sizes.", 28, "https://dressx.com/cdn/shop/files/02_ramari_astroporcelain_FRONT_720x.png?v=1691787385", "https://dressx.com/cdn/shop/files/02_ramari_astroporcelain_SIDE_e0782372-5602-4814-8207-b74b7ae27f44_720x.png?v=1691787385", "https://dressx.com/cdn/shop/files/02_ramari_astroporcelain_BACK_720x.png?v=1691787385");
INSERT INTO products (name, price, currency, description, units, image_1, image_2, image_3) VALUES ("Magni shoulderless jumpsuit", 45.00, "USD", "The inspiration for this piece is from the nudibranch Chromodoris magnifica. This shoulderless jumpsuit resembles the color and pattern of the nudibranch. The same design choker and the shoulder accessories are a taste of an evil poison that they possess. Don't forget the spikes on its back! THIS IS A DIGITAL ITEM, IT ONLY EXISTS DIGITALLY AND WILL BE APPLIED TO YOUR PHOTO(s)", 10, "https://dressx.com/cdn/shop/products/01_jumpsuit_magni_720x.png?v=1653751426", "https://dressx.com/cdn/shop/products/02_jumpsuit_magni_720x.png?v=1653751426", "https://dressx.com/cdn/shop/products/03_jumpsuit_magni_720x.png?v=1653751426");
INSERT INTO products (name, price, currency, description, units, image_1, image_2, image_3) VALUES ("Cryosphere Crop Top and Skirt", 40.00, "USD", "Much like the many forms of Earth's icy water, the Cryosphere Crop Top and Skirt expresses an unexpected buoyancy in movement when worn. Color: blue. Material: digital ice. Digital clothes fit all sizes.", 1, "https://dressx.com/cdn/shop/files/03_cryosphere_astroporcelain_FRONT_720x.png?v=1691787342", "https://dressx.com/cdn/shop/files/03_cryosphere_astroporcelain_45_DEGREES_720x.png?v=1691787342", "https://dressx.com/cdn/shop/files/03_cryosphere_astroporcelain_BACK_720x.png?v=1691787342");
INSERT INTO products (name, price, currency, description, units, image_1, image_2, image_3) VALUES ("Minus 0.15 Short-sleeved Scuba", 40.00, "USD", "This short-sleeved scuba was inspired by the below freezing conditions of water at -0.15 degrees Celsius. Cold coral wraps itself around the garment, refusing to let go. Color: blue. Material: digital ice, digital coral. Digital clothes fit all sizes.", 9, "https://dressx.com/cdn/shop/files/05_minus015_astroporcelain_FRONT_720x.png?v=1691776802", "https://dressx.com/cdn/shop/files/05_minus015_astroporcelain_SIDE_720x.png?v=1691776802", "https://dressx.com/cdn/shop/files/05_minus015_astroporcelain_BACK_720x.png?v=1691776802");
INSERT INTO products (name, price, currency, description, units, image_1, image_2, image_3) VALUES ("Opsis Long-sleeved Scuba", 40.00, "USD", "Inspired by the Greek word opsis meaning appearance, this long-sleeved scuba resembles the very-depths of the ocean blue being raised to the surface and now visible in plan sight. Color: white. Material: digital ice. Digital clothes fit all sizes.", 35, "https://dressx.com/cdn/shop/files/06_opsis_astroporcelain_FRONT_720x.png?v=1691773302", "https://dressx.com/cdn/shop/files/06_opsis_astroporcelain_SIDE_720x.png?v=1691773302", "https://dressx.com/cdn/shop/files/06_opsis_astroporcelain_BACK_720x.png?v=1691773302");
INSERT INTO products (name, price, currency, description, units, image_1, image_2, image_3) VALUES ("Cyb'Air Thunder Boots", 200.00, "EURO", "This collectible NFT from the digital-native sneaker brand SHOES 53045 includes a 3D unisex pair of shoes suitable for the IMVU metaverse, powered by MetaJuice. A futuristic sneaker boot inspired by technical motocross footwear with a triple-decker bubble air heel, Cyb’Air Thunder features a thundering superpower effect. This NFT includes a 3D asset (USDZ file), 2D Collectible assets (.pngs), a link to a Snapchat AR try-on and a 3D Unisex pair of Shoes suitable for the IMVU metaverse, powered by MetaJuice. By purchasing the NFT, you agree to abide by the IMVU NFT Terms of Service. ", 28, "https://storage.thedematerialised.com/e2aa5a0c-bd28-430d-82ab-23d38931f1cf/imageUrls/thunder_nft1_image_1.jpg", "https://storage.thedematerialised.com/e2aa5a0c-bd28-430d-82ab-23d38931f1cf/imageUrls/thunder_nft1_image_2.jpg", "https://storage.thedematerialised.com/e2aa5a0c-bd28-430d-82ab-23d38931f1cf/imageUrls/thunder_nft1_image_3.jpg");
INSERT INTO products (name, price, currency, description, units, image_1, image_2, image_3) VALUES ("GISELLE’s Necklace", 100.00, "EURO", "This æ-ccessory plays by no rules. Gravity defying and luminous like the moon, GISELLE’s Necklace is where her stars align. This limited-edition necklace is your digital access pass, with an AR filter to wear the choker, exclusive PAPER cover and additional perks from DMAT.", 18, "https://storage.thedematerialised.com/d63fff98-7348-4858-ae79-2f7aa26a7d3e/imageUrls/Paper_Aespa_Accessories_Giselle_Image_Hero.png", "https://storage.thedematerialised.com/d63fff98-7348-4858-ae79-2f7aa26a7d3e/imageUrls/Paper_Aespa_Accessories_Giselle_Image_2.png", "https://storage.thedematerialised.com/d63fff98-7348-4858-ae79-2f7aa26a7d3e/imageUrls/PaperAespa_Accessory_Giselle_Image_VirtualDressing.jpg");
INSERT INTO products (name, price, currency, description, units, image_1, image_2, image_3) VALUES ("Teflon Sega Mask", 80.00, "EURO", "The Onyx Veil is made from Qidron chromite and adorned with enchanted flowers plucked from the graves of queens. The flowers absorb black magic while replenishing the host's own power. The neck of the bearer is protected with impenetrable Volconian pearls. The mask was created by the ancients as a reaction to the rise of dark magic and the ongoing waves of sinister spirits. This NFT includes access to contest to win physical merch, an exclusive preview of Teflon's new track, a 3D asset (.fbx), a video (.mp4) and 2D collectibles (.pngs).", 38, "https://storage.thedematerialised.com/fd5e423b-d6ad-4037-903d-4f2db79f4cc9/imageUrls/teflon_halloween_image_a.png", "https://storage.thedematerialised.com/fd5e423b-d6ad-4037-903d-4f2db79f4cc9/imageUrls/teflon_halloween_image_b.png", "https://storage.thedematerialised.com/fd5e423b-d6ad-4037-903d-4f2db79f4cc9/imageUrls/teflon_halloween_image_c.png");
INSERT INTO products (name, price, currency, description, units, image_1, image_2, image_3) VALUES ("Coalescence", 45.00, "USD", "Inspired by floral blossom but placed upside down. The dress is made with gradient mesh material to achieve a certain degree of see-through effect to emphasize the metallic prism effect of its inner layer. Color: graphite, tech blue. Material: digital metal, digital silk. Digital clothes fit all sizes.", 6, "https://dressx.com/cdn/shop/products/01_Dress_Coalescence_Chaos_lab_540x.png?v=1652869942", "https://dressx.com/cdn/shop/products/02_Dress_Coalescence_Chaos_lab_540x.png?v=1652869942", "https://dressx.com/cdn/shop/products/03_Dress_Coalescence_Chaos_lab_540x.png?v=1652869942");
INSERT INTO products (name, price, currency, description, units, image_1, image_2, image_3) VALUES ("Cropped Puffy Jacket", 40.00, "USD", "BalmLabs is a Ghana-based Digital Fashion House that specializes in digital-only media for fashion brands. Baboa Tachie-Menson – the designer behind the BTM studios by Balmlabs – shares that digital fashion has helped her to push the boundaries of the traditional industry and simply concentrate on the creative process of designing the clothes. In digital fashion there is no need to provide physical sketches, which don’t usually get the ideas across in the best way, and absolutely no need to account for the fabrics availability and price. In Baboa’s opinion, digital fashion is a new and more conscious way of consuming fashion that brings a lot of fun and excitement to the industry, while also allowing brands to explore all areas of design and keep up the momentum.     The collection available at DressX was created during the lockdown period and designed to bring light and bright colors to the lives of its viewers. The colors used in the collection illustrate warmth and nature but in their vibrant forms. The fabrics and materials used mainly represent silk, plastic, and rubber. Color: bright orange. Material: digital polyester. Digital clothes fit all sizes.", 5, "https://dressx.com/cdn/shop/products/CopyofLOOK_1_Custom_View_1_540x.png?v=1609788671", "https://dressx.com/cdn/shop/files/6005_newcopy_540x.jpg?v=1684260552", "https://dressx.com/cdn/shop/products/CopyofLOOK_1_Custom_View_4_540x.png?v=1684260552");
INSERT INTO products (name, price, currency, description, units, image_1, image_2, image_3) VALUES ("‘I AM FLOWER’ dress", 200.00, "EURO", "Celine Kwan’s - I AM FLOWER - dress has a dramatic inflatable flower neckline, paired with vase shaped leg-warmers. It perfectly encapsulates her desire to bring a smile to the faces of people who experience her work. Dramatic, inflatable silhouettes are brought to life by bold, colourful prints and colours - a signature of her brand’s larger-than-life personality. This NFT includes a video (.mp4) and 2D collectibles (.pngs).", 15, "https://storage.thedematerialised.com/40634196-6897-4eb5-95eb-9e302ba5cc57/imageUrls/celine_kwan_image1.jpg", "https://storage.thedematerialised.com/40634196-6897-4eb5-95eb-9e302ba5cc57/imageUrls/celine_kwan_image2.jpg", "https://storage.thedematerialised.com/40634196-6897-4eb5-95eb-9e302ba5cc57/imageUrls/celine_kwan_image4.jpg");
INSERT INTO products (name, price, currency, description, units, image_1, image_2, image_3) VALUES ("E010d sneakers", 200.00, "EURO", "80s basketball Brooklyn vibe, this high-top morphs from E010c into a postmodern classic. ENJOY BEING IN TRANSITION heel focus progresses the tone for the Spectrum. Elephant grey & yellow effects, with black & white freshness. Elements of Sunray sole unit remain consistent in Spectrum from E010b and E010c. Signature 69cm signature EBIT™ organic cotton label which contains subtle references to morality, mental health and youth culture: Non-Toxic. Algorithm Free. Anti-Stigma. Metaverse ready. This NFT includes an 3D file (.glb), an AR file (.usdz), a 3D cube reveal video (.mp4), and 2D collectibles (.pngs). Further, owners will receive early access as soon as EBIT™ physical products are available. This NFT collection comes with an AR lens experience on Instagram.", 16, "https://storage.thedematerialised.com/b301ada9-aac6-42cd-8906-ffc673ac074e/imageUrls/E010d_image_1.jpg", "https://storage.thedematerialised.com/b301ada9-aac6-42cd-8906-ffc673ac074e/imageUrls/E010d_blue.jpg", "https://storage.thedematerialised.com/b301ada9-aac6-42cd-8906-ffc673ac074e/imageUrls/E010d_image_2.jpg");
INSERT INTO products (name, price, currency, description, units, image_1, image_2, image_3) VALUES ("Rupture Noise Coat ", 80.00, "EURO", "SHEK LEUNG’s -Rupture Noise Coat-  is an interplay between power and fragility. This digital garment was inspired by the idea of feeling overwhelmed by unfiltered thoughts. The overwhelming ‘film noise’ skin was originally explored by scaling and texturing the prints and signature handmade fabric from SHEK LEUNG’s collection. It was then animated to create a sense of discomfort and embodies vulnerability and fragility in menswear. This NFT includes a video (.mp4) and 2D collectibles (.pngs).", 45, "https://storage.thedematerialised.com/534f3b8b-57bf-4f19-85f6-a7e278d6dae9/imageUrls/shek_leung_image1.jpg", "https://storage.thedematerialised.com/534f3b8b-57bf-4f19-85f6-a7e278d6dae9/imageUrls/shek_leung_image3.jpg", "https://storage.thedematerialised.com/534f3b8b-57bf-4f19-85f6-a7e278d6dae9/imageUrls/shek_leung_image5.jpg");
INSERT INTO products (name, price, currency, description, units, image_1, image_2, image_3) VALUES ("Green dress", 80.00, "USD", "KAI KAI is a digital fashion brand created by Tatiana Rumiantseva - Bali-based 3D designer, who found a balance between the endless possibilities of digital space and the life in nature. By creating, as she names it, ‘thought couture’, Tatiana aims to show that we all are capable of transforming through virtual garments to meet the new year with new super powers. ‘Thought couture’ by KAI KAI is the clothing that can take its wearer to the world of the changed laws of physics. KAI KAI garments can take off, disintegrate, change colors, and reflect space. The collection, and specifically multicolored garments, were created using a custom-made HDRI map, which makes them reflect the surrounding space and transform in motion. Color: green. Material: liquid metal. Digital clothes fit all sizes.", 34, "https://dressx.com/cdn/shop/products/Copyof01_greendress_kaikai_540x.png?v=1609789355", "https://dressx.com/cdn/shop/products/Copyof03_greendress_kaikai_540x.png?v=1609789355", "https://dressx.com/cdn/shop/products/Copyof02_greendress_kaikai_540x.png?v=1609789355");
INSERT INTO products (name, price, currency, description, units, image_1, image_2, image_3) VALUES ("Multicolored dress", 80.00, "USD", "KAI KAI is a digital fashion brand created by Tatiana Rumiantseva - Bali-based 3D designer, who found a balance between the endless possibilities of digital space and the life in nature. By creating, as she names it, ‘thought couture’, Tatiana aims to show that we all are capable of transforming through virtual garments to meet the new year with new super powers. ‘Thought couture’ by KAI KAI is the clothing that can take its wearer to the world of the changed laws of physics. KAI KAI garments can take off, disintegrate, change colors, and reflect space. The collection, and specifically multicolored garments, were created using a custom-made HDRI map, which makes them reflect the surrounding space and transform in motion. Color: multicolored metallic. Material: liquid metal. Digital clothes fit all sizes.", 27, "https://dressx.com/cdn/shop/files/20220518Liu6282_New_1_copy2copy_540x.jpg?v=1684868963", "https://dressx.com/cdn/shop/products/Copyof01_multicoloreddress_kaikai_540x.png?v=1684868963", "https://dressx.com/cdn/shop/products/1487-1_540x.jpg?v=1684868963");
INSERT INTO products (name, price, currency, description, units, image_1, image_2, image_3) VALUES ("Multicolored pants", 30.00, "USD", "KAI KAI is a digital fashion brand created by Tatiana Rumiantseva - Bali-based 3D designer, who found a balance between the endless possibilities of digital space and the life in nature. By creating, as she names it, ‘thought couture’, Tatiana aims to show that we all are capable of transforming through virtual garments to meet the new year with new super powers. ‘Thought couture’ by KAI KAI is the clothing that can take its wearer to the world of the changed laws of physics. KAI KAI garments can take off, disintegrate, change colors, and reflect space. The collection, and specifically multicolored garments, were created using a custom-made HDRI map, which makes them reflect the surrounding space and transform in motion. Color: multicolored metallic. Material: liquid metal and snake skin. Digital clothes fit all sizes.", 14, "https://dressx.com/cdn/shop/products/1911_4_1_540x.jpg?v=1633374631", "https://dressx.com/cdn/shop/products/1497_pants-V2_540x.jpg?v=1633374680", "https://dressx.com/cdn/shop/products/Copyof01_multicoloredpants_kaikai_540x.png?v=1633374680");
INSERT INTO products (name, price, currency, description, units, image_1, image_2, image_3) VALUES ("Venus dress", 1000.00, "EURO", "Venus, the goddess of love, in a voluminous hoodie glazed in mother of pearl with encrusted crystals draped on top of a deep cut chain link dress. The Julian crossbody in fiberoptic material explodes with quartz clusters complimenting the crystal platform boots with RM’s signature dog clip heel. Crystal starbursts dangle on the end of the punk lip ring. This NFT includes a 3D asset (.usdz file), 2D collectibles (.pngs), a turntable video (.mp4). Further, owners of this NFT receive exclusive access to a branded experience and unlockable Rebecca Minkoff products in Roblox. The accessories from this NFT are wearable in Snapchat and Instagram.", 34, "https://storage.thedematerialised.com/20669f7f-493d-4de3-b74b-0a6e726509c3/imageUrls/venus_comp_v3.mp4", "https://storage.thedematerialised.com/20669f7f-493d-4de3-b74b-0a6e726509c3/imageUrls/venus_image_1.jpg", "https://storage.thedematerialised.com/20669f7f-493d-4de3-b74b-0a6e726509c3/imageUrls/venus_image_3.jpg");
INSERT INTO products (name, price, currency, description, units, image_1, image_2, image_3) VALUES ("Archaistic Jade Armour by Cady Lee", 160.00, "EURO", "Cady Lee's -Archaistic Jade Armour- is inspired by a traditional Chinese decorative hairpin and its chain ornaments, with spiral claw details on the shoulder creating an erotic and animalistic sense. Made with jade, the material's subtle, translucent qualities lent a poetic, luxurious tone and added a mystical aura. This NFT includes a video (.mp4) and 2D collectibles (.pngs).", 11, "https://storage.thedematerialised.com/c696ce8d-4146-41a5-8864-2084ce2ea4b2/imageUrls/cady_lee_virtual_dressing1.jpg", "https://storage.thedematerialised.com/c696ce8d-4146-41a5-8864-2084ce2ea4b2/imageUrls/cady_lee_virtual_dressing2.jpg", "null");




