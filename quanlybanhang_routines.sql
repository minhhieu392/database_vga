-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: quanlybanhang
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
-- Dumping events for database 'quanlybanhang'
--

--
-- Dumping routines for database 'quanlybanhang'
--
/*!50003 DROP FUNCTION IF EXISTS `fn_bills_calculator_byCustomersId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `fn_bills_calculator_byCustomersId`(in_branchesId int,
  in_customersId bigint,

    in_dateFrom date,
    in_dateTo date
) RETURNS double
BEGIN

RETURN (

	select ifnull(sum(totalMoney),0) totalMoney
        from bills
        where  
        bills.staticDay >= in_dateFrom
        and bills.branchesId =in_branchesId
       and  bills.staticDay  < in_dateTo +  INTERVAL 1 DAY
		and bills.status=1
        and bills.planningStatus = 1
		and bills.customersId=in_customersId
        and bills.totalMoney > 0
);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_bills_calculator_byCustomersId_dateTo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `fn_bills_calculator_byCustomersId_dateTo`(in_branchesId int,
in_customersId bigint,
    in_dateTo date
) RETURNS double
BEGIN

RETURN (

	select ifnull(sum(totalMoney),0) totalMoney
        from bills
        where  
        bills.staticDay  < in_dateTo +  INTERVAL 1 DAY
          and bills.branchesId =in_branchesId
		and bills.status=1
        and bills.planningStatus = 1
		and bills.customersId=in_customersId
		and  bills.totalMoney > 0
);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_bills_chi_calculator_byCustomersId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `fn_bills_chi_calculator_byCustomersId`(in_branchesId int,
 in_customersId bigint,
    in_dateFrom date,
    in_dateTo date
) RETURNS double
BEGIN

RETURN (

	select sum(totalMoney) totalMoney
        from bills
        where  
         bills.staticDay >= in_dateFrom
           and bills.branchesId =in_branchesId
       and  bills.staticDay  < in_dateTo +  INTERVAL 1 DAY
		and bills.status=1
        and bills.planningStatus = 1
		and bills.customersId=in_customersId
        and bills.totalMoney < 0
);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
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

 
) RETURNS longtext CHARSET utf8mb4 COLLATE utf8mb4_bin
BEGIN

	declare provincesId ,districtsId,wardsId,villagesId bigint;
    set provincesId = 0 ,districtsId= 0, wardsId= 0,villagesId=0;
    set provincesId = ifnull((select id from provinces where provinces.provinceName like  in_provinceName and status = 1),0);
    if provincesId <> 0 then  set districtsId = ifnull((select id from districts where districts.districtName like  in_districtName and districts.provincesId = provincesId and status = 1),0); end if;
	if districtsId <> 0 then  set wardsId = ifnull((select id from wards where wards.wardName like  in_wardName and wards.districtsId = districtsId and status = 1 ),0); end if;
    if wardsId <> 0 then  set villagesId = ifnull((select id from villages where villages.villageName like  in_villageName and villages.wardsId = wardsId and status = 1),0); end if;
    
	return json_object("provincesId",provincesId,"districtsId",districtsId,"wardsId",wardsId,"villagesId",villagesId);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_get_subUnits` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `fn_get_subUnits`(in_productsId bigint) RETURNS longtext CHARSET utf8mb4 COLLATE utf8mb4_bin
BEGIN

declare cr_productsParentId bigint;
  	set cr_productsParentId = (
			select if(
					products.parentId > 0,
					products.parentId,
					products.id
				)
			from products
			where products.id = in_productsId
		);
    

RETURN    (
       select
        ( case when count(units.id) > 0 then
         json_arrayagg(
          json_object("id", units.id, "unitsName", units.unitsName ,"exchangeValue", units.exchangeValue, "productsId", products.id )
          ) 
          else null end
          )  as subUnits
          from  units
          inner join products on products.unitsId = units.id 
                 and products.status = 1
          where 
          (products.id = cr_productsParentId
          or  products.id in  (select id from products as checkP where  checkP.parentId = cr_productsParentId))
          and products.id <> in_productsId
          
          );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_insurance_check` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `fn_insurance_check`(in_productsId bigint,
  in_status int
) RETURNS int(11)
BEGIN
 declare checkId bigint;
 if(in_status = -99) then return 1;
 else 
  set checkId = (select id from insurance where productsId = in_productsId);

  if(in_status =1 && checkId >0 ) then return 1; end if;
  if(in_status =0 && isnull(checkId) ) then return 1; end if;
 end if;
 return 0;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_ordersProducts_prodcuts` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `fn_ordersProducts_prodcuts`(in_ordersId bigint,
  in_productsName varchar(200),
  in_productsCode varchar(200)
) RETURNS int(11)
BEGIN
  if(in_productsName = '' and in_productsCode = '') then return 1;
  
  elseif(in_productsName<>''and
   exists(
     select ordersProducts.id from ordersProducts 
	  inner join products on products.id = ordersProducts.productsId
      where 
        ordersProducts.ordersId = in_ordersId
       and  lower(products.productsName) like  concat("%",CONVERT(lower(in_productsName), BINARY),"%") 
--       and   lower(products.productsCode) like  concat("%",CONVERT(lower(in_productsCode), BINARY),"%")
     )
	) 
  then return 1;
  elseif(in_productsCode<>''and
   exists(
      select ordersProducts.id from ordersProducts 
	  inner join products on products.id = ordersProducts.productsId
      where 
		ordersProducts.ordersId = in_ordersId
    --   and  lower(products.productsName) like  concat("%",CONVERT(lower(in_productsName), BINARY),"%") 
       and   lower(products.productsCode) like  concat("%",CONVERT(lower(in_productsCode), BINARY),"%")
      
     )
	) 
  then return 1;
  else return 0;
  end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_productCancelsProducts_prodcuts` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `fn_productCancelsProducts_prodcuts`(in_productCancelsId bigint,
  in_productsSearch varchar(200),
  in_productsName varchar(200),
  in_productsCode varchar(200)
) RETURNS int(11)
BEGIN
  if(in_productsName = '' and in_productsCode = '' and in_productsSearch ='' ) then return 1;
  elseif(in_productsSearch<>''and
   exists(
     select productCancelsProducts.id from productCancelsProducts 
	  inner join products on products.id = productCancelsProducts.productsId
      where 
        productCancelsProducts.productCancelsId = in_productCancelsId
        and  (lower(products.productsName) like  concat("%",CONVERT(lower(in_productsSearch), BINARY),"%") 
       or   lower(products.productsCode) like  concat("%",CONVERT(lower(in_productsSearch), BINARY),"%"))
     ))
     then return 1;
  elseif(in_productsName<>''and
   exists(
     select productCancelsProducts.id from productCancelsProducts 
	  inner join products on products.id = productCancelsProducts.productsId
      where 
        productCancelsProducts.productCancelsId = in_productCancelsId
   --     and  lower(products.productsName) like  concat("%",CONVERT(lower(in_productsName), BINARY),"%") 
       and   lower(products.productsCode) like  concat("%",CONVERT(lower(in_productsCode), BINARY),"%")
     )
	) 
  then return 1;
  elseif(in_productsCode<>''and
   exists(
     select productCancelsProducts.id from productCancelsProducts 
	  inner join products on products.id = productCancelsProducts.productsId
      where 
        productCancelsProducts.productCancelsId = in_productCancelsId
    --   and  lower(products.productsName) like  concat("%",CONVERT(lower(in_productsName), BINARY),"%") 
       and   lower(products.productsCode) like  concat("%",CONVERT(lower(in_productsCode), BINARY),"%")
      
     )
	) 
  then return 1;
  else return 0;
  end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_productReturnsProducts_prodcuts` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `fn_productReturnsProducts_prodcuts`(in_productReturnsId bigint,
  in_productsSearch varchar(200),
  in_productsName varchar(200),
  in_productsCode varchar(200)
) RETURNS int(11)
BEGIN
  if(in_productsName = '' and in_productsCode = '' and in_productsSearch ='' ) then return 1;
  elseif(in_productsSearch<>''and
   exists(
     select productReturnsProducts.id from productReturnsProducts 
	  inner join products on products.id = productReturnsProducts.productsId
      where 
        productReturnsProducts.productReturnsId = in_productReturnsId
        and(  lower(products.productsName) like  concat("%",CONVERT(lower(in_productsSearch), BINARY),"%") 
       or    lower(products.productsCode) like  concat("%",CONVERT(lower(in_productsSearch), BINARY),"%"))
     ))
     then return 1;
  elseif(in_productsName<>''and
   exists(
     select productReturnsProducts.id from productReturnsProducts 
	  inner join products on products.id = productReturnsProducts.productsId
      where 
        productReturnsProducts.productReturnsId = in_productReturnsId
   --     and  lower(products.productsName) like  concat("%",CONVERT(lower(in_productsName), BINARY),"%") 
       and   lower(products.productsCode) like  concat("%",CONVERT(lower(in_productsCode), BINARY),"%")
     )
	) 
  then return 1;
  elseif(in_productsCode<>''and
   exists(
     select productReturnsProducts.id from productReturnsProducts 
	  inner join products on products.id = productReturnsProducts.productsId
      where 
        productReturnsProducts.productReturnsId = in_productReturnsId
    --   and  lower(products.productsName) like  concat("%",CONVERT(lower(in_productsName), BINARY),"%") 
       and   lower(products.productsCode) like  concat("%",CONVERT(lower(in_productsCode), BINARY),"%")
      
     )
	) 
  then return 1;
  else return 0;
  end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_productReturns_calculator_byCustomersId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `fn_productReturns_calculator_byCustomersId`(in_branchesId int,in_customersId bigint,
    in_dateFrom date,
    in_dateTo date
) RETURNS double
BEGIN

RETURN (

	select ifnull(sum(totalMoney),0) totalMoney
        from productReturns
        where  
               productReturns.staticDay >= in_dateFrom
        and productReturns.staticDay < in_dateTo + INTERVAL 1 DAY
		and productReturns.status=1
            and productReturns.branchesId=in_branchesId
		and productReturns.customersId=in_customersId
);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_productReturns_calculator_byCustomersId_trahang` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `fn_productReturns_calculator_byCustomersId_trahang`(in_branchesId int,in_customersId bigint,
    in_dateFrom date,
    in_dateTo date
) RETURNS longtext CHARSET utf8mb4 COLLATE utf8mb4_bin
BEGIN

RETURN (

	select JSON_OBJECT("soluongtra",
    ifnull(sum(
		ifnull(
         productReturnsProducts.amount
        ,0)
     ),0),
	"giatritra",
     ifnull(sum(
		ifnull(
          (
			(productReturnsProducts.amount * productReturnsProducts.dealPrice)
            -
            round((productReturns.discount*
				(
					productReturnsProducts.amount * productReturnsProducts.dealPrice/(productReturns.totalMoney-productReturns.totalSurchageMoney-productReturns.returnFee+productReturns.discount)
                )
			),2)
          )
 
        
        ,0)
        ),0),
		"tonggiavon",
		sum(round(productReturnsProducts.amount*productReturnsProducts.importPrice,0))
	 )
        from productReturns
        inner join productReturnsProducts on productReturnsProducts.productReturnsId = productReturns.id
        inner join products on products.id = productReturnsProducts.productsId
        where  
                  productReturns.staticDay >= in_dateFrom
        and productReturns.staticDay < in_dateTo + INTERVAL 1 DAY
		and productReturns.status=1
            and productReturns.branchesId=in_branchesId
		and productReturns.customersId=in_customersId
);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_productReturns_calculator_byProductsId_trahang` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `fn_productReturns_calculator_byProductsId_trahang`(in_branchesId int,in_productsId bigint,
    in_dateFrom date,
    in_dateTo date
) RETURNS longtext CHARSET utf8mb4 COLLATE utf8mb4_bin
BEGIN

RETURN (

	select JSON_OBJECT("soluongtra",
    ifnull(sum(
		ifnull(
         productReturnsProducts.amount
        ,0)
     ),0),
	"giatritra",
     ifnull(sum(
		ifnull(
          (
			if(productReturns.totalMoney = 0, 0,
            (productReturnsProducts.amount * productReturnsProducts.dealPrice)
            -
            round((productReturns.discount*
				(
					productReturnsProducts.amount * productReturnsProducts.dealPrice/(productReturns.totalMoney-productReturns.totalSurchageMoney-productReturns.returnFee+productReturns.discount)
                )
			),2)
            )
          )
 
        
        ,0)
        ),0)
	 )
        from productReturns
        inner join productReturnsProducts on productReturnsProducts.productReturnsId = productReturns.id
        where  
        (        productReturns.staticDay >= in_dateFrom
        and productReturns.staticDay < in_dateTo + INTERVAL 1 DAY
		and productReturns.status=1
            and productReturns.branchesId=in_branchesId
		)
		and productReturnsProducts.productsId=in_productsId
);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_productReturns_calculator_byRangeDate_trahang` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `fn_productReturns_calculator_byRangeDate_trahang`(in_branchesId int,in_dateFrom date,
    in_dateTo datetime
) RETURNS longtext CHARSET utf8mb4 COLLATE utf8mb4_bin
BEGIN

RETURN (

	select JSON_OBJECT("soluongtra",
    ifnull(sum(
		ifnull(
         productReturnsProducts.amount
        ,0)
     ),0),
	"giatritra",
     ifnull(sum(
		ifnull(
          (
			(productReturnsProducts.amount * productReturnsProducts.dealPrice)
            -
            round((productReturns.discount*
				(
					productReturnsProducts.amount * productReturnsProducts.dealPrice/(productReturns.totalMoney-productReturns.totalSurchageMoney-productReturns.returnFee+productReturns.discount)
                )
			),2)
          )
 
        
        ,0)
        ),0)
	 )
        from productReturns
        inner join productReturnsProducts on productReturnsProducts.productReturnsId = productReturns.id
        where  
                  productReturns.staticDay >= in_dateFrom
        and productReturns.staticDay < in_dateTo 
            and productReturns.branchesId=in_branchesId
		and productReturns.status=1
);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_productReturns_calculator_byReceiptsId_trahang` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `fn_productReturns_calculator_byReceiptsId_trahang`(in_branchesId int,in_receiptsId bigint,
    in_dateFrom date,
    in_dateTo date
) RETURNS longtext CHARSET utf8mb4 COLLATE utf8mb4_bin
BEGIN

RETURN (

	select JSON_OBJECT("soluongtra",
    ifnull(sum(
		ifnull(
         productReturnsProducts.amount
        ,0)
     ),0),
	"giatritra",
     ifnull(sum(
		ifnull(
          (
			(productReturnsProducts.amount * productReturnsProducts.dealPrice)
            -
            round((productReturns.discount*
				(
					productReturnsProducts.amount * productReturnsProducts.dealPrice/(productReturns.totalMoney-productReturns.totalSurchageMoney-productReturns.returnFee+productReturns.discount)
                )
			),2)
          )
 
        
        ,0)
        ),0)
	 )
        from productReturns
        inner join productReturnsProducts on productReturnsProducts.productReturnsId = productReturns.id
        where  
        (             productReturns.staticDay >= in_dateFrom
        and productReturns.staticDay < in_dateTo + INTERVAL 1 DAY
		and productReturns.status=1
        and productReturns.branchesId=in_branchesId
        )
		and productReturns.receiptsId=in_receiptsId
);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_productsProperties_get` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `fn_productsProperties_get`(in_propertiesId bigint,
  in_productsId bigint
) RETURNS longtext CHARSET utf8mb4 COLLATE utf8mb4_bin
BEGIN
return (select json_arrayagg(json_object("id",productsProperties.id,"name",productsProperties.name,"propertiesId",productsProperties.propertiesId))
 from productsProperties
 where productsProperties.productsId = in_productsId
 and productsProperties.propertiesId = in_propertiesId);
 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_product_calculator_byCustomersId_giavon` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `fn_product_calculator_byCustomersId_giavon`(in_branchesId int,in_customersId bigint,
    in_dateFrom date,
    in_dateTo date
) RETURNS double
BEGIN

RETURN (

	select 
		sum(receiptsProducts.amount* receiptsProducts.importPrice)
	from receipts
        	inner join receiptsProducts on receiptsProducts.receiptsId = receipts.id
			inner join products on  products.id = receiptsProducts.productsId
        where  
		receipts.staticDay >= in_dateFrom
        and receipts.branchesId >= in_branchesId
        and receipts.staticDay < in_dateTo + INTERVAL 1 DAY
		and receipts.status=1
		and receipts.customersId=in_customersId
);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_product_calculator_byProductsId_doanhthuban` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `fn_product_calculator_byProductsId_doanhthuban`(in_branchesId int,in_productsId bigint,
    in_dateFrom date,
    in_dateTo date
) RETURNS longtext CHARSET utf8mb4 COLLATE utf8mb4_bin
BEGIN

RETURN (

	select JSON_OBJECT("soluongban",soluongban,
    "doanhthuban",if(isnull(tongtien) or tongtien =0  ,0,tongtien-tonggiamgia*tonggiamgia/tongtien)
     
    ) 
    from 
    (
			select 	 ifnull(sum(receiptsProducts.amount),0) as soluongban
            ,if(receipts.totalMoney = 0, 0, (receiptsProducts.amount*receiptsProducts.dealPrice)) as tongtien
            ,  receipts.discount as tonggiamgia
            ,  (receipts.totalMoney-ifnull(receipts.totalSurchageMoney,0)+receipts.discount)  as tongtiensauphi
	        

			from receipts
					inner join receiptsProducts on receiptsProducts.receiptsId = receipts.id
					inner join products on  products.id = receiptsProducts.productsId
				where  
				(         	receipts.staticDay >= in_dateFrom
                    and receipts.branchesId >= in_branchesId
				and receipts.staticDay < in_dateTo + INTERVAL 1 DAY
				and receipts.status=1)
				and receiptsProducts.productsId=in_productsId
       )t 
);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_product_calculator_byReceiptsId_giavon` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `fn_product_calculator_byReceiptsId_giavon`(in_receiptsId bigint
) RETURNS double
BEGIN

RETURN (

	select 
		sum(round(receiptsProducts.amount*receiptsProducts.importPrice,2))
	from receipts
        	inner join receiptsProducts on receiptsProducts.receiptsId = receipts.id
			inner join products on  products.id = receiptsProducts.productsId
        where  
        receipts.status=1
		and receipts.id=in_receiptsId
);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_receiptsProducts_prodcuts` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `fn_receiptsProducts_prodcuts`(in_receiptsId bigint,
  in_productsSearch varchar(200),
  in_productsName varchar(200),
  in_productsCode varchar(200)
) RETURNS int(11)
BEGIN
  if(in_productsName = '' and in_productsCode = '' and in_productsSearch ='' ) then return 1;
  elseif(in_productsSearch<>''and
   exists(
     select receiptsProducts.id from receiptsProducts 
	  inner join products on products.id = receiptsProducts.productsId
      where 
        receiptsProducts.receiptsId = in_receiptsId
        and(  lower(products.productsName) like  concat("%",CONVERT(lower(in_productsSearch), BINARY),"%") 
         or  lower(products.productsCode) like  concat("%",CONVERT(lower(in_productsSearch), BINARY),"%"))
     ))
     then return 1;
  elseif(in_productsName<>''and
   exists(
     select receiptsProducts.id from receiptsProducts 
	  inner join products on products.id = receiptsProducts.productsId
      where 
        receiptsProducts.receiptsId = in_receiptsId
   --     and  lower(products.productsName) like  concat("%",CONVERT(lower(in_productsName), BINARY),"%") 
       and   lower(products.productsCode) like  concat("%",CONVERT(lower(in_productsCode), BINARY),"%")
     )
	) 
  then return 1;
  elseif(in_productsCode<>''and
   exists(
     select receiptsProducts.id from receiptsProducts 
	  inner join products on products.id = receiptsProducts.productsId
      where 
        receiptsProducts.receiptsId = in_receiptsId
    --   and  lower(products.productsName) like  concat("%",CONVERT(lower(in_productsName), BINARY),"%") 
       and   lower(products.productsCode) like  concat("%",CONVERT(lower(in_productsCode), BINARY),"%")
      
     )
	) 
  then return 1;
  else return 0;
  end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_sum_debt` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `fn_sum_debt`(in_customersId bigint
) RETURNS double
BEGIN
  return 	(
select sum(totalMoney) from (
SELECT
		    warehouseIn.id as id ,warehouseIn.warehouseInCode as code , "warehouseIn" as type,dateCreated as dateCreated,
             totalMoney*-1  as totalMoney,
             status, 0 as `order` 
		FROM
			`warehouseIn` AS `warehouseIn`
		 WHERE
            warehouseIn.status = 1
            and warehouseIn.customersId =in_customersId
	union
		SELECT
		    warehouseOut.id as id ,warehouseOut.warehouseOutCode as code , "warehouseOut" as type,dateCreated as dateCreated,
             totalMoney  as totalMoney,
            status, 1 as `order` 
		FROM
			`warehouseOut` AS `warehouseOut`
		 WHERE
            warehouseOut.status = 1
            and warehouseOut.customersId = in_customersId
	union
		SELECT
		    receipts.id as id ,receipts.receiptsCode as code , "receipts" as type,dateCreated as dateCreated,totalMoney  as totalMoney, status,2 as `order`
		FROM
			`receipts` AS `receipts`
		 WHERE 
            receipts.status = 1
            and receipts.customersId =in_customersId
	union
		SELECT
		    productReturns.id as id ,productReturns.productReturnsCode as code , "productReturns" as type, dateCreated as dateCreated,totalMoney * -1  as totalMoney, status,3 as `order`
		FROM
			`productReturns` AS `productReturns`
		 WHERE 
            productReturns.status = 1
            and productReturns.customersId = in_customersId
            
	union   
		SELECT
		    bills.id as id ,bills.billsCode as code , "bills" as type, dateCreated ,totalMoney * -1  as totalMoney,status ,(case when totalMoney > 0 then 4 else 5 end )  as `order`
		FROM
			`bills` AS `bills`
		 WHERE 
            bills.status = 1
            and bills.customersId =in_customersId
) t

);



END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_sum_productReturns_by_customers` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `fn_sum_productReturns_by_customers`(in_branchesId int,in_customers bigint,
  in_totalSalesDateFrom varchar(200), 
  in_totalSalesDateTo varchar(200)
) RETURNS double
BEGIN
  
 return ( select ifnull(sum(productReturns.totalMoney),0)  
  from 
     `productReturns` AS `productReturns`  
  where  `productReturns`.`customersId` = in_customers
  and productReturns.status = 1 
  and productReturns.branchesId = in_branchesId
  and  (in_totalSalesDateFrom ='' or    dateCreated >= in_totalSalesDateFrom )
  and (in_totalSalesDateTo='' or  dateCreated < in_totalSalesDateTo + INTERVAL 1 DAY )
 );
  
  
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_unitcore_get` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `fn_unitcore_get`(in_unitsId bigint
) RETURNS longtext CHARSET utf8mb4 COLLATE utf8mb4_bin
BEGIN
  declare currentParentId bigint;
  set currentParentId = (select parentId from units where id = in_unitsId);
  
   return  (select json_arrayagg(json_object("id", units.id, "unitsName", units.unitsName ,"isCore",units.isCore,"directSales", units.directSales,"exchangeValue", units.exchangeValue)) from  units where units.parentId = in_unitsId  or id = in_unitsId or (parentId = currentParentId and parentId<>0) or id = currentParentId  );

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_warehouseCheckProducts_prodcuts` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `fn_warehouseCheckProducts_prodcuts`(in_warehouseCheckId bigint,
  in_productsSearch varchar(200),
  in_productsName varchar(200),
  in_productsCode varchar(200)
) RETURNS int(11)
BEGIN
  if(in_productsName = '' and in_productsCode = '' and in_productsSearch ='' ) then return 1;
  elseif(in_productsSearch<>''and
   exists(
     select warehouseCheckProducts.id from warehouseCheckProducts 
	  inner join products on products.id = warehouseCheckProducts.productsId
      where 
        warehouseCheckProducts.warehouseCheckId = in_warehouseCheckId
        and ( lower(products.productsName) like  concat("%",CONVERT(lower(in_productsSearch), BINARY),"%") 
       or   lower(products.productsCode) like  concat("%",CONVERT(lower(in_productsSearch), BINARY),"%"))
     ))
     then return 1;
  elseif(in_productsName<>''and
   exists(
     select warehouseCheckProducts.id from warehouseCheckProducts 
	  inner join products on products.id = warehouseCheckProducts.productsId
      where 
        warehouseCheckProducts.warehouseCheckId = in_warehouseCheckId
   --     and  lower(products.productsName) like  concat("%",CONVERT(lower(in_productsName), BINARY),"%") 
       and   lower(products.productsCode) like  concat("%",CONVERT(lower(in_productsCode), BINARY),"%")
     )
	) 
  then return 1;
  elseif(in_productsCode<>''and
   exists(
     select warehouseCheckProducts.id from warehouseCheckProducts 
	  inner join products on products.id = warehouseCheckProducts.productsId
      where 
        warehouseCheckProducts.warehouseCheckId = in_warehouseCheckId
    --   and  lower(products.productsName) like  concat("%",CONVERT(lower(in_productsName), BINARY),"%") 
       and   lower(products.productsCode) like  concat("%",CONVERT(lower(in_productsCode), BINARY),"%")
      
     )
	) 
  then return 1;
  else return 0;
  end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_warehouseCheckProducts_quantity_check` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `fn_warehouseCheckProducts_quantity_check`(in_warehouseCheckProductsId bigint
) RETURNS int(11)
BEGIN

  declare ToDate varchar(200);
  declare  in_productsId bigint;
  
   select productsId, date_format(realTime,'%Y-%m-%d %H:%i:%s')
     into in_productsId,ToDate 
        from warehouseCheckProducts
        inner join warehouseCheck on warehouseCheck.id = warehouseCheckProducts.warehouseCheckId
   where warehouseCheckProducts.id = in_warehouseCheckProductsId;

  
  return 	 ( select ifnull(sum(amount),0) from (
		   SELECT  warehouseInOut.id as id, warehouseInOut.warehouseInOutCode as code,
		  (case when type = 0 then amount else amount*-1 end)  * if(isnull(units.id),1,exchangeValue)  as amount
		FROM
			`warehouseInOutProducts` AS `warehouseInOutProducts`
            INNER JOIN `warehouseInOut` AS `warehouseInOut` ON `warehouseInOut`.`id` =  `warehouseInOutProducts`.`warehouseInOutId`  and warehouseInOut.status  = 1
            INNER JOIN `products` AS `products` ON `products`.`id` =  `warehouseInOutProducts`.`productsId` 
			left JOIN `units` AS `units` ON `units`.`id` =  `products`.`unitsId` 
			where (products.id = in_productsId or products.parentId = in_productsId)
         and date_format(realTime,'%Y-%m-%d %H:%i:%s') < date_format(ToDate,'%Y-%m-%d %H:%i:%s')
           
	union
			SELECT receipts.id as id, receipts.receiptsCode as code,
	       amount*-1  * if(isnull(units.id),1,exchangeValue)  as amount
  
		FROM
			`receiptsProducts` AS `receiptsProducts`
             INNER JOIN `receipts` AS `receipts` ON `receipts`.`id` =  `receiptsProducts`.`receiptsId`  and receipts.status  = 1
			INNER JOIN `products` AS `products` ON `products`.`id` =  `receiptsProducts`.`productsId` 
			left JOIN `units` AS `units` ON `units`.`id` =  `products`.`unitsId` 
		where (products.id = in_productsId or products.parentId = in_productsId)
               and date_format(realTime,'%Y-%m-%d %H:%i:%s') < date_format(ToDate,'%Y-%m-%d %H:%i:%s')
	union
		SELECT  productReturns.id as id, productReturns.productReturnsCode as code,
		    amount   * if(isnull(units.id),1,exchangeValue)  as amount
		FROM
			`productReturnsProducts` AS `productReturnsProducts`
             INNER JOIN `productReturns` AS `productReturns` ON `productReturns`.`id` =  `productReturnsProducts`.`productReturnsId`  and productReturns.status  = 1
			 INNER JOIN `products` AS `products` ON `products`.`id` =  `productReturnsProducts`.`productsId` 
			 left JOIN `units` AS `units` ON `units`.`id` =  `products`.`unitsId` 
			where (products.id = in_productsId or products.parentId = in_productsId)
              and date_format(realTime,'%Y-%m-%d %H:%i:%s') < date_format(ToDate,'%Y-%m-%d %H:%i:%s')
            
    union
			SELECT  warehouseCheck.id as id, warehouseCheck.warehouseCheckCode as code,
		    changeNumber   * if(isnull(units.id),1,exchangeValue)  as amount

			FROM
			`warehouseCheckProducts` AS `warehouseCheckProducts`
             INNER JOIN `warehouseCheck` AS `warehouseCheck` ON `warehouseCheck`.`id` =  `warehouseCheckProducts`.`warehouseCheckId`  and warehouseCheck.status  = 1
			 INNER JOIN `products` AS `products` ON `products`.`id` =  `warehouseCheckProducts`.`productsId` 
			left JOIN `units` AS `units` ON `units`.`id` =  `products`.`unitsId`
		where (products.id = in_productsId or products.parentId = in_productsId)
        and date_format(realTime,'%Y-%m-%d %H:%i:%s') < date_format(ToDate,'%Y-%m-%d %H:%i:%s')
    
      union
			SELECT productCancels.id as id, productCancels.productCancelsCode as code,
		    amount*-1  * if(isnull(units.id),1,exchangeValue)  as amount
		FROM
			`productCancelsProducts` AS `productCancelsProducts`
             INNER JOIN `productCancels` AS `productCancels` ON `productCancels`.`id` =  `productCancelsProducts`.`productCancelsId`  and productCancels.status  = 1
			 INNER JOIN `products` AS `products` ON `products`.`id` =  `productCancelsProducts`.`productsId` 
			 left JOIN `units` AS `units` ON `units`.`id` =  `products`.`unitsId` 
			where (products.id = in_productsId or products.parentId = in_productsId)
            and date_format(realTime,'%Y-%m-%d %H:%i:%s') < date_format(ToDate,'%Y-%m-%d %H:%i:%s')
    )t);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_warehouseInProducts_prodcuts` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `fn_warehouseInProducts_prodcuts`(in_warehouseInId bigint,
  in_productsSearch varchar(200),
  in_productsName varchar(200),
  in_productsCode varchar(200)
) RETURNS int(11)
BEGIN
  if(in_productsName = '' and in_productsCode = '' and in_productsSearch ='' ) then return 1;
  elseif(in_productsSearch<>''and
   exists(
     select warehouseInProducts.id from warehouseInProducts 
	  inner join products on products.id = warehouseInProducts.productsId
      where 
        warehouseInProducts.warehouseInId = in_warehouseInId
   and    (   lower(products.productsName) like  concat("%",CONVERT(lower(in_productsSearch), BINARY),"%") 
       or   lower(products.productsCode) like  concat("%",CONVERT(lower(in_productsSearch), BINARY),"%"))
     ))
     then return 1;
  elseif(in_productsName<>''and
   exists(
     select warehouseInProducts.id from warehouseInProducts 
	  inner join products on products.id = warehouseInProducts.productsId
      where 
        warehouseInProducts.warehouseInId = in_warehouseInId
   --     and  lower(products.productsName) like  concat("%",CONVERT(lower(in_productsName), BINARY),"%") 
       and   lower(products.productsCode) like  concat("%",CONVERT(lower(in_productsCode), BINARY),"%")
     )
	) 
  then return 1;
  elseif(in_productsCode<>''and
   exists(
     select warehouseInProducts.id from warehouseInProducts 
	  inner join products on products.id = warehouseInProducts.productsId
      where 
        warehouseInProducts.warehouseInId = in_warehouseInId
    --   and  lower(products.productsName) like  concat("%",CONVERT(lower(in_productsName), BINARY),"%") 
       and   lower(products.productsCode) like  concat("%",CONVERT(lower(in_productsCode), BINARY),"%")
      
     )
	) 
  then return 1;
  else return 0;
  end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_warehouseOutProducts_prodcuts` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `fn_warehouseOutProducts_prodcuts`(in_warehouseOutId bigint,
  in_productsSearch varchar(200),
  in_productsName varchar(200),
  in_productsCode varchar(200)
) RETURNS int(11)
BEGIN
  if(in_productsName = '' and in_productsCode = '' and in_productsSearch ='' ) then return 1;
  elseif(in_productsSearch<>''and
   exists(
     select warehouseOutProducts.id from warehouseOutProducts 
	  inner join products on products.id = warehouseOutProducts.productsId
      where 
        warehouseOutProducts.warehouseOutId = in_warehouseOutId
        and ( lower(products.productsName) like  concat("%",CONVERT(lower(in_productsSearch), BINARY),"%") 
       or   lower(products.productsCode) like  concat("%",CONVERT(lower(in_productsSearch), BINARY),"%"))
     ))
     then return 1;
  elseif(in_productsName<>''and
   exists(
     select warehouseOutProducts.id from warehouseOutProducts 
	  inner join products on products.id = warehouseOutProducts.productsId
      where 
        warehouseOutProducts.warehouseOutId = in_warehouseOutId
   --     and  lower(products.productsName) like  concat("%",CONVERT(lower(in_productsName), BINARY),"%") 
       and   lower(products.productsCode) like  concat("%",CONVERT(lower(in_productsCode), BINARY),"%")
     )
	) 
  then return 1;
  elseif(in_productsCode<>''and
   exists(
     select warehouseOutProducts.id from warehouseOutProducts 
	  inner join products on products.id = warehouseOutProducts.productsId
      where 
        warehouseOutProducts.warehouseOutId = in_warehouseOutId
    --   and  lower(products.productsName) like  concat("%",CONVERT(lower(in_productsName), BINARY),"%") 
       and   lower(products.productsCode) like  concat("%",CONVERT(lower(in_productsCode), BINARY),"%")
      
     )
	) 
  then return 1;
  else return 0;
  end if;
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
/*!50003 DROP PROCEDURE IF EXISTS `sp_bills_thong_ke` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_bills_thong_ke`(
    in in_group int , -- 0
    in in_customersSearch  varchar(200) COLLATE utf8mb3_unicode_ci,
     in in_customersOrSuplliers  int, -- 99
	in in_usersSearch  varchar(200) COLLATE utf8mb3_unicode_ci,
	in in_otherPeoplesSearch  varchar(200) COLLATE utf8mb3_unicode_ci,
    in in_billTypes int,  -- -99
    in in_planningStatus int, -- -99
    in in_billsCode  varchar(200),
	in in_billTypesId  int, -- -99
    in in_customersId int, -- -99
	in in_otherPeoplesId int, -- -99
	in in_usersId int, -- -99
	in in_usersCreatorId int, -- 0
    in in_bankAccounts int, -- -99
    in in_status int,  -- -99
    in in_FromDate varchar(200),
	in in_ToDate varchar(200)  -- ''  => hiện tại
)
BEGIN


	 SELECT
		sum(case when in_FromDate = ''   then 0
                 when in_FromDate <> '' and bills.staticDay < date(in_FromDate)  then  totalMoney
             else 0
             end
			) as 'quy_dau_ky',
       sum(case when in_FromDate = ''  and totalMoney > 0  then totalMoney
                 when in_FromDate <> '' and bills.staticDay >= date(in_FromDate) 	and (bills.staticDay < date(in_ToDate)  + INTERVAL 1 DAY)   and totalMoney > 0 then  totalMoney
             else 0
             end
			) as 'tong_thu',
        sum(case when in_FromDate = ''  and totalMoney < 0  then totalMoney
                 when in_FromDate <> '' and bills.staticDay >= date(in_FromDate) and (bills.staticDay < date(in_ToDate)  + INTERVAL 1 DAY)   and totalMoney < 0 then  totalMoney
             else 0
             end
			) as 'tong_chi'
		FROM
			`bills` AS `bills`
            inner join `billTypes` AS `billTypes` on `billTypes`.`id` = `bills`.`billTypesId`
            and (in_billTypes = -99 or  billTypes.type = in_billTypes )
            and (in_billTypesId = -99  or  `billTypes`.`id` =  in_billTypesId )
			LEFT OUTER JOIN
		`customers` AS `customers` ON `bills`.`customersId` = `customers`.`id`

			LEFT OUTER JOIN
		`otherPeoples` AS `otherPeoples` ON `bills`.`otherPeoplesId` = `otherPeoples`.`id`
			LEFT OUTER JOIN
		`users` AS `users` ON `bills`.`usersId` = `users`.`id`
		 WHERE
                lower(bills.billsCode) like  concat("%",CONVERT(lower(in_billsCode), BINARY),"%")
               and (in_customersSearch ='' or lower(customers.customersName) like  concat("%",CONVERT(lower(in_customersSearch), BINARY),"%")
					  or
					  lower(customers.customersCode) like  concat("%",CONVERT(lower(in_customersSearch), BINARY),"%")
					  )

				and (in_usersSearch = '' or  lower(users.username) like  concat("%",CONVERT(lower(in_usersSearch), BINARY),"%")
				  or
				  lower(users.fullname) like  concat("%",CONVERT(lower(in_usersSearch), BINARY),"%")
				  )

               and (in_otherPeoplesSearch ='' or lower(otherPeoples.otherPeoplesName) like  concat("%",CONVERT(lower(in_otherPeoplesSearch), BINARY),"%"))
				and(in_planningStatus = -99 or bills.planningStatus = in_planningStatus)
			 	and (in_customersId = -99 or  bills.customersId = in_customersId )
                and (in_otherPeoplesId = -99 or bills.otherPeoplesId = in_otherPeoplesId )
				and (in_usersId = -99 or bills.usersId = in_usersId )
				and (in_usersCreatorId = -99 or bills.usersCreatorId = in_usersCreatorId )
			 	and(in_bankAccounts =-99  or (in_bankAccounts = 1 and  bills.bankAccountsId > 0) or (in_bankAccounts <= 0 and  bills.bankAccountsId  = in_bankAccounts ) )
                and(in_status = -99 or bills.status = in_status)
                and (in_group = 0
					or ( in_group = 1 and bills.customersId >0  and submitter = 0)
							or ( in_group = 2 and bills.customersId >0  and submitter = 1 )
					or ( in_group = 3 and bills.usersId >0  )
					or ( in_group = 4 and bills.otherPeoplesId >0  )
				)

;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_categories_urlSlugs` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_categories_urlSlugs`(
	in in_sitesId bigint,
	in in_categoriesId bigint,
    in in_urlSlug nvarchar(4000)
)
BEGIN
	declare _urlSlug nvarchar(4000);
    declare _count int;
	declare in_id bigint;
	update categories_urlSlugs set status=false
        where sitesId = in_sitesId
		and categoriesId = in_categoriesId
        and id>0;
	set in_id = (select id from categories_urlSlugs where urlSlug = in_urlSlug LIMIT 1);
	if(in_id>0)
	then
		if(exists(select id from categories_urlSlugs where sitesId = in_sitesId
			and categoriesId = in_categoriesId
			and urlSlug = in_urlSlug order by id desc limit 1))
		then
			set _urlSlug = in_urlSlug;
			update categories_urlSlugs set status=true
			where sitesId = in_sitesId
			and categoriesId = in_categoriesId
			and urlSlug = in_urlSlug
			and id>0;
        else
			set _count =(select count(*) from categories_urlSlugs where
					urlSlug like concat(in_urlSlug,'%'));
			set in_urlSlug = concat(in_urlSlug,'-', _count + 1);
            set _urlSlug = in_urlSlug;
			insert into categories_urlSlugs(categoriesId,sitesId,urlSlug,status)
			values(in_categoriesId,in_sitesId,in_urlSlug,true);
        end if;
	else
		set _urlSlug = in_urlSlug;
		insert into categories_urlSlugs(categoriesId,sitesId,urlSlug,status)
        values(in_categoriesId,in_sitesId,in_urlSlug,true);
    end if;
    
    update categories set urlSlugs= in_urlSlug where id = in_categoriesId;
    select * from categories_urlSlugs
		where sitesId = in_sitesId
		and categoriesId = in_categoriesId
        and status = true;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_customers_ban_tra_hang` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_customers_ban_tra_hang`(
    in in_customersId bigint,
	in in_start_page bigint,
    in in_end_page bigint,
    out out_rowCount bigint
)
BEGIN
	SET @row_number = 0;


   
	DROP TEMPORARY TABLE IF EXISTS temp_list_ecommerProduct;
	CREATE TEMPORARY TABLE temp_list_ecommerProduct(
		SELECT
		    receipts.id as id ,receipts.receiptsCode as code , "receipts" as type, receipts.dateCreated,totalMoney,amountPaid,receipts.status,
            	json_object("id",usersCreator.id,"username",usersCreator.username,"fullname",usersCreator.fullname )usersCreator
		FROM
			`receipts` AS `receipts`
            	INNER JOIN
			`users` AS `usersCreator` ON `receipts`.`usersCreatorId` = `usersCreator`.`id`
		 WHERE 
            receipts.status = 1
            and receipts.customersId = in_customersId
        union
		SELECT
		    productReturns.id as id ,productReturns.productReturnsCode as code , "productReturns" as type, productReturns.dateCreated,totalMoney * -1 as totalMoney,amountPaid,productReturns.status,
                        	json_object("id",usersCreator.id,"username",usersCreator.username,"fullname",usersCreator.fullname )usersCreator
		FROM
			`productReturns` AS `productReturns`
                        	INNER JOIN
			`users` AS `usersCreator` ON `productReturns`.`usersCreatorId` = `usersCreator`.`id`
		 WHERE 
            productReturns.status = 1
            and productReturns.customersId = in_customersId
    );

	set out_rowCount =  (select count(*) from temp_list_ecommerProduct);

	set @SQLStatement1=concat('
    select temp_list_ecommerProduct.*
		FROM temp_list_ecommerProduct
		order by dateCreated desc
		limit ',in_start_page,',', in_end_page
	);

   	PREPARE stmt1 FROM @SQLStatement1;
    EXECUTE stmt1;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_customers_debt_list` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_customers_debt_list`(
    in in_customersId bigint,
	in in_start_page bigint,
    in in_pageSize bigint,
    out out_rowCount bigint
)
BEGIN
	SET @row_number = 0;

	DROP TEMPORARY TABLE IF EXISTS temp_list_ecommerProduct;
	CREATE TEMPORARY TABLE temp_list_ecommerProduct(

	 SELECT
		    warehouseIn.id as id ,warehouseIn.warehouseInCode as code , "warehouseIn" as type,dateCreated as dateCreated,
             totalMoney*-1  as totalMoney,
             status, 0 as `order` 
		FROM
			`warehouseIn` AS `warehouseIn`
		 WHERE
            warehouseIn.status = 1
            and warehouseIn.customersId = in_customersId     
	union
		SELECT
		    warehouseOut.id as id ,warehouseOut.warehouseOutCode as code , "warehouseOut" as type,dateCreated as dateCreated,
             totalMoney  as totalMoney,
            status, 1 as `order` 
		FROM
			`warehouseOut` AS `warehouseOut`
		 WHERE
            warehouseOut.status = 1
            and warehouseOut.customersId = in_customersId     
	union
		SELECT
		    receipts.id as id ,receipts.receiptsCode as code , "receipts" as type,dateCreated as dateCreated,totalMoney  as totalMoney, status,2 as `order`
		FROM
			`receipts` AS `receipts`
		 WHERE 
            receipts.status = 1
            and receipts.customersId = in_customersId
	union
		SELECT
		    productReturns.id as id ,productReturns.productReturnsCode as code , "productReturns" as type, dateCreated as dateCreated,totalMoney * -1  as totalMoney, status,3 as `order`
		FROM
			`productReturns` AS `productReturns`
		 WHERE 
            productReturns.status = 1
            and productReturns.customersId = in_customersId
            
	union   
		SELECT
		    bills.id as id ,bills.billsCode as code , "bills" as type, dateCreated ,totalMoney * -1  as totalMoney,status ,(case when totalMoney > 0 then 4 else 5 end )  as `order`
		FROM
			`bills` AS `bills`
		 WHERE 
            bills.status = 1
            and bills.customersId = in_customersId        
   
    );

	set out_rowCount =  (select count(*) from temp_list_ecommerProduct);

	set @SQLStatement1=concat('
    select temp_list_ecommerProduct.*
		FROM temp_list_ecommerProduct
		order by dateCreated desc ,`order` desc 
		limit ',in_start_page,',', in_pageSize
	);

   	PREPARE stmt1 FROM @SQLStatement1;
    EXECUTE stmt1;
    
    
	set @SQLStatement2=concat('
    select ifnull(sum(totalMoney),0) as preTotalMoney from 
     (select temp_list_ecommerProduct.id,temp_list_ecommerProduct.type,totalMoney
		FROM temp_list_ecommerProduct
		order by dateCreated desc ,`order` desc 
		limit ', in_start_page + in_pageSize,',',  if(out_rowCount -  (in_start_page + in_pageSize) <0 ,0 ,out_rowCount -  (in_start_page + in_pageSize)),'
	 )t
        '
	);

   	PREPARE stmt2 FROM @SQLStatement2;
    EXECUTE stmt2;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_customers_get_list` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_customers_get_list`(
	in in_status int, -- -99	
	in in_customersType int, -- -99
	in in_search varchar(200),  -- ten , ma , so dien thoai
	in in_usersCreatorId bigint, -- 0
	in in_wardsId bigint ,  -- 0
	in in_provincesId bigint, -- 0
	in in_districtsId bigint,  -- 0
	in in_totalSalesFrom varchar(200),  -- ''
	in in_totalSalesTo varchar(200),  -- ''
	in in_totalSalesDateFrom varchar(200), -- ''
	in in_totalSalesDateTo varchar(200), -- ''
	in in_debtFrom varchar(200), -- ''
	in in_debtTo varchar(200), -- ''
	in in_customersOrSuplliers  int, -- ''
	in in_gender int ,  -- ''
    in in_FromDate varchar(200), -- ''
	in in_ToDate varchar(200), -- ''
	in in_orderBy varchar(200), 
	in in_order varchar(200),
    in in_attributes varchar(500),
	in in_start_page bigint,
    in in_end_page bigint,
    out out_rowCount bigint
)
BEGIN
     DECLARE sqlWhere ,sqlCreateTable, sqlWherProduct,sqlHaving,sqlWherProductReturn, sqlJoinMua_nhap , sqlJoinTra  varchar(20000);
	SET @row_number = 0;
  
   if(in_attributes = '') then 
    set in_attributes = 'id,customersType,customersCompanyName,image,customersName,customersTaxNumber,customersCode,email,mobile,address,facebook,usersCreatorId,dateUpdated,dateCreated,status,wardsId,birthday,note,debt,gender,tong_ban,tong_ban_tru_tra_hang,customersOrSuplliers';
   end if;
   
   set sqlWhere =  concat(' ',
	 if(in_status <> -99,concat(' and (customers.status =  ',in_status ,')'),''),
     if(in_customersType <> -99,concat(' and (customers.customersType =  ',in_customersType ,')'),''),
	 if(in_customersOrSuplliers <> -99,concat('and( (customersOrSuplliers < 2 and  customers.customersOrSuplliers = ',in_customersOrSuplliers,')  or (',in_customersOrSuplliers ,'  = 3 and customers.customersOrSuplliers in (0,2) ) or (',in_customersOrSuplliers ,'  = 4 and customers.customersOrSuplliers in (1,2) ) )'),''),
	 if(in_gender <> -99,concat('and (customers.gender =  ',in_gender ,')'),''),
     if(in_search <> '',concat('and (lower(customers.customersName) like  concat("%",CONVERT(lower("',in_search,'"), BINARY),"%") or lower(customers.customersCode) like  concat("%",CONVERT(lower("',in_search,'"), BINARY),"%") or lower(customers.mobile) like  concat("%",CONVERT(lower("',in_search,'"), BINARY),"%"))'),''),
	 if(in_usersCreatorId <> 0 ,concat('and (customers.usersCreatorId =  ',in_usersCreatorId ,')'),''),
     if(in_wardsId <> 0 ,concat('and (wards.id =  ',in_wardsId ,')'),''),
     if(in_provincesId <> 0 ,concat('and (provinces.id =  ',in_provincesId ,')'),''),
     if(in_districtsId <> 0 ,concat('and (districts.id =  ',in_districtsId ,')'),''),
  
	 if(in_debtFrom <> '' and (in_customersOrSuplliers = 3 or in_customersOrSuplliers = 0) ,concat('and (customers.debt * -1 >=  ',in_debtFrom ,')'),''),
	 if(in_debtTo <> ''   and (in_customersOrSuplliers = 3 or in_customersOrSuplliers = 0)  ,concat('and (customers.debt * -1 <=  ',in_debtTo ,')'),''),
	 if(in_debtFrom <> ''  and (in_customersOrSuplliers = 4 or in_customersOrSuplliers = 1)  ,concat('and (customers.debt  >=  ',in_debtFrom ,')'),''),
	 if(in_debtTo <> ''  and (in_customersOrSuplliers = 4 or in_customersOrSuplliers = 1) ,concat('and (customers.debt  <=  ',in_debtTo ,')'),''),
     if(in_FromDate <> '' ,concat('and customers.dateCreated >= "',in_FromDate,'"'),''),
     if(in_ToDate <> '' ,concat('and customers.dateCreated < "',in_ToDate,'" + INTERVAL 1 DAY'),''),
     ''
   );
   
 if(in_customersOrSuplliers = 3 or in_customersOrSuplliers = 0) then 
   set sqlWherProduct =  concat(' ',
     if(in_totalSalesDateFrom <> '' ,concat('and receipts.staticDay >= "',date(in_totalSalesDateFrom),'"'),''),
     if(in_totalSalesDateTo <> '' ,concat('and receipts.staticDay < "',date(in_totalSalesDateTo),'" + INTERVAL 1 DAY'),''),
     ''
   );
   

  set sqlWherProductReturn =  concat(' ',
     if(in_totalSalesDateFrom <> '' ,concat('and productReturns.staticDay >= "',date(in_totalSalesDateFrom),'"'),''),
     if(in_totalSalesDateTo <> '' ,concat('and productReturns.staticDay < "',date(in_totalSalesDateTo),'" + INTERVAL 1 DAY'),''),
     ''
   );
 
	set sqlJoinMua_nhap = concat('	left JOIN
				 `receipts` AS `receipts`  
				  ON `receipts`.`customersId` = `customers`.`id` and receipts.status = 1',sqlWherProduct);
                  
	set sqlJoinTra = concat('left JOIN
			 `productReturns` AS `productReturns`  
			  ON `productReturns`.`customersId` = `t`.`id` and productReturns.status = 1 ',sqlWherProductReturn);              
  elseif(in_customersOrSuplliers = 4 or in_customersOrSuplliers = 1 ) then
	 set sqlWherProduct =  concat(' ',
      if(in_totalSalesDateFrom <> '' ,concat('and warehouseIn.staticDay >= "',date(in_totalSalesDateFrom),'"'),''),
      if(in_totalSalesDateTo <> '' ,concat('and warehouseIn.staticDay < "',date(in_totalSalesDateTo),'" + INTERVAL 1 DAY'),''),

     ''
    );
    
	 set sqlWherProductReturn =  concat(' ',
		 if(in_totalSalesDateFrom <> '' ,concat('and warehouseOut.staticDay >= "',date(in_totalSalesDateFrom),'"'),''),
		 if(in_totalSalesDateTo <> '' ,concat('and warehouseOut.staticDay < "',date(in_totalSalesDateTo),'" + INTERVAL 1 DAY'),''),
		 ''
	   );
 
		set sqlJoinMua_nhap = concat('	left JOIN
					 `warehouseIn` AS `warehouseIn`  
					  ON `warehouseIn`.`customersId` = `customers`.`id` and warehouseIn.status = 1  ',sqlWherProduct);
					  
		set sqlJoinTra = concat('	left JOIN
					 `warehouseOut` AS `warehouseOut`  
					  ON `warehouseOut`.`customersId` = `t`.`id` and warehouseOut.status = 1  ',sqlWherProductReturn);
     end if;


  set sqlHaving =  concat('',
     if(in_totalSalesFrom <> '' ,concat('and (sum(receipts.totalMoney) >=  ',in_totalSalesFrom ,')'),''),
     if(in_totalSalesTo <> '' ,concat('and (sum(receipts.totalMoney)  <=  ',in_totalSalesTo ,')'),''),
     ' '
   );
   
	DROP TEMPORARY TABLE IF EXISTS temp_list_customer;
    SET @sql1 = CONCAT('
	CREATE TEMPORARY TABLE temp_list_customer(
    
    select 
     max(t.id) as id ,max(t.customersType) as customersType,max(image) as image, max(customersName) as  customersName ,max(customersTaxNumber) as customersTaxNumber, max(customersCode) as customersCode,max(t.email) as email,max(t.mobile) as mobile,max(t.address) as address,max(t.facebook) as facebook ,max(t.usersCreatorId) as usersCreatorId,max(t.dateUpdated)  as dateUpdated,max(t.dateCreated) as dateCreated,max(t.status) as status,max(t.wardsId) as wardsId,max(t.birthday) as birthday,max(t.note) as note,max(t.gender) as gender,
				max(customersOrSuplliers) as customersOrSuplliers,
                max(t.debt) as debt,
                max(t.tong_ban) as tong_ban,
                max(customersCompanyName) as customersCompanyName,
              max(t.tong_ban)  
              - ifnull(sum(totalMoney),0)  
              as  tong_ban_tru_tra_hang
                
    from (
			SELECT
				customers.id,customersType,image,customersName,customersTaxNumber,customersCode,customers.email,customers.mobile,customers.address,customers.facebook,customers.usersCreatorId,customers.dateUpdated,customers.dateCreated,customers.status,customers.wardsId,customers.birthday,customers.note,customers.gender,customersCompanyName,
				customers.debt *-1 as debt,
				ifnull(sum(totalMoney),0) as "tong_ban",
                customersOrSuplliers
			FROM
				`customers` AS `customers`
				',sqlJoinMua_nhap,'
				 left JOIN
				 (`wards` AS `wards`  
				  inner join `districts` AS `districts`  on `wards`.`districtsId` = `districts`.`id` 
				  inner join `provinces` AS `provinces`  on `districts`.`provincesId` = `provinces`.`id` 
				 ) ON `wards`.`id` = `customers`.`wardsId` 
			 WHERE 
				   1
					',sqlWhere,'
					 group by customers.id
					 having 1 
					 ',sqlHaving,'
                     
		   )t
			',sqlJoinTra,'
			  group by t.id
		);
	');


   	PREPARE stmt1 FROM @sql1;

	EXECUTE stmt1;

	set out_rowCount =  (select count(*) from temp_list_customer);

	set @SQLStatement1=concat('
    select ',in_attributes,'
		FROM temp_list_customer
		order by ',
        if(in_orderBy <> '' ,in_orderBy,' id '), ' ',
        if(in_order <> '' ,in_order,' desc '),
        '
		limit ',in_start_page,',', in_end_page
	);
   
  	PREPARE stmt2 FROM @SQLStatement1;
    EXECUTE stmt2;
    
	select sum(debt) as debt, sum(tong_ban)  as "tong_ban" ,sum(tong_ban_tru_tra_hang) as "tong_ban_tru_tra_hang"  from temp_list_customer;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_don_vi_hanh_chinh_find` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_don_vi_hanh_chinh_find`(
   in	in_provinceName varchar(200),
   in in_districtName varchar(200),
   in in_wardName varchar(200),
   in in_villageName varchar(200)
)
BEGIN
  select fn_don_vi_hanh_chinh_find(in_provinceName, in_districtName, in_wardName, in_villageName) as dvhc;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_ordersProducts_thong_ke` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_ordersProducts_thong_ke`(
   in in_branchesId bigint(20), -- 0 
    in in_ordersCode varchar(200),
    in in_productsCode varchar(200),
    in in_productsName  varchar(200),
	in in_customersSearch  varchar(200),
	in in_customersId int,
	in in_usersCreatorId int,
    in in_status int,
    in in_FromDate varchar(200),
	in in_ToDate varchar(200)
)
BEGIN
-- call quanlybanhang.sp_ordersProducts_thong_ke('', -1, '', '', '', 0, 0, 1, '', '');

DECLARE sqlWhere  varchar(20000) COLLATE utf8mb3_unicode_ci;

set sqlWhere =  concat(' ',
     if(in_branchesId <> 0,concat(' and ( orders.branchesId = ',in_branchesId,') '),' '),
	 if(in_ordersCode <> '',concat(' and lower(orders.ordersCode) like  concat("%",CONVERT(lower("',in_ordersCode,'"), BINARY),"%")'),' '),
     if(in_customersId <> 0,concat(' and ( orders.customersId = ',in_customersId,')'), ' '),
	 if(in_customersSearch <> '',' and customers.id >0 ',' '),
	 if(in_usersCreatorId <> 0,concat(' and (orders.usersCreatorId = ',in_usersCreatorId,')'), ' '),
     if(in_FromDate <> '' ,concat('and orders.staticDay >= "',date(in_FromDate),'"'),''),
     if(in_ToDate <> '' ,concat('and orders.staticDay < "',date(in_ToDate),'" + INTERVAL 1 DAY'),''),
     if(in_productsName <> '' and in_productsCode <> '' ,concat(' and fn_ordersProducts_prodcuts(orders.id,',in_productsName,in_productsCode,') = 1'), ' '),
     if(in_status <> -99, concat(' and orders.status =',in_status ), ' and  orders.status > -98 ' ),
     ' '
   );
set @sql0 = concat('
	 SELECT

 sum(money) as money,
		  sum(discount) as discount ,
		  sum(totalMoney) as totalMoney ,
		  sum(amountPaid) as amountPaid,
          sum(totalAmount) as totalAmount,
		  sum(totalSurchageMoney) as totalSurchageMoney
	 FROM
	(
		select  -- money, discount ,totalMoney ,amountPaid,totalSurchageMoney,
		 -- (select  sum(amount) from ordersProducts where ordersProducts.ordersId = orders.id) as amount
		ifnull(orders.money,0) as money,
		 ifnull(orders.discount,0)as discount,
		 ifnull(orders.totalMoney,0) as totalMoney,
		 ifnull(orders.amountPaid,0) as amountPaid,
         ifnull(sum(ordersProducts.amount),0) as totalAmount,
          ifnull(orders.totalSurchageMoney,0) as totalSurchageMoney
		FROM
			orders
            inner join ordersProducts on ordersProducts.ordersId = orders.id
            LEFT OUTER JOIN
			`customers` AS `customers` ON `orders`.`customersId` = `customers`.`id`
            and (
                lower(customers.customersName) like  concat("%",CONVERT(lower("',in_customersSearch,'"), BINARY),"%")
                or 
				lower(customers.customersCode) like  concat("%",CONVERT(lower("',in_customersSearch,'"), BINARY),"%"))
		 WHERE
         1 ', sqlWhere,
         '
			group by orders.id
		
	)t');

PREPARE stmt0 FROM @sql0;
			EXECUTE stmt0;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_productCancelsProducts_thong_ke` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_productCancelsProducts_thong_ke`(
    in in_branchesId bigint(20),

    in in_productCancelsCode varchar(200),
       in in_productsSearch varchar(200),
    in in_productsCode varchar(200),
    in in_productsName  varchar(200),
	in in_usersCreatorId int,
    in in_status int,
    in in_FromDate varchar(200),
	in in_ToDate varchar(200)
)
BEGIN
-- call quanlybanhang.sp_productCancelsProducts_thong_ke('', '', '', 0, 1, '', '');

DECLARE sqlWhere  varchar(20000) COLLATE utf8mb3_unicode_ci;

	set sqlWhere =  concat(' ',
			if(in_branchesId <> 0,concat(' and (productCancels.branchesId =  ',in_branchesId ,')'),''),
	 if(in_productCancelsCode <> '',concat(' and lower(productCancels.productCancelsCode) like  concat("%",CONVERT(lower("',in_productCancelsCode,'"), BINARY),"%")'),' '),
	 if(in_usersCreatorId <> 0,concat(' and (orders.usersCreatorId = ',in_usersCreatorId,')'), ' '),
     if(in_FromDate <> '' ,concat('and productCancels.staticDay >= "',date(in_FromDate),'"'),''),
     if(in_ToDate <> '' ,concat('and productCancels.staticDay < "',date(in_ToDate),'" + INTERVAL 1 DAY'),''),
     if(in_productsName <> '' or  in_productsCode <> '' or in_productsSearch<> '' ,concat(' and  fn_productCancelsProducts_prodcuts(productCancels.id,"',in_productsSearch,'","',in_productsName,'","',in_productsCode,'") = 1'), ' '),
     if(in_status <> -99, concat(' and productCancels.status =',in_status ), ' and  productCancels.status > -98 ' ),
     ' '
   );
   
   set @sql0 = concat('
		select 
		 ifnull(sum(productCancels.totalMoney),0) as totalMoney
		FROM
			productCancels
            inner join productCancelsProducts on productCancelsProducts.productCancelsId = productCancels.id
            
		WHERE
               1 ', sqlWhere)
    ;
    
             PREPARE stmt0 FROM @sql0;
			EXECUTE stmt0;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_productReturnsProducts_thong_ke` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_productReturnsProducts_thong_ke`(
    in in_ordersCode varchar(200),
    in in_productReturnsCode varchar(200),
  in   in_productsSearch varchar(200),
    in in_productsCode varchar(200),
    in in_productsName  varchar(200),
	in in_customersSearch  varchar(200),
	in in_customersId int,
	in in_usersCreatorId int,
    in in_status int,
    in in_FromDate varchar(200),
	in in_ToDate varchar(200)
)
BEGIN
-- call quanlybanhang.sp_productReturnsProducts_thong_ke('', '', '', '', '', 0, 0, 1, '', '');
DECLARE sqlWhere varchar(20000);
set sqlWhere =  concat(' ',
	 if(in_productReturnsCode <> '',concat(' and lower(productReturns.productReturnsCode) like  concat("%",CONVERT(lower("',in_productReturnsCode,'"), BINARY),"%")'),' '),
     if(in_customersId <> 0,concat(' and ( productReturns.customersId = ',in_customersId,')'), ' '),
	 if(in_customersSearch <> '',' and customers.id >0 ',' '),
	 if(in_usersCreatorId <> 0,concat(' and (productReturns.usersCreatorId = ',in_usersCreatorId,')'), ' '),
     if(in_FromDate <> '' ,concat('and productReturns.staticDay >= "',date(in_FromDate),'"'),''),
     if(in_ToDate <> '' ,concat('and productReturns.staticDay < "',date(in_ToDate),'" + INTERVAL 1 DAY'),''),
     if(in_productsName <> '' or  in_productsCode <> '' or in_productsSearch<> '' ,concat(' and fn_productReturnsProducts_prodcuts(productReturns.id,"',in_productsSearch,'","',in_productsName,'","',in_productsCode,'") = 1'), ' '),
     if(in_status <> -99 , concat(' and productReturns.status =',in_status),' '),
     ' '
   );
   
   set @sql0 = concat('
	 SELECT
         ifnull(sum(money),0) as money,
		 ifnull(sum(totalMoney),0) as totalMoney,
         ifnull(sum(returnFee),0) as returnFee,
		 ifnull(sum(amountPaid),0) as amountPaid,
		 ifnull(sum(discount),0) as discount,
		 ifnull(sum(totalSurchageMoney),0) as totalSurchageMoney
	FROM
			`productReturns` AS `productReturns`
              LEFT OUTER JOIN
			`customers` AS `customers` ON `productReturns`.`customersId` = `customers`.`id`
            and (
                lower(customers.customersName) like  concat("%",CONVERT(lower("',in_customersSearch,'"), BINARY),"%")
                or 
				lower(customers.customersCode) like  concat("%",CONVERT(lower("',in_customersSearch,'"), BINARY),"%"))
	WHERE
    1 ',sqlWhere
    )
	;
PREPARE stmt1 FROM @sql0;
	EXECUTE stmt1;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_productsBatchs_get_list` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_productsBatchs_get_list`(
    in in_productsBatchsId varchar(200),
    in in_pricelistId  bigint, -- 0 
    in in_branchesId bigint,
    in in_productsName varchar(200) COLLATE utf8mb3_unicode_ci,
    in in_productsCode varchar(200)COLLATE utf8mb3_unicode_ci,
    in in_search varchar(200)COLLATE utf8mb3_unicode_ci,
    in in_customersId bigint, 
    in in_quantityStatus  int, 
	in in_productGroupsId int,
	in in_brandsId int,
	in in_productPlacementsId int,
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
-- call quanlybanhang.sp_products_get_list(0, 0, '', 0, 0, 0, 0, 0, 1, '', '', 'id', 'desc', '', 0, 10, @out_rowCount);
   DECLARE sqlWhere  varchar(20000) COLLATE utf8mb3_unicode_ci;
   
   if(in_search<>'' and exists(select productsId from  productsBatchs where branchesId = in_branchesId   and  productsBatchs.productsBatchsCode = in_search  limit 1)  ) then 
  
		SELECT
        	1 as "check_batchsCode",
            productsBatchs.id as  productsBatchsId,
			productsBatchs.productsBatchsCode as  productsBatchsCode,
            productsBatchs.manufactureDate ,
			productsBatchs.expirationDate ,
            productsBatchs.quantity ,
            productsBatchs.customersId ,            
            
            products.id, products.parentId, products.productsName, products.productsCode, products.subName, products.images,  products.productGroupsId, products.brandsId, products.productPlacementsId, products.unitsId, products.weigh, products.productsCategories, products.minAmount, products.maxAmount, products.usersCreatorId, products.dateCreated, products.dateUpdated, products.status, products.lastInPrice, products.lastInDate, products.directSales, products.orderProduct,
            
             priceListProducts.value as salePrice,
        
		    (case when  not isnull(productGroups.id) then json_object("id", productGroups.id, "productGroupsName", productGroups.productGroupsName) else null end)as productGroups,
		 	(case when  not isnull(customers.id) then json_object("id", customers.id, "customersName", customers.customersName) else null end)as customers,
      	    (case when  not isnull(units.id) then json_object("id", units.id, "unitsName", units.unitsName) else null end)as units,
			(case when   count(subUnits.id)>0 then 
               json_arrayagg(json_object("id", subUnits.id, "unitsName", subUnits.unitsName,"exchangeValue", subUnits.exchangeValue,"productsId", child.id,
                   "salePrice",  priceListProductsChild.value
				))
			 else null end)as subUnits
		FROM 
          productsBatchs
          inner join `products` AS `products`  on productsBatchs.productsId = products.id
            
             left join  priceListProducts as priceListProducts on priceListProducts.productsId  = products.id and priceListProducts.pricelistId = 1 
           
				left JOIN
			`products` AS `child` ON `child`.`parentId` = `products`.`id`
              left join  priceListProducts as priceListProductsChild on priceListProductsChild.productsId  = child.id and priceListProductsChild.pricelistId = 1 
          
				left JOIN
		    `units` AS `subUnits`   ON `subUnits`.`id` = `child`.`unitsId`           
				left JOIN
			`productGroups` AS `productGroups` ON `productGroups`.`id` = `products`.`productGroupsId`
            	left JOIN
			`customers` AS `customers` ON `customers`.`id` = `productsBatchs`.`customersId`
				left JOIN
			 `units` AS `units`   ON `units`.`id` = `products`.`unitsId`
			
    		  where productsBatchs.branchesId = in_branchesId   and  productsBatchs.productsBatchsCode = in_search
                limit 1
        ;
           
		  select 1  as count;
		else
   
   
 set sqlWhere =  concat(' ',
			 if(in_productsBatchsId  <>  '' , concat('and( productsBatchs.id in ',in_productsBatchsId,' )'),''),
			 if(in_status <> -99,concat(' and (products.status =  ',in_status ,')'),''),
			 if(in_productGroupsId <> 0,concat(' and (
						(products.productGroupsId =  ',in_productGroupsId ,')
						)
             '),''),
             			 if(in_customersId <> 0,concat(' and (productsBatchs.customersId =  ',in_customersId ,'  or  productsBatchs.customersId = 0 )'),''),

			 if(in_brandsId <> 0,concat(' and (products.brandsId =  ',in_brandsId ,')'),''),
			 if(in_productPlacementsId <> 0,concat(' and (products.productPlacementsId =  ',in_productPlacementsId ,')'),''),

           
			 if(in_search <> '',
				  concat('and (
							   lower(products.productsName) like  concat("%",CONVERT(lower("',in_search,'"), BINARY),"%") 
							or lower(products.productsCode) like  concat("%",CONVERT(lower("',in_search,'"), BINARY),"%") 
							)
						 '),''
			 
			 ),
			if(in_productsCode <> '',
				  concat('and (
							   lower(products.productsCode) like  concat("%",CONVERT(lower("',in_productsCode,'"), BINARY),"%") )
						 '),''
			 ),
			if(in_productsName <> '',
				  concat('and (
							   lower(products.productsName) like  concat("%",CONVERT(lower("',in_productsName,'"), BINARY),"%") )
						 '),''
			 ),
			
			 if(in_FromDate <> '' ,concat('and products.dateCreated >= "',in_FromDate,'" '),''),
			 if(in_ToDate <> '' ,concat('and products.dateCreated < "',in_ToDate,'" +  interval 1 day  '),''),
			 ' '
		   );

   if(in_attributes = '') then 
    set in_attributes = 'products.id, products.parentId, products.productsName, products.productsCode, products.subName, products.images,  products.productGroupsId, products.brandsId, products.productPlacementsId, products.unitsId, products.weigh, products.productsCategories, products.minAmount, products.maxAmount, products.usersCreatorId, products.dateCreated, products.dateUpdated, products.status, products.lastInPrice, products.lastInDate, products.directSales, products.orderProduct';
   end if;
   
   
   
   SET @sql1 = concat('
			SELECT
            ifnull(productsBatchs.id,0) as  productsBatchsId,
             productsBatchs.productsBatchsCode as  productsBatchsCode,
            productsBatchs.manufactureDate ,
			productsBatchs.expirationDate ,
            productsBatchs.quantity ,
            productsBatchs.customersId ,            
            productsTotalInfo.importPrice as importPrice,
            ',in_attributes,',
            
             ',
			if(in_pricelistId <> 0 ,
				   'priceListProducts.value as salePrice,',
                  'products.salePrice,'
			 ),'
        
		    (case when  not isnull(productGroups.id) then json_object("id", productGroups.id, "productGroupsName", productGroups.productGroupsName) else null end)as productGroups,
		 	(case when  not isnull(customers.id) then json_object("id", customers.id, "customersName", customers.customersName) else null end)as customers,
			(case when  not isnull(units.id) then json_object("id", units.id, "unitsName", units.unitsName, "exchangeValue", units.exchangeValue) else null end)as units,

			(case when   count(subUnits.id)>0 then 
               json_arrayagg(json_object("id", subUnits.id, "unitsName", subUnits.unitsName,"exchangeValue", subUnits.exchangeValue,"productsId", child.id,
               						"productsCode", child.productsCode  ,
                "importPrice", productsTotalInfo.importPrice * subUnits.exchangeValue ,
                    "lastInPrice", products.lastInPrice * subUnits.exchangeValue ,
                   "salePrice",  ',
							if(in_pricelistId <> 0 ,
								   'priceListProductsChild.value',
								  'child.salePrice'
							 ),'
				))
			 else null end)as subUnits
		FROM 
           products
       
          left join `productsBatchs` AS `productsBatchs`  on productsBatchs.productsId = products.id
              	left JOIN
			`productsTotalInfo` AS `productsTotalInfo` ON `productsTotalInfo`.`productsId` = `products`.`id`
                           and  productsTotalInfo.branchesId = ',in_branchesId,'
            
            ',
			if(in_pricelistId <> 0 ,
				  concat(' left join  priceListProducts as priceListProducts on priceListProducts.productsId  = products.id and priceListProducts.pricelistId = ',in_pricelistId,' '),
                  ''
			 ),'
       
				left JOIN
			`products` AS `child` ON `child`.`parentId` = `products`.`id`
             ',
		 	if(in_pricelistId <> 0 ,
				  concat(' left join  priceListProducts as priceListProductsChild on priceListProductsChild.productsId  = child.id and priceListProductsChild.pricelistId = ',in_pricelistId,' '),
                  ''
			 ),'
          
				left JOIN
		    `units` AS `subUnits`   ON `subUnits`.`id` = `child`.`unitsId`           
				left JOIN
			`productGroups` AS `productGroups` ON `productGroups`.`id` = `products`.`productGroupsId`
            	left JOIN
			`customers` AS `customers` ON `customers`.`id` = `productsBatchs`.`customersId`
				left JOIN
			 `units` AS `units`   ON `units`.`id` = `products`.`unitsId`
			
    		 where 
             products.status = 1
              and products.parentId = 0  
			',
		 	if(in_quantityStatus  = 1 ,
				 ' and productsBatchs.quantity > 0',
                  ''
			 ),'
             ', sqlWhere ,'
			group by ifnull(productsBatchs.id,0) ,products.id
             order by   products.',in_orderBy,' ',in_order,'
			limit ',in_start_page,',', in_end_page
	);		


	PREPARE stmt1 FROM @sql1;
	EXECUTE stmt1;
		   
		   
	SET @sql2 = concat('
    select count(*) as count from
    
      (select productsBatchs.id
			FROM
            products as products
                left join 
		   	`productsBatchs` AS `productsBatchs`  on productsBatchs.productsId = products.id
				left JOIN
			`productGroups` AS `productGroups` ON `productGroups`.`id` = `products`.`productGroupsId`

				left JOIN
			 `units` AS `units`   ON `units`.`id` = `products`.`unitsId`
             	left JOIN
			`products` AS `child` ON `child`.`parentId` = `products`.`id`
    		where      products.status = 1
              and products.parentId = 0  
              	',
		 	if(in_quantityStatus  = 1 ,
				 ' and productsBatchs.quantity > 0',
                  ''
			 ),'
             ', sqlWhere ,'
			group by ifnull(productsBatchs.id,0) ,products.id
		  )t ' 
	 );		
		   
		  

	PREPARE stmt2 FROM @sql2;
	EXECUTE stmt2;



    
  end if;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_productsBatchs_get_list_v2` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_productsBatchs_get_list_v2`(
    in in_id varchar(200),
    in in_productsBatchsId varchar(200),
    in in_pricelistId  bigint, -- 0 
    in in_branchesId bigint,
    in in_productsName varchar(200) COLLATE utf8mb3_unicode_ci,
    in in_productsCode varchar(200)COLLATE utf8mb3_unicode_ci,
    in in_search varchar(200)COLLATE utf8mb3_unicode_ci,
    in in_customersId bigint, 
    in in_quantityStatus  int, 
	in in_productGroupsId int,
	in in_brandsId int,
	in in_productPlacementsId int,
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
-- call quanlybanhang.sp_products_get_list(0, 0, '', 0, 0, 0, 0, 0, 1, '', '', 'id', 'desc', '', 0, 10, @out_rowCount);
   DECLARE sqlWhere  varchar(20000) COLLATE utf8mb3_unicode_ci;
   
   if(in_search<>'' and exists(select productsId from  productsBatchs where branchesId = in_branchesId   and  productsBatchs.productsBatchsCode = in_search  limit 1)  ) then 
  
		SELECT
        	1 as "check_batchsCode",
            productsBatchs.id as  productsBatchsId,
			productsBatchs.productsBatchsCode as  productsBatchsCode,
            productsBatchs.manufactureDate ,
			productsBatchs.expirationDate ,
            productsBatchs.quantity ,
            productsBatchs.customersId ,            
            
            products.id, products.parentId, products.productsName, products.productsCode, products.subName, products.images,  products.productGroupsId, products.brandsId, products.productPlacementsId, products.unitsId, products.weigh, products.productsCategories, products.minAmount, products.maxAmount, products.usersCreatorId, products.dateCreated, products.dateUpdated, products.status, products.lastInPrice, products.lastInDate, products.directSales, products.orderProduct,
            
             priceListProducts.value as salePrice,
        
		    (case when  not isnull(productGroups.id) then json_object("id", productGroups.id, "productGroupsName", productGroups.productGroupsName) else null end)as productGroups,
		 	(case when  not isnull(customers.id) then json_object("id", customers.id, "customersName", customers.customersName) else null end)as customers,
      	    (case when  not isnull(units.id) then json_object("id", units.id, "unitsName", units.unitsName) else null end)as units,
			(case when   count(subUnits.id)>0 then 
               json_arrayagg(json_object("id", subUnits.id, "unitsName", subUnits.unitsName,"exchangeValue", subUnits.exchangeValue,"productsId", child.id,
                   "salePrice",  priceListProductsChild.value
				))
			 else null end)as subUnits
		FROM 
          productsBatchs
          inner join `products` AS `products`  on productsBatchs.productsId = products.id
            
             left join  priceListProducts as priceListProducts on priceListProducts.productsId  = products.id and priceListProducts.pricelistId = 1 
           
				left JOIN
			`products` AS `child` ON `child`.`parentId` = `products`.`id`
              left join  priceListProducts as priceListProductsChild on priceListProductsChild.productsId  = child.id and priceListProductsChild.pricelistId = 1 
          
				left JOIN
		    `units` AS `subUnits`   ON `subUnits`.`id` = `child`.`unitsId`           
				left JOIN
			`productGroups` AS `productGroups` ON `productGroups`.`id` = `products`.`productGroupsId`
            	left JOIN
			`customers` AS `customers` ON `customers`.`id` = `productsBatchs`.`customersId`
				left JOIN
			 `units` AS `units`   ON `units`.`id` = `products`.`unitsId`
			
    		  where productsBatchs.branchesId = in_branchesId   and  productsBatchs.productsBatchsCode = in_search
                limit 1
        ;
           
		  select 1  as count;
		else
   
   
 set sqlWhere =  concat(' ',
 	        if(in_id  <>  '' , concat('and( products.id in ',in_id,' or child.id in ',in_id,' )'),''),
			 if(in_productsBatchsId  <>  '' , concat('and( productsBatchs.id in ',in_productsBatchsId,' )'),''),
			 if(in_status <> -99,concat(' and (products.status =  ',in_status ,')'),''),
			 if(in_productGroupsId <> 0,concat(' and (
						(products.productGroupsId =  ',in_productGroupsId ,')
						)
             '),''),
             			 if(in_customersId <> 0,concat(' and (productsBatchs.customersId =  ',in_customersId ,'  or  productsBatchs.customersId = 0 )'),''),

			 if(in_brandsId <> 0,concat(' and (products.brandsId =  ',in_brandsId ,')'),''),
			 if(in_productPlacementsId <> 0,concat(' and (products.productPlacementsId =  ',in_productPlacementsId ,')'),''),

           
			 if(in_search <> '',
				  concat('and (
							   lower(products.productsName) like  concat("%",CONVERT(lower("',in_search,'"), BINARY),"%") 
							or lower(products.productsCode) like  concat("%",CONVERT(lower("',in_search,'"), BINARY),"%") 
							)
						 '),''
			 
			 ),
			if(in_productsCode <> '',
				  concat('and (
							   lower(products.productsCode) like  concat("%",CONVERT(lower("',in_productsCode,'"), BINARY),"%") )
						 '),''
			 ),
			if(in_productsName <> '',
				  concat('and (
							   lower(products.productsName) like  concat("%",CONVERT(lower("',in_productsName,'"), BINARY),"%") )
						 '),''
			 ),
			
			 if(in_FromDate <> '' ,concat('and products.dateCreated >= "',in_FromDate,'" '),''),
			 if(in_ToDate <> '' ,concat('and products.dateCreated < "',in_ToDate,'" +  interval 1 day  '),''),
			 ' '
		   );

   if(in_attributes = '') then 
    set in_attributes = 'products.id, products.parentId, products.productsName, products.productsCode, products.subName, products.images,  products.productGroupsId, products.brandsId, products.productPlacementsId, products.unitsId, products.weigh, products.productsCategories, products.minAmount, products.maxAmount, products.usersCreatorId, products.dateCreated, products.dateUpdated, products.status, products.lastInPrice, products.lastInDate, products.directSales, products.orderProduct';
   end if;
   
   
   
   SET @sql1 = concat('
			SELECT
            ifnull(productsBatchs.id,0) as  productsBatchsId,
             productsBatchs.productsBatchsCode as  productsBatchsCode,
            productsBatchs.manufactureDate ,
			productsBatchs.expirationDate ,
            productsBatchs.quantity ,
            productsBatchs.customersId ,            
            productsTotalInfo.importPrice as importPrice,
            ',in_attributes,',
            
             ',
			if(in_pricelistId <> 0 ,
				   'priceListProducts.value as salePrice,',
                  'products.salePrice,'
			 ),'
        
		    (case when  not isnull(productGroups.id) then json_object("id", productGroups.id, "productGroupsName", productGroups.productGroupsName) else null end)as productGroups,
		 	(case when  not isnull(customers.id) then json_object("id", customers.id, "customersName", customers.customersName) else null end)as customers,
			(case when  not isnull(units.id) then json_object("id", units.id, "unitsName", units.unitsName, "exchangeValue", units.exchangeValue) else null end)as units,

			(case when   count(subUnits.id)>0 then 
               json_arrayagg(json_object("id", subUnits.id, "unitsName", subUnits.unitsName,"exchangeValue", subUnits.exchangeValue,"productsId", child.id,
               						"productsCode", child.productsCode  ,
                "importPrice", productsTotalInfo.importPrice * subUnits.exchangeValue ,
                    "lastInPrice", products.lastInPrice * subUnits.exchangeValue ,
                   "salePrice",  ',
							if(in_pricelistId <> 0 ,
								   'priceListProductsChild.value',
								  'child.salePrice'
							 ),'
				))
			 else null end)as subUnits
		FROM 
           products
       
          left join `productsBatchs` AS `productsBatchs`  on productsBatchs.productsId = products.id
              	left JOIN
			`productsTotalInfo` AS `productsTotalInfo` ON `productsTotalInfo`.`productsId` = `products`.`id`
                           and  productsTotalInfo.branchesId = ',in_branchesId,'
            
            ',
			if(in_pricelistId <> 0 ,
				  concat(' left join  priceListProducts as priceListProducts on priceListProducts.productsId  = products.id and priceListProducts.pricelistId = ',in_pricelistId,' '),
                  ''
			 ),'
       
				left JOIN
			`products` AS `child` ON `child`.`parentId` = `products`.`id`
             ',
		 	if(in_pricelistId <> 0 ,
				  concat(' left join  priceListProducts as priceListProductsChild on priceListProductsChild.productsId  = child.id and priceListProductsChild.pricelistId = ',in_pricelistId,' '),
                  ''
			 ),'
          
				left JOIN
		    `units` AS `subUnits`   ON `subUnits`.`id` = `child`.`unitsId`           
				left JOIN
			`productGroups` AS `productGroups` ON `productGroups`.`id` = `products`.`productGroupsId`
            	left JOIN
			`customers` AS `customers` ON `customers`.`id` = `productsBatchs`.`customersId`
				left JOIN
			 `units` AS `units`   ON `units`.`id` = `products`.`unitsId`
			
    		 where 
             products.status = 1
              and products.parentId = 0  
			',
		 	if(in_quantityStatus  = 1 ,
				 ' and productsBatchs.quantity > 0',
                  ''
			 ),'
             ', sqlWhere ,'
			group by ifnull(productsBatchs.id,0) ,products.id
             order by   products.',in_orderBy,' ',in_order,'
			limit ',in_start_page,',', in_end_page
	);		


	PREPARE stmt1 FROM @sql1;
	EXECUTE stmt1;
		   
		   
	SET @sql2 = concat('
    select count(*) as count from
    
      (select productsBatchs.id
			FROM
            products as products
                left join 
		   	`productsBatchs` AS `productsBatchs`  on productsBatchs.productsId = products.id
				left JOIN
			`productGroups` AS `productGroups` ON `productGroups`.`id` = `products`.`productGroupsId`

				left JOIN
			 `units` AS `units`   ON `units`.`id` = `products`.`unitsId`
             	left JOIN
			`products` AS `child` ON `child`.`parentId` = `products`.`id`
    		where      products.status = 1
              and products.parentId = 0  
              	',
		 	if(in_quantityStatus  = 1 ,
				 ' and productsBatchs.quantity > 0',
                  ''
			 ),'
             ', sqlWhere ,'
			group by ifnull(productsBatchs.id,0) ,products.id
		  )t ' 
	 );		
		   
		  

	PREPARE stmt2 FROM @sql2;
	EXECUTE stmt2;



    
  end if;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_products_get_list` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_products_get_list`(
    in in_id varchar(200),
    in in_parentId  bigint, -- -99 
    in in_branchesId bigint,
    in in_productsName varchar(200) COLLATE utf8mb3_unicode_ci,
    in in_productsCode varchar(200)COLLATE utf8mb3_unicode_ci,
    in in_search varchar(200)COLLATE utf8mb3_unicode_ci,
    in in_checkQuantity int, 
    in in_directSales  int, 
	in in_productGroupsId int,
	in in_brandsId int,
	in in_productPlacementsId int,
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
-- call quanlybanhang.sp_products_get_list(0, 0, '', 0, 0, 0, 0, 0, 1, '', '', 'id', 'desc', '', 0, 10, @out_rowCount);
   DECLARE sqlWhere  varchar(20000) COLLATE utf8mb3_unicode_ci;
   
 set sqlWhere =  concat(' ',
			 if(in_id  <>  '' , concat('and( products.id in ',in_id,' )'),''),
			 if(in_checkQuantity  =  1 , concat(' productsTotalInfo.quantity   > 0 )'),''),
			 if(in_status <> -99,concat(' and (products.status =  ',in_status ,')'),''),
			 if(in_productGroupsId <> 0,concat(' and (
						(products.productGroupsId =  ',in_productGroupsId ,')
						)
             '),''),
			 if(in_brandsId <> 0,concat(' and (products.brandsId =  ',in_brandsId ,')'),''),
			 if(in_productPlacementsId <> 0,concat(' and (products.productPlacementsId =  ',in_productPlacementsId ,')'),''),
			 if(in_directSales <> -99,concat(' and (products.directSales =  ',in_directSales ,')'),''),
			 if(in_parentId <> -99,concat(' and (products.parentId =  ',in_parentId ,')'),''),

           
			 if(in_search <> '',
				  concat('and (
							   lower(products.productsName) like  concat("%",CONVERT(lower("',in_search,'"), BINARY),"%") 
							or lower(products.productsCode) like  concat("%",CONVERT(lower("',in_search,'"), BINARY),"%") 
							)
						 '),''
			 
			 ),
			if(in_productsCode <> '',
				  concat('and (
							   lower(products.productsCode) like  concat("%",CONVERT(lower("',in_productsCode,'"), BINARY),"%") )
						 '),''
			 ),
			if(in_productsName <> '',
				  concat('and (
							   lower(products.productsName) like  concat("%",CONVERT(lower("',in_productsName,'"), BINARY),"%") )
						 '),''
			 ),
			
			 if(in_FromDate <> '' ,concat('and products.dateCreated >= "',in_FromDate,'" '),''),
			 if(in_ToDate <> '' ,concat('and products.dateCreated < "',in_ToDate,'" +  interval 1 day  '),''),
			 ' '
		   );

   if(in_attributes = '') then 
    set in_attributes = 'products.id, products.parentId, products.productsName, products.productsCode, products.subName, products.images, products.salePrice, products.productGroupsId, products.brandsId, products.productPlacementsId, products.unitsId, products.weigh, products.productsCategories, products.minAmount, products.maxAmount, products.usersCreatorId, products.dateCreated, products.dateUpdated, products.status, products.lastInPrice, products.lastInDate, products.directSales';
   end if;
   
   
   
   SET @sql1 = concat('
			SELECT
            ',in_attributes,',
            (case when productsTotalInfo.id > 0 then productsTotalInfo.orderQuantity else parentProductsTotalInfo.orderQuantity / ifnull(units.exchangeValue,1) end) as orderQuantity,
            (case when productsTotalInfo.id > 0 then productsTotalInfo.quantity else parentProductsTotalInfo.quantity / ifnull(units.exchangeValue,1) end) as quantity,
            (case when productsTotalInfo.id > 0 then productsTotalInfo.quantitySold else parentProductsTotalInfo.quantitySold / ifnull(units.exchangeValue,1) end) as quantitySold,
           (case when productsTotalInfo.id > 0 then productsTotalInfo.importPrice else parentProductsTotalInfo.importPrice * ifnull(units.exchangeValue,1) end) as importPrice,

		    (case when  not isnull(productGroups.id) then json_object("id", productGroups.id, "productGroupsName", productGroups.productGroupsName) else null end)as productGroups,
			(case when  not isnull(productPlacements.id) then json_object("id", productPlacements.id, "productPlacementsName", productPlacements.productPlacementsName) else null end)as productPlacements,
			(case when  not isnull(brands.id) then json_object("id", brands.id, "brandsName", brands.brandsName) else null end)as brands,
            (case when  not isnull(units.id) then json_object("id", units.id, "unitsName", units.unitsName,"exchangeValue",units.exchangeValue) else null end)as units
		FROM
			`products` AS `products`
            	left JOIN
			`productsTotalInfo` AS `productsTotalInfo` ON `productsTotalInfo`.`productsId` = `products`.`id`
                           and  productsTotalInfo.branchesId = ',in_branchesId,'
				   left JOIN
			`products` AS `parent` ON `parent`.`id` = `products`.`parentId`
			       left JOIN
			`productsTotalInfo` AS `parentProductsTotalInfo` ON `parentProductsTotalInfo`.`productsId` = `parent`.`id`
                           and  parentProductsTotalInfo.branchesId = ',in_branchesId,'
				left JOIN
			`productGroups` AS `productGroups` ON `productGroups`.`id` = `products`.`productGroupsId`
            	left JOIN
			`brands` AS `brands` ON `brands`.`id` = `products`.`brandsId`
				left JOIN
			`productPlacements` AS `productPlacements` ON `productPlacements`.`id` = `products`.`productPlacementsId`
				left JOIN
			 `units` AS `units`   ON `units`.`id` = `products`.`unitsId`
			
    		 where 1  ', sqlWhere ,'

             order by   products.',in_orderBy,' ',in_order,'
			limit ',in_start_page,',', in_end_page
	);		



	PREPARE stmt1 FROM @sql1;
	EXECUTE stmt1;
		   
		   



	SET @sql3 = concat('
    select  ifnull(sum(quantity),0) as quantity, ifnull(sum(orderQuantity),0) as orderQuantity  
      from
      (select products.id ,productsTotalInfo.quantity ,productsTotalInfo.orderQuantity
			FROM
			`products` AS `products`
            	left JOIN
			`productsTotalInfo` AS `productsTotalInfo` ON `productsTotalInfo`.`productsId` = `products`.`id`
                           and  productsTotalInfo.branchesId = ',in_branchesId,'
				left JOIN
			`productGroups` AS `productGroups` ON `productGroups`.`id` = `products`.`productGroupsId`
            	left JOIN
			`brands` AS `brands` ON `brands`.`id` = `products`.`brandsId`
				left JOIN
			`productPlacements` AS `productPlacements` ON `productPlacements`.`id` = `products`.`productPlacementsId`
				left JOIN
			 `units` AS `units`   ON `units`.`id` = `products`.`unitsId`
    		where products.parentId = 0 ', sqlWhere ,'
		  )t ' 
	 );		
		   
		  
	PREPARE stmt3 FROM @sql3;
	EXECUTE stmt3;

    
  	SET @sql2 = concat('
    select count(*) as count from
    
      (select products.id
			FROM
			`products` AS `products`
            	left JOIN
			`productsTotalInfo` AS `productsTotalInfo` ON `productsTotalInfo`.`productsId` = `products`.`id`
                           and  productsTotalInfo.branchesId = ',in_branchesId,'
				left JOIN
			`productGroups` AS `productGroups` ON `productGroups`.`id` = `products`.`productGroupsId`
            	left JOIN
			`brands` AS `brands` ON `brands`.`id` = `products`.`brandsId`
				left JOIN
			`productPlacements` AS `productPlacements` ON `productPlacements`.`id` = `products`.`productPlacementsId`
				left JOIN
			 `units` AS `units`   ON `units`.`id` = `products`.`unitsId`
    		where 1 ', sqlWhere ,'
		  )t ' 
	 );		
		   
		  
	PREPARE stmt2 FROM @sql2;
	EXECUTE stmt2;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_products_get_list_groupUnit` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_products_get_list_groupUnit`(
    in in_id varchar(200),
    in in_pricelistId  bigint, -- 0 
    in in_branchesId bigint,
    in in_productsName varchar(200) COLLATE utf8mb3_unicode_ci,
    in in_productsCode varchar(200)COLLATE utf8mb3_unicode_ci,
    in in_search varchar(200)COLLATE utf8mb3_unicode_ci,
    in in_checkQuantity int, 
    in in_directSales  int, 
	in in_productGroupsId int,
	in in_brandsId int,
	in in_productPlacementsId int,
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
-- call quanlybanhang.sp_products_get_list(0, 0, '', 0, 0, 0, 0, 0, 1, '', '', 'id', 'desc', '', 0, 10, @out_rowCount);
   DECLARE sqlWhere  varchar(20000) COLLATE utf8mb3_unicode_ci;
     if(in_attributes = '') then 
			set in_attributes = 'products.id, products.parentId, products.productsName, products.productsCode, products.subName, products.images,  products.productGroupsId, products.brandsId, products.productPlacementsId, products.unitsId, products.weigh, products.productsCategories, products.minAmount, products.maxAmount, products.usersCreatorId, products.dateCreated, products.dateUpdated, products.status, products.lastInPrice, products.lastInDate, products.directSales, products.orderProduct';
		   end if;
   if(in_id = '')
    then
   
		 set sqlWhere =  concat(' ',
					 
					 if(in_checkQuantity  =  1 , concat(' productsTotalInfo.quantity   > 0 )'),''),
					 if(in_status <> -99,concat(' and (products.status =  ',in_status ,')'),''),
					 if(in_productGroupsId <> 0,concat(' and (
								(products.productGroupsId =  ',in_productGroupsId ,')
								)
					 '),''),
					 if(in_brandsId <> 0,concat(' and (products.brandsId =  ',in_brandsId ,')'),''),
					 if(in_productPlacementsId <> 0,concat(' and (products.productPlacementsId =  ',in_productPlacementsId ,')'),''),
					 if(in_directSales <> -99,concat(' and (products.directSales =  ',in_directSales ,')'),''),

				   
					 if(in_search <> '',
						  concat('and (
									   lower(products.productsName) like  concat("%",CONVERT(lower("',in_search,'"), BINARY),"%") 
									or lower(products.productsCode) like  concat("%",CONVERT(lower("',in_search,'"), BINARY),"%") 
									)
								 '),''
					 
					 ),
					if(in_productsCode <> '',
						  concat('and (
									   lower(products.productsCode) like  concat("%",CONVERT(lower("',in_productsCode,'"), BINARY),"%") )
								 '),''
					 ),
					if(in_productsName <> '',
						  concat('and (
									   lower(products.productsName) like  concat("%",CONVERT(lower("',in_productsName,'"), BINARY),"%") )
								 '),''
					 ),
					
					 if(in_FromDate <> '' ,concat('and products.dateCreated >= "',in_FromDate,'" '),''),
					 if(in_ToDate <> '' ,concat('and products.dateCreated < "',in_ToDate,'" +  interval 1 day  '),''),
					 ' '
				   );

		 
		   
		   
		   
		   SET @sql1 = concat('
					SELECT
					',in_attributes,',
					
					 ',
					if(in_pricelistId <> 0 ,
						   'priceListProducts.value as salePrice,',
						  'products.salePrice,'
					 ),'
					productsTotalInfo.orderQuantity as orderQuantity,
					productsTotalInfo.quantity as quantity,
					productsTotalInfo.quantitySold as quantitySold,
					productsTotalInfo.importPrice as importPrice,
					(case when  not isnull(productGroups.id) then json_object("id", productGroups.id, "productGroupsName", productGroups.productGroupsName) else null end)as productGroups,
					(case when  not isnull(productPlacements.id) then json_object("id", productPlacements.id, "productPlacementsName", productPlacements.productPlacementsName) else null end)as productPlacements,
					(case when  not isnull(brands.id) then json_object("id", brands.id, "brandsName", brands.brandsName) else null end)as brands,
					(case when  not isnull(units.id) then json_object("id", units.id, "unitsName", units.unitsName, "exchangeValue", units.exchangeValue) else null end)as units,
					(case when   count(subUnits.id)>0 then 
					   json_arrayagg(json_object("id", subUnits.id, "unitsName", subUnits.unitsName,"exchangeValue", subUnits.exchangeValue,"productsId", child.id,
							"productsCode", child.productsCode  ,
							"importPrice", productsTotalInfo.importPrice * subUnits.exchangeValue ,
							"lastInPrice", products.lastInPrice * subUnits.exchangeValue ,
						   "salePrice",  ',
									if(in_pricelistId <> 0 ,
										   'priceListProductsChild.value',
										  'child.salePrice'
									 ),'
						))
					 else null end)as subUnits
				FROM
					`products` AS `products`
					
					',
					if(in_pricelistId <> 0 ,
						  concat(' left join  priceListProducts as priceListProducts on priceListProducts.productsId  = products.id and priceListProducts.pricelistId = ',in_pricelistId,' '),
						  ''
					 ),'
						left JOIN
					`productsTotalInfo` AS `productsTotalInfo` ON `productsTotalInfo`.`productsId` = `products`.`id`
								   and  productsTotalInfo.branchesId = ',in_branchesId,'
						left JOIN
					`products` AS `child` ON `child`.`parentId` = `products`.`id`
					 ',
					if(in_pricelistId <> 0 ,
						  concat(' left join  priceListProducts as priceListProductsChild on priceListProductsChild.productsId  = child.id and priceListProductsChild.pricelistId = ',in_pricelistId,' '),
						  ''
					 ),'
				  
						left JOIN
					`units` AS `subUnits`   ON `subUnits`.`id` = `child`.`unitsId`           
						left JOIN
					`productGroups` AS `productGroups` ON `productGroups`.`id` = `products`.`productGroupsId`
						left JOIN
					`brands` AS `brands` ON `brands`.`id` = `products`.`brandsId`
						left JOIN
					`productPlacements` AS `productPlacements` ON `productPlacements`.`id` = `products`.`productPlacementsId`
						left JOIN
					 `units` AS `units`   ON `units`.`id` = `products`.`unitsId`
					
					 where 
					 products.parentId = 0
					 ', sqlWhere ,'
								  group by products.id
					 order by   products.',in_orderBy,' ',in_order,'
					limit ',in_start_page,',', in_end_page
			);		


			PREPARE stmt1 FROM @sql1;
			EXECUTE stmt1;
				   
				   
			SET @sql2 = concat('
			select count(*) as count from
			
			  (select products.id
					FROM
					`products` AS `products`
						left JOIN
					`products` AS `child` ON `child`.`parentId` = `products`.`id`
						left JOIN
					`productsTotalInfo` AS `productsTotalInfo` ON `productsTotalInfo`.`productsId` = `products`.`id`
								   and  productsTotalInfo.branchesId = ',in_branchesId,'
						left JOIN
					`productGroups` AS `productGroups` ON `productGroups`.`id` = `products`.`productGroupsId`
						left JOIN
					`brands` AS `brands` ON `brands`.`id` = `products`.`brandsId`
						left JOIN
					`productPlacements` AS `productPlacements` ON `productPlacements`.`id` = `products`.`productPlacementsId`
						left JOIN
					 `units` AS `units`   ON `units`.`id` = `products`.`unitsId`
					where    products.parentId = 0 ', sqlWhere ,'
						group by products.id
				  )t ' 
			 );		
				   
				  
			PREPARE stmt2 FROM @sql2;
			EXECUTE stmt2;
  else
     
             SET @sql1 = concat('
		     select
					',in_attributes,',
					
					 ',
					if(in_pricelistId <> 0 ,
						   'priceListProducts.value as salePrice,',
						  'products.salePrice,'
					 ),'
					productsTotalInfo.orderQuantity as orderQuantity,
					productsTotalInfo.quantity as quantity,
					productsTotalInfo.quantitySold as quantitySold,
					productsTotalInfo.importPrice as importPrice,
					(case when  not isnull(productGroups.id) then json_object("id", productGroups.id, "productGroupsName", productGroups.productGroupsName) else null end)as productGroups,
					(case when  not isnull(productPlacements.id) then json_object("id", productPlacements.id, "productPlacementsName", productPlacements.productPlacementsName) else null end)as productPlacements,
					(case when  not isnull(brands.id) then json_object("id", brands.id, "brandsName", brands.brandsName) else null end)as brands,
					(case when  not isnull(units.id) then json_object("id", units.id, "unitsName", units.unitsName, "exchangeValue", units.exchangeValue) else null end)as units,

					(case when   count(subUnits.id)>0 then 
					   json_arrayagg(json_object("id", subUnits.id, "unitsName", subUnits.unitsName,"exchangeValue", subUnits.exchangeValue,"productsId", child.id,
							"productsCode", child.productsCode  ,
							"importPrice", productsTotalInfo.importPrice * subUnits.exchangeValue ,
							"lastInPrice", products.lastInPrice * subUnits.exchangeValue ,
						   "salePrice",  ',
									if(in_pricelistId <> 0 ,
										   'priceListProductsChild.value',
										  'child.salePrice'
									 ),'
						))
					 else null end)as subUnits
				FROM
					`products` AS `products`
					
					',
					if(in_pricelistId <> 0 ,
						  concat(' left join  priceListProducts as priceListProducts on priceListProducts.productsId  = products.id and priceListProducts.pricelistId = ',in_pricelistId,' '),
						  ''
					 ),'
						left JOIN
					`productsTotalInfo` AS `productsTotalInfo` ON `productsTotalInfo`.`productsId` = `products`.`id`
								   and  productsTotalInfo.branchesId = ',in_branchesId,'
						left JOIN
					`products` AS `child` ON `child`.`parentId` = `products`.`id`
					 ',
					if(in_pricelistId <> 0 ,
						  concat(' left join  priceListProducts as priceListProductsChild on priceListProductsChild.productsId  = child.id and priceListProductsChild.pricelistId = ',in_pricelistId,' '),
						  ''
					 ),'
				  
						left JOIN
					`units` AS `subUnits`   ON `subUnits`.`id` = `child`.`unitsId`           
						left JOIN
					`productGroups` AS `productGroups` ON `productGroups`.`id` = `products`.`productGroupsId`
						left JOIN
					`brands` AS `brands` ON `brands`.`id` = `products`.`brandsId`
						left JOIN
					`productPlacements` AS `productPlacements` ON `productPlacements`.`id` = `products`.`productPlacementsId`
						left JOIN
					 `units` AS `units`   ON `units`.`id` = `products`.`unitsId`
					
					 where 
					 products.parentId = 0
                     and products.id in ',in_id,'
								  group by products.id
				    
               
					'
			);		


			PREPARE stmt1 FROM @sql1;
			EXECUTE stmt1;
            
            SET @sql1b = concat('
                  select
					',in_attributes,',
					
					 ',
					if(in_pricelistId <> 0 ,
						   'priceListProducts.value as salePrice,',
						  'products.salePrice,'
					 ),'
					productsTotalInfo.orderQuantity /units.exchangeValue as orderQuantity,
					productsTotalInfo.quantity  /units.exchangeValue as quantity,
					productsTotalInfo.quantitySold /units.exchangeValue as quantitySold,
					productsTotalInfo.importPrice * units.exchangeValue as importPrice,
					(case when  not isnull(productGroups.id) then json_object("id", productGroups.id, "productGroupsName", productGroups.productGroupsName) else null end)as productGroups,
					(case when  not isnull(productPlacements.id) then json_object("id", productPlacements.id, "productPlacementsName", productPlacements.productPlacementsName) else null end)as productPlacements,
					(case when  not isnull(brands.id) then json_object("id", brands.id, "brandsName", brands.brandsName) else null end)as brands,
					(case when  not isnull(units.id) then json_object("id", units.id, "unitsName", units.unitsName, "exchangeValue", units.exchangeValue) else null end)as units,

					(case when   count(subUnits.id)>0 then 
					   json_arrayagg(json_object("id", subUnits.id, "unitsName", subUnits.unitsName,"exchangeValue", subUnits.exchangeValue,"productsId", parent.id,
							"productsCode", parent.productsCode  ,
							"importPrice", productsTotalInfo.importPrice * subUnits.exchangeValue ,
							"lastInPrice", products.lastInPrice * subUnits.exchangeValue ,
						   "salePrice",  ',
									if(in_pricelistId <> 0 ,
										   'priceListProductsParent.value',
										  'parent.salePrice'
									 ),'
						))
					 else null end)as subUnits
				FROM
					`products` AS `products`
						inner JOIN
					`products` AS `parent` ON `products`.`parentId` = `parent`.`id`
					',
					if(in_pricelistId <> 0 ,
						  concat(' left join  priceListProducts as priceListProducts on priceListProducts.productsId  = products.id and priceListProducts.pricelistId = ',in_pricelistId,' '),
						  ''
					 ),'
						left JOIN
					`productsTotalInfo` AS `productsTotalInfo` ON `productsTotalInfo`.`productsId` = `parent`.`id`
								   and  productsTotalInfo.branchesId = ',in_branchesId,'
					
					 ',
					if(in_pricelistId <> 0 ,
						  concat(' left join  priceListProducts as priceListProductsParent on priceListProductsParent.productsId  = parent.id and priceListProductsParent.pricelistId = ',in_pricelistId,' '),
						  ''
					 ),'
			
						left JOIN
					`units` AS `subUnits`   ON `subUnits`.`id` = `parent`.`unitsId`           
						left JOIN
					`productGroups` AS `productGroups` ON `productGroups`.`id` = `products`.`productGroupsId`
						left JOIN
					`brands` AS `brands` ON `brands`.`id` = `products`.`brandsId`
						left JOIN
					`productPlacements` AS `productPlacements` ON `productPlacements`.`id` = `products`.`productPlacementsId`
						left JOIN
					 `units` AS `units`   ON `units`.`id` = `products`.`unitsId`
					
					 where 
					 products.parentId > 0
                     and products.id in ',in_id,'
								  group by products.id
                                  
                                 
					'
			);		


			PREPARE stmt1b FROM @sql1b;
			EXECUTE stmt1b;
          
            
            SET @sql2 = concat('
			select count(*) as count from
			
			  (select products.id
					FROM products
					where       products.id in ',in_id,'
						
				  )t ' 
			 );		
				   
			
			PREPARE stmt2 FROM @sql2;
			EXECUTE stmt2;
            
            
  end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_products_get_list_old` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_products_get_list_old`(
    in in_parentId bigint, 
    in in_insuranceStatus int,  
    in in_search varchar(200),
    in in_directSales  int, 
    in in_inventoryStatus int, 
	in in_productGroupsId int,
	in in_brandsId int,
	in in_productPlacementsId int,
    in in_status int, 
    in in_FromDate varchar(200),
	in in_ToDate varchar(200),
	in in_orderBy varchar(200),
	in in_order varchar(200),
    in in_attributes varchar(500),
	in in_start_page bigint,
    in in_end_page bigint,
    out out_rowCount bigint
)
BEGIN
-- call quanlybanhang.sp_products_get_list(0, 0, '', 0, 0, 0, 0, 0, 1, '', '', 'id', 'desc', '', 0, 10, @out_rowCount);

	SET @row_number = 0;

   if(in_attributes = '') then 
    set in_attributes = 'id,workUnitsId,parentId,productsCode,productsName,subName,orderQuantity,subProductsPropertiesId,images,importPrice,salePrice,productGroupsId,brandsId,productPlacementsId,quantity,quantitySold,unitsId,weigh,productsCategories,directSales,minAmount,maxAmount,usersCreatorId,dateCreated,dateUpdated,status,usersCreator,productGroups,brands,productPlacements,units,lastInPrice';
   end if;
   
   
   
	DROP TEMPORARY TABLE IF EXISTS temp_list_ecommerProduct;
	CREATE TEMPORARY TABLE temp_list_ecommerProduct(
			SELECT
		    products.*,
            
            0 as orderQuantity,
			json_object("id",usersCreator.id,"username",usersCreator.username,"fullname",usersCreator.fullname )usersCreator,
		    (case when  not isnull(productGroups.id) then json_object("id", productGroups.id, "productGroupsName", productGroups.productGroupsName) else null end)as productGroups,
			(case when  not isnull(productPlacements.id) then json_object("id", productPlacements.id, "productPlacementsName", productPlacements.productPlacementsName) else null end)as productPlacements,
			(case when  not isnull(brands.id) then json_object("id", brands.id, "brandsName", brands.brandsName) else null end)as brands,
            (case when  not isnull(units.id) then json_object("id", units.id, "unitsName", units.unitsName) else null end)as units
		FROM
			`products` AS `products`
				INNER JOIN
			`users` AS `usersCreator` ON `products`.`usersCreatorId` = `usersCreator`.`id`
				left JOIN
			`workUnits` AS `workUnits` ON `workUnits`.`id` = `products`.`workUnitsId`
				left JOIN
			`productGroups` AS `productGroups` ON `productGroups`.`id` = `products`.`productGroupsId`
            	left JOIN
			`brands` AS `brands` ON `brands`.`id` = `products`.`brandsId`
				left JOIN
			`productPlacements` AS `productPlacements` ON `productPlacements`.`id` = `products`.`productPlacementsId`
				left JOIN
			 `units` AS `units`   ON `units`.`id` = `products`.`unitsId`
	
                 WHERE 
            
                (lower(products.productsName) like  concat("%",CONVERT(lower(in_search), BINARY),"%") or lower(products.productsCode) like  concat("%",CONVERT(lower(in_search), BINARY),"%"))
				and (in_parentId =-99 or  products.parentId = in_parentId )
                and (in_inventoryStatus = 0 
                 or ( in_inventoryStatus = 1 and (products.quantity  < products.minAmount) )
				 or ( in_inventoryStatus = 2 and (products.quantity  > products.maxAmount) )
				 or ( in_inventoryStatus = 3 and (products.quantity  > 0 ) )
				 or ( in_inventoryStatus = 4 and (products.quantity  <= 0 ) )
				)
				and (in_productGroupsId = 0 or products.productGroupsId = in_productGroupsId)
                and (in_brandsId = 0 or products.brandsId = in_brandsId)
			    and (in_productPlacementsId = 0 or products.productPlacementsId = in_productPlacementsId)
			 	and(in_status = -99 or products.status = in_status)
                and(in_directSales = -99 or products.directSales = in_directSales)
		
					and (in_FromDate = '' or products.dateCreated  >= in_FromDate  )
				and (in_ToDate= '' or  products.dateCreated  < in_ToDate + INTERVAL 1 DAY )
                and (fn_insurance_check(products.id,in_insuranceStatus)   = 1 )
                  
	             group by products.id
    );



	set out_rowCount =  (select count(*) from temp_list_ecommerProduct);

	set @SQLStatement1=concat('
    select ',in_attributes,'
		FROM temp_list_ecommerProduct
		order by ',in_orderBy,' ',in_order,'
		limit ',in_start_page,',', in_end_page
	);

   	PREPARE stmt1 FROM @SQLStatement1;
    EXECUTE stmt1;
    
      select sum(quantity) as quantity, sum(orderQuantity)  as orderQuantity  from temp_list_ecommerProduct;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_products_get_one` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_products_get_one`(
    in in_id bigint,
    in in_branchesId bigint,
    in in_forUpdate int
)
BEGIN
-- call quanlybanhang.sp_products_get_one(10, '');


   declare cr_productsParentId bigint(20);
   
  SET @sql_products_getOne = concat('
		SELECT
		    products.*,
            (case when productsTotalInfo.id > 0 then productsTotalInfo.orderQuantity else parentProductsTotalInfo.orderQuantity / ifnull(units.exchangeValue,1) end) as orderQuantity,
            (case when productsTotalInfo.id > 0 then productsTotalInfo.quantity else parentProductsTotalInfo.quantity / ifnull(units.exchangeValue,1) end) as quantity,
            (case when productsTotalInfo.id > 0 then productsTotalInfo.quantitySold else parentProductsTotalInfo.quantitySold / ifnull(units.exchangeValue,1) end) as quantitySold,
            (case when productsTotalInfo.id > 0 then productsTotalInfo.importPrice else parentProductsTotalInfo.importPrice * ifnull(units.exchangeValue,1) end) as importPrice,
			json_object("id",usersCreator.id,"username",usersCreator.username,"fullname",usersCreator.fullname )usersCreator,
		    (case when  not isnull(productGroups.id) then json_object("id", productGroups.id, "productGroupsName", productGroups.productGroupsName) else null end)as productGroups,
			(case when  not isnull(productPlacements.id) then json_object("id", productPlacements.id, "productPlacementsName", productPlacements.productPlacementsName) else null end)as productPlacements,
			(case when  not isnull(brands.id) then json_object("id", brands.id, "brandsName", brands.brandsName) else null end)as brands,
            (case when  not isnull(units.id) then json_object("id", units.id, "unitsName", units.unitsName,"isCore", units.isCore,"exchangeValue", units.exchangeValue,"directSales", units.directSales) else null end)as units,
			(
             select (case when count(insurance.id) > 0 then  json_arrayagg( json_object("id", insurance.id, "insuranceName", insurance.insuranceName, "type", insurance.type, "timeType", insurance.timeType, "timeNumber", insurance.timeNumber)) else null end )
             from insurance
              where productsId = products.id
             )insurance,
             (
             select 
               (case when count(productIngredients.id) > 0 then  json_arrayagg( json_object("id", productIngredients.id, "ingredientsId", productIngredients.ingredientsId, "amount", productIngredients.amount,"ingredients",json_object("id", ingredients.id, "productsCode", ingredients.productsCode, "productsName", ingredients.productsName)))  else null end )
             from productIngredients as  productIngredients 
             inner join products as ingredients  on ingredients.id= productIngredients.productsId
             where productIngredients.productsId = products.id
             )productIngredients,
			(
             select 
                   (case when count(productsProperties.id) > 0 then json_arrayagg( json_object("id", productsProperties.id, "name", productsProperties.name,"propertiesId",productsProperties.propertiesId,"propertiesName",properties.propertiesName))  else null end )
             from productsProperties as  productsProperties 
             inner join properties on properties.id = productsProperties.propertiesId
             where productsProperties.productsId = products.id
             )productsProperties,
			(
				 select 
					   (case when count(productsBatchs.id) > 0 then json_arrayagg( json_object("id", productsBatchs.id, "productsBatchsCode", productsBatchs.productsBatchsCode,"manufactureDate",productsBatchs.manufactureDate,"expirationDate",productsBatchs.expirationDate,"quantity",productsBatchs.quantity))  else null end )
				 from productsBatchs as  productsBatchs 
				 where 
                 ( productsBatchs.productsId = products.id or productsBatchs.productsId = products.parentId)
                 and productsBatchs.branchesId = ',in_branchesId,'
             )productsBatchs
          
		FROM
					`products` AS `products`
						INNER JOIN
					`users` AS `usersCreator` ON `products`.`usersCreatorId` = `usersCreator`.`id`
						left  JOIN
					`productsTotalInfo` AS `productsTotalInfo` ON `products`.`id` = `productsTotalInfo`.`productsId`
                                           and productsTotalInfo.branchesId =  ',in_branchesId,'
						left  JOIN
					`productsTotalInfo` AS `parentProductsTotalInfo` ON `products`.`parentId` = `parentProductsTotalInfo`.`productsId`
                                           and parentProductsTotalInfo.branchesId =  ',in_branchesId,'
						left JOIN
					`productGroups` AS `productGroups` ON `productGroups`.`id` = `products`.`productGroupsId`
						left JOIN
					`brands` AS `brands` ON `brands`.`id` = `products`.`brandsId`
						left JOIN
					`productPlacements` AS `productPlacements` ON `productPlacements`.`id` = `products`.`productPlacementsId`
						left JOIN
					 `units` AS `units`   
					ON `units`.`id` = `products`.`unitsId`
				 WHERE 
					 products.id = ',in_id,'
		
		'
		);



   	PREPARE stmt_products_getOne FROM @sql_products_getOne;
    EXECUTE stmt_products_getOne;
    
    
    	set cr_productsParentId = (
			select if(
					products.parentId > 0,
					products.parentId,
					products.id
				)
			from products
			where products.id = in_id
		);
    
    if(in_forUpdate =0 )
    then
         select
        ( case when count(units.id) > 0 then
         json_arrayagg(
          json_object("id", units.id, "unitsName", units.unitsName ,"isCore",units.isCore,"directSales", units.directSales,"exchangeValue", units.exchangeValue, "productsId", products.id )
          ) 
          else null end
          )  as listUnits
          from  units
          inner join products on products.unitsId = units.id 
                 and products.status = 1
          where 
          (products.id = cr_productsParentId
          or  products.id in  (select id from products as checkP where  checkP.parentId = cr_productsParentId))
          ;
	
    else
           select
        ( case when count(units.id) > 0 then
         json_arrayagg(
          json_object("id", units.id, "unitsName", units.unitsName ,"isCore",units.isCore,"directSales", units.directSales,"exchangeValue", units.exchangeValue, "productsId", products.id,"status",  products.status)
          ) 
          else null end
          )  as listUnits
          from  units
          inner join products on products.unitsId = units.id 
            
          where 
          (products.id = cr_productsParentId
          or  products.id in  (select id from products as checkP where  checkP.parentId = cr_productsParentId))
          ;
          end if;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_products_get_top` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_products_get_top`(
     in in_branchesId int,
    in in_FromDate varchar(200),
	in in_ToDate varchar(200),
	in in_orderBy int  -- 1  theo doanh thu, 2 theo số lượng
)
BEGIN

-- call quanlybanhang.sp_products_get_top('', '', 1);

	SET @row_number = 0;

    if(in_orderBy =1) then
		SELECT
		    products.id,productsName,subName,productsCode,
            sum(
             if(receipts.totalMoney = 0 or receipts.money = 0, 0,
              receiptsProducts.amount * receiptsProducts.dealPrice -							-
					( receipts.discount*(receiptsProducts.amount*receiptsProducts.dealPrice)
						 /
						(receipts.money)
					)
				 )
				)  as totalSales,
            (case when  not isnull(units.id) then json_object("id", units.id, "unitsName", units.unitsName) else null end)as units
		FROM
			`products` AS `products`
				left JOIN
			 `units` AS `units`   ON `units`.`id` = `products`.`unitsId`
			inner JOIN
			 (`receiptsProducts` AS `receiptsProducts`  
              inner join `receipts` AS `receipts`  on `receipts`.`id` = `receiptsProducts`.`receiptsId`
              
               and `receipts`.`status` = 1
                     and `receipts`.`branchesId` = in_branchesId
               and  (in_FromDate = '' or receipts.staticDay >= date_format(in_FromDate,'%Y%m%d') )
			   and (in_ToDate= '' or  receipts.staticDay  <= date_format(in_ToDate,'%Y%m%d'))
             ) ON `receiptsProducts`.`productsId` = `products`.`id`
                 	where    products.parentId = 0
            and products.status = 1
		  group by products.id 
		 order by   sum(receiptsProducts.amount * receiptsProducts.dealPrice -							-
				   if(receipts.totalMoney = 0, 0,(receipts.discount*(receiptsProducts.amount*receiptsProducts.dealPrice)
						 /
						(receipts.money)
					)))  desc 
         limit 10;
         
    elseif(in_orderBy =2) then 
    	SELECT
		    products.id,productsName,subName,productsCode,
           sum(receiptsProducts.amount)    as totalSales,
            (case when  not isnull(units.id) then json_object("id", units.id, "unitsName", units.unitsName) else null end)as units
		FROM
			`products` AS `products`
				left JOIN
			 `units` AS `units`   ON `units`.`id` = `products`.`unitsId`
			inner JOIN
			 (`receiptsProducts` AS `receiptsProducts`  
              inner join `receipts` AS `receipts`  on `receipts`.`id` = `receiptsProducts`.`receiptsId`
               and `receipts`.`status` = 1
                          and `receipts`.`branchesId` = in_branchesId
               and  (in_FromDate = '' or receipts.staticDay >= date_format(in_FromDate,'%Y%m%d') )
			   and (in_ToDate= '' or  receipts.staticDay <= date_format(in_ToDate,'%Y%m%d'))
             ) ON `receiptsProducts`.`productsId` = `products`.`id`
			where    products.parentId = 0
            and products.status = 1
		  group by products.id 
          order by sum(receiptsProducts.amount)   desc 
		  limit 10;
        end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_products_get_top_10` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_products_get_top_10`(
     in in_branchesId int,
   in in_FromDate varchar(200),
	in in_ToDate varchar(200),
	in in_orderBy int  -- 1  theo doanh thu, 2 theo số lượng
)
BEGIN
	SET @row_number = 0;

    if(in_orderBy =1) then
		select t.id, productsName,subName,productsCode,sum(totalSales) as totalSales,

            (case when  not isnull(units.id) then json_object("id", units.id, "unitsName", units.unitsName) else null end)as units
		from 
		(
		SELECT 
			  products.id,productsName,subName,productsCode, 0 as childId,products.unitsId,
					sum(   
					 if(receipts.totalMoney = 0, 0,
					  (receiptsProducts.amount -receiptsProducts.returnAmount)* receiptsProducts.dealPrice  -							-
							(receipts.discount*(( receiptsProducts.amount-receiptsProducts.returnAmount   )*receiptsProducts.dealPrice)
								 /
								(`receipts`.totalMoney-`receipts`.totalSurchageMoney +`receipts`.discount )
							)
						)
					)  as totalSales
			
		FROM
			receipts
				INNER JOIN
			receiptsProducts ON receipts.id = receiptsProducts.receiptsId
				INNER JOIN
			products ON products.id = receiptsProducts.productsId
				AND products.parentId = 0
				and products.status = 1
		WHERE
			receipts.status = 1
				AND receipts.branchesId = in_branchesId
					   and  (in_FromDate = '' or receipts.staticDay >= in_FromDate )
					   and (in_ToDate= '' or  receipts.staticDay < in_ToDate + interval 1 day)
		union 
		SELECT 
			  parent.id,parent.productsName,parent.subName,parent.productsCode,products.id as childId,parent.unitsId,
					sum(   
					 if(receipts.totalMoney = 0, 0,
					  (receiptsProducts.amount -receiptsProducts.returnAmount)* receiptsProducts.dealPrice  -							-
							(receipts.discount*(( receiptsProducts.amount-receiptsProducts.returnAmount   )*receiptsProducts.dealPrice)
								 /
								(`receipts`.totalMoney-`receipts`.totalSurchageMoney +`receipts`.discount )
							)
						)
					)  as totalSales
		FROM
			receipts
				INNER JOIN
			receiptsProducts ON receipts.id = receiptsProducts.receiptsId
				INNER JOIN
			products ON products.id = receiptsProducts.productsId
				INNER JOIN
			products as parent ON parent.id = products.parentId  
			   and parent.status = 1
				LEFT JOIN
			`units` AS `units` ON `units`.`id` = `products`.`unitsId`
		WHERE
			receipts.status = 1
				AND receipts.branchesId = in_branchesId
					   and  (in_FromDate = '' or receipts.staticDay >= in_FromDate )
					   and (in_ToDate= '' or  receipts.staticDay < in_ToDate + interval 1 day)
		group by products.id
		)t
			left JOIN
					 `units` AS `units`   ON `units`.`id` = `t`.`unitsId`
		group by t.id
		order by sum(totalSales) desc
		limit  10;
				 
    elseif(in_orderBy =2) then 
    	select t.id, productsName,subName,productsCode,sum(totalSales) as totalSales,

            (case when  not isnull(units.id) then json_object("id", units.id, "unitsName", units.unitsName) else null end)as units
				from 
				(
				SELECT 
					  products.id,productsName,subName,productsCode, 0 as childId,products.unitsId,
						  sum(receiptsProducts.amount) as totalSales
					
				FROM
					receipts
						INNER JOIN
					receiptsProducts ON receipts.id = receiptsProducts.receiptsId
						INNER JOIN
					products ON products.id = receiptsProducts.productsId
						AND products.parentId = 0
						and products.status = 1
						
				WHERE
					receipts.status = 1
						AND receipts.branchesId =in_branchesId
						and  (in_FromDate = '' or receipts.staticDay >= in_FromDate )
						and (in_ToDate= '' or  receipts.staticDay < in_ToDate + interval 1 day)
		union 
				SELECT 
					  parent.id,parent.productsName,parent.subName,parent.productsCode,products.id as childId,parent.unitsId,
							sum(receiptsProducts.amount*ifnull(units.exchangeValue,1)) as totalSales
				FROM
					receipts
						INNER JOIN
					receiptsProducts ON receipts.id = receiptsProducts.receiptsId
						INNER JOIN
					products ON products.id = receiptsProducts.productsId
						 left JOIN
							 `units` AS `units`   ON `units`.`id` = `products`.`unitsId`
						INNER JOIN
					products as parent ON parent.id = products.parentId  
				 
					   and parent.status = 1
				   
				WHERE
					receipts.status = 1
						AND receipts.branchesId =in_branchesId
								and  (in_FromDate = '' or receipts.staticDay >= in_FromDate )
							   and (in_ToDate= '' or  receipts.staticDay < in_ToDate + interval 1 day)
				group by products.id
				)t
				left JOIN
									 `units` AS `units`   ON `units`.`id` = `t`.`unitsId`
				group by t.id
				order by sum(totalSales) desc
				limit  10;
				end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_products_statistical_customers_debit` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_products_statistical_customers_debit`(
   in in_branchesId int,
    in in_dateFrom date,
    in in_dateTo date,
    in in_customersNameOrCustomersCode varchar(200) COLLATE utf8mb3_unicode_ci ,
	in in_pageIndex int, 
    in in_pageSize int,
    out out_CountRows bigint,
	out out_nodauky double,
    out out_ghino double,
    out out_ghico double,
    out out_ghicuoiky double
)
BEGIN

-- call quanlybanhang.sp_products_statistical_customers_debit('2021-12-31', '2023-12-31', '', 0, 50);

DROP TEMPORARY TABLE IF EXISTS temp_list_customers_debit;
 CREATE TEMPORARY TABLE temp_list_customers_debit(
	select customers.id,customers.customersCode,customers.customersName,
	((sum(
		case when (receipts.staticDay < in_dateFrom 
						and receipts.status=1
					)
		then receipts.totalMoney 
		else 0 end
	)) 
   - ( select ifnull(sum(totalMoney),0) 
        from bills
        where  
         bills.staticDay < in_dateFrom
              and bills.branchesId =in_branchesId
		 and bills.status=1
         and bills.planningStatus = 1
		 and bills.customersId=customers.id
		)
        
    -( select ifnull(sum(totalMoney),0) 
        from productReturns
        where  
		  productReturns.staticDay < in_dateFrom
          and productReturns.branchesId =in_branchesId
		and productReturns.status=1
		and productReturns.customersId=customers.id  
        )
        
     -(select ifnull(sum(totalMoney),0) 
        from warehouseIn
        where  
		  warehouseIn.staticDay < in_dateFrom
		and warehouseIn.branchesId =in_branchesId
		and warehouseIn.status=1
		and warehouseIn.customersId=customers.id  
        )   
	 +(select ifnull(sum(totalMoney),0) 
        from warehouseOut
        where  
		  warehouseOut.staticDay < in_dateFrom
		and warehouseOut.branchesId =in_branchesId
		and warehouseOut.status=1
		and warehouseOut.customersId=customers.id  
        )   
	)
    nodauky,
    
	ifnull(sum(
		case when (receipts.staticDay >= in_dateFrom and receipts.staticDay < in_dateTo  + INTERVAL 1 DAY
					
					)
		then receipts.totalMoney
		else 0 end
	),0) 
     - ifnull(fn_bills_chi_calculator_byCustomersId(in_branchesId,customers.id,in_dateFrom,in_dateTo) ,0
     -  (select ifnull(sum(totalMoney),0) 
        from warehouseIn
        where  
		  warehouseIn.staticDay >= in_dateFrom
		and warehouseIn.staticDay < in_dateTo  + INTERVAL 1 DAY
		and warehouseIn.status=1
		and warehouseIn.customersId=customers.id  
        )   
	+ (select ifnull(sum(totalMoney),0) 
        from warehouseOut
        where  
		  warehouseOut.staticDay >= in_dateFrom
		and warehouseOut.staticDay < in_dateTo  + INTERVAL 1 DAY
		and warehouseOut.status=1
		and warehouseOut.customersId=customers.id  
        )  
     ) as ghino,

	(fn_bills_calculator_byCustomersId(in_branchesId,customers.id,in_dateFrom,in_dateTo)
    + fn_productReturns_calculator_byCustomersId(in_branchesId,customers.id,in_dateFrom,in_dateTo))
    "ghico"
    
    from customers
		left join receipts on receipts.customersId = customers.id
                and receipts.branchesId =in_branchesId
				 and receipts.status  =1 
	where ((customers.customersCode = in_customersNameOrCustomersCode  COLLATE utf8_unicode_ci  or in_customersNameOrCustomersCode='')
    or  (lower(customers.customersName) like  concat("%",CONVERT(lower(in_customersNameOrCustomersCode), BINARY),"%")))
    and customers.branchesId =in_branchesId
    and customers.debt <> 0
    and (customers.customersOrSuplliers = 0 or  customers.customersOrSuplliers = 2 )
    group by customers.id
);
set out_CountRows=(select count(*) from temp_list_customers_debit);
set out_nodauky=(select sum(nodauky) from temp_list_customers_debit);
set out_ghino=(select sum(ghino) from temp_list_customers_debit);
set out_ghico=(select  sum(ghico) from temp_list_customers_debit);
set out_ghicuoiky=(select  sum(nodauky+ghino-ghico) from temp_list_customers_debit);

select id,customersCode,customersName,nodauky,ghino,ghico,(ifnull(nodauky,0)+ifnull(ghino,0)-ifnull(ghico,0)) as nocuoiky
 from temp_list_customers_debit
order by (ifnull(nodauky,0)+ifnull(ghino,0)-ifnull(ghico,0))  desc
limit in_pageIndex,in_pageSize
;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_products_statistical_customers_debit_v2` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_products_statistical_customers_debit_v2`(
	in in_dateFrom date,
    in in_dateTo date,
    in in_customersNameOrCustomersCode varchar(200) COLLATE utf8mb3_unicode_ci ,
	in in_pageIndex int, 
    in in_pageSize int,
    out out_CountRows bigint,
	out out_nodauky double,
    out out_ghino double,
    out out_ghico double,
    out out_ghicuoiky double
)
BEGIN
DROP TEMPORARY TABLE IF EXISTS temp_list_customers_debit;
 CREATE TEMPORARY TABLE temp_list_customers_debit(
	select customers.id,customers.customersCode,customers.customersName,
	((sum(
		case when (receipts.staticDay < in_dateFrom 
						and receipts.status=1
					)
		then receipts.totalMoney 
		else 0 end
	)) 
   - ( select ifnull(sum(totalMoney),0) 
        from bills
        where  
         bills.staticDay < in_dateFrom
		 and bills.status=1
         and bills.planningStatus = 1
		 and bills.customersId=customers.id
		)
        
    -( select ifnull(sum(totalMoney),0) 
        from productReturns
        where  
		  productReturns.staticDay < in_dateFrom
		and productReturns.status=1
		and productReturns.customersId=customers.id  
        ))
    nodauky,
    
	ifnull(sum(
		case when (receipts.staticDay >= in_dateFrom and receipts.staticDay < in_dateTo + INTERVAL 1 DAY
						and receipts.status=1
					)
		then receipts.totalMoney
		else 0 end
	),0) - ifnull(fn_bills_chi_calculator_byCustomersId(customers.id,in_dateFrom,in_dateTo) ,0) as ghino,

	(fn_bills_calculator_byCustomersId(customers.id,in_dateFrom,in_dateTo)
    + fn_productReturns_calculator_byCustomersId(customers.id,in_dateFrom,in_dateTo))
    "ghico"
    
    from customers
		left join receipts on receipts.customersId = customers.id
	where ((customers.customersCode = in_customersNameOrCustomersCode  COLLATE utf8_unicode_ci  or in_customersNameOrCustomersCode='')
    or  (lower(customers.customersName) like  concat("%",CONVERT(lower(in_customersNameOrCustomersCode), BINARY),"%")))
    and customers.id <> 412  
    and customers.debt <> 0
    group by customers.id
);
set out_CountRows=(select count(*) from temp_list_customers_debit);
set out_nodauky=(select sum(nodauky) from temp_list_customers_debit);
set out_ghino=(select sum(ghino) from temp_list_customers_debit);
set out_ghico=(select  sum(ghico) from temp_list_customers_debit);
set out_ghicuoiky=(select  sum(nodauky+ghino-ghico) from temp_list_customers_debit);

select id,customersCode,customersName,nodauky,ghino,ghico,(ifnull(nodauky,0)+ifnull(ghino,0)-ifnull(ghico,0)) as nocuoiky
 from temp_list_customers_debit
order by (ifnull(nodauky,0)+ifnull(ghino,0)-ifnull(ghico,0))  desc
limit in_pageIndex,in_pageSize
;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_products_statistical_customers_profit` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_products_statistical_customers_profit`(
    in in_branchesId int,
	in in_dateFrom date,
    in in_dateTo date,
    in in_customersNameOrCustomersCode varchar(200) COLLATE utf8mb3_unicode_ci ,
	in in_pageIndex int, 
    in in_pageSize int,
    out out_CountRows bigint,
    out out_tongtienhang double,
	out out_giamgiahoadon double,
    out out_doanhthuban double,
    out out_giatritra double,
    out out_doanhthuthuan double,
	out out_tonggiavon double,
	out out_loinhuangop double
)
BEGIN

-- call quanlybanhang.sp_products_statistical_customers_profit('2021-12-31', '2030-12-31', 'ke', 1, 50);

DROP TEMPORARY TABLE IF EXISTS temp_list_customers;
 CREATE TEMPORARY TABLE temp_list_customers(

		select customers.id,customers.customersCode,customers.customersName,
		sum(
						case when ( receipts.staticDay >=  in_dateFrom and  receipts.staticDay <  in_dateTo + INTERVAL 1 DAY
							
						)
			then receipts.totalMoney
			else 0 end
		) tongtienhang,
		sum(
						case when ( receipts.staticDay >=  in_dateFrom and  receipts.staticDay <  in_dateTo + INTERVAL 1 DAY
						
						)
			then receipts.discount
			else 0 end
		) giamgiahoadon,
		sum(
				ifnull(
						case when ( receipts.staticDay >=  in_dateFrom and  receipts.staticDay <  in_dateTo + INTERVAL 1 DAY
							
						)
						then receipts.totalMoney-ifnull(receipts.totalSurchageMoney,0)
						else 0 end
			,0)
		)doanhthuban,
		fn_product_calculator_byCustomersId_giavon(in_branchesId,customers.id,in_dateFrom,in_dateTo)
		as tonggiavon,
        JSON_UNQUOTE(JSON_EXTRACT(fn_productReturns_calculator_byCustomersId_trahang(in_branchesId,customers.id,in_dateFrom,in_dateTo), "$.giatritra"))
    as giatritra
		from customers
			left join receipts on receipts.customersId = customers.id
		               and receipts.branchesId =in_branchesId
                       and receipts.status  =1 
		where ((customers.customersCode = in_customersNameOrCustomersCode  COLLATE utf8_unicode_ci  or in_customersNameOrCustomersCode='')
		or  (lower(customers.customersName) like  concat("%",CONVERT(lower(in_customersNameOrCustomersCode), BINARY),"%"))
		)
        and customers.branchesId =in_branchesId

		group by customers.id

);
set out_CountRows=(select count(*) from temp_list_customers);
set out_tongtienhang=(select round(sum(tongtienhang),2) from temp_list_customers);
set out_giamgiahoadon=(select round(sum(giamgiahoadon),2) from temp_list_customers);
set out_doanhthuban =(select round(sum(doanhthuban),2)  from temp_list_customers);
set out_giatritra =(select round(sum(giatritra),2)  from temp_list_customers);
set out_doanhthuthuan =(select round(sum(doanhthuban-giatritra),2)  from temp_list_customers);
set out_tonggiavon =(select round(sum(tonggiavon),2)  from temp_list_customers);
set out_loinhuangop =(select round(sum(doanhthuban-giatritra-tonggiavon),2)  from temp_list_customers);
select id,customersCode,customersName,tongtienhang,giamgiahoadon
	,doanhthuban,giatritra,
   round( (ifnull(doanhthuban,0)- ifnull(giatritra,0)),2)as doanhthuthuan,round(tonggiavon,2) , round((ifnull(doanhthuban,0)-ifnull(giatritra,0)-ifnull(tonggiavon,0)),2) as loinhuangop
    
 from temp_list_customers
order by (ifnull(doanhthuban,0)-ifnull(giatritra,0)-ifnull(tonggiavon,0)) desc
limit in_pageIndex,in_pageSize
;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_products_statistical_customers_sell` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_products_statistical_customers_sell`(
    in in_branchesId int,
	in in_dateFrom date,
    in in_dateTo date,
    in in_customersNameOrCustomersCode varchar(200) COLLATE utf8mb3_unicode_ci,
	in in_pageIndex int, 
    in in_pageSize int,
    out out_CountRows bigint,
    out out_doanhthuban double,
    out out_giatritra double,
    out out_doanhthuthuan double
)
BEGIN

-- call quanlybanhang.sp_products_statistical_customers_sell('2021-12-31', '2024-12-31', 'k01', 0, 10);

DROP TEMPORARY TABLE IF EXISTS temp_list_customers;
 CREATE TEMPORARY TABLE temp_list_customers(
	select customers.id,customers.customersCode,customers.customersName,
	sum(
			ifnull(
					 receipts.totalMoney-ifnull(receipts.totalSurchageMoney,0)
		,0)
    )doanhthuban,
	JSON_UNQUOTE(JSON_EXTRACT(fn_productReturns_calculator_byCustomersId_trahang(in_branchesId,customers.id,in_dateFrom,in_dateTo), "$.giatritra"))
    as giatritra
    from customers
		inner join receipts on receipts.customersId = customers.id
                              and receipts.branchesId = in_branchesId
        
        
        
        
	where ((customers.customersCode = in_customersNameOrCustomersCode  COLLATE utf8_unicode_ci  or in_customersNameOrCustomersCode='')
    or  (lower(customers.customersName) like  concat("%",CONVERT(lower(in_customersNameOrCustomersCode), BINARY),"%") )
    )
    and
    (receipts.staticDay >= in_dateFrom and receipts.staticDay <= in_dateTo  + INTERVAL 1 DAY
						and receipts.status=1
					)
    
    group by customers.id
);
set out_CountRows=(select count(*) from temp_list_customers);
set out_doanhthuban =(select sum(doanhthuban)  from temp_list_customers);
set out_giatritra =(select sum(giatritra)  from temp_list_customers);
set out_doanhthuthuan =(select sum(ifnull(doanhthuban,0)-ifnull(giatritra,0))  from temp_list_customers);
select id,customersCode,customersName
	,doanhthuban,giatritra,
    (ifnull(doanhthuban,0)-ifnull(giatritra,0))as doanhthuthuan
   
 from temp_list_customers
order by doanhthuban desc
limit in_pageIndex,in_pageSize
;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_products_statistical_Input_ouput_inventory` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_products_statistical_Input_ouput_inventory`(
   in in_branchesId int,
    in in_dateFrom datetime,
      in in_dateTo datetime,
      in in_productsSearch varchar(45) ,
      in in_productGroupsId bigint, -- 0
      in in_brandsId bigint, -- 0
      in in_inventoryLevel int,-- 0: tất cả, -1: dưới mức tồn, 1: vượt mức tồn, 2: còn hàng trong kho, 3: hết hàng trong kho
      in in_productStatus int, -- -99:tất cả, 0: ngừng kinh doanh, 1: đang kinh doanh
      in in_pageIndex int,
      in in_pageSize int,
      out out_CountRows bigint
  )
BEGIN

  DROP TEMPORARY TABLE IF EXISTS temp_list_input_output_inventory;
  CREATE TEMPORARY TABLE temp_list_input_output_inventory(
    select id,
    productsName,
    productsCode,
    parentId,
    KiemKho_nhap_dauky - KiemKho_xuat_dauky + NCC_nhap_dauky - NCC_xuat_dauky - Huy_dauky + Tra_dauky - Ban_dauky as "hangtondauky",
    (
        KiemKho_nhap_dauky - KiemKho_xuat_dauky + NCC_nhap_dauky - NCC_xuat_dauky - Huy_dauky + Tra_dauky - Ban_dauky
    ) * importPrice as "giatridauky",
    KiemKho_nhap + NCC_nhap + Tra as "soluongnhap",
    KiemKho_xuat + NCC_xuat + Huy + Ban as "soluongxuat",
    (KiemKho_nhap + NCC_nhap + Tra) * importPrice as "giatrinhap",
    (KiemKho_xuat + NCC_xuat + Huy + Ban) * importPrice as "giatrixuat",
    (
        KiemKho_nhap_dauky - KiemKho_xuat_dauky + NCC_nhap_dauky - NCC_xuat_dauky - Huy_dauky + Tra_dauky - Ban_dauky
    ) + (KiemKho_nhap + NCC_nhap + Tra) -(KiemKho_xuat + NCC_xuat + Huy + Ban) as "toncuoiky",
    (
        (
            KiemKho_nhap_dauky - KiemKho_xuat_dauky + NCC_nhap_dauky - NCC_xuat_dauky - Huy_dauky + Tra_dauky - Ban_dauky
        ) + (KiemKho_nhap + NCC_nhap + Tra) -(KiemKho_xuat + NCC_xuat + Huy + Ban)
    ) * importPrice as "giatricuoiky",
    KiemKho_nhap,
    NCC_nhap,
    Tra,
    KiemKho_xuat,
    NCC_xuat,
    Huy,
    Ban
from (
        select t4.id,
            max(parentId) as parentId,
            max(productsName) as productsName,
            max(productsCode) as productsCode,
            max(t4.importPrice) as importPrice,
            max(minAmount) as minAmount,
            max(maxAmount) as maxAmount,
            --
            max(KiemKho_nhap) as KiemKho_nhap,
            max(KiemKho_nhap_dauky) as KiemKho_nhap_dauky,
            max(KiemKho_xuat) as KiemKho_xuat,
            max(KiemKho_xuat_dauky) as KiemKho_xuat_dauky,
            max(NCC_nhap) as NCC_nhap,
            max(NCC_nhap_dauky) as NCC_nhap_dauky,
            max(NCC_xuat) as NCC_xuat,
            max(NCC_xuat_dauky) as NCC_xuat_dauky,
            max(Huy) as Huy,
            max(Huy_dauky) as Huy_dauky,
            max(Tra) as Tra,
            max(Tra_dauky) as Tra_dauky,
            sum(
                case
                    when (
                        receipts.staticDay >= in_dateFrom
                        and receipts.staticDay < in_dateTo + INTERVAL 1 DAY
                    ) then receiptsProducts.amount
                    else 0
                end
            ) as 'Ban',
            sum(
                case
                    when receipts.staticDay < in_dateFrom then receiptsProducts.amount
                    else 0
                end
            ) as 'Ban_dauky'
        from (
                select t3.id,
                    max(parentId) as parentId,
                    max(productsName) as productsName,
                    max(productsCode) as productsCode,
                    max(t3.importPrice) as importPrice,
                    max(minAmount) as minAmount,
                    max(maxAmount) as maxAmount,
                    max(KiemKho_nhap) as KiemKho_nhap,
                    max(KiemKho_nhap_dauky) as KiemKho_nhap_dauky,
                    max(KiemKho_xuat) as KiemKho_xuat,
                    max(KiemKho_xuat_dauky) as KiemKho_xuat_dauky,
                    max(NCC_nhap) as NCC_nhap,
                    max(NCC_nhap_dauky) as NCC_nhap_dauky,
                    max(NCC_xuat) as NCC_xuat,
                    max(NCC_xuat_dauky) as NCC_xuat_dauky,
                    max(Huy) as Huy,
                    max(Huy_dauky) as Huy_dauky,
                    sum(
                        case
                            when (
                                productReturns.staticDay >= in_dateFrom
                                and productReturns.staticDay < in_dateTo + INTERVAL 1 DAY
                            ) then productReturnsProducts.amount
                            else 0
                        end
                    ) as 'Tra',
                    sum(
                        case
                            when productReturns.staticDay < in_dateFrom then productReturnsProducts.amount
                            else 0
                        end
                    ) as 'Tra_dauky'
                from (
                        select t2.id,
                            max(parentId) as parentId,
                            max(productsName) as productsName,
                            max(productsCode) as productsCode,
                            max(t2.importPrice) as importPrice,
                            max(minAmount) as minAmount,
                            max(maxAmount) as maxAmount,
                            max(KiemKho_nhap) as KiemKho_nhap,
                            max(KiemKho_nhap_dauky) as KiemKho_nhap_dauky,
                            max(KiemKho_xuat) as KiemKho_xuat,
                            max(KiemKho_xuat_dauky) as KiemKho_xuat_dauky,
                            max(NCC_nhap) as NCC_nhap,
                            max(NCC_nhap_dauky) as NCC_nhap_dauky,
                            max(NCC_xuat) as NCC_xuat,
                            max(NCC_xuat_dauky) as NCC_xuat_dauky,
                            sum(
                                case
                                    when (
                                        productCancels.staticDay >= in_dateFrom
                                        and productCancels.staticDay < in_dateTo + INTERVAL 1 DAY
                                    ) then productCancelsProducts.amount
                                    else 0
                                end
                            ) as 'Huy',
                            sum(
                                case
                                    when productCancels.staticDay < in_dateFrom then productCancelsProducts.amount
                                    else 0
                                end
                            ) as 'Huy_dauky'
                        from (
                                select t1.id,
                                    max(parentId) as parentId,
                                    max(productsName) as productsName,
                                    max(productsCode) as productsCode,
                                    max(t1.importPrice) as importPrice,
                                    max(minAmount) as minAmount,
                                    max(maxAmount) as maxAmount,
                                    max(KiemKho_nhap) as KiemKho_nhap,
                                    max(KiemKho_nhap_dauky) as KiemKho_nhap_dauky,
                                    max(KiemKho_xuat) as KiemKho_xuat,
                                    max(KiemKho_xuat_dauky) as KiemKho_xuat_dauky,
                                        max(NCC_xuat_dauky) as NCC_xuat_dauky,
                                    max(NCC_xuat) as NCC_xuat,
                                    sum(
                                        case
                                            when (
                                          warehouseIn.staticDay >= in_dateFrom
                                                and warehouseIn.staticDay < in_dateTo + INTERVAL 1 DAY
                                            ) then warehouseInProducts.amount
                                            else 0
                                        end
                                    ) as 'NCC_nhap',
                                    sum(
                                        case
                                            when warehouseIn.staticDay < in_dateFrom then warehouseInProducts.amount
                                            else 0
                                        end
                                    ) as 'NCC_nhap_dauky'
                                from (
                                 --
                                 select t0.id,
										max(parentId) as parentId,
										max(productsName) as productsName,
										max(productsCode) as productsCode,
										max(t0.importPrice) as importPrice,
										max(minAmount) as minAmount,
										max(maxAmount) as maxAmount,
										max(KiemKho_nhap) as KiemKho_nhap,
										max(KiemKho_nhap_dauky) as KiemKho_nhap_dauky,
										max(KiemKho_xuat) as KiemKho_xuat,
										max(KiemKho_xuat_dauky) as KiemKho_xuat_dauky,
										sum(
											case
												when (
													   warehouseOut.staticDay >= in_dateFrom
													and warehouseOut.staticDay < in_dateTo + INTERVAL 1 DAY
												) then warehouseOutProducts.amount
												else 0
											end
										) as 'NCC_xuat',
										sum(
											case
												when 
                                                   warehouseOut.staticDay < in_dateFrom then warehouseOutProducts.amount
												else 0
											end
										) as 'NCC_xuat_dauky' 
                                    from
												(select products.id,
													products.parentId,
													products.productsName,
													products.productsCode,
													ifnull(productsTotalInfo.importPrice,0) as importPrice,
													minAmount,
													maxAmount,
													sum(
														(
															case
																when warehouseCheckProducts.changeNumber > 0
																and (
																	warehouseCheck.staticDay >= in_dateFrom
																	and warehouseCheck.staticDay < in_dateTo + INTERVAL 1 DAY
																) then warehouseCheckProducts.changeNumber
																else 0
															end
														)
													) as 'KiemKho_nhap',
													sum(
														(
															case
																when warehouseCheckProducts.changeNumber > 0
																and warehouseCheck.staticDay < in_dateFrom then warehouseCheckProducts.changeNumber
																else 0
															end
														)
													) as 'KiemKho_nhap_dauky',
													sum(
														(
															case
																when (
																	warehouseCheckProducts.changeNumber < 0
																	and warehouseCheck.staticDay >= in_dateFrom
																	and warehouseCheck.staticDay < in_dateTo + INTERVAL 1 DAY
																) then warehouseCheckProducts.changeNumber * -1
																else 0
															end
														)
													) as 'KiemKho_xuat',
													sum(
														(
															case
																when warehouseCheckProducts.changeNumber < 0
																and warehouseCheck.staticDay < in_dateFrom then warehouseCheckProducts.changeNumber * - 1
																else 0
															end
														)
													) as 'KiemKho_xuat_dauky'
												from products
                                                    left join productsTotalInfo on productsTotalInfo.productsId = products.id
                                                               and productsTotalInfo.branchesId = in_branchesId
													left join warehouseCheckProducts on warehouseCheckProducts.productsId = products.id
													left join warehouseCheck on warehouseCheck.id = warehouseCheckProducts.warehouseCheckId
													and warehouseCheck.status = 1
													and warehouseCheck.branchesId = in_branchesId
												where parentId = 0
													and (
														lower(products.productsName) like concat(
															"%",
															CONVERT(lower(in_productsSearch), BINARY),
															"%"
														)
														or lower(products.productsCode) like concat(
															"%",
															CONVERT(lower(in_productsSearch), BINARY),
															"%"
														)
													)
													and (
														in_productGroupsId = 0
														or products.productGroupsId = in_productGroupsId
													)
													and (
														in_brandsId = 0
														or products.brandsId = in_brandsId
													)
													and (products.status = 1)
												group by products.id
                                                )t0
											left join warehouseOutProducts on warehouseOutProducts.productsId = t0.id
											left join warehouseOut on warehouseOut.id = warehouseOutProducts.warehouseOutId
                                              and warehouseOut.status = 1
                                              
                                              and warehouseOut.branchesId = in_branchesId
                                              group by t0.id
                                        -- 
                                    ) t1
                                    left join warehouseInProducts on warehouseInProducts.productsId = t1.id
                                    left join warehouseIn on warehouseIn.id = warehouseInProducts.warehouseInId
                                    and warehouseIn.status = 1
                                    and warehouseIn.branchesId = in_branchesId
                                group by t1.id
                            ) t2
                            left join productCancelsProducts on productCancelsProducts.productsId = t2.id
                            left join productCancels on productCancels.id = productCancelsProducts.productCancelsId 
                                    and productCancels.status = 1
                                    and productCancels.branchesId = in_branchesId
                        group by t2.id
                    ) t3
                    left join productReturnsProducts on productReturnsProducts.productsId = t3.id
                    left join productReturns on productReturns.id = productReturnsProducts.productReturnsId
                                    and productReturns.status = 1
                                    and productReturns.branchesId = in_branchesId
                group by t3.id
            ) t4
            left join receiptsProducts on receiptsProducts.productsId = t4.id
            left join receipts on receipts.id = receiptsProducts.receiptsId
									and receipts.status = 1
                                    and receipts.branchesId = in_branchesId
        group by t4.id
    ) t5
where (
        in_inventoryLevel = 0
        or (
            in_inventoryLevel = 1
            and (
                (
                    KiemKho_nhap_dauky - KiemKho_xuat_dauky + NCC_nhap_dauky - NCC_xuat_dauky - Huy_dauky + Tra_dauky - Ban_dauky
                ) + (KiemKho_nhap + NCC_nhap + Tra) -(KiemKho_xuat + NCC_xuat + Huy + Ban) < minAmount
            )
        )
        or (
            in_inventoryLevel = 2
            and (
                (
                    KiemKho_nhap_dauky - KiemKho_xuat_dauky + NCC_nhap_dauky - NCC_xuat_dauky - Huy_dauky + Tra_dauky - Ban_dauky
                ) + (KiemKho_nhap + NCC_nhap + Tra) -(KiemKho_xuat + NCC_xuat + Huy + Ban) > maxAmount
            )
        )
        or (
            in_inventoryLevel = 3
            and (
                (
                    KiemKho_nhap_dauky - KiemKho_xuat_dauky + NCC_nhap_dauky - NCC_xuat_dauky - Huy_dauky + Tra_dauky - Ban_dauky
                ) + (KiemKho_nhap + NCC_nhap + Tra) -(KiemKho_xuat + NCC_xuat + Huy + Ban) > 0
            )
        )
        or (
            in_inventoryLevel = 4
            and (
                (
                    KiemKho_nhap_dauky - KiemKho_xuat_dauky + NCC_nhap_dauky - NCC_xuat_dauky - Huy_dauky + Tra_dauky - Ban_dauky
                ) + (KiemKho_nhap + NCC_nhap + Tra) -(KiemKho_xuat + NCC_xuat + Huy + Ban) <= 0
            )
        )
    )

    );



-- child  
  DROP TEMPORARY TABLE IF EXISTS temp_list_input_output_child;
  CREATE TEMPORARY TABLE temp_list_input_output_child(
select id,
    productsName,
    productsCode,
    parentId,
    (
        KiemKho_nhap_dauky - KiemKho_xuat_dauky + NCC_nhap_dauky - NCC_xuat_dauky - Huy_dauky + Tra_dauky - Ban_dauky
    ) * exchangeValue as "hangtondauky",
    (
        KiemKho_nhap_dauky - KiemKho_xuat_dauky + NCC_nhap_dauky - NCC_xuat_dauky - Huy_dauky + Tra_dauky - Ban_dauky
    ) *exchangeValue * importPrice as "giatridauky",
    (KiemKho_nhap + NCC_nhap + Tra) * exchangeValue as "soluongnhap",
    (KiemKho_xuat + NCC_xuat + Huy + Ban) * exchangeValue as "soluongxuat",
    (KiemKho_nhap + NCC_nhap + Tra) *exchangeValue * importPrice as "giatrinhap",
    (KiemKho_xuat + NCC_xuat + Huy + Ban)*exchangeValue * importPrice as "giatrixuat",
    (
        (
            KiemKho_nhap_dauky - KiemKho_xuat_dauky + NCC_nhap_dauky - NCC_xuat_dauky - Huy_dauky + Tra_dauky - Ban_dauky
        ) + (KiemKho_nhap + NCC_nhap + Tra) -(KiemKho_xuat + NCC_xuat + Huy + Ban)
    ) * exchangeValue as "toncuoiky",
    (
        (
            KiemKho_nhap_dauky - KiemKho_xuat_dauky + NCC_nhap_dauky - NCC_xuat_dauky - Huy_dauky + Tra_dauky - Ban_dauky
        ) + (KiemKho_nhap + NCC_nhap + Tra) -(KiemKho_xuat + NCC_xuat + Huy + Ban)
    ) *exchangeValue * importPrice as "giatricuoiky",
    KiemKho_nhap * exchangeValue as KiemKho_nhap,
    NCC_nhap * exchangeValue as NCC_nhap,
    Tra * exchangeValue as Tra,
    KiemKho_xuat * exchangeValue as KiemKho_xuat,
    NCC_xuat * exchangeValue as NCC_xuat,
    Huy * exchangeValue as Huy,
    Ban * exchangeValue as Ban
from (
        select t4.id,
            max(t4.parentId) as parentId,
            max(productsName) as productsName,
            max(productsCode) as productsCode,
            max(t4.importPrice) as importPrice,
            max(minAmount) as minAmount,
            max(maxAmount) as maxAmount,
            max(unitsId) as unitsId,
            max(exchangeValue) as exchangeValue,
            max(KiemKho_nhap) as KiemKho_nhap,
            max(KiemKho_nhap_dauky) as KiemKho_nhap_dauky,
            max(KiemKho_xuat) as KiemKho_xuat,
            max(KiemKho_xuat_dauky) as KiemKho_xuat_dauky,
            max(NCC_nhap) as NCC_nhap,
            max(NCC_nhap_dauky) as NCC_nhap_dauky,
            max(NCC_xuat) as NCC_xuat,
            max(NCC_xuat_dauky) as NCC_xuat_dauky,
            max(Huy) as Huy,
            max(Huy_dauky) as Huy_dauky,
            max(Tra) as Tra,
            max(Tra_dauky) as Tra_dauky,
            sum(
                case
                    when (
                        receipts.staticDay >= in_dateFrom
                        and receipts.staticDay < in_dateTo + INTERVAL 1 DAY
                    ) then receiptsProducts.amount
                    else 0
                end
            ) as 'Ban',
            sum(
                case
                    when receipts.staticDay < in_dateFrom then receiptsProducts.amount
                    else 0
                end
            ) as 'Ban_dauky'
        from (
                select t3.id,
                    max(parentId) as parentId,
                    max(productsName) as productsName,
                    max(productsCode) as productsCode,
                    max(t3.importPrice) as importPrice,
                    max(minAmount) as minAmount,
                    max(maxAmount) as maxAmount,
                    max(unitsId) as unitsId,
                    max(KiemKho_nhap) as KiemKho_nhap,
                    max(KiemKho_nhap_dauky) as KiemKho_nhap_dauky,
                    max(KiemKho_xuat) as KiemKho_xuat,
                    max(KiemKho_xuat_dauky) as KiemKho_xuat_dauky,
                    max(NCC_nhap) as NCC_nhap,
                    max(NCC_nhap_dauky) as NCC_nhap_dauky,
                    max(NCC_xuat) as NCC_xuat,
                    max(NCC_xuat_dauky) as NCC_xuat_dauky,
                    max(Huy) as Huy,
                    max(Huy_dauky) as Huy_dauky,
                    sum(
                        case
                            when (
                                productReturns.staticDay >= in_dateFrom
                                and productReturns.staticDay < in_dateTo + INTERVAL 1 DAY
                            ) then productReturnsProducts.amount
                            else 0
                        end
                    ) as 'Tra',
                    sum(
                        case
                            when productReturns.staticDay < in_dateFrom then productReturnsProducts.amount
                            else 0
                        end
                    ) as 'Tra_dauky'
                from (
                        select t2.id,
                            max(parentId) as parentId,
                            max(productsName) as productsName,
                            max(productsCode) as productsCode,
                            max(t2.importPrice) as importPrice,
                            max(minAmount) as minAmount,
                            max(maxAmount) as maxAmount,
                            max(unitsId) as unitsId,
                            max(KiemKho_nhap) as KiemKho_nhap,
                            max(KiemKho_nhap_dauky) as KiemKho_nhap_dauky,
                            max(KiemKho_xuat) as KiemKho_xuat,
                            max(KiemKho_xuat_dauky) as KiemKho_xuat_dauky,
                            max(NCC_nhap) as NCC_nhap,
                            max(NCC_nhap_dauky) as NCC_nhap_dauky,
                            max(NCC_xuat) as NCC_xuat,
                            max(NCC_xuat_dauky) as NCC_xuat_dauky,
                            sum(
                                case
                                    when (
                                        productCancels.staticDay >= in_dateFrom
                                        and productCancels.staticDay < in_dateTo + INTERVAL 1 DAY
                                    ) then productCancelsProducts.amount
                                    else 0
                                end
                            ) as 'Huy',
                            sum(
                                case
                                    when productCancels.staticDay < in_dateFrom then productCancelsProducts.amount
                                    else 0
                                end
                            ) as 'Huy_dauky'
                        from (
                                select t1.id,
                                    max(parentId) as parentId,
                                    max(productsName) as productsName,
                                    max(productsCode) as productsCode,
                                    max(t1.importPrice) as importPrice,
                                    max(minAmount) as minAmount,
                                    max(maxAmount) as maxAmount,
                                    max(unitsId) as unitsId,
                                    max(KiemKho_nhap) as KiemKho_nhap,
                                    max(KiemKho_nhap_dauky) as KiemKho_nhap_dauky,
                                    max(KiemKho_xuat) as KiemKho_xuat,
                                    max(KiemKho_xuat_dauky) as KiemKho_xuat_dauky,
                                    max(NCC_xuat) as NCC_xuat,
                                    max(NCC_xuat_dauky) as NCC_xuat_dauky,
                                    sum(
                                        case
                                            when (
                                                warehouseIn.staticDay >= in_dateFrom
                                                and warehouseIn.staticDay < in_dateTo + INTERVAL 1 DAY
                                            ) then warehouseInProducts.amount
                                            else 0
                                        end
                                    ) as 'NCC_nhap',
                                    sum(
                                        case
                                            when warehouseIn.staticDay < in_dateFrom then warehouseInProducts.amount
                                            else 0
                                        end
                                    ) as 'NCC_nhap_dauky'
                                from (
                                        -- 
                                        select t0.id,
                                            max(parentId) as parentId,
                                            max(productsName) as productsName,
                                            max(productsCode) as productsCode,
                                            max(t0.importPrice) as importPrice,
                                            max(minAmount) as minAmount,
                                            max(maxAmount) as maxAmount,
                                            max(unitsId) as unitsId,
                                            max(KiemKho_nhap) as KiemKho_nhap,
                                            max(KiemKho_nhap_dauky) as KiemKho_nhap_dauky,
                                            max(KiemKho_xuat) as KiemKho_xuat,
                                            max(KiemKho_xuat_dauky) as KiemKho_xuat_dauky,
                                            sum(
                                                case
                                                    when (
                                                        warehouseOut.staticDay >= in_dateFrom
                                                        and warehouseOut.staticDay < in_dateTo + INTERVAL 1 DAY
                                                    ) then warehouseOutProducts.amount
                                                    else 0
                                                end
                                            ) as 'NCC_xuat',
                                            sum(
                                                case
                                                    when warehouseOut.staticDay < in_dateFrom then warehouseOutProducts.amount
                                                    else 0
                                                end
                                            ) as 'NCC_xuat_dauky'
                                        from (
                                                select products.id,
                                                    products.parentId,
                                                    products.productsName,
                                                    products.productsCode,
                                                    ifnull(productsTotalInfo.importPrice, 0) as  importPrice,
                                                    products.minAmount,
                                                    products.maxAmount,
                                                    products.unitsId,
                                                    sum(
                                                        (
                                                            case
                                                                when warehouseCheckProducts.changeNumber > 0
                                                                and (
                                                                    warehouseCheck.staticDay >= in_dateFrom
                                                                    and warehouseCheck.staticDay < in_dateTo + INTERVAL 1 DAY
                                                                ) then warehouseCheckProducts.changeNumber
                                                                else 0
                                                            end
                                                        )
                                                    ) as 'KiemKho_nhap',
                                                    sum(
                                                        (
                                                            case
                                                                when warehouseCheckProducts.changeNumber > 0
                                                                and warehouseCheck.staticDay < in_dateFrom then warehouseCheckProducts.changeNumber
                                                                else 0
                                                            end
                                                        )
                                                    ) as 'KiemKho_nhap_dauky',
                                                    sum(
                                                        (
                                                            case
                                                                when (
                                                                    warehouseCheckProducts.changeNumber < 0
                                                                    and warehouseCheck.staticDay >= in_dateFrom
                                                                    and warehouseCheck.staticDay < in_dateTo + INTERVAL 1 DAY
                                                                ) then warehouseCheckProducts.changeNumber * -1
                                                                else 0
                                                            end
                                                        )
                                                    ) as 'KiemKho_xuat',
                                                    sum(
                                                        (
                                                            case
                                                                when warehouseCheckProducts.changeNumber < 0
                                                                and warehouseCheck.staticDay < in_dateFrom then warehouseCheckProducts.changeNumber * - 1
                                                                else 0
                                                            end
                                                        )
                                                    ) as 'KiemKho_xuat_dauky'
                                                from products as products
                                                 
                                                    left join warehouseCheckProducts on warehouseCheckProducts.productsId = products.id
                                                    left join warehouseCheck on warehouseCheck.id = warehouseCheckProducts.warehouseCheckId
                                                    and warehouseCheck.status = 1
                                                    and warehouseCheck.branchesId = in_branchesId
                                                    inner join products as parent on products.parentId = parent.id
													left join productsTotalInfo on productsTotalInfo.productsId = parent.id
                                                    and productsTotalInfo.branchesId = in_branchesId
                                                where products.parentId > 0
                                                    and (
                                                        lower(parent.productsName) like concat(
                                                            "%",
                                                            CONVERT(lower(in_productsSearch), BINARY),
                                                            "%"
                                                        )
                                                        or lower(parent.productsCode) like concat(
                                                            "%",
                                                            CONVERT(lower(in_productsSearch), BINARY),
                                                            "%"
                                                        )
                                                    )
                                                    and (
                                                        in_productGroupsId = 0
                                                        or products.productGroupsId = in_productGroupsId
                                                    )
                                                    and (
                                                        in_brandsId = 0
                                                        or products.brandsId = in_brandsId
                                                    )
                                                    and (products.status = 1)
                                                group by products.id
                                            ) t0
                                            left join warehouseOutProducts on warehouseOutProducts.productsId = t0.id
                                            left join warehouseOut on warehouseOut.id = warehouseOutProducts.warehouseOutId
                                            and warehouseOut.status = 1
                                            and warehouseOut.branchesId = in_branchesId --
                                            group by t0.id
                                    ) t1
                                    left join warehouseInProducts on warehouseInProducts.productsId = t1.id
                                    left join warehouseIn on warehouseIn.id = warehouseInProducts.warehouseInId
                                    and warehouseIn.status = 1
                                    and warehouseIn.branchesId = in_branchesId
                                group by t1.id
                            ) t2
                            left join productCancelsProducts on productCancelsProducts.productsId = t2.id
                            left join productCancels on productCancels.id = productCancelsProducts.productCancelsId
                            and productCancels.status = 1
                            and productCancels.branchesId = in_branchesId
                        group by t2.id
                    ) t3
                    left join productReturnsProducts on productReturnsProducts.productsId = t3.id
                    left join productReturns on productReturns.id = productReturnsProducts.productReturnsId
                    and productReturns.status = 1
                    and productReturns.branchesId = in_branchesId
                group by t3.id
            ) t4
            left join receiptsProducts on receiptsProducts.productsId = t4.id
            left join receipts on receipts.id = receiptsProducts.receiptsId
            and receipts.status = 1
            and receipts.branchesId = in_branchesId
            inner join units on units.id = t4.unitsId
        group by t4.id
    ) t5

    );
    
    set out_CountRows =  (select count(*) from temp_list_input_output_inventory);

    set @SQLStatement1=concat('
          select  products.id, max(products.productsName) as productsName,max(products.productsCode) as productsCode,

              round(max(products.hangtondauky) + ifnull(sum(child.hangtondauky),0),2) as  hangtondauky,
              round(max(products.giatridauky) + ifnull(sum(child.giatridauky),0) ,2) as giatridauky,
              round(max(products.soluongnhap) + ifnull(sum(child.soluongnhap),0) ,2) as soluongnhap,
              round(max(products.soluongxuat) + ifnull(sum(child.soluongxuat),0),2) as soluongxuat,
        round(max(products.giatrixuat) + ifnull(sum(child.giatrixuat),0),2) as giatrixuat,
        round(max(products.giatrinhap) + ifnull(sum(child.giatrinhap),0),2) as giatrinhap,
              round(max(products.toncuoiky) + ifnull(sum(child.toncuoiky),0),2) as toncuoiky,
              round(max(products.giatricuoiky) + ifnull(sum(child.giatricuoiky),0),2) as giatricuoiky,
          json_object("KiemKho_nhap",round(max(products.KiemKho_nhap) + ifnull(sum(child.KiemKho_nhap),0),2),"NCC_nhap",round(max(products.NCC_nhap) + ifnull(sum(child.NCC_nhap),0),2),"Tra",round(max(products.Tra) + ifnull(sum(child.Tra),0),2) )nhap,
        json_object("KiemKho_xuat",round(max(products.KiemKho_xuat) + ifnull(sum(child.KiemKho_xuat),0),2) ,"NCC_xuat",round(max(products.NCC_xuat) + ifnull(sum(child.NCC_xuat),0),2),"Huy", round(max(products.Huy) + ifnull(sum(child.Huy),0),2),"Ban",round(max(products.Ban) + ifnull(sum(child.Ban),0),2) )xuat

      FROM      temp_list_input_output_inventory as products

          left join temp_list_input_output_child as child on child.parentId = products.id

          where products.parentId = 0
          group by products.id
      order by  max(products.toncuoiky) + ifnull(sum(child.toncuoiky),0)  desc
      limit ',in_pageIndex,',',in_pageSize,' '
  
    );


      PREPARE stmt1 FROM @SQLStatement1;
      EXECUTE stmt1;


    select
        round(sum(hangtondauky),2) as tondauky,
          round(sum(giatridauky),2) as giatridauky,
      round(sum(soluongnhap),2) as soluongnhap,
      round(sum(giatrinhap),2) as giatrinhap,
      round(sum(soluongxuat),2) as soluongxuat,
      round(sum(giatrixuat),2) as giatrixuat,
      round(sum(toncuoiky),2)  as toncuoiky,
          round(sum(giatricuoiky),2)  as giatricuoiky,
          round(sum(KiemKho_nhap),2)  as KiemKho_nhap,
          round(sum(NCC_nhap),2)  as NCC_nhap,
          round(sum(Tra),2)  as Tra,
          round(sum(KiemKho_xuat),2)  as  KiemKho_xuat,
          round(sum(NCC_xuat),2)  as NCC_xuat,
          round(sum(Huy),2)  as Huy,
          round(sum(Ban),2)  as Ban

    from (
    select *
    from temp_list_input_output_inventory
    union
      select *
      from temp_list_input_output_child

    )t;


  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_products_statistical_Input_ouput_inventory_v3` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_products_statistical_Input_ouput_inventory_v3`(
   in in_branchesId int,
    in in_dateFrom datetime,
      in in_dateTo datetime,
      in in_productsSearch varchar(45) ,
      in in_productGroupsId bigint, -- 0
      in in_brandsId bigint, -- 0
      in in_inventoryLevel int,-- 0: tất cả, -1: dưới mức tồn, 1: vượt mức tồn, 2: còn hàng trong kho, 3: hết hàng trong kho
      in in_productStatus int, -- -99:tất cả, 0: ngừng kinh doanh, 1: đang kinh doanh
      in in_pageIndex int,
      in in_pageSize int,
      out out_CountRows bigint
  )
BEGIN

  DROP TEMPORARY TABLE IF EXISTS temp_list_input_output_inventory;
  CREATE TEMPORARY TABLE temp_list_input_output_inventory(
    select id,
    productsName,
    productsCode,
    parentId,
    KiemKho_nhap_dauky - KiemKho_xuat_dauky + NCC_nhap_dauky - NCC_xuat_dauky - Huy_dauky + Tra_dauky - Ban_dauky as "hangtondauky",
    (
        KiemKho_nhap_dauky - KiemKho_xuat_dauky + NCC_nhap_dauky - NCC_xuat_dauky - Huy_dauky + Tra_dauky - Ban_dauky
    ) * importPrice as "giatridauky",
    KiemKho_nhap + NCC_nhap + Tra as "soluongnhap",
    KiemKho_xuat + NCC_xuat + Huy + Ban as "soluongxuat",
    (KiemKho_nhap + NCC_nhap + Tra) * importPrice as "giatrinhap",
    (KiemKho_xuat + NCC_xuat + Huy + Ban) * importPrice as "giatrixuat",
    (
        KiemKho_nhap_dauky - KiemKho_xuat_dauky + NCC_nhap_dauky - NCC_xuat_dauky - Huy_dauky + Tra_dauky - Ban_dauky
    ) + (KiemKho_nhap + NCC_nhap + Tra) -(KiemKho_xuat + NCC_xuat + Huy + Ban) as "toncuoiky",
    (
        (
            KiemKho_nhap_dauky - KiemKho_xuat_dauky + NCC_nhap_dauky - NCC_xuat_dauky - Huy_dauky + Tra_dauky - Ban_dauky
        ) + (KiemKho_nhap + NCC_nhap + Tra) -(KiemKho_xuat + NCC_xuat + Huy + Ban)
    ) * importPrice as "giatricuoiky",
    KiemKho_nhap,
    NCC_nhap,
    Tra,
    KiemKho_xuat,
    NCC_xuat,
    Huy,
    Ban
from (
        select t4.id,
            max(parentId) as parentId,
            max(productsName) as productsName,
            max(productsCode) as productsCode,
            max(t4.importPrice) as importPrice,
            max(minAmount) as minAmount,
            max(maxAmount) as maxAmount,
            --
            max(KiemKho_nhap) as KiemKho_nhap,
            max(KiemKho_nhap_dauky) as KiemKho_nhap_dauky,
            max(KiemKho_xuat) as KiemKho_xuat,
            max(KiemKho_xuat_dauky) as KiemKho_xuat_dauky,
            max(NCC_nhap) as NCC_nhap,
            max(NCC_nhap_dauky) as NCC_nhap_dauky,
            max(NCC_xuat) as NCC_xuat,
            max(NCC_xuat_dauky) as NCC_xuat_dauky,
            max(Huy) as Huy,
            max(Huy_dauky) as Huy_dauky,
            max(Tra) as Tra,
            max(Tra_dauky) as Tra_dauky,
            sum(
                case
                    when (
                        receipts.staticDay >= in_dateFrom
                        and receipts.staticDay < in_dateTo + INTERVAL 1 DAY
                    ) then receiptsProducts.amount
                    else 0
                end
            ) as 'Ban',
            sum(
                case
                    when receipts.staticDay < in_dateFrom then receiptsProducts.amount
                    else 0
                end
            ) as 'Ban_dauky'
        from (
                select t3.id,
                    max(parentId) as parentId,
                    max(productsName) as productsName,
                    max(productsCode) as productsCode,
                    max(t3.importPrice) as importPrice,
                    max(minAmount) as minAmount,
                    max(maxAmount) as maxAmount,
                    max(KiemKho_nhap) as KiemKho_nhap,
                    max(KiemKho_nhap_dauky) as KiemKho_nhap_dauky,
                    max(KiemKho_xuat) as KiemKho_xuat,
                    max(KiemKho_xuat_dauky) as KiemKho_xuat_dauky,
                    max(NCC_nhap) as NCC_nhap,
                    max(NCC_nhap_dauky) as NCC_nhap_dauky,
                    max(NCC_xuat) as NCC_xuat,
                    max(NCC_xuat_dauky) as NCC_xuat_dauky,
                    max(Huy) as Huy,
                    max(Huy_dauky) as Huy_dauky,
                    sum(
                        case
                            when (
                                productReturns.staticDay >= in_dateFrom
                                and productReturns.staticDay < in_dateTo + INTERVAL 1 DAY
                            ) then productReturnsProducts.amount
                            else 0
                        end
                    ) as 'Tra',
                    sum(
                        case
                            when productReturns.staticDay < in_dateFrom then productReturnsProducts.amount
                            else 0
                        end
                    ) as 'Tra_dauky'
                from (
                        select t2.id,
                            max(parentId) as parentId,
                            max(productsName) as productsName,
                            max(productsCode) as productsCode,
                            max(t2.importPrice) as importPrice,
                            max(minAmount) as minAmount,
                            max(maxAmount) as maxAmount,
                            max(KiemKho_nhap) as KiemKho_nhap,
                            max(KiemKho_nhap_dauky) as KiemKho_nhap_dauky,
                            max(KiemKho_xuat) as KiemKho_xuat,
                            max(KiemKho_xuat_dauky) as KiemKho_xuat_dauky,
                            max(NCC_nhap) as NCC_nhap,
                            max(NCC_nhap_dauky) as NCC_nhap_dauky,
                            max(NCC_xuat) as NCC_xuat,
                            max(NCC_xuat_dauky) as NCC_xuat_dauky,
                            sum(
                                case
                                    when (
                                        productCancels.staticDay >= in_dateFrom
                                        and productCancels.staticDay < in_dateTo + INTERVAL 1 DAY
                                    ) then productCancelsProducts.amount
                                    else 0
                                end
                            ) as 'Huy',
                            sum(
                                case
                                    when productCancels.staticDay < in_dateFrom then productCancelsProducts.amount
                                    else 0
                                end
                            ) as 'Huy_dauky'
                        from (
                                select t1.id,
                                    max(parentId) as parentId,
                                    max(productsName) as productsName,
                                    max(productsCode) as productsCode,
                                    max(t1.importPrice) as importPrice,
                                    max(minAmount) as minAmount,
                                    max(maxAmount) as maxAmount,
                                    max(KiemKho_nhap) as KiemKho_nhap,
                                    max(KiemKho_nhap_dauky) as KiemKho_nhap_dauky,
                                    max(KiemKho_xuat) as KiemKho_xuat,
                                    max(KiemKho_xuat_dauky) as KiemKho_xuat_dauky,
                                        max(NCC_xuat_dauky) as NCC_xuat_dauky,
                                    max(NCC_xuat) as NCC_xuat,
                                    sum(
                                        case
                                            when (
                                          warehouseIn.staticDay >= in_dateFrom
                                                and warehouseIn.staticDay < in_dateTo + INTERVAL 1 DAY
                                            ) then warehouseInProducts.amount
                                            else 0
                                        end
                                    ) as 'NCC_nhap',
                                    sum(
                                        case
                                            when warehouseIn.staticDay < in_dateFrom then warehouseInProducts.amount
                                            else 0
                                        end
                                    ) as 'NCC_nhap_dauky'
                                from (
                                 --
                                 select t0.id,
										max(parentId) as parentId,
										max(productsName) as productsName,
										max(productsCode) as productsCode,
										max(t0.importPrice) as importPrice,
										max(minAmount) as minAmount,
										max(maxAmount) as maxAmount,
										max(KiemKho_nhap) as KiemKho_nhap,
										max(KiemKho_nhap_dauky) as KiemKho_nhap_dauky,
										max(KiemKho_xuat) as KiemKho_xuat,
										max(KiemKho_xuat_dauky) as KiemKho_xuat_dauky,
										sum(
											case
												when (
													   warehouseOut.staticDay >= in_dateFrom
													and warehouseOut.staticDay < in_dateTo + INTERVAL 1 DAY
												) then warehouseOutProducts.amount
												else 0
											end
										) as 'NCC_xuat',
										sum(
											case
												when 
                                                   warehouseOut.staticDay < in_dateFrom then warehouseOutProducts.amount
												else 0
											end
										) as 'NCC_xuat_dauky' 
                                    from
												(select products.id,
													products.parentId,
													products.productsName,
													products.productsCode,
													ifnull(productsTotalInfo.importPrice,0) as importPrice,
													minAmount,
													maxAmount,
													sum(
														(
															case
																when warehouseCheckProducts.changeNumber > 0
																and (
																	warehouseCheck.staticDay >= in_dateFrom
																	and warehouseCheck.staticDay < in_dateTo + INTERVAL 1 DAY
																) then warehouseCheckProducts.changeNumber
																else 0
															end
														)
													) as 'KiemKho_nhap',
													sum(
														(
															case
																when warehouseCheckProducts.changeNumber > 0
																and warehouseCheck.staticDay < in_dateFrom then warehouseCheckProducts.changeNumber
																else 0
															end
														)
													) as 'KiemKho_nhap_dauky',
													sum(
														(
															case
																when (
																	warehouseCheckProducts.changeNumber < 0
																	and warehouseCheck.staticDay >= in_dateFrom
																	and warehouseCheck.staticDay < in_dateTo + INTERVAL 1 DAY
																) then warehouseCheckProducts.changeNumber * -1
																else 0
															end
														)
													) as 'KiemKho_xuat',
													sum(
														(
															case
																when warehouseCheckProducts.changeNumber < 0
																and warehouseCheck.staticDay < in_dateFrom then warehouseCheckProducts.changeNumber * - 1
																else 0
															end
														)
													) as 'KiemKho_xuat_dauky'
												from products
                                                    left join productsTotalInfo on productsTotalInfo.productsId = products.id
                                                               and productsTotalInfo.branchesId = in_branchesId
													left join warehouseCheckProducts on warehouseCheckProducts.productsId = products.id
													left join warehouseCheck on warehouseCheck.id = warehouseCheckProducts.warehouseCheckId
													and warehouseCheck.status = 1
													and warehouseCheck.branchesId = in_branchesId
												where parentId = 0
													and (
														lower(products.productsName) like concat(
															"%",
															CONVERT(lower(in_productsSearch), BINARY),
															"%"
														)
														or lower(products.productsCode) like concat(
															"%",
															CONVERT(lower(in_productsSearch), BINARY),
															"%"
														)
													)
													and (
														in_productGroupsId = 0
														or products.productGroupsId = in_productGroupsId
													)
													and (
														in_brandsId = 0
														or products.brandsId = in_brandsId
													)
													and (products.status = 1)
												group by products.id
                                                )t0
											left join warehouseOutProducts on warehouseOutProducts.productsId = t0.id
											left join warehouseOut on warehouseOut.id = warehouseOutProducts.warehouseOutId
                                              and warehouseOut.status = 1
                                              and warehouseOut.branchesId = in_branchesId
                                        -- 
                                    ) t1
                                    left join warehouseInProducts on warehouseInProducts.productsId = t1.id
                                    left join warehouseIn on warehouseIn.id = warehouseInProducts.warehouseInId
                                    and warehouseIn.status = 1
                                    and warehouseIn.branchesId = in_branchesId
                                group by t1.id
                            ) t2
                            left join productCancelsProducts on productCancelsProducts.productsId = t2.id
                            left join productCancels on productCancels.id = productCancelsProducts.productCancelsId 
                                    and productCancels.status = 1
                                    and productCancels.branchesId = in_branchesId
                        group by t2.id
                    ) t3
                    left join productReturnsProducts on productReturnsProducts.productsId = t3.id
                    left join productReturns on productReturns.id = productReturnsProducts.productReturnsId
                                    and productReturns.status = 1
                                    and productReturns.branchesId = in_branchesId
                group by t3.id
            ) t4
            left join receiptsProducts on receiptsProducts.productsId = t4.id
            left join receipts on receipts.id = receiptsProducts.receiptsId
									and receipts.status = 1
                                    and receipts.branchesId = in_branchesId
        group by t4.id
    ) t5
where (
        in_inventoryLevel = 0
        or (
            in_inventoryLevel = 1
            and (
                (
                    KiemKho_nhap_dauky - KiemKho_xuat_dauky + NCC_nhap_dauky - NCC_xuat_dauky - Huy_dauky + Tra_dauky - Ban_dauky
                ) + (KiemKho_nhap + NCC_nhap + Tra) -(KiemKho_xuat + NCC_xuat + Huy + Ban) < minAmount
            )
        )
        or (
            in_inventoryLevel = 2
            and (
                (
                    KiemKho_nhap_dauky - KiemKho_xuat_dauky + NCC_nhap_dauky - NCC_xuat_dauky - Huy_dauky + Tra_dauky - Ban_dauky
                ) + (KiemKho_nhap + NCC_nhap + Tra) -(KiemKho_xuat + NCC_xuat + Huy + Ban) > maxAmount
            )
        )
        or (
            in_inventoryLevel = 3
            and (
                (
                    KiemKho_nhap_dauky - KiemKho_xuat_dauky + NCC_nhap_dauky - NCC_xuat_dauky - Huy_dauky + Tra_dauky - Ban_dauky
                ) + (KiemKho_nhap + NCC_nhap + Tra) -(KiemKho_xuat + NCC_xuat + Huy + Ban) > 0
            )
        )
        or (
            in_inventoryLevel = 4
            and (
                (
                    KiemKho_nhap_dauky - KiemKho_xuat_dauky + NCC_nhap_dauky - NCC_xuat_dauky - Huy_dauky + Tra_dauky - Ban_dauky
                ) + (KiemKho_nhap + NCC_nhap + Tra) -(KiemKho_xuat + NCC_xuat + Huy + Ban) <= 0
            )
        )
    )

    );



-- child  
  DROP TEMPORARY TABLE IF EXISTS temp_list_input_output_child;
  CREATE TEMPORARY TABLE temp_list_input_output_child(
select id,
    productsName,
    productsCode,
    parentId,
    (
        KiemKho_nhap_dauky - KiemKho_xuat_dauky + NCC_nhap_dauky - NCC_xuat_dauky - Huy_dauky + Tra_dauky - Ban_dauky
    ) * exchangeValue as "hangtondauky",
    (
        KiemKho_nhap_dauky - KiemKho_xuat_dauky + NCC_nhap_dauky - NCC_xuat_dauky - Huy_dauky + Tra_dauky - Ban_dauky
    ) *exchangeValue * importPrice as "giatridauky",
    (KiemKho_nhap + NCC_nhap + Tra) * exchangeValue as "soluongnhap",
    (KiemKho_xuat + NCC_xuat + Huy + Ban) * exchangeValue as "soluongxuat",
    (KiemKho_nhap + NCC_nhap + Tra) *exchangeValue * importPrice as "giatrinhap",
    (KiemKho_xuat + NCC_xuat + Huy + Ban)*exchangeValue * importPrice as "giatrixuat",
    (
        (
            KiemKho_nhap_dauky - KiemKho_xuat_dauky + NCC_nhap_dauky - NCC_xuat_dauky - Huy_dauky + Tra_dauky - Ban_dauky
        ) + (KiemKho_nhap + NCC_nhap + Tra) -(KiemKho_xuat + NCC_xuat + Huy + Ban)
    ) * exchangeValue as "toncuoiky",
    (
        (
            KiemKho_nhap_dauky - KiemKho_xuat_dauky + NCC_nhap_dauky - NCC_xuat_dauky - Huy_dauky + Tra_dauky - Ban_dauky
        ) + (KiemKho_nhap + NCC_nhap + Tra) -(KiemKho_xuat + NCC_xuat + Huy + Ban)
    ) *exchangeValue * importPrice as "giatricuoiky",
    KiemKho_nhap * exchangeValue as KiemKho_nhap,
    NCC_nhap * exchangeValue as NCC_nhap,
    Tra * exchangeValue as Tra,
    KiemKho_xuat * exchangeValue as KiemKho_xuat,
    NCC_xuat * exchangeValue as NCC_xuat,
    Huy * exchangeValue as Huy,
    Ban * exchangeValue as Ban
from (
        select t4.id,
            max(t4.parentId) as parentId,
            max(productsName) as productsName,
            max(productsCode) as productsCode,
            max(t4.importPrice) as importPrice,
            max(minAmount) as minAmount,
            max(maxAmount) as maxAmount,
            max(unitsId) as unitsId,
            max(exchangeValue) as exchangeValue,
            max(KiemKho_nhap) as KiemKho_nhap,
            max(KiemKho_nhap_dauky) as KiemKho_nhap_dauky,
            max(KiemKho_xuat) as KiemKho_xuat,
            max(KiemKho_xuat_dauky) as KiemKho_xuat_dauky,
            max(NCC_nhap) as NCC_nhap,
            max(NCC_nhap_dauky) as NCC_nhap_dauky,
            max(NCC_xuat) as NCC_xuat,
            max(NCC_xuat_dauky) as NCC_xuat_dauky,
            max(Huy) as Huy,
            max(Huy_dauky) as Huy_dauky,
            max(Tra) as Tra,
            max(Tra_dauky) as Tra_dauky,
            sum(
                case
                    when (
                        receipts.staticDay >= in_dateFrom
                        and receipts.staticDay < in_dateTo + INTERVAL 1 DAY
                    ) then receiptsProducts.amount
                    else 0
                end
            ) as 'Ban',
            sum(
                case
                    when receipts.staticDay < in_dateFrom then receiptsProducts.amount
                    else 0
                end
            ) as 'Ban_dauky'
        from (
                select t3.id,
                    max(parentId) as parentId,
                    max(productsName) as productsName,
                    max(productsCode) as productsCode,
                    max(t3.importPrice) as importPrice,
                    max(minAmount) as minAmount,
                    max(maxAmount) as maxAmount,
                    max(unitsId) as unitsId,
                    max(KiemKho_nhap) as KiemKho_nhap,
                    max(KiemKho_nhap_dauky) as KiemKho_nhap_dauky,
                    max(KiemKho_xuat) as KiemKho_xuat,
                    max(KiemKho_xuat_dauky) as KiemKho_xuat_dauky,
                    max(NCC_nhap) as NCC_nhap,
                    max(NCC_nhap_dauky) as NCC_nhap_dauky,
                    max(NCC_xuat) as NCC_xuat,
                    max(NCC_xuat_dauky) as NCC_xuat_dauky,
                    max(Huy) as Huy,
                    max(Huy_dauky) as Huy_dauky,
                    sum(
                        case
                            when (
                                productReturns.staticDay >= in_dateFrom
                                and productReturns.staticDay < in_dateTo + INTERVAL 1 DAY
                            ) then productReturnsProducts.amount
                            else 0
                        end
                    ) as 'Tra',
                    sum(
                        case
                            when productReturns.staticDay < in_dateFrom then productReturnsProducts.amount
                            else 0
                        end
                    ) as 'Tra_dauky'
                from (
                        select t2.id,
                            max(parentId) as parentId,
                            max(productsName) as productsName,
                            max(productsCode) as productsCode,
                            max(t2.importPrice) as importPrice,
                            max(minAmount) as minAmount,
                            max(maxAmount) as maxAmount,
                            max(unitsId) as unitsId,
                            max(KiemKho_nhap) as KiemKho_nhap,
                            max(KiemKho_nhap_dauky) as KiemKho_nhap_dauky,
                            max(KiemKho_xuat) as KiemKho_xuat,
                            max(KiemKho_xuat_dauky) as KiemKho_xuat_dauky,
                            max(NCC_nhap) as NCC_nhap,
                            max(NCC_nhap_dauky) as NCC_nhap_dauky,
                            max(NCC_xuat) as NCC_xuat,
                            max(NCC_xuat_dauky) as NCC_xuat_dauky,
                            sum(
                                case
                                    when (
                                        productCancels.staticDay >= in_dateFrom
                                        and productCancels.staticDay < in_dateTo + INTERVAL 1 DAY
                                    ) then productCancelsProducts.amount
                                    else 0
                                end
                            ) as 'Huy',
                            sum(
                                case
                                    when productCancels.staticDay < in_dateFrom then productCancelsProducts.amount
                                    else 0
                                end
                            ) as 'Huy_dauky'
                        from (
                                select t1.id,
                                    max(parentId) as parentId,
                                    max(productsName) as productsName,
                                    max(productsCode) as productsCode,
                                    max(t1.importPrice) as importPrice,
                                    max(minAmount) as minAmount,
                                    max(maxAmount) as maxAmount,
                                    max(unitsId) as unitsId,
                                    max(KiemKho_nhap) as KiemKho_nhap,
                                    max(KiemKho_nhap_dauky) as KiemKho_nhap_dauky,
                                    max(KiemKho_xuat) as KiemKho_xuat,
                                    max(KiemKho_xuat_dauky) as KiemKho_xuat_dauky,
                                    max(NCC_xuat) as NCC_xuat,
                                    max(NCC_xuat_dauky) as NCC_xuat_dauky,
                                    sum(
                                        case
                                            when (
                                                warehouseIn.staticDay >= in_dateFrom
                                                and warehouseIn.staticDay < in_dateTo + INTERVAL 1 DAY
                                            ) then warehouseInProducts.amount
                                            else 0
                                        end
                                    ) as 'NCC_nhap',
                                    sum(
                                        case
                                            when warehouseIn.staticDay < in_dateFrom then warehouseInProducts.amount
                                            else 0
                                        end
                                    ) as 'NCC_nhap_dauky'
                                from (
                                        -- 
                                        select t0.id,
                                            max(parentId) as parentId,
                                            max(productsName) as productsName,
                                            max(productsCode) as productsCode,
                                            max(t0.importPrice) as importPrice,
                                            max(minAmount) as minAmount,
                                            max(maxAmount) as maxAmount,
                                            max(unitsId) as unitsId,
                                            max(KiemKho_nhap) as KiemKho_nhap,
                                            max(KiemKho_nhap_dauky) as KiemKho_nhap_dauky,
                                            max(KiemKho_xuat) as KiemKho_xuat,
                                            max(KiemKho_xuat_dauky) as KiemKho_xuat_dauky,
                                            sum(
                                                case
                                                    when (
                                                        warehouseOut.staticDay >= in_dateFrom
                                                        and warehouseOut.staticDay < in_dateTo + INTERVAL 1 DAY
                                                    ) then warehouseOutProducts.amount
                                                    else 0
                                                end
                                            ) as 'NCC_xuat',
                                            sum(
                                                case
                                                    when warehouseOut.staticDay < in_dateFrom then warehouseOutProducts.amount
                                                    else 0
                                                end
                                            ) as 'NCC_xuat_dauky'
                                        from (
                                                select products.id,
                                                    products.parentId,
                                                    products.productsName,
                                                    products.productsCode,
                                                    ifnull(productsTotalInfo.importPrice, 0) as  importPrice,
                                                    products.minAmount,
                                                    products.maxAmount,
                                                    products.unitsId,
                                                    sum(
                                                        (
                                                            case
                                                                when warehouseCheckProducts.changeNumber > 0
                                                                and (
                                                                    warehouseCheck.staticDay >= in_dateFrom
                                                                    and warehouseCheck.staticDay < in_dateTo + INTERVAL 1 DAY
                                                                ) then warehouseCheckProducts.changeNumber
                                                                else 0
                                                            end
                                                        )
                                                    ) as 'KiemKho_nhap',
                                                    sum(
                                                        (
                                                            case
                                                                when warehouseCheckProducts.changeNumber > 0
                                                                and warehouseCheck.staticDay < in_dateFrom then warehouseCheckProducts.changeNumber
                                                                else 0
                                                            end
                                                        )
                                                    ) as 'KiemKho_nhap_dauky',
                                                    sum(
                                                        (
                                                            case
                                                                when (
                                                                    warehouseCheckProducts.changeNumber < 0
                                                                    and warehouseCheck.staticDay >= in_dateFrom
                                                                    and warehouseCheck.staticDay < in_dateTo + INTERVAL 1 DAY
                                                                ) then warehouseCheckProducts.changeNumber * -1
                                                                else 0
                                                            end
                                                        )
                                                    ) as 'KiemKho_xuat',
                                                    sum(
                                                        (
                                                            case
                                                                when warehouseCheckProducts.changeNumber < 0
                                                                and warehouseCheck.staticDay < in_dateFrom then warehouseCheckProducts.changeNumber * - 1
                                                                else 0
                                                            end
                                                        )
                                                    ) as 'KiemKho_xuat_dauky'
                                                from products as products
                                                 
                                                    left join warehouseCheckProducts on warehouseCheckProducts.productsId = products.id
                                                    left join warehouseCheck on warehouseCheck.id = warehouseCheckProducts.warehouseCheckId
                                                    and warehouseCheck.status = 1
                                                    and warehouseCheck.branchesId = in_branchesId
                                                    inner join products as parent on products.parentId = parent.id
													left join productsTotalInfo on productsTotalInfo.productsId = parent.id
                                                    and productsTotalInfo.branchesId = in_branchesId
                                                where products.parentId > 0
                                                    and (
                                                        lower(parent.productsName) like concat(
                                                            "%",
                                                            CONVERT(lower(in_productsSearch), BINARY),
                                                            "%"
                                                        )
                                                        or lower(parent.productsCode) like concat(
                                                            "%",
                                                            CONVERT(lower(in_productsSearch), BINARY),
                                                            "%"
                                                        )
                                                    )
                                                    and (
                                                        in_productGroupsId = 0
                                                        or products.productGroupsId = in_productGroupsId
                                                    )
                                                    and (
                                                        in_brandsId = 0
                                                        or products.brandsId = in_brandsId
                                                    )
                                                    and (products.status = 1)
                                                group by products.id
                                            ) t0
                                            left join warehouseOutProducts on warehouseOutProducts.productsId = t0.id
                                            left join warehouseOut on warehouseOut.id = warehouseOutProducts.warehouseOutId
                                            and warehouseOut.status = 1
                                            and warehouseOut.branchesId = in_branchesId -- 
                                    ) t1
                                    left join warehouseInProducts on warehouseInProducts.productsId = t1.id
                                    left join warehouseIn on warehouseIn.id = warehouseInProducts.warehouseInId
                                    and warehouseIn.status = 1
                                    and warehouseIn.branchesId = in_branchesId
                                group by t1.id
                            ) t2
                            left join productCancelsProducts on productCancelsProducts.productsId = t2.id
                            left join productCancels on productCancels.id = productCancelsProducts.productCancelsId
                            and productCancels.status = 1
                            and productCancels.branchesId = in_branchesId
                        group by t2.id
                    ) t3
                    left join productReturnsProducts on productReturnsProducts.productsId = t3.id
                    left join productReturns on productReturns.id = productReturnsProducts.productReturnsId
                    and productReturns.status = 1
                    and productReturns.branchesId = in_branchesId
                group by t3.id
            ) t4
            left join receiptsProducts on receiptsProducts.productsId = t4.id
            left join receipts on receipts.id = receiptsProducts.receiptsId
            and receipts.status = 1
            and receipts.branchesId = in_branchesId
            inner join units on units.id = t4.unitsId
        group by t4.id
    ) t5

    );
    
    set out_CountRows =  (select count(*) from temp_list_input_output_inventory);

    set @SQLStatement1=concat('
          select  products.id, max(products.productsName) as productsName,max(products.productsCode) as productsCode,

              round(max(products.hangtondauky) + ifnull(sum(child.hangtondauky),0),2) as  hangtondauky,
              round(max(products.giatridauky) + ifnull(sum(child.giatridauky),0) ,2) as giatridauky,
              round(max(products.soluongnhap) + ifnull(sum(child.soluongnhap),0) ,2) as soluongnhap,
              round(max(products.soluongxuat) + ifnull(sum(child.soluongxuat),0),2) as soluongxuat,
        round(max(products.giatrixuat) + ifnull(sum(child.giatrixuat),0),2) as giatrixuat,
        round(max(products.giatrinhap) + ifnull(sum(child.giatrinhap),0),2) as giatrinhap,
              round(max(products.toncuoiky) + ifnull(sum(child.toncuoiky),0),2) as toncuoiky,
              round(max(products.giatricuoiky) + ifnull(sum(child.giatricuoiky),0),2) as giatricuoiky,
          json_object("KiemKho_nhap",round(max(products.KiemKho_nhap) + ifnull(sum(child.KiemKho_nhap),0),2),"NCC_nhap",round(max(products.NCC_nhap) + ifnull(sum(child.NCC_nhap),0),2),"Tra",round(max(products.Tra) + ifnull(sum(child.Tra),0),2) )nhap,
        json_object("KiemKho_xuat",round(max(products.KiemKho_xuat) + ifnull(sum(child.KiemKho_xuat),0),2) ,"NCC_xuat",round(max(products.NCC_xuat) + ifnull(sum(child.NCC_xuat),0),2),"Huy", round(max(products.Huy) + ifnull(sum(child.Huy),0),2),"Ban",round(max(products.Ban) + ifnull(sum(child.Ban),0),2) )xuat

      FROM      temp_list_input_output_inventory as products

          left join temp_list_input_output_child as child on child.parentId = products.id

          where products.parentId = 0
          group by products.id
      order by  max(products.toncuoiky) + ifnull(sum(child.toncuoiky),0)  desc
      limit ',in_pageIndex,',',in_pageSize,' '
  
    );


      PREPARE stmt1 FROM @SQLStatement1;
      EXECUTE stmt1;


    select
        round(sum(hangtondauky),2) as tondauky,
          round(sum(giatridauky),2) as giatridauky,
      round(sum(soluongnhap),2) as soluongnhap,
      round(sum(giatrinhap),2) as giatrinhap,
      round(sum(soluongxuat),2) as soluongxuat,
      round(sum(giatrixuat),2) as giatrixuat,
      round(sum(toncuoiky),2)  as toncuoiky,
          round(sum(giatricuoiky),2)  as giatricuoiky,
          round(sum(KiemKho_nhap),2)  as KiemKho_nhap,
          round(sum(NCC_nhap),2)  as NCC_nhap,
          round(sum(Tra),2)  as Tra,
          round(sum(KiemKho_xuat),2)  as  KiemKho_xuat,
          round(sum(NCC_xuat),2)  as NCC_xuat,
          round(sum(Huy),2)  as Huy,
          round(sum(Ban),2)  as Ban

    from (
    select *
    from temp_list_input_output_inventory
    union
      select *
      from temp_list_input_output_child

    )t;


  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_products_statistical_products_sell` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_products_statistical_products_sell`(
  in in_branchesId int,
	in in_dateFrom date,
    in in_dateTo date,
    in in_productsSearch varchar(45) COLLATE utf8mb3_unicode_ci,
	in in_pageIndex int, 
    in in_pageSize int,
    out out_CountRows bigint,
    out out_soluongban bigint,
    out out_doanhthuban double,
    out out_soluongtra bigint,
    out out_giatritra double,
    out out_doanhthuthuan double
)
BEGIN

-- call quanlybanhang.sp_products_statistical_products_sell('2021-12-31', '2024-12-31', 'k01', 0, 50);

DROP TEMPORARY TABLE IF EXISTS temp_list_products_sell;
 CREATE TEMPORARY TABLE temp_list_products_sell(
	select products.id,products.productsCode,products.productsName,
    JSON_UNQUOTE(JSON_EXTRACT(fn_product_calculator_byProductsId_doanhthuban(in_branchesId,products.id,in_dateFrom,in_dateTo), "$.soluongban"))soluongban,
	JSON_UNQUOTE(JSON_EXTRACT(fn_product_calculator_byProductsId_doanhthuban(in_branchesId,products.id,in_dateFrom,in_dateTo), "$.doanhthuban"))doanhthuban,
    fn_productReturns_calculator_byProductsId_trahang(in_branchesId,products.id,in_dateFrom,in_dateTo) as trahang
	from products
	where (in_productsSearch='' or
              lower(products.productsName) like  concat("%",CONVERT(lower(in_productsSearch), BINARY),"%") 
          or  
            lower(products.productsCode) like  concat("%",CONVERT(lower(in_productsSearch), BINARY),"%") 
          )

	and products.status = 1
	group by products.id
);

set out_CountRows=(select count(*) from temp_list_products_sell);
set out_soluongban=(select sum(soluongban) from temp_list_products_sell);
set out_doanhthuban =(select sum(doanhthuban)  from temp_list_products_sell);
set out_soluongtra =(select sum(ifnull(JSON_UNQUOTE(JSON_EXTRACT(trahang, "$.soluongtra")),0)) from temp_list_products_sell);
set out_giatritra =(select sum(ifnull(JSON_UNQUOTE(JSON_EXTRACT(trahang, "$.giatritra")) ,0)) from temp_list_products_sell);
set out_doanhthuthuan =(select sum(doanhthuban-ifnull(JSON_UNQUOTE(JSON_EXTRACT(trahang, "$.giatritra")) ,0))  from temp_list_products_sell);

select id,productsCode,productsName,
	soluongban,doanhthuban
    ,ifnull(
    JSON_UNQUOTE(JSON_EXTRACT(trahang, "$.soluongtra"))
     ,0) 
    as soluongtra
    ,if(ifnull(JSON_UNQUOTE(JSON_EXTRACT(trahang, "$.giatritra")) ,0)>0
			,-ifnull(JSON_UNQUOTE(JSON_EXTRACT(trahang, "$.giatritra")) ,0)
			,ifnull(JSON_UNQUOTE(JSON_EXTRACT(trahang, "$.giatritra")) ,0)) as giatritra,
    (doanhthuban-ifnull(JSON_UNQUOTE(JSON_EXTRACT(trahang, "$.giatritra")) ,0))as doanhthuthuan
 from temp_list_products_sell
order by (doanhthuban-ifnull(JSON_UNQUOTE(JSON_EXTRACT(trahang, "$.giatritra")) ,0)) desc
limit in_pageIndex,in_pageSize
;

-- top 10 sản phẩm danh thu cao nhất
select id,productsCode,productsName,
    (doanhthuban-ifnull(JSON_UNQUOTE(JSON_EXTRACT(trahang, "$.giatritra")) ,0))as doanhthu 
from temp_list_products_sell
order by (doanhthuban-ifnull(JSON_UNQUOTE(JSON_EXTRACT(trahang, "$.giatritra")) ,0)) desc
limit 10
;

-- top 10 sản phâm bán nhiều nhất
select id,productsCode,productsName,
    (soluongban-ifnull(JSON_UNQUOTE(JSON_EXTRACT(trahang, "$.soluongtra")) ,0))as soluong
from temp_list_products_sell
order by (soluongban-ifnull(JSON_UNQUOTE(JSON_EXTRACT(trahang, "$.soluongtra")) ,0)) desc
limit 10
;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_products_statistical_products_sell_v2` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_products_statistical_products_sell_v2`(
  in in_branchesId int,
	in in_dateFrom date,
    in in_dateTo date,
    in in_productsSearch varchar(45) COLLATE utf8mb3_unicode_ci,
    in in_productGroupsId varchar(200),
	in in_brandsId varchar(200),
	in in_pageIndex int, 
    in in_pageSize int,
    out out_CountRows bigint,
    out out_soluongban bigint,
    out out_doanhthuban double,
    out out_soluongtra bigint,
    out out_giatritra double,
    out out_doanhthuthuan double
)
BEGIN

-- call quanlybanhang.sp_products_statistical_products_sell('2021-12-31', '2024-12-31', 'k01', 0, 50);
   
   DROP TEMPORARY TABLE IF EXISTS temp_list_products_sell;
	SET @sql4 = concat('
         CREATE TEMPORARY TABLE temp_list_products_sell(
			select products.id,products.productsCode,products.productsName,
			JSON_UNQUOTE(JSON_EXTRACT(fn_product_calculator_byProductsId_doanhthuban(',in_branchesId,',products.id,"',in_dateFrom,'","',in_dateTo,'"), "$.soluongban"))soluongban,
			JSON_UNQUOTE(JSON_EXTRACT(fn_product_calculator_byProductsId_doanhthuban(',in_branchesId,',products.id,"',in_dateFrom,'","',in_dateTo,'"), "$.doanhthuban"))doanhthuban,
			fn_productReturns_calculator_byProductsId_trahang(',in_branchesId,',products.id,"',in_dateFrom,'","',in_dateTo,'") as trahang
			from products
			where  products.status = 1
            '
            ,
             if(in_productGroupsId  <>  '' , concat(' and( products.productGroupsId in ',in_productGroupsId,' )'),''),
			 if(in_brandsId  <>  '' , concat(' and( products.brandsId in ',in_brandsId,' )'),''),
             if(in_productsSearch <> '',
				  concat(' and (
							   lower(products.productsName) like  concat("%",CONVERT(lower("',in_productsSearch,'"), BINARY),"%") 
							or lower(products.productsCode) like  concat("%",CONVERT(lower("',in_productsSearch,'"), BINARY),"%") 
							)
						 '),''
			 
			 ),
            
            '

			
			group by products.id
		);
        
        
        ' 
	 );		
		   
	PREPARE stmt4 FROM @sql4;
	EXECUTE stmt4;



set out_CountRows=(select count(*) from temp_list_products_sell);
set out_soluongban=(select sum(soluongban) from temp_list_products_sell);
set out_doanhthuban =(select sum(doanhthuban)  from temp_list_products_sell);
set out_soluongtra =(select sum(ifnull(JSON_UNQUOTE(JSON_EXTRACT(trahang, "$.soluongtra")),0)) from temp_list_products_sell);
set out_giatritra =(select sum(ifnull(JSON_UNQUOTE(JSON_EXTRACT(trahang, "$.giatritra")) ,0)) from temp_list_products_sell);
set out_doanhthuthuan =(select sum(doanhthuban-ifnull(JSON_UNQUOTE(JSON_EXTRACT(trahang, "$.giatritra")) ,0))  from temp_list_products_sell);

select id,productsCode,productsName,
	soluongban,doanhthuban
    ,ifnull(
    JSON_UNQUOTE(JSON_EXTRACT(trahang, "$.soluongtra"))
     ,0) 
    as soluongtra
    ,if(ifnull(JSON_UNQUOTE(JSON_EXTRACT(trahang, "$.giatritra")) ,0)>0
			,-ifnull(JSON_UNQUOTE(JSON_EXTRACT(trahang, "$.giatritra")) ,0)
			,ifnull(JSON_UNQUOTE(JSON_EXTRACT(trahang, "$.giatritra")) ,0)) as giatritra,
    (doanhthuban-ifnull(JSON_UNQUOTE(JSON_EXTRACT(trahang, "$.giatritra")) ,0))as doanhthuthuan
 from temp_list_products_sell
order by (doanhthuban-ifnull(JSON_UNQUOTE(JSON_EXTRACT(trahang, "$.giatritra")) ,0)) desc
limit in_pageIndex,in_pageSize
;

-- top 10 sản phẩm danh thu cao nhất
select id,productsCode,productsName,
    (doanhthuban-ifnull(JSON_UNQUOTE(JSON_EXTRACT(trahang, "$.giatritra")) ,0))as doanhthu 
from temp_list_products_sell
order by (doanhthuban-ifnull(JSON_UNQUOTE(JSON_EXTRACT(trahang, "$.giatritra")) ,0)) desc
limit 10
;

-- top 10 sản phâm bán nhiều nhất
select id,productsCode,productsName,
    (soluongban-ifnull(JSON_UNQUOTE(JSON_EXTRACT(trahang, "$.soluongtra")) ,0))as soluong
from temp_list_products_sell
order by (soluongban-ifnull(JSON_UNQUOTE(JSON_EXTRACT(trahang, "$.soluongtra")) ,0)) desc
limit 10
;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_products_statistical_suppliers_debit` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_products_statistical_suppliers_debit`(
	 in in_branchesId int,
    in in_dateFrom date,
    in in_dateTo date,
    in in_customersNameOrCustomersCode varchar(200) COLLATE utf8mb3_unicode_ci ,
	in in_pageIndex int, 
    in in_pageSize int,
    out out_CountRows bigint,
	out out_nodauky double,
    out out_ghino double,
    out out_ghico double,
    out out_ghicuoiky double
)
BEGIN

-- call quanlybanhang.sp_products_statistical_suppliers_debit('2021-12-31', '2024-12-31', 'k01', 0, 20);

DROP TEMPORARY TABLE IF EXISTS temp_list_customers_debit;
 CREATE TEMPORARY TABLE temp_list_customers_debit(
	select customers.id,customers.customersCode,customers.customersName,
	((sum(
		case when (receipts.staticDay < in_dateFrom 
						
					)
		then receipts.totalMoney 
		else 0 end
	)) 
   - ( select ifnull(sum(totalMoney),0) 
        from bills
        where  
         bills.staticDay < in_dateFrom
           and bills.branchesId = in_branchesId
		 and bills.status=1
         and bills.planningStatus = 1
		 and bills.customersId=customers.id
		)
        
    -( select ifnull(sum(totalMoney),0) 
        from productReturns
        where  
		  productReturns.staticDay < in_dateFrom
          and productReturns.branchesId = in_branchesId
		and productReturns.status=1
		and productReturns.customersId=customers.id  
        )
        
     -(select ifnull(sum(totalMoney),0) 
        from warehouseIn
        where  
		  warehouseIn.staticDay < in_dateFrom
          and warehouseIn.branchesId = in_branchesId
		and warehouseIn.status=1
		and warehouseIn.customersId=customers.id  
        )   
	   + (select ifnull(sum(totalMoney),0) 
        from warehouseOut
        where  
		  warehouseOut.staticDay < in_dateFrom
          and warehouseOut.branchesId = in_branchesId
		and warehouseOut.status=1
		and warehouseOut.customersId=customers.id  
        )   
	)
    nodauky,
    
	ifnull(sum(
		case when (receipts.staticDay >= in_dateFrom and receipts.staticDay < in_dateTo + INTERVAL 1 DAY
			
					)
		then receipts.totalMoney
		else 0 end
	),0) 
     - ifnull(fn_bills_chi_calculator_byCustomersId(in_branchesId,customers.id,in_dateFrom,in_dateTo) ,0
     -  (select ifnull(sum(totalMoney),0) 
        from warehouseIn
        where  
		  warehouseIn.staticDay >= in_dateFrom
		and warehouseIn.branchesId = in_branchesId

		and warehouseIn.staticDay < in_dateTo + INTERVAL 1 DAY
		and warehouseIn.status=1
		and warehouseIn.customersId=customers.id  
        )   
       
        +  (select ifnull(sum(totalMoney),0) 
        from warehouseOut
        where  
		  warehouseOut.staticDay >= in_dateFrom
		and warehouseOut.branchesId = in_branchesId

		and warehouseOut.staticDay < in_dateTo + INTERVAL 1 DAY
		and warehouseOut.status=1
		and warehouseOut.customersId=customers.id  
        ) 
     ) as ghino,

	(fn_bills_calculator_byCustomersId(in_branchesId,customers.id,in_dateFrom,in_dateTo)
    + fn_productReturns_calculator_byCustomersId(in_branchesId,customers.id,in_dateFrom,in_dateTo))
    "ghico"
    
    from customers
		left join receipts on receipts.customersId = customers.id
        and receipts.status=1
          and receipts.branchesId = in_branchesId
	where ((customers.customersCode = in_customersNameOrCustomersCode  COLLATE utf8_unicode_ci  or in_customersNameOrCustomersCode='')
    or  (lower(customers.customersName) like  concat("%",CONVERT(lower(in_customersNameOrCustomersCode), BINARY),"%")))
    and customers.branchesId = in_branchesId
    and customers.status = 1
    and customers.debt <> 0
    and (customers.customersOrSuplliers = 1 or  customers.customersOrSuplliers = 2 )
    group by customers.id
);

set out_CountRows=(select count(*) from temp_list_customers_debit);
set out_nodauky=(select sum(nodauky) * -1 from temp_list_customers_debit);
set out_ghino=(select sum(ghino) * -1 from temp_list_customers_debit);
set out_ghico=(select  sum(ghico) * -1 from temp_list_customers_debit);
set out_ghicuoiky=(select  sum(nodauky+ghino-ghico) * -1 from temp_list_customers_debit);

select id,customersCode,customersName,nodauky* -1  as nodauky,
 ghino * -1 as ghino
,ghico * -1 as ghico,
(ifnull(nodauky,0)+ifnull(ghino,0)-ifnull(ghico,0)) * -1 as nocuoiky
	  from temp_list_customers_debit
order by (ifnull(nodauky,0)+ifnull(ghino,0)-ifnull(ghico,0)) * -1  desc
	 limit in_pageIndex,in_pageSize
;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_products_the_kho` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_products_the_kho`(
    in in_productsId bigint,
	in in_branchesId bigint,
    in in_start_page int(11),
    in in_pageSize int(11),
    out out_rowCount int(11)
)
BEGIN -- call quanlybanhang.sp_products_the_kho(0, 0, 20);
declare currentProductsId bigint;
declare currentExchangeValue double default 1;

set currentProductsId = (
        select if(
                products.parentId > 0,
                products.parentId,
                in_productsId
            )
        from products
        where id = in_productsId
    );

set currentExchangeValue  =( select   ifnull(exchangeValue,1) from products left join units on units.id = products.unitsId where products.id = in_productsId ) ;
    
SET @row_number = 0;

DROP TEMPORARY TABLE IF EXISTS temp_list_ecommerProduct;
CREATE TEMPORARY TABLE temp_list_ecommerProduct(
  SELECT warehouseIn.id as id,
        warehouseInProducts.id as detailId,
        warehouseIn.warehouseInCode as code,
        warehouseInProducts.importPrice  * currentExchangeValue / ifnull(exchangeValue,1)  as currentCostPrice,
        amount * if(isnull(units.id), 1, exchangeValue)/currentExchangeValue as amount,
        0 as `order`,
        warehouseIn.dateCreated as dateCreated,
        customers.customersName as customersName,
        "warehouseIn" as type
    FROM `warehouseInProducts` AS `warehouseInProducts`
        INNER JOIN `warehouseIn` AS `warehouseIn` ON `warehouseIn`.`id` = `warehouseInProducts`.`warehouseInId`
        and warehouseIn.status = 1
		and warehouseIn.branchesId = in_branchesId
        INNER JOIN `products` AS `products` ON `products`.`id` = `warehouseInProducts`.`productsId`
        left JOIN `units` AS `units` ON `units`.`id` = `products`.`unitsId`
        left JOIN `customers` AS `customers` ON `customers`.`id` = `warehouseIn`.`customersId`
    where products.id = currentProductsId
    
    union
    SELECT warehouseIn.id as id,
        warehouseInProducts.id as detailId,
        warehouseIn.warehouseInCode as code,
	     	warehouseInProducts.importPrice * currentExchangeValue / ifnull(exchangeValue,1)  as currentCostPrice,

        amount * if(isnull(units.id), 1, exchangeValue)/currentExchangeValue as amount,
        0 as `order`,
        warehouseIn.dateCreated as dateCreated,
        customers.customersName as customersName,
           "warehouseIn" as type
    FROM `warehouseInProducts` AS `warehouseInProducts`
        INNER JOIN `warehouseIn` AS `warehouseIn` ON `warehouseIn`.`id` = `warehouseInProducts`.`warehouseInId`
        and warehouseIn.status = 1
        and warehouseIn.branchesId = in_branchesId
        INNER JOIN `products` AS `products` ON `products`.`id` = `warehouseInProducts`.`productsId`
        INNER JOIN `products` AS `productsParent` ON `productsParent`.`id` = `products`.`parentId`
        left JOIN `units` AS `units` ON `units`.`id` = `products`.`unitsId`
        left JOIN `customers` AS `customers` ON `customers`.`id` = `warehouseIn`.`customersId`
    where productsParent.id = currentProductsId
    union
     SELECT warehouseOut.id as id,
        warehouseOutProducts.id as detailId,
        warehouseOut.warehouseOutCode as code,
        warehouseOutProducts.importPrice  * currentExchangeValue / ifnull(exchangeValue,1)  as currentCostPrice,
        amount * -1 * if(isnull(units.id), 1, exchangeValue)/currentExchangeValue as amount,
        1 as `order`,
        warehouseOut.dateCreated as dateCreated,
        customers.customersName as customersName,
        "warehouseOut" as type
    FROM `warehouseOutProducts` AS `warehouseOutProducts`
        INNER JOIN `warehouseOut` AS `warehouseOut` ON `warehouseOut`.`id` = `warehouseOutProducts`.`warehouseOutId`
        and warehouseOut.status = 1
		and warehouseOut.branchesId = in_branchesId
        INNER JOIN `products` AS `products` ON `products`.`id` = `warehouseOutProducts`.`productsId`
        left JOIN `units` AS `units` ON `units`.`id` = `products`.`unitsId`
        left JOIN `customers` AS `customers` ON `customers`.`id` = `warehouseOut`.`customersId`
    where products.id = currentProductsId

    union
    SELECT warehouseOut.id as id,
        warehouseOutProducts.id as detailId,
        warehouseOut.warehouseOutCode as code,
		    warehouseOutProducts.importPrice * currentExchangeValue / ifnull(exchangeValue,1)  as currentCostPrice,

        amount * -1 * if(isnull(units.id), 1, exchangeValue)/currentExchangeValue as amount,
        1 as `order`,
        warehouseOut.dateCreated as dateCreated,
        customers.customersName as customersName,
        "warehouseOut" as type
    FROM `warehouseOutProducts` AS `warehouseOutProducts`
        INNER JOIN `warehouseOut` AS `warehouseOut` ON `warehouseOut`.`id` = `warehouseOutProducts`.`warehouseOutId`
        and warehouseOut.status = 1
        and warehouseOut.branchesId = in_branchesId
        INNER JOIN `products` AS `products` ON `products`.`id` = `warehouseOutProducts`.`productsId`
        INNER JOIN `products` AS `productsParent` ON `productsParent`.`id` = `products`.`parentId`
        left JOIN `units` AS `units` ON `units`.`id` = `products`.`unitsId`
        left JOIN `customers` AS `customers` ON `customers`.`id` = `warehouseOut`.`customersId`
    where productsParent.id = currentProductsId
	union
    SELECT receipts.id as id,
        receiptsProducts.id as detailId,
        receipts.receiptsCode as code,
        null as currentCostPrice,
        amount * -1 * if(isnull(units.id), 1, exchangeValue)/currentExchangeValue as amount,
        "2" as `order`,
        receipts.dateCreated as dateCreated,
        customers.customersName as customersName,
        "receipts" as `type`
    FROM `receiptsProducts` AS `receiptsProducts`
        INNER JOIN `receipts` AS `receipts` ON `receipts`.`id` = `receiptsProducts`.`receiptsId`
        and receipts.status = 1
        and receipts.branchesId = in_branchesId
        INNER JOIN `products` AS `products` ON `products`.`id` = `receiptsProducts`.`productsId`
        left JOIN `units` AS `units` ON `units`.`id` = `products`.`unitsId`
        left JOIN `customers` AS `customers` ON `customers`.`id` = `receipts`.`customersId`
    where products.id = currentProductsId
    union
    SELECT receipts.id as id,
        receiptsProducts.id as detailId,
        receipts.receiptsCode as code,
        null as currentCostPrice,
        amount * -1 * if(isnull(units.id), 1, exchangeValue)/currentExchangeValue as amount,
        "2" as `order`,
        receipts.dateCreated as dateCreated,
        customers.customersName as customersName,
        "receipts" as `type`
    FROM `receiptsProducts` AS `receiptsProducts`
        INNER JOIN `receipts` AS `receipts` ON `receipts`.`id` = `receiptsProducts`.`receiptsId`
        and receipts.status = 1
          and receipts.branchesId = in_branchesId
        INNER JOIN `products` AS `products` ON `products`.`id` = `receiptsProducts`.`productsId`
        INNER JOIN `products` AS `productsParent` ON `productsParent`.`id` = `products`.`parentId`
        left JOIN `units` AS `units` ON `units`.`id` = `products`.`unitsId`
        left JOIN `customers` AS `customers` ON `customers`.`id` = `receipts`.`customersId`
    where productsParent.id = currentProductsId
    union
    SELECT productReturns.id as id,
        productReturnsProducts.id as detailId,
        productReturns.productReturnsCode as code,
        null as currentCostPrice,
        amount * if(isnull(units.id), 1, exchangeValue)/currentExchangeValue as amount,
        "3" as `order`,
        productReturns.dateCreated as dateCreated,
        customers.customersName as customersName,
        "productReturns" as `type`
    FROM `productReturnsProducts` AS `productReturnsProducts`
        INNER JOIN `productReturns` AS `productReturns` ON `productReturns`.`id` = `productReturnsProducts`.`productReturnsId`
        and productReturns.status = 1
          and productReturns.branchesId = in_branchesId
        INNER JOIN `products` AS `products` ON `products`.`id` = `productReturnsProducts`.`productsId`
        left JOIN `units` AS `units` ON `units`.`id` = `products`.`unitsId`
        left JOIN `customers` AS `customers` ON `customers`.`id` = `productReturns`.`customersId`
    where products.id = currentProductsId
    union
    SELECT productReturns.id as id,
        productReturnsProducts.id as detailId,
        productReturns.productReturnsCode as code,
        null as currentCostPrice,
        amount * if(isnull(units.id), 1, exchangeValue)/currentExchangeValue as amount,
        "3" as `order`,
        productReturns.dateCreated as dateCreated,
        customers.customersName as customersName,
        "productReturns" as `type`
    FROM `productReturnsProducts` AS `productReturnsProducts`
        INNER JOIN `productReturns` AS `productReturns` ON `productReturns`.`id` = `productReturnsProducts`.`productReturnsId`
        and productReturns.status = 1
		and productReturns.branchesId = in_branchesId
        INNER JOIN `products` AS `products` ON `products`.`id` = `productReturnsProducts`.`productsId`
        INNER JOIN `products` AS `productsParent` ON `productsParent`.`id` = `products`.`parentId`
        left JOIN `units` AS `units` ON `units`.`id` = `products`.`unitsId`
        left JOIN `customers` AS `customers` ON `customers`.`id` = `productReturns`.`customersId`
    where productsParent.id = currentProductsId
    union
    SELECT warehouseCheck.id as id,
        warehouseCheckProducts.id as detailId,
        warehouseCheck.warehouseCheckCode as code,
        null as currentCostPrice,
        changeNumber * if(isnull(units.id), 1, exchangeValue)/currentExchangeValue as amount,
        "4" as `order`,
        warehouseCheck.dateCreated as dateCreated,
        null as customersName,
        "warehouseCheck" as `type`
    FROM `warehouseCheckProducts` AS `warehouseCheckProducts`
        INNER JOIN `warehouseCheck` AS `warehouseCheck` ON `warehouseCheck`.`id` = `warehouseCheckProducts`.`warehouseCheckId`
        and warehouseCheck.status = 1
                  and warehouseCheck.branchesId = in_branchesId
        INNER JOIN `products` AS `products` ON `products`.`id` = `warehouseCheckProducts`.`productsId`
        left JOIN `units` AS `units` ON `units`.`id` = `products`.`unitsId`
    where products.id = currentProductsId
    union
    SELECT warehouseCheck.id as id,
        warehouseCheckProducts.id as detailId,
        warehouseCheck.warehouseCheckCode as code,
        null as currentCostPrice,
        changeNumber * if(isnull(units.id), 1, exchangeValue)/currentExchangeValue as amount,
        "4" as `order`,
        warehouseCheck.dateCreated as dateCreated,
        null as customersName,
        "warehouseCheck" as `type`
        
    FROM `warehouseCheckProducts` AS `warehouseCheckProducts`
        INNER JOIN `warehouseCheck` AS `warehouseCheck` ON `warehouseCheck`.`id` = `warehouseCheckProducts`.`warehouseCheckId`
        and warehouseCheck.status = 1
          and warehouseCheck.branchesId = in_branchesId
        INNER JOIN `products` AS `products` ON `products`.`id` = `warehouseCheckProducts`.`productsId`
        INNER JOIN `products` AS `productsParent` ON `productsParent`.`id` = `products`.`parentId`
        left JOIN `units` AS `units` ON `units`.`id` = `products`.`unitsId`
    where productsParent.id = currentProductsId
    union
    SELECT productCancels.id as id,
        productCancelsProducts.id as detailId,
        productCancels.productCancelsCode as code,
        null as currentCostPrice,
        amount * -1 * if(isnull(units.id), 1, exchangeValue)/currentExchangeValue as amount,
        "5" as `order`,
        productCancels.dateCreated as dateCreated,
        null as customersName,
        "productCancels" as `type`
    FROM `productCancelsProducts` AS `productCancelsProducts`
        INNER JOIN `productCancels` AS `productCancels` ON `productCancels`.`id` = `productCancelsProducts`.`productCancelsId`
        and productCancels.status = 1
          and productCancels.branchesId = in_branchesId
        INNER JOIN `products` AS `products` ON `products`.`id` = `productCancelsProducts`.`productsId`
        left JOIN `units` AS `units` ON `units`.`id` = `products`.`unitsId`
    where products.id = currentProductsId
    union
    SELECT productCancels.id as id,
        productCancelsProducts.id as detailId,
        productCancels.productCancelsCode as code,
        
        null as currentCostPrice,
        amount * -1 * if(isnull(units.id), 1, exchangeValue)/currentExchangeValue as amount,
        "5" as `order`,
        productCancels.dateCreated as dateCreated,
        null as customersName,
        "productCancels" as `type`
    FROM `productCancelsProducts` AS `productCancelsProducts`
        INNER JOIN `productCancels` AS `productCancels` ON `productCancels`.`id` = `productCancelsProducts`.`productCancelsId`
        and productCancels.status = 1
          and productCancels.branchesId = in_branchesId
        INNER JOIN `products` AS `products` ON `products`.`id` = `productCancelsProducts`.`productsId`
        INNER JOIN `products` AS `productsParent` ON `productsParent`.`id` = `products`.`parentId`
        left JOIN `units` AS `units` ON `units`.`id` = `products`.`unitsId`
    where productsParent.id = currentProductsId
);
set out_rowCount = (
        select count(*)
        from temp_list_ecommerProduct
    );
    
set @SQLStatement1 = concat(
'select   temp_list_ecommerProduct.*
		FROM temp_list_ecommerProduct
		order by dateCreated desc ,`order` desc
		limit ',
        in_start_page,
        ',',
        in_pageSize ,'
        
       '
    );
    
    
    
PREPARE stmt1 FROM @SQLStatement1;
EXECUTE stmt1;


set @SQLStatement2 = concat(
'select ifnull(sum(amount),0) as previousAmount from 
  (select  temp_list_ecommerProduct.id , temp_list_ecommerProduct.type ,temp_list_ecommerProduct.amount
		FROM temp_list_ecommerProduct
		order by dateCreated desc ,`order` desc
		limit ',
        in_start_page + in_pageSize,
        ',',
      if(out_rowCount -  (in_start_page + in_pageSize) <0 ,0 ,out_rowCount -  (in_start_page + in_pageSize)) ,'
        
       )t ;'
    );
  
    
PREPARE stmt2 FROM @SQLStatement2;
EXECUTE stmt2;


set @SQLStatement3 = concat(
'select id,currentCostPrice   from 
  (select  temp_list_ecommerProduct.id , temp_list_ecommerProduct.currentCostPrice ,temp_list_ecommerProduct.order,
       temp_list_ecommerProduct.dateCreated
		FROM temp_list_ecommerProduct
		order by dateCreated desc ,`order` desc
		limit ',
        in_start_page + in_pageSize,
        ',',
      if(out_rowCount -  (in_start_page + in_pageSize) <0 ,0 ,out_rowCount -  (in_start_page + in_pageSize)) ,'
        
       )t 
       where `order` = 0 or `order` = 1
       order by dateCreated desc
       limit 1;'
    );
  
PREPARE stmt3 FROM @SQLStatement3;
EXECUTE stmt3;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_receiptsProducts_get_list` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_receiptsProducts_get_list`(
    in in_notCompleteReturn int,  
    in in_ordersCode varchar(200),
    in in_orderRequired int,  
    in in_receiptsCode varchar(200),
    in in_productsCode varchar(200),
    in in_productsName  varchar(200),
	in in_customersSearch  varchar(200),
	in in_customersId int,
	in in_usersCreatorId int,
    in in_status int,
    in in_FromDate varchar(200),
	in in_ToDate varchar(200),
	in in_orderBy varchar(200),
	in in_order varchar(200),
    in in_attributes varchar(500),
	in in_start_page bigint,
    in in_end_page bigint,
    out out_rowCount bigint
)
BEGIN
	if(in_attributes = '') then 
      set in_attributes = 'id,workUnitsId,parentId,productsCode,productsName,subName,orderQuantity,subProductsPropertiesId,images,importPrice,salePrice,productGroupsId,brandsId,productPlacementsId,quantity,quantitySold,unitsId,weigh,productsCategories,directSales,minAmount,maxAmount,usersCreatorId,dateCreated,dateUpdated,status,usersCreator,productGroups,brands,productPlacements,units,lastInPrice';
   end if;
    
DROP TEMPORARY TABLE IF EXISTS temp_list_receipts;
CREATE TEMPORARY TABLE temp_list_receipts(
		select  
        receipts.*,
            (case when  not isnull(customers.id) then json_object("id", customers.id, "customersName", customers.customersName,"customersCode", customers.customersCode) else null end)as customers,
		ifnull(receipts.money,0) as money,
		 ifnull(receipts.discount,0)as discount,
		 ifnull(receipts.totalMoney,0) as totalMoney,
		 ifnull(receipts.amountPaid,0) as amountPaid,
         ifnull(sum(receiptsProducts.amount),0) as totalAmount,
          ifnull(receipts.totalSurchageMoney,0) as totalSurchageMoney
		FROM
			receipts
            inner join receiptsProducts on receiptsProducts.receiptsId = receipts.id
			left join orders on orders.id = receipts.ordersId
			LEFT OUTER JOIN
			`customers` AS `customers` ON `receipts`.`customersId` = `customers`.`id`
		 WHERE

                lower(receipts.receiptsCode) like  concat("%",CONVERT(lower(in_receiptsCode), BINARY),"%")
                and
                 fn_receiptsProducts_prodcuts(receipts.id,in_productsName,in_productsCode) = 1
                
                
                and receipts.ordersId > in_orderRequired
 			 	and (in_customersId = 0 or receipts.customersId = in_customersId )
                and (in_usersCreatorId = 0 or receipts.usersCreatorId = in_usersCreatorId )
				and (in_notCompleteReturn = 0 or ( in_notCompleteReturn = 1 and  exists(select receiptsProducts.id from receiptsProducts where receiptsProducts.amount > receiptsProducts.returnAmount and receiptsProducts.receiptsId = receipts.id) ))
			 	and((in_status = -99 and receipts.status >-98 ) or receipts.status = in_status)

				and (in_FromDate = '' or receipts.dateCreated >= in_FromDate )
				and (in_ToDate= '' or  receipts.dateCreated < in_ToDate + INTERVAL 1 DAY)
			group by receipts.id
        );
	set out_rowCount =  (select count(*) from temp_list_receipts);

	set @SQLStatement1=concat('
    select ',in_attributes,'
		FROM temp_list_receipts
		order by ',in_orderBy,' ',in_order,'
		limit ',in_start_page,',', in_end_page
	);

   	PREPARE stmt1 FROM @SQLStatement1;
    EXECUTE stmt1;


    SELECT
	      sum(money) as money,
		  sum(discount) as discount ,
		  sum(totalMoney) as totalMoney ,
		  sum(amountPaid) as amountPaid,
          sum(totalAmount) as totalAmount,
		  sum(totalSurchageMoney) as totalSurchageMoney
	 FROM  temp_list_receipts;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_receiptsProducts_thong_ke` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_receiptsProducts_thong_ke`(
    in in_notCompleteReturn int,  -- 0 
    in in_ordersCode varchar(200),
    in in_orderRequired int,  -- -1 => lấy tất, 0 => chỉ lấy những hóa đơn sinh ra từ đặt hàng
    in in_receiptsCode varchar(200),
    in in_productsCode varchar(200),
    in in_productsName  varchar(200),
	in in_customersSearch  varchar(200),
	in in_customersId int,
	in in_usersCreatorId int,
    in in_status int,
    in in_FromDate varchar(200),
	in in_ToDate varchar(200)
)
BEGIN

-- call quanlybanhang.sp_receiptsProducts_thong_ke(0, '', -1, '', '', '', '', 0, 0, 0, '', '');

	 SELECT
	 sum(money) as money,
		  sum(discount) as discount ,
		  sum(totalMoney) as totalMoney ,
		  sum(amountPaid) as amountPaid,
          sum(totalAmount) as totalAmount,
		  sum(totalSurchageMoney) as totalSurchageMoney

	 FROM
	(
		select  -- money, discount ,totalMoney ,amountPaid,totalSurchageMoney,
		 -- (select  sum(amount) from receiptsProducts where receiptsProducts.receiptsId = receipts.id) as amount
		ifnull(receipts.money,0) as money,
		 ifnull(receipts.discount,0)as discount,
		 ifnull(receipts.totalMoney,0) as totalMoney,
		 ifnull(receipts.amountPaid,0) as amountPaid,
         ifnull(sum(receiptsProducts.amount),0) as totalAmount,
          ifnull(receipts.totalSurchageMoney,0) as totalSurchageMoney
		FROM
			receipts
            inner join receiptsProducts on receiptsProducts.receiptsId = receipts.id
			left join orders on orders.id = receipts.ordersId
		 WHERE

                lower(receipts.receiptsCode) like  concat("%",CONVERT(lower(in_receiptsCode), BINARY),"%")
                and
                 fn_receiptsProducts_prodcuts(receipts.id,in_productsName,in_productsCode) = 1
                
                -- and    lower(orders.ordersCode) like  concat("%",CONVERT(lower(in_ordersCode), BINARY),"%")
                and receipts.ordersId > in_orderRequired
 			 	and (in_customersId = 0 or receipts.customersId = in_customersId )
                and (in_usersCreatorId = 0 or receipts.usersCreatorId = in_usersCreatorId )
				and (in_notCompleteReturn = 0 or ( in_notCompleteReturn = 1 and  exists(select receiptsProducts.id from receiptsProducts where receiptsProducts.amount > receiptsProducts.returnAmount and receiptsProducts.receiptsId = receipts.id) ))
			 	and((in_status = -99 and receipts.status >-98 ) or receipts.status = in_status)

				and (in_FromDate = '' or receipts.staticDay >= date_format(in_FromDate,'%Y%m%d') )
				and (in_ToDate= '' or  receipts.staticDay < date_format(in_ToDate,'%Y%m%d') + INTERVAL 1 DAY)
			group by receipts.id
		
	)t;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_receipts_chitiet` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_receipts_chitiet`(
	in in_receiptsId bigint,
	in in_pageIndex int, 
    in in_pageSize int,
    out out_CountRows bigint
)
BEGIN

-- call quanlybanhang.sp_receipts_chitiet(0, 0, 20);

 DROP TEMPORARY TABLE IF EXISTS temp_list_receipts_chitiet;
 CREATE TEMPORARY TABLE temp_list_receipts_chitiet(
	select 
    receiptsProducts.id,
    productsId,
    products.productsCode,
    products.productsName,
	receiptsProducts.amount as soluong,
	receiptsProducts.dealPrice as giaban,
    receiptsProducts.importPrice as giavon
    from receiptsProducts
        inner join products on products.id = receiptsProducts.productsId
	where 
      receiptsProducts.receiptsId = in_receiptsId
);
  set out_CountRows=(select count(*) from temp_list_receipts_chitiet);

	select 
    id,
    productsId,
    productsCode,
    productsName,
	round(soluong,2) as soluong,
	round(giaban,2) as giaban,
    round(giavon,2) as giavon,
    round(giaban-giavon,2) as loinhuan1sp,
	round((giaban-giavon)*soluong,2) loinhuan
    
	  from temp_list_receipts_chitiet
	  order by ((giaban-giavon)*soluong) desc
	limit in_pageIndex,in_pageSize
	;
    
    
    select 
	 round(sum(soluong),2) as soluong,
     round(sum((giaban-giavon)*soluong),2) as loinhuan
     
	  from temp_list_receipts_chitiet
	
	;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_receipts_get_list` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_receipts_get_list`(
     in in_branchesId bigint,
    in in_notCompleteReturn int,  -- 0 
    in in_ordersCode varchar(200),
    in in_orderRequired int,  -- -1 => lấy tất, 0 => chỉ lấy những hóa đơn sinh ra từ đặt hàng
    in in_paymentStatus int,
    in in_receiptsCode varchar(200) COLLATE utf8mb3_unicode_ci,
    in in_productsSearch varchar(200) COLLATE utf8mb3_unicode_ci,
    in in_productsCode varchar(200) COLLATE utf8mb3_unicode_ci,
    in in_productsName  varchar(200) COLLATE utf8mb3_unicode_ci,
	in in_customersSearch  varchar(200) COLLATE utf8mb3_unicode_ci,
	in in_customersId int,
	in in_usersCreatorId int,
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

-- call quanlybanhang.sp_receipts_get_list(0, '', -1, 1, '', '', '', '', 0, 0, 0, '', '', 'id', 'desc', '', 0, 20);

DECLARE orderBy, sqlWhere  varchar(20000) COLLATE utf8mb3_unicode_ci;

	if(in_attributes = '') then 
      set in_attributes = 'totalSurchageMoney,id,receiptsCode,amountPaid,totalMoney,dateCreated,dateUpdated,status,discount,money
      ';
   end if;
   
  set orderBy = concat(' ',
	if(in_orderBy <> '', in_orderBy ,' id '),
    ' ',
    if(in_order <> '', in_order ,' desc ')
  ,' ');

    
	set sqlWhere =  concat(' ',
	 if(in_receiptsCode <> '',concat(' and lower(receipts.receiptsCode) like  concat("%",CONVERT(lower("',in_receiptsCode,'"), BINARY),"%")'),' '),
	 if(in_customersId <> 0,concat(' and ( receipts.customersId = ',in_customersId,')'), ' '),
	 if(in_orderRequired <> 0,concat('  and receipts.ordersId > ',in_orderRequired),' '),
	 if(in_customersSearch <> '',' and customers.id >0 ',' '),
	 if(in_notCompleteReturn <> 0,concat('and (',in_notCompleteReturn - 1,'= 0 
	 and  exists(select receiptsProducts.id from receiptsProducts 
			   where receiptsProducts.amount > receiptsProducts.returnAmount and receiptsProducts.receiptsId = receipts.id)) ' ),' '),
	 if(in_paymentStatus <> -99 and in_paymentStatus = 0  , ' and (receipts.totalMoney - receipts.amountPaid) > 0', ' ' ),
	 if(in_usersCreatorId <> 0,concat(' and (receipts.usersCreatorId = ',in_usersCreatorId,') '), ' '),
	 if(in_FromDate <> '' ,concat(' and receipts.staticDay >= "',date_format(in_FromDate,'%Y%m%d'),'"'),''),
	 if(in_ToDate <> '' ,concat(' and receipts.staticDay < "',date_format(in_ToDate,'%Y%m%d'),'" + INTERVAL 1 DAY'),''),
	 if(in_productsName <> '' or  in_productsCode <> '' or in_productsSearch<>'' ,concat(' and fn_receiptsProducts_prodcuts(receipts.id,"',in_productsSearch,'","',in_productsName,'","',in_productsCode,'") = 1'), ' '),
	 if(in_status <> -99, concat(' and receipts.status =',in_status ), ' and receipts.status > -98 ' ),
	 ' '
	);

	set @sql0 = concat ('(
			select  
			receipts.*,
				(case when  not isnull(customers.id) then json_object("id", customers.id, "customersName", customers.customersName,"customersCode", customers.customersCode) else null end)as customers,

			 ifnull(sum(receiptsProducts.amount),0) as totalAmount

			FROM
				receipts
				left join receiptsProducts on receiptsProducts.receiptsId = receipts.id
				left join orders on orders.id = receipts.ordersId
				LEFT OUTER JOIN
				`customers` AS `customers` ON `receipts`.`customersId` = `customers`.`id`
				and (
					lower(customers.customersName) like  concat("%",CONVERT(lower("',in_customersSearch,'"), BINARY),"%")
					or 
					lower(customers.customersCode) like  concat("%",CONVERT(lower("',in_customersSearch,'"), BINARY),"%"))
			 WHERE
					1 ',sqlWhere,'
				group by receipts.id) as receipts
			');
        

	set @sql1 =concat('
    select ',in_attributes,' ,customers
		FROM ',@sql0,'
		order by ',orderBy,
        '
		limit ',in_start_page,',', in_end_page
	);
--  
   	

	set @sql2 = concat('
		SELECT
         
               count(*) as count ,
			  sum(money) as money,
			  sum(discount) as discount ,
			  sum(totalMoney) as totalMoney ,
			  sum(amountPaid) as amountPaid,
			  sum(totalAmount) as totalAmount,
			  sum(totalSurchageMoney) as totalSurchageMoney
		 FROM ',@sql0);
    
    
    
	PREPARE stmt1 FROM @sql1;
    EXECUTE stmt1;
     


    PREPARE stmt3 FROM @sql2;
    EXECUTE stmt3;
    
     
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_save_previousCostPrice` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_save_previousCostPrice`(
  in_warehouseInOutProductsId bigint,
  in_productsId  bigint
)
BEGIN
      UPDATE `warehouseInOutProducts` SET `previousCostPrice` = (select importPrice from  products where id = in_productsId) WHERE (`id` = in_warehouseInOutProductsId);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_suppliers_debt_list` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_suppliers_debt_list`(
    in in_customersId bigint,
	in in_start_page bigint,
    in in_pageSize bigint,
    out out_rowCount bigint
)
BEGIN
	SET @row_number = 0;

	DROP TEMPORARY TABLE IF EXISTS temp_list_ecommerProduct;
	CREATE TEMPORARY TABLE temp_list_ecommerProduct(
			 SELECT
		    warehouseIn.id as id ,warehouseIn.warehouseInCode as code , "warehouseIn" as type,dateCreated as dateCreated,
             totalMoney  as totalMoney,
             status, 0 as `order` 
		FROM
			`warehouseIn` AS `warehouseIn`
		 WHERE
            warehouseIn.status = 1
            and warehouseIn.customersId = in_customersId     
	union
		SELECT
		    warehouseOut.id as id ,warehouseOut.warehouseOutCode as code , "warehouseOut" as type,dateCreated as dateCreated,
             totalMoney *-1  as totalMoney,
            status, 1 as `order` 
		FROM
			`warehouseOut` AS `warehouseOut`
		 WHERE
            warehouseOut.status = 1
            and warehouseOut.customersId = in_customersId     
	union
		SELECT
		    receipts.id as id ,receipts.receiptsCode as code , "receipts" as type,dateCreated as dateCreated,totalMoney * -1 as totalMoney,status,2 as `order`
		FROM
			`receipts` AS `receipts`
		 WHERE 
            receipts.status = 1
            and receipts.customersId = in_customersId
	union
		SELECT
		    productReturns.id as id ,productReturns.productReturnsCode as code , "productReturns" as type, dateCreated as dateCreated,totalMoney  as totalMoney,status,3 as `order`
		FROM
			`productReturns` AS `productReturns`
		 WHERE 
            productReturns.status = 1
            and productReturns.customersId = in_customersId
            
	union   
		SELECT
		    bills.id as id ,bills.billsCode as code , "bills" as type, dateCreated ,totalMoney  as totalMoney ,status ,(case when totalMoney > 0 then 4 else 5 end )  as `order`
		FROM
			`bills` AS `bills`
		 WHERE 
            bills.status = 1
            and bills.customersId = in_customersId        
    );

	set out_rowCount =  (select count(*) from temp_list_ecommerProduct);

	set @SQLStatement1=concat('
    select temp_list_ecommerProduct.*
		FROM temp_list_ecommerProduct
		order by dateCreated desc ,`order` desc
		limit ',in_start_page,',', in_pageSize
	);

   	PREPARE stmt1 FROM @SQLStatement1;
    EXECUTE stmt1;
    
    
    	set @SQLStatement2=concat('
    select ifnull(sum(totalMoney),0) as preTotalMoney from 
     (select temp_list_ecommerProduct.id,temp_list_ecommerProduct.type,totalMoney
		FROM temp_list_ecommerProduct
		order by dateCreated desc ,`order` desc 
		limit ', in_start_page + in_pageSize,',',  if(out_rowCount -  (in_start_page + in_pageSize) <0 ,0 ,out_rowCount -  (in_start_page + in_pageSize)),'
	 )t
        '
	);

   	PREPARE stmt2 FROM @SQLStatement2;
    EXECUTE stmt2;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_suppliers_get_list` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_suppliers_get_list`(
    in in_status int, 
	in in_search varchar(200),  
	in in_usersCreatorId bigint, 
	in in_wardsId bigint ,  
	in in_provincesId bigint, 
	in in_districtsId bigint,  
	in in_totalSalesFrom varchar(200),  
	in in_totalSalesTo varchar(200),  
	in in_totalSalesDateFrom varchar(200), 
	in in_totalSalesDateTo varchar(200), 
	in in_debtFrom varchar(200), 
	in in_debtTo varchar(200), 
	in in_isCustomers  int, 
	
    in in_FromDate varchar(200), 
	in in_ToDate varchar(200), 
	in in_orderBy varchar(200), 
	in in_order varchar(200),
    in in_attributes varchar(500),
	in in_start_page bigint,
  in in_end_page bigint,
  out out_rowCount bigint
)
BEGIN
    DECLARE sqlWhere ,sqlCreateTable, sqlWherProduct,sqlHaving ,joinCustomer  varchar(20000);
	SET @row_number = 0;
  
   if(in_attributes = '') then 
    set in_attributes = 'id,image,suppliersName,suppliersTaxNumber,suppliersCompanyName,suppliersCode,email,mobile,address,usersCreatorId,dateUpdated,dateCreated,status,wardsId,note,debt,tong_nhap,tong_nhap_tru_tra_hang';
   end if;
   
   set sqlWhere =  concat(' ',
	 if(in_status <> -99,concat(' and (suppliers.status =  ',in_status ,')'),''),
     if(in_search <> '',concat('and (lower(suppliers.suppliersName) like  concat("%",CONVERT(lower("',in_search,'"), BINARY),"%") or lower(suppliers.suppliersCode) like  concat("%",CONVERT(lower("',in_search,'"), BINARY),"%"))'),''),
	 if(in_usersCreatorId <> 0 ,concat('and (suppliers.usersCreatorId =  ',in_usersCreatorId ,')'),''),
     if(in_wardsId <> 0 ,concat('and (wards.id =  ',in_wardsId ,')'),''),
     if(in_provincesId <> 0 ,concat('and (provinces.id =  ',in_provincesId ,')'),''),
     if(in_districtsId <> 0 ,concat('and (districts.id =  ',in_districtsId ,')'),''),
	 if(in_debtFrom <> '' ,concat('and (suppliers.debt  >=  ',in_debtFrom ,')'),''),
     if(in_debtTo <> '' ,concat('and (suppliers.debt  <=  ',in_debtTo ,')'),''),
     if(in_FromDate <> '' ,concat('and suppliers.dateCreated >= "',in_FromDate,'"'),''),
     if(in_ToDate <> '' ,concat('and suppliers.dateCreated < "',in_ToDate,'" + INTERVAL 1 DAY'),''),
     ''
   );
   
  set joinCustomer =  concat(' ',
     if(in_isCustomers <> -99, concat('inner join customers on customers.suppliersId = suppliers.id'),''),
     ''
   );
   
     set sqlWherProduct =  concat(' ',
     if(in_totalSalesDateFrom <> '' ,concat('and warehouseInOut.dateCreated >= "',in_totalSalesDateFrom,'"'),''),
     if(in_totalSalesDateTo <> '' ,concat('and warehouseInOut.dateCreated < "',in_totalSalesDateTo,'" + INTERVAL 1 DAY'),''),
     ''
   );

   
	set sqlHaving =  concat('',
     if(in_totalSalesFrom <> '' ,concat('and (sum(warehouseInOut.totalMoney) >=  ',in_totalSalesFrom ,')'),''),
     if(in_totalSalesTo <> '' ,concat('and (sum(warehouseInOut.totalMoney)  <=  ',in_totalSalesTo ,')'),''),
     ' '
   );
  
  

	DROP TEMPORARY TABLE IF EXISTS temp_list_suppliers;
    SET @sql1 = CONCAT('
	CREATE TEMPORARY TABLE temp_list_suppliers(
			SELECT
		    suppliers.id,suppliers.workUnitsId,suppliers.image,suppliersName,suppliersCompanyName,suppliersTaxNumber,suppliersCode,suppliers.email,suppliers.mobile,suppliers.address,suppliers.usersCreatorId,suppliers.dateUpdated,suppliers.dateCreated,suppliers.status,suppliers.wardsId,suppliers.note,
            suppliers.debt  as debt,
            sum((case when type = 0 then warehouseInOut.totalMoney else 0 end)) as "tong_nhap",
            ifnull(sum((case when type = 0 then warehouseInOut.totalMoney else warehouseInOut.totalMoney * -1 end)),0) as "tong_nhap_tru_tra_hang"
		FROM
			`suppliers` AS `suppliers`
			left JOIN
			 `warehouseInOut` AS `warehouseInOut`  
               ON `warehouseInOut`.`suppliersId` = `suppliers`.`id` and warehouseInOut.status = 1 ',sqlWherProduct,'
             left JOIN
			 (`wards` AS `wards`  
              inner join `districts` AS `districts`  on `wards`.`districtsId` = `districts`.`id` 
			  inner join `provinces` AS `provinces`  on `districts`.`provincesId` = `provinces`.`id` 
             ) ON `wards`.`id` = `suppliers`.`wardsId` 
             ',joinCustomer,'
		 WHERE 
                1 
                ',sqlWhere,'
	             group by suppliers.id
                 having 1 
				 ',sqlHaving,'
       );
        ');


   	PREPARE stmt1 FROM @sql1;
	EXECUTE stmt1;
  
	set out_rowCount =  (select count(*) from temp_list_suppliers);

	set @SQLStatement1=concat('
    select ',in_attributes,'
		FROM temp_list_suppliers
		order by ',in_orderBy,' ',in_order,'
		limit ',in_start_page,',', in_end_page
	);
   
  	PREPARE stmt2 FROM @SQLStatement1;
    EXECUTE stmt2;
    
	select ifnull(sum(debt),0) as debt, ifnull(sum(tong_nhap),0)  as "tong_nhap" ,ifnull(sum(tong_nhap_tru_tra_hang),0) as "tong_nhap_tru_tra_hang"  from temp_list_suppliers;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_suppliers_nhap_tra_hang` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_suppliers_nhap_tra_hang`(
    in in_suppliersId bigint,
   	in in_start_page bigint,
    in in_end_page bigint,
    out out_rowCount bigint
)
BEGIN
	SET @row_number = 0;



	DROP TEMPORARY TABLE IF EXISTS temp_list_ecommerProduct;
	CREATE TEMPORARY TABLE temp_list_ecommerProduct(
		SELECT
		    warehouseIn.id as id ,warehouseIn.warehouseInCode  , 0 as 'type', warehouseIn.dateCreated,totalMoney,amountPaid,warehouseIn.status,
            	json_object("id",usersCreator.id,"username",usersCreator.username,"fullname",usersCreator.fullname )usersCreator
		FROM
			`warehouseIn` AS `warehouseIn`
            	INNER JOIN
			`users` AS `usersCreator` ON `warehouseIn`.`usersCreatorId` = `usersCreator`.`id`
		 WHERE
            warehouseIn.status = 1
            and warehouseIn.customersId = in_suppliersId
	   union 
       SELECT
		    warehouseOut.id as id ,warehouseOut.warehouseOutCode  , 1 as type, warehouseOut.dateCreated,totalMoney,amountPaid,warehouseOut.status,
            	json_object("id",usersCreator.id,"username",usersCreator.username,"fullname",usersCreator.fullname )usersCreator
		FROM
			`warehouseOut` AS `warehouseOut`
            	INNER JOIN
			`users` AS `usersCreator` ON `warehouseOut`.`usersCreatorId` = `usersCreator`.`id`
		 WHERE
            warehouseOut.status = 1
            and warehouseOut.customersId = in_suppliersId
    );

	set out_rowCount =  (select count(*) from temp_list_ecommerProduct);

	set @SQLStatement1=concat('
    select temp_list_ecommerProduct.*
		FROM temp_list_ecommerProduct
		order by dateCreated desc
		limit ',in_start_page,',', in_end_page
	);

   	PREPARE stmt1 FROM @SQLStatement1;
    EXECUTE stmt1;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_sync_products_quantity` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_sync_products_quantity`(
  in_branchesId bigint,
  in_productsId bigint,
  in_productsBatchsCode varchar(200)
)
BEGIN
  declare cr_productsParentId,cr_productsBatchsId, cr_productsTotalInfoId  bigint;
  declare exchangeValue_core,batchs_quantity,totalInfo_quantity,totalInfo_quantitySold ,totalInfo_quantityOutIn,totalInfo_totalImportPriceOutIn,  totalInfo_importPrice ,totalInfo_orderQuantity double;
  
  declare   batchs_manufactureDate , batchs_expirationDate datetime;
 


  set sql_safe_updates = 0;
  
   select products.parentId, 
        ifnull(exchangeValue,1)
     into cr_productsParentId ,exchangeValue_core
     from products
     left join units on units.id = products.unitsId
     where products.id = in_productsId;
  
  set  cr_productsBatchsId = (select id from productsBatchs 
  where 
     productsId = in_productsId and branchesId = in_branchesId
     and  ( (in_productsBatchsCode = ''  and isnull(productsBatchsCode)  )
       or (in_productsBatchsCode <> ''  and  MATCH(productsBatchsCode) AGAINST(in_productsBatchsCode)    )
     )
     limit 1 
     );
  set  cr_productsTotalInfoId =  (select id from productsTotalInfo where productsId = in_productsId and branchesId = in_branchesId);


  if(cr_productsTotalInfoId >0) then
   select quantity,quantitySold,quantityOutIn,totalImportPriceOutIn,importPrice,orderQuantity
     into totalInfo_quantity,totalInfo_quantitySold ,totalInfo_quantityOutIn,totalInfo_totalImportPriceOutIn,  totalInfo_importPrice,totalInfo_orderQuantity
     from productsTotalInfo
     where productsId = cr_productsParentId
             and branchesId = in_branchesId;
     
     
    UPDATE `productsTotalInfo` SET `quantity` = round(totalInfo_quantity / exchangeValue_core,2),
                                     quantitySold  =   round(totalInfo_quantitySold / exchangeValue_core,2),
									  quantityOutIn  =   round(totalInfo_quantityOutIn / exchangeValue_core,2),
                                        orderQuantity  =   round(totalInfo_orderQuantity / exchangeValue_core,2),
								       	totalImportPriceOutIn  =   round(totalInfo_totalImportPriceOutIn * exchangeValue_core,2),
										importPrice  =   round(totalInfo_importPrice * exchangeValue_core,2)
        WHERE (`productsTotalInfo`.id  = cr_productsTotalInfoId );
        
        
   else
      INSERT INTO `productsTotalInfo`
      (`branchesId`, `productsId`, `quantity`, `quantitySold`, `quantityOutIn`, `totalImportPriceOutIn`, `importPrice`, `parentId`,`orderQuantity`) 
      select 
       branchesId,in_productsId,
       round(quantity / exchangeValue_core,2),
           round(quantitySold / exchangeValue_core,2),
            round(quantityOutIn / exchangeValue_core,2),
             round(totalImportPriceOutIn * exchangeValue_core,2),
              round(importPrice * exchangeValue_core,2),
              id,
			 round(orderQuantity / exchangeValue_core,2)
              
      from productsTotalInfo
      where    productsId = cr_productsParentId
             and branchesId = in_branchesId;
  end if;
  

  if(cr_productsBatchsId >0) then
  
   select productsBatchs.manufactureDate,expirationDate,quantity 
     into  batchs_manufactureDate , batchs_expirationDate ,batchs_quantity
     from productsBatchs
     where   
     productsId = cr_productsParentId and branchesId = in_branchesId
     and  ( (in_productsBatchsCode = ''  and isnull(productsBatchsCode)  )
       or (in_productsBatchsCode <> ''  and  MATCH(productsBatchsCode) AGAINST(in_productsBatchsCode)    )
     )
     ;
    
     select batchs_manufactureDate , batchs_expirationDate ,batchs_quantity;
     
    UPDATE `productsBatchs` SET `quantity` = round(batchs_quantity / exchangeValue_core,2),
                                `manufactureDate` =batchs_manufactureDate ,
                                 `batchs_expirationDate` =batchs_expirationDate
                                 
        WHERE (`productsTotalInfo`.id  = cr_productsBatchsId );
        

   else 

      INSERT INTO `productsBatchs`
      (`branchesId`, `productsId`, `manufactureDate`, `expirationDate`, `quantity`, `productsBatchsCode`, `customersId`, `parentId`) 
      select 
       branchesId,in_productsId,
       manufactureDate,
       expirationDate,
       round(quantity / exchangeValue_core,2),
       productsBatchsCode,
       customersId,
       id
          
      from productsBatchs
      where    productsId = cr_productsParentId
             and branchesId = in_branchesId;
end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_tong_quan_1_ngay` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_tong_quan_1_ngay`(
 in in_branchesId int,
 in in_date date
)
BEGIN

-- call quanlybanhang.sp_tong_quan_1_ngay('2022-07-01');

    declare last_day varchar(200);

		SELECT
             ifnull(sum(`receipts`.totalMoney),0)as totalSales,
             count(receipts.id) as countReceipts
		FROM
			  `receipts` AS `receipts` 
             where  
			`receipts`.`status` = 1
          and   receipts.branchesId = in_branchesId
           and  receipts.staticDay >=  in_date
             and  receipts.staticDay < in_date + INTERVAL 1 DAY 
  
             ;
           
           
        SELECT
			 count(productReturns.id) as countProductReturns,
			 ifnull(sum(`productReturns`.totalMoney ),0)as totalReturns 
		FROM
			  `productReturns` AS `productReturns` 
             where  
			`productReturns`.`status` = 1
-- and   productReturns.staticDay = in_date
     and   productReturns.branchesId = in_branchesId
       and  productReturns.staticDay >=  in_date
             and  productReturns.staticDay < in_date + INTERVAL 1 DAY
  ; 
        
    if(isnull(in_date))
    then set last_day = last_day(in_date);
    else set last_day = in_date;
    end if;
    
        SELECT
			 ifnull(sum(`receipts`.totalMoney ),0)as sales_cung_ky 
		FROM
			`receipts` AS `receipts` 
             where  
			`receipts`.`status` = 1
             and   receipts.branchesId = in_branchesId
           and   receipts.staticDay  < last_day +  INTERVAL 1 DAY
           and    receipts.staticDay >=  DATE_SUB(in_date,INTERVAL DAYOFMONTH(in_date)-1 day);

        
  
     
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
	in in_branchesId int,
    in in_FromDate varchar(200),
	in in_ToDate varchar(200),
    in in_timeType int 
)
BEGIN
    declare memberInProjects,memberInOffices bigint;
    declare start_date,end_date,start_date_week,end_date_week datetime;

    if(in_FromDate='') then set start_date = subdate(current_timestamp(),30) ;
    else set start_date = in_FromDate;
    end if;

	if(in_ToDate='') then set end_date = current_timestamp();
    else set end_date = in_ToDate;
    end if;
    
        DROP TEMPORARY TABLE IF EXISTS temp_doanh_thu;
		CREATE TEMPORARY TABLE temp_doanh_thu
		(
    	SELECT
			DATE_FORMAT(receipts.dateCreated,'%Y-%m-%d %H:00:00') as dateCreated,
            sum(`receipts`.totalMoney  	 )as totalSales
		FROM
			  `receipts` AS `receipts` 
             where  
                `receipts`.`status` = 1
			   AND receipts.branchesId = in_branchesId
               and ( receipts.dateCreated >= start_date )
			   and ( receipts.dateCreated < end_date + INTERVAL 1 DAY)
            GROUP BY DATE_FORMAT(receipts.dateCreated,'%Y-%m-%d %H:00:00')

	);
    
       DROP TEMPORARY TABLE IF EXISTS temp_tra_hang;
	   CREATE TEMPORARY TABLE temp_tra_hang
		(
    	SELECT
			DATE_FORMAT(productReturns.dateCreated,'%Y-%m-%d %H:00:00') as dateCreated,
            sum(`productReturns`.totalMoney  	 )as totalReturns
		FROM
			  `productReturns` AS `productReturns` 
             where  
                `productReturns`.`status` = 1
     AND productReturns.branchesId = in_branchesId
                    and (  productReturns.dateCreated >= start_date )
			   and ( productReturns.dateCreated < end_date + INTERVAL 1 DAY)
            GROUP BY DATE_FORMAT(productReturns.dateCreated,'%Y-%m-%d %H:00:00')

	);
     
    
    
	if(in_timeType = 1) then
		DROP TEMPORARY TABLE IF EXISTS temp_time_ngay;
		CREATE TEMPORARY TABLE temp_time_ngay
		(
			 select    selectedDate as date from  (
			  select adddate(start_date,t4*10000 + t3*1000 + t2*100 + t1*10 + t0) selectedDate from
				 (select 0 t0 union select 1 union select 2 union select 3 union select 4 union select 5 union select 6 union select 7 union select 8 union select 9) t0,
				 (select 0 t1 union select 1 union select 2 union select 3 union select 4 union select 5 union select 6 union select 7 union select 8 union select 9) t1,
				 (select 0 t2 union select 1 union select 2 union select 3 union select 4 union select 5 union select 6 union select 7 union select 8 union select 9) t2,
				 (select 0 t3 union select 1 union select 2 union select 3 union select 4 union select 5 union select 6 union select 7 union select 8 union select 9) t3,
				 (select 0 t4 union select 1 union select 2 union select 3 union select 4 union select 5 union select 6 union select 7 union select 8 union select 9) t4
			 ) v
			 where
				date_format(selectedDate,'%Y%m%d') >= date_format(start_date,'%Y%m%d')
				 and date_format(selectedDate,'%Y%m%d') <= date_format(end_date,'%Y%m%d')

		);
        
      select temp_time_ngay.date,
      ifnull(sum(temp_doanh_thu.totalSales),0) 
      -
      ifnull((select sum(totalReturns) from  temp_tra_hang  where  date_format(temp_tra_hang.dateCreated,'%Y%m%d')  = date_format(temp_time_ngay.date,'%Y%m%d')),0)
      as totalSales 
      
      from temp_time_ngay
      left join temp_doanh_thu on  date_format(temp_doanh_thu.dateCreated,'%Y%m%d')  = date_format(temp_time_ngay.date,'%Y%m%d')
      group by  temp_time_ngay.date
      order by temp_time_ngay.date asc ;
      
      
	elseif(in_timeType = 2) then
        DROP TEMPORARY TABLE IF EXISTS temp_time_gio;
		CREATE TEMPORARY TABLE temp_time_gio
		(
			select    hours from  (
			 select 0 as hours  union all select 1 union all select 2 union all select 3 union all
			  select 4 union all select 5 union all select 6 union all select 7 union all
			  select 8 union all select 9 union all select 10 union all select 11 union all
			  select 12 union all select 13 union all select 14 union all select 15 union all
			  select 16 union all select 17 union all select 18 union all select 19 union all
			  select 20 union all select 21 union all select 22 union all select 23
			 ) v
		);

    select temp_time_gio.hours,
    ifnull(sum(temp_doanh_thu.totalSales),0) 
        -
      ifnull((select sum(totalReturns) from  temp_tra_hang  where  date_format(temp_tra_hang.dateCreated,'%H')  = temp_time_gio.hours),0)
      as totalSales
     
     from temp_time_gio
      left join temp_doanh_thu on  date_format(temp_doanh_thu.dateCreated,'%H')  = temp_time_gio.hours
      group by  temp_time_gio.hours
      order by  temp_time_gio.hours asc ;
      
   elseif(in_timeType = 3) then
		
		DROP TEMPORARY TABLE IF EXISTS temp_time_thu;
		CREATE TEMPORARY TABLE temp_time_thu
		(
			select    thu from  (
			 select 0 as thu  union all select 1 union all select 2 union all select 3 union all select 4 union all select 5 union all select 6
			 ) v
		);
        
  select temp_time_thu.thu + 1 as thu ,
    ifnull(sum(temp_doanh_thu.totalSales),0)
        -
      ifnull((select sum(totalReturns) from  temp_tra_hang  where  dayofweek(temp_tra_hang.dateCreated) - 1 = temp_time_thu.thu),0)
      as totalSales
    from temp_time_thu
      left join temp_doanh_thu on  dayofweek(temp_doanh_thu.dateCreated) - 1 = temp_time_thu.thu
      group by  temp_time_thu.thu
      order by  temp_time_thu.thu asc ;  
        
        end if;
        
        
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_update_all_warehouseCheckProducts` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_update_all_warehouseCheckProducts`(
 -- in in_warehouseCheckProducts bigint
)
BEGIN
   
    set sql_safe_updates = 0;
	UPDATE `warehouseCheckProducts` SET `stockQuantity` =(select fn_warehouseCheckProducts_quantity_check(warehouseCheckProducts.id)) WHERE (`checkStatus` = 0 );
    
	UPDATE `warehouseCheckProducts` SET 
      `changeNumber` = actualQuantity - stockQuantity ,  checkStatus  = 1  
     WHERE (`checkStatus` = 0 );



   
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_update_currentDebt` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_update_currentDebt`(
  in_warehouseInOutId bigint,
  in_receiptsId  bigint,
  in_productReturnsId  bigint,
  in_billsId bigint,
  in_customersId bigint,
  in_suppliersId bigint,
  in_debt double
)
BEGIN
    if(in_warehouseInOutId > 0) then
      UPDATE `warehouseInOut` SET `currentDebt` = (select  debt from  customers where id =  in_customersId) + in_debt WHERE (`id` = in_warehouseInOutId);
	elseif (in_receiptsId > 0) then
      UPDATE `receipts` SET `currentDebt` = (select  debt from  customers where id =  in_customersId) + in_debt WHERE (`id` = in_receiptsId);
    elseif (in_productReturnsId > 0) then
      UPDATE `productReturns` SET `currentDebt` = (select  debt from  customers where id =  in_customersId) + in_debt WHERE (`id` = in_productReturnsId);
	elseif(in_billsId > 0) then

		if (in_customersId > 0) then
		  UPDATE `bills` SET `currentDebt` = (select  debt from  customers where id =  in_customersId) + in_debt WHERE (`id` = in_billsId);
		end if;
	end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_update_customers_debt` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_update_customers_debt`(
  in_customersId bigint,
  in_debt  double
)
BEGIN
      UPDATE `customers` SET `debt` = `debt` + in_debt WHERE (`id` = in_customersId);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_update_orderQuantity` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_update_orderQuantity`(
  in_branchesId  bigint,
  in_productsId bigint,
  in_quantity  double
)
BEGIN
  declare   cr_productsTotalInfoParrentId    bigint;
  declare exchangeValue_core  double;


  set sql_safe_updates = 0;
  
  -- lấy thông số
  
  
   set exchangeValue_core = (
                             select exchangeValue 
                              from products left join units on products.unitsId = units.id 
                              where products.id = in_productsId
							 ) ;


   -- cr_productsTotalInfoParrentId : get cấp cao nhất của productsTotalInfo     
    set cr_productsTotalInfoParrentId = (
			select productsTotalInfo.id
			from productsTotalInfo 
			where productsTotalInfo.productsId = in_productsId 
            and productsTotalInfo.branchesId = in_branchesId
		);     
  

    
	-- cập nhật quantity cho cấp cao nhất tổng quan sản phẩm
    UPDATE `productsTotalInfo` SET `orderQuantity` = round(orderQuantity +  in_quantity * exchangeValue_core / 
                                              (select ifnull(exchangeValue,1) from products
												left join units on units.id = products.unitsId
												where products.id = productsTotalInfo.productsId
                                              ),2)
    WHERE (`productsTotalInfo`.id = cr_productsTotalInfoParrentId );


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_update_orders_amountPaid` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_update_orders_amountPaid`(
  in_ordersId bigint,
  in_amountPaid  double
)
BEGIN
      UPDATE `orders` SET `amountPaid` = `amountPaid` + in_amountPaid WHERE (`id` = in_ordersId);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_update_priceListProducts` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_update_priceListProducts`(
  in_priceListId bigint
)
BEGIN
	declare currentpriceType , currentpricelistId,currentpercentChangeValue,currentvndChangeValue ,cr_branchesId double;
    declare cong_thuc ,gia_tri_goc varchar(200);
    
    select priceType, pricelistId,percentChangeValue,vndChangeValue,branchesId into currentpriceType , currentpricelistId,currentpercentChangeValue,currentvndChangeValue,cr_branchesId from pricelist where id = in_priceListId;

   set sql_safe_updates = 0;

    if(currentpriceType = 1 or currentpriceType = 2) then
  
      if (currentpriceType = 1) then set gia_tri_goc = 'ifnull(importPrice,0)' ;
      elseif(currentpriceType = 2) then set gia_tri_goc = 'lastInPrice' ;
	  elseif(currentpriceType = 3) then set gia_tri_goc = 'salePrice' ;
      end if;
      
	set cong_thuc = concat('round((',gia_tri_goc,'+ ',currentvndChangeValue,') * (',currentpercentChangeValue,' + 1 ))');
   --  select cong_thuc;
    
    
   	set @SQLStatement1=concat('
     INSERT INTO priceListProducts (productsId,pricelistId,`value` )
		SELECT  products.id as productsId, ',in_priceListId,' as pricelistId ,',cong_thuc,' as `value`
		FROM    products 
        left join productsTotalInfo on productsTotalInfo.productsId = products.id
        and productsTotalInfo.branchesId = ',cr_branchesId ,'
        
        '
	);
    
    DELETE FROM `priceListProducts` WHERE (`pricelistId` = in_priceListId);

	select @SQLStatement1;

   	PREPARE stmt1 FROM @SQLStatement1;
    EXECUTE stmt1;

    elseif (isnull(currentpriceType)   && currentpricelistId >0 )
    then
    
           set gia_tri_goc = 'currentValue' ;
      	   set cong_thuc = concat('round((',gia_tri_goc,'+ ',currentvndChangeValue,') * (',currentpercentChangeValue,' + 1 ))');
			set @SQLStatement1=concat('
			 INSERT INTO priceListProducts (productsId,pricelistId,`value` )
				SELECT   productsId, ',in_priceListId,' as pricelistId ,',cong_thuc,' as `value`
				FROM    
                 (select products.id as  productsId , ifnull(value,0) as currentValue
                   from products
                   left join priceListProducts on priceListProducts.productsId = products.id and pricelistId = ',currentpricelistId,'
                 ) t
                '
			);
             DELETE FROM `priceListProducts` WHERE (`pricelistId` = in_priceListId);
			PREPARE stmt1 FROM @SQLStatement1;
			EXECUTE stmt1;
    end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_update_priceListProducts_gia_hien_tai` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_update_priceListProducts_gia_hien_tai`(
  in_priceListId bigint,
  currentvndChangeValue double,
  currentpercentChangeValue double
)
BEGIN
    declare cong_thuc ,gia_tri_goc varchar(200);
    
   set sql_safe_updates = 0;

   
   
      
	set cong_thuc = concat('round(( value + ',currentvndChangeValue,') * (',currentpercentChangeValue,' + 1 ))');


   	set @SQLStatement1=concat('
   	 UPDATE priceListProducts SET value = ',cong_thuc,'  WHERE (pricelistId = ',in_priceListId,');
	');
    
    
	select @SQLStatement1;

    	PREPARE stmt1 FROM @SQLStatement1;
     EXECUTE stmt1;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_update_priceListProducts_newProduct` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_update_priceListProducts_newProduct`(
  in_priceListId bigint
)
BEGIN
	declare currentpriceType , currentpricelistId,currentpercentChangeValue,currentvndChangeValue,cr_branchesId double;
    declare cong_thuc ,gia_tri_goc varchar(200);
    
    select priceType, pricelistId,percentChangeValue,vndChangeValue,branchesId
    into currentpriceType , currentpricelistId,currentpercentChangeValue,currentvndChangeValue,cr_branchesId from pricelist where id = in_priceListId;

   set sql_safe_updates = 0;

  if(currentpriceType = -1 ) then
      INSERT INTO priceListProducts (productsId,pricelistId,`value` )
      SELECT  id as productsId, in_priceListId as pricelistId ,salePrice as `value`
		FROM    products
		 where	not exists(select id from  priceListProducts 
			   where priceListProducts.productsId = products.id
			   and priceListProducts.pricelistId =in_priceListId
			);
        
 elseif(currentpriceType = 1 or currentpriceType = 2 or currentpriceType = 3) then

	  if (currentpriceType = 1) then set gia_tri_goc = 'ifnull(importPrice,0)' ;
      elseif(currentpriceType = 2) then set gia_tri_goc = 'lastInPrice' ;
	  elseif(currentpriceType = 3) then set gia_tri_goc = 'salePrice' ;
      end if;
      
	set cong_thuc = concat('round((',gia_tri_goc,'+ ',currentvndChangeValue,') * (',currentpercentChangeValue,' + 1 ))');
   --  select cong_thuc;
    
    
   	set @SQLStatement1=concat('
     INSERT INTO priceListProducts (productsId,pricelistId,`value` )
		SELECT  products.id as productsId, ',in_priceListId,' as pricelistId ,',cong_thuc,' as `value`
		FROM    products  
        left join productsTotalInfo on productsTotalInfo.productsId = products.id
        and productsTotalInfo.branchesId = ',cr_branchesId ,'
		 where	not exists(select id from  priceListProducts 
			   where priceListProducts.productsId = products.id
			   and priceListProducts.pricelistId = ',in_priceListId,'
			)
        '
	);
    


   	PREPARE stmt1 FROM @SQLStatement1;
    EXECUTE stmt1;

  elseif (isnull(currentpriceType)   && currentpricelistId >0 )
    then
    
           set gia_tri_goc = 'currentValue' ;
      	   set cong_thuc = concat('round((',gia_tri_goc,'+ ',currentvndChangeValue,') * (',currentpercentChangeValue,' + 1 ))');
			set @SQLStatement1=concat('
			 INSERT INTO priceListProducts (productsId,pricelistId,`value` )
				SELECT   productsId, ',in_priceListId,' as pricelistId ,',cong_thuc,' as `value`
				FROM    
                 (select products.id as  productsId , ifnull(value,0) as currentValue
                   from products
                   left join priceListProducts on priceListProducts.productsId = products.id and pricelistId = ',currentpricelistId,'
							where	not exists(select id from  priceListProducts 
					   where priceListProducts.productsId = products.id
					   and priceListProducts.pricelistId = ',in_priceListId,'
					)
                 ) t
                '
			);
         
			PREPARE stmt1 FROM @SQLStatement1;
			EXECUTE stmt1;
    end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_update_priceListProducts_oneProduct` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_update_priceListProducts_oneProduct`(
  in_priceListId bigint,
  in_productsId bigint
)
BEGIN
	declare currentpriceType , currentpricelistId,currentpercentChangeValue,currentvndChangeValue,cr_branchesId double;
    declare cong_thuc ,gia_tri_goc varchar(200);
    
    select priceType, pricelistId,percentChangeValue,vndChangeValue,branchesId into currentpriceType , currentpricelistId,currentpercentChangeValue,currentvndChangeValue,cr_branchesId from pricelist where id = in_priceListId;

   set sql_safe_updates = 0;

    if(currentpriceType = 1 or currentpriceType = 2 or currentpriceType = 3) then

	  if (currentpriceType = 1) then set gia_tri_goc = 'ifnull(importPrice,0)' ;
		  elseif(currentpriceType = 2) then set gia_tri_goc = 'lastInPrice' ;
		  elseif(currentpriceType = 3) then set gia_tri_goc = 'salePrice' ;
      end if;
      
	set cong_thuc = concat('round((',gia_tri_goc,'+ ',currentvndChangeValue,') * (',currentpercentChangeValue,' + 1 ))');
   --  select cong_thuc;
    
    
   	set @SQLStatement1=concat('
     INSERT INTO priceListProducts (productsId,pricelistId,`value` )
		SELECT  products.id as productsId, ',in_priceListId,' as pricelistId ,',cong_thuc,' as `value`
		FROM    products
          left join productsTotalInfo on productsTotalInfo.productsId = products.id
        and productsTotalInfo.branchesId = ',cr_branchesId ,'
		where  products.id = ',in_productsId
        
	);
    
    DELETE FROM `priceListProducts` WHERE  (`productsId` = in_productsId);



   	PREPARE stmt1 FROM @SQLStatement1;
    EXECUTE stmt1;

      elseif (isnull(currentpriceType)   && currentpricelistId >0 )
    then
    
   set gia_tri_goc = 'currentValue' ;
      	   set cong_thuc = concat('((',gia_tri_goc,'+ ',currentvndChangeValue,') * (',currentpercentChangeValue,' + 1 ))');
			set @SQLStatement1=concat('
			 INSERT INTO priceListProducts (productsId,pricelistId,`value` )
				SELECT   productsId, ',in_priceListId,' as pricelistId ,',cong_thuc,' as `value`
				FROM    
                 (select products.id as  productsId , ifnull(value,0) as currentValue
                   from products
                   left join priceListProducts on priceListProducts.productsId = products.id and pricelistId = ',currentpricelistId,'
						where  products.id = ',in_productsId,'
					)t
                '
			);
            
		 	DELETE FROM `priceListProducts` WHERE (`productsId` = in_productsId and priceListId = in_priceListId);
       
			PREPARE stmt1 FROM @SQLStatement1;
			EXECUTE stmt1;
      	  
    end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_update_productReturns_amountPaid` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_update_productReturns_amountPaid`(
  in_productReturnsId bigint,
  in_amountPaid  double
)
BEGIN
      UPDATE `productReturns` SET `amountPaid` = `amountPaid` + in_amountPaid WHERE (`id` = in_productReturnsId);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_update_products_importPrice_v1` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_update_products_importPrice_v1`(
  in_productsBatchsId bigint,
  in_productsId bigint,
  in_quantity  double,
  in_dealPrice double

)
BEGIN
-- dùng khi trả hàng nhập
	declare currentProductsId,currentProductsTotalInfo ,current_branchesId bigint;
	declare currentExchangeValue, coreQuantity  double default 1;


			select if(
					products.parentId > 0,
					products.parentId,
					in_productsId
				) ,
                 ifnull(exchangeValue,1)
                into currentProductsId , currentExchangeValue
			from products
            left join units on units.id = products.unitsId
			where products.id = in_productsId  ;

 
  set  current_branchesId = (select branchesId from productsBatchs  where productsBatchs.id = in_productsBatchsId );
  set currentProductsTotalInfo = (select id from productsTotalInfo where branchesId = current_branchesId and  productsId = currentProductsId);
  set coreQuantity =     in_quantity * ( select   ifnull(exchangeValue,1) from products left join units on units.id = products.unitsId where products.id = in_productsId ) ;


  if(currentProductsTotalInfo > 0) then  
	
			UPDATE `productsTotalInfo` SET
             `importPrice` =  if((quantityOutIn + coreQuantity/( select   ifnull(exchangeValue,1) from products as a left join units on units.id = a.unitsId where productsTotalInfo.productsId = a.id ) )   =0,importPrice, round( ( totalImportPriceOutIn + in_quantity*in_dealPrice)/(quantityOutIn + coreQuantity/( select   ifnull(exchangeValue,1) from products as a left join units on units.id = a.unitsId where productsTotalInfo.productsId = a.id ) ) ,2)  )  ,
              quantity = (quantity + coreQuantity/( select   ifnull(exchangeValue,1) from products as a left join units on units.id = a.unitsId where productsTotalInfo.productsId = a.id )),
			  quantityOutIn = (quantityOutIn + coreQuantity/( select   ifnull(exchangeValue,1) from products as a left join units on units.id = a.unitsId where productsTotalInfo.productsId = a.id )),
			  totalImportPriceOutIn = totalImportPriceOutIn  + in_quantity*in_dealPrice
			WHERE (`id` = currentProductsTotalInfo  );
		
		   select importPrice * currentExchangeValue as importPrice,quantity from productsTotalInfo where productsId = currentProductsId and branchesId = current_branchesId;

	
   else 
	  
		   select 0 as importPrice, -1 as quantity ;
   end if;
   
   
   
   
	if(in_productsBatchsId > 0) then  
		UPDATE `productsBatchs` SET
              quantity = (quantity + coreQuantity/( select   ifnull(exchangeValue,1) from products as a left join units on units.id = a.unitsId where productsId = a.id ))
			WHERE (`id` = in_productsBatchsId  );
		select id,quantity  from productsBatchs where `id` = in_productsBatchsId ;

	else
          select 0 as id, -1 as quantity ;
   end if;
   
 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_update_products_importPrice_v2` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_update_products_importPrice_v2`(
  in_branchesId bigint,
  in_productsId bigint,
  in_quantity  double,
  in_dealPrice double,
  in_productsBatchsCode varchar(200),
  in_manufactureDate datetime,
  in_expirationDate datetime,
   in_customersId bigint

)
BEGIN
-- dùng khi nhập hàng
	declare currentProductsId,currentProductsTotalInfo ,cr_productsBatchsId bigint;
	declare currentExchangeValue, coreQuantity  double default 1;


			select if(
					products.parentId > 0,
					products.parentId,
					in_productsId
				) ,
                 ifnull(exchangeValue,1)
                into currentProductsId , currentExchangeValue
			from products
            left join units on units.id = products.unitsId
			where products.id = in_productsId  ;

 
 
  set currentProductsTotalInfo = (select id from productsTotalInfo where branchesId = in_branchesId and  productsId = currentProductsId);
  
  set  cr_productsBatchsId = (select id from productsBatchs 
  where 
     productsId = currentProductsId and branchesId = in_branchesId
     and  ( ( isnull(in_productsBatchsCode)   and isnull(productsBatchsCode)  )
       or ( isnull(in_productsBatchsCode)  <> 1  
              and  productsBatchsCode  = in_productsBatchsCode
                and   productsBatchs.customersId = in_customersId
			)
     )
     limit 1 
     );


   set coreQuantity =     in_quantity * ( select   ifnull(exchangeValue,1) from products left join units on units.id = products.unitsId where products.id = in_productsId ) ;

  if(currentProductsTotalInfo > 0) then  
		
	
			UPDATE `productsTotalInfo` SET
                 `importPrice` =  if((quantity + coreQuantity/( select   ifnull(exchangeValue,1) from products as a left join units on units.id = a.unitsId where productsTotalInfo.productsId = a.id ))   =0,importPrice, round( ( quantity*importPrice + in_quantity*in_dealPrice)/(quantity + coreQuantity/( select   ifnull(exchangeValue,1) from products as a left join units on units.id = a.unitsId where productsTotalInfo.productsId = a.id ) ) ,2) )  ,

              quantity = (quantity + coreQuantity/( select   ifnull(exchangeValue,1) from products as a left join units on units.id = a.unitsId where productsTotalInfo.productsId = a.id )),
			  quantityOutIn = (quantityOutIn + coreQuantity/( select   ifnull(exchangeValue,1) from products as a left join units on units.id = a.unitsId where productsTotalInfo.productsId = a.id )),
			  totalImportPriceOutIn = totalImportPriceOutIn + + in_quantity*in_dealPrice
			WHERE (`id` = currentProductsTotalInfo  );
		   
  
		   select importPrice * currentExchangeValue as importPrice,quantity from productsTotalInfo where productsId = currentProductsId and branchesId = in_branchesId;
           
   else 
		INSERT INTO `productsTotalInfo`
          (`branchesId`, `productsId`, `quantity`, `quantitySold`, `quantityOutIn`, `totalImportPriceOutIn`, `importPrice`, `orderQuantity`) 
           VALUES (in_branchesId, currentProductsId , coreQuantity, '0', coreQuantity,  in_quantity*in_dealPrice,  in_quantity*in_dealPrice/coreQuantity, '0');

		select importPrice * currentExchangeValue as importPrice,quantity  from productsTotalInfo where productsId = currentProductsId and branchesId = in_branchesId;

   end if;
   
   
   
   
	if(cr_productsBatchsId > 0) then  
		UPDATE `productsBatchs` SET
              quantity = (quantity + coreQuantity/( select   ifnull(exchangeValue,1) from products as a left join units on units.id = a.unitsId where productsId = a.id ))
			WHERE (`id` = cr_productsBatchsId  );
		select id,quantity  from productsBatchs where `id` = cr_productsBatchsId ;

	else 

        INSERT INTO `productsBatchs` 
        (`branchesId`, `productsId`, `manufactureDate`, `expirationDate`, `quantity`, `productsBatchsCode`, `customersId`) 
		VALUES (in_branchesId, currentProductsId ,in_manufactureDate,in_expirationDate, coreQuantity, in_productsBatchsCode, if( isnull(in_productsBatchsCode),0, in_customersId));
        
		select id, quantity  from productsBatchs 
         where   productsId = currentProductsId and branchesId = in_branchesId
           order by id desc limit 1;
        
        
   end if;
   
 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_update_products_lastInPrice` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_update_products_lastInPrice`(
  in_productsId bigint,
  in_dealPrice double,
  in_lastInDate varchar(200)
)
BEGIN
 
    
   declare sp_parrentId bigint;
  declare exchangeValue_core double;


  set sql_safe_updates = 0;
  set sp_parrentId = (select parentId from products WHERE (`id` = in_productsId));

  if(sp_parrentId= 0) then
    UPDATE `products` SET  lastInPrice =  if(in_lastInDate > lastInDate, in_dealPrice,lastInPrice )                
				 		   ,lastInDate =  if(lastInDate < in_lastInDate  , in_lastInDate,lastInDate ) 
    WHERE (`id` = in_productsId);
    

    UPDATE `products` SET 
							 lastInPrice =  if(in_lastInDate > lastInDate ,in_dealPrice * (select exchangeValue from units where units.id = products.unitsId) , in_dealPrice )   ,             
						     lastInDate =  if(in_lastInDate > lastInDate, in_lastInDate,lastInDate ) 
    WHERE (`parentId` = in_productsId);
   

  else

   set exchangeValue_core =   (select exchangeValue from units where units.id = (select unitsId from products where products.id = in_productsId )) ;
    UPDATE `products` SET   lastInPrice =  if(in_lastInDate > lastInDate, in_dealPrice / exchangeValue_core,lastInPrice )   ,             
						    lastInDate =  if(in_lastInDate > lastInDate, in_lastInDate,lastInDate ) 
    
    WHERE (`id` = sp_parrentId);

    UPDATE `products` SET    
							lastInPrice =  if(in_lastInDate > lastInDate, in_dealPrice *  (select exchangeValue from units where units.id = products.unitsId) / exchangeValue_core,lastInPrice )   ,             
						    lastInDate =  if(in_lastInDate > lastInDate, in_lastInDate,lastInDate ) 
    WHERE (`parentId` = sp_parrentId);
 
  end if;
      
    
     
     
      
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_update_products_quantity` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_update_products_quantity`(
  in_productsBatchsId bigint,
  in_quantity  double
)
BEGIN
  declare  cr_productsTotalInfoParrentId ,cr_productsId , cr_branchesId ,cr_productsParentId bigint;
  declare exchangeValue_core  double;


  set sql_safe_updates = 0;
  
  -- lấy thông số
  select branchesId,
		productsId,products.parentId,
         ifnull(exchangeValue,1)
    into cr_branchesId,cr_productsId,cr_productsParentId,exchangeValue_core
  from productsBatchs 
	   inner join products on productsBatchs.productsId  = products.id 
       left join units on units.id = products.unitsId
	    WHERE (productsBatchs.`id` = in_productsBatchsId)
        ;
  
  -- cr_productsParentId : get cấp cao nhất của products
	set cr_productsParentId = (
			select if(
					products.parentId > 0,
					products.parentId,
					products.id
				)
			from products
			where products.id = cr_productsId
		);
        
   -- cr_productsTotalInfoParrentId : get cấp cao nhất của productsTotalInfo     
   	set cr_productsTotalInfoParrentId = (
			select productsTotalInfo.id
			from productsTotalInfo 
			where productsTotalInfo.productsId = cr_productsId 
            and productsTotalInfo.branchesId = cr_branchesId
		);     
  
  -- cập nhật quantity cho cấp cao nhất trong lô
	UPDATE `productsBatchs` SET `quantity` = round(quantity +  in_quantity * exchangeValue_core / 
                                              (select ifnull(exchangeValue,1) from products
												left join units on units.id = products.unitsId
												where products.id = productsBatchs.productsId
                                              ),2)
    WHERE (productsBatchs.`id` = in_productsBatchsId);
    
   

    select quantity,productsId from productsBatchs  WHERE (productsBatchs.`id` = in_productsBatchsId);
    
	-- cập nhật quantity cho cấp cao nhất tổng quan sản phẩm
    UPDATE `productsTotalInfo` SET `quantity` = round(quantity +  in_quantity * exchangeValue_core / 
                                              (select ifnull(exchangeValue,1) from products
												left join units on units.id = products.unitsId
												where products.id = productsTotalInfo.productsId
                                              ),2)
    WHERE (`productsTotalInfo`.id = cr_productsTotalInfoParrentId );
    
     select quantity from productsTotalInfo  WHERE (`productsTotalInfo`.id = cr_productsTotalInfoParrentId );

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_update_products_quantitySold` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_update_products_quantitySold`(
  in_productsBatchsId bigint,
  in_quantity  double
)
BEGIN
  declare cr_productsBatchsParrentId , cr_productsTotalInfoParrentId ,cr_productsId , cr_branchesId  bigint;
  declare exchangeValue_core  double;


  set sql_safe_updates = 0;
  
  -- lấy thông số
  select branchesId, productsBatchs.id,
		productsId,
         ifnull(exchangeValue,1)
    into cr_branchesId,cr_productsBatchsParrentId,cr_productsId,exchangeValue_core
  from productsBatchs 
	   inner join products on productsBatchs.productsId  = products.id 
       left join units on units.id = products.unitsId
	    WHERE (productsBatchs.`id` = in_productsBatchsId)
        ;
  

        
   -- cr_productsTotalInfoParrentId : get cấp cao nhất của productsTotalInfo     
   	set cr_productsTotalInfoParrentId = (
			select productsTotalInfo.id
			from productsTotalInfo 
			where productsTotalInfo.productsId = cr_productsId 
            and productsTotalInfo.branchesId = cr_branchesId
		);     
  
  -- cập nhật quantity cho cấp cao nhất trong lô
	UPDATE `productsBatchs` SET `quantity` = round(quantity +  in_quantity * exchangeValue_core / 
                                              (select ifnull(exchangeValue,1) from products
												left join units on units.id = products.unitsId
												where products.id = productsBatchs.productsId
                                              ),2)
    WHERE (productsBatchs.`id` = cr_productsBatchsParrentId);
    
   

    select quantity,productsId from productsBatchs  WHERE (productsBatchs.`id` = cr_productsBatchsParrentId);
    
	-- cập nhật quantity cho cấp cao nhất tổng quan sản phẩm
    UPDATE `productsTotalInfo` SET `quantity` = round(quantity +  in_quantity * exchangeValue_core / 
                                              (select ifnull(exchangeValue,1) from products
												left join units on units.id = products.unitsId
												where products.id = productsTotalInfo.productsId
                                              ),2),
                                    `quantitySold` = round(quantitySold -  in_quantity * exchangeValue_core / 
                                              (select ifnull(exchangeValue,1) from products
												left join units on units.id = products.unitsId
												where products.id = productsTotalInfo.productsId
                                              ),2)          
    WHERE (`productsTotalInfo`.id = cr_productsTotalInfoParrentId );
    
     select quantity,importPrice from productsTotalInfo  WHERE (`productsTotalInfo`.id = cr_productsTotalInfoParrentId );

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_update_receiptsProducts_returnAmount` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_update_receiptsProducts_returnAmount`(
  in_productsBatchsId bigint,
  in_receiptsId bigint,
  in_productsId bigint,
  in_returnAmount double
)
BEGIN

  declare  core_productsTotalInfoId  ,core_productsId ,cr_branchesId bigint;
  declare cr_exchangeValue , receipts_exchangeValue , core_importPrice  double;

  set sql_safe_updates = 0;
  
  

  -- lấy thông số
     select 
		receipts.branchesId, 
        productsBatchs.productsId,
        ifnull(exchangeValue,1) 
    into cr_branchesId,  
        core_productsId,
         receipts_exchangeValue
    
      from receipts
       inner join receiptsProducts on receiptsProducts.receiptsId = in_receiptsId 
                                    and receiptsProducts.productsBatchsId = in_productsBatchsId
	   inner join productsBatchs on productsBatchs.id  = receiptsProducts.productsBatchsId 

       inner join products on  products.id = receiptsProducts.productsId    
          	left join units on units.id = products.unitsId
            where receipts.id = in_receiptsId
       ;
	
	set cr_exchangeValue =(	select 
				 ifnull(exchangeValue,1)
			from products
			left join units on units.id = products.unitsId
			where products.id = in_productsId  
             and     (  products.id  = core_productsId
                  or products.parentId = core_productsId
                )
		  );
  --
  
   	
    
			select productsTotalInfo.id ,importPrice
             into core_productsTotalInfoId,core_importPrice
			from productsTotalInfo 
			where productsTotalInfo.productsId = core_productsId 
            and productsTotalInfo.branchesId = cr_branchesId ;
 
    

  
  
  -- cập nhật quantity cho cấp cao nhất trong lô
  if(cr_exchangeValue>0 ) 
  then   
		UPDATE `receiptsProducts` SET `returnAmount` =returnAmount + in_returnAmount*cr_exchangeValue/receipts_exchangeValue     WHERE (`receiptsId` = in_receiptsId and `productsBatchsId` = in_productsBatchsId);

		UPDATE `productsBatchs` SET `quantity` = round(quantity +  in_returnAmount * cr_exchangeValue ,2)
		     WHERE (productsBatchs.`id` = in_productsBatchsId);
		
		
		-- cập nhật quantity cho cấp cao nhất tổng quan sản phẩm
		UPDATE `productsTotalInfo` SET `quantity` = round(quantity +  in_returnAmount * cr_exchangeValue ,2),
										`quantitySold` = round(quantitySold -  in_returnAmount * cr_exchangeValue ,2)       
		WHERE (`productsTotalInfo`.id = core_productsTotalInfoId );
		
		select 1 as `check`  ,   returnAmount,amount from receiptsProducts    WHERE (`receiptsId` = in_receiptsId and `productsBatchsId` = in_productsBatchsId);
        
        select  (core_importPrice *cr_exchangeValue )as  importPrice ;
   
   else 
	select -1 as `check`;
   end if;

      
      
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_update_receipts_amountPaid` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_update_receipts_amountPaid`(
  in_receiptsId bigint,
  in_amountPaid  double
)
BEGIN
      UPDATE `receipts` SET `amountPaid` = `amountPaid` + in_amountPaid WHERE (`id` = in_receiptsId);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_update_receipts_debt` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_update_receipts_debt`(
  in_receiptsId bigint,
  in_amountPaid  double
)
BEGIN
      UPDATE `suppliers` SET `amountPaid` = `amountPaid` + in_amountPaid WHERE (`id` = in_receiptsId);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_update_warehouseIn_amountPaid` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_update_warehouseIn_amountPaid`(
  in_warehouseInId bigint,
  in_amountPaid  double
)
BEGIN
      UPDATE `warehouseIn` SET `amountPaid` = `amountPaid` + in_amountPaid WHERE (`id` = in_warehouseInId);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_update_warehouseOut_amountPaid` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_update_warehouseOut_amountPaid`(
  in_warehouseOutId bigint,
  in_amountPaid  double
)
BEGIN
      UPDATE `warehouseOut` SET `amountPaid` = `amountPaid` + in_amountPaid WHERE (`id` = in_warehouseOutId);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_warehouseCheck_get_list` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_warehouseCheck_get_list`(
    in in_branchesId bigint,
    in in_warehouseCheckCode varchar(200) COLLATE utf8mb3_unicode_ci,
     in in_productsSearch varchar(200),
    in in_productsCode varchar(200) COLLATE utf8mb3_unicode_ci,
    in in_productsName  varchar(200) COLLATE utf8mb3_unicode_ci, 
	in in_usersCreatorId int,
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
    
	SET @row_number = 0;



    set @sql0 = concat ('
	 SELECT
		warehouseCheck.*,
		 json_object("id",usersCreator.id,"username",usersCreator.username,"fullname",usersCreator.fullname )usersCreator,
         sum(case when changeNumber >0 then changeNumber else 0 end) as `SL_tang`,
		 sum(case when changeNumber < 0 then changeNumber * -1 else 0 end) as `SL_giam`,
         sum(changeNumber) as changeNumber,
         sum(totalValue) as totalValue,
         sum(stockQuantity) as stockQuantity,
         sum(actualQuantity) as actualQuantity
		FROM
			`warehouseCheck` AS `warehouseCheck`
            left join 	`warehouseCheckProducts` AS `warehouseCheckProducts` on `warehouseCheckProducts`.warehouseCheckId = warehouseCheck.id
			INNER JOIN
			`users` AS `usersCreator` ON `warehouseCheck`.`usersCreatorId` = `usersCreator`.`id`
		 WHERE 
             1
             ',
			  if(in_warehouseCheckCode <> '',concat(' and lower(warehouseCheck.warehouseCheckCode) like  concat("%",CONVERT(lower("',in_warehouseCheckCode,'"), BINARY),"%")'),' '),
			 if(in_productsName <> '' and in_productsCode <> '' or in_productsSearch <>'' ,concat(' and fn_warehouseCheckProducts_prodcuts(warehouseCheck.id,"',in_productsSearch,'","',in_productsName,'","',in_productsCode,'") = 1'), ' '),

			 if(in_usersCreatorId <> 0,concat(' and ( warehouseCheck.usersCreatorId = ',in_usersCreatorId,')'), ' '),
			 if(in_status <> -99,concat('  and warehouseCheck.status = ',in_status),' '),
			 if(in_FromDate <> '' ,concat(' and warehouseCheck.staticDay >= "',date_format(in_FromDate,'%Y%m%d'),'"'),''),
	         if(in_ToDate <> '' ,concat(' and warehouseCheck.staticDay < "',date_format(in_ToDate,'%Y%m%d'),'" + INTERVAL 1 DAY'),'')
             ,'
               
				group by warehouseCheck.id
    
				order by warehouseCheck.',in_orderBy,' ',in_order,'
				limit ',in_start_page,',', in_end_page
			);



 
   	PREPARE stmt1 FROM  @sql0;
	EXECUTE stmt1;
    
       set @sql1 = concat ('
        select
        
          count(id) as count,
           ifnull(sum(SL_tang),0) as SL_tang, 
           ifnull(sum(SL_giam),0)  as SL_giam ,
           ifnull(sum(changeNumber),0)  as changeNumber ,
           ifnull(sum(totalValue),0)  as totalValue,
           ifnull(sum(stockQuantity),0)  as stockQuantity,ifnull(sum(actualQuantity),0)  as actualQuantity  
           from (
	 SELECT
		warehouseCheck.id,

         sum(case when changeNumber >0 then changeNumber else 0 end) as `SL_tang`,
		 sum(case when changeNumber < 0 then changeNumber * -1 else 0 end) as `SL_giam`,
         sum(changeNumber) as changeNumber,
         sum(totalValue) as totalValue,
         sum(stockQuantity) as stockQuantity,
         sum(actualQuantity) as actualQuantity
		FROM
			`warehouseCheck` AS `warehouseCheck`
            left join 	`warehouseCheckProducts` AS `warehouseCheckProducts` on `warehouseCheckProducts`.warehouseCheckId = warehouseCheck.id
			INNER JOIN
			`users` AS `usersCreator` ON `warehouseCheck`.`usersCreatorId` = `usersCreator`.`id`
		 WHERE 
             1
             ',
			  if(in_warehouseCheckCode <> '',concat(' and lower(warehouseCheck.warehouseCheckCode) like  concat("%",CONVERT(lower("',in_warehouseCheckCode,'"), BINARY),"%")'),' '),
			 if(in_productsName <> '' and in_productsCode <> '' or in_productsSearch <>'' ,concat(' and fn_warehouseCheckProducts_prodcuts(warehouseCheck.id,"',in_productsSearch,'","',in_productsName,'","',in_productsCode,'") = 1'), ' '),

			 if(in_usersCreatorId <> 0,concat(' and ( warehouseCheck.usersCreatorId = ',in_usersCreatorId,')'), ' '),
			 if(in_status <> -99,concat('  and warehouseCheck.status = ',in_status),' '),
			 if(in_FromDate <> '' ,concat(' and warehouseCheck.staticDay >= "',date_format(in_FromDate,'%Y%m%d'),'"'),''),
	         if(in_ToDate <> '' ,concat(' and warehouseCheck.staticDay < "',date_format(in_ToDate,'%Y%m%d'),'" + INTERVAL 1 DAY'),'')
             ,'
               
				group by warehouseCheck.id
    
			)t '
			);
      
   	PREPARE stmt2 FROM  @sql1;
	EXECUTE stmt2;
    

   --     select ifnull(sum(SL_tang),0) as SL_tang, ifnull(sum(SL_giam),0)  as SL_giam ,ifnull(sum(changeNumber),0)  as changeNumber ,ifnull(sum(totalValue),0)  as totalValue,ifnull(sum(stockQuantity),0)  as stockQuantity,ifnull(sum(actualQuantity),0)  as actualQuantity  from temp_list_warehouseCheck;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_warehouseInProducts_thong_ke` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_warehouseInProducts_thong_ke`(
    in in_branchesId bigint(20),
    in in_warehouseInCode varchar(200),
        in in_productsSearch varchar(200),
    in in_productsCode varchar(200),
    in in_productsName  varchar(200), 
	in in_customersId int,
	in in_usersCreatorId int,
    in in_status int, 
    in in_FromDate varchar(200),
	in in_ToDate varchar(200)
)
BEGIN

   SET @sql1 = concat('
	 SELECT
		 ifnull(sum(money),0) as money,
		 ifnull(sum(discount),0)as discount,
		 ifnull(sum(totalMoney),0) as totalMoney,
		 ifnull(sum(amountPaid),0) as amountPaid,
         ifnull(sum(amount),0) as totalAmount
         
	 FROM
       (select  warehouseIn.money, warehouseIn.discount ,warehouseIn.totalMoney ,warehouseIn.amountPaid,
	       sum(amount) as amount
         
		FROM
			`warehouseIn` AS `warehouseIn`
            inner join warehouseInProducts on  warehouseInProducts.warehouseInId = warehouseIn.id
		 WHERE 
                1
	
                ',
				if(in_productsCode <> ''  or in_productsName <> '' or in_productsSearch <> '' ,concat(' and fn_warehouseInProducts_prodcuts(warehouseIn.id,"',in_productsSearch,'","',in_productsName,'","',in_productsCode,'") = 1'),''),
				if(in_warehouseInCode <> '' ,concat(' and lower(warehouseIn.warehouseInCode) like  concat("%",CONVERT(lower("',in_warehouseInCode,'"), BINARY),"%")'),''),
                if(in_branchesId <> 0,concat(' and (warehouseIn.branchesId =  ',in_branchesId ,')'),''),
                if(in_customersId <> 0,concat(' and (warehouseIn.customersId =  ',in_customersId ,')'),''),
			    if(in_usersCreatorId <> 0,concat(' and (warehouseIn.usersCreatorId =  ',in_usersCreatorId ,')'),''),
			    if(in_status <> -99,concat(' and (warehouseIn.status =  ',in_status ,')'),''),
				 if(in_FromDate <> '' ,concat('and warehouseIn.staticDay >= "',in_FromDate,'" '),''),
				 if(in_ToDate <> '' ,concat('and warehouseIn.staticDay < "',in_ToDate,'" +  interval 1 day  '),'')
                ,'
              group by  warehouseIn.id
			)t;'
	);		


	PREPARE stmt1 FROM @sql1;
	EXECUTE stmt1;
                 
 select   @sql1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_warehouseOutProducts_thong_ke` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_warehouseOutProducts_thong_ke`(
    in in_branchesId bigint(20),
    in in_warehouseOutCode varchar(200),
      in in_productsSearch varchar(200),
    in in_productsCode varchar(200),
    in in_productsName  varchar(200), 
	in in_customersId int,
	in in_usersCreatorId int,
    in in_status int, 
    in in_FromDate varchar(200),
	in in_ToDate varchar(200)
)
BEGIN

   SET @sql1 = concat('
	 SELECT
		 ifnull(sum(money),0) as money,
		 ifnull(sum(discount),0)as discount,
		 ifnull(sum(totalMoney),0) as totalMoney,
		 ifnull(sum(amountPaid),0) as amountPaid,
         ifnull(sum(amount),0) as totalAmount
         
	 FROM
       (select  warehouseOut.money, warehouseOut.discount ,warehouseOut.totalMoney ,warehouseOut.amountPaid,
	       sum(amount) as amount
         
		FROM
			`warehouseOut` AS `warehouseOut`
            inner join warehouseOutProducts on  warehouseOutProducts.warehouseOutId = warehouseOut.id
		 WHERE 
                1
	
                ',
				if(in_productsCode <> ''  or in_productsName <> '' or in_productsSearch<>'' ,concat(' and fn_warehouseOutProducts_prodcuts(warehouseOut.id,"',in_productsSearch,'","',in_productsName,'","',in_productsCode,'") = 1'),''),
				if(in_warehouseOutCode <> '' ,concat(' and lower(warehouseOut.warehouseOutCode) like  concat("%",CONVERT(lower("',in_warehouseOutCode,'"), BINARY),"%")'),''),
                if(in_branchesId <> 0,concat(' and (warehouseOut.branchesId =  ',in_branchesId ,')'),''),
                if(in_customersId <> 0,concat(' and (warehouseOut.customersId =  ',in_customersId ,')'),''),
			    if(in_usersCreatorId <> 0,concat(' and (warehouseOut.usersCreatorId =  ',in_usersCreatorId ,')'),''),
			    if(in_status <> -99,concat(' and (warehouseOut.status =  ',in_status ,')'),''),
				 if(in_FromDate <> '' ,concat('and warehouseOut.staticDay >= "',in_FromDate,'" '),''),
				 if(in_ToDate <> '' ,concat('and warehouseOut.staticDay < "',in_ToDate,'" +  interval 1 day  '),'')
                ,'
              group by  warehouseOut.id
			)t;'
	);		


	PREPARE stmt1 FROM @sql1;
	EXECUTE stmt1;
                 

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

-- Dump completed on 2023-08-19 16:16:28
