USE DBMS;

SELECT
	[Преподаватель]							= FORMATMESSAGE('%s %s %s',last_name, first_name, middle_name),
	[Количество занятий в расписании]		= COUNT(Schedule.teacher),
	[Количество проведённых занятий]		= SUM(CASE WHEN Schedule.spent = 1 THEN 1 ELSE 0 END),
	[Количество запланированных занятий]	= SUM(CASE WHEN Schedule.spent = 0 THEN 1 ELSE 0 END)
FROM 
	Schedule,Teachers
WHERE
	Schedule.teacher = Teachers.teacher_id
AND
	[date] BETWEEN '2023-12-01' AND '2023-12-31'
GROUP BY
	Teachers.last_name, Teachers.first_name, Teachers.middle_name;
