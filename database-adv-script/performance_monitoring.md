EXPLAIN ANALYZE
SELECT 
    U.user_id,
    U.name,
    COUNT(B.booking_id) AS total_bookings
FROM Users U
LEFT JOIN Bookings B ON U.user_id = B.user_id
GROUP BY U.user_id, U.name;

Identify Bottlenecks
The following are possible issues/bottle necks: 
| 🔎 Bottleneck | 🚫 Symptom | 💡 Cause | 
| Sequential table scan | High execution time on large tables | Missing index or filtering inefficiency | 
| Nested loop join | Multiple repeated scans of large tables | Poor join strategy due to missing index | 
| High sort cost | Sorting large result sets | ORDER BY without supporting index | 

Suggested Improvements
✅ Indexes
-- Improves JOIN on Bookings and Users
CREATE INDEX idx_bookings_user_id ON Bookings(user_id);

-- Helps with GROUP BY and filtering
CREATE INDEX idx_users_user_id_name ON Users(user_id, name);


✅ Schema Adjustments
- Partitioning the Bookings table (done earlier) helps prune irrelevant data.
- De-normalizing if read performance is critical and data duplication is acceptable.

📊 Step 4: Performance After Optimization
Rerun with EXPLAIN ANALYZE:
EXPLAIN ANALYZE
SELECT 
    U.user_id,
    U.name,
    COUNT(B.booking_id) AS total_bookings
FROM Users U
LEFT JOIN Bookings B ON U.user_id = B.user_id
GROUP BY U.user_id, U.name;


Sample Report:
Before Indexing:
- Seq scan on Bookings, nested loop join
- Execution time: ~850ms
After Indexing:
- Index scan on Bookings_user_id, hash aggregate
- Execution time: ~180ms
✅ Result: ~79% performance gain


If you'd like, I can help you build a full diagnostics log script to automate this process for any slow-running queries. Just say the word and we’ll make your DB engine hum like a race car. 🏎️💨



