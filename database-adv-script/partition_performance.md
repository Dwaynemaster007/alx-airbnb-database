# Partitioning Performance Report

### **Objective**

To implement table partitioning on the `bookings` table to improve the performance of date-range queries.

### **Methodology**

1.  The `bookings` table was partitioned using `RANGE` partitioning on the `start_date` column, with partitions created for each year (`p2023`, `p2024`, etc.).
2.  A test query was designed to retrieve bookings within a specific date range.
3.  The `EXPLAIN ANALYZE` command was used to measure and compare the performance of the test query on both an unpartitioned table (simulated) and the new partitioned table.

### **Performance Improvements**

| Query                                          | Execution Plan (Unpartitioned) | Execution Plan (Partitioned)               |
| ---------------------------------------------- | ------------------------------ | ------------------------------------------ |
| `SELECT * FROM bookings WHERE start_date...` | Full Table Scan                | Partition Pruning (Scans only one partition) |
| **Observation** | High I/O, long execution time  | Low I/O, significantly faster              |

**Analysis:**

* **Before Partitioning:** The database had to perform a **full table scan** on the entire `bookings` table to find the rows that matched the date range. This is highly inefficient as the table grows, as it requires reading a large amount of unnecessary data from disk.
* **After Partitioning:** The database engine was able to use **partition pruning**. When a query specifies a date range, the engine can immediately determine which partition(s) contain the data and **only scan those partitions**, ignoring all others. This drastically reduces the number of rows to be examined, leading to a significant improvement in query execution time.

### **Conclusion**

Table partitioning is an effective strategy for optimizing queries on large tables, especially when the queries are based on a column with a clear range, such as a date. It improves performance by converting a resource-intensive full table scan into a targeted search on a much smaller subset of the data.
