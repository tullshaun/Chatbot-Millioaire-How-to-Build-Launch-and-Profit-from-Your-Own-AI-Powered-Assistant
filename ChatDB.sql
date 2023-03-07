CREATE DATABASE Chat;
GO

USE Chat;



CREATE TABLE Users (
   UserID int NOT NULL IDENTITY(1,1) PRIMARY KEY,
   Name varchar(50) NOT NULL,
   Email varchar(50) NOT NULL,
   Password varchar(50) NOT NULL,
   TimeStamp datetime default getdate()
);

CREATE TABLE Messages (
   MessageID int NOT NULL IDENTITY(1,1) PRIMARY KEY,
   UserID int NOT NULL,
   Text varchar(255) NOT NULL,
   TimeStamp datetime NOT NULL,
   FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

INSERT INTO Users (Name, Email, Password) VALUES ('John', 'john@example.com', 'password123');
INSERT INTO Users (Name, Email, Password) VALUES ('Jane', 'jane@example.com', 'password456');
INSERT INTO Users (Name, Email, Password) VALUES ('Bob', 'bob@example.com', 'password789');

INSERT INTO Messages (UserID, Text, TimeStamp) VALUES (1, 'Hello, how can I help you?', '2022-03-06 10:00:00');
INSERT INTO Messages (UserID, Text, TimeStamp) VALUES (2, 'I have a question about my order.', '2022-03-06 10:05:00');
INSERT INTO Messages (UserID, Text, TimeStamp) VALUES (3, 'Can you help me with a technical issue?', '2022-03-06 10:10:00');

CREATE TABLE Questions (
    QuestionID INT PRIMARY KEY,
    QuestionText VARCHAR(500)
);

CREATE TABLE Answers (
    AnswerID INT PRIMARY KEY,
    QuestionID INT,
    AnswerText VARCHAR(1000),
    FOREIGN KEY (QuestionID) REFERENCES Questions(QuestionID)
);

INSERT INTO Questions (QuestionID, QuestionText) VALUES
(1, 'How do I reset my password?'),
(2, 'What are my shipping options?'),
(3, 'How can I track my order?'),
(4, 'Can I cancel my order?'),
(5, 'What is your return policy?'),
(6, 'How do I contact customer support?'),
(7, 'What are your business hours?'),
(8, 'Can you help me troubleshoot an issue with your product?');

INSERT INTO Answers (AnswerID, QuestionID, AnswerText) VALUES
(1, 1, 'To reset your password, please go to the login page and click on "forgot password". Follow the prompts to reset your password.'),
(2, 2, 'We offer a variety of shipping options, including standard shipping, expedited shipping, and international shipping. You can view your shipping options and select your preferred method during the checkout process.'),
(3, 3, 'You can track your order by logging into your account on our website and navigating to the "order history" section. There, you will see tracking information for your order.'),
(4, 4, 'Yes, you can cancel your order before it has shipped. To cancel your order, please log into your account and navigate to the "order history" section. From there, you can select the order you wish to cancel and follow the prompts to cancel it.'),
(5, 5, 'We offer a 30-day return policy for most items. If you are not satisfied with your purchase, you can return it for a refund or exchange within 30 days of the purchase date. For more information, please see our returns and exchanges policy on our website.'),
(6, 6, 'You can contact our customer support team by emailing support@luxurycarsshipping.com or by calling our toll-free number at 1-800-123-4567. Our customer support team is available 24/7 to assist you with any questions or concerns.'),
(7, 7, 'Our business hours are Monday through Friday, 9:00am to 5:00pm EST. However, you can place orders and track your shipments on our website 24/7.'),
(8, 8, 'Yes, our customer support team can assist you with any issues or troubleshooting related to our products. Please contact us by email or phone and provide as much detail as possible about the issue you are experiencing. We will do our best to help you resolve the issue quickly and efficiently.');
