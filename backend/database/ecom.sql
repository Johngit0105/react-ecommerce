-- Create customer table
CREATE TABLE `customer` (
  `customer_id`        INT           NOT NULL AUTO_INCREMENT,
  `name`               VARCHAR(50)   NOT NULL,
  `email`              VARCHAR(100)  NOT NULL UNIQUE,
  `password`           VARCHAR(50)   NOT NULL,
  `phone`              VARCHAR(15),
  `locality`           VARCHAR(100),
  `address`            VARCHAR(100),
  `city`               VARCHAR(100),
  `state`              VARCHAR(100),
  `pin`                VARCHAR(10),
  
  PRIMARY KEY  (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=0;




-- Create product table
CREATE TABLE `product` (
  `product_id`       INT           NOT NULL  AUTO_INCREMENT,
  `name`             VARCHAR(100)  NOT NULL,
  `description`      VARCHAR(1000) NOT NULL,
  `price`            DECIMAL(10,2) NOT NULL,
  `image`            VARCHAR(150), 
  PRIMARY KEY  (`product_id`)
) ENGINE=InnoDB;


-- Create shopping_cart table
CREATE TABLE `shopping_cart` (
  `item_id`     INT           NOT NULL  AUTO_INCREMENT,
  `customer_id`     INT           NOT NULL  ,
  `product_id`  INT           NOT NULL,
  `quantity`    INT           NOT NULL,
  PRIMARY KEY (`item_id`),
  FOREIGN KEY(`customer_id`) REFERENCES customer(`customer_id`),
  FOREIGN KEY(`product_id`) REFERENCES product(`product_id`)

) ENGINE=InnoDB;



-- Create orders table
CREATE TABLE `orders` (
  `order_id`     INT           NOT NULL  AUTO_INCREMENT,
  `created_on`   DATETIME      NOT NULL,
  `customer_id`  INT         NOT NULL,
  `product_id`  INT           NOT NULL,
  `quantity`    INT           NOT NULL,
  PRIMARY KEY  (`order_id`),
  FOREIGN KEY(`customer_id`) REFERENCES customer(`customer_id`),
  FOREIGN KEY(`product_id`) REFERENCES product(`product_id`)
) ENGINE=InnoDB;


-- Populate product table

INSERT INTO product (name, description, price, image, genre, pages, authour)
VALUES ('Thinking, Fast and Slow','The author in this book explains two ways of making choices. The first way is fast, emotional, and intuitive. The other way is slow, deliberative, and logical. By examining both these ways, Kahneman unveils the extraordinary capacities, biases of thinking fast, and various other aspects of the human mind. This is an engaging read that helps you understand your mind and how to avoid glitches while making decisions.',351,'2.jpg',' Psychology',512,'Kahneman Daniel')
('Sapiens - A Brief History of Humankind','Sapiens:A Brief History of Humankind is an insight into the ancient history of mankind. According to the author, human history has been shaped by three major revolutions namely, ‘The Cognitive Revolution’, ‘ The Agricultural Revolution’ and ‘The Scientific Revolution’. He feels that mankind has been empowered to create and connect around ideas that do not have a physical existence. Read this book to know more about what the author thinks on the same.',370,'3.jpg','History',512,'Yuval Noah Harari'),
('Poor Economics','Imagine you have a few million dollars. You want to spend it on the poor. How do you go about it? Billions of government dollars, and thousands of charitable organizations and NGOs, are dedicated to helping the world’s poor. But much of their work is based on assumptions about the poor and the world that are untested generalizations at best, harmful misperceptions at worst. Abhijit V. Banerjee and Esther Duflo have pioneered the use of randomized control trials in development economics through their award-winning Poverty Action Lab.',312,'4.jpg','Non-fiction',464,'Abhijit V. Banerjee and Esther Duflo'),
('The Hard Thing About Hard Things - Building A Business When There are No Easy Answers','Ben Horowitz has vast experience as a businessman. He has gone through many humbling experiences, high and low, those of which might help other businessmen to learn from. His story of founding, running and managing businesses, investing in resources and technology is something that one can learn from that are not taught or detailed in any business schools formal education. He addresses a lot of challenges that one might go through and what are the best possible ways to tackle them.',573,'5.jpg','Business & Economics',304,'Ben Horowitz'),
('Cosmos','Carl Sagan has an inimitable ability to take the spirit of human exploration to a whole new stratosphere. In Cosmos, he writes how the human brain has evolved as a part of evolution of life, to try and comprehend the enigmatic existence of our universe and everything in it. Since the days of Egyptian civilization to the present day, man has been constantly striving to understand the purpose of universe and our lives in it. He also explains the most complex concepts like the evolution of galaxies, the death of sun, the origins of matter, other suns and worlds with an unassuming simplicity. Cosmos is an immaculate vision into the past, contemplation on the present, and a boundless hope and inspiration for the future, all of which make it a timeless classic.',499,'6.jpg','Science',416,'Carl Sagan'),
('Blue Ocean Strategy',' A strategy classic. In this perennial bestseller, embraced by organizations and industries worldwide, globally preeminent management thinkers W. Chan Kim and Renee Mauborgne challenge everything you thought you knew about the requirements for strategic success. Recognized as one of the most iconic and impactful strategy books ever written, BLUE OCEAN STRATEGY.',749,'7.jpg','Business & Economics',320,'W. Chan Kim and Renée Mauborgne'),
('The God Delusion','The God Delusion caused a sensation when it was published in 2006. Within weeks it became the most hotly debated topic, with Dawkins himself branded as either saint or sinner for presenting his hard-hitting, impassioned rebuttal of religion of all types. His argument could hardly be more topical. While Europe is becoming increasingly secularized, the rise of religious fundamentalism, whether in the Middle East or Middle America, is dramatically and dangerously dividing opinion around the world.',380,'8.jpg','Religion',496,'Richard Dawkins'),
('Six Easy Pieces','It was Richard Feynman''s outrageous and scintillating method of teaching that earned him legendary status among students and professors of physics. From 1961 to 1963, Feynman delivered a series of lectures at the California Institute of Technology that revolutionized the teaching of physics around the world. Six Easy Pieces , taken from these famous Lectures on Physics, represent the most accessible material from the series. In these classic lessons, Feynman introduces the general reader to the following topics: atoms, basic physics, energy, gravitation, quantum mechanics, and the relationship of physics to other topics. With his dazzling and inimitable wit, Feynman presents each discussion with a minimum of jargon. Filled with wonderful examples and clever illustrations, Six Easy Pieces is the ideal introduction to the fundamentals of physics by one of the most admired and accessible physicists of modern times.',2153,'9.jpg','Science',176,'Richard Feynman'),
('A Brief History Of Time','A Brief History of Time, authored by the legendary theoretical physicist Stephen Hawking, is considered to be the holy grail of populalizing scientific writing and ever since it was published for the first time in 1988, the book has been an ultimate guide to both scientific and non-scientific communities searching for answers to the most fundamental questions.',249,'10.jpg','Science',240,'Stephen Hawking'),
('A Short History of Nearly Everything','Bill Bryson describes himself as a reluctant traveller, but even when he stays safely at home he can''t contain his curiosity about the world around him. A Short History of Nearly Everything is his quest to understand everything that has happened from the Big Bang to the rise of civilization - how we got from there, being nothing at all, to here, being us. Bill Bryson''s challenge is to take subjects that normally bore the pants off most of us, like geology, chemistry and particle physics, and see if there isn''t some way to render them comprehensible to people who have never thought they could be interested in science.The ultimate eye-opening journey through time and space, A Short History of Nearly Everything is the biggest-selling popular science book of the 21st century, and reveals the world in a way most of us have never seen it before.',599,'11.jpg','Science',672,'Bill Bryson'),
('Relativity','Relativity: The Special and General Theory, authored by Albert Einstein, is the magnum opus of scientific work written in a language of layman by none other than the man who revolutionized the world of Physics and considered to be the greatest mind ever lived on this planet.',156,'12.jpg','Philosophy',200,'Albert Einstein'),
('Influence','Considered experimental social psychologist Robert B. Cialdini''s best known work, Influence: The Psychology Of Persuasion is a classic on the art of persuasion and the psychology of saying ''yes''. With an aim to make better persuaders out of its readers, this book comes with the 6 famous principles of influence designed by Cialdini.',401,'13.jpg','Self-Help',336,'Robert B. Cialdini'),
('Skunk Works: a Personal Memoir of My Years at Lockheed','Skunk Works is the true story, told for the first time, of America''s most secret and successful aerospace operation. As recounted by Ben Rich, the operation''s brilliant boss for nearly two decades, the story of Lockheed''s legendary Skunk Works is a high-stakes drama of cold war confrontations and Gulf War air combat, of extraordinary feats of engineering and human achievement against fantastic odds.',951,'14.jpg','Biography',400,'Ben R. Rich and Leo Janos'),
('Homo Deus','THE MILLION COPY BESTSELLERSapiens shows us where we came from. Homo Deus shows us where we''re going.Yuval Noah Harari envisions a near future in which we face a new set of challenges. Homo Deus explores the projects, dreams and nightmares that will shape the twenty-first century and beyond - from overcoming death to creating artificial life.It asks the fundamental questions: how can we protect this fragile world from our own destructive power? And what does our future hold?''Homo Deus will shock you. It will entertain you. It will make you think in ways you had not thought before Daniel Kahneman',303,'15.jpg','Social Science',528,'Yuval Noah Harari'),
('The Intelligent Investor','First published in the year 1949, The Intelligent Investor, is considered the Bible for the stock market that contains strategies and wisdom to achieve your financial goals. This is the revised edition of the original book that contains updated commentary by Jason Zweig, a famous financial journalist. This revised edition incorporates the recent market trends and how to make money in the highly vulnerable stock market.',299,'16.jpg','Business & Economics',640,'Benjamin Graham'),
('Start With Why','Today, the secret to becoming a successful person in any field lies in asking one very important question - why? The reason why only a few people are able to be more successful than the rest and bring out their best creative instincts, the reason why only a small number of businessmen are able to make remarkable profits over and over again, and the reason why a few companies endure the test of time is nothing but the fact that they dwell on probing and continuously ask why, rather than how or what. Simon discusses events from real life stories. Start with Why: How Great Leaders Inspire Everyone to Take Action offers a riveting read for those who aspire to be inspirational, and for those who wish to look up to someone to inspire them.',380,'17.jpg','Business & Economics',256,'Simon Sinek'),
('The Origin of Species','It had been believed for a long time that all living things on earth came in individually. Charles Darwin, naturalist and geologist, came up with the evolutionary theory, which proved that all living beings have survived only because of evolution. He argued that natural selection has helped us survive through the changing environments throughout history. The book changed the world’s understanding of their environment and history, and has even challenged the strong belief in divine creation. Darwin''s book is essential for and has influenced scholars in fields of philosophy, theology and history.',125,'18.jpg','History',500,'Charles Darwin'),
('How To Win Friends And Influence People','You can make more friends in two months by becoming interested in other people than you can in two years by trying to get other people interested in you." From the fundamental techniques in handling people to the various ways to make them like you, this book offers insights on how to win people to your way of thinking; how to increase your ability to get things done; the ways to be a leader and change people without arousing resentment; and how to make friends quickly. A timeless bestseller, Dale Carnegie''s How to Win Friends and Influence People has been an inspiration for many of those who are now famous and successful.',190,'19.jpg','Self-Help',288,'Dale Carnegie'),
('Rich Dad Poor Dad','Rich Dad Poor Dad is a book written by Robert Kiyasaki that focuses on financial literacy, financial independence, building wealth by investing in financial assets and increasing one’s financial intelligence. The author presents six essential lessons through this book which are - The rich don’t work for money, The importance of financial literacy, minding your own business, taxes and corporations, the rich invent money and the need to work to learn and not for money.',159,'20.jpg','Business & Economics',336,'Robert Toru Kiyosaki'),
('The art of war','Discover the teachings of one of the greatest generals to have walked the planet, Sun Tzu. The Art of War is one of the most famous and most informative texts on warfare.',50,'21.jpg','History',100,'Sun Tzu'),
('Think & Grow Rich','Napoleon Hill''s earlier work discussed the 16 principles to success based on long discussions he held with some of the most successful people alive at the time. In this title, he draws on those principles again and condenses them even further to help people apply them to their jobs, dreams and lives. In 13 laws, Hill shows that success is a factor closely related to Desire, Faith, Auto-suggestion, Specialized Knowledge, Imagination, Organized Planning, Decision, Persistence, Power of the Master Mind, the Mystery of Sex Transmutation, the Subconscious Mind, the Brain and the Sixth Sense. One of the fastest selling books of its time, Think and Grow Rich expands on Andrew Carnegie''s idea that directed thought can help achieve one''s dreams.',99,'22.jpg','Self-Help',412,'Napoleon Hill'),
('21 Lessons for the 21st Century','21 Lessons for the 21st Century is one of Yuval Noah Harari''s best selling books. It is a visionary investigation that probes into the most urgent issues of today. We are moving into the uncharted territory of the future that has technological advances. These changes take place at a rate that is faster than our ability to understand and adapt. In this era, hacking becomes the latest tactic of war, and the world feels more pressured than ever. As Harari addresses the challenge of navigating life in the face of constant and disorienting change, we get an insight and understanding of some of the most pressing matters of today.',439,'23.jpg','History',368,'Yuval Noah Harari'),
('The wealth of nations','An Inquiry into the Nature and Causes of the Wealth of Nations, generally referred to by its shortened title The Wealth of Nations, is the magnum opus of the Scottish economist and moral philosopher Adam Smith.',299,'24.jpg','Political Science',950,'Adam Smith'),
('Zero To One','In 2012, Peter Thiel spoke to software engineers at Stanford, inspiring them to think boldly and try to carve out the future. He spoke of his own experiences, explaining the world of entrepreneurship from a personal point of view. Blake Masters was among the audience, and he recorded the lecture through detailed notes and posted them online. The posts went viral, and soon there was a need for a book which spoke more about Thiel’s ideas on entrepreneurship. In the current age, technology is beginning to stagnate. Information technology has grown at a rapid pace, but progress must not be limited to computers. Thiel explains that the next big entrepreneur will not have built an operating system or a search engine. Instead, tomorrow’s champions are going to be those who look at a unique business, roads which have not been taken. In doing so, they will discover that the roads which have been less travelled by will make all the difference between a zero and a one.',222,'25.jpg','Business & Economics',224,'Peter Thiel &  Blake Masters'),
('FREAKONOMICS','In the summer of 2003, the New York Times Magazine sent Stephen J. Dubner, an author and journalist, to write a profile of Steven D. Levitt, a heralded young economist at the University of Chicago. Levitt was not remotely interested in the things that interest most economists. Instead, he studied the riddles of everyday life from cheating to crime to child - rearing and his conclusions turned the conventional wisdom on its head. For instance, he argued that one of the maincauses of the crime drop of the 1990s was the legalization of abortion twenty years earlier. The Times article yielded an unprecedented response, a deluge of interest from thousands of curious, inspired, occasionally distraught readers. Levitt and Dubner collaborated on a book that gives full play to Levitts most compelling ideas.',218,'26.jpg','Business & Economics',336,'Steven D. Levitt& Stephen J. Dubner');


-- stored procedure 

CREATE PROCEDURE `addToCart`(
IN _customer_id INT,
IN _product_id INT,
IN _quantity INT
)
BEGIN
INSERT INTO shopping_cart(customer_id, product_id, quantity)
VALUES (_customer_id,_product_id,_quantity);
END

CREATE PROCEDURE `addToOrders`(
IN _created_on DATETIME,
IN _customer_id INT,
IN _product_id INT,
IN _quantity INT)
BEGIN
INSERT INTO orders(created_on,customer_id, product_id, quantity)
VALUES (_created_on,_customer_id,_product_id,_quantity);
END

