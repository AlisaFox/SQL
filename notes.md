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
## Basics
#### Selection notes (WHERE)
- in form `attribute1 op const` or `attribute1 op attribute2`, where op is one of <, >, =, <>, <=, >=, LIKE
  - LIKE is for string operations, ex. `name LIKE '%e_g'`
  - where %: any string, \_: any character
  - "%y" for all names that end in Y," \_i%" for all names with i as the second letter
- can combine multiple comparisons via AND, OR, NOT 
#### Projection notes (SELECT)
- `SELECT DISTINCT` for duplicate elimination
- `SELECT *` for a list of all attributes
- can rename expressions and constants
  - ``` SQL
     SELECT attribute1, attribute2 AS newAttributeName2,
                        attrbute2+1 AS newAttribute3,
                        constant AS newAttribute4
    ```
- can also order output
 - ``` SQL
    SELECT *
    FROM list 
    ORDER BY attr1, attr2
   ```
 - would produce an ascending list first by attr1, then by attr2
 #### Cross-product
 need to list relations in the `FROM` clause, such as `FROM list1, list2`
 #### Join
 equals cross-product and selection
 ``` SQL
   SELECT smth
   FROM list1 JOIN list2
   ON list1.attr = list2.attr
   ```
 is same thing as &Pi;<sub>smth</sub>  (list1 &bowtie; list2) 
#### Variable naming
Range Variables: can also use variable names in `FROM list1 A, list2 B` for shortform `A.attr` everywhere else
#### Union, Intersection, Difference
- UNION, INTERSECT, EXCEPT
- must have same number of attributes, and when ordered same attribute type 
- result is a set (not multiset)
  - A multiset(bag) may contain the same tuple more than once, although there is no specified order (unlike a list). 
  - Example: {1, 2, 1, 3} is a multiset, but not a set
- ``` SQL
  SELECT desired attributes
  FROM list of relations
  WHERE qualification
  UNION
  SELECT desired attributes
  FROM list of relations
  WHERE qualification
  ```
- to enforce multiset semantic, use UNION ALL, INTERSECT ALL, EXCEPT ALL

#### Nested Queries (IN)
a clause can have a clause inside of it, called a subquery
``` SQL
    WHERE  attr IN (SELECT attr 
                 FROM list 
                 WHERE attr2 = smth)
```
We can also use NOT IN, and have multiple attributes ```SQL WHERE (a1, a2) IN (SELECT a3, a4....)```

#### Exists
EXISTS (relation) is true iff the relation is non-empty
(used next to WHERE, ie `WHERE EXISTS`)

#### Quantifiers 
ANY for existential &exist; and ALL for universal &forall;, the syntax is `WHERE attr op ANY (SELECT...`

## A bit more complicated stuff
#### Aggregation
Ane extension of relational algebra
- ```SQL
   SELECT COUNT(*)
   FROM list
  ```
  - counts the number of tuples in list
-```SQL
   SELECT COUNT (DISTINCT attr)
   FROM list
  ``` 
  - counts the number of different attribute values
- result is a relation with only one tuple
- can also use SUM, AVG, MAX, MIN besides COUNT 
- can combine like ```SQL SELECT AVG(attr1), COUNT(*) ....``` to give a two tuple result
  
