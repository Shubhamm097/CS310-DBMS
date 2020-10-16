USE Travel;
SELECT * FROM User;
-- Inner Joins
SELECT u.userId, u.adminId, u.age, u.firstName AS userName, a.firstName AS adminName FROM User AS u INNER JOIN Admin AS a ON (u.adminId = a.adminId AND u.age > 22);



SELECT u.userId, u.age, a.adminId, b.bookingAgencyId, u.firstName AS userName, a.firstName AS adminName, b.name AS bookingAgencyName 
FROM ((User AS u
INNER JOIN Admin AS a ON (u.adminId = a.adminId AND u.age < 23))
INNER JOIN BookingAgency AS b ON (b.adminId = a.adminId AND b.name = 'Fare Portal'));




SELECT t.transportType, t.charges AS TravelCharges, t.transportId, b.bookingAgencyId 
FROM Transport AS t 
INNER JOIN BookingAgency AS b ON (b.bookingAgencyId = t.bookingAgencyId AND (t.transportType='Flight' OR t.transportType='Bus'))
ORDER BY t.charges;


-- Left Outer Joins

SELECT u.userId, u.adminId AS UAID, a.adminId, u.firstName AS userName, a.firstName AS adminName 
FROM User AS u  
LEFT OUTER JOIN Admin AS a ON (u.adminId = 1);


SELECT u.userId, u.adminId, a.adminId, u.firstName AS userName, u.age AS userAge, 
a.firstName AS adminName, COUNT(u.userId) AS ageGroup
FROM User AS u
LEFT OUTER JOIN Admin AS a ON (u.adminId = 2)
GROUP BY u.age
HAVING ageGroup < 5;

SELECT t.transportId, b.bookingAgencyId, t.transportType, t.charges AS travelCharges, b.name
FROM transport AS t
LEFT OUTER JOIN BookingAgency AS b ON (t.bookingAgencyId=1 AND t.transportType='Train')
ORDER BY t.charges;

-- Right Outer Join

SELECT b.bookingAgencyId, a.advertisementId,b.name, a.price AS AdvertisementPrice
FROM BookingAgency AS b
RIGHT OUTER JOIN Advertisement AS a ON (a.bookingAgencyId=2)
ORDER BY a.price;

SELECt u.userId, p.paymentId, u.firstName AS UserName, p.paymentType, p.paymentStatus, COUNT(p.paymentType) AS PaymentGroup
FROM User AS u
RIGHT OUTER JOIN Payment AS p ON (u.userId=p.userId)
GROUP BY p.paymentType;

SELECT b.bookingAgencyId, p.placeId, b.name AS BookingAgencyName, p.name AS PlaceName, p.pincode, COUNT(p.name) AS PlaceCount
FROM BookingAgency AS b
RIGHT OUTER JOIN Places AS p ON (p.bookingAgencyId=b.bookingAgencyId)
GROUP BY p.name
HAVING PlaceCount > 1;









