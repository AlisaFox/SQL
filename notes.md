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
We can also use NOT IN, and have multiple attributes 
``` SQL
WHERE (a1, a2) IN (SELECT a3, a4....)
```

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
- ``` SQL
   SELECT COUNT (DISTINCT attr)
   FROM list
  ``` 
  - counts the number of different attribute values
- result is a relation with only one tuple
- can also use SUM, AVG, MAX, MIN besides COUNT 
- can combine like 
  - ``` SQL
    SELECT AVG(attr1), COUNT(*) ....
    ``` 
  - to give a two tuple result
#### Grouping
GROUP BY allows to apply aggrigation to several groups of tuples 
``` SQL
    SELECT AVG(attr1), MIN (attr2)
    FROM list
    GROUP BY attr3
``` 
resulting table will have multiple rows, one for each of attr3. More specifically, a group is defined as a set of tuples that have the same value for all attributes in the grouping list. Can add attr3 to the SELECT, and add an ORDER BY under the GROUP BY to make things more orginized.

For proper aggregation, we must either use group by or nested queries. 
However, aggregate operations cannot be nested.

#### Selections of groups (Having)
HAVING are for selections on groups, while WHERE are for selections on tuples
- example: For each rating, find minimum age of the skaters with this rating. Only consider rating levels with at least two skaters
- ```SQL 
  SELECT rating, MIN(age)
  FROM Skaters
  GROUP BY rating
  HAVING COUNT(*) >=2
  ```
#### Views
A view is an unmaterialized relation, we store just the definition instead of a set of tuples
``` SQL
CREATE VIEW ActiveSkaters(sid,sname)
AS SELECT DISTINCT S.sid, S.sname
FROM  Skaters S, Participates P
WHERE S.sid= P.sid
```
Sort of like abstraction: presents a summary while hiding details in underlying relations (ex. age of Skaters).
We can then put ActiveSkaters into a new relation (so `FROM Active Skaters WHERE sid = ....`). We can delete views via DROP VIEW command.
#### NULLs
can check if values are NULL by using the comparison operator IS NULL. When we are doing operand operations, like 0 * NULL, the result is always NULL. For logic a bit dif, usual rules apply (ex. A or NULL is True, not NULL)

#### More on JOIN
four types: (INNER) JOIN, _ OUTER JOIN
##### Inner Join 
This one is default, if no match in the other relation, no output
##### Outer Join 
LEFT OUTER JOIN: no match in other selection, one dummy record (on right side)
RIGHT OUTER JOIN: no match in other selection, one dummy record (on left side)
FULL OUTER JOIN: no match in other selection, one dummy record (on both sides)

## Final Notes
- SQL is not Turing complete. 
- DB modifications: Can modify tuples via INSERT INTO / DELETE FROM / UPDATE + SET
- SQL2 semantics: all conditions in a modification statement must be evaluated by  the system BEFOREany modifications occur.

  
