-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: elearning
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.27-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping events for database 'elearning'
--

--
-- Dumping routines for database 'elearning'
--
/*!50003 DROP FUNCTION IF EXISTS `fn_get_countCourseGroups_by_courseTypesId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `fn_get_countCourseGroups_by_courseTypesId`(in_courseTypesId bigint
 
) RETURNS int(11)
BEGIN
	return (
     select ifnull(count(id),0) from courseGroups
        where     courseGroups.courseTypesId =      in_courseTypesId        
        and status = 1
    );

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_get_count_correctQuestions_by_exercisesId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `fn_get_count_correctQuestions_by_exercisesId`(in_exercisesId bigint,
   in_usersId bigint
) RETURNS int(11)
BEGIN

	return (
		select    countQuestions - ifnull(countNotCorrectQuestions,0) as countNotCorrectQuestions  from   exercises
				left join 
				   (select    exercisesId,
						ifnull(count(distinct questions.id),0) as countNotCorrectQuestions
							from questions
								 
									inner join questionSuggestions on questionSuggestions.questionsId = questions.id
									left join doQuestions on doQuestions.questionSuggestionsId = questionSuggestions.id and doQuestions.usersId = in_usersId
													
							   where  questions.exercisesId = in_exercisesId
								  and (
														   (questionSuggestions.correctAnswer = 1 and isnull(doQuestions.id) )
														  or (questionSuggestions.correctAnswer = 0 and doQuestions.id >0)
														 )
								 group by exercisesId
								
				)t on t.exercisesId = exercises.id
				where exercises.id = in_exercisesId
						
     );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_get_courseGroups_detail` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `fn_get_courseGroups_detail`(in_courseGroupsId bigint
 
) RETURNS longtext CHARSET utf8mb4 COLLATE utf8mb4_bin
BEGIN
	return (
     select json_object("totalVideoLength",totalVideoLength,"countCourses",countCourses,"countExercises",countExercises
     ) 
     as detailInfo
     from (
    select sum(totalVideoLength)  as totalVideoLength,
			sum(countCourses)  as countCourses,
            sum(countExercises)  as countExercises
	from 
     (select courseLevels.id,
         ifnull(sum(videoLength),0) as totalVideoLength,
            countCourses as countCourses,
            countExercises as countExercises
        from  courseLevels
			left join courses on courseLevels.id = courses.courseLevelsId
									
		
									and    courses.status = 1
		   where  courseLevels.status = 1
									and courseLevels.courseGroupsId =      in_courseGroupsId
			group by courseLevels.id
          
       )t 
       )t2
    );

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_get_courseGroups_users_detail` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `fn_get_courseGroups_users_detail`(in_courseGroupsId bigint,
in_usersId bigint
 
) RETURNS longtext CHARSET utf8mb4 COLLATE utf8mb4_bin
BEGIN
	return (
     select json_object("countCompleteCourses",countCompleteCourses
     ) 
     as detailInfo
     from 
     
     (select 
            ifnull(count(courses.id),0) as countCompleteCourses
        from  courseLevels
			left join( courses
             inner join usersCourseHistories on usersCourseHistories.coursesId = courses.id and usersCourseHistories.usersId = in_usersId
																						    and usersCourseHistories.status = 1
            ) on courseLevels.id = courses.courseLevelsId
									
									and    courses.status = 1
		     
		    where  courseLevels.status = 1
									and courseLevels.courseGroupsId =      in_courseGroupsId  
			group by courseGroupsId
           
       )t 
    );

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_get_courseLevels_detail` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `fn_get_courseLevels_detail`(in_courseLevelsId bigint
 
) RETURNS longtext CHARSET utf8mb4 COLLATE utf8mb4_bin
BEGIN
	return (
     select json_object("totalVideoLength",totalVideoLength,"countCourses",countCourses,
       "countQuestions" ,countQuestions,
       "countExercises",countExercises
     ) 
     as detailInfo
     from (
			 select courseLevels.id,  ifnull(sum(exercises.countQuestions),0) as countQuestions,countCourses,totalVideoLength,countExercises
                    from 
                       (
						select courseLevels.id, ifnull(sum(videoLength),0) as totalVideoLength,
                         countCourses as countCourses,
                         countExercises as countExercises
                        from courseLevels
                        left join  courses on courses.courseLevelsId = courseLevels.id
                        	and courses.status = 1
                        where     courseLevels.id =      in_courseLevelsId    
					
                        group by courseLevels.id
                       )
						courseLevels
						left join exercises on exercises.courseLevelsId = courseLevels.id
					
						
        )t
    );

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_get_courseLevels_users_detail` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `fn_get_courseLevels_users_detail`(in_courseLevelsId bigint,
   in_usersId bigint
) RETURNS longtext CHARSET utf8mb4 COLLATE utf8mb4_bin
BEGIN
	return (
     select json_object("countCompleteCourses",countCompleteCourses,
       "countNotCorrectQuestions",countNotCorrectQuestions
     ) 
     as usersDetailInfo
     from (
			 select courseLevels.id,  
              
            ifnull(count(distinct questions.id),0) as countNotCorrectQuestions,
             countCompleteCourses
                    from 
                       (
						select courseLevels.id, 
                         ifnull(count(courses.id),0) as countCompleteCourses
                        from courseLevels
                        left join  (
						  courses
                          inner join usersCourseHistories on usersCourseHistories.coursesId = courses.id and usersCourseHistories.usersId = in_usersId
                        ) on courses.courseLevelsId = courseLevels.id
                        where     courses.courseLevelsId =      in_courseLevelsId    
						and courses.status = 1
                        group by courseLevels.id
                       )
						courseLevels
						left join 
                        (exercises
                             inner join questions on questions.exercisesId = exercises.id 
						   inner join questionSuggestions on questionSuggestions.questionsId = questions.id
						 	left join doQuestions on doQuestions.questionSuggestionsId = questionSuggestions.id and doQuestions.usersId = in_usersId
                        ) 
                        
                         on exercises.courseLevelsId = courseLevels.id
				         where (
                               (questionSuggestions.correctAnswer = 1 and isnull(doQuestions.id) )
                              or (questionSuggestions.correctAnswer = 0 and doQuestions.id >0)
					         )
                         group by courseLevels.id
					
						
        )t
    );

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_get_exercises_users_detail` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `fn_get_exercises_users_detail`(in_exercisesId bigint,
   in_usersId bigint
) RETURNS longtext CHARSET utf8mb4 COLLATE utf8mb4_bin
BEGIN
	return (
     select json_object(
       "countCompleteQuestions" ,countQuestions - countNotCorrectQuestions,
       "countNotCorrectQuestions",countNotCorrectQuestions
     ) 
     as usersDetailInfo
     from (
			 select    countQuestions,ifnull(countNotCorrectQuestions,0) as countNotCorrectQuestions  from   exercises
				left join 
				   (select    exercisesId,
						ifnull(count(distinct questions.id),0) as countNotCorrectQuestions
							from questions
								 
									inner join questionSuggestions on questionSuggestions.questionsId = questions.id
									left join doQuestions on doQuestions.questionSuggestionsId = questionSuggestions.id and doQuestions.usersId = in_usersId
													
							   where  questions.exercisesId = in_exercisesId
								  and (
														   (questionSuggestions.correctAnswer = 1 and isnull(doQuestions.id) )
														  or (questionSuggestions.correctAnswer = 0 and doQuestions.id >0)
														 )
								 group by exercisesId
								
				)t on t.exercisesId = exercises.id
				where exercises.id = in_exercisesId
						
        )t
    );

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_get_previous_courses` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `fn_get_previous_courses`(in_coursesId bigint
) RETURNS longtext CHARSET utf8mb4 COLLATE utf8mb4_bin
BEGIN 
   declare  currentCourseGroupsId,current_courseLevelsId,current_courseLevelsOrder, current_order int(11);
   
   select courseLevels.courseGroupsId, courseLevels.`order`,courseLevelsId,courses.`order`
	into currentCourseGroupsId,current_courseLevelsOrder, current_courseLevelsId,current_order
   from courses as courses
   inner join courseLevels on courseLevels.id = courses.courseLevelsId
   where courses.id =  in_coursesId ;
   
      if(exists
			 (
             select * from   courses 
				 where courseLevelsId =current_courseLevelsId
				 and courses.status = 1
				 and `order` < current_order
				 order by `order` asc 
				 limit 1
			)
	) then
		return (
		 select json_object(
		   "id" ,courses.id,
			"coursesName" ,courses.coursesName,
			"videoLength" ,courses.videoLength,
			"link" ,courses.link
		 ) 
		 as previousCourses
		 from courses 
		 where courseLevelsId =current_courseLevelsId
		 and `order` < current_order
		 and courses.status = 1
		 order by `order` desc 
		 limit 1
		);
    else    
	return (
				 select json_object(
				   "id" ,courses.id,
					"coursesName" ,courses.coursesName,
					"videoLength" ,courses.videoLength,
					"link" ,courses.link
				 ) 
				 as nextCourses
				 from courses 
				 inner join courseLevels on courseLevels.id = courses.courseLevelsId
										and courseLevels.courseGroupsId = currentCourseGroupsId
										and courseLevels.`order` < current_courseLevelsOrder
				  where                      
				  courses.status = 1
				 order by courseLevels.`order` desc , courses.`order` desc 
				 limit 1
		  );
	  end if;
      
      
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_get__exercises_users_detail` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `fn_get__exercises_users_detail`(in_courseLevelsId bigint,
   in_usersId bigint
) RETURNS longtext CHARSET utf8mb4 COLLATE utf8mb4_bin
BEGIN
	return (
     select json_object(
       "countCompleteQuestions" ,countCompleteQuestions,
       "countCorrectQuestions",countCorrectQuestions
     ) 
     as usersDetailInfo
     from (
			 select courseLevels.id,  
              
              ifnull(sum(case when questionSuggestions.correctAnswer = 1 then 1 else 0 end),0) as countCorrectQuestions,
              ifnull(count( doQuestions.id),0) as countCompleteQuestions
                    from doQuestions
                            inner join questions on questions.id  = doQuestions.doQuestionsId
													and questions.exercisesId = in_exercisesId
                            inner join questionSuggestions on doQuestions.questionSuggestionsId = questionSuggestions.id
                         
					
						
        )t
    );

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `generate_time_list` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `generate_time_list`(
	in in_start time,
	in in_end time
)
BEGIN
	
    DROP TEMPORARY TABLE IF EXISTS temp_generate_time_list;
	CREATE TEMPORARY TABLE temp_generate_time_list(in_time time);
	
	
	WHILE (in_start <= in_end) DO
		insert into temp_generate_time_list(in_time)
        values(in_start);
		SET in_start = ADDTIME(in_start,'00:10:00');
	END WHILE; 
    
    select * from temp_generate_time_list;
    DROP TEMPORARY TABLE IF EXISTS temp_generate_time_list;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_courseGroups_get_top` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_courseGroups_get_top`(
  in in_FromDate datetime,
	in in_ToDate datetime,

	in in_orderBy int ,  -- 1  theo doanh thu, 2 theo số lượng
  in in_start_page int,
  in in_end_page int
)
BEGIN



    if(in_orderBy =1) then
		SELECT
		    courseGroups.id,courseGroupsName,courseGroupsCode,
        ifnull(sum(purchasedCourseGroups.purchasedCourseGroupsMoney) ,0) as totalSales
          
		FROM
			`courseGroups` AS `courseGroups`
			inner JOIN
			 `purchasedCourseGroups` AS `purchasedCourseGroups`
               ON`purchasedCourseGroups`.`courseGroupsId` = `courseGroups`.`id`
               and `purchasedCourseGroups`.`status` = 1
                 and  ( purchasedCourseGroups.dateCreated >= in_FromDate )
			         and (  purchasedCourseGroups.dateCreated  < in_ToDate + INTERVAL 1 DAY )
		where courseGroups.status = 1

		  group by courseGroups.id
		 order by     sum(purchasedCourseGroups.money)  desc
		  limit in_start_page,in_end_page;

    elseif(in_orderBy =2) then
    	SELECT
		    courseGroups.id,courseGroupsName,courseGroupsCode,
     ifnull(sum(purchasedCourseGroups.purchasedCourseGroupsMoney) ,0) as totalSales
          
		FROM
			`courseGroups` AS `courseGroups`
			inner JOIN
			 `purchasedCourseGroups` AS `purchasedCourseGroups`
               ON`purchasedCourseGroups`.`courseGroupsId` = `courseGroups`.`id`
               and `purchasedCourseGroups`.`status` = 1
                 and  ( purchasedCourseGroups.dateCreated >= in_FromDate )
			         and (  purchasedCourseGroups.dateCreated  < in_ToDate + INTERVAL 1 DAY )

	where courseGroups.status = 1
		  group by courseGroups.id
          order by   count(purchasedCourseGroups.id)   desc
		   limit in_start_page,in_end_page;
        end if;


	select count(*) as count from
        (
        SELECT
		    courseGroups.id
		FROM
				`courseGroups` AS `courseGroups`

			inner JOIN
			 `purchasedCourseGroups` AS `purchasedCourseGroups`
               ON`purchasedCourseGroups`.`courseGroupsId` = `courseGroups`.`id`
               and `purchasedCourseGroups`.`status` = 1
			   and  ( purchasedCourseGroups.dateCreated >= in_FromDate )
			         and (  purchasedCourseGroups.dateCreated  < in_ToDate + INTERVAL 1 DAY )
		   	where courseGroups.status = 1
		    group by courseGroups.id
        )t;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_courseGroups_get_ty_le_hoan_thanh` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_courseGroups_get_ty_le_hoan_thanh`(

  in in_start_page int,
  in in_end_page int
)
BEGIN

    DROP TEMPORARY TABLE IF EXISTS temp_list_courseGroups;
    CREATE TEMPORARY TABLE temp_list_courseGroups(
	 	SELECT 
					courseGroups.*,
					sum(courseLevels.countCourses) AS countCourses
				FROM
					(SELECT 
						courseGroups.id, courseGroupsName, courseGroupsCode,countUsers
					FROM
						`courseGroups`
						 where courseGroups.countUsers > 0   

						   order by  countUsers desc
					       limit in_start_page,in_end_page
					) `courseGroups`
						left JOIN
					courseLevels ON courseLevels.courseGroupsId = courseGroups.id
						AND courseLevels.status = 1
				GROUP BY courseGroups.id 
    );

    DROP TEMPORARY TABLE IF EXISTS temp_list_purchased;
    CREATE TEMPORARY TABLE temp_list_purchased(
     select id,usersId,courseGroupsId from usersCourseGroups
     where usersCourseGroups.courseGroupsId in (select id from temp_list_courseGroups)
		
    );
    

	DROP TEMPORARY TABLE IF EXISTS temp_list_tien_do_xem_video;
    CREATE TEMPORARY TABLE temp_list_tien_do_xem_video(
     select 
           temp_list_purchased.courseGroupsId, temp_list_purchased.usersId,
            ifnull(count(usersCourseHistories.id),0) as countCompleteCourses
        from  temp_list_purchased
             
             
			inner JOIN
					courseLevels ON courseLevels.courseGroupsId = temp_list_purchased.courseGroupsId and courseLevels.status =  1
			inner JOIN
					courses ON courses.courseLevelsId = courseLevels.Id and courses.status =  1
			inner join usersCourseHistories on usersCourseHistories.usersId = temp_list_purchased.usersId  
																		and usersCourseHistories.coursesId = courses.id
																     	and usersCourseHistories.status = 1
			group by temp_list_purchased.courseGroupsId, temp_list_purchased.usersId
    );
    


   



	select temp_list_courseGroups.id,temp_list_courseGroups.courseGroupsName ,countUsers,
           count(temp_list_tien_do_xem_video.usersId) as 'so_hoc_vien_xem_het_bai_giang'
     from   temp_list_courseGroups 
	   left join temp_list_tien_do_xem_video on temp_list_tien_do_xem_video.courseGroupsId = temp_list_courseGroups.id
		and temp_list_courseGroups.countCourses=  temp_list_tien_do_xem_video.countCompleteCourses
        group by temp_list_courseGroups.id
		
        ;
            
            
	select count(*) as count from
        (
        SELECT
		    courseGroups.id
		FROM
				`courseGroups` AS `courseGroups`

		where courseGroups.countUsers > 0
		   order by countUsers desc
        )t;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_course_get_top` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_course_get_top`(
	in in_FromDate varchar(200),
	in in_ToDate varchar(200),
	in in_orderBy varchar(45) ,
	in in_start_page int,
	in in_end_page int
)
BEGIN
        DECLARE sqlWhere  varchar(20000) COLLATE utf8mb3_unicode_ci;
	   SET @sql0 = concat('
			SELECT  count(purchasedCourseGroups.courseGroupsPackagesId) as countCourse , 
            sum(purchasedCourseGroups.purchasedCourseGroupsMoney) as sumMoneyCourse , 
            courseGroupsPackages.courseGroupsPackagesName, purchasedCourseGroups.id FROM purchasedCourseGroups
				inner join courseGroupsPackages on courseGroupsPackages.id = purchasedCourseGroups.courseGroupsPackagesId 
				and purchasedCourseGroups.status = 1 and courseGroupsPackages.status = 1 ',
                if(in_FromDate  <>  '' , concat(' and purchasedCourseGroups.expiredDate >= "',in_FromDate,'" '),' '),
				if(in_ToDate  <>  '' , concat(' and purchasedCourseGroups.expiredDate <= "',in_ToDate,'" +  interval 1 day '),' ')
                ,'
				group by purchasedCourseGroups.courseGroupsPackagesId'
                                 
			);		
            set@sql1 = concat( @sql0,
                if(in_orderBy  =  '1' , ' order by countCourse desc ' ,' '),
                    if(in_orderBy  =  '2' , ' order by sumMoneyCourse desc ' ,' '),
                 ' limit ',in_start_page,in_end_page);
                 
            set@sql2 = concat(' select sum(course.sumMoneyCourse) as sum , sum(course.countCourse) as count from 
            (' , @sql0, ') as course');
	   --   select @sql0;
       
			PREPARE stmt1 FROM @sql1;
			EXECUTE stmt1;
            
	        PREPARE stmt2 FROM @sql2;
			EXECUTE stmt2;
            
            PREPARE stmt0 FROM @sql0;
			EXECUTE stmt0;
	
    
  





	

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_hoc_vien_moi` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_hoc_vien_moi`(
    in in_FromDate datetime,
	in in_ToDate datetime,
    in in_timeType int

)
BEGIN
    declare memberInProjects,memberInOffices bigint;
    declare start_date,end_date,start_date_week,end_date_week datetime;

    if(in_FromDate='1970-01-01') then set start_date = subdate(current_date(),30) ;
    else set start_date = in_FromDate;
    end if;

	if(in_ToDate='1970-01-01') then set end_date = current_date();
    else set end_date = in_ToDate;
    end if;


        DROP TEMPORARY TABLE IF EXISTS temp_user_moi ;

		CREATE TEMPORARY TABLE temp_user_moi
		(
    		SELECT
			date(dateCreated) as dateCreated,
               count(users.id) as count
			FROM
				  users

				where
                status = 1
                and users.userGroupsId = 2
				and   (users.dateCreated >= start_date )
				   and ( users.dateCreated <  end_date  + INTERVAL 1 DAY )
				   GROUP BY date(users.dateCreated)
       );


if(in_timeType = 1) then
    -- theo ngày
		DROP TEMPORARY TABLE IF EXISTS temp_time_ngay;
		CREATE TEMPORARY TABLE temp_time_ngay
		(
			 select    date(selectedDate) as date from  (
			  select adddate(start_date,t4*10000 + t3*1000 + t2*100 + t1*10 + t0) selectedDate from
				 (select 0 t0 union select 1 union select 2 union select 3 union select 4 union select 5 union select 6 union select 7 union select 8 union select 9) t0,
				 (select 0 t1 union select 1 union select 2 union select 3 union select 4 union select 5 union select 6 union select 7 union select 8 union select 9) t1,
				 (select 0 t2 union select 1 union select 2 union select 3 union select 4 union select 5 union select 6 union select 7 union select 8 union select 9) t2,
				 (select 0 t3 union select 1 union select 2 union select 3 union select 4 union select 5 union select 6 union select 7 union select 8 union select 9) t3,
				 (select 0 t4 union select 1 union select 2 union select 3 union select 4 union select 5 union select 6 union select 7 union select 8 union select 9) t4
			 ) v
			 where
				selectedDate >= start_date
				 and selectedDate <= end_date

		);


      select temp_time_ngay.date as date,
		       ifnull(temp_user_moi.count,0) as count
      from temp_time_ngay
        left join temp_user_moi on  temp_user_moi.dateCreated  = temp_time_ngay.date


      order by temp_time_ngay.date asc ;

		elseif(in_timeType = 2) then
        -- theo tháng
				DROP TEMPORARY TABLE IF EXISTS temp_time_thang;
				CREATE TEMPORARY TABLE temp_time_thang
				(
					select    `month` from  (
					  select 1 as `month` union all select 2 union all select 3 union all
					  select 4 union all select 5 union all select 6 union all select 7 union all
					  select 8 union all select 9 union all select 10 union all select 11 union all
					  select 12
					 ) v
				);

				DROP TEMPORARY TABLE IF EXISTS temp_time_nam;
				CREATE TEMPORARY TABLE temp_time_nam (
					years INT(11) NOT NULL,
					PRIMARY KEY (years)
				) AS
				(
					SELECT
					(1900 + HUNDREDS.val + TENS.val + ONES.val) AS `years`
					FROM
					( SELECT 0 val UNION ALL SELECT 1 val UNION ALL SELECT 2 val UNION ALL SELECT 3 val UNION ALL SELECT 4 val UNION ALL SELECT 5 val UNION ALL SELECT 6 val UNION ALL SELECT 7 val UNION ALL SELECT 8 val UNION ALL SELECT 9 val ) ONES
					CROSS JOIN
					( SELECT 0 val UNION ALL SELECT 10 val UNION ALL SELECT 20 val UNION ALL SELECT 30 val UNION ALL SELECT 40 val UNION ALL SELECT 50 val UNION ALL SELECT 60 val UNION ALL SELECT 70 val UNION ALL SELECT 80 val UNION ALL SELECT 90 val ) TENS
					CROSS JOIN
					( SELECT 0 val UNION ALL SELECT 100 val ) HUNDREDS
					where (1900 + HUNDREDS.val + TENS.val + ONES.val)  >= year(start_date)
					and  (1900 + HUNDREDS.val + TENS.val + ONES.val)  <= year(end_date)

				);


				DROP TEMPORARY TABLE IF EXISTS temp_time_nam_thang;
				CREATE TEMPORARY TABLE temp_time_nam_thang (
				   select *   from temp_time_thang,temp_time_nam
					where
							   ( year(end_date)  -   year(start_date) > 0 )
							   or
					 (   temp_time_thang.`month` >  month(start_date) - 1
						 and temp_time_thang.`month` <  month(end_date) + 1
						 )

						);


			  select     concat(temp_time_nam_thang.`month`,'/',temp_time_nam_thang.years ) as date,
							 temp_time_nam_thang.`month` as `month`,
							temp_time_nam_thang.years as `year`,

					ifnull(sum(temp_user_moi.count),0) as count


			  from temp_time_nam_thang
				 left join temp_user_moi on  month(temp_user_moi.dateCreated)  = temp_time_nam_thang.`month` and year(temp_user_moi.dateCreated) = temp_time_nam_thang.years
		  where  temp_time_nam_thang.`month` >  month(start_date) - 1
			 and temp_time_nam_thang.`month` <  month(end_date) + 1

			  group by  temp_time_nam_thang.years , temp_time_nam_thang.month
			  order by temp_time_nam_thang.years asc ,temp_time_nam_thang.`month` asc
      ;

	elseif(in_timeType = 3) then
    -- theo quý
        DROP TEMPORARY TABLE IF EXISTS temp_time_thang;
		CREATE TEMPORARY TABLE temp_time_thang
		(
			select    `month` from  (
			  select 1 as `month` union all select 2 union all select 3 union all
			  select 4 union all select 5 union all select 6 union all select 7 union all
			  select 8 union all select 9 union all select 10 union all select 11 union all
			  select 12
			 ) v
		);

	    DROP TEMPORARY TABLE IF EXISTS temp_time_nam;
		CREATE TEMPORARY TABLE temp_time_nam (
			years INT(11) NOT NULL,
			PRIMARY KEY (years)
		) AS
		(
			SELECT
			(1900 + HUNDREDS.val + TENS.val + ONES.val) AS `years`
			FROM
			( SELECT 0 val UNION ALL SELECT 1 val UNION ALL SELECT 2 val UNION ALL SELECT 3 val UNION ALL SELECT 4 val UNION ALL SELECT 5 val UNION ALL SELECT 6 val UNION ALL SELECT 7 val UNION ALL SELECT 8 val UNION ALL SELECT 9 val ) ONES
			CROSS JOIN
			( SELECT 0 val UNION ALL SELECT 10 val UNION ALL SELECT 20 val UNION ALL SELECT 30 val UNION ALL SELECT 40 val UNION ALL SELECT 50 val UNION ALL SELECT 60 val UNION ALL SELECT 70 val UNION ALL SELECT 80 val UNION ALL SELECT 90 val ) TENS
			CROSS JOIN
			( SELECT 0 val UNION ALL SELECT 100 val ) HUNDREDS
            where (1900 + HUNDREDS.val + TENS.val + ONES.val)  >= year(start_date)
            and  (1900 + HUNDREDS.val + TENS.val + ONES.val)  <= year(end_date)

		);


        DROP TEMPORARY TABLE IF EXISTS temp_time_nam_thang;
		CREATE TEMPORARY TABLE temp_time_nam_thang (
           select *   from temp_time_thang,temp_time_nam
            where
                       ( year(end_date)  -   year(start_date) > 0 )
                       or
			 (   temp_time_thang.`month` >  month(start_date) - 1
				 and temp_time_thang.`month` <  month(end_date) + 1
                 )

				);


	  select     concat( round((temp_time_nam_thang.month-2)/3,0)  + 1,'/',temp_time_nam_thang.years ) as date,
                    round((temp_time_nam_thang.month-2)/3,0)  + 1 as `quy`,
					temp_time_nam_thang.years as `year`,

		    ifnull(sum(temp_user_moi.count),0) as count


	from temp_time_nam_thang
         left join temp_user_moi on  month(temp_user_moi.dateCreated)  = temp_time_nam_thang.`month` and year(temp_user_moi.dateCreated) = temp_time_nam_thang.years
  where  temp_time_nam_thang.`month` >  month(start_date) - 1
      and temp_time_nam_thang.`month` <  month(end_date) + 1

      group by  temp_time_nam_thang.years , round((temp_time_nam_thang.month-2)/3,0)
      order by temp_time_nam_thang.years asc ,temp_time_nam_thang.`month` asc
      ;

   elseif(in_timeType = 4) then

			   DROP TEMPORARY TABLE IF EXISTS temp_time_nam;
				CREATE TEMPORARY TABLE temp_time_nam (
					years INT(11) NOT NULL,
					PRIMARY KEY (years)
				) AS
				(
					SELECT
					(1900 + HUNDREDS.val + TENS.val + ONES.val) AS `years`
					FROM
					( SELECT 0 val UNION ALL SELECT 1 val UNION ALL SELECT 2 val UNION ALL SELECT 3 val UNION ALL SELECT 4 val UNION ALL SELECT 5 val UNION ALL SELECT 6 val UNION ALL SELECT 7 val UNION ALL SELECT 8 val UNION ALL SELECT 9 val ) ONES
					CROSS JOIN
					( SELECT 0 val UNION ALL SELECT 10 val UNION ALL SELECT 20 val UNION ALL SELECT 30 val UNION ALL SELECT 40 val UNION ALL SELECT 50 val UNION ALL SELECT 60 val UNION ALL SELECT 70 val UNION ALL SELECT 80 val UNION ALL SELECT 90 val ) TENS
					CROSS JOIN
					( SELECT 0 val UNION ALL SELECT 100 val ) HUNDREDS
				where (1900 + HUNDREDS.val + TENS.val + ONES.val)  >= year(start_date)
					and  (1900 + HUNDREDS.val + TENS.val + ONES.val)  <= year(end_date)
				);


			  select
							temp_time_nam.years as `date`,

		     ifnull(sum(temp_user_moi.count),0) as count

			  from temp_time_nam
				 left join temp_user_moi on  year(temp_user_moi.dateCreated) = temp_time_nam.years


			  group by  temp_time_nam.years
			  order by temp_time_nam.years asc
			  ;

        end if;

	


        SELECT ifnull(sum(count),0) as count from temp_user_moi;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_notifications_get` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_notifications_get`(
    in in_usersId bigint,  -- 0 hoặc có id
	in in_title varchar(200) COLLATE utf8mb3_unicode_ci,
    in in_FromDate varchar(200),
    in in_ToDate varchar(200),
	in in_start_page bigint,
    in in_end_page bigint
)
BEGIN
    DECLARE start_page, end_page  INT DEFAULT 0;
      DECLARE sqlWhere varchar(2000) COLLATE utf8mb3_unicode_ci;


    
	set sqlWhere = concat(
		' ',
		if(
		  in_title <> '',
		  concat(
			'and (
						   lower(notifications.title) like  concat("%",CONVERT(lower("',
			in_title,
			'"), BINARY),"%") )
					 '
		  ),
		  ''
		),
       if(
		  in_usersId <> 0, concat('and (userTokenOfNotifications.usersId  in (',in_usersId,') )'),
		  ''
		),
	   if(
		  in_FromDate <> '',
		  concat(
			'and doSurveys.dateCreated >= "',
			in_FromDate,
			'" '
		  ),
		  ''
		),
		if(
		  in_ToDate <> '',
		  concat(
			'and doSurveys.dateCreated < "',
			in_ToDate,
			'"  + INTERVAL 1 DAY '
		  ),
		  ''
		),
		''
	  );
      
	  SET @sql1 = CONCAT(
	     '
          select * from (
            select notifications.*,
               FROM  notifications
				 WHERE 1',sqlWhere,
				 ' 

                 )doSurveys
                 order by notifications.id desc 
                 limit ',in_start_page,in_end_page,'
                 ;'
		  );

    
		PREPARE stmt1 FROM @sql1;
		EXECUTE stmt1;
    select @sql1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_notifications_get_list` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_notifications_get_list`(
    in in_usersId bigint,  -- 0 hoặc có id
    in in_sendAll int(11),  -- -99 hoặc có id
	in in_title varchar(200) COLLATE utf8mb3_unicode_ci,
	 in in_sendStatus int,
    in in_status int,
    in in_FromDate varchar(200),
    in in_ToDate varchar(200),
	in in_orderBy varchar(200),
    in in_order varchar(200),
	in in_start_page bigint,
    in in_end_page bigint
)
BEGIN
    DECLARE start_page, end_page  INT DEFAULT 0;
      DECLARE sqlWhere varchar(2000) COLLATE utf8mb3_unicode_ci;

-- call elearning.sp_notifications_get_list(1, -99,'',1, '2022-01-01', '2022-01-11','id','asc' ,0, 20);

      
    
	set sqlWhere = concat(
		' ',
		if(
		  in_status <> -99,
		  concat(' and (notifications.status =  ', in_status, ')'),
		  ''
		),
		if(
		  in_sendStatus <> -99,
		  concat(' and (notifications.sendStatus =  ', in_sendStatus, ')'),
		  ''
		),
		if(
		  in_title <> '',
		  concat(
			'and (
						   lower(notifications.title) like  concat("%",CONVERT(lower("',
			in_title,
			'"), BINARY),"%") )
					 '
		  ),
		  ''
		),
		if(
		  in_usersId <> 0 ,
		  concat(
			'and (usersNotifications.usersId = ',in_usersId,') '
		  ),
		  ''
		),
        if(
		  in_sendAll <> -99 ,
		  concat(
			'and notifications.sendAll = ',
			in_sendAll,
			' '
		  ),
		  ''
		),
        
	   if(
		  in_FromDate <> '',
		  concat(
			'and notifications.notificationTime >= "',
			in_FromDate,
			'" '
		  ),
		  ''
		),
		if(
		  in_ToDate <> '',
		  concat(
			'and notifications.notificationTime < "',
			in_ToDate,
			'"  + INTERVAL 1 DAY '
		  ),
		  ''
		),
		''
	  );
      
	  SET @sql1 = CONCAT(
	     '
         
            select notifications.* 
               FROM  notifications
                left join usersNotifications on usersNotifications.notificationsId = notifications.id
			
							
				 WHERE 1',sqlWhere,   
	
				 '   group by notifications.id
               
           
				 order by ',in_orderBy,' ',in_order,'
                 limit ',in_start_page,', ',in_end_page,'
                 ;'
		  );

 
		PREPARE stmt1 FROM @sql1;
		EXECUTE stmt1;
    
    
	SET @sql2 = CONCAT(
	     '
          select count(*) as count from (
            select notifications.* 
               FROM  notifications
               left join usersNotifications on usersNotifications.notificationsId = notifications.id
			   left join users on usersNotifications.usersId = users.id
							
				 WHERE 1',sqlWhere,   
				 '
                 group by notifications.id
                 )notifications
		
                 ;'
		  );
          
          PREPARE stmt2 FROM @sql2;
		EXECUTE stmt2;
        select @sql1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_service_get_top` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_service_get_top`(
	in in_FromDate varchar(200),
	in in_ToDate varchar(200),
	in in_orderBy varchar(45) ,
	in in_start_page int,
	in in_end_page int
)
BEGIN
        DECLARE sqlWhere  varchar(20000) COLLATE utf8mb3_unicode_ci;
	   SET @sql0 = concat('
			SELECT  sum(purchasedCourseGroupsDetails.money) as sumMoneyPurchased , 
            count(purchasedCourseGroupsDetails.servicesId) as countService , 
            services.servicesName, services.servicesCode FROM purchasedCourseGroupsDetails
				inner join services on services.id = purchasedCourseGroupsDetails.servicesId ',
					 '
                inner join purchasedCourseGroups on purchasedCourseGroups.id = purchasedCourseGroupsDetails.purchasedCourseGroupsId
				and purchasedCourseGroups.status = 1 ',
                if(in_FromDate  <>  '' , concat(' and purchasedCourseGroups.expiredDate >= "',in_FromDate,'" '),' '),
				if(in_ToDate  <>  '' , concat(' and purchasedCourseGroups.expiredDate <= "',in_ToDate,'" +  interval 1 day '),' ')
                
                ,'
				group by services.id '
                                 
			);		
            set@sql1 = concat( @sql0,
                if(in_orderBy  =  '1' , ' order by countService desc ' ,' '),
                    if(in_orderBy  =  '2' , ' order by sumMoneyPurchased desc ' ,' '),
                 ' limit ',in_start_page,in_end_page);
                 
            set@sql2 = concat(' select sum(service.sumMoneyPurchased) as sum , sum(service.countService) as count from 
            (' , @sql0, ') as service');
	   --   select @sql0;
       
			PREPARE stmt1 FROM @sql1;
			EXECUTE stmt1;
            
	        PREPARE stmt2 FROM @sql2;
			EXECUTE stmt2;
            
            PREPARE stmt0 FROM @sql0;
			EXECUTE stmt0;
	
    
  





	

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_statics_doanh_thu` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_statics_doanh_thu`(
    in in_FromDate datetime,
	in in_ToDate datetime,
    in in_timeType int 

)
BEGIN
    declare memberInProjects,memberInOffices bigint;
    declare start_date,end_date,start_date_week,end_date_week datetime;

    if(in_FromDate='1970-01-01') then set start_date = subdate(current_date(),30) ;
    else set start_date = in_FromDate;
    end if;

	if(in_ToDate='1970-01-01') then set end_date = current_date();
    else set end_date = in_ToDate;
    end if;
    
    
        DROP TEMPORARY TABLE IF EXISTS temp_ban_hang;
        
		CREATE TEMPORARY TABLE temp_ban_hang
		(
    		SELECT
			date(dateCreated) as dateCreated,
               sum(money) as totalSales
			FROM
				  purchasedCourseGroups
		   
				where
                status = 1
				and   (purchasedCourseGroups.dateCreated >= start_date )
				   and ( purchasedCourseGroups.dateCreated <  end_date  + INTERVAL 1 DAY )
				   GROUP BY date(purchasedCourseGroups.dateCreated)
       );
		   
           
	


	if(in_timeType = 1) then
    -- theo ngày
		DROP TEMPORARY TABLE IF EXISTS temp_time_ngay;
		CREATE TEMPORARY TABLE temp_time_ngay
		(
			 select    date(selectedDate) as date from  (
			  select adddate(start_date,t4*10000 + t3*1000 + t2*100 + t1*10 + t0) selectedDate from
				 (select 0 t0 union select 1 union select 2 union select 3 union select 4 union select 5 union select 6 union select 7 union select 8 union select 9) t0,
				 (select 0 t1 union select 1 union select 2 union select 3 union select 4 union select 5 union select 6 union select 7 union select 8 union select 9) t1,
				 (select 0 t2 union select 1 union select 2 union select 3 union select 4 union select 5 union select 6 union select 7 union select 8 union select 9) t2,
				 (select 0 t3 union select 1 union select 2 union select 3 union select 4 union select 5 union select 6 union select 7 union select 8 union select 9) t3,
				 (select 0 t4 union select 1 union select 2 union select 3 union select 4 union select 5 union select 6 union select 7 union select 8 union select 9) t4
			 ) v
			 where
				selectedDate >= start_date
				 and selectedDate <= end_date

		);


      select temp_time_ngay.date as date,
		       ifnull(temp_ban_hang.totalSales,0) as totalSales
      from temp_time_ngay
        left join temp_ban_hang on  temp_ban_hang.dateCreated  = temp_time_ngay.date


      order by temp_time_ngay.date asc ;
      
		elseif(in_timeType = 2) then
        -- theo tháng	
				DROP TEMPORARY TABLE IF EXISTS temp_time_thang;
				CREATE TEMPORARY TABLE temp_time_thang
				(
					select    `month` from  (
					  select 1 as `month` union all select 2 union all select 3 union all
					  select 4 union all select 5 union all select 6 union all select 7 union all
					  select 8 union all select 9 union all select 10 union all select 11 union all
					  select 12
					 ) v
				);

				DROP TEMPORARY TABLE IF EXISTS temp_time_nam;
				CREATE TEMPORARY TABLE temp_time_nam (
					years INT(11) NOT NULL,
					PRIMARY KEY (years)
				) AS
				(
					SELECT
					(1900 + HUNDREDS.val + TENS.val + ONES.val) AS `years`
					FROM
					( SELECT 0 val UNION ALL SELECT 1 val UNION ALL SELECT 2 val UNION ALL SELECT 3 val UNION ALL SELECT 4 val UNION ALL SELECT 5 val UNION ALL SELECT 6 val UNION ALL SELECT 7 val UNION ALL SELECT 8 val UNION ALL SELECT 9 val ) ONES
					CROSS JOIN
					( SELECT 0 val UNION ALL SELECT 10 val UNION ALL SELECT 20 val UNION ALL SELECT 30 val UNION ALL SELECT 40 val UNION ALL SELECT 50 val UNION ALL SELECT 60 val UNION ALL SELECT 70 val UNION ALL SELECT 80 val UNION ALL SELECT 90 val ) TENS
					CROSS JOIN
					( SELECT 0 val UNION ALL SELECT 100 val ) HUNDREDS
					where (1900 + HUNDREDS.val + TENS.val + ONES.val)  >= year(start_date)
					and  (1900 + HUNDREDS.val + TENS.val + ONES.val)  <= year(end_date)
			   
				);


				DROP TEMPORARY TABLE IF EXISTS temp_time_nam_thang;
				CREATE TEMPORARY TABLE temp_time_nam_thang (
				   select *   from temp_time_thang,temp_time_nam
					where
							   ( year(end_date)  -   year(start_date) > 0 )
							   or 
					 (   temp_time_thang.`month` >  month(start_date) - 1
						 and temp_time_thang.`month` <  month(end_date) + 1
						 )
					
						);


			  select     concat(temp_time_nam_thang.`month`,'/',temp_time_nam_thang.years ) as date,
							 temp_time_nam_thang.`month` as `month`,
							temp_time_nam_thang.years as `year`,

					ifnull(sum(temp_ban_hang.totalSales),0) as totalSales


			  from temp_time_nam_thang
				 left join temp_ban_hang on  month(temp_ban_hang.dateCreated)  = temp_time_nam_thang.`month` and year(temp_ban_hang.dateCreated) = temp_time_nam_thang.years
		  where  temp_time_nam_thang.`month` >  month(start_date) - 1
			 and temp_time_nam_thang.`month` <  month(end_date) + 1

			  group by  temp_time_nam_thang.years , temp_time_nam_thang.month
			  order by temp_time_nam_thang.years asc ,temp_time_nam_thang.`month` asc
      ;

	elseif(in_timeType = 3) then
    -- theo quý
        DROP TEMPORARY TABLE IF EXISTS temp_time_thang;
		CREATE TEMPORARY TABLE temp_time_thang
		(
			select    `month` from  (
			  select 1 as `month` union all select 2 union all select 3 union all
			  select 4 union all select 5 union all select 6 union all select 7 union all
			  select 8 union all select 9 union all select 10 union all select 11 union all
			  select 12
			 ) v
		);

	    DROP TEMPORARY TABLE IF EXISTS temp_time_nam;
		CREATE TEMPORARY TABLE temp_time_nam (
			years INT(11) NOT NULL,
			PRIMARY KEY (years)
		) AS
		(
			SELECT
			(1900 + HUNDREDS.val + TENS.val + ONES.val) AS `years`
			FROM
			( SELECT 0 val UNION ALL SELECT 1 val UNION ALL SELECT 2 val UNION ALL SELECT 3 val UNION ALL SELECT 4 val UNION ALL SELECT 5 val UNION ALL SELECT 6 val UNION ALL SELECT 7 val UNION ALL SELECT 8 val UNION ALL SELECT 9 val ) ONES
			CROSS JOIN
			( SELECT 0 val UNION ALL SELECT 10 val UNION ALL SELECT 20 val UNION ALL SELECT 30 val UNION ALL SELECT 40 val UNION ALL SELECT 50 val UNION ALL SELECT 60 val UNION ALL SELECT 70 val UNION ALL SELECT 80 val UNION ALL SELECT 90 val ) TENS
			CROSS JOIN
			( SELECT 0 val UNION ALL SELECT 100 val ) HUNDREDS
            where (1900 + HUNDREDS.val + TENS.val + ONES.val)  >= year(start_date)
            and  (1900 + HUNDREDS.val + TENS.val + ONES.val)  <= year(end_date)
       
		);


        DROP TEMPORARY TABLE IF EXISTS temp_time_nam_thang;
		CREATE TEMPORARY TABLE temp_time_nam_thang (
           select *   from temp_time_thang,temp_time_nam
            where
                       ( year(end_date)  -   year(start_date) > 0 )
                       or 
			 (   temp_time_thang.`month` >  month(start_date) - 1
				 and temp_time_thang.`month` <  month(end_date) + 1
                 )
			
				);


	  select     concat( round((temp_time_nam_thang.month-2)/3,0)  + 1,'/',temp_time_nam_thang.years ) as date,
                    round((temp_time_nam_thang.month-2)/3,0)  + 1 as `quy`,
					temp_time_nam_thang.years as `year`,

		    ifnull(sum(temp_ban_hang.totalSales),0) as totalSales


	from temp_time_nam_thang
         left join temp_ban_hang on  month(temp_ban_hang.dateCreated)  = temp_time_nam_thang.`month` and year(temp_ban_hang.dateCreated) = temp_time_nam_thang.years
  where  temp_time_nam_thang.`month` >  month(start_date) - 1
      and temp_time_nam_thang.`month` <  month(end_date) + 1

      group by  temp_time_nam_thang.years , round((temp_time_nam_thang.month-2)/3,0) 
      order by temp_time_nam_thang.years asc ,temp_time_nam_thang.`month` asc
      ;

   elseif(in_timeType = 4) then

			   DROP TEMPORARY TABLE IF EXISTS temp_time_nam;
				CREATE TEMPORARY TABLE temp_time_nam (
					years INT(11) NOT NULL,
					PRIMARY KEY (years)
				) AS
				(
					SELECT
					(1900 + HUNDREDS.val + TENS.val + ONES.val) AS `years`
					FROM
					( SELECT 0 val UNION ALL SELECT 1 val UNION ALL SELECT 2 val UNION ALL SELECT 3 val UNION ALL SELECT 4 val UNION ALL SELECT 5 val UNION ALL SELECT 6 val UNION ALL SELECT 7 val UNION ALL SELECT 8 val UNION ALL SELECT 9 val ) ONES
					CROSS JOIN
					( SELECT 0 val UNION ALL SELECT 10 val UNION ALL SELECT 20 val UNION ALL SELECT 30 val UNION ALL SELECT 40 val UNION ALL SELECT 50 val UNION ALL SELECT 60 val UNION ALL SELECT 70 val UNION ALL SELECT 80 val UNION ALL SELECT 90 val ) TENS
					CROSS JOIN
					( SELECT 0 val UNION ALL SELECT 100 val ) HUNDREDS
				where (1900 + HUNDREDS.val + TENS.val + ONES.val)  >= year(start_date)
					and  (1900 + HUNDREDS.val + TENS.val + ONES.val)  <= year(end_date)
				);


			  select
							temp_time_nam.years as `date`,

		     ifnull(sum(temp_ban_hang.totalSales),0) as totalSales

			  from temp_time_nam
				 left join temp_ban_hang on  year(temp_ban_hang.dateCreated) = temp_time_nam.years

				
			  group by  temp_time_nam.years
			  order by temp_time_nam.years asc
			  ;

        end if;

   select  ifnull(sum(temp_ban_hang.totalSales),0) as totalSales from temp_ban_hang;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_statics_hoc_vien_dang_ky` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_statics_hoc_vien_dang_ky`(
    in in_FromDate datetime,
	  in in_ToDate datetime,
    in in_timeType int 

)
BEGIN
    declare memberInProjects,memberInOffices bigint;
    declare start_date,end_date,start_date_week,end_date_week datetime;

    if(in_FromDate='1970-01-01') then set start_date = subdate(current_date(),30) ;
    else set start_date = in_FromDate;
    end if;

	if(in_ToDate='1970-01-01') then set end_date = current_date();
    else set end_date = in_ToDate;
    end if;
    
    
    DROP TEMPORARY TABLE IF EXISTS temp_ban_hang;
        
		CREATE TEMPORARY TABLE temp_ban_hang
		(
    		SELECT
			date(dateCreated) as dateCreated,
      sum(case when purchasedCourseGroups.money = 0 then 1 else 0 end) as count_mienphi,
      sum(case when purchasedCourseGroups.money > 0 then 1 else 0 end) as count_matphi,
      count(purchasedCourseGroups.id) as count
			FROM
				  purchasedCourseGroups
		   
				where
                status = 1
				and   (purchasedCourseGroups.dateCreated >= start_date )
				   and ( purchasedCourseGroups.dateCreated <  end_date  + INTERVAL 1 DAY )
				   GROUP BY date(purchasedCourseGroups.dateCreated)
       );
		   
           
	


	if(in_timeType = 1) then
    -- theo ngày
		DROP TEMPORARY TABLE IF EXISTS temp_time_ngay;
		CREATE TEMPORARY TABLE temp_time_ngay
		(
			 select    date(selectedDate) as date from  (
			  select adddate(start_date,t4*10000 + t3*1000 + t2*100 + t1*10 + t0) selectedDate from
				 (select 0 t0 union select 1 union select 2 union select 3 union select 4 union select 5 union select 6 union select 7 union select 8 union select 9) t0,
				 (select 0 t1 union select 1 union select 2 union select 3 union select 4 union select 5 union select 6 union select 7 union select 8 union select 9) t1,
				 (select 0 t2 union select 1 union select 2 union select 3 union select 4 union select 5 union select 6 union select 7 union select 8 union select 9) t2,
				 (select 0 t3 union select 1 union select 2 union select 3 union select 4 union select 5 union select 6 union select 7 union select 8 union select 9) t3,
				 (select 0 t4 union select 1 union select 2 union select 3 union select 4 union select 5 union select 6 union select 7 union select 8 union select 9) t4
			 ) v
			 where
				selectedDate >= start_date
				 and selectedDate <= end_date

		);


      select temp_time_ngay.date as date,
        ifnull(temp_ban_hang.count, 0) as count,
        ifnull(temp_ban_hang.count_mienphi, 0) as count_mienphi,
         ifnull(temp_ban_hang.count_matphi,0) as count_matphi
      from temp_time_ngay
        left join temp_ban_hang on  temp_ban_hang.dateCreated  = temp_time_ngay.date


      order by temp_time_ngay.date asc ;
      
		elseif(in_timeType = 2) then
        -- theo tháng	
				DROP TEMPORARY TABLE IF EXISTS temp_time_thang;
				CREATE TEMPORARY TABLE temp_time_thang
				(
					select    `month` from  (
					  select 1 as `month` union all select 2 union all select 3 union all
					  select 4 union all select 5 union all select 6 union all select 7 union all
					  select 8 union all select 9 union all select 10 union all select 11 union all
					  select 12
					 ) v
				);

				DROP TEMPORARY TABLE IF EXISTS temp_time_nam;
				CREATE TEMPORARY TABLE temp_time_nam (
					years INT(11) NOT NULL,
					PRIMARY KEY (years)
				) AS
				(
					SELECT
					(1900 + HUNDREDS.val + TENS.val + ONES.val) AS `years`
					FROM
					( SELECT 0 val UNION ALL SELECT 1 val UNION ALL SELECT 2 val UNION ALL SELECT 3 val UNION ALL SELECT 4 val UNION ALL SELECT 5 val UNION ALL SELECT 6 val UNION ALL SELECT 7 val UNION ALL SELECT 8 val UNION ALL SELECT 9 val ) ONES
					CROSS JOIN
					( SELECT 0 val UNION ALL SELECT 10 val UNION ALL SELECT 20 val UNION ALL SELECT 30 val UNION ALL SELECT 40 val UNION ALL SELECT 50 val UNION ALL SELECT 60 val UNION ALL SELECT 70 val UNION ALL SELECT 80 val UNION ALL SELECT 90 val ) TENS
					CROSS JOIN
					( SELECT 0 val UNION ALL SELECT 100 val ) HUNDREDS
					where (1900 + HUNDREDS.val + TENS.val + ONES.val)  >= year(start_date)
					and  (1900 + HUNDREDS.val + TENS.val + ONES.val)  <= year(end_date)
			   
				);


				DROP TEMPORARY TABLE IF EXISTS temp_time_nam_thang;
				CREATE TEMPORARY TABLE temp_time_nam_thang (
				   select *   from temp_time_thang,temp_time_nam
					where
							   ( year(end_date)  -   year(start_date) > 0 )
							   or 
					 (   temp_time_thang.`month` >  month(start_date) - 1
						 and temp_time_thang.`month` <  month(end_date) + 1
						 )
					
						);


			  select     concat(temp_time_nam_thang.`month`,'/',temp_time_nam_thang.years ) as date,
							 temp_time_nam_thang.`month` as `month`,
							temp_time_nam_thang.years as `year`,

          ifnull(sum(temp_ban_hang.count), 0) as count,
          ifnull(sum(temp_ban_hang.count_mienphi), 0) as count_mienphi,
          ifnull(sum(temp_ban_hang.count_matphi),0) as count_matphi


			  from temp_time_nam_thang
				 left join temp_ban_hang on  month(temp_ban_hang.dateCreated)  = temp_time_nam_thang.`month` and year(temp_ban_hang.dateCreated) = temp_time_nam_thang.years
		  where  temp_time_nam_thang.`month` >  month(start_date) - 1
			 and temp_time_nam_thang.`month` <  month(end_date) + 1

			  group by  temp_time_nam_thang.years , temp_time_nam_thang.month
			  order by temp_time_nam_thang.years asc ,temp_time_nam_thang.`month` asc
      ;

	elseif(in_timeType = 3) then
    -- theo quý
        DROP TEMPORARY TABLE IF EXISTS temp_time_thang;
		CREATE TEMPORARY TABLE temp_time_thang
		(
			select    `month` from  (
			  select 1 as `month` union all select 2 union all select 3 union all
			  select 4 union all select 5 union all select 6 union all select 7 union all
			  select 8 union all select 9 union all select 10 union all select 11 union all
			  select 12
			 ) v
		);

	    DROP TEMPORARY TABLE IF EXISTS temp_time_nam;
		CREATE TEMPORARY TABLE temp_time_nam (
			years INT(11) NOT NULL,
			PRIMARY KEY (years)
		) AS
		(
			SELECT
			(1900 + HUNDREDS.val + TENS.val + ONES.val) AS `years`
			FROM
			( SELECT 0 val UNION ALL SELECT 1 val UNION ALL SELECT 2 val UNION ALL SELECT 3 val UNION ALL SELECT 4 val UNION ALL SELECT 5 val UNION ALL SELECT 6 val UNION ALL SELECT 7 val UNION ALL SELECT 8 val UNION ALL SELECT 9 val ) ONES
			CROSS JOIN
			( SELECT 0 val UNION ALL SELECT 10 val UNION ALL SELECT 20 val UNION ALL SELECT 30 val UNION ALL SELECT 40 val UNION ALL SELECT 50 val UNION ALL SELECT 60 val UNION ALL SELECT 70 val UNION ALL SELECT 80 val UNION ALL SELECT 90 val ) TENS
			CROSS JOIN
			( SELECT 0 val UNION ALL SELECT 100 val ) HUNDREDS
            where (1900 + HUNDREDS.val + TENS.val + ONES.val)  >= year(start_date)
            and  (1900 + HUNDREDS.val + TENS.val + ONES.val)  <= year(end_date)
       
		);


        DROP TEMPORARY TABLE IF EXISTS temp_time_nam_thang;
		CREATE TEMPORARY TABLE temp_time_nam_thang (
           select *   from temp_time_thang,temp_time_nam
            where
                       ( year(end_date)  -   year(start_date) > 0 )
                       or 
			 (   temp_time_thang.`month` >  month(start_date) - 1
				 and temp_time_thang.`month` <  month(end_date) + 1
                 )
			
				);


	  select     concat( round((temp_time_nam_thang.month-2)/3,0)  + 1,'/',temp_time_nam_thang.years ) as date,
                    round((temp_time_nam_thang.month-2)/3,0)  + 1 as `quy`,
					temp_time_nam_thang.years as `year`,

		      ifnull(sum(temp_ban_hang.count), 0) as count,
          ifnull(sum(temp_ban_hang.count_mienphi), 0) as count_mienphi,
          ifnull(sum(temp_ban_hang.count_matphi),0) as count_matphi


	from temp_time_nam_thang
         left join temp_ban_hang on  month(temp_ban_hang.dateCreated)  = temp_time_nam_thang.`month` and year(temp_ban_hang.dateCreated) = temp_time_nam_thang.years
  where  temp_time_nam_thang.`month` >  month(start_date) - 1
      and temp_time_nam_thang.`month` <  month(end_date) + 1

      group by  temp_time_nam_thang.years , round((temp_time_nam_thang.month-2)/3,0) 
      order by temp_time_nam_thang.years asc ,temp_time_nam_thang.`month` asc
      ;

   elseif(in_timeType = 4) then

			   DROP TEMPORARY TABLE IF EXISTS temp_time_nam;
				CREATE TEMPORARY TABLE temp_time_nam (
					years INT(11) NOT NULL,
					PRIMARY KEY (years)
				) AS
				(
					SELECT
					(1900 + HUNDREDS.val + TENS.val + ONES.val) AS `years`
					FROM
					( SELECT 0 val UNION ALL SELECT 1 val UNION ALL SELECT 2 val UNION ALL SELECT 3 val UNION ALL SELECT 4 val UNION ALL SELECT 5 val UNION ALL SELECT 6 val UNION ALL SELECT 7 val UNION ALL SELECT 8 val UNION ALL SELECT 9 val ) ONES
					CROSS JOIN
					( SELECT 0 val UNION ALL SELECT 10 val UNION ALL SELECT 20 val UNION ALL SELECT 30 val UNION ALL SELECT 40 val UNION ALL SELECT 50 val UNION ALL SELECT 60 val UNION ALL SELECT 70 val UNION ALL SELECT 80 val UNION ALL SELECT 90 val ) TENS
					CROSS JOIN
					( SELECT 0 val UNION ALL SELECT 100 val ) HUNDREDS
				where (1900 + HUNDREDS.val + TENS.val + ONES.val)  >= year(start_date)
					and  (1900 + HUNDREDS.val + TENS.val + ONES.val)  <= year(end_date)
				);


			  select
							temp_time_nam.years as `date`,

		       ifnull(sum(temp_ban_hang.count), 0) as count,
          ifnull(sum(temp_ban_hang.count_mienphi), 0) as count_mienphi,
          ifnull(sum(temp_ban_hang.count_matphi),0) as count_matphi

			  from temp_time_nam
				 left join temp_ban_hang on  year(temp_ban_hang.dateCreated) = temp_time_nam.years

				
			  group by  temp_time_nam.years
			  order by temp_time_nam.years asc
			  ;

        end if;

   select         ifnull(sum(temp_ban_hang.count), 0) as count,
          ifnull(sum(temp_ban_hang.count_mienphi), 0) as count_mienphi,
          ifnull(sum(temp_ban_hang.count_matphi),0) as count_matphi
	from temp_ban_hang;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `userGroupRoles_GetAllByGroupUserId_NewCms` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `userGroupRoles_GetAllByGroupUserId_NewCms`(
	userGroupsId bigint,
	menuName nvarchar(100),
    in_siteId bigint
)
BEGIN	
	 DROP TEMPORARY TABLE IF EXISTS temp_menu_parentid;
		CREATE TEMPORARY TABLE temp_menu_parentid
		(
			select menu.parentId from menus as menu
			where menu.name like CONCAT('%',menuName,'%') COLLATE utf8_general_ci
            and  menu.status = 1 
            and menu.sitesId=in_siteId
		);
		select t.* from (
        SELECT  tc.id,(tc.parentId*1000+tc.orderby) as orderId,tc.name,
				userGroupsId as userGroupsId,tc.id as menusId, tc.parentId, 
				IFNULL((select t.isDeleted from (
					(
						select R.isDeleted,R.menusId
                        from userGroupRoles AS R
						where R.userGroupsId=userGroupsId
                    ))t 
                     where t.menusId = tc.id
                     order by t.isDeleted desc limit 1
                    ),0) AS isDeleted ,
                   IFNULL((select t.isUpdated from (
					(
						select R.isUpdated,R.menusId
                        from userGroupRoles AS R
						where R.userGroupsId=userGroupsId 
                    )
					)t 
                   where t.menusId = tc.id
                    order by t.isUpdated desc limit 1
                    ),0) AS isUpdated,
                    IFNULL((select t.isAdded  from (
					(
						select R.isAdded,R.menusId
                        from userGroupRoles AS R
						where R.userGroupsId=userGroupsId 
                    )
                   )t 
                     where t.menusId = tc.id
                      order by t.isAdded desc limit 1
                    ),0) AS isAdded,
                    IFNULL((select t.isViewed from (
					(
						select R.isViewed,R.menusId
                        from userGroupRoles AS R
						where R.userGroupsId=userGroupsId
                    )
                   )t 
                   where t.menusId = tc.id
                          order by t.isViewed desc limit 1
                    ),0) AS isViewed,
          
                     IFNULL((select t.isBlocked from (
					(
						select R.isBlocked,R.menusId
                        from userGroupRoles AS R
						where R.userGroupsId=userGroupsId
                    )
                   )t 
                   where t.menusId = tc.id
                          order by t.isBlocked desc limit 1
                    ),0) AS isBlocked,
                    IFNULL((select t.isApproved from (
					(
						select R.isApproved,R.menusId
                        from userGroupRoles AS R
						where R.userGroupsId=userGroupsId
                    )
                   )t 
                   where t.menusId = tc.id
                          order by t.isApproved desc limit 1
                    ),0) AS isApproved
				
            FROM menus tc
			WHERE tc.status = 1 
                and tc.sitesId=in_siteId
            and (tc.name like CONCAT('%',menuName,'%') COLLATE utf8_general_ci
					 or
					exists(
						select temp_menu_parentid.parentId from temp_menu_parentid
						where temp_menu_parentid.parentId = tc.id
					)
                )
                )t
			order by t.orderId asc
          
        ;
	
  
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `userGroupRoles_GetAllByGroupUserId_NewCms_v2` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `userGroupRoles_GetAllByGroupUserId_NewCms_v2`(
	userGroupsId bigint,
	menuName nvarchar(100),
    in_siteId bigint,
    in_menuPositionsId bigint
)
BEGIN	
	 DROP TEMPORARY TABLE IF EXISTS temp_menu_parentid;
		CREATE TEMPORARY TABLE temp_menu_parentid
		(
			select menu.parentId from menus as menu
			where menu.name like CONCAT('%',menuName,'%') COLLATE utf8_general_ci
            and  menu.status = 1 
            and menu.sitesId=in_siteId
            and menu.menuPositionsId=in_menuPositionsId
		);
		select t.* from (
        SELECT  tc.id,(tc.parentId*1000+tc.orderby) as orderId,tc.name,
				userGroupsId as userGroupsId,tc.id as menusId, tc.parentId, 
				IFNULL((select t.isDeleted from (
					(
						select R.isDeleted,R.menusId
                        from userGroupRoles AS R
						where R.userGroupsId=userGroupsId
                    ))t 
                     where t.menusId = tc.id
                     order by t.isDeleted desc limit 1
                    ),0) AS isDeleted ,
                   IFNULL((select t.isUpdated from (
					(
						select R.isUpdated,R.menusId
                        from userGroupRoles AS R
						where R.userGroupsId=userGroupsId 
                    )
					)t 
                   where t.menusId = tc.id
                    order by t.isUpdated desc limit 1
                    ),0) AS isUpdated,
                    IFNULL((select t.isAdded  from (
					(
						select R.isAdded,R.menusId
                        from userGroupRoles AS R
						where R.userGroupsId=userGroupsId 
                    )
                   )t 
                     where t.menusId = tc.id
                      order by t.isAdded desc limit 1
                    ),0) AS isAdded,
                    IFNULL((select t.isViewed from (
					(
						select R.isViewed,R.menusId
                        from userGroupRoles AS R
						where R.userGroupsId=userGroupsId
                    )
                   )t 
                   where t.menusId = tc.id
                          order by t.isViewed desc limit 1
                    ),0) AS isViewed,
          
                     IFNULL((select t.isBlocked from (
					(
						select R.isBlocked,R.menusId
                        from userGroupRoles AS R
						where R.userGroupsId=userGroupsId
                    )
                   )t 
                   where t.menusId = tc.id
                          order by t.isBlocked desc limit 1
                    ),0) AS isBlocked,
                    IFNULL((select t.isApproved from (
					(
						select R.isApproved,R.menusId
                        from userGroupRoles AS R
						where R.userGroupsId=userGroupsId
                    )
                   )t 
                   where t.menusId = tc.id
                          order by t.isApproved desc limit 1
                    ),0) AS isApproved
				
            FROM menus tc
			WHERE tc.status = 1 
                and tc.sitesId=in_siteId
                and tc.menuPositionsId=in_menuPositionsId
            and (tc.name like CONCAT('%',menuName,'%') COLLATE utf8_general_ci
					 or
					exists(
						select temp_menu_parentid.parentId from temp_menu_parentid
						where temp_menu_parentid.parentId = tc.id
					)
                )
                )t
			order by t.orderId asc
          
        ;
	
  
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `userGroupRoles_Update_NewCms` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `userGroupRoles_Update_NewCms`(
  json longtext  COLLATE utf8mb3_unicode_ci

, inUserGroupsId BIGINT)
BEGIN

	DECLARE json_items_length BIGINT UNSIGNED DEFAULT JSON_LENGTH(json);
  DECLARE _index BIGINT UNSIGNED DEFAULT 0;
	
	DECLARE _isDeleted TINYINT(1) default false;
	DECLARE _isUpdated TINYINT(1) default false;
	DECLARE _isAdded TINYINT(1) default false;
	DECLARE _isViewed TINYINT(1) default false;
	DECLARE _isBlocked TINYINT(1) default false;
    
	DECLARE _isApproved TINYINT(1) default false;
    
	DECLARE _menusId BIGINT UNSIGNED DEFAULT 0;
    DECLARE _userGroupRolesId BIGINT UNSIGNED DEFAULT 0;
   SET SQL_SAFE_UPDATES = 0;
  WHILE _index < json_items_length DO
        
		set _isAdded :=if((JSON_EXTRACT(json, CONCAT('$[', _index, '].isAdded')))='true',1,0);
		set _isViewed := if((JSON_EXTRACT(json, CONCAT('$[', _index, '].isViewed')))='true',1,0);
		set _isUpdated := if((JSON_EXTRACT(json, CONCAT('$[', _index, '].isUpdated')))='true',1,0);
		set _isDeleted := if((JSON_EXTRACT(json, CONCAT('$[', _index, '].isDeleted')))='true',1,0);
        
        set _isBlocked := if((JSON_EXTRACT(json, CONCAT('$[', _index, '].isBlocked')))='true',1,0);
        set _isApproved := if((JSON_EXTRACT(json, CONCAT('$[', _index, '].isApproved')))='true',1,0);
      
		set _menusId := CAST(JSON_EXTRACT(json, CONCAT('$[', _index, '].menusId')) as DOUBLE );
		
		set _userGroupRolesId = ifnull((select id from userGroupRoles where 
			userGroupsId = inUserGroupsId
            and menusId = _menusId
        ),0);
		select _isViewed,_isUpdated,_isDeleted,_isBlocked,_isAdded,_isApproved;
		if(_userGroupRolesId = 0) then
			 INSERT INTO userGroupRoles(isViewed, isUpdated, isDeleted, isBlocked, isAdded,
            isApproved, menusId, userGroupsId)
			VALUES (_isViewed, _isUpdated, _isDeleted, _isBlocked, _isAdded,
            _isApproved, _menusId,inUserGroupsId);

		else
			UPDATE userGroupRoles
			SET isViewed = _isViewed,
				isUpdated = _isUpdated,
				isDeleted = _isDeleted,
				isBlocked = _isBlocked,
				isAdded = _isAdded,
                isApproved = _isApproved
			WHERE  userGroupsId= inUserGroupsId
             and menusId = _menusId
            ;
		end if;
		
    SET _index := _index + 1;
  END WHILE;
	

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-19 16:16:07
