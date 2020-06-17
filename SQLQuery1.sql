SELECT
	Name
FROM Grade;

SELECT
	Name
FROM Emotion

SELECT 
	COUNT(Id)
FROM Poem;

-- Ex 4
SELECT TOP 76
	Name
FROM Author
ORDER BY (Name)

--Starting with the above query, add the grade of each of the authors.
SELECT TOP 76
	author.Name,
	grade.Name AS Grade
FROM Author author
JOIN Grade grade ON Author.GradeId = grade.Id
ORDER BY (Name)

--Starting with the above query, add the recorded gender of each of the authors.
SELECT TOP 76
	author.Name,
	grade.Name AS Grade,
	gender.Name
FROM Author author
JOIN Grade grade ON author.GradeId = grade.Id
JOIN Gender gender ON author.GenderId = gender.Id
ORDER BY (author.Name)

--What is the total number of words in all poems in the database?
SELECT
	SUM(WordCount) AS TotalWordCount
FROM Poem

--Which poem has the fewest characters?
SELECT 
	Title
FROM Poem
WHERE CharCount = (
	SELECT
		MIN(CharCount)
	FROM Poem
)

--How many authors are in the third grade?
SELECT 
	COUNT(grade.Name)
FROM Grade grade
JOIN Author author ON author.GradeId = grade.Id
WHERE grade.Name = '3rd Grade'

--How many authors are in the first, second or third grades?
SELECT 
	COUNT(grade.Name) AS '1st/2nd/3rd authors'
FROM Grade grade
JOIN Author author ON author.GradeId = grade.Id
WHERE grade.Name IN ('1st Grade', '2nd Grade', '3rd Grade')

--What is the total number of poems written by fourth graders?
SELECT
	COUNT(poem.Id) AS FourthGradePoems
FROM Poem poem
JOIN Author author ON poem.AuthorId = author.Id
JOIN Grade grade ON author.GradeId = grade.Id
WHERE grade.Name = '4th Grade'

--How many poems are there per grade?
SELECT
	grade.Name,
	COUNT(poem.Title)
FROM Grade grade
JOIN Author author ON grade.Id = author.GradeId
JOIN Poem poem ON author.Id = poem.AuthorId
GROUP BY grade.Name

--How many authors are in each grade? (Order your results by grade starting with 1st Grade)
SELECT
	grade.Name,
	COUNT(author.Id) AS 'Count'
FROM Grade grade
JOIN Author author ON grade.Id = author.GradeId
GROUP BY grade.Name, grade.Id
ORDER BY grade.Id ASC;