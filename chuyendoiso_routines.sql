-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: chuyendoiso
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
-- Dumping events for database 'chuyendoiso'
--

--
-- Dumping routines for database 'chuyendoiso'
--
/*!50003 DROP FUNCTION IF EXISTS `fn_cal_Contents_DisasterGroups` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`vnmdscontent`@`%` FUNCTION `fn_cal_Contents_DisasterGroups`(inDisasterGroupsId bigint, dfrom datetime, dto datetime) RETURNS bigint(20)
    DETERMINISTIC
BEGIN
   set @total=ifnull(( select sum(1) from contents
	where contents.status=1
      and exists(select * from contentDisasterGroups 
					inner join disasterGroups on disasterGroups.id = contentDisasterGroups.disasterGroupsId
			where contentDisasterGroups.contentsId = contents.id
            and disasterGroups.id = inDisasterGroupsId
		)
		and date_format(contents.dateCreated,'%Y%m%d') >= date_format(dfrom,'%Y%m%d') 
		and date_format(contents.dateCreated,'%Y%m%d') <= date_format(dto,'%Y%m%d') 
	),0);


RETURN @total;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_cal_Contents_MonthInYear` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`vnmdscontent`@`%` FUNCTION `fn_cal_Contents_MonthInYear`(dateYearMonth int) RETURNS bigint(20)
    DETERMINISTIC
BEGIN
   set @total=ifnull(( select sum(1) from contents
		inner join communicationProductsGroups on communicationProductsGroups.id = contents.communicationProductsGroupsId
	where contents.status=1
      and date_format(contents.dateCreated,'%Y%m')  = date_format(str_to_date(concat(dateYearMonth,'01'),'%Y%m%d'),'%Y%m') 
	),0);


RETURN @total;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_cal_Contents_targetAudiences` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`vnmdscontent`@`%` FUNCTION `fn_cal_Contents_targetAudiences`(intargetAudiencesId bigint, dfrom datetime, dto datetime) RETURNS bigint(20)
    DETERMINISTIC
BEGIN
   set @total=ifnull(( select sum(1) from contents
	where contents.status=1
      and exists(select * from contentTargetAudiences 
					inner join targetAudiences on targetAudiences.id = contentTargetAudiences.targetAudiencesId
			where contentTargetAudiences.contentsId = contents.id
            and targetAudiences.id = intargetAudiencesId
		)
		and date_format(contents.dateCreated,'%Y%m%d') >= date_format(dfrom,'%Y%m%d') 
		and date_format(contents.dateCreated,'%Y%m%d') <= date_format(dto,'%Y%m%d') 
	),0);


RETURN @total;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_chatMessages_getTop1` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `fn_chatMessages_getTop1`(in_roomChatsId bigint,
	in_usersId bigint
) RETURNS longtext CHARSET utf8mb4 COLLATE utf8mb4_bin
BEGIN
	
	RETURN (
			SELECT
				json_object("roomChatsId",chatMessages.roomChatsId,
						"users",json_object("id",users.id,"fullname",users.fullname,"username",users.username,"image",users.image)
						,"id",chatMessages.id,"message",chatMessages.message,"attachedFiles",chatMessages.attachedFiles
						,"dateCreated",chatMessages.dateCreated,"status",chatMessages.status,"type",chatMessages.type) 
			FROM chatMessages
				INNER JOIN roomChatsUsers ON chatMessages.roomChatsId = roomChatsUsers.roomChatsId and roomChatsUsers.usersId = in_usersId
                INNER JOIN users ON users.id = chatMessages.senderId
				where chatMessages.roomChatsId = in_roomChatsId
                and (chatMessages.status = 1 or chatMessages.status = 0)
                and (
                      roomChatsUsers.joinStatus = 1
                      or chatMessages.id < roomChatsUsers.canReadMessageId
					)
			order by chatMessages.id desc
			limit 1
    );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_count_notReadMail_inRoom` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `fn_count_notReadMail_inRoom`(in_roomMailsId bigint,
    in_usersId bigint
) RETURNS int(11)
BEGIN
	RETURN (
			SELECT 
					count(*)
			FROM mailsUsers
                inner join mails on mails.id = mailsUsers.mailsId
				where mails.roomMailsId = roomMailsId
                 and mailsUsers.usersId = in_usersId
                 and mailsUsers.readStatus = 0
                 and mails.status = 1
    );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_count_notReadMessage_inRoom` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `fn_count_notReadMessage_inRoom`(in_roomChatsId bigint,
    in_lastReadedMessageId bigint,
    in_joinStatus int,
    in_canReadMessageId bigint
) RETURNS int(11)
BEGIN
	RETURN (
			SELECT 
					count(*)
			FROM chatMessages
				where chatMessages.roomChatsId = in_roomChatsId
                 and (chatMessages.status = 1 or chatMessages.status = 0)
                and id > in_lastReadedMessageId
                and (in_joinStatus = 1 or id <= in_canReadMessageId)
    );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_disastersByNewsId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `fn_disastersByNewsId`(in_id bigint
) RETURNS longtext CHARSET utf8mb4 COLLATE utf8mb4_bin
BEGIN

RETURN (
	select json_arrayagg( 
		JSON_OBJECT("disasterVndmsId",disasters.disasterVndmsId,"disasterName",disasters.disasterName) 
    )
    from disasters
     inner join disastersNews on disastersNews.disastersId = disasters.disasterVndmsId
     where disastersNews.newsId=in_id
);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_mails_getTop1` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `fn_mails_getTop1`(in_roomMailsId bigint,
  in_usersId bigint
) RETURNS longtext CHARSET utf8mb4 COLLATE utf8mb4_bin
BEGIN

	RETURN (
			SELECT
					json_object(
						"users",json_object("id",users.id,"fullname",users.fullname,"username",users.username,"image",users.image)
						,"id",mails.id,"mailTitle",mails.mailTitle,"type",mails.type,"mailContent",mails.mailContent
						,"dateCreated",mails.dateCreated,"status",mails.status,"mailReplyId",mails.mailReplyId,"userSendersId",mails.userSendersId,"attachment",mails.attachment)
			FROM mails
            INNER JOIN mailsUsers ON  mailsUsers.usersId = in_usersId
			INNER JOIN users ON  users.id = mails.userSendersId
            where mails.roomMailsId = in_roomMailsId
                    and mails.status = 1
                    and (mailsUsers.readStatus = 0 or mailsUsers.readStatus = 1)
            order by mails.id desc
            limit 1
    );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_mails_getTop1_gui` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `fn_mails_getTop1_gui`(in_roomMailsId bigint,
  in_usersId bigint
) RETURNS longtext CHARSET utf8mb4 COLLATE utf8mb4_bin
BEGIN

	RETURN (
			SELECT
					json_object(
						"users",json_object("id",users.id,"fullname",users.fullname,"username",users.username,"image",users.image,"workUnit",users.workUnit,"email",users.email,"mobile",users.mobile)
                        ,"reviceUsers",fn_mails_reciveUsers(mails.id)
						,"id",mails.id,"mailTitle",mails.mailTitle,"type",mails.type,"mailContent",mails.mailContent
						,"dateCreated",mails.dateCreated,"status",mails.status,"mailReplyId",mails.mailReplyId,"userSendersId",mails.userSendersId,"attachment",mails.attachment)
				FROM mailsUsers
            INNER JOIN mails ON  mailsUsers.mailsId = mails.id
			INNER JOIN users ON  users.id = mails.userSendersId
            where mails.userSendersId = in_usersId
            and      roomMailsId = in_roomMailsId
            and      mails.status = 1
            order by mails.id desc
            limit 1
    );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_mails_getTop1_nhan` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `fn_mails_getTop1_nhan`(in_roomMailsId bigint,
  in_usersId bigint
) RETURNS longtext CHARSET utf8mb4 COLLATE utf8mb4_bin
BEGIN

	RETURN (
			SELECT
					json_object(
						"users",json_object("id",users.id,"fullname",users.fullname,"username",users.username,"image",users.image,"workUnit",users.workUnit,"email",users.email,"mobile",users.mobile)
                        ,"reviceUsers",fn_mails_reciveUsers(mails.id)
						,"id",mails.id,"mailTitle",mails.mailTitle,"type",mails.type,"mailContent",mails.mailContent
						,"dateCreated",mails.dateCreated,"status",mails.status,"mailReplyId",mails.mailReplyId,"userSendersId",mails.userSendersId,"attachment",mails.attachment)
				FROM mailsUsers
            INNER JOIN mails ON  mailsUsers.mailsId = mails.id
			INNER JOIN users ON  users.id = mails.userSendersId
            where mailsUsers.usersId = in_usersId
            and      roomMailsId = in_roomMailsId
			and      mailsUsers.status = 1
            order by mails.id desc
            limit 1
    );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_mails_reciveUsers` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `fn_mails_reciveUsers`(in_mailsId bigint
) RETURNS longtext CHARSET utf8mb4 COLLATE utf8mb4_bin
BEGIN

	RETURN (
			SELECT
				JSON_ARRAYAGG(
					json_object('usersId',mailsUsers.usersId,'readStatus',mailsUsers.readStatus,'timeRead',mailsUsers.timeRead,'downloadFileStatus',mailsUsers.downloadFileStatus,'timeDownloadFile',mailsUsers.timeDownloadFile,'users',json_object("id",users.id,"fullname",users.fullname,"username",users.username,"image",users.image,"workUnit",users.workUnit,"email",users.email,"mobile",users.mobile)
					 )
				)
			FROM mailsUsers
			INNER JOIN users ON  users.id = mailsUsers.usersId
            where mailsUsers.mailsId = in_mailsId
    );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_reports_byNewsId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `fn_reports_byNewsId`(in_newsId bigint
) RETURNS longtext CHARSET utf8mb4 COLLATE utf8mb4_bin
BEGIN

	RETURN (
		select 
		json_arrayagg( json_object("id",reports.id,"numberDoc",JSON_EXTRACT(reports.reportData, '$.numberDoc'),"reportDay",reports.reportDay,"title",JSON_EXTRACT(reports.reportData, '$.title'))) reports
		from reportsNews
			inner join reports on reports.id=reportsNews.reportsId
		where reportsNews.newsId= in_newsId
    );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_reports_check_byNewsId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `fn_reports_check_byNewsId`(in_newsId bigint
) RETURNS int(11)
BEGIN
  if(exists (
        select 
		 count(reports.id)
		from reports
		where JSON_SEARCH(reports.reportData,'one',in_newsId)
        )
	)
    then 
		set @flag=1;
	else 
		set @flag=0;
	end if;
    

	RETURN (
		@flag
    );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_roomChatsUsers_byRoomChatsId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `fn_roomChatsUsers_byRoomChatsId`(in_roomChatsId bigint
) RETURNS longtext CHARSET utf8mb4 COLLATE utf8mb4_bin
BEGIN
	
	RETURN (
		SELECT 
			json_arrayagg(
				json_object("usersId",roomChatsUsers.usersId,"roomChatsId",roomChatsUsers.roomChatsId,"lastReadedMessageId",roomChatsUsers.lastReadedMessageId,
					"users",json_object("id",users.id,"fullname",users.fullname,"username",users.username,"image",users.image,"onlineStatus",users.onlineStatus,"lastTimeOnline",users.lastTimeOnline,"workUnit",users.workUnit,"mobile",users.mobile,"email",users.email)
				)
            )
        FROM roomChatsUsers
			INNER JOIN users ON users.ID = roomChatsUsers.usersId
            where roomChatsUsers.roomChatsId = in_roomChatsId
    );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_roomChatsUsers_get` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `fn_roomChatsUsers_get`(in_roomChatsId bigint
) RETURNS longtext CHARSET utf8mb4 COLLATE utf8mb4_bin
BEGIN
	
	RETURN (
		SELECT 

             json_arrayagg(
						json_object("roomChatsId",roomChatsUsers.roomChatsId,
							"users",json_object("id",users.id,"fullname",users.fullname,"username",users.username,"image",users.image,"onlineStatus",users.onlineStatus,"lastTimeOnline",users.lastTimeOnline,"workUnit",users.workUnit,"mobile",users.mobile,"email",users.email)
							)
					)
            
		FROM roomChatsUsers
			INNER JOIN users ON users.id = roomChatsUsers.usersId
            where roomChatsUsers.roomChatsId = in_roomChatsId
    );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_contentGroups_views` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_contentGroups_views`(
      
	  in in_FromDate varchar(200),
	  in in_ToDate varchar(200)
)
BEGIN
 -- 	call thiethai.sp_contents_count('', '', '', '', '', '');





			SET @sql0 = concat('
				select  contentGroups.id, contentGroups.contentGroupsName, ifnull(sum(contentsViews.views),0) as views,
                	count(distinct contents.id) as countContents
					from contentGroups
                        left join contents on contentGroups.id = contents.contentGroupsId
						left JOIN
								`contentsViews` AS `contentsViews` ON `contentsViews`.`contentsId` = `contents`.`id`
								 ',
										 if(in_FromDate <> '' ,concat('and contentsViews.statisticalDay >= "',in_FromDate,'" '),''),
		                             	 if(in_ToDate <> '' ,concat('and contentsViews.statisticalDay <= "',in_ToDate,'"   '),'')
								 ,'
			   WHERE
                     contents.status = 1
                                
                       group by contentGroups.id
					   order by sum(contentsViews.views)  desc
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
/*!50003 DROP PROCEDURE IF EXISTS `sp_contents_views` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_contents_views`(
    in in_disasterGroupsId varchar(200),
	  in in_contentGroupsId varchar(200),
    in in_FromDate varchar(200),
	  in in_ToDate varchar(200),
      	in in_start_page int,
      in in_end_page int

)
BEGIN
 -- 	call thiethai.sp_contents_count('', '', '', '', '', '');





			SET @sql0 = concat('
				select  contents.id, contents.contentsName, contents.images,ifnull(sum(contentsViews.views),0) as views,url,
                contents.views as totalViews
					from contents
						left JOIN
								`contentsViews` AS `contentsViews` ON `contentsViews`.`contentsId` = `contents`.`id`
								 ',
										 if(in_FromDate <> '' ,concat('and contentsViews.statisticalDay >= "',in_FromDate,'" '),''),
		                             	 if(in_ToDate <> '' ,concat('and contentsViews.statisticalDay <= "',in_ToDate,'"   '),'')
								 ,'
			   WHERE
                     contents.status = 1
                                      	',
									 if(in_contentGroupsId  <>  '' , concat('and( contents.contentGroupsId in (',in_contentGroupsId,') )'),'')
								 ,'
                       group by contents.id
					   order by  sum(contentsViews.views)  desc
                       limit ',in_start_page,',', in_end_page

			);



	        PREPARE stmt0 FROM @sql0;
			EXECUTE stmt0;



        		SET @sql1 = concat('
				select  ifnull(sum(contentsViews.views),0) as totalViews   ,count(distinct contents.id ) as count
					from
					contents
						left JOIN
								`contentsViews` AS `contentsViews` ON `contentsViews`.`contentsId` = `contents`.`id`
								 ',
										 if(in_FromDate <> '' ,concat('and contentsViews.statisticalDay >= "',in_FromDate,'" '),''),
		                             	 if(in_ToDate <> '' ,concat('and contentsViews.statisticalDay <= "',in_ToDate,'"   '),'')
								 ,'
							WHERE
                               contents.status = 1
                                      ',
									 if(in_contentGroupsId  <>  '' , concat('and( contents.contentGroupsId in (',in_contentGroupsId,') )'),'')
								 ,'
                                 
                     '

			);



	        PREPARE stmt1 FROM @sql1;
			EXECUTE stmt1;






END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_countAccess` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_countAccess`(
    in in_FromDate datetime,
	in in_ToDate datetime

)
BEGIN
 

   

  
     	DROP TEMPORARY TABLE IF EXISTS temp_time_ngay;
		CREATE TEMPORARY TABLE temp_time_ngay
		(
			 select    date(selectedDate) as date from  (
			  select adddate(in_FromDate,t4*10000 + t3*1000 + t2*100 + t1*10 + t0) selectedDate from
				 (select 0 t0 union select 1 union select 2 union select 3 union select 4 union select 5 union select 6 union select 7 union select 8 union select 9) t0,
				 (select 0 t1 union select 1 union select 2 union select 3 union select 4 union select 5 union select 6 union select 7 union select 8 union select 9) t1,
				 (select 0 t2 union select 1 union select 2 union select 3 union select 4 union select 5 union select 6 union select 7 union select 8 union select 9) t2,
				 (select 0 t3 union select 1 union select 2 union select 3 union select 4 union select 5 union select 6 union select 7 union select 8 union select 9) t3,
				 (select 0 t4 union select 1 union select 2 union select 3 union select 4 union select 5 union select 6 union select 7 union select 8 union select 9) t4
			 ) v
			 where
				selectedDate >= in_FromDate
				 and selectedDate <= in_ToDate

		);
 

      select temp_time_ngay.date as date,
		     ifnull(countOnline.countAccess,0)  as countAccess
      from temp_time_ngay
        left join countOnline on  countOnline.onlineDate  = temp_time_ngay.date
	  

      order by temp_time_ngay.date asc ;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_dashboard_All_ByYear` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`vnmdscontent`@`%` PROCEDURE `sp_dashboard_All_ByYear`(
	in in_FromDate datetime,
    in in_ToDate datetime,
    in in_PageIndex bigint,
    in in_PageSize bigint,
    out out_TotalCount bigint
)
BEGIN
	DECLARE start_page, end_page INT DEFAULT 0;
	declare totalContents,totalUsers bigint DEFAULT 0;
    SET @row_number = 0;
	set start_page= (in_PageIndex - 1) * in_PageSize + 1;
	set end_page = in_PageIndex*in_PageSize;
	set totalContents =ifnull((select count(*) from contents  where status=1),0);
	
	
	set totalUsers = ifnull((select count(*) from users where status=1),0);
	DROP TEMPORARY TABLE IF EXISTS temp_dashboard_Contents;
	CREATE TEMPORARY TABLE temp_dashboard_Contents
	(
        select count(*)total,communicationProductsGroups.communicationProductsGroupName,communicationProductsGroups.id from contents
			inner join communicationProductsGroups on communicationProductsGroups.id = contents.communicationProductsGroupsId
		where contents.status=1 and communicationProductsGroups.status=1
        group by communicationProductsGroups.communicationProductsGroupName,communicationProductsGroups.id
	);
    
	select * from temp_dashboard_Contents
    order by id asc
    ;
     select totalContents,totalUsers;
     
	DROP TEMPORARY TABLE IF EXISTS temp_dashboard;
	CREATE TEMPORARY TABLE temp_dashboard
	(
        select count(*)total,communicationProductsGroups.communicationProductsGroupName,date_format(contents.contentProductionDate,'%Y')contentProductionDate from contents
			inner join communicationProductsGroups on communicationProductsGroups.id = contents.communicationProductsGroupsId
		where contents.status=1 and communicationProductsGroups.status=1
			and date_format(contents.dateCreated,'%Y%m%d') >= date_format(in_FromDate,'%Y%m%d') 
			and date_format(contents.dateCreated,'%Y%m%d') <= date_format(in_ToDate,'%Y%m%d')
        group by communicationProductsGroups.communicationProductsGroupName,date_format(contents.contentProductionDate,'%Y')
	);
    
    DROP TEMPORARY TABLE IF EXISTS temp_dashboard_date;
	CREATE TEMPORARY TABLE temp_dashboard_date
	(
			select  
			 date_format(v.dateCreated,'%Y') contentProductionDate  from
			 (select adddate('1970-01-01',t4*10000 + t3*1000 + t2*100 + t1*10 + t0) dateCreated from
			 (select 0 t0 union select 1 union select 2 union select 3 union select 4 union select 5 union select 6 union select 7 union select 8 union select 9) t0,
			 (select 0 t1 union select 1 union select 2 union select 3 union select 4 union select 5 union select 6 union select 7 union select 8 union select 9) t1,
			 (select 0 t2 union select 1 union select 2 union select 3 union select 4 union select 5 union select 6 union select 7 union select 8 union select 9) t2,
			 (select 0 t3 union select 1 union select 2 union select 3 union select 4 union select 5 union select 6 union select 7 union select 8 union select 9) t3,
			 (select 0 t4 union select 1 union select 2 union select 3 union select 4 union select 5 union select 6 union select 7 union select 8 union select 9) t4
             ) v
			where
			date_format(v.dateCreated,'%Y%m%d') >= date_format(in_FromDate,'%Y%m%d') 
			and date_format(v.dateCreated,'%Y%m%d') <= date_format(in_ToDate,'%Y%m%d')
			GROUP BY date_format(v.dateCreated,'%Y')
    );

    SET SESSION group_concat_max_len = 1000000;
     select GROUP_CONCAT(CONCAT(
	  ' SUM(IF(temp_dashboard.communicationProductsGroupName = ','''',
		communicationProductsGroups.communicationProductsGroupName,
	  ''', temp_dashboard.total,0)) AS ','''',
	  communicationProductsGroups.communicationProductsGroupName,''''
		)) into @PivotQuery
	 from communicationProductsGroups
     where status=1
     ;

    DROP TEMPORARY TABLE IF EXISTS temp_dashboard_final;
	SET @PivotQuery = replace((CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS temp_dashboard_final SELECT temp_dashboard_date.contentProductionDate,',@PivotQuery, ',SUM(ifnull(cast(temp_dashboard.total as UNSIGNED INTEGER),0)) AS total FROM temp_dashboard right join temp_dashboard_date on temp_dashboard_date.contentProductionDate=temp_dashboard.contentProductionDate GROUP BY temp_dashboard_date.contentProductionDate',';')),'''','"');

	PREPARE statement FROM @PivotQuery;
	EXECUTE statement;
	DEALLOCATE PREPARE statement;
    
    select * from temp_dashboard_final;
	set out_TotalCount=ifnull((select count(*) from temp_dashboard_final),0);
    
    SELECT	t.*
		FROM (
			SELECT  
				temp_dashboard_final.*, (@row_number := @row_number + 1) AS rownum 
            FROM temp_dashboard_final
            order by total desc
		) t
		WHERE t.rownum >= start_page and t.rownum <= end_page
		order by total desc
	;
    
    select id,communicationProductsGroupName from communicationProductsGroups
     where status=1
    order by id asc;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_dashboard_All_communicationProductsGroups` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`vnmdscontent`@`%` PROCEDURE `sp_dashboard_All_communicationProductsGroups`(
	in in_FromDate datetime,
    in in_ToDate datetime,
    in in_PageIndex bigint,
    in in_PageSize bigint,
    out out_TotalCount bigint
)
BEGIN
	DECLARE start_page, end_page INT DEFAULT 0;
	declare totalContents,totalUsers bigint DEFAULT 0;
    SET @row_number = 0;
	set start_page= (in_PageIndex - 1) * in_PageSize + 1;
	set end_page = in_PageIndex*in_PageSize;
	set totalContents =ifnull((select count(*) from contents  where status=1),0);
	
	
	set totalUsers = ifnull((select count(*) from users where status=1),0);
	DROP TEMPORARY TABLE IF EXISTS temp_dashboard_Contents;
	CREATE TEMPORARY TABLE temp_dashboard_Contents
	(
        select count(*)total,communicationProductsGroups.communicationProductsGroupName,communicationProductsGroups.id from contents
			inner join communicationProductsGroups on communicationProductsGroups.id = contents.communicationProductsGroupsId
		where contents.status=1
		and communicationProductsGroups.status=1
        group by communicationProductsGroups.communicationProductsGroupName,communicationProductsGroups.id
	);
    
	select * from temp_dashboard_Contents
    order by id asc
    ;
       select totalContents,totalUsers;
    DROP TEMPORARY TABLE IF EXISTS temp_dashboard_contents_detail;
	CREATE TEMPORARY TABLE temp_dashboard_contents_detail
	(
         select count(*)total,communicationProductsGroups.communicationProductsGroupName from contents
			inner join communicationProductsGroups on communicationProductsGroups.id = contents.communicationProductsGroupsId
		where contents.status=1 and communicationProductsGroups.status=1
        	and date_format(contents.dateCreated,'%Y%m%d') >= date_format(in_FromDate,'%Y%m%d') 
		and date_format(contents.dateCreated,'%Y%m%d') <= date_format(in_ToDate,'%Y%m%d')
        group by communicationProductsGroups.communicationProductsGroupName
    );
    select * from temp_dashboard_contents_detail
    order by temp_dashboard_contents_detail.communicationProductsGroupName asc;
	set out_TotalCount=ifnull((select count(*) from temp_dashboard_contents_detail),0);
    
    SELECT	t.communicationProductsGroupName,t.total
		FROM (
			SELECT  
				temp_dashboard_contents_detail.*, (@row_number := @row_number + 1) AS rownum 
            FROM temp_dashboard_contents_detail
            order by total desc
		) t
		WHERE t.rownum >= start_page and t.rownum <= end_page
		order by total desc
	;

 SELECT communicationProductsGroups.id,communicationProductsGroups.communicationProductsGroupName 
 from 	communicationProductsGroups 
 where communicationProductsGroups.status=1
 order by id asc
 ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_dashboard_All_Date` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`vnmdscontent`@`%` PROCEDURE `sp_dashboard_All_Date`(
	in in_FromDate datetime,
    in in_ToDate datetime,
    in in_PageIndex bigint,
    in in_PageSize bigint,
    out out_TotalCount bigint
)
BEGIN
	DECLARE start_page, end_page INT DEFAULT 0;
	declare totalContents,totalUsers bigint DEFAULT 0;
    SET @row_number = 0;
	set start_page= (in_PageIndex - 1) * in_PageSize + 1;
	set end_page = in_PageIndex*in_PageSize;
	set totalContents =ifnull((select count(*) from contents  where status=1),0);
	
	
	set totalUsers = ifnull((select count(*) from users where status=1),0);
	DROP TEMPORARY TABLE IF EXISTS temp_dashboard_Contents;
	CREATE TEMPORARY TABLE temp_dashboard_Contents
	(
        select count(*)total,communicationProductsGroups.communicationProductsGroupName,communicationProductsGroups.id from contents
			inner join communicationProductsGroups on communicationProductsGroups.id = contents.communicationProductsGroupsId
		where contents.status=1 and communicationProductsGroups.status=1
        
		
        group by communicationProductsGroups.communicationProductsGroupName,communicationProductsGroups.id
	);
    
	select * from temp_dashboard_Contents
    order by id asc
    ;
     select totalContents,totalUsers;
     
	DROP TEMPORARY TABLE IF EXISTS temp_dashboard;
	CREATE TEMPORARY TABLE temp_dashboard
	(
        select count(*)total,communicationProductsGroups.communicationProductsGroupName,date_format(contents.contentProductionDate,'%Y/%m')contentProductionDate from contents
			inner join communicationProductsGroups on communicationProductsGroups.id = contents.communicationProductsGroupsId
		where contents.status=1 and communicationProductsGroups.status=1
			and date_format(contents.dateCreated,'%Y%m%d') >= date_format(in_FromDate,'%Y%m%d') 
			and date_format(contents.dateCreated,'%Y%m%d') <= date_format(in_ToDate,'%Y%m%d')
        group by communicationProductsGroups.communicationProductsGroupName,date_format(contents.contentProductionDate,'%Y/%m')
	);
    
    DROP TEMPORARY TABLE IF EXISTS temp_dashboard_date;
	CREATE TEMPORARY TABLE temp_dashboard_date
	(
			select  
			 date_format(v.dateCreated,'%Y/%m') contentProductionDate  from
			 (select adddate('1970-01-01',t4*10000 + t3*1000 + t2*100 + t1*10 + t0) dateCreated from
			 (select 0 t0 union select 1 union select 2 union select 3 union select 4 union select 5 union select 6 union select 7 union select 8 union select 9) t0,
			 (select 0 t1 union select 1 union select 2 union select 3 union select 4 union select 5 union select 6 union select 7 union select 8 union select 9) t1,
			 (select 0 t2 union select 1 union select 2 union select 3 union select 4 union select 5 union select 6 union select 7 union select 8 union select 9) t2,
			 (select 0 t3 union select 1 union select 2 union select 3 union select 4 union select 5 union select 6 union select 7 union select 8 union select 9) t3,
			 (select 0 t4 union select 1 union select 2 union select 3 union select 4 union select 5 union select 6 union select 7 union select 8 union select 9) t4
             ) v
			where
			date_format(v.dateCreated,'%Y%m%d') >= date_format(in_FromDate,'%Y%m%d') 
			and date_format(v.dateCreated,'%Y%m%d') <= date_format(in_ToDate,'%Y%m%d')
			GROUP BY date_format(v.dateCreated,'%Y/%m')
    );

    SET SESSION group_concat_max_len = 1000000;
     select GROUP_CONCAT(CONCAT(
	  ' SUM(IF(temp_dashboard.communicationProductsGroupName = ','''',
		communicationProductsGroups.communicationProductsGroupName,
	  ''', temp_dashboard.total,0)) AS ','''',
	  communicationProductsGroups.communicationProductsGroupName,''''
		)) into @PivotQuery
	 from communicationProductsGroups
     where status=1
     ;

    DROP TEMPORARY TABLE IF EXISTS temp_dashboard_final;
	SET @PivotQuery = replace((CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS temp_dashboard_final SELECT temp_dashboard_date.contentProductionDate,',@PivotQuery, ',SUM(ifnull(cast(temp_dashboard.total as UNSIGNED INTEGER),0)) AS total FROM temp_dashboard right join temp_dashboard_date on temp_dashboard_date.contentProductionDate=temp_dashboard.contentProductionDate GROUP BY temp_dashboard_date.contentProductionDate',';')),'''','"');

	PREPARE statement FROM @PivotQuery;
	EXECUTE statement;
	DEALLOCATE PREPARE statement;
    
    select * from temp_dashboard_final;
	set out_TotalCount=ifnull((select count(*) from temp_dashboard_final),0);
    
    SELECT	t.*
		FROM (
			SELECT  
				temp_dashboard_final.*, (@row_number := @row_number + 1) AS rownum 
            FROM temp_dashboard_final
            order by total desc
		) t
		WHERE t.rownum >= start_page and t.rownum <= end_page
		order by total desc
	;
    
    select id,communicationProductsGroupName from communicationProductsGroups
     where status=1
     order by id asc;
    
   DROP TEMPORARY TABLE IF EXISTS temp_dashboard_Contents;
   DROP TEMPORARY TABLE IF EXISTS temp_dashboard_final;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_documentGroups_downloads` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_documentGroups_downloads`(
    in in_disasterGroupsId varchar(200),

      in in_FromDate varchar(200),
	  in in_ToDate varchar(200)


)
BEGIN
 -- 	call thiethai.sp_documents_count('', '', '', '', '', '');




			SET @sql0 = concat('
				select  documentGroups.id, documentGroups.documentGroupsName, 
                  ifnull(sum(documentsDownloads.downloads),0) as downloads,
                         count(distinct documents.id) as countDocuments
					from documentGroups
                    left join
					(
						select documents.id,documentGroupsId
						  FROM
								`documents` AS `documents`
									LEFT JOIN
								`disasterGroupsDocuments` AS `disasterGroupsDocuments` ON `disasterGroupsDocuments`.`documentsId` = `documents`.`id`
								 ',
									 if(in_disasterGroupsId  <>  '' , concat('and( disasterGroupsDocuments.disasterGroupsId in (',in_disasterGroupsId,') )'),'')
								 ,'
							 WHERE
								 	  documents.status = 1

							group by documents.id
					)documents on documents.documentGroupsId = documentGroups.id
						left JOIN
								`documentsDownloads` AS `documentsDownloads` ON `documentsDownloads`.`documentsId` = `documents`.`id`
								 ',
										 if(in_FromDate <> '' ,concat('and documentsDownloads.statisticalDay >= "',in_FromDate,'" '),''),
		                             	 if(in_ToDate <> '' ,concat('and documentsDownloads.statisticalDay <= "',in_ToDate,'"   '),'')
								 ,'
                       where    documentGroups.status  = 1       
                       group by documentGroups.id
					   order by  sum(documentsDownloads.downloads)  desc
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
/*!50003 DROP PROCEDURE IF EXISTS `sp_documentGroups_views` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_documentGroups_views`(
    in in_disasterGroupsId varchar(200),
	
      in in_FromDate varchar(200),
	  in in_ToDate varchar(200)

      
)
BEGIN
 -- 	call thiethai.sp_documents_count('', '', '', '', '', '');





			SET @sql0 = concat('
				select  documentGroups.id, documentGroups.documentGroupsName, ifnull(sum(documentsViews.views),0) as views,
                   count(distinct documents.id) as countDocuments
					from documentGroups 
                    left join 
					(
						select documents.id,documentGroupsId
						  FROM
								`documents` AS `documents`
									LEFT JOIN
								`disasterGroupsDocuments` AS `disasterGroupsDocuments` ON `disasterGroupsDocuments`.`documentsId` = `documents`.`id`
								 ',
									 if(in_disasterGroupsId  <>  '' , concat('and( disasterGroupsDocuments.disasterGroupsId in (',in_disasterGroupsId,') )'),'')
								 ,'
							 WHERE
								 	  documents.status = 1 
                                       
							group by documents.id
					)documents on documents.documentGroupsId = documentGroups.id
						left JOIN
								`documentsViews` AS `documentsViews` ON `documentsViews`.`documentsId` = `documents`.`id`
								 ',
										 if(in_FromDate <> '' ,concat('and documentsViews.statisticalDay >= "',in_FromDate,'" '),''),
		                             	 if(in_ToDate <> '' ,concat('and documentsViews.statisticalDay <= "',in_ToDate,'"   '),'')
								 ,'
                                   where    documentGroups.status  = 1       
                       group by documentGroups.id             
					   order by  sum(documentsViews.views)  desc
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
/*!50003 DROP PROCEDURE IF EXISTS `sp_documents_downloads` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_documents_downloads`(
    in in_disasterGroupsId varchar(200),
	  in in_documentGroupsId varchar(200),
      in in_FromDate varchar(200),
	  in in_ToDate varchar(200),
      	in in_start_page int,
      in in_end_page int

)
BEGIN
 -- 	call thiethai.sp_documents_count('', '', '', '', '', '');





			SET @sql0 = concat('
				select  documents.id, documents.documentsName, ifnull(sum(documentsDownloads.downloads),0) as downloads,
                       totalDownloads,url
					from
					(
						select documents.id, documents.documentsName , documents.downloads as totalDownloads ,url
						  FROM
								`documents` AS `documents`
									left JOIN
								`disasterGroupsDocuments` AS `disasterGroupsDocuments` ON `disasterGroupsDocuments`.`documentsId` = `documents`.`id`
								
							 WHERE
								 	  documents.status = 1
											',
                                               if(in_disasterGroupsId  <>  '' , concat('and( disasterGroupsDocuments.disasterGroupsId in (',in_disasterGroupsId,') )'),''),
									 if(in_documentGroupsId  <>  '' , concat('and( documents.documentGroupsId in (',in_documentGroupsId,') )'),'')
								 ,'
							group by documents.id
					)documents
						left JOIN
								`documentsDownloads` AS `documentsDownloads` ON `documentsDownloads`.`documentsId` = `documents`.`id`
								 ',
										 if(in_FromDate <> '' ,concat('and documentsDownloads.statisticalDay >= "',in_FromDate,'" '),''),
		                             	 if(in_ToDate <> '' ,concat('and documentsDownloads.statisticalDay <= "',in_ToDate,'"   '),'')
								 ,'
                       group by documents.id
					   order by  sum(documentsDownloads.downloads)  desc
                       limit ',in_start_page,',', in_end_page

			);


	        PREPARE stmt0 FROM @sql0;
			EXECUTE stmt0;



        		SET @sql1 = concat('
				select  ifnull(sum(documentsDownloads.downloads),0) as totalDownloads ,count(distinct documents.id ) as count
					from
					(
						select documents.id, documents.documentsName
						  FROM
								`documents` AS `documents`
									left JOIN
								`disasterGroupsDocuments` AS `disasterGroupsDocuments` ON `disasterGroupsDocuments`.`documentsId` = `documents`.`id`
								
							 WHERE
								 	  documents.status = 1
								',
                                   if(in_disasterGroupsId  <>  '' , concat('and( disasterGroupsDocuments.disasterGroupsId in (',in_disasterGroupsId,') )'),''),
									 if(in_documentGroupsId  <>  '' , concat('and( documents.documentGroupsId in (',in_documentGroupsId,') )'),'')
								 ,'
							group by documents.id
					)documents
						left JOIN
								`documentsDownloads` AS `documentsDownloads` ON `documentsDownloads`.`documentsId` = `documents`.`id`
								 ',
										 if(in_FromDate <> '' ,concat('and documentsDownloads.statisticalDay >= "',in_FromDate,'" '),''),
		                             	 if(in_ToDate <> '' ,concat('and documentsDownloads.statisticalDay <= "',in_ToDate,'"   '),'')
								 ,'
                     '

			);



	        PREPARE stmt1 FROM @sql1;
			EXECUTE stmt1;






END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_documents_views` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_documents_views`(
    in in_disasterGroupsId varchar(200),
	  in in_documentGroupsId varchar(200),
      in in_FromDate varchar(200),
	  in in_ToDate varchar(200),
      	in in_start_page int,
      in in_end_page int
      
)
BEGIN
 -- 	call thiethai.sp_documents_count('', '', '', '', '', '');





			SET @sql0 = concat('
				select  documents.id, documents.documentsName, ifnull(sum(documentsViews.views),0) as views,totalViews,url
					from
					(
						select documents.id, documents.documentsName, documents.views as totalViews,url
						  FROM
								`documents` AS `documents`
									left JOIN
								`disasterGroupsDocuments` AS `disasterGroupsDocuments` ON `disasterGroupsDocuments`.`documentsId` = `documents`.`id`
								 
							 WHERE
								 	  documents.status = 1 
                                       ',
                                        if(in_disasterGroupsId  <>  '' , concat('and( disasterGroupsDocuments.disasterGroupsId in (',in_disasterGroupsId,') )'),''),
									   if(in_documentGroupsId  <>  '' , concat('and( documents.documentGroupsId in (',in_documentGroupsId,') )'),'')
								 ,'
							group by documents.id
					)documents
						left JOIN
								`documentsViews` AS `documentsViews` ON `documentsViews`.`documentsId` = `documents`.`id`
								 ',
										 if(in_FromDate <> '' ,concat('and documentsViews.statisticalDay >= "',in_FromDate,'" '),''),
		                             	 if(in_ToDate <> '' ,concat('and documentsViews.statisticalDay <= "',in_ToDate,'"   '),'')
								 ,'
                       group by documents.id             
					   order by  sum(documentsViews.views)  desc
                       limit ',in_start_page,',', in_end_page
                              
			);
            
            
	
	        PREPARE stmt0 FROM @sql0;
			EXECUTE stmt0;


		
        		SET @sql1 = concat('
				select  ifnull(sum(documentsViews.views),0) as totalViews , count(distinct documents.id ) as count
					from
					(
						select documents.id, documents.documentsName
						  FROM
								`documents` AS `documents`
									left JOIN
								`disasterGroupsDocuments` AS `disasterGroupsDocuments` ON `disasterGroupsDocuments`.`documentsId` = `documents`.`id`
								
							 WHERE
								 	  documents.status = 1 
								 ',
                                    if(in_disasterGroupsId  <>  '' , concat('and( disasterGroupsDocuments.disasterGroupsId in (',in_disasterGroupsId,') )'),''),
									 if(in_documentGroupsId  <>  '' , concat('and( documents.documentGroupsId in (',in_documentGroupsId,') )'),'')
								 ,'
							group by documents.id
					)documents
						left JOIN
								`documentsViews` AS `documentsViews` ON `documentsViews`.`documentsId` = `documents`.`id`
								 ',
										 if(in_FromDate <> '' ,concat('and documentsViews.statisticalDay >= "',in_FromDate,'" '),''),
		                             	 if(in_ToDate <> '' ,concat('and documentsViews.statisticalDay <= "',in_ToDate,'"   '),'')
								 ,'
                     '
                              
			);
            
            
	
	        PREPARE stmt1 FROM @sql1;
			EXECUTE stmt1;






END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_doSurveys_get_list` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_doSurveys_get_list`(
  in in_customerName varchar(200)  COLLATE utf8mb3_unicode_ci,
  in in_mobile varchar(200)  COLLATE utf8mb3_unicode_ci,
  in in_email varchar(200) COLLATE utf8mb3_unicode_ci,
  in in_surveysId varchar(200),
  in in_questionSuggestionsId varchar(200),
  in in_questionSuggestionsId_length int(11),
  in in_questionId_khac varchar(200),
  in in_questionId_khac_length int(11),
  in in_status int,
  in in_FromDate varchar(200),
  in in_ToDate varchar(200),
  in in_orderBy varchar(200),
  in in_order varchar(200),
  in in_attributes varchar(500),
  in in_start_page bigint,
  in in_end_page bigint
)
BEGIN
	declare ownersId_count,
	  surveysId_count,

	  questionSuggestionsId_count bigint;

	DECLARE sqlWhere,
	  sqlJoin varchar(20000)  COLLATE utf8mb3_unicode_ci;
	if(in_attributes = '') then
	   set in_attributes = 'doSurveys.id,doSurveys.customerName,doSurveys.mobile,doSurveys.email,doSurveys.dateCreated,doSurveys.surveysId';
	end if;





	set sqlWhere = concat(
		' ',
		if(
		  in_email <> '',
		  concat(
			'and (
						   lower(doSurveys.email) like  concat("%",CONVERT(lower("',
			in_email,
			'"), BINARY),"%") )
					 '
		  ),
		  ''
		),
		if(
		  in_mobile <> '',
		  concat(
			'and (
						   lower(doSurveys.mobile) like  concat("%",CONVERT(lower("',
			in_mobile,
			'"), BINARY),"%") )
					 '
		  ),
		  ''
		),
		if(
		  in_customerName <> '',
		  concat(
			'and (
						   lower(doSurveys.customerName) like  concat("%",CONVERT(lower("',
			in_customerName,
			'"), BINARY),"%") )
					 '
		  ),
		  ''
		),

    if(
		  in_surveysId <> '', concat('and ( doSurveys.surveysId  in (',in_surveysId,') )'),
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
          select ',in_attributes,',wards,surveys from (
            select
			   doSurveys.*,
			  json_object("id",surveys.id,"surveysName",surveys.surveysName)surveys,
              (case when  wards.id > 0  then   json_object("id",wards.id,"wardName",wards.wardName,"districts", json_object("id",districts.id,"districtName",districts.districtName,"provinces", json_object("id",provinces.id,"provinceName",provinces.provinceName))    )  else null end    )as wards
			  FROM
				doSurveys
				LEFT OUTER JOIN
					(`wards` AS `wards`
						INNER JOIN `districts` AS `districts` ON `wards`.`districtsId` = `districts`.`id`
						INNER JOIN `provinces` AS `provinces` ON `districts`.`provincesId` = `provinces`.`id`
					) ON `doSurveys`.`wardsId` = `wards`.`id`
				INNER JOIN
				  `surveys` AS `surveys` ON `doSurveys`.`surveysId` = `surveys`.`id`

          '
                ,
          if(
            in_questionSuggestionsId <> '',
                      concat('  INNER JOIN `questionValues` AS `questionValues` ON `questionValues`.`doSurveysId` = `doSurveys`.`id`
                                        and questionSuggestionsId in (',in_questionSuggestionsId,')
              '),
            ' '
				  ),
          if(
            in_questionId_khac <> '',
                      concat('  INNER JOIN `questionValues` AS `questionValues_khac` ON `questionValues_khac`.`doSurveysId` = `doSurveys`.`id`
                                        and `questionValues_khac`.questionSuggestionsId  = 0
                                                                              and `questionValues_khac`.questionsId in (',in_questionId_khac,')
              '),
            ' '
				  ),
                '
				 WHERE 1',sqlWhere,

        if( 
					in_questionSuggestionsId <> '' or in_questionId_khac <> '',
                    ' group by doSurveys.id
					 having 1 ',
					''
				  ),
          if(
					    in_questionSuggestionsId <> '',
              concat('
                      and count(questionValues.id) >= ',in_questionSuggestionsId_length,'
              '),
					''
				  ),
          if(
					  in_questionId_khac <> '',
            concat('
                    and count(questionValues_khac.id) >= ',in_questionId_khac_length,'
            '),
					''
				  ),

			    'order by 	doSurveys.',in_orderBy,' ',in_order,
				 ' limit ',in_start_page,',',in_end_page,'

                 )doSurveys;'
		  );

    
		PREPARE stmt1 FROM @sql1;
		EXECUTE stmt1;



    SET @sql2 = CONCAT(
	'
          select count(*) as count  from
             (select
			   doSurveys.id
			  FROM
				doSurveys  

				   INNER JOIN
				  `surveys` AS `surveys` ON `doSurveys`.`surveysId` = `surveys`.`id`
                ',
          if(
				  	in_questionSuggestionsId <> '',
                concat('  INNER JOIN `questionValues` AS `questionValues` ON `questionValues`.`doSurveysId` = `doSurveys`.`id`
                                  and `questionValues`.questionSuggestionsId in (',in_questionSuggestionsId,')
						'),
					' '
				  ),
          if(
					  in_questionId_khac <> '',
                concat('  INNER JOIN `questionValues` AS `questionValues_khac` ON `questionValues_khac`.`doSurveysId` = `doSurveys`.`id`
                                  and `questionValues_khac`.questionSuggestionsId  = 0
                                  and `questionValues_khac`.questionsId in (',in_questionId_khac,')
						'),
					' '
				  ),

                '

				WHERE 1',sqlWhere,

          if(
            in_questionSuggestionsId <> '' or in_questionId_khac <> '',
                      ' group by doSurveys.id
            having 1 ',
					''
				  ),
                 
          if(
            in_questionSuggestionsId <> '',
                      concat('
                            and count(distinct questionValues.id) >= ',in_questionSuggestionsId_length,'
                      '),
					''
				  ),
                
          if(
              in_questionId_khac <> '',
              concat('
                    and count(distinct questionValues_khac.id) >= ',in_questionId_khac_length,'
              '),
					''
				  ),
			    ')t'
		  );



		PREPARE stmt2 FROM @sql2;
		EXECUTE stmt2;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_getalll_mail_not_read` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_getalll_mail_not_read`(
	in in_usersId bigint
)
BEGIN
		SELECT 
		   JSON_ARRAYAGG(mails.Id)mailsId,
		   JSON_ARRAYAGG(roomMails.Id)roomMailsId
		FROM roomMails
        INNER JOIN mails ON 	mails.roomMailsId = roomMails.id
        INNER JOIN mailsUsers ON 	mailsUsers.mailsId = mails.id
		WHERE 
		 mailsUsers.usersId = in_usersId
         and mailsUsers.readStatus = 0
		 and  mails.status = 1
		 and  mailsUsers.status = 1;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_getAll_users_relatedWithUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_getAll_users_relatedWithUser`(
	in in_usersId bigint
)
BEGIN

     DROP TEMPORARY TABLE IF EXISTS temp_list_roomChats;
	 CREATE TEMPORARY TABLE temp_list_roomChats(
		SELECT 
		   roomChats.id
		FROM roomChats
		  inner join roomChatsUsers on roomChatsUsers.roomChatsId = roomChats.id
		WHERE 
		 roomChatsUsers.usersId = in_usersId
      );
      
     SELECT 
		   roomChatsUsers.usersId,
          (select  users.lastTimeOnline
            FROM users
			WHERE users.Id = in_usersId
		  )lastTimeOnline,
           (select  
			JSON_ARRAYAGG(
				temp_list_roomChats.id	
			)
			
		  )roomChatsUsers
          
	 FROM temp_list_roomChats
          inner join roomChatsUsers on roomChatsUsers.roomChatsId = temp_list_roomChats.id
		  inner join users on roomChatsUsers.usersId = users.id
	  WHERE 
		 roomChatsUsers.usersId <> in_usersId
         and roomChatsUsers.joinStatus = 1
		 and users.onlineStatus = 1
      group by   roomChatsUsers.usersId 
		;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_getList_roomChats` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_getList_roomChats`(
	in in_usersId bigint,
	in in_pageIndex bigint,
    in in_pageSize bigint,
    out out_rowCount bigint,
	out out_unReadRoomCount bigint
)
BEGIN
DECLARE start_page, end_page INT DEFAULT 0;
	SET @row_number = 0;
	set start_page= (in_pageIndex - 1) * in_pageSize + 1;
	set end_page = in_pageIndex*in_pageSize;
    
     DROP TEMPORARY TABLE IF EXISTS temp_list_roomChats;
	 CREATE TEMPORARY TABLE temp_list_roomChats(
		SELECT 
		   roomChats.id,
		   roomChats.roomChatsName,
		   roomChats.roomChatsType,
		   (select count(*)  
			 FROM roomChatsUsers
			 INNER JOIN users ON users.id = roomChatsUsers.usersId
             where roomChatsUsers.roomChatsId = roomChats.id
             and users.onlineStatus = 1
            )totalUsersOnline,
           (
           SELECT
					chatMessages.id
			FROM chatMessages
				INNER JOIN roomChatsUsers ON chatMessages.roomChatsId = roomChatsUsers.roomChatsId and roomChatsUsers.usersId = in_usersId
				where chatMessages.roomChatsId = roomChats.id
                and (chatMessages.status = 1 or chatMessages.status = 0)
                and (
                      roomChatsUsers.joinStatus = 1
                      or chatMessages.id < roomChatsUsers.canReadMessageId
					)
			order by chatMessages.id desc
			limit 1
           )chatMessagesId,
           fn_count_notReadMessage_inRoom(roomChats.id,roomChatsUsers.lastReadedMessageId,roomChatsUsers.joinStatus,roomChatsUsers.canReadMessageId)totalUnread,
		   fn_roomChatsUsers_get(roomChats.id)roomChatsUsers,
		   fn_chatMessages_getTop1(roomChats.id,in_usersId)message
		FROM roomChats
		  inner join roomChatsUsers on roomChatsUsers.roomChatsId = roomChats.id
		WHERE 
		 roomChatsUsers.usersId = in_usersId
      );
 
	set out_rowCount =  (select count(*) from temp_list_roomChats);
    set out_unReadRoomCount =  (select count(*) from temp_list_roomChats where totalUnread >0);
    select * 
       FROM (
			SELECT  
				temp_list_roomChats.*, (@row_number := @row_number + 1) AS rownum 
            FROM temp_list_roomChats
           order by chatMessagesId desc
		) t
		WHERE t.rownum >= start_page and t.rownum <=  end_page
	;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_getList_roomMails` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_getList_roomMails`(
	in in_usersId bigint,
	in in_pageIndex bigint,
    in in_pageSize bigint,
    out out_rowCount bigint,
	out out_unReadRoomCount bigint
)
BEGIN
DECLARE start_page, end_page INT DEFAULT 0;
	SET @row_number = 0;
	set start_page= (in_pageIndex - 1) * in_pageSize + 1;
	set end_page = in_pageIndex*in_pageSize;
    
     DROP TEMPORARY TABLE IF EXISTS temp_list_roomMails;
	 CREATE TEMPORARY TABLE temp_list_roomMails(
		SELECT 
		   roomMails.id,
		   roomMails.roomMailsContent,
           mails.Id as mailsId
		FROM roomMails
        INNER JOIN mails ON 	mails.roomMailsId = roomMails.id
        INNER JOIN mailsUsers ON 	mailsUsers.mailsId = mails.id
		WHERE 
		 mailsUsers.usersId = in_usersId
         and mailsUsers.readStatus = 0
		 and  mails.status = 1
		 and  mailsUsers.status = 1
      );
 
   	set out_rowCount =  (select count(*) from temp_list_roomMails);
    set out_unReadRoomCount = (select count(*) from temp_list_roomMails);
    select * 
       FROM (
			SELECT  
				temp_list_roomMails.*, (@row_number := @row_number + 1) AS rownum 
            FROM temp_list_roomMails
           order by mailsId desc
		) t
		WHERE t.rownum >= start_page and t.rownum <=  end_page
	;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_getList_roomMails_gui` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_getList_roomMails_gui`(
	in in_usersId bigint,
    in in_toUsersId bigint,
    in in_roomMailsContent varchar(500),
    in in_mailCreateDate json,
	in in_pageIndex bigint,
    in in_pageSize bigint,
    out out_rowCount bigint
)
BEGIN
DECLARE start_page, end_page INT DEFAULT 0;
declare in_createDateFrom, in_createDateTo varchar(100); 
	SET @row_number = 0;
	set start_page= (in_pageIndex - 1) * in_pageSize + 1;
	set end_page = in_pageIndex*in_pageSize;
	set in_createDateFrom = ifnull(date_format(STR_TO_DATE(JSON_UNQUOTE(JSON_EXTRACT(in_mailCreateDate,'$[0]')),'%Y-%m-%d %H:%i:%s'),'%Y%m%d'),"");
	set in_createDateTo = ifnull(date_format(STR_TO_DATE(JSON_UNQUOTE(JSON_EXTRACT(in_mailCreateDate,'$[1]')),'%Y-%m-%d %H:%i:%s'),'%Y%m%d'),"");
     DROP TEMPORARY TABLE IF EXISTS temp_list_roomMails;
	 CREATE TEMPORARY TABLE temp_list_roomMails(
			SELECT  distinct
		   roomMails.id,
		   roomMails.roomMailsContent
		FROM roomMails
          inner join mails on mails.roomMailsId = roomMails.id
          inner join mailsUsers on mailsUsers.mailsId = mails.id
		WHERE 
		 mails.userSendersId = in_usersId
		 and  mails.status = 1
         and roomMails.roomMailsContent like concat('%',in_roomMailsContent,'%')
		 and (in_createDateFrom="" or date_format(mails.dateCreated,"%Y%m%d")>= in_createDateFrom)
         and (in_createDateTo ="" or date_format(mails.dateCreated,"%Y%m%d")<= in_createDateTo)
         and (in_toUsersId = 0 or in_toUsersId = mailsUsers.usersId)
      );
 
	set out_rowCount =  (select count(*) from temp_list_roomMails);
    select * 
       FROM (
			SELECT  
			  temp_list_roomMails.*,           
			   fn_count_notReadMail_inRoom(id,in_usersId)totalUnread,
		       fn_mails_getTop1_gui(id,in_usersId)mails, 
		      (@row_number := @row_number + 1) AS rownum 
            FROM temp_list_roomMails
           order by id desc
		) t
		WHERE t.rownum >= start_page and t.rownum <=  end_page
	;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_getList_roomMails_nhan` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_getList_roomMails_nhan`(
	in in_usersId bigint,
    in in_senderId bigint,
    in in_roomMailsContent varchar(500),
    in in_mailCreateDate json,
	in in_pageIndex bigint,
    in in_pageSize bigint,
    out out_rowCount bigint
)
BEGIN
DECLARE start_page, end_page INT DEFAULT 0;
declare in_createDateFrom, in_createDateTo varchar(100); 
	SET @row_number = 0;
	set start_page= (in_pageIndex - 1) * in_pageSize + 1;
	set end_page = in_pageIndex*in_pageSize;
	set in_createDateFrom = ifnull(date_format(STR_TO_DATE(JSON_UNQUOTE(JSON_EXTRACT(in_mailCreateDate,'$[0]')),'%Y-%m-%d %H:%i:%s'),'%Y%m%d'),"");
	set in_createDateTo = ifnull(date_format(STR_TO_DATE(JSON_UNQUOTE(JSON_EXTRACT(in_mailCreateDate,'$[1]')),'%Y-%m-%d %H:%i:%s'),'%Y%m%d'),"");
     DROP TEMPORARY TABLE IF EXISTS temp_list_roomMails;
	 CREATE TEMPORARY TABLE temp_list_roomMails(
			SELECT  distinct
		   roomMails.id,
		   roomMails.roomMailsContent
		FROM roomMails
          inner join mails on mails.roomMailsId = roomMails.id
		  inner join mailsUsers on mailsUsers.mailsId = mails.id
		WHERE 
		 mailsUsers.usersId = in_usersId
         and  mailsUsers.status = 1
         and roomMails.roomMailsContent like concat('%',in_roomMailsContent,'%')
		 and (in_createDateFrom="" or date_format(mails.dateCreated,"%Y%m%d")>= in_createDateFrom)
         and (in_createDateTo ="" or date_format(mails.dateCreated,"%Y%m%d")<= in_createDateTo)
         and (in_senderId = 0 or in_senderId = mails.userSendersId)
      );
 
	set out_rowCount =  (select count(*) from temp_list_roomMails);
    select * 
       FROM (
			SELECT  
			  temp_list_roomMails.*,           
			   fn_count_notReadMail_inRoom(id,in_usersId)totalUnread,
		       fn_mails_getTop1_nhan(id,in_usersId)mails, 
		      (@row_number := @row_number + 1) AS rownum 
            FROM temp_list_roomMails
           order by id desc
		) t
		WHERE t.rownum >= start_page and t.rownum <=  end_page
	;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_getList_user_gui` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_getList_user_gui`(
	in in_usersId bigint,
	in in_pageIndex bigint,
    in in_pageSize bigint,
    out out_rowCount bigint
)
BEGIN
DECLARE start_page, end_page INT DEFAULT 0;
	SET @row_number = 0;
	set start_page= (in_pageIndex - 1) * in_pageSize + 1;
	set end_page = in_pageIndex*in_pageSize;
    
     DROP TEMPORARY TABLE IF EXISTS temp_list_roomChats;
	 CREATE TEMPORARY TABLE temp_list_roomChats(
		SELECT distinct
		   users.id,
		   users.image,
		   users.fullname,
           users.email,
           users.workUnit
           
		FROM users
		  inner join mails on mails.userSendersId = users.id
          inner join mailsUsers on mailsUsers.mailsId = mails.id
		WHERE 
		 mailsUsers.usersId = in_usersId
         and mailsUsers.status = 1
      );
 
	set out_rowCount =  (select count(*) from temp_list_roomChats);
    select * 
       FROM (
			SELECT  
				temp_list_roomChats.*, (@row_number := @row_number + 1) AS rownum 
            FROM temp_list_roomChats
		) t
		WHERE t.rownum >= start_page and t.rownum <=  end_page
	;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_getList_user_nhan` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_getList_user_nhan`(
	in in_usersId bigint,
	in in_pageIndex bigint,
    in in_pageSize bigint,
    out out_rowCount bigint
)
BEGIN
DECLARE start_page, end_page INT DEFAULT 0;
	SET @row_number = 0;
	set start_page= (in_pageIndex - 1) * in_pageSize + 1;
	set end_page = in_pageIndex*in_pageSize;
    
     DROP TEMPORARY TABLE IF EXISTS temp_list_roomChats;
	 CREATE TEMPORARY TABLE temp_list_roomChats(
		SELECT distinct
	
		   users.id,
		   users.image,
		   users.fullname,
           users.email,
           users.workUnit
           
		FROM users
		  inner join mailsUsers on mailsUsers.usersId = users.id
		  inner join mails on mails.id = mailsUsers.mailsId
		WHERE 
		 mails.userSendersId = in_usersId
         and mails.status = 1
      );
 
	set out_rowCount =  (select count(*) from temp_list_roomChats);
     select * 
       FROM (
			SELECT  
				temp_list_roomChats.*, (@row_number := @row_number + 1) AS rownum 
            FROM temp_list_roomChats
		) t
		WHERE t.rownum >= start_page and t.rownum <=  end_page
	;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_literatureGroups_dowloads` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_literatureGroups_dowloads`(
    in in_disasterGroupsId varchar(200),
	
      in in_FromDate varchar(200),
	  in in_ToDate varchar(200)

      
)
BEGIN
 -- 	call thiethai.sp_literatures_count('', '', '', '', '', '');





			SET @sql0 = concat('
				select  literatureGroups.id, literatureGroups.literatureGroupsName,
						ifnull(sum(literaturesDownloads.downloads),0) as downloads,
						count(distinct literatures.id) as countLiteratures
					from literatureGroups 
                    left join 
					(
						select literatures.id,literatureGroupsId
						  FROM
								`literatures` AS `literatures`
									LEFT JOIN
								`disasterGroupsLiteratures` AS `disasterGroupsLiteratures` ON `disasterGroupsLiteratures`.`literaturesId` = `literatures`.`id`
								 ',
									 if(in_disasterGroupsId  <>  '' , concat('and( disasterGroupsLiteratures.disasterGroupsId in (',in_disasterGroupsId,') )'),'')
								 ,'
							 WHERE
								 	  literatures.status = 1 
                                       
							group by literatures.id
					)literatures on literatures.literatureGroupsId = literatureGroups.id
						left JOIN
								`literaturesDownloads` AS `literaturesDownloads` ON `literaturesDownloads`.`literaturesId` = `literatures`.`id`
								 ',
										 if(in_FromDate <> '' ,concat('and literaturesDownloads.statisticalDay >= "',in_FromDate,'" '),''),
		                             	 if(in_ToDate <> '' ,concat('and literaturesDownloads.statisticalDay <= "',in_ToDate,'"   '),'')
								 ,'
                                 where literatureGroups.status = 1
                       group by literatureGroups.id             
					   order by  sum(literaturesDownloads.downloads)  desc
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
/*!50003 DROP PROCEDURE IF EXISTS `sp_literatureGroups_views` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_literatureGroups_views`(
    in in_disasterGroupsId varchar(200),
	
      in in_FromDate varchar(200),
	  in in_ToDate varchar(200)

      
)
BEGIN
 -- 	call thiethai.sp_literatures_count('', '', '', '', '', '');

			SET @sql0 = concat('
				select  literatureGroups.id, literatureGroups.literatureGroupsName, ifnull(sum(literaturesViews.views),0) as views,
                
                         count(distinct literatures.id) as countLiteratures
					from literatureGroups 
                    left join 
					(
						select literatures.id,literatureGroupsId
						  FROM
								`literatures` AS `literatures`
									LEFT JOIN
								`disasterGroupsLiteratures` AS `disasterGroupsLiteratures` ON `disasterGroupsLiteratures`.`literaturesId` = `literatures`.`id`
								 ',
									 if(in_disasterGroupsId  <>  '' , concat('and( disasterGroupsLiteratures.disasterGroupsId in (',in_disasterGroupsId,') )'),'')
								 ,'
							 WHERE
								 	  literatures.status = 1 
                                       
							group by literatures.id
					)literatures on literatures.literatureGroupsId = literatureGroups.id
						left JOIN
								`literaturesViews` AS `literaturesViews` ON `literaturesViews`.`literaturesId` = `literatures`.`id`
								 ',
										 if(in_FromDate <> '' ,concat('and literaturesViews.statisticalDay >= "',in_FromDate,'" '),''),
		                             	 if(in_ToDate <> '' ,concat('and literaturesViews.statisticalDay <= "',in_ToDate,'"   '),'')
								 ,'
                       group by literatureGroups.id             
					   order by  sum(literaturesViews.views)  desc
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
/*!50003 DROP PROCEDURE IF EXISTS `sp_literatures_dowloads` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_literatures_dowloads`(
    in in_disasterGroupsId varchar(200),
	  in in_literaturesGroupsId varchar(200),
      in in_FromDate varchar(200),
	  in in_ToDate varchar(200),
      	in in_start_page int,
      in in_end_page int
      
)
BEGIN
 -- 	call thiethai.sp_literatures_dowloads('', '', '', '', '', '');

			SET @sql0 = concat('
				select  literatures.id, literatures.literaturesName, ifnull(sum(literaturesDownloads.downloads),0) as downloads,
                totalDownloads,url
					from
					(
						select literatures.id, literatures.literaturesName ,literatures.downloads as totalDownloads,url
						  FROM
								`literatures` AS `literatures`
									left JOIN
								`disasterGroupsLiteratures` AS `disasterGroupsLiteratures` ON `disasterGroupsLiteratures`.`literaturesId` = `literatures`.`id`
								 
							 WHERE
								 	  literatures.status = 1 
                                       ',
                                        if(in_disasterGroupsId  <>  '' , concat('and( disasterGroupsLiteratures.disasterGroupsId in (',in_disasterGroupsId,') )'),''),
									   if(in_literaturesGroupsId  <>  '' , concat('and( literatures.literatureGroupsId in (',in_literaturesGroupsId,') )'),'')
								 ,'
							group by literatures.id
					)literatures
						left JOIN
								`literaturesDownloads` AS `literaturesDownloads` ON `literaturesDownloads`.`literaturesId` = `literatures`.`id`
								 ',
										 if(in_FromDate <> '' ,concat('and literaturesDownloads.statisticalDay >= "',in_FromDate,'" '),''),
		                             	 if(in_ToDate <> '' ,concat('and literaturesDownloads.statisticalDay <= "',in_ToDate,'"   '),'')
								 ,'
                       group by literatures.id             
					   order by  sum(literaturesDownloads.downloads)  desc
                       limit ',in_start_page,',', in_end_page
                              
			);
            
	        PREPARE stmt0 FROM @sql0;
			EXECUTE stmt0;


		
        		SET @sql1 = concat('
				select  ifnull(sum(literaturesDownloads.downloads),0) as totalDownloads , count(distinct literatures.id ) as count
					from
					(
						select literatures.id, literatures.literaturesName
						  FROM
								`literatures` AS `literatures`
									left JOIN
								`disasterGroupsLiteratures` AS `disasterGroupsLiteratures` ON `disasterGroupsLiteratures`.`literaturesId` = `literatures`.`id`
								
							 WHERE
								 	  literatures.status = 1 
								 ',
                                    if(in_disasterGroupsId  <>  '' , concat('and( disasterGroupsLiteratures.disasterGroupsId in (',in_disasterGroupsId,') )'),''),
									 if(in_literaturesGroupsId  <>  '' , concat('and( literatures.literatureGroupsId in (',in_literaturesGroupsId,') )'),'')
								 ,'
							group by literatures.id
					)literatures
						left JOIN
								`literaturesDownloads` AS `literaturesDownloads` ON `literaturesDownloads`.`literaturesId` = `literatures`.`id`
								 ',
										 if(in_FromDate <> '' ,concat('and literaturesDownloads.statisticalDay >= "',in_FromDate,'" '),''),
		                             	 if(in_ToDate <> '' ,concat('and literaturesDownloads.statisticalDay <= "',in_ToDate,'"   '),'')
								 ,'
                     '
                              
			);
            
	        PREPARE stmt1 FROM @sql1;
			EXECUTE stmt1;






END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_literatures_views` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_literatures_views`(
    in in_disasterGroupsId varchar(200),
	  in in_literaturesGroupsId varchar(200),
      in in_FromDate varchar(200),
	  in in_ToDate varchar(200),
      	in in_start_page int,
      in in_end_page int
      
)
BEGIN
 -- 	call thiethai.sp_documents_count('', '', '', '', '', '');





			SET @sql0 = concat('
				select  literatures.id, literatures.literaturesName, ifnull(sum(literaturesViews.views),0) as views,totalViews,
                         url
					from
					(
						select literatures.id, literatures.literaturesName , literatures.views as totalViews,url
						  FROM
								`literatures` AS `literatures`
									left JOIN
								`disasterGroupsLiteratures` AS `disasterGroupsLiteratures` ON `disasterGroupsLiteratures`.`literaturesId` = `literatures`.`id`
								 
							 WHERE
								 	  literatures.status = 1 
                                       ',
                                        if(in_disasterGroupsId  <>  '' , concat('and( disasterGroupsLiteratures.disasterGroupsId in (',in_disasterGroupsId,') )'),''),
									   if(in_literaturesGroupsId  <>  '' , concat('and( literatures.literatureGroupsId in (',in_literaturesGroupsId,') )'),'')
								 ,'
							group by literatures.id
					)literatures
						left JOIN
								`literaturesViews` AS `literaturesViews` ON `literaturesViews`.`literaturesId` = `literatures`.`id`
								 ',
										 if(in_FromDate <> '' ,concat('and literaturesViews.statisticalDay >= "',in_FromDate,'" '),''),
		                             	 if(in_ToDate <> '' ,concat('and literaturesViews.statisticalDay <= "',in_ToDate,'"   '),'')
								 ,'
                       group by literatures.id             
					   order by  sum(literaturesViews.views)  desc
                       limit ',in_start_page,',', in_end_page
                              
			);
            
            
	
	        PREPARE stmt0 FROM @sql0;
			EXECUTE stmt0;


		
        		SET @sql1 = concat('
				select  ifnull(sum(literaturesViews.views),0) as totalViews , count(distinct literatures.id ) as count
					from
					(
						select literatures.id, literatures.literaturesName
						  FROM
								`literatures` AS `literatures`
									left JOIN
								`disasterGroupsLiteratures` AS `disasterGroupsLiteratures` ON `disasterGroupsLiteratures`.`literaturesId` = `literatures`.`id`
								
							 WHERE
								 	  literatures.status = 1 
								 ',
                                    if(in_disasterGroupsId  <>  '' , concat('and( disasterGroupsLiteratures.disasterGroupsId in (',in_disasterGroupsId,') )'),''),
									 if(in_literaturesGroupsId  <>  '' , concat('and( literatures.literatureGroupsId in (',in_literaturesGroupsId,') )'),'')
								 ,'
							group by literatures.id
					)literatures
						left JOIN
								`literaturesViews` AS `literaturesViews` ON `literaturesViews`.`literaturesId` = `literatures`.`id`
								 ',
										 if(in_FromDate <> '' ,concat('and literaturesViews.statisticalDay >= "',in_FromDate,'" '),''),
		                             	 if(in_ToDate <> '' ,concat('and literaturesViews.statisticalDay <= "',in_ToDate,'"   '),'')
								 ,'
                     '
                              
			);
            
            
	
	        PREPARE stmt1 FROM @sql1;
			EXECUTE stmt1;






END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_mails_of_room` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_mails_of_room`(
	in in_roomMailsId bigint,
    in in_type integer,
    in in_usersId bigint,
	in in_pageIndex bigint,
    in in_pageSize bigint,
    out out_rowCount bigint
)
BEGIN
DECLARE start_page, end_page INT DEFAULT 0;
	SET @row_number = 0;
	set start_page= (in_pageIndex - 1) * in_pageSize + 1;
	set end_page = in_pageIndex*in_pageSize;
    
     DROP TEMPORARY TABLE IF EXISTS temp_list_roomMails;
	 CREATE TEMPORARY TABLE temp_list_roomMails(
		SELECT  
            mails.id,
             mails.roomMailsId,
            mails.mailTitle,
             mails.type,
            mails.mailContent,
			mails.dateCreated,
            mails.status,
			mails.mailReplyId,
		    mails.userSendersId,
			mails.attachment,
            json_object("id",users.id,"fullname",users.fullname,"username",users.username,"image",users.image,"workUnit",users.workUnit,"email",users.email,"mobile",users.mobile)users
		FROM mails
          inner join users on mails.userSendersId = users.id
		WHERE 
		( mails.roomMailsId = in_roomMailsId
		and mails.status = 1
        and mails.userSendersId = in_usersId
        and in_type = -1)
        or (
         mails.roomMailsId = in_roomMailsId
		and mails.status = 1
        and mails.userSendersId = in_usersId
        and in_type <> -1

        and  mails.type = in_type
        )
          
UNION 
     
SELECT  
		mails.id,
         mails.roomMailsId,
		mails.mailTitle,
        mails.type,
		mails.mailContent,
		mails.dateCreated,
		mails.status,
		mails.mailReplyId,
		mails.userSendersId,
		mails.attachment,
        json_object("id",users.id,"fullname",users.fullname,"username",users.username,"image",users.image,"workUnit",users.workUnit,"email",users.email,"mobile",users.mobile)users
	FROM mails
	  inner join users on mails.userSendersId = users.id
	  inner join mailsUsers on mailsUsers.mailsId = mails.id
	WHERE 
	  (mails.roomMailsId = in_roomMailsId
	  and mailsUsers.status = 1
	  and in_type = -1
	  and mailsUsers.usersId = in_usersId)
      or
        (mails.roomMailsId = in_roomMailsId
	  and mailsUsers.status = 1
	  and in_type <> -1
       and mails.type = in_type
	  and mailsUsers.usersId = in_usersId)
      );
 
	set out_rowCount =  (select count(*) from temp_list_roomMails);
    select * 
       FROM (
			SELECT  
			  temp_list_roomMails.*,
                 
            fn_mails_reciveUsers(id)reviceUsers,
		      (@row_number := @row_number + 1) AS rownum 
            FROM temp_list_roomMails
           order by id desc
		) t
		WHERE t.rownum >= start_page and t.rownum <=  end_page
	;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_mails_of_room_get_all` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_mails_of_room_get_all`(
	in in_roomMailsId bigint,
    in in_usersId bigint
)
BEGIN

SELECT  
		 mails.id ,mails.userSendersId
	FROM mails
	  inner join mailsUsers on mailsUsers.mailsId = mails.id
	WHERE 
	 mails.roomMailsId = in_roomMailsId
	and mailsUsers.status = 1
	and mailsUsers.usersId = in_usersId
    union
 select   mails.id ,mails.userSendersId
	FROM mails
	WHERE 
	 mails.roomMailsId = in_roomMailsId
	and mails.status = 1
	and mails.userSendersId = in_usersId
	;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_mails_of_room_nhan_get_all` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_mails_of_room_nhan_get_all`(
	in in_roomMailsId bigint,
    in in_usersId bigint
)
BEGIN

SELECT  
		mailsUsers.id
	#	,mails.mailTitle,
	#	mails.mailContent,
	#	mails.dateCreated,
	#	mails.status,
	#	mails.mailReplyId,
	#	mails.userSendersId,
	#	mails.attachment
	FROM mails
	  inner join mailsUsers on mailsUsers.mailsId = mails.id
	WHERE 
	 mails.roomMailsId = in_roomMailsId
	and mailsUsers.status = 1
	and mailsUsers.usersId = in_usersId
	;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_mails_of_room_not_read_get_all` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_mails_of_room_not_read_get_all`(
	in in_roomMailsId bigint,
    in in_usersId bigint
)
BEGIN

SELECT  
		mailsUsers.id
	#	,mails.mailTitle,
	#	mails.mailContent,
	#	mails.dateCreated,
	#	mails.status,
	#	mails.mailReplyId,
	#	mails.userSendersId,
	#	mails.attachment
	FROM mails
	  inner join mailsUsers on mailsUsers.mailsId = mails.id
	WHERE 
	 mails.roomMailsId = in_roomMailsId
	and mailsUsers.status = 1
    and mailsUsers.readStatus <> 1
	and mailsUsers.usersId = in_usersId
	;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_mail_one` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_mail_one`(
	in in_mailsId bigint
)
BEGIN

		SELECT  
            mails.id,
            mails.mailTitle,
            mails.type,
              mails.roomMailsId,
            mails.mailContent,
			mails.dateCreated,
            mails.status,
			mails.mailReplyId,
		    mails.userSendersId,
			mails.attachment,
            json_object("id",users.id,"fullname",users.fullname,"username",users.username,"image",users.image,"workUnit",users.workUnit,"email",users.email,"mobile",users.mobile)users,
            fn_mails_reciveUsers(in_mailsId)reviceUsers
		FROM mails
           inner join users on mails.userSendersId = users.id
        where 
		 mails.id = in_mailsId
	;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_roomChatsUsers_lastReadedMessageId_update` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_roomChatsUsers_lastReadedMessageId_update`(
	in in_usersId bigint,
    in in_roomChatsId bigint,
    in in_lastReadedMessageId bigint,
    in in_timeRead datetime
)
BEGIN
	update roomChatsUsers set lastReadedMessageId = in_lastReadedMessageId ,timeRead = in_timeRead
    where lastReadedMessageId < in_lastReadedMessageId
    and roomChatsId = in_roomChatsId
    and usersId = in_usersId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_sum_list_documents` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_sum_list_documents`(
	in in_documentGroupsId varchar(200),
	in in_disasterGroupsId varchar(200),
    in in_FromDate varchar(200),
	in in_ToDate varchar(200),
    in in_dateCreated varchar(200),
    in in_sort varchar(200),
    in in_sortBy varchar(200),
    in in_attributes varchar(500),
   	in in_start_page bigint,
    in in_end_page bigint
)
BEGIN
 -- 	call thiethai.sp_response_sum('', '5', '', '', '', '', '');
        DECLARE sqlWhere  varchar(20000) COLLATE utf8mb3_unicode_ci;
        
        set sqlWhere =  concat(' ',			
			 if(in_FromDate <> '' ,concat('and documents.dateCreated >= "',in_FromDate,'" '),''),
			 if(in_ToDate <> '' ,concat('and documents.dateCreated < "',in_ToDate,'" +  interval 1 day  '),''),
			 ' '
		   );
        
	   SET @sql0 = concat('
             from documents
				inner join documentGroups on documentGroups.id = documents.documentGroupsId ', sqlWhere,
			if(in_documentGroupsId  <>  '' , concat(' and documentGroups.id in (',in_documentGroupsId,') '),' '),
			'
			inner join disasterGroupsDocuments on disasterGroupsDocuments.documentsId = documents.id ',
							if(in_disasterGroupsId  <>  '' , concat(' and disasterGroupsDocuments.disasterGroupsId in (',in_disasterGroupsId,') '),' ')
			);	
            
	SET @sql1 = concat('
          select  sum(s.views) as totalviews ,sum(s.views) as totaldowloads, count(s.id) as count  from ( select distinct documents.id,
          documents.views as views, documents.dowloads as dowloads
       ', @sql0 ,') as s'  
	);
    
    SET @sql2 = concat('
    select distinct documents.id ,documents.documentsCode, documents.documentsName, documents.documentGroupsId, documents.descriptions, documents.status ,documents.views as views, documents.dowloads as dowloads
			, documents.signDate, documents.startDate
    '
    ,@sql0 ,' ',
    if(in_sort  <>  '' , concat(' order by ' ,in_sort ),' '), ' ',
    if(in_sortBy  <>  '' , in_sortBy ,' '),
       ' limit ',in_start_page,',', in_end_page
	);
            
			--  select @sql0;
	        PREPARE stmt2 FROM @sql2;
			EXECUTE stmt2;
           
            PREPARE stmt1 FROM @sql1;
			EXECUTE stmt1;
            
            
            
	
    
  





	

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_surveys_countDoSurveys` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_surveys_countDoSurveys`(
	  in in_FromDate varchar(200),
	  in in_ToDate varchar(200)
)
BEGIN
 -- 	call thiethai.sp_contents_count('', '', '', '', '', '');


			SET @sql0 = concat('
				select  surveys.id, surveys.surveysName, ifnull(count(doSurveys.id),0) as countDoSurveys,
					    surveys.countDoSurveys as totalCountDoSurveys
					from surveys
						left JOIN
								`doSurveys` AS `doSurveys` ON `doSurveys`.`surveysId` = `surveys`.`id`
								 ',
										 if(in_FromDate <> '' ,concat('and doSurveys.dateCreated >= "',in_FromDate,'" '),''),
		                             	 if(in_ToDate <> '' ,concat('and doSurveys.dateCreated <= "',in_ToDate,'"   '),'')
								 ,'
			   WHERE
                     surveys.status = 1
                                
                       group by surveys.id
					   order by count(doSurveys.id)  desc
                       '

			);



	        PREPARE stmt0 FROM @sql0;
			EXECUTE stmt0;
            
            
         
            SET @sql1 = concat('
            
            select count(surveys.id) as countSurveyst ,sum(countDoSurveys) as countDoSurveys,
                    sum(totalCountDoSurveys) as totalCountDoSurveys
                    from (
						select surveys.id, ifnull(count(doSurveys.id),0) as countDoSurveys,
							   surveys.countDoSurveys as totalCountDoSurveys
							from surveys
								left JOIN
										`doSurveys` AS `doSurveys` ON `doSurveys`.`surveysId` = `surveys`.`id`
										 ',
												 if(in_FromDate <> '' ,concat('and doSurveys.dateCreated >= "',in_FromDate,'" '),''),
												 if(in_ToDate <> '' ,concat('and doSurveys.dateCreated <= "',in_ToDate,'"   '),'')
										 ,'
					   WHERE
							 surveys.status = 1
                                group by surveys.id
                )surveys       
                       '

			);



	        PREPARE stmt1 FROM @sql1;
			EXECUTE stmt1;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_tong_quan_doanh_thu` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_tong_quan_doanh_thu`(
    in in_FromDate datetime,
	in in_ToDate datetime

)
BEGIN
 

        DROP TEMPORARY TABLE IF EXISTS temp_countOnline;
		CREATE TEMPORARY TABLE temp_countOnline
		(
    	SELECT
			 *
		FROM
			  `countOnline` AS `countOnline`
             where
                   countOnline.onlineDate >= in_FromDate 
			   and   countOnline.onlineDate < in_ToDate + INTERVAL 1 DAY


	);

  
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
				selectedDate >= in_FromDate
				 and selectedDate <= in_ToDate

		);
 

      select temp_time_ngay.date as date,
		     temp_countOnline.countAccess
      from temp_time_ngay
        left join temp_countOnline on  temp_countOnline.onlineDate  = temp_time_ngay.date
	  

      order by temp_time_ngay.date asc ;


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

-- Dump completed on 2023-08-19 16:18:56
