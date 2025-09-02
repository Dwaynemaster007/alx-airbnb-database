# Indexing for Performance Optimization

### Analysis of Query Performance

This document details the performance improvements achieved by adding indexes to key columns. We used the `EXPLAIN` command to analyze the query execution plan before and after creating the indexes.

---

### **Before Indexing**

**Sample Query:**
```sql
EXPLAIN SELECT p.name, r.rating FROM properties AS p JOIN reviews AS r ON p.id = r.property_id WHERE r.rating > 4;
