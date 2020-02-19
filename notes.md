# Notes for SQL

## an example of a query: 
``` SQL
SELECT desired attributes
FROM list of relations
WHERE qualification
(where clause is optional)
```

when converting from relational algebra, 
 - start w/ relation in the from clause
 - apply selection &sigma; (where)
 - apply projection &Pi; (select)
 
 differences between SQL and relational algebra
 - no elimination of duplicates in SQL
 - tables in relational databases are generally NO sets (but "multisets")
 - results of SQL queries are generally NO sets

#### Selection notes (WHERE)
- in form `attribute1 op const` or `attribute1 op attribute2`, where op is one of <, >, =, <>, <=, >=, LIKE
  - LIKE is for string operations, ex. `name LIKE '%e_g'`
  - where %: any string, \_: any character
  - '%y" for all names that end in Y, '\_i%'for all names with i as the second letter
#### Projection notes (SELECT)
- SELECT DISTINCT for duplicate elimination
- SELECT * for a list of all attributes
- can rename expressions and constants
  - ``` SQL
     SELECT attribute1, attribute2 AS newAttributeName2,
                        attrbute2+1 AS newAttribute3,
                        constant AS newAttribute4
    ```
  
- can combine multiple comparisons via AND, OR, NOT 
