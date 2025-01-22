use db_course_conversions;

select * from student_info;
select * from student_engagement;
select * from student_purchases;

-- Create the Subquery

SELECT 
    e.student_id,
    i.date_registered,
    MIN(date_watched) AS first_date_watched,
    MIN(date_purchased) AS first_date_purchased,
    DATEDIFF(MIN(e.date_watched), i.date_registered) AS days_diff_reg_watch,
    DATEDIFF(MIN(p.date_purchased), MIN(e.date_watched)) AS days_diff_watch_purch
FROM
    student_engagement e
        JOIN
    student_info i ON e.student_id = i.student_id
    
    -- Ensures students without purchases are still included.
    
        left JOIN
    student_purchases p ON p.student_id = e.student_id
    group by e.student_id 
    having first_date_purchased > first_date_watched 
    order by date_registered;
  
-- Create the main query


SELECT 
    ROUND(COUNT(a.days_diff_watch_purch) / COUNT(a.days_diff_reg_watch), 2) AS conversion_rate,
    ROUND(SUM(a.days_diff_reg_watch) / COUNT(a.days_diff_reg_watch), 2) AS av_reg_watch,
    -- ensure to including the students never made the purcahse bafter first egagement, use ifnull()
    ROUND(SUM(IFNULL(a.days_diff_watch_purch, 0)) / COUNT(a.days_diff_watch_purch), 2) AS av_watch_purch
FROM
    (
        SELECT 
   e.student_id,
            i.date_registered,
            MIN(e.date_watched) AS first_date_watched,
            MIN(p.date_purchased) AS first_date_purchased,
            DATEDIFF(MIN(e.date_watched), i.date_registered) AS days_diff_reg_watch,
            DATEDIFF(MIN(p.date_purchased), MIN(e.date_watched)) AS days_diff_watch_purch
FROM
    student_engagement e
        JOIN
    student_info i ON e.student_id = i.student_id
        left JOIN
    student_purchases p ON p.student_id = e.student_id
    group by e.student_id 
    -- by useing IS NULL students who never made a purchase are included in the final resul
    HAVING (first_date_purchased IS NULL OR first_date_purchased > first_date_watched)
    ) a;
    
    
    -- using CTEs to achieve the same results
    WITH first_dates AS (
    SELECT 
        e.student_id,
        i.date_registered,
        MIN(e.date_watched) AS first_date_watched,
        MIN(p.date_purchased) AS first_date_purchased
    FROM student_engagement e
    JOIN student_info i ON e.student_id = i.student_id
    LEFT JOIN student_purchases p ON p.student_id = e.student_id
    GROUP BY e.student_id
    HAVING (first_date_purchased IS NULL OR first_date_purchased > first_date_watched)
)

SELECT 
    ROUND(COUNT(fd.first_date_purchased) / COUNT(fd.first_date_watched), 2) AS conversion_rate,
    ROUND(AVG(DATEDIFF(fd.first_date_watched, fd.date_registered)), 2) AS av_reg_watch,
    ROUND(AVG(IFNULL(DATEDIFF(fd.first_date_purchased, fd.first_date_watched), 0)), 2) AS av_watch_purch
FROM first_dates fd;



