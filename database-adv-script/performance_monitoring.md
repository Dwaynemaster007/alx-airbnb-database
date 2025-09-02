# Database Performance Monitoring and Refinement Report

### **Objective**

To monitor the performance of frequently used queries, identify bottlenecks, and refine the database schema for improved efficiency.

### **Methodology**

1.  A sample frequently-used query was selected for analysis.
2.  The `EXPLAIN ANALYZE` command was used to inspect its initial execution plan and identify areas of inefficiency, such as full table scans.
3.  A schema refinement (adding a new index) was proposed and implemented to address the bottleneck.
4.  The query was re-analyzed using `EXPLAIN ANALYZE` to confirm and document the performance improvement.

---

### **Initial Query Analysis**

**Sample Query:** Find the top 5 most-reviewed properties in a specific city.

```sql
SELECT
    p.name,
    p.city,
    COUNT(r.id) AS review_count
FROM
    properties AS p
JOIN
    reviews AS r ON p.id = r.property_id
WHERE
    p.city = 'New York'
GROUP BY
    p.id
ORDER BY
    review_count DESC
LIMIT 5;
