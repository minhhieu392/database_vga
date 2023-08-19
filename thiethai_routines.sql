-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: thiethai
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
-- Dumping events for database 'thiethai'
--

--
-- Dumping routines for database 'thiethai'
--
/*!50003 DROP FUNCTION IF EXISTS `fn_don_vi_hanh_chinh_find` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `fn_don_vi_hanh_chinh_find`(in_provinceName varchar(200),
    in_districtName varchar(200),
    in_wardName varchar(200),
    in_villageName varchar(200)

 
) RETURNS bigint(20)
BEGIN

	declare provincesId ,districtsId,wardsId,villagesId bigint;
    set provincesId = 0 ,districtsId= 0, wardsId= 0,villagesId=0;
    set provincesId = ifnull((select id from provinces where provinces.provinceName like  in_provinceName ),0);
    if provincesId <> 0 then  set districtsId = ifnull((select id from districts where districts.districtName like  in_districtName and districts.provincesId = provincesId ),0); end if;
   
	return districtsId;

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
/*!50003 DROP PROCEDURE IF EXISTS `sp_article_urlSlugs` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_article_urlSlugs`(
	in in_categoriesId bigint,
	in in_articleId bigint,
    in in_urlSlug nvarchar(4000)
)
BEGIN
	declare in_id bigint;
	declare _count int;
    declare _urlSlug nvarchar(4000);
	update articles_urlSlugs set status=false
        where articlesId = in_articleId
		and categoriesId = in_categoriesId
        and id>0;
	set in_id = (select id from articles_urlSlugs 
		where  urlSlug = in_urlSlug
        );
	if(in_id>0)
	then
		if(exists(select id from articles_urlSlugs where articlesId = in_articleId
			and categoriesId = in_categoriesId
			and urlSlug = in_urlSlug order by id desc limit 1))
		then
        	set _urlSlug = in_urlSlug;
			update articles_urlSlugs set status=true
			where articlesId = in_articleId
			and categoriesId = in_categoriesId
			and urlSlug = in_urlSlug;
		else
			set _count =(select count(*) from articles_urlSlugs where
					urlSlug like concat(in_urlSlug,'%'));
			set _urlSlug = concat(in_urlSlug,'-', _count + 1);
			insert into articles_urlSlugs(categoriesId,articlesId,urlSlug,status)
			values(in_categoriesId,in_articleId,_urlSlug,true);
        end if;
	else
		set _urlSlug = in_urlSlug;
		insert into articles_urlSlugs(categoriesId,articlesId,urlSlug,status)
        values(in_categoriesId,in_articleId,in_urlSlug,true);
    end if;
    
	update article set urlSlugs= _urlSlug where id = in_articleId;
    
    select * from articles_urlSlugs
    where articlesId = in_articleId
		and categoriesId = in_categoriesId
        and urlSlug = in_urlSlug;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_damages_by_target` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_damages_by_target`(
	in in_disasterGroupsId varchar(200),
	in in_provincesId varchar(200),
    in in_districtsId varchar(200),
    in in_wardsId varchar(200),
    in in_FromDate varchar(200),
	in in_ToDate varchar(200)
)
BEGIN
 -- 	call thiethai.sp_response_sum('', '5', '', '', '', '', '');
 

	  DECLARE sqlWhere  varchar(20000) COLLATE utf8mb3_unicode_ci;
        
	  DROP TEMPORARY TABLE IF EXISTS temp_list_wards;
	  SET @sqlWard = concat('
       CREATE TEMPORARY TABLE temp_list_wards( 
         select 
                   provinceName,
                   districtName,
                   wardName,
                   wards.id as wardsId,
				   districts.id as districtsId,
                   provinces.id as provincesId,
                   disasters.id as disastersId,
                   disastersName,
                   disasters.disasterTimeStart,
                   disasters.disasterTimeEnd,
			        GROUP_CONCAT( disasterGroupsName  SEPARATOR ",") as disasterGroupsName
			   from wards
                    	inner join districts on districts.id = wards.districtsId ',
						if(in_districtsId  <>  '' , concat(' and districts.id in (',in_districtsId,') '),' ')
						,'
						inner join provinces on provinces.id = districts.provincesId ', 
						if(in_provincesId  <>  '' , concat(' and provinces.id in (',in_provincesId,') '),' '), 
						'
					inner join 
					  ( damages
						inner join disasters on damages.disastersId = disasters.id ',
						 if(in_FromDate  <>  '' , concat(' and disasters.disasterTimeStart >= "',in_FromDate,'" '),' '),
						 if(in_ToDate  <>  '' , concat(' and disasters.disasterTimeStart <= "',in_ToDate,'" '),' ')
						,'
						inner join disasterGroupsDisasters on disasterGroupsDisasters.disastersId = disasters.id ',
						if(in_disasterGroupsId  <>  '' , concat(' and disasterGroupsDisasters.disasterGroupsId in (',in_disasterGroupsId,') '),' ')
						,'
                        inner join disasterGroups on disasterGroupsDisasters.disasterGroupsId = disasterGroups.id
					
						
					 )on damages.wardsId = wards.id
				 where     
					 wards.status = 1
                     ', 
						if(in_wardsId  <>  '' , concat(' and wards.id in (',in_wardsId,') '),' '),
					 '
				group by wards.id 
				
			)
            '
                                 
			);	  
        
	
	PREPARE sqlWard FROM @sqlWard;
	EXECUTE sqlWard;

     DROP TEMPORARY TABLE IF EXISTS temp_list_wardsTargets;
	 CREATE TEMPORARY TABLE temp_list_wardsTargets( 
		select targets.* , ifnull(quantity,0)  as value  from		
			(select * from     targets,temp_list_wards
				where targets.status = 1
                and targets.finalLevel = 1
			)targets 
            left join damages on damages.wardsId = targets.wardsId 
                              and  damages.targetsId = targets.id 
                              and  damages.disastersId = targets.disastersId 
		);
	
 
 
        
	  DROP TEMPORARY TABLE IF EXISTS temp_list_tagerts_parent1;
	  CREATE TEMPORARY TABLE temp_list_tagerts_parent1(
      select parent.id , parent.targetsName, parent.targetsCode ,parent.parentId,targets.unitName,
             provinceName,
                   districtName,
                   wardName,
				   wardsId,
				   districtsId,
                   provincesId,
				   disastersId,
                   disastersName,
                   disasterTimeStart,
                   disasterTimeEnd,
			       disasterGroupsName,
               sum(value)  as value   
      from temp_list_wardsTargets as targets
      inner join targets as parent on parent.id = targets.parentId
      group by parent.id,targets.disastersId,targets.wardsId
	  );
      


	  DROP TEMPORARY TABLE IF EXISTS temp_list_tagerts_parent2;
	  CREATE TEMPORARY TABLE temp_list_tagerts_parent2(
      select parent.id , parent.targetsName, parent.targetsCode ,parent.parentId,targets.unitName,
             provinceName,
                   districtName,
                   wardName,
				   wardsId,
				   districtsId,
                   provincesId,
				   disastersId,
                   disastersName,
                   disasterTimeStart,
                   disasterTimeEnd,
			       disasterGroupsName,
               sum(value)  as value   
      from temp_list_tagerts_parent1 as targets
      inner join targets as parent on parent.id = targets.parentId
      group by parent.id,targets.disastersId,targets.wardsId
	  );
     
     
	  DROP TEMPORARY TABLE IF EXISTS temp_list_tagerts_parent3;
	  CREATE TEMPORARY TABLE temp_list_tagerts_parent3(
      select parent.id , parent.targetsName, parent.targetsCode ,parent.parentId,targets.unitName,
                   provinceName,
                   districtName,
                   wardName,
				   wardsId,
				   districtsId,
                   provincesId,
				   disastersId,
                   disastersName,
                   disasterTimeStart,
                   disasterTimeEnd,
			       disasterGroupsName,
               sum(value)  as value   
      from temp_list_tagerts_parent2 as targets
      inner join targets as parent on parent.id = targets.parentId
      group by parent.id,targets.disastersId,targets.wardsId
	  );
     
      DROP TEMPORARY TABLE IF EXISTS final1;
	  CREATE TEMPORARY TABLE final1(
       select id,targetsName, targetsCode ,parentId,unitName,
			   json_arrayagg(json_object(
				   "provinceName", provinceName,  
					  "districtName",   districtName,  
					  "wardName",   wardName,  
					  "wardsId",   wardsId,  
					  "districtsId",   districtsId,  
					  "provincesId",   provincesId,  
					  "disastersId",   disastersId,  
					  "disastersName",   disastersName,  
					  "disasterTimeStart",   disasterTimeStart,  
					  "disasterTimeEnd",   disasterTimeEnd,  
					  "disasterGroupsName",   disasterGroupsName,  
					  "value",   value    
			   )) as detail
			 from temp_list_wardsTargets
			 group by temp_list_wardsTargets.id
	  );
     

      DROP TEMPORARY TABLE IF EXISTS final2;
	  CREATE TEMPORARY TABLE final2(
       select id,targetsName, targetsCode ,parentId,unitName,
			   json_arrayagg(json_object(
				   "provinceName", provinceName,  
					  "districtName",   districtName,  
					  "wardName",   wardName,  
					  "wardsId",   wardsId,  
					  "districtsId",   districtsId,  
					  "provincesId",   provincesId,  
					  "disastersId",   disastersId,  
					  "disastersName",   disastersName,  
					  "disasterTimeStart",   disasterTimeStart,  
					  "disasterTimeEnd",   disasterTimeEnd,  
					  "disasterGroupsName",   disasterGroupsName,  
					  "value",   value    
			   )) as detail
			 from temp_list_tagerts_parent1
			 group by temp_list_tagerts_parent1.id
	  );
   
   
         DROP TEMPORARY TABLE IF EXISTS final3;
	  CREATE TEMPORARY TABLE final3(
       select id,targetsName, targetsCode ,parentId,unitName,
			   json_arrayagg(json_object(
				   "provinceName", provinceName,  
					  "districtName",   districtName,  
					  "wardName",   wardName,  
					  "wardsId",   wardsId,  
					  "districtsId",   districtsId,  
					  "provincesId",   provincesId,  
					  "disastersId",   disastersId,  
					  "disastersName",   disastersName,  
					  "disasterTimeStart",   disasterTimeStart,  
					  "disasterTimeEnd",   disasterTimeEnd,  
					  "disasterGroupsName",   disasterGroupsName,  
					  "value",   value    
			   )) as detail
			 from temp_list_tagerts_parent2
			 group by temp_list_tagerts_parent2.id
	  );
      
      
      
            DROP TEMPORARY TABLE IF EXISTS final4;
	  CREATE TEMPORARY TABLE final4(
       select id,targetsName, targetsCode ,parentId,unitName,
			   json_arrayagg(json_object(
				   "provinceName", provinceName,  
					  "districtName",   districtName,  
					  "wardName",   wardName,  
					  "wardsId",   wardsId,  
					  "districtsId",   districtsId,  
					  "provincesId",   provincesId,  
					  "disastersId",   disastersId,  
					  "disastersName",   disastersName,  
					  "disasterTimeStart",   disasterTimeStart,  
					  "disasterTimeEnd",   disasterTimeEnd,  
					  "disasterGroupsName",   disasterGroupsName,  
					  "value",   value    
			   )) as detail
			 from temp_list_tagerts_parent3
			 group by temp_list_tagerts_parent3.id
	  );
   
     select * from (
       select * from final1
      union 
     select * from final2
        union 
     select * from final3
        union 
     select * from final4
     )targets 
     order by targets.targetsCode asc;
  
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_damages_count` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_damages_count`(
    in in_disasterGroupsId varchar(200),
	in in_provincesId varchar(200),
    in in_districtsId varchar(200),
    in in_wardsId varchar(200),
    in in_FromDate varchar(200),
	in in_ToDate varchar(200)
)
BEGIN
 -- 	call thiethai.sp_disasters_count('', '', '', '', '', '');
        DECLARE sqlWhere  varchar(20000) COLLATE utf8mb3_unicode_ci;

		
		set sqlWhere =  concat(' ',			
			 if(in_FromDate <> '' ,concat('and disasters.disasterTimeStart >= "',in_FromDate,'" '),''),
			 if(in_ToDate <> '' ,concat('and disasters.disasterTimeStart < "',in_ToDate,'" +  interval 1 day  '),''),
			 ' '
		   );




			SET @sql0 = concat('
				select count(distinct disasters.id) as countDisasters
					from
					(
						select disasters.id
						  FROM
								`disasters` AS `disasters`
									INNER JOIN
								`disasterGroupsDisasters` AS `disasterGroupsDisasters` ON `disasterGroupsDisasters`.`disastersId` = `disasters`.`id` 
								 ',
									 if(in_disasterGroupsId  <>  '' , concat('and( disasterGroupsDisasters.disasterGroupsId in (',in_disasterGroupsId,') )'),'')
								 ,'
							 WHERE 
								 	  disasters.status = 1 ', sqlWhere ,'
							group by disasters.id
					)disasters
						INNER JOIN
								`disastersAffectedAreas` AS `disastersAffectedAreas` ON `disastersAffectedAreas`.`disastersId` = `disasters`.`id` 
								 ',
										 if(in_provincesId  <>  '' , concat('and( disastersAffectedAreas.provincesId in (',in_provincesId,') )'),''),
										 if(in_districtsId  <>  '' , concat('and( disastersAffectedAreas.districtsId in (',in_districtsId,') )'),''),
										 if(in_wardsId  <>  '' , concat('and( disastersAffectedAreas.wardsId in (',in_wardsId,') )'),'')
								 ,''
			);		
	--    select @sql0;
	        PREPARE stmt0 FROM @sql0;
			EXECUTE stmt0;
	
    
          	SET @sql1 = concat('
				select count(distinct disasters.id) as countDisasters
					from
					(
						select disasters.id
						  FROM
								`disasters` AS `disasters`
									INNER JOIN
								`disasterGroupsDisasters` AS `disasterGroupsDisasters` ON `disasterGroupsDisasters`.`disastersId` = `disasters`.`id` 
								 ',
									 if(in_disasterGroupsId  <>  '' , concat('and( disasterGroupsDisasters.disasterGroupsId in (',in_disasterGroupsId,') )'),'')
								 ,'
							 WHERE 
								  disasters.status = 1
                                  and (disasterTimeStart <= current_date() and (isnull(disasterTimeEnd)  or disasterTimeEnd >= current_date()))
                                 ', sqlWhere ,
							   '
							group by disasters.id
					)disasters
						INNER JOIN
								`disastersAffectedAreas` AS `disastersAffectedAreas` ON `disastersAffectedAreas`.`disastersId` = `disasters`.`id` 
								 ',
										 if(in_provincesId  <>  '' , concat('and( disastersAffectedAreas.provincesId in (',in_provincesId,') )'),''),
										 if(in_districtsId  <>  '' , concat('and( disastersAffectedAreas.districtsId in (',in_districtsId,') )'),''),
										 if(in_wardsId  <>  '' , concat('and( disastersAffectedAreas.wardsId in (',in_wardsId,') )'),'')
								 ,''
			);		
	--    select @sql1;
	        PREPARE stmt1 FROM @sql1;
			EXECUTE stmt1;





	

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_damages_sum` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_damages_sum`(
	in in_disasterGroupsId varchar(200),
	in in_provincesId varchar(200),
    in in_districtsId varchar(200),
    in in_wardsId varchar(200),
    in in_FromDate varchar(200),
	in in_ToDate varchar(200)
    
)
BEGIN
 -- 	call thiethai.sp_damages_sum('10', '', '', '', '', '1,2,3');
        DECLARE sqlWhere  varchar(20000) COLLATE utf8mb3_unicode_ci;

		
		set sqlWhere =  concat(' ',			
			 if(in_FromDate <> '' ,concat('and damages.disasterTimeStart >= "',in_FromDate,'" '),''),
			 if(in_ToDate <> '' ,concat('and disasters.disasterTimeStart < "',in_ToDate,'" +  interval 1 day  '),''),
			 ' '
		   );

			SET @sql0 = concat(' 
				select a.sum, 
                a.area, 
                json_arrayagg(
                json_object("disastersId",b.disastersId,
							"value",b.value,
							"quantity",b.quantity,
							"wardsId",b.wardsId)
						) as damages
                from ',
				'
				 (
                 select sum(damages.value) as sum, 
                 disastersAffectedAreas.provincesId as area 
                 from damages
                 inner join disastersAffectedAreas on 
				 damages.wardsId = disastersAffectedAreas.wardsId ',
                 if (in_wardsId <> '' , concat(' and damages.wardsId in (',in_wardsId,') '), '' ),
                 if (in_districtsId <> '' , concat(' and disastersAffectedAreas.districtsId in (',in_districtsId,') '), '' ),
                 '
				 and damages.disastersId = disastersAffectedAreas.disastersId
				',
                    if ( in_provincesId <> '' , concat('  and disastersAffectedAreas.provincesId in (',in_provincesId,') '), ' ' ) ,
                    'inner join disasters on damages.disastersId = disasters.id ', sqlWhere ,
                    ' where damages.disastersId in 
                    (select damages.disastersId 
						from  
						damages
                        inner join 
						disasterGroupsDisasters
						on damages.disastersId = disasterGroupsDisasters.disastersId ',
                        
					if (in_disasterGroupsId <> '' , concat(' and disasterGroupsDisasters.disasterGroupsId in (',in_disasterGroupsId,') '), '' ), 
                    '
                    
						group by damages.disastersId) ' ,
                     
						' group by disastersAffectedAreas.provincesId ) as a ' , 
                        ' 
                        left join 
                        (select 
                        damages.disastersId as disastersId, 
                        damages.value as value , 
                        damages.quantity as quantity ,
                        disastersAffectedAreas.provincesId as provincesId,
						damages.wardsId as wardsId 
                        from damages 
						inner join 
                        disastersAffectedAreas 
                        on disastersAffectedAreas.disastersId = damages.disastersId 
                        and disastersAffectedAreas.wardsId = damages.wardsId) as b
						on a.area = b.provincesId 
                        group by a.sum
                        
                        '
                        
                        );
					
	
	        PREPARE stmt1 FROM @sql0;
			EXECUTE stmt1;





	

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_damages_sum_by_groupdisasterGroup` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_damages_sum_by_groupdisasterGroup`(
	in in_disasterGroupsId varchar(200),
	in in_provincesId varchar(200),
    in in_districtsId varchar(200),
    in in_wardsId varchar(200),
    in in_FromDate varchar(200),
	in in_ToDate varchar(200)
    
)
BEGIN
 -- 	call thiethai.sp_damages_sum('10', '', '', '', '', '1,2,3');
        DECLARE sqlWhere  varchar(20000) COLLATE utf8mb3_unicode_ci;

		
		set sqlWhere =  concat(' ',			
			 if(in_FromDate <> '' ,concat('and damages.disasterTimeStart >= "',in_FromDate,'" '),''),
			 if(in_ToDate <> '' ,concat('and disasters.disasterTimeStart < "',in_ToDate,'" +  interval 1 day  '),''),
			 ' '
		   );

			SET @sql0 = concat(' 
				select a.sum, 
                a.area, 
                json_arrayagg(
                json_object("disastersId",b.disastersId,
							"value",b.value,
							"quantity",b.quantity,
							"wardsId",b.wardsId)
						) as damages
                from ',
				'
				 (
                 select sum(damages.value) as sum, 
                 disastersAffectedAreas.provincesId as area 
                 from damages
                 inner join disastersAffectedAreas on 
				 damages.wardsId = disastersAffectedAreas.wardsId ',
                 if (in_wardsId <> '' , concat(' and damages.wardsId in (',in_wardsId,') '), '' ),
                 if (in_districtsId <> '' , concat(' and disastersAffectedAreas.districtsId in (',in_districtsId,') '), '' ),
                 '
				 and damages.disastersId = disastersAffectedAreas.disastersId
				',
                    if ( in_provincesId <> '' , concat('  and disastersAffectedAreas.provincesId in (',in_provincesId,') '), ' ' ) ,
                    'inner join disasters on damages.disastersId = disasters.id ', sqlWhere ,
                    ' where damages.disastersId in 
                    (select damages.disastersId 
						from  
						damages
                        inner join 
						disasterGroupsDisasters
						on damages.disastersId = disasterGroupsDisasters.disastersId ',
                        
					if (in_disasterGroupsId <> '' , concat(' and disasterGroupsDisasters.disasterGroupsId in (',in_disasterGroupsId,') '), '' ), 
                    '
                    
						group by damages.disastersId) ' ,
                     
						' group by disastersAffectedAreas.provincesId ) as a ' , 
                        ' 
                        left join 
                        (select 
                        damages.disastersId as disastersId, 
                        damages.value as value , 
                        damages.quantity as quantity ,
                        disastersAffectedAreas.provincesId as provincesId,
						damages.wardsId as wardsId 
                        from damages 
						inner join 
                        disastersAffectedAreas 
                        on disastersAffectedAreas.disastersId = damages.disastersId 
                        and disastersAffectedAreas.wardsId = damages.wardsId) as b
						on a.area = b.provincesId 
                        group by a.sum
                        
                        '
                        
                        );
					
	
	        PREPARE stmt1 FROM @sql0;
			EXECUTE stmt1;





	

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_damages_sum_by_target` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_damages_sum_by_target`(
	in in_disasterGroupsId varchar(200),
	in in_provincesId varchar(200),
    in in_districtsId varchar(200),
    in in_wardsId varchar(200),
    in in_FromDate varchar(200),
	in in_ToDate varchar(200)
)
BEGIN
 -- 	call thiethai.sp_response_sum('', '5', '', '', '', '', '');
 

	  DECLARE sqlWhere  varchar(20000) COLLATE utf8mb3_unicode_ci;
        
	  DROP TEMPORARY TABLE IF EXISTS temp_list_finalTargets;
	  SET @sql0 = concat('
       CREATE TEMPORARY TABLE temp_list_finalTargets( 
         select    targets.id , targets.targetsName, targets.targetsCode ,parentId,targets.unitName,
               sum(value)  as value    
		  from 
			   (select targets.id , targets.targetsName, targets.targetsCode ,parentId,finalLevel,targets.unitName,
				   ifnull(damages.quantity,0) as  value
			   
			   from targets
					left join 
					  ( damages
						inner join disasters on damages.disastersId = disasters.id ',
						 if(in_FromDate  <>  '' , concat(' and disasters.disasterTimeStart >= "',in_FromDate,'" '),' '),
						 if(in_ToDate  <>  '' , concat(' and disasters.disasterTimeStart <= "',in_ToDate,'" '),' ')
						,'
						inner join disasterGroupsDisasters on disasterGroupsDisasters.disastersId = disasters.id ',
						if(in_disasterGroupsId  <>  '' , concat(' and disasterGroupsDisasters.disasterGroupsId in (',in_disasterGroupsId,') '),' ')
						,'
						inner join wards on wards.id = damages.wardsId ', 
						if(in_wardsId  <>  '' , concat(' and wards.id in (',in_wardsId,') '),' '),
						'
						inner join districts on districts.id = wards.districtsId ',
						if(in_districtsId  <>  '' , concat(' and districts.id in (',in_districtsId,') '),' ')
						,'
						inner join provinces on provinces.id = districts.provincesId ', 
						if(in_provincesId  <>  '' , concat(' and provinces.id in (',in_provincesId,') '),' '), 
						'
						
					 )on damages.targetsId = targets.id
				 where     
					 targets.status = 1
					 and targets.finalLevel = 1
				group by targets.id,damages.id 
				)targets
				  group by targets.id
			)
            '
                                 
			);	
            
        
	        PREPARE stmt0 FROM @sql0;
			EXECUTE stmt0;


 
	  DROP TEMPORARY TABLE IF EXISTS temp_list_tagerts_parent1;
	  CREATE TEMPORARY TABLE temp_list_tagerts_parent1(
      select parent.id , parent.targetsName, parent.targetsCode ,parent.parentId,  parent.unitName,
               sum(value)  as value   
      from temp_list_finalTargets as targets
      inner join targets as parent on parent.id = targets.parentId
      group by parent.id
	  );


	  DROP TEMPORARY TABLE IF EXISTS temp_list_tagerts_parent2;
	  CREATE TEMPORARY TABLE temp_list_tagerts_parent2(
      select parent.id , parent.targetsName, parent.targetsCode ,parent.parentId,parent.unitName,
               sum(value)  as value   
      from temp_list_tagerts_parent1 as targets
      inner join targets as parent on parent.id = targets.parentId
      group by parent.id
	  );
      
	  DROP TEMPORARY TABLE IF EXISTS temp_list_tagerts_parent3;
	  CREATE TEMPORARY TABLE temp_list_tagerts_parent3(
      select parent.id , parent.targetsName, parent.targetsCode ,parent.parentId,parent.unitName,
               sum(value)  as value   
      from temp_list_tagerts_parent2 as targets
      inner join targets as parent on parent.id = targets.parentId
      group by parent.id
	  );
     
     
     select * from (
      select * from temp_list_finalTargets
      union 
      select * from temp_list_tagerts_parent1
      union
      select * from temp_list_tagerts_parent2
      union
      select * from temp_list_tagerts_parent3
     )targets 
     order by targets.targetsCode asc;
     
  
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_disasters_count` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_disasters_count`(
    in in_disasterGroupsId varchar(200),
	in in_provincesId varchar(200),
    in in_districtsId varchar(200),
    in in_wardsId varchar(200),
    in in_FromDate varchar(200),
	in in_ToDate varchar(200)
)
BEGIN
 -- 	call thiethai.sp_disasters_count('', '', '', '', '', '');
        DECLARE sqlWhere  varchar(20000) COLLATE utf8mb3_unicode_ci;

		
		set sqlWhere =  concat(' ',			
			 if(in_FromDate <> '' ,concat('and disasters.disasterTimeStart >= "',in_FromDate,'" '),''),
			 if(in_ToDate <> '' ,concat('and disasters.disasterTimeStart < "',in_ToDate,'" +  interval 1 day  '),''),
			 ' '
		   );




			SET @sql0 = concat('
				select count(distinct disasters.id) as countDisasters
					from
					(
						select disasters.id
						  FROM
								`disasters` AS `disasters`
									INNER JOIN
								`disasterGroupsDisasters` AS `disasterGroupsDisasters` ON `disasterGroupsDisasters`.`disastersId` = `disasters`.`id` 
								 ',
									 if(in_disasterGroupsId  <>  '' , concat('and( disasterGroupsDisasters.disasterGroupsId in (',in_disasterGroupsId,') )'),'')
								 ,'
							 WHERE 
								 	  disasters.status = 1 ', sqlWhere ,'
							group by disasters.id
					)disasters
						INNER JOIN
								`disastersAffectedAreas` AS `disastersAffectedAreas` ON `disastersAffectedAreas`.`disastersId` = `disasters`.`id` 
								 ',
										 if(in_provincesId  <>  '' , concat('and( disastersAffectedAreas.provincesId in (',in_provincesId,') )'),''),
										 if(in_districtsId  <>  '' , concat('and( disastersAffectedAreas.districtsId in (',in_districtsId,') )'),''),
										 if(in_wardsId  <>  '' , concat('and( disastersAffectedAreas.wardsId in (',in_wardsId,') )'),'')
								 ,''
			);		
	--    select @sql0;
	        PREPARE stmt0 FROM @sql0;
			EXECUTE stmt0;
	
    
          	SET @sql1 = concat('
				select count(distinct disasters.id) as countDisasters
					from
					(
						select disasters.id
						  FROM
								`disasters` AS `disasters`
									INNER JOIN
								`disasterGroupsDisasters` AS `disasterGroupsDisasters` ON `disasterGroupsDisasters`.`disastersId` = `disasters`.`id` 
								 ',
									 if(in_disasterGroupsId  <>  '' , concat('and( disasterGroupsDisasters.disasterGroupsId in (',in_disasterGroupsId,') )'),'')
								 ,'
							 WHERE 
								  disasters.status = 1
                                  and (disasterTimeStart <= current_date() and (isnull(disasterTimeEnd)  or disasterTimeEnd >= current_date()))
                                 ', sqlWhere ,
							   '
							group by disasters.id
					)disasters
						INNER JOIN
								`disastersAffectedAreas` AS `disastersAffectedAreas` ON `disastersAffectedAreas`.`disastersId` = `disasters`.`id` 
								 ',
										 if(in_provincesId  <>  '' , concat('and( disastersAffectedAreas.provincesId in (',in_provincesId,') )'),''),
										 if(in_districtsId  <>  '' , concat('and( disastersAffectedAreas.districtsId in (',in_districtsId,') )'),''),
										 if(in_wardsId  <>  '' , concat('and( disastersAffectedAreas.wardsId in (',in_wardsId,') )'),'')
								 ,''
			);		
	--    select @sql1;
	        PREPARE stmt1 FROM @sql1;
			EXECUTE stmt1;





	

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_disasters_count_by_disasterGroupsId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_disasters_count_by_disasterGroupsId`(
    in in_disasterGroupsId varchar(200),
	in in_provincesId varchar(200),
    in in_districtsId varchar(200),
    in in_wardsId varchar(200),
    in in_FromDate varchar(200),
	in in_ToDate varchar(200)
)
BEGIN
 -- 	call thiethai.sp_disasters_count('', '', '', '', '', '');
        DECLARE sqlWhere  varchar(20000) COLLATE utf8mb3_unicode_ci;

		
		set sqlWhere =  concat(' ',			
			 if(in_FromDate <> '' ,concat('and disasters.disasterTimeStart >= "',in_FromDate,'" '),''),
			 if(in_ToDate <> '' ,concat('and disasters.disasterTimeStart < "',in_ToDate,'" +  interval 1 day  '),''),
			 if(in_disasterGroupsId  <>  '' , concat('and( disasterGroupsDisasters.disasterGroupsId in (',in_disasterGroupsId,') )'),''),
			 ' '
		);



	   SET @sql0 = concat('
            select    disasterGroups.id,disasterGroups.disasterGroupsName ,count(distinct disastersId) as countDisasters
            from (
				select 
                   disasterGroups.id,disasterGroups.disasterGroupsName ,disasters.id as disastersId
					from disasterGroups  
                    	INNER JOIN
								`disasterGroupsDisasters` AS `disasterGroupsDisasters` ON `disasterGroupsDisasters`.`disasterGroupsId` = `disasterGroups`.`id` 
						INNER JOIN
								`disasters` AS `disasters` ON `disasterGroupsDisasters`.`disastersId` = `disasters`.`id` 
						INNER JOIN
								`disastersAffectedAreas` AS `disastersAffectedAreas` ON `disastersAffectedAreas`.`disastersId` = `disasters`.`id` 
								 ',
										 if(in_provincesId  <>  '' , concat('and( disastersAffectedAreas.provincesId in (',in_provincesId,') )'),''),
										 if(in_districtsId  <>  '' , concat('and( disastersAffectedAreas.districtsId in (',in_districtsId,') )'),''),
										 if(in_wardsId  <>  '' , concat('and( disastersAffectedAreas.wardsId in (',in_wardsId,') )'),'')
								 ,' 	 
						 WHERE 
								 	  disasters.status = 1 ', sqlWhere ,'
                         group by  disasterGroups.id ,   disasters.id      
                      )disasterGroups    group by       disasterGroups.id      '
			);		
	   --   select @sql0;
	        PREPARE stmt0 FROM @sql0;
			EXECUTE stmt0;
	
    
  





	

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_disasters_get_all` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_disasters_get_all`(
    in in_id varchar(200),
    in in_disastersName varchar(200) COLLATE utf8mb3_unicode_ci,
    in in_disasterGroupsId varchar(200),
	in in_provincesId varchar(200),
    in in_districtsId varchar(200),
    in in_wardsId varchar(200),
      in in_isActive int,  -- 0 
    in in_status int, 
  
    in in_FromDate varchar(200),
	in in_ToDate varchar(200),
	in in_orderBy varchar(200),
	in in_order varchar(200)
)
BEGIN
 -- 	call thiethai.sp_disasters_get_all('', '', '', '', '', '', 1,1, '', '', 'id', 'asc');
     DECLARE sqlWhere  varchar(20000) COLLATE utf8mb3_unicode_ci;

		
		set sqlWhere =  concat(' ',
			 if(in_id  <>  '' , concat('and( disasters.id in (',in_id,') )'),''),
             if(in_isActive   = 1 , concat(' and (disasterTimeStart <= current_date() and (isnull(disasterTimeEnd)  or disasterTimeEnd >= current_date()))'),''),
			 if(in_isActive   = -1 , concat(' and (disasterTimeStart > current_date()  or disasterTimeEnd < current_date() )'),''),
		

			 if(in_status <> -99,concat(' and (disasters.status =  ',in_status ,')'),''),
			 if(in_disastersName <> '',
				  concat('and (
							   lower(disasters.disastersName) like  concat("%",CONVERT(lower("',in_disastersName,'"), BINARY),"%") )
						 '),''
			 ),
			
			 if(in_FromDate <> '' ,concat('and disasters.disasterTimeStart >= "',in_FromDate,'" '),''),
			 if(in_ToDate <> '' ,concat('and disasters.disasterTimeStart < "',in_ToDate,'" +  interval 1 day  '),''),
			 ' '
		   );




			SET @sql0 = concat('
				select disasters.*
                
               
                
                from
                (
					select disasters.id, disastersName,point,
				       	icon as icon , disasterTimeStart
					  FROM
							`disasters` AS `disasters`
								INNER JOIN
							`disasterGroupsDisasters` AS `disasterGroupsDisasters` ON `disasterGroupsDisasters`.`disastersId` = `disasters`.`id` 
							 ',
								 if(in_disasterGroupsId  <>  '' , concat('and( disasterGroupsDisasters.disasterGroupsId in (',in_disasterGroupsId,') )'),'')
							 ,'
								INNER JOIN
							`disasterGroups` AS `disasterGroups` ON `disasterGroups`.`id` = `disasterGroupsDisasters`.`disasterGroupsId`
						 WHERE 
							 1 ', sqlWhere ,'
						group by disasters.id
				)disasters
                	INNER JOIN
							`disastersAffectedAreas` AS `disastersAffectedAreas` ON `disastersAffectedAreas`.`disastersId` = `disasters`.`id` 
							 ',
									 if(in_provincesId  <>  '' , concat('and( disastersAffectedAreas.provincesId in (',in_provincesId,') )'),''),
									 if(in_districtsId  <>  '' , concat('and( disastersAffectedAreas.districtsId in (',in_districtsId,') )'),''),
									 if(in_wardsId  <>  '' , concat('and( disastersAffectedAreas.wardsId in (',in_wardsId,') )'),'')
							 ,'
						INNER JOIN
					`provinces` AS `provinces` ON `provinces`.`id` = `disastersAffectedAreas`.`provincesId`
				group by disasters.id
                order by disasters.',in_orderBy,' ',in_order
			);		
	   
	        PREPARE stmt0 FROM @sql0;
			EXECUTE stmt0;
	





	

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_disasters_get_list` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_disasters_get_list`(
    in in_id varchar(200),
    in in_disastersName varchar(200) COLLATE utf8mb3_unicode_ci,
    in in_disasterGroupsId varchar(200),
	in in_provincesId varchar(200),
    in in_districtsId varchar(200),
    in in_wardsId varchar(200),
     in in_isActive int, 
    in in_status int, 
    in in_FromDate varchar(200),
	in in_ToDate varchar(200),
	in in_orderBy varchar(200),
	in in_order varchar(200),
    in in_attributes varchar(500),
	in in_start_page int,
    in in_end_page int
)
BEGIN
 	-- 	call thiethai.sp_disasters_get_list('1,2', '', '', '', '', '',1, 1, '', '', 'id', 'asc', '', 0, 20);
     DECLARE sqlWhere  varchar(20000) COLLATE utf8mb3_unicode_ci;
    if(in_attributes = '') then 
     set in_attributes = 'disasters.id,disasters.disastersName,address,disasterTimeStart,disasterTimeEnd,point,disasters.dateCreated
     ';
    end if;



	

		set sqlWhere =  concat(' ',
			 if(in_id  <>  '' , concat('and( disasters.id in (',in_id,') )'),''),
			
				if(in_isActive   = 1 , concat(' and (disasterTimeStart <= current_date() and (isnull(disasterTimeEnd)  or disasterTimeEnd >= current_date()))'),''),
			 if(in_isActive   = -1 , concat(' and (disasterTimeStart > current_date()  or disasterTimeEnd < current_date() )'),''),
			 if(in_status <> -99,concat(' and (disasters.status =  ',in_status ,')'),''),
			 if(in_disastersName <> '',
				  concat('and (
							   lower(disasters.disastersName) like  concat("%",CONVERT(lower("',in_disastersName,'"), BINARY),"%") )
						 '),''
			 ),
			
			 if(in_FromDate <> '' ,concat('and disasters.disasterTimeStart >= "',in_FromDate,'" '),''),
			 if(in_ToDate <> '' ,concat('and disasters.disasterTimeStart < "',in_ToDate,'" +  interval 1 day  '),''),
			 ' '
		   );




			SET @sql0 = concat('
				select ',in_attributes,',disasterGroups,
                json_arrayagg(json_object("id",disastersAffectedAreas.id,"provincesId",disastersAffectedAreas.provincesId,"districtsId",disastersAffectedAreas.districtsId,"districtsName",districts.districtName
                ,"wardsId",disastersAffectedAreas.wardsId,"wardsName",wards.wardName
                ,"provinces",json_object("id",provinces.id,"provinceName",provinceName)
                
                )) as disastersAffectedAreas
                
                from
                (
					select disasters.*, 
						json_arrayagg(json_object("id",disasterGroups.id,"disasterGroupsName",disasterGroupsName,"icon",icon)) as disasterGroups
					  FROM
							`disasters` AS `disasters`
								INNER JOIN
							`disasterGroupsDisasters` AS `disasterGroupsDisasters` ON `disasterGroupsDisasters`.`disastersId` = `disasters`.`id` 
							 ',
								 if(in_disasterGroupsId  <>  '' , concat('and( disasterGroupsDisasters.disasterGroupsId in (',in_disasterGroupsId,') )'),'')
							 ,'
								INNER JOIN
							`disasterGroups` AS `disasterGroups` ON `disasterGroups`.`id` = `disasterGroupsDisasters`.`disasterGroupsId`
						 WHERE 
							 1 ', sqlWhere ,'
						group by disasters.id
				)disasters
                	INNER JOIN
							`disastersAffectedAreas` AS `disastersAffectedAreas` ON `disastersAffectedAreas`.`disastersId` = `disasters`.`id` 
							 ',
									 if(in_provincesId  <>  '' , concat('and( disastersAffectedAreas.provincesId in (',in_provincesId,') )'),''),
									 if(in_districtsId  <>  '' , concat('and( disastersAffectedAreas.districtsId in (',in_districtsId,') )'),''),
									 if(in_wardsId  <>  '' , concat('and( disastersAffectedAreas.wardsId in (',in_wardsId,') )'),'')
							 ,'
						INNER JOIN
					`provinces` AS `provinces` ON `provinces`.`id` = `disastersAffectedAreas`.`provincesId` ',
                    ' INNER JOIN
					`districts` AS `districts` ON `districts`.`id` = `disastersAffectedAreas`.`districtsId` ' ,
                     
				    ' INNER JOIN
					`wards` AS `wards` ON `wards`.`id` = `disastersAffectedAreas`.`wardsId`'
                    ,
                    '
				group by disasters.id
                order by disasters.',in_orderBy,' ',in_order,
                ' limit ',in_start_page,',', in_end_page
			);		
		   

	




			PREPARE stmt0 FROM @sql0;
			EXECUTE stmt0;
		   
			SET @sql2= concat('
				select count(distinct disasters.id)  as count from
                (
					select disasters.id
						
					  FROM
							`disasters` AS `disasters`
								INNER JOIN
							`disasterGroupsDisasters` AS `disasterGroupsDisasters` ON `disasterGroupsDisasters`.`disastersId` = `disasters`.`id` 
							 ',
								 if(in_disasterGroupsId  <>  '' , concat('and( disasterGroupsDisasters.disasterGroupsId in (',in_disasterGroupsId,') )'),'')
							 ,'
								INNER JOIN
							`disasterGroups` AS `disasterGroups` ON `disasterGroups`.`id` = `disasterGroupsDisasters`.`disasterGroupsId`
						 WHERE 
							 1 ', sqlWhere ,'
						group by disasters.id
				)disasters
                	INNER JOIN
							`disastersAffectedAreas` AS `disastersAffectedAreas` ON `disastersAffectedAreas`.`disastersId` = `disasters`.`id` 
							 ',
									 if(in_provincesId  <>  '' , concat('and( disastersAffectedAreas.provincesId in (',in_provincesId,') )'),''),
									 if(in_districtsId  <>  '' , concat('and( disastersAffectedAreas.districtsId in (',in_districtsId,') )'),''),
									 if(in_wardsId  <>  '' , concat('and( disastersAffectedAreas.wardsId in (',in_wardsId,') )'),'')
							 ,'
						INNER JOIN
					`provinces` AS `provinces` ON `provinces`.`id` = `disastersAffectedAreas`.`provincesId`
				
                '
			);			
		   
			select @sql2;
            select @sql1;
			PREPARE stmt2 FROM @sql2;
			EXECUTE stmt2;
	

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_get_atlas_statistic_kinh_te` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_get_atlas_statistic_kinh_te`(
    in in_targetsId varchar(200),
    in in_disasterGroupsId varchar(200),
	in in_provincesId varchar(200),
    in in_districtsId varchar(200),
    in in_wardsId varchar(200),
    in in_FromDate varchar(200),
	in in_ToDate varchar(200)
)
BEGIN

	   SET @sql0 = concat('
			    select 
                   	provinces.id as id,
								provinceName, 
                                points,
                               
                    sum(value)  as value   from    
				 (
				 

							select 
								provinces.id as id,
								provinceName, 
                                provinces.points,
								damages.id as damagesId,
								damages.value
									from damages 
										INNER JOIN
												`disasters` AS `disasters` ON `damages`.`disastersId` = `disasters`.`id` 
										INNER JOIN
												`disasterGroupsDisasters` AS `disasterGroupsDisasters` ON `disasterGroupsDisasters`.`disastersId` = `disasters`.`id` 
                                                	',			
		                              	 if(in_disasterGroupsId  <>  '' , concat('and( disasterGroupsDisasters.disasterGroupsId in (',in_disasterGroupsId,') )'),'')
													 ,'
										INNER JOIN
												`disasterGroups` AS `disasterGroups` ON `disasterGroupsDisasters`.`disasterGroupsId` = `disasterGroups`.`id` 
												INNER JOIN
												`wards` AS `wards` ON `wards`.`id` = `damages`.`wardsId` 
										',
												 if(in_wardsId  <>  '' , concat('and( wards.id in (',in_wardsId,') )'),'')
												
										 ,'
                                         INNER JOIN
												`districts` AS `districts` ON `districts`.`id` = `wards`.`districtsId`
                                                ',
												  if(in_districtsId  <>  '' , concat('and( districts.id in (',in_districtsId,') )'),'')
												
										 ,'
										 INNER JOIN
												`provinces` AS `provinces` ON `provinces`.`id` = `districts`.`provincesId`
										',
												 if(in_provincesId  <>  '' , concat('and( provinces.id in (',in_provincesId,') )'),'')
												
										 ,'
                                         
										
                                                where 
													  disasters.status = 1 and 	damages.value > 0
                                                      ',
                                                      	 if(in_FromDate <> '' ,concat('and disasters.disasterTimeStart >= "',in_FromDate,'" '),''),
														 if(in_ToDate <> '' ,concat('and disasters.disasterTimeStart < "',in_ToDate,'" +  interval 1 day  '),''),
                                                          if(in_targetsId  <>  '' , concat('and(damages.targetsId in (',in_targetsId,') )'),'')
                                                      ,'
										 group by  provinces.id,     damages.id
										 ) provinces   
								  
										 group by provinces.id     
                     '
			);		

	        PREPARE stmt0 FROM @sql0;
			EXECUTE stmt0;
	
    
  





	

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_get_atlas_statistic_nguoi` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_get_atlas_statistic_nguoi`(
    in in_disasterGroupsId varchar(200),
	in in_provincesId varchar(200),
    in in_districtsId varchar(200),
     in in_wardsId varchar(200),
	in in_FromYearOld int(11) , -- 0
    in in_ToYearOld int(11) , -- 0
    in in_gender int(11) , -- 99
    in in_isVulnerablePersons int(11), -- 0
   
    in in_FromDate varchar(200),
	in in_ToDate varchar(200)
   
)
BEGIN


	   SET @sql0 = concat('
            
				select 
                  provinces.id as id,
								provinceName, 
                                provinces.points,
								count(distinct humanDamages.id) as countHumanDamages
					from humanDamages  
                        INNER JOIN
								`disasters` AS `disasters` ON `humanDamages`.`disastersId` = `disasters`.`id`
                                ', 
									'
                    	INNER JOIN
								`disasterGroupsDisasters` AS `disasterGroupsDisasters` ON `disasterGroupsDisasters`.`disastersId` = `disasters`.`id` ',
                              if(in_disasterGroupsId  <>  '' , concat('and( disasterGroupsDisasters.disasterGroupsId in (',in_disasterGroupsId,') )'),'')
                                 , '
						INNER JOIN
								`disasterGroups` AS `disasterGroups` ON `disasterGroupsDisasters`.`disasterGroupsId` = `disasterGroups`.`id` 
                                  ',
									if(in_disasterGroupsId  <>  '' , concat('and( disasterGroupsDisasters.disasterGroupsId in (',in_disasterGroupsId,') )'),'')
                                 ,'
						INNER JOIN
										`wards` AS `wards` ON `wards`.`id` = `humanDamages`.`wardsId` 
								',
										 if(in_wardsId  <>  '' , concat('and( wards.id in (',in_wardsId,') )'),'')
										
								 ,'
							 INNER JOIN
									`districts` AS `districts` ON `districts`.`id` = `wards`.`districtsId`
									',
									  if(in_districtsId  <>  '' , concat('and( districts.id in (',in_districtsId,') )'),'')
									
							 ,'
							 INNER JOIN
									`provinces` AS `provinces` ON `provinces`.`id` = `districts`.`provincesId`
							',
									 if(in_provincesId  <>  '' , concat('and( provinces.id in (',in_provincesId,') )'),'')
									
							 ,'
						 WHERE 
								 	  disasters.status = 1 '
                                      ,			
							 if(in_FromDate <> '' ,concat('and disasters.disasterTimeStart >= "',in_FromDate,'" '),''),
							 if(in_ToDate <> '' ,concat('and disasters.disasterTimeStart < "',in_ToDate,'" +  interval 1 day  '),''),
                             if(in_FromYearOld <> 0 ,concat('and year(humanDamages.time) - yearOfBirth  >= "',in_FromYearOld,'"  '),''),
                             if(in_ToYearOld <> 0 ,concat('and year(humanDamages.time) - yearOfBirth  <= "',in_FromYearOld,'"  '),''),
                             if(in_gender <> -99 ,concat('and humanDamages.gender  = "',in_gender,'"  '),''),
                               if(in_isVulnerablePersons <> 0 ,concat('and humanDamages.vulnerablePersonsId  >0 '),'')

							 ,'
                         group by  provinces.id    
                       '
			);		
            

	        PREPARE stmt0 FROM @sql0;
			EXECUTE stmt0;
	
    
  





	

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_get_atlas_statistic_su_kien_thien_tai` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_get_atlas_statistic_su_kien_thien_tai`(
    in in_disasterGroupsId varchar(200),
	in in_provincesId varchar(200),
    in in_districtsId varchar(200),
    in in_wardsId varchar(200),
    in in_FromDate varchar(200),
	in in_ToDate varchar(200)
)
BEGIN
/*
	--	set sqlWhere =  concat(' 
	--		,
	--		 ' '
	--	);
*/

	   SET @sql0 = concat('
            
				select 
                  provinces.id as id,
								provinceName, 
                                provinces.points,
								count(distinct disasters.id) as countDisasters
					from disasters  
                    	INNER JOIN
								`disasterGroupsDisasters` AS `disasterGroupsDisasters` ON `disasterGroupsDisasters`.`disastersId` = `disasters`.`id`
                                ',
									if(in_disasterGroupsId  <>  '' , concat('and( disasterGroupsDisasters.disasterGroupsId in (',in_disasterGroupsId,') )'),'')
                                 ,'
						INNER JOIN
								`disasterGroups` AS `disasterGroups` ON `disasterGroupsDisasters`.`disasterGroupsId` = `disasterGroups`.`id` 
						INNER JOIN
								`disastersAffectedAreas` AS `disastersAffectedAreas` ON `disastersAffectedAreas`.`disastersId` = `disasters`.`id` 
								 ',
										 if(in_provincesId  <>  '' , concat('and( disastersAffectedAreas.provincesId in (',in_provincesId,') )'),''),
										 if(in_districtsId  <>  '' , concat('and( disastersAffectedAreas.districtsId in (',in_districtsId,') )'),''),
										 if(in_wardsId  <>  '' , concat('and( disastersAffectedAreas.wardsId in (',in_wardsId,') )'),'')
								 ,'
						INNER JOIN
												`provinces` AS `provinces` ON `provinces`.`id` = `disastersAffectedAreas`.`provincesId`
						 WHERE 
								 	  disasters.status = 1 '
                                      ,			
							 if(in_FromDate <> '' ,concat('and disasters.disasterTimeStart >= "',in_FromDate,'" '),''),
							 if(in_ToDate <> '' ,concat('and disasters.disasterTimeStart < "',in_ToDate,'" +  interval 1 day  '),'')
							 ,'
                         group by  provinces.id    
                       '
			);		
            
            
	     --    select @sql0;
	        PREPARE stmt0 FROM @sql0;
			EXECUTE stmt0;
	
    
  





	

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_get_statistic` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_get_statistic`(
    in in_targetsId varchar(200),
    in in_disasterGroupsId varchar(200),
	in in_provincesId varchar(200),
    in in_districtsId varchar(200),
    in in_wardsId varchar(200),
    in in_FromDate varchar(200),
	in in_ToDate varchar(200)
)
BEGIN

 -- 	call thiethai.sp_disasters_count('', '', '', '', '', '');
        DECLARE sqlWhere  varchar(20000) COLLATE utf8mb3_unicode_ci;

		
		set sqlWhere =  concat(' ',			
			 if(in_FromDate <> '' ,concat('and disasters.disasterTimeStart >= "',in_FromDate,'" '),''),
			 if(in_ToDate <> '' ,concat('and disasters.disasterTimeStart < "',in_ToDate,'" +  interval 1 day  '),''),
			 if(in_disasterGroupsId  <>  '' , concat('and( disasterGroupsDisasters.disasterGroupsId in (',in_disasterGroupsId,') )'),''),
             if(in_targetsId  <>  '' , concat('and( targets.id in (',in_targetsId,') )'),''),
			 ' '
		);



	   SET @sql0 = concat('
			   select  targets.id  , targets.targetsName , sum(value)  as value , sum(quantity)  as quantity from    (select 
                   targets.id as targetsId ,targets.parentId as parentId ,targets.targetsName,damages.id as damagesId,damages.value,damages.quantity
					from targets 
                    left JOIN (
								`damages` AS `damages`
						INNER JOIN
								`disasters` AS `disasters` ON `damages`.`disastersId` = `disasters`.`id` 
						INNER JOIN
								`disasterGroupsDisasters` AS `disasterGroupsDisasters` ON `disasterGroupsDisasters`.`disastersId` = `disasters`.`id` 
						INNER JOIN
								`disastersAffectedAreas` AS `disastersAffectedAreas` ON `disastersAffectedAreas`.`disastersId` = `disasters`.`id` 
								 ) ON `damages`.`targetsId` = `targets`.`id` 	 
						 WHERE 
								 	  disasters.status = 1 
                         group by  targets.id ,   damages.id) children   
                         inner join targets on targets.id = children.parentId 
                         group by targets.id      
                     '
			);		
	   --   select @sql0;
	        PREPARE stmt0 FROM @sql0;
			EXECUTE stmt0;
	
    
  





	

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_get_statistic_many` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_get_statistic_many`(
    in in_targetsId varchar(200),
    in in_disasterGroupsId varchar(200),
	in in_provincesId varchar(200),
    in in_districtsId varchar(200),
    in in_wardsId varchar(200),
    in in_FromDate varchar(200),
	in in_ToDate varchar(200)
)
BEGIN




	   SET @sql0 = concat('
			    select   disasterGroups.id,disasterGroups.disasterGroupsName ,parentId, targetsName, sum(value)  as value , sum(quantity)  as quantity from    
				 (
				 

							select 
							  
								disasterGroups.id as id,
								disasterGroups.disasterGroupsName, 
								damages.value,
                                targets.parentId,
                                targets.targetsName,
								damages.quantity
									from targets 
                                    INNER JOIN
														`statisticSettings` AS `statisticSettings` ON `statisticSettings`.`targetsId` = `targets`.`parentId`
										left JOIN
											(`damages` AS `damages` 
													
												INNER JOIN
														`disasters` AS `disasters` ON `damages`.`disastersId` = `disasters`.`id` and  disasters.status = 1 
												INNER JOIN
														`disasterGroupsDisasters` AS `disasterGroupsDisasters` ON `disasterGroupsDisasters`.`disastersId` = `disasters`.`id` 
															',			
												 if(in_disasterGroupsId  <>  '' , concat('and( disasterGroupsDisasters.disasterGroupsId in (',in_disasterGroupsId,') )'),'')
															 ,'
												INNER JOIN
														`disasterGroups` AS `disasterGroups` ON `disasterGroupsDisasters`.`disasterGroupsId` = `disasterGroups`.`id` 
														INNER JOIN
														`wards` AS `wards` ON `wards`.`id` = `damages`.`wardsId` 
												',
														 if(in_wardsId  <>  '' , concat('and( wards.id in (',in_wardsId,') )'),'')
														
												 ,'
												 INNER JOIN
														`districts` AS `districts` ON `districts`.`id` = `wards`.`districtsId`
														',
														  if(in_districtsId  <>  '' , concat('and( districts.id in (',in_districtsId,') )'),'')
														
												 ,'
												 INNER JOIN
														`provinces` AS `provinces` ON `provinces`.`id` = `districts`.`provincesId`
												',
														 if(in_provincesId  <>  '' , concat('and( provinces.id in (',in_provincesId,') )'),'')
														
												 ,'
                                               )   ON `targets`.`id` = `damages`.`targetsId` 
										 WHERE 
													  targets.finalLevel = 1
                                                      ',
                                                      				
													
														 
                                                      	 if(in_FromDate <> '' ,concat('and disasters.disasterTimeStart >= "',in_FromDate,'" '),''),
														 if(in_ToDate <> '' ,concat('and disasters.disasterTimeStart < "',in_ToDate,'" +  interval 1 day  '),'')
                                                      ,'
										 group by  disasterGroups.id,parentId,     damages.id
										 ) disasterGroups   
								          
										 group by disasterGroups.id ,parentId    
                     '
			);		
            
	
	        PREPARE stmt0 FROM @sql0;
			EXECUTE stmt0;
	
    
  





	

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_get_statistic_nguoi` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_get_statistic_nguoi`(
    in in_disasterGroupsId varchar(200),
    in_vulnerablePersonsId varchar(200),
	in in_provincesId varchar(200),
    in in_districtsId varchar(200),
     in in_wardsId varchar(200),
	in in_FromYearOld int(11) , -- 0
    in in_ToYearOld int(11) , -- 0
    in in_gender int(11) , -- 99
    in in_isVulnerablePersons int(11), -- 0
   
    in in_FromDate varchar(200),
	in in_ToDate varchar(200)
   
)
BEGIN


	   SET @sql0 = concat('
            
				select 
                  disasterGroups.id as id,
								disasterGroupsName, 
                           
								count(distinct humanDamages.id) as countHumanDamages,
                                sum(case when gender = 1 then 1 else 0 end) as ''countNam'',
						sum(case when gender = 0 then 1 else 0 end) as ''countNu''
					from humanDamages  
                        INNER JOIN
								`disasters` AS `disasters` ON `humanDamages`.`disastersId` = `disasters`.`id`
                                ',
									'
                    	INNER JOIN
								`disasterGroupsDisasters` AS `disasterGroupsDisasters` ON `disasterGroupsDisasters`.`disastersId` = `disasters`.`id` ',
                                if(in_disasterGroupsId  <>  '' , concat('and( disasterGroupsDisasters.disasterGroupsId in (',in_disasterGroupsId,') )'),'')
                                 , '
                              
						INNER JOIN
								`disasterGroups` AS `disasterGroups` ON `disasterGroupsDisasters`.`disasterGroupsId` = `disasterGroups`.`id` 
                                  ',
									if(in_disasterGroupsId  <>  '' , concat('and( disasterGroupsDisasters.disasterGroupsId in (',in_disasterGroupsId,') )'),'')
                                 ,'
                        INNER JOIN
								`vulnerablePersons` AS `vulnerablePersons` ON `humanDamages`.`vulnerablePersonsId` = `vulnerablePersons`.`id`         
                                 ',
                                 if(in_vulnerablePersonsId  <>  '' , concat('and( humanDamages.vulnerablePersonsId in (',in_vulnerablePersonsId,') )'),'')
                                 ,
                                 '
						INNER JOIN
										`wards` AS `wards` ON `wards`.`id` = `humanDamages`.`wardsId` 
								',
										 if(in_wardsId  <>  '' , concat('and( wards.id in (',in_wardsId,') )'),'')
										
								 ,'
							 INNER JOIN
									`districts` AS `districts` ON `districts`.`id` = `wards`.`districtsId`
									',
									  if(in_districtsId  <>  '' , concat('and( districts.id in (',in_districtsId,') )'),'')
									
							 ,'
							 INNER JOIN
									`provinces` AS `provinces` ON `provinces`.`id` = `districts`.`provincesId`
							',
									 if(in_provincesId  <>  '' , concat('and( provinces.id in (',in_provincesId,') )'),'')
									
							 ,'
						 WHERE 
								 	  disasters.status = 1 '
                                      ,			
							 if(in_FromDate <> '' ,concat('and disasters.disasterTimeStart >= "',in_FromDate,'" '),''),
							 if(in_ToDate <> '' ,concat('and disasters.disasterTimeStart < "',in_ToDate,'" +  interval 1 day  '),''),
                             if(in_FromYearOld <> 0 ,concat('and year(humanDamages.time) - yearOfBirth  >= "',in_FromYearOld,'"  '),''),
                             if(in_ToYearOld <> 0 ,concat('and year(humanDamages.time) - yearOfBirth  <= "',in_FromYearOld,'"  '),''),
                             if(in_gender <> -99 ,concat('and humanDamages.gender  = "',in_gender,'"  '),''),
                               if(in_isVulnerablePersons <> 0 ,concat('and humanDamages.vulnerablePersonsId  >0 '),'')

							 ,'
                         group by  disasterGroups.id    
                       '
			);		
            set @sql1 = concat('select sum(count.countHumanDamages) as totalDamages from  (' , @sql0, ') as count')  ;
            
            PREPARE stmt1 FROM @sql1;
			EXECUTE stmt1;
            
	        PREPARE stmt0 FROM @sql0;
			EXECUTE stmt0;
            
            
             
	
    
  





	

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_get_statistic_one` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_get_statistic_one`(
    in in_targetsId varchar(200),
    in in_disasterGroupsId varchar(200),
	in in_provincesId varchar(200),
    in in_districtsId varchar(200),
    in in_wardsId varchar(200),
    in in_FromDate varchar(200),
	in in_ToDate varchar(200)
)
BEGIN




	   SET @sql0 = concat('
			    select   disasterGroups.id,disasterGroups.disasterGroupsName , sum(value)  as value , sum(quantity)  as quantity from    
				 (
				 

							select 
							  
								disasterGroups.id as id,
								disasterGroups.disasterGroupsName, 
								damages.value,
								damages.quantity
									from damages 
											INNER JOIN
												`targets` AS `targets` ON `targets`.`id` = `damages`.`targetsId` 
														',			
													 if(in_targetsId  <>  '' , concat('and( targets.id in (',in_targetsId,') )'),'')
													 ,'
										INNER JOIN
												`disasters` AS `disasters` ON `damages`.`disastersId` = `disasters`.`id` 
										INNER JOIN
												`disasterGroupsDisasters` AS `disasterGroupsDisasters` ON `disasterGroupsDisasters`.`disastersId` = `disasters`.`id` 
                                                	',			
		                              	 if(in_disasterGroupsId  <>  '' , concat('and( disasterGroupsDisasters.disasterGroupsId in (',in_disasterGroupsId,') )'),'')
													 ,'
										INNER JOIN
												`disasterGroups` AS `disasterGroups` ON `disasterGroupsDisasters`.`disasterGroupsId` = `disasterGroups`.`id` 
										INNER JOIN
												`wards` AS `wards` ON `wards`.`id` = `damages`.`wardsId` 
										',
												 if(in_wardsId  <>  '' , concat('and( wards.id in (',in_wardsId,') )'),'')
												
										 ,'
                                         INNER JOIN
												`districts` AS `districts` ON `districts`.`id` = `wards`.`districtsId`
                                                ',
												  if(in_districtsId  <>  '' , concat('and( districts.id in (',in_districtsId,') )'),'')
												
										 ,'
										 INNER JOIN
												`provinces` AS `provinces` ON `provinces`.`id` = `districts`.`provincesId`
										',
												 if(in_provincesId  <>  '' , concat('and( provinces.id in (',in_provincesId,') )'),'')
												
										 ,'
										 WHERE 
													  disasters.status = 1 
                                                      ',
                                                      	 if(in_FromDate <> '' ,concat('and disasters.disasterTimeStart >= "',in_FromDate,'" '),''),
														 if(in_ToDate <> '' ,concat('and disasters.disasterTimeStart < "',in_ToDate,'" +  interval 1 day  '),'')
                                                      ,'
										 group by  disasterGroups.id,     damages.id
										 ) disasterGroups   
								  
										 group by disasterGroups.id     
                     '
			);		
            
	  --       select @sql0;
	        PREPARE stmt0 FROM @sql0;
			EXECUTE stmt0;
	
    
  





	

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_humanDamages_count` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_humanDamages_count`(
	in in_disasterGroupId varchar(200),
    in in_provincesId varchar(200),
    
    in in_districtsId varchar(200),
    in in_wardsId varchar(200),
    in in_FromDate varchar(200),
	in in_ToDate varchar(200)
	
)
BEGIN
		-- lỗi

        DECLARE sqlWhere  varchar(20000) COLLATE utf8mb3_unicode_ci;


		set sqlWhere =  concat(' ',			
			 if(in_FromDate <> '' ,concat('and damages.disasterTimeStart >= "',in_FromDate,'" '),''),
			 if(in_ToDate <> '' ,concat('and disasters.disasterTimeStart < "',in_ToDate,'" +  interval 1 day  '),''),
			 ' '
		   );

			SET @sql0 = concat(' 
				(
                select count(distinct  humanDamages.id) as count, provinces.id, provinces.points as provincePoint ,
json_arrayagg(json_object(''districtsid'',districts.id,''districtName'',districts.districtName, ''districtPoints'',
districts.points, ''wards'',json_object(''wardsId'',humanDamages.wardsId, ''wardName'',wards.wardName, ''wardsPoints'',wards.points))) as districts
  from humanDamages
left join vulnerablePersons on  vulnerablePersons.id = humanDamages.vulnerablePersonsId 
inner join  disasterGroupsDisasters on disasterGroupsDisasters.disastersId = humanDamages.disastersId ',
if (in_disasterGroupId <> '' , concat(' and disasterGroupsDisasters.disasterGroupsId in (',in_disasterGroupId,') '), '' ),
'inner join  wards on humanDamages.wardsId = wards.id ',
                 if (in_wardsId <> '' , concat(' and humanDamages.wardsId in (',in_wardsId,') '), '' ),
                 'inner join  districts on districts.id = wards.districtsId',
                 if (in_districtsId <> '' , concat(' and wards.districtsId in (',in_districtsId,') '), '' ),
                 '
				 inner join provinces on provinces.id = districts.provincesId
				',
                    if ( in_provincesId <> '' , concat('  and districts.provincesId in (',in_provincesId,') '), ' ' ) ,
                    'inner join disasters on humanDamages.disastersId = disasters.id ', sqlWhere ,
                    ' where humanDamages.disastersId in 
                    (select humanDamages.disastersId 
						from  
						humanDamages
                        inner join 
						disasterGroupsDisasters
						on humanDamages.disastersId = disasterGroupsDisasters.disastersId ',
					if (in_disasterGroupId <> '' , concat(' and disasterGroupsDisasters.disasterGroupsId in (',in_disasterGroupId,') '), '' ), '
						group by humanDamages.disastersId) ' ,
                     
						' group by disastersAffectedAreas.provincesId ) as a ' , 
                        ' 
                        left join 
                        (select 
                        humanDamages.disastersId as disastersId, 
                        humanDamages.fullname as name , 
                        humanDamages.address as address ,
                        disastersAffectedAreas.provincesId as provincesId,
						humanDamages.wardsId as wardsId 
                        from humanDamages 
						inner join disastersAffectedAreas 
                        on disastersAffectedAreas.disastersId = humanDamages.disastersId 
                        and disastersAffectedAreas.wardsId = humanDamages.wardsId
                        ) as b
						on a.area = b.provincesId 
                        group by a.count
                        
                        '
                        );
					
	     select @sql0;
	        PREPARE stmt1 FROM @sql0;
			EXECUTE stmt1;





	

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_humanDamages_countby_gender` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_humanDamages_countby_gender`(
	in in_disasterGroupId varchar(200),
    in in_vulnerablePersonsId varchar(200),
    in in_fromOld varchar(200),
    in in_toOld varchar(200),
    in in_FromDate varchar(200),
	in in_ToDate varchar(200)
)
BEGIN
 -- 	call thiethai.sp_humanDamages_countby_gender('1', '1,2,3', '', '', '', '');
        DECLARE sqlWhere  varchar(20000) COLLATE utf8mb3_unicode_ci;

		
		set sqlWhere =  concat(' ',			
			 if(in_FromDate <> '' ,concat('and disasters.disasterTimeStart >= "',in_FromDate,'" '),''),
			 if(in_ToDate <> '' ,concat('and disasters.disasterTimeStart < "',in_ToDate,'" +  interval 1 day  '),''),
			 ' '
		   );

			SET @sql0 = concat(' 
				select 
                sum(a.nam) as nam ,
                sum(a.nu) as nu  , 
                disasterGroupsDisasters.disasterGroupsId, 
                disasterGroups.disasterGroupsName 
                from
				(
					select 
						disasters.id as id, 
                        year(time) -yearOfBirth  as tuoi,
						sum(case when gender = 1 then 1 else 0 end) as ''nam'',
						sum(case when gender = 0 then 1 else 0 end) as ''nu''
						from humanDamages
						inner join 
                        vulnerablePersons 
                        on vulnerablePersons.id = humanDamages.vulnerablePersonsId ',
						if (in_vulnerablePersonsId <> '' , concat(' and humanDamages.vulnerablePersonsId in (',in_vulnerablePersonsId,') '), ' ' ),
						'inner join disasters 
                        on disasters.id = humanDamages.disastersId 
						where (year(time) -yearOfBirth) between ', in_fromOld , ' and ' , in_toOld , sqlWhere ,' group by  disasters.id ',

                        '
				) a
				inner join  disasterGroupsDisasters 
					on disasterGroupsDisasters.disastersId = a.id ', 
					if ( in_disasterGroupId <> '' , concat('  and  disasterGroupsDisasters.disasterGroupsId  in (',in_disasterGroupId,') '), ' ' ) ,
		
				'
				inner join disasterGroups 
					on disasterGroupsDisasters.disasterGroupsId = disasterGroups.id
				group by disasterGroupsDisasters.disasterGroupsId
				'
				);
				
	        PREPARE stmt1 FROM @sql0;
			EXECUTE stmt1;





	

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_request_by_target` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_request_by_target`(
	in in_disasterGroupsId varchar(200),
	in in_provincesId varchar(200),
    in in_districtsId varchar(200),
    in in_wardsId varchar(200),
    in in_FromDate varchar(200),
	in in_ToDate varchar(200)
)
BEGIN
 -- 	call thiethai.sp_response_sum('', '5', '', '', '', '', '');
 

	  DECLARE sqlWhere  varchar(20000) COLLATE utf8mb3_unicode_ci;
        
	  DROP TEMPORARY TABLE IF EXISTS temp_list_wards;
	  SET @sqlWard = concat('
       CREATE TEMPORARY TABLE temp_list_wards( 
         select    wards.id,
                   provinceName,
                   districtName,
                   wardName,
                   wards.id as wardsId,
				   districts.id as districtsId,
                   provinces.id as provincesId
			   from wards
                    	inner join districts on districts.id = wards.districtsId ',
						if(in_districtsId  <>  '' , concat(' and districts.id in (',in_districtsId,') '),' ')
						,'
						inner join provinces on provinces.id = districts.provincesId ', 
						if(in_provincesId  <>  '' , concat(' and provinces.id in (',in_provincesId,') '),' '), 
						'
					inner join 
					  ( damages
						inner join disasters on damages.disastersId = disasters.id ',
						 if(in_FromDate  <>  '' , concat(' and disasters.disasterTimeStart >= "',in_FromDate,'" '),' '),
						 if(in_ToDate  <>  '' , concat(' and disasters.in_ToDate <= "',in_ToDate,'" '),' ')
						,'
						inner join disasterGroupsDisasters on disasterGroupsDisasters.disastersId = disasters.id ',
						if(in_disasterGroupsId  <>  '' , concat(' and disasterGroupsDisasters.disasterGroupsId in (',in_disasterGroupsId,') '),' ')
						,'
                        inner join disasterGroups on disasterGroupsDisasters.disasterGroupsId = disasterGroups.id
					
						
					 )on damages.wardsId = wards.id
				 where     
					 wards.status = 1
                     ', 
						if(in_wardsId  <>  '' , concat(' and wards.id in (',in_wardsId,') '),' '),
					 '
				group by wards.id 
				
			)
            '
                                 
			);	  
        
            
	        PREPARE sqlWard FROM @sqlWard;
			EXECUTE sqlWard;

select * from temp_list_wards;
	  DROP TEMPORARY TABLE IF EXISTS temp_list_finalTargets;
	  SET @sql0 = concat('
       CREATE TEMPORARY TABLE temp_list_finalTargets( 
         select targets.id , targets.targetsName, targets.targetsCode ,parentId,finalLevel,
				   ifnull(damages.value,0) as  value,
                   disasters.id as disastersId,
                   disasters.disasterTimeStart,
                   disasters.disasterTimeEnd,
                   disastersName,
			        GROUP_CONCAT( disasterGroupsName  SEPARATOR ",") as disasterGroupsName,
                   provinceName,
                   districtName,
                   wardName,
                   wards.id as wardsId,
				   districts.id as districtsId,
                   provinces.id as provincesId
			   from targets
					left join 
					  ( damages
						inner join disasters on damages.disastersId = disasters.id ',
						 if(in_FromDate  <>  '' , concat(' and disasters.disasterTimeStart >= "',in_FromDate,'" '),' '),
						 if(in_ToDate  <>  '' , concat(' and disasters.in_ToDate <= "',in_ToDate,'" '),' ')
						,'
						inner join disasterGroupsDisasters on disasterGroupsDisasters.disastersId = disasters.id ',
						if(in_disasterGroupsId  <>  '' , concat(' and disasterGroupsDisasters.disasterGroupsId in (',in_disasterGroupsId,') '),' ')
						,'
                        inner join disasterGroups on disasterGroupsDisasters.disasterGroupsId = disasterGroups.id
						inner join wards on wards.id = damages.wardsId ', 
						if(in_wardsId  <>  '' , concat(' and wards.id in (',in_wardsId,') '),' '),
						'
						inner join districts on districts.id = wards.districtsId ',
						if(in_districtsId  <>  '' , concat(' and districts.id in (',in_districtsId,') '),' ')
						,'
						inner join provinces on provinces.id = districts.provincesId ', 
						if(in_provincesId  <>  '' , concat(' and provinces.id in (',in_provincesId,') '),' '), 
						'
						
					 )on damages.targetsId = targets.id
				 where     
					 targets.status = 1
					 and targets.finalLevel = 1
				group by damages.id 
				
			)
            '
                                 
			);	
            
        select @sql0;
	        PREPARE stmt0 FROM @sql0;
			EXECUTE stmt0;

 
        
	  DROP TEMPORARY TABLE IF EXISTS temp_list_tagerts_parent1;
	  CREATE TEMPORARY TABLE temp_list_tagerts_parent1(
      select parent.id , parent.targetsName, parent.targetsCode ,parent.parentId,
               sum(value)  as value   
      from temp_list_finalTargets as targets
      inner join targets as parent on parent.id = targets.parentId
      group by parent.id,targets.disastersId,targets.wardsId
	  );


	  DROP TEMPORARY TABLE IF EXISTS temp_list_tagerts_parent2;
	  CREATE TEMPORARY TABLE temp_list_tagerts_parent2(
      select parent.id , parent.targetsName, parent.targetsCode ,parent.parentId,
               sum(value)  as value   
      from temp_list_tagerts_parent1 as targets
      inner join targets as parent on parent.id = targets.parentId
     group by parent.id,targets.disastersId,targets.wardsId
	  );
      
	  DROP TEMPORARY TABLE IF EXISTS temp_list_tagerts_parent3;
	  CREATE TEMPORARY TABLE temp_list_tagerts_parent3(
      select parent.id , parent.targetsName, parent.targetsCode ,parent.parentId,
               sum(value)  as value   
      from temp_list_tagerts_parent2 as targets
      inner join targets as parent on parent.id = targets.parentId
      group by parent.id,targets.disastersId,targets.wardsId
	  );
     
     
     select * from (
      select * from temp_list_finalTargets
      union 
      select * from temp_list_tagerts_parent1
      union
      select * from temp_list_tagerts_parent2
      union
      select * from temp_list_tagerts_parent3
     )targets 
     order by targets.targetsCode asc;
     
     
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_request_province_details` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_request_province_details`(
	in in_disasterGroupsId varchar(200),
	in in_provincesId varchar(200),
    in in_districtsId varchar(200),
    in in_wardsId varchar(200),
    in in_FromDate varchar(200),
	in in_ToDate varchar(200)
)
BEGIN
 -- 	call thiethai.sp_request_province_details('', '', '', '', '', '');
        DECLARE sqlWhere  varchar(20000) COLLATE utf8mb3_unicode_ci;
        set sqlWhere =  concat(' ',			
			 if(in_FromDate <> '' ,concat('and disasters.disasterTimeStart >= "',in_FromDate,'" '),''),
			 if(in_ToDate <> '' ,concat('and disasters.disasterTimeStart < "',in_ToDate,'" +  interval 1 day  '),''),
			 ' '
		   );
	   SET @sql0 = concat('
            select 
            detail.provincesId,
    detail.provinceName,
    detail.wardsId,
   wardName,
   
   requestGroupsName,
   districtsId
   ,
   districtName,
   json_arrayagg(json_object(''amount'',detail.amount,''requestGroupsId'',detail.requestGroupsId,''requestGroupsName'',detail.requestGroupsName)) as requests
 from
(select distinct requests.id as requestsId,provinces.id as provincesId,provinces.provinceName as provinceName
, 
districts.id as districtsId,districts.districtName as districtName ,requests.wardsId as wardsId, wards.wardName as wardName ,requests.amount as  amount, requestGroups.id as requestGroupsId,requestGroups.requestGroupsName as requestGroupsName 
from requests ','

inner join disasters on disasters.id = requests.disastersId 
and disasters.status = 1 ',sqlWhere , ' 
					inner join disasterGroupsDisasters on disasterGroupsDisasters.disastersId = disasters.id ', 
                    if(in_disasterGroupsId  <>  '' , concat(' and disasterGroupsDisasters.disasterGroupsId in (',in_disasterGroupsId,') '),' '),
                    
                    '
                    inner join requestGroups on requestGroups.id = requests.requestGroupsId 
                    inner join wards on wards.id = requests.wardsId ', 
                     if(in_wardsId  <>  '' , concat(' and wards.id in (',in_wardsId,') '),' '),
                    '
                    	inner join districts on districts.id = wards.districtsId ',
                        if(in_districtsId  <>  '' , concat(' and districts.id in (',in_districtsId,') '),' ')
                        ,'
						inner join provinces on provinces.id = districts.provincesId ', 
                        if(in_provincesId  <>  '' , concat(' and provinces.id in (',in_provincesId,') '),' '), 
                        '
						) as detail group by detail.wardsId
								 ', ' order by provinceName,districtName asc'
			);		
	   --   select @sql0;
	        PREPARE stmt0 FROM @sql0;
			EXECUTE stmt0;
	
    
  





	

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_request_sum` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_request_sum`(
	in in_disasterGroupsId varchar(200),
	in in_requestGroupsId varchar(200),
	in in_provincesId varchar(200),
    in in_districtsId varchar(200),
    in in_wardsId varchar(200),
    in in_FromDate varchar(200),
	in in_ToDate varchar(200)
)
BEGIN
 -- 	call thiethai.sp_response_sum('', '5', '', '', '', '', '');
        DECLARE sqlWhere  varchar(20000) COLLATE utf8mb3_unicode_ci;
	   SET @sql0 = concat('
			select sum(requests.amount) as total , requests.provincesId , requests.provincesName from
            (select  distinct requests.id, requests.amount as amount , 
            provinces.id as provincesId ,
            provinces.provinceName as provincesName
            from requests
				inner join disasters on disasters.id = requests.disastersId and disasters.status = 1 ',
					 if(in_FromDate  <>  '' , concat(' and disasters.disasterTimeStart >= "',in_FromDate,'" '),' '),
                     if(in_ToDate  <>  '' , concat(' and disasters.disasterTimeStart <= "',in_ToDate,'" '),' ')
					,'
                
                inner join disasterGroupsDisasters on disasterGroupsDisasters.disastersId = disasters.id ',
                if(in_disasterGroupsId  <>  '' , concat(' and disasterGroupsDisasters.disasterGroupsId in (',in_disasterGroupsId,') '),' ')
                ,'
				inner join requestGroups on requestGroups.id = requests.requestGroupsId ',
				if(in_requestGroupsId  <>  '' , concat(' and requestGroups.id in (',in_requestGroupsId,')'),' '),'
					inner join wards on wards.id = requests.wardsId ', 
                    if(in_wardsId  <>  '' , concat(' and wards.id in (',in_wardsId,') '),' '),
                    '
                    	inner join districts on districts.id = wards.districtsId ',
                        if(in_districtsId  <>  '' , concat(' and districts.id in (',in_districtsId,') '),' ')
                        ,'
						inner join provinces on provinces.id = districts.provincesId ', 
                        if(in_provincesId  <>  '' , concat(' and provinces.id in (',in_provincesId,') '),' '), 
                        '
						)  as requests
								 ', ' group by requests.provincesId'
                                 
			);		
	   --   select @sql0;
	        PREPARE stmt0 FROM @sql0;
			EXECUTE stmt0;
	
    
  





	

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_request_sum_by_target` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_request_sum_by_target`(
	in in_disasterGroupsId varchar(200),
	in in_provincesId varchar(200),
    in in_districtsId varchar(200),
    in in_wardsId varchar(200),
    in in_FromDate varchar(200),
	in in_ToDate varchar(200)
)
BEGIN
 -- 	call thiethai.sp_response_sum('', '5', '', '', '', '', '');
 

	  DECLARE sqlWhere  varchar(20000) COLLATE utf8mb3_unicode_ci;
        
	  DROP TEMPORARY TABLE IF EXISTS temp_list_finalTargets;
	  SET @sql0 = concat('
       CREATE TEMPORARY TABLE temp_list_finalTargets( 
         select    targets.id , targets.targetsName, targets.targetsCode ,parentId,
               sum(value)  as value    
		  from 
			   (select targets.id , targets.targetsName, targets.targetsCode ,parentId,finalLevel,
				   ifnull(damages.value,0) as  value
			   
			   from targets
					left join 
					  ( damages
						inner join disasters on damages.disastersId = disasters.id ',
						 if(in_FromDate  <>  '' , concat(' and disasters.disasterTimeStart >= "',in_FromDate,'" '),' '),
						 if(in_ToDate  <>  '' , concat(' and disasters.in_ToDate <= "',in_ToDate,'" '),' ')
						,'
						inner join disasterGroupsDisasters on disasterGroupsDisasters.disastersId = disasters.id ',
						if(in_disasterGroupsId  <>  '' , concat(' and disasterGroupsDisasters.disasterGroupsId in (',in_disasterGroupsId,') '),' ')
						,'
						inner join wards on wards.id = damages.wardsId ', 
						if(in_wardsId  <>  '' , concat(' and wards.id in (',in_wardsId,') '),' '),
						'
						inner join districts on districts.id = wards.districtsId ',
						if(in_districtsId  <>  '' , concat(' and districts.id in (',in_districtsId,') '),' ')
						,'
						inner join provinces on provinces.id = districts.provincesId ', 
						if(in_provincesId  <>  '' , concat(' and provinces.id in (',in_provincesId,') '),' '), 
						'
						
					 )on damages.targetsId = targets.id
				 where     
					 targets.status = 1
					 and targets.finalLevel = 1
				group by targets.id,damages.id 
				)targets
				  group by targets.id
			)
            '
                                 
			);	
            
        
	        PREPARE stmt0 FROM @sql0;
			EXECUTE stmt0;

 
        
	  DROP TEMPORARY TABLE IF EXISTS temp_list_tagerts_parent1;
	  CREATE TEMPORARY TABLE temp_list_tagerts_parent1(
      select parent.id , parent.targetsName, parent.targetsCode ,parent.parentId,
               sum(value)  as value   
      from temp_list_finalTargets as targets
      inner join targets as parent on parent.id = targets.parentId
      group by parent.id
	  );


	  DROP TEMPORARY TABLE IF EXISTS temp_list_tagerts_parent2;
	  CREATE TEMPORARY TABLE temp_list_tagerts_parent2(
      select parent.id , parent.targetsName, parent.targetsCode ,parent.parentId,
               sum(value)  as value   
      from temp_list_tagerts_parent1 as targets
      inner join targets as parent on parent.id = targets.parentId
      group by parent.id
	  );
      
	  DROP TEMPORARY TABLE IF EXISTS temp_list_tagerts_parent3;
	  CREATE TEMPORARY TABLE temp_list_tagerts_parent3(
      select parent.id , parent.targetsName, parent.targetsCode ,parent.parentId,
               sum(value)  as value   
      from temp_list_tagerts_parent2 as targets
      inner join targets as parent on parent.id = targets.parentId
      group by parent.id
	  );
     
     
     select * from (
      select * from temp_list_finalTargets
      union 
      select * from temp_list_tagerts_parent1
      union
      select * from temp_list_tagerts_parent2
      union
      select * from temp_list_tagerts_parent3
     )targets 
     order by targets.targetsCode asc;
     
     
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_responses_province_details` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_responses_province_details`(
	
	in in_disasterGroupsId varchar(200),
    in in_supportSourcesId varchar(200),
	in in_provincesId varchar(200),
    in in_districtsId varchar(200),
    in in_wardsId varchar(200),
    in in_FromDate varchar(200),
	in in_ToDate varchar(200)
)
BEGIN
 -- 	call thiethai.sp_responses_province_details('', '', '', '', '', '', '');
        DECLARE sqlWhere  varchar(20000) COLLATE utf8mb3_unicode_ci;
        set sqlWhere =  concat(' ',			
			 if(in_FromDate <> '' ,concat('and disasters.disasterTimeStart >= "',in_FromDate,'" '),''),
			 if(in_ToDate <> '' ,concat('and disasters.disasterTimeStart < "',in_ToDate,'" +  interval 1 day  '),''),
			 ' '
		   );
	   SET @sql0 = concat('
       select
            detail.provincesId,
    detail.provinceName,
    detail.wardsId,
   wardName,
   requestGroupsName,
   districtsId
   ,
   districtName,
   json_arrayagg(json_object(''amount'',detail.amount,''requestGroupsId'',detail.requestGroupsId,''requestGroupsName'',detail.requestGroupsName,''supportSourcesName'',detail.supportSourcesName )) as responses
 from
(select distinct responses.id as responsesId,provinces.id as provincesId,provinces.provinceName as provinceName
, 
districts.id as districtsId,districts.districtName as districtName ,responses.wardsId as wardsId, wards.wardName as wardName ,responses.amount as  amount, requestGroups.id as requestGroupsId,requestGroups.requestGroupsName as requestGroupsName 
, responses.supportSourcesId as supportSourcesId , supportSources.supportSourcesName as supportSourcesName
from responses
inner join supportSources on supportSources.id = responses.supportSourcesId ',
if(in_supportSourcesId  <>  '' , concat(' and responses.supportSourcesId in(',in_supportSourcesId,') '),' ')
,' 

inner join disasters on disasters.id = responses.disastersId 
and disasters.status = 1 ',sqlWhere , ' 
					inner join disasterGroupsDisasters on disasterGroupsDisasters.disastersId = disasters.id ', 
                    if(in_disasterGroupsId  <>  '' , concat(' and disasterGroupsDisasters.disasterGroupsId in (',in_disasterGroupsId,') '),' '),
                    
                    '
                    inner join requestGroups on requestGroups.id = responses.requestGroupsId 
                    inner join wards on wards.id = responses.wardsId ', 
                     if(in_wardsId  <>  '' , concat(' and wards.id in (',in_wardsId,') '),' '),
                    '
                    	inner join districts on districts.id = wards.districtsId ',
                        if(in_districtsId  <>  '' , concat(' and districts.id in (',in_districtsId,') '),' ')
                        ,'
						inner join provinces on provinces.id = districts.provincesId ', 
                        if(in_provincesId  <>  '' , concat(' and provinces.id in (',in_provincesId,') '),' '), 
                        '
						) as detail 
                        group by detail.wardsId
								 ', '  order by provinceName,districtName asc'
			);		
	     -- select @sql0;
	        PREPARE stmt0 FROM @sql0;
			EXECUTE stmt0;
	
    
  





	

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_responses_sum` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_responses_sum`(
	in in_disasterGroupsId varchar(200),
	in in_requestGroupsId varchar(200),
    in in_supportSourcesId varchar(200),
	in in_provincesId varchar(200),
    in in_districtsId varchar(200),
    in in_wardsId varchar(200),
    in in_FromDate varchar(200),
	in in_ToDate varchar(200)
)
BEGIN

--      call thiethai.sp_responses_sum('', '', '', '', '', '', '', '');
        DECLARE sqlWhere  varchar(20000) COLLATE utf8mb3_unicode_ci;
	   SET @sql0 = concat(' 
       select sum(responses.amount) as total , responses.provincesId, responses.provincesName
         from
            (select distinct responses.id ,responses.amount as amount , 
            provinces.id as provincesId ,
            provinces.provinceName as provincesName
            from responses
				inner join supportSources on supportSources.id = responses.supportSourcesId ',
                if(in_supportSourcesId  <>  '' , concat(' and supportSources.id in (',in_supportSourcesId,') '),' '),
                '
				inner join disasters on disasters.id = responses.disastersId and disasters.status = 1
                ',
					 if(in_FromDate  <>  '' , concat(' and disasters.disasterTimeStart >= "',in_FromDate,'" '),' '),
                     if(in_ToDate  <>  '' , concat(' and disasters.disasterTimeStart <= "',in_ToDate,'" '),' ')
					,'
                inner join disasterGroupsDisasters on disasterGroupsDisasters.disastersId = disasters.id ',
					if(in_disasterGroupsId  <>  '' , concat(' and disasterGroupsDisasters.disasterGroupsId in (',in_disasterGroupsId,') '),' ')
					,'
				inner join requestGroups on requestGroups.id = responses.requestGroupsId ',
					if(in_requestGroupsId  <>  '' , concat(' and requestGroups.id in (',in_requestGroupsId,')'),' '),'
			   inner join wards on wards.id = responses.wardsId ', 
					if(in_wardsId  <>  '' , concat(' and wards.id in (',in_wardsId,') '),' '),
					'
				inner join districts on districts.id = wards.districtsId ',
					if(in_districtsId  <>  '' , concat(' and districts.id in (',in_districtsId,') '),' ')
					,'
				inner join provinces on provinces.id = districts.provincesId ', 
					if(in_provincesId  <>  '' , concat(' and provinces.id in (',in_provincesId,') '),' '), 
					'
				) as responses
						 ', ' group by responses.provincesId  '
			);		
	      -- select @sql0;
	        PREPARE stmt0 FROM @sql0;
			EXECUTE stmt0;
	
    
  





	

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_response_province_details` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_response_province_details`(
	in in_disasterGroupsId varchar(200),
	in in_provincesId varchar(200),
    in in_districtsId varchar(200),
    in in_wardsId varchar(200),
    in in_FromDate varchar(200),
	in in_ToDate varchar(200)
)
BEGIN
 -- 	call thiethai.sp_response_province_details('5', '', '', '', '', '');
        DECLARE sqlWhere  varchar(20000) COLLATE utf8mb3_unicode_ci;
        set sqlWhere =  concat(' ',			
			 if(in_FromDate <> '' ,concat('and disasters.disasterTimeStart >= "',in_FromDate,'" '),''),
			 if(in_ToDate <> '' ,concat('and disasters.disasterTimeStart < "',in_ToDate,'" +  interval 1 day  '),''),
			 ' '
		   );
	   SET @sql0 = concat('
            select provinces.id,provinces.provinceName
, 
json_arrayagg(json_object(''districtsid'',districts.id,''districtName'',districts.districtName,''wards'',
json_object(''wardsId'',responses.wardsId, ''wardName'',wards.wardName, ''amount'',responses.amount,
''requestGroupsId'',requestGroups.id,''requestGroupsName'',requestGroups.requestGroupsName ))) as district
from responses

inner join disasters on disasters.id = responses.disastersId 
and disasters.status = 1 ',sqlWhere , ' 
					inner join disasterGroupsDisasters on disasterGroupsDisasters.disastersId = disasters.id ', 
                    if(in_disasterGroupsId  <>  '' , concat(' and disasterGroupsDisasters.disasterGroupsId in (',in_disasterGroupsId,') '),' '),
                    
                    '
                    inner join requestGroups on requestGroups.id = responses.requestGroupsId 
                    inner join wards on wards.id = responses.wardsId ', 
                     if(in_wardsId  <>  '' , concat(' and wards.id in (',in_wardsId,') '),' '),
                    '
                    	inner join districts on districts.id = wards.districtsId ',
                        if(in_districtsId  <>  '' , concat(' and districts.id in (',in_districtsId,') '),' ')
                        ,'
						inner join provinces on provinces.id = districts.provincesId ', 
                        if(in_provincesId  <>  '' , concat(' and provinces.id in (',in_provincesId,') '),' '), 
                        '
						group by provinces.id  
								 '
			);		
	   --   select @sql0;
	        PREPARE stmt0 FROM @sql0;
			EXECUTE stmt0;
	
    
  





	

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_response_sum` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_response_sum`(
	in in_disasterGroupsId varchar(200),
	in in_requestGroupsId varchar(200),
	in in_provincesId varchar(200),
    in in_districtsId varchar(200),
    in in_wardsId varchar(200),
    in in_FromDate varchar(200),
	in in_ToDate varchar(200)
)
BEGIN
 -- 	call thiethai.sp_response_sum('', '5', '', '', '', '', '');
        DECLARE sqlWhere  varchar(20000) COLLATE utf8mb3_unicode_ci;
	   SET @sql0 = concat('
            select  sum(responses.amount) as total , 
            provinces.id as provinceID ,
            provinces.provinceName as provincesName
            from responses
				inner join disasters on disasters.id = responses.disastersId and disasters.status = 1
                ',
					 if(in_FromDate  <>  '' , concat(' and disasters.disasterTimeStart >= "',in_FromDate,'" '),' '),
                     if(in_ToDate  <>  '' , concat(' and disasters.disasterTimeStart <= "',in_ToDate,'" '),' ')
					,'
                inner join disasterGroupsDisasters on disasterGroupsDisasters.disastersId = disasters.id ',
                if(in_disasterGroupsId  <>  '' , concat(' and disasterGroupsDisasters.disasterGroupsId in (',in_disasterGroupsId,') '),' ')
                ,'
				inner join requestGroups on requestGroups.id = responses.requestGroupsId ',
				if(in_requestGroupsId  <>  '' , concat(' and requestGroups.id in (',in_requestGroupsId,')'),' '),'
					inner join wards on wards.id = responses.wardsId ', 
                    if(in_wardsId  <>  '' , concat(' and wards.id in (',in_wardsId,') '),' '),
                    '
                    	inner join districts on districts.id = wards.districtsId ',
                        if(in_districtsId  <>  '' , concat(' and districts.id in (',in_districtsId,') '),' ')
                        ,'
						inner join provinces on provinces.id = districts.provincesId ', 
                        if(in_provincesId  <>  '' , concat(' and provinces.id in (',in_provincesId,') '),' '), 
                        '
						group by provinces.id  
								 '
			);		
	   --   select @sql0;
	        PREPARE stmt0 FROM @sql0;
			EXECUTE stmt0;
	
    
  





	

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_users_getId_by_fullname` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_users_getId_by_fullname`(
  in in_fullname varchar(200)
)
BEGIN
   select json_arrayagg(users.id) from users where (UPPER(users.fullname) like concat('%',CONVERT(UPPER(in_fullname), BINARY),'%')  );
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

-- Dump completed on 2023-08-19 16:15:56
