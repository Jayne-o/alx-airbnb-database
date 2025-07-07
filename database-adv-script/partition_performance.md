EXPLAIN ANALYZE
SELECT * FROM Bookings
WHERE start_date BETWEEN '2025-06-01' AND '2025-06-30';

 Sample Report: Performance Comparison
Before Partitioning:
- Full table scan (100 rows)
- Execution time: ~90ms
After Partitioning:
- Partition pruning reduced scan to 5 rows
- Execution time: ~5ms
Conclusion:
Partitioning by start_date significantly reduced I/O and improved query speed for date-specific lookups by over 85%.



