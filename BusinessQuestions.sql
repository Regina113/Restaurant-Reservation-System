-- Business Questions & Answers
-- 1. Which tables are available on May 30th at 7:00pm?
SELECT *
FROM RestaurantTables
WHERE TableID NOT IN (
      SELECT TableID
      FROM Reservations
      WHERE ReservationDate = '2025-05-30' AND ReservationTime = '19:00:00');
      
-- 2. Who are our top 3 most frequent customers?
SELECT FullName, COUNT(*) AS ReservationCount
FROM Reservations JOIN Customers USING (CustomerID)
GROUP BY CustomerID
ORDER BY ReservationCount DESC
LIMIT 3;

-- 3. How many reservations are made each day this week? 
SELECT ReservationDate, COUNT(*) AS TotalReservations
FROM Reservations
WHERE ReservationDate BETWEEN '2025-05-26' AND '2025-06-01'
GROUP BY ReservationDate
ORDER BY ReservationDate;

-- 4. Which table is booked the most often?
SELECT TableNumber, COUNT(*) AS BookingCount
FROM Reservations JOIN RestaurantTables USING (TableID)
GROUP BY TableID
ORDER BY BookingCount DESC
LIMIT 1;

-- 5. Do we have any reservations where the number of guests exceeds the table capacity?
SELECT ReservationID, NumberOfGuests, Capacity
FROM Reservations JOIN RestaurantTables USING (TableID)
WHERE NumberOfGuests > Capacity;

-- 6. Can I cancel a reservation by ID? Please write a query for that.
DELETE FROM Reservations WHERE ReservationID = 4; 
