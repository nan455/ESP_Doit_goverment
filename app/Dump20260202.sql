-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: esp_stg_db
-- ------------------------------------------------------
-- Server version	9.5.0

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
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ 'ede98bb9-f6bb-11f0-ada8-d4a2cda1756d:1-1326';

--
-- Table structure for table `error_logs`
--

DROP TABLE IF EXISTS `error_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `error_logs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(150) DEFAULT NULL,
  `endpoint` varchar(255) DEFAULT NULL,
  `error_message` text,
  `traceback` longtext,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_created_at` (`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=132 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `error_logs`
--

LOCK TABLES `error_logs` WRITE;
/*!40000 ALTER TABLE `error_logs` DISABLE KEYS */;
INSERT INTO `error_logs` VALUES (1,'admin','/templates','1054 (42S22): Unknown column \'updated_by\' in \'field list\'','Traceback (most recent call last):\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 772, in cmd_query\n    self._cmysql.query(\n    ~~~~~~~~~~~~~~~~~~^\n        query,\n        ^^^^^^\n    ...<3 lines>...\n        query_attrs=self.query_attrs,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n_mysql_connector.MySQLInterfaceError: Unknown column \'updated_by\' in \'field list\'\n\nThe above exception was the direct cause of the following exception:\n\nTraceback (most recent call last):\n  File \"D:\\Code final 2\\app\\utils\\database.py\", line 73, in wrapper\n    return func(cursor, conn, *args, **kwargs)\n  File \"D:\\Code final 2\\app\\routes\\admin.py\", line 121, in get_templates\n    cursor.execute(\n    ~~~~~~~~~~~~~~^\n        \"SELECT id, name, department, updated_by \"\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n        \"FROM excel_templates ORDER BY id DESC\"\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\cursor_cext.py\", line 353, in execute\n    self._connection.cmd_query(\n    ~~~~~~~~~~~~~~~~~~~~~~~~~~^\n        self._stmt_partition[\"mappable_stmt\"],\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    ...<2 lines>...\n        raw_as_string=self._raw_as_string,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\opentelemetry\\context_propagation.py\", line 97, in wrapper\n    return method(cnx, *args, **kwargs)\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 781, in cmd_query\n    raise get_mysql_exception(\n        err.errno, msg=err.msg, sqlstate=err.sqlstate\n    ) from err\nmysql.connector.errors.ProgrammingError: 1054 (42S22): Unknown column \'updated_by\' in \'field list\'\n','2026-01-27 11:26:11'),(2,'admin','/templates','1054 (42S22): Unknown column \'updated_by\' in \'field list\'','Traceback (most recent call last):\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 772, in cmd_query\n    self._cmysql.query(\n    ~~~~~~~~~~~~~~~~~~^\n        query,\n        ^^^^^^\n    ...<3 lines>...\n        query_attrs=self.query_attrs,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n_mysql_connector.MySQLInterfaceError: Unknown column \'updated_by\' in \'field list\'\n\nThe above exception was the direct cause of the following exception:\n\nTraceback (most recent call last):\n  File \"D:\\Code final 2\\app\\utils\\database.py\", line 73, in wrapper\n    return func(cursor, conn, *args, **kwargs)\n  File \"D:\\Code final 2\\app\\routes\\admin.py\", line 121, in get_templates\n    cursor.execute(\n    ~~~~~~~~~~~~~~^\n        \"SELECT id, name, department, updated_by \"\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n        \"FROM excel_templates ORDER BY id DESC\"\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\cursor_cext.py\", line 353, in execute\n    self._connection.cmd_query(\n    ~~~~~~~~~~~~~~~~~~~~~~~~~~^\n        self._stmt_partition[\"mappable_stmt\"],\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    ...<2 lines>...\n        raw_as_string=self._raw_as_string,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\opentelemetry\\context_propagation.py\", line 97, in wrapper\n    return method(cnx, *args, **kwargs)\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 781, in cmd_query\n    raise get_mysql_exception(\n        err.errno, msg=err.msg, sqlstate=err.sqlstate\n    ) from err\nmysql.connector.errors.ProgrammingError: 1054 (42S22): Unknown column \'updated_by\' in \'field list\'\n','2026-01-27 11:26:14'),(3,'admin','/templates','1054 (42S22): Unknown column \'updated_by\' in \'field list\'','Traceback (most recent call last):\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 772, in cmd_query\n    self._cmysql.query(\n    ~~~~~~~~~~~~~~~~~~^\n        query,\n        ^^^^^^\n    ...<3 lines>...\n        query_attrs=self.query_attrs,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n_mysql_connector.MySQLInterfaceError: Unknown column \'updated_by\' in \'field list\'\n\nThe above exception was the direct cause of the following exception:\n\nTraceback (most recent call last):\n  File \"D:\\Code final 2\\app\\utils\\database.py\", line 73, in wrapper\n    return func(cursor, conn, *args, **kwargs)\n  File \"D:\\Code final 2\\app\\routes\\admin.py\", line 121, in get_templates\n    cursor.execute(\n    ~~~~~~~~~~~~~~^\n        \"SELECT id, name, department, updated_by \"\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n        \"FROM excel_templates ORDER BY id DESC\"\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\cursor_cext.py\", line 353, in execute\n    self._connection.cmd_query(\n    ~~~~~~~~~~~~~~~~~~~~~~~~~~^\n        self._stmt_partition[\"mappable_stmt\"],\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    ...<2 lines>...\n        raw_as_string=self._raw_as_string,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\opentelemetry\\context_propagation.py\", line 97, in wrapper\n    return method(cnx, *args, **kwargs)\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 781, in cmd_query\n    raise get_mysql_exception(\n        err.errno, msg=err.msg, sqlstate=err.sqlstate\n    ) from err\nmysql.connector.errors.ProgrammingError: 1054 (42S22): Unknown column \'updated_by\' in \'field list\'\n','2026-01-27 11:28:39'),(4,'Nanda_AH','/templates','1054 (42S22): Unknown column \'updated_by\' in \'field list\'','Traceback (most recent call last):\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 772, in cmd_query\n    self._cmysql.query(\n    ~~~~~~~~~~~~~~~~~~^\n        query,\n        ^^^^^^\n    ...<3 lines>...\n        query_attrs=self.query_attrs,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n_mysql_connector.MySQLInterfaceError: Unknown column \'updated_by\' in \'field list\'\n\nThe above exception was the direct cause of the following exception:\n\nTraceback (most recent call last):\n  File \"D:\\Code final 2\\app\\utils\\database.py\", line 73, in wrapper\n    return func(cursor, conn, *args, **kwargs)\n  File \"D:\\Code final 2\\app\\routes\\admin.py\", line 121, in get_templates\n    cursor.execute(\n    ~~~~~~~~~~~~~~^\n        \"SELECT id, name, department, updated_by \"\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n        \"FROM excel_templates ORDER BY id DESC\"\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\cursor_cext.py\", line 353, in execute\n    self._connection.cmd_query(\n    ~~~~~~~~~~~~~~~~~~~~~~~~~~^\n        self._stmt_partition[\"mappable_stmt\"],\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    ...<2 lines>...\n        raw_as_string=self._raw_as_string,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\opentelemetry\\context_propagation.py\", line 97, in wrapper\n    return method(cnx, *args, **kwargs)\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 781, in cmd_query\n    raise get_mysql_exception(\n        err.errno, msg=err.msg, sqlstate=err.sqlstate\n    ) from err\nmysql.connector.errors.ProgrammingError: 1054 (42S22): Unknown column \'updated_by\' in \'field list\'\n','2026-01-27 11:36:12'),(5,'admin','/templates','1054 (42S22): Unknown column \'updated_by\' in \'field list\'','Traceback (most recent call last):\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 772, in cmd_query\n    self._cmysql.query(\n    ~~~~~~~~~~~~~~~~~~^\n        query,\n        ^^^^^^\n    ...<3 lines>...\n        query_attrs=self.query_attrs,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n_mysql_connector.MySQLInterfaceError: Unknown column \'updated_by\' in \'field list\'\n\nThe above exception was the direct cause of the following exception:\n\nTraceback (most recent call last):\n  File \"D:\\Code final 2\\app\\utils\\database.py\", line 73, in wrapper\n    return func(cursor, conn, *args, **kwargs)\n  File \"D:\\Code final 2\\app\\routes\\admin.py\", line 121, in get_templates\n    cursor.execute(\n    ~~~~~~~~~~~~~~^\n        \"SELECT id, name, department, updated_by \"\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n        \"FROM excel_templates ORDER BY id DESC\"\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\cursor_cext.py\", line 353, in execute\n    self._connection.cmd_query(\n    ~~~~~~~~~~~~~~~~~~~~~~~~~~^\n        self._stmt_partition[\"mappable_stmt\"],\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    ...<2 lines>...\n        raw_as_string=self._raw_as_string,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\opentelemetry\\context_propagation.py\", line 97, in wrapper\n    return method(cnx, *args, **kwargs)\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 781, in cmd_query\n    raise get_mysql_exception(\n        err.errno, msg=err.msg, sqlstate=err.sqlstate\n    ) from err\nmysql.connector.errors.ProgrammingError: 1054 (42S22): Unknown column \'updated_by\' in \'field list\'\n','2026-01-28 04:10:40'),(6,'approver_IT','/upload_transaction','1364 (HY000): Field \'livestock_id\' doesn\'t have a default value','Traceback (most recent call last):\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 772, in cmd_query\n    self._cmysql.query(\n    ~~~~~~~~~~~~~~~~~~^\n        query,\n        ^^^^^^\n    ...<3 lines>...\n        query_attrs=self.query_attrs,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n_mysql_connector.MySQLInterfaceError: Field \'livestock_id\' doesn\'t have a default value\n\nThe above exception was the direct cause of the following exception:\n\nTraceback (most recent call last):\n  File \"D:\\Code final 2\\app\\routes\\data.py\", line 191, in _process_upload_transaction\n    cursor.executemany(sql, values)\n    ~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\cursor_cext.py\", line 473, in executemany\n    return self.execute(cast(str, stmt))\n           ~~~~~~~~~~~~^^^^^^^^^^^^^^^^^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\cursor_cext.py\", line 353, in execute\n    self._connection.cmd_query(\n    ~~~~~~~~~~~~~~~~~~~~~~~~~~^\n        self._stmt_partition[\"mappable_stmt\"],\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    ...<2 lines>...\n        raw_as_string=self._raw_as_string,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\opentelemetry\\context_propagation.py\", line 97, in wrapper\n    return method(cnx, *args, **kwargs)\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 781, in cmd_query\n    raise get_mysql_exception(\n        err.errno, msg=err.msg, sqlstate=err.sqlstate\n    ) from err\nmysql.connector.errors.DatabaseError: 1364 (HY000): Field \'livestock_id\' doesn\'t have a default value\n','2026-01-28 04:43:59'),(7,'approver_IT','/templates','1054 (42S22): Unknown column \'updated_by\' in \'field list\'','Traceback (most recent call last):\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 772, in cmd_query\n    self._cmysql.query(\n    ~~~~~~~~~~~~~~~~~~^\n        query,\n        ^^^^^^\n    ...<3 lines>...\n        query_attrs=self.query_attrs,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n_mysql_connector.MySQLInterfaceError: Unknown column \'updated_by\' in \'field list\'\n\nThe above exception was the direct cause of the following exception:\n\nTraceback (most recent call last):\n  File \"D:\\Code final 2\\app\\utils\\database.py\", line 73, in wrapper\n    return func(cursor, conn, *args, **kwargs)\n  File \"D:\\Code final 2\\app\\routes\\admin.py\", line 121, in get_templates\n    cursor.execute(\n    ~~~~~~~~~~~~~~^\n        \"SELECT id, name, department, updated_by \"\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n        \"FROM excel_templates ORDER BY id DESC\"\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\cursor_cext.py\", line 353, in execute\n    self._connection.cmd_query(\n    ~~~~~~~~~~~~~~~~~~~~~~~~~~^\n        self._stmt_partition[\"mappable_stmt\"],\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    ...<2 lines>...\n        raw_as_string=self._raw_as_string,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\opentelemetry\\context_propagation.py\", line 97, in wrapper\n    return method(cnx, *args, **kwargs)\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 781, in cmd_query\n    raise get_mysql_exception(\n        err.errno, msg=err.msg, sqlstate=err.sqlstate\n    ) from err\nmysql.connector.errors.ProgrammingError: 1054 (42S22): Unknown column \'updated_by\' in \'field list\'\n','2026-01-28 04:53:24'),(8,'Nanda_AH','/templates','1054 (42S22): Unknown column \'updated_by\' in \'field list\'','Traceback (most recent call last):\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 772, in cmd_query\n    self._cmysql.query(\n    ~~~~~~~~~~~~~~~~~~^\n        query,\n        ^^^^^^\n    ...<3 lines>...\n        query_attrs=self.query_attrs,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n_mysql_connector.MySQLInterfaceError: Unknown column \'updated_by\' in \'field list\'\n\nThe above exception was the direct cause of the following exception:\n\nTraceback (most recent call last):\n  File \"D:\\Code final 2\\app\\utils\\database.py\", line 73, in wrapper\n    return func(cursor, conn, *args, **kwargs)\n  File \"D:\\Code final 2\\app\\routes\\admin.py\", line 121, in get_templates\n    cursor.execute(\n    ~~~~~~~~~~~~~~^\n        \"SELECT id, name, department, updated_by \"\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n        \"FROM excel_templates ORDER BY id DESC\"\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\cursor_cext.py\", line 353, in execute\n    self._connection.cmd_query(\n    ~~~~~~~~~~~~~~~~~~~~~~~~~~^\n        self._stmt_partition[\"mappable_stmt\"],\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    ...<2 lines>...\n        raw_as_string=self._raw_as_string,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\opentelemetry\\context_propagation.py\", line 97, in wrapper\n    return method(cnx, *args, **kwargs)\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 781, in cmd_query\n    raise get_mysql_exception(\n        err.errno, msg=err.msg, sqlstate=err.sqlstate\n    ) from err\nmysql.connector.errors.ProgrammingError: 1054 (42S22): Unknown column \'updated_by\' in \'field list\'\n','2026-01-28 05:23:47'),(9,'approver_IT','/templates','1054 (42S22): Unknown column \'updated_by\' in \'field list\'','Traceback (most recent call last):\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 772, in cmd_query\n    self._cmysql.query(\n    ~~~~~~~~~~~~~~~~~~^\n        query,\n        ^^^^^^\n    ...<3 lines>...\n        query_attrs=self.query_attrs,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n_mysql_connector.MySQLInterfaceError: Unknown column \'updated_by\' in \'field list\'\n\nThe above exception was the direct cause of the following exception:\n\nTraceback (most recent call last):\n  File \"D:\\Code final 2\\app\\utils\\database.py\", line 73, in wrapper\n    return func(cursor, conn, *args, **kwargs)\n  File \"D:\\Code final 2\\app\\routes\\admin.py\", line 121, in get_templates\n    cursor.execute(\n    ~~~~~~~~~~~~~~^\n        \"SELECT id, name, department, updated_by \"\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n        \"FROM excel_templates ORDER BY id DESC\"\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\cursor_cext.py\", line 353, in execute\n    self._connection.cmd_query(\n    ~~~~~~~~~~~~~~~~~~~~~~~~~~^\n        self._stmt_partition[\"mappable_stmt\"],\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    ...<2 lines>...\n        raw_as_string=self._raw_as_string,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\opentelemetry\\context_propagation.py\", line 97, in wrapper\n    return method(cnx, *args, **kwargs)\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 781, in cmd_query\n    raise get_mysql_exception(\n        err.errno, msg=err.msg, sqlstate=err.sqlstate\n    ) from err\nmysql.connector.errors.ProgrammingError: 1054 (42S22): Unknown column \'updated_by\' in \'field list\'\n','2026-01-28 05:31:05'),(10,'approver_IT','/templates','1054 (42S22): Unknown column \'updated_by\' in \'field list\'','Traceback (most recent call last):\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 772, in cmd_query\n    self._cmysql.query(\n    ~~~~~~~~~~~~~~~~~~^\n        query,\n        ^^^^^^\n    ...<3 lines>...\n        query_attrs=self.query_attrs,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n_mysql_connector.MySQLInterfaceError: Unknown column \'updated_by\' in \'field list\'\n\nThe above exception was the direct cause of the following exception:\n\nTraceback (most recent call last):\n  File \"D:\\Code final 2\\app\\utils\\database.py\", line 73, in wrapper\n    return func(cursor, conn, *args, **kwargs)\n  File \"D:\\Code final 2\\app\\routes\\admin.py\", line 121, in get_templates\n    cursor.execute(\n    ~~~~~~~~~~~~~~^\n        \"SELECT id, name, department, updated_by \"\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n        \"FROM excel_templates ORDER BY id DESC\"\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\cursor_cext.py\", line 353, in execute\n    self._connection.cmd_query(\n    ~~~~~~~~~~~~~~~~~~~~~~~~~~^\n        self._stmt_partition[\"mappable_stmt\"],\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    ...<2 lines>...\n        raw_as_string=self._raw_as_string,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\opentelemetry\\context_propagation.py\", line 97, in wrapper\n    return method(cnx, *args, **kwargs)\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 781, in cmd_query\n    raise get_mysql_exception(\n        err.errno, msg=err.msg, sqlstate=err.sqlstate\n    ) from err\nmysql.connector.errors.ProgrammingError: 1054 (42S22): Unknown column \'updated_by\' in \'field list\'\n','2026-01-28 05:31:09'),(11,'admin','/templates','1054 (42S22): Unknown column \'updated_by\' in \'field list\'','Traceback (most recent call last):\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 772, in cmd_query\n    self._cmysql.query(\n    ~~~~~~~~~~~~~~~~~~^\n        query,\n        ^^^^^^\n    ...<3 lines>...\n        query_attrs=self.query_attrs,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n_mysql_connector.MySQLInterfaceError: Unknown column \'updated_by\' in \'field list\'\n\nThe above exception was the direct cause of the following exception:\n\nTraceback (most recent call last):\n  File \"D:\\Code final 2\\app\\utils\\database.py\", line 73, in wrapper\n    return func(cursor, conn, *args, **kwargs)\n  File \"D:\\Code final 2\\app\\routes\\admin.py\", line 121, in get_templates\n    cursor.execute(\n    ~~~~~~~~~~~~~~^\n        \"SELECT id, name, department, updated_by \"\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n        \"FROM excel_templates ORDER BY id DESC\"\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\cursor_cext.py\", line 353, in execute\n    self._connection.cmd_query(\n    ~~~~~~~~~~~~~~~~~~~~~~~~~~^\n        self._stmt_partition[\"mappable_stmt\"],\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    ...<2 lines>...\n        raw_as_string=self._raw_as_string,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\opentelemetry\\context_propagation.py\", line 97, in wrapper\n    return method(cnx, *args, **kwargs)\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 781, in cmd_query\n    raise get_mysql_exception(\n        err.errno, msg=err.msg, sqlstate=err.sqlstate\n    ) from err\nmysql.connector.errors.ProgrammingError: 1054 (42S22): Unknown column \'updated_by\' in \'field list\'\n','2026-01-28 05:31:40'),(12,'admin','/templates','1054 (42S22): Unknown column \'updated_by\' in \'field list\'','Traceback (most recent call last):\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 772, in cmd_query\n    self._cmysql.query(\n    ~~~~~~~~~~~~~~~~~~^\n        query,\n        ^^^^^^\n    ...<3 lines>...\n        query_attrs=self.query_attrs,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n_mysql_connector.MySQLInterfaceError: Unknown column \'updated_by\' in \'field list\'\n\nThe above exception was the direct cause of the following exception:\n\nTraceback (most recent call last):\n  File \"D:\\Code final 2\\app\\utils\\database.py\", line 73, in wrapper\n    return func(cursor, conn, *args, **kwargs)\n  File \"D:\\Code final 2\\app\\routes\\admin.py\", line 121, in get_templates\n    cursor.execute(\n    ~~~~~~~~~~~~~~^\n        \"SELECT id, name, department, updated_by \"\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n        \"FROM excel_templates ORDER BY id DESC\"\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\cursor_cext.py\", line 353, in execute\n    self._connection.cmd_query(\n    ~~~~~~~~~~~~~~~~~~~~~~~~~~^\n        self._stmt_partition[\"mappable_stmt\"],\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    ...<2 lines>...\n        raw_as_string=self._raw_as_string,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\opentelemetry\\context_propagation.py\", line 97, in wrapper\n    return method(cnx, *args, **kwargs)\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 781, in cmd_query\n    raise get_mysql_exception(\n        err.errno, msg=err.msg, sqlstate=err.sqlstate\n    ) from err\nmysql.connector.errors.ProgrammingError: 1054 (42S22): Unknown column \'updated_by\' in \'field list\'\n','2026-01-28 05:32:02'),(13,'approver_IT','/api/get_approval_stats','1054 (42S22): Unknown column \'is_approved\' in \'field list\'','Traceback (most recent call last):\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 772, in cmd_query\n    self._cmysql.query(\n    ~~~~~~~~~~~~~~~~~~^\n        query,\n        ^^^^^^\n    ...<3 lines>...\n        query_attrs=self.query_attrs,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n_mysql_connector.MySQLInterfaceError: Unknown column \'is_approved\' in \'field list\'\n\nThe above exception was the direct cause of the following exception:\n\nTraceback (most recent call last):\n  File \"D:\\Code final 2\\app\\routes\\api.py\", line 1014, in get_approval_stats\n    cursor.execute(f\"\"\"\n    ~~~~~~~~~~~~~~^^^^^\n        SELECT\n        ^^^^^^\n    ...<5 lines>...\n        WHERE upload_id = %s\n        ^^^^^^^^^^^^^^^^^^^^\n    \"\"\", (upload_id,))\n    ^^^^^^^^^^^^^^^^^^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\cursor_cext.py\", line 353, in execute\n    self._connection.cmd_query(\n    ~~~~~~~~~~~~~~~~~~~~~~~~~~^\n        self._stmt_partition[\"mappable_stmt\"],\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    ...<2 lines>...\n        raw_as_string=self._raw_as_string,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\opentelemetry\\context_propagation.py\", line 97, in wrapper\n    return method(cnx, *args, **kwargs)\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 781, in cmd_query\n    raise get_mysql_exception(\n        err.errno, msg=err.msg, sqlstate=err.sqlstate\n    ) from err\nmysql.connector.errors.ProgrammingError: 1054 (42S22): Unknown column \'is_approved\' in \'field list\'\n','2026-01-28 06:58:00'),(14,'approver_IT','/api/get_approval_stats','1054 (42S22): Unknown column \'is_approved\' in \'field list\'','Traceback (most recent call last):\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 772, in cmd_query\n    self._cmysql.query(\n    ~~~~~~~~~~~~~~~~~~^\n        query,\n        ^^^^^^\n    ...<3 lines>...\n        query_attrs=self.query_attrs,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n_mysql_connector.MySQLInterfaceError: Unknown column \'is_approved\' in \'field list\'\n\nThe above exception was the direct cause of the following exception:\n\nTraceback (most recent call last):\n  File \"D:\\Code final 2\\app\\routes\\api.py\", line 1014, in get_approval_stats\n    cursor.execute(f\"\"\"\n    ~~~~~~~~~~~~~~^^^^^\n        SELECT\n        ^^^^^^\n    ...<5 lines>...\n        WHERE upload_id = %s\n        ^^^^^^^^^^^^^^^^^^^^\n    \"\"\", (upload_id,))\n    ^^^^^^^^^^^^^^^^^^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\cursor_cext.py\", line 353, in execute\n    self._connection.cmd_query(\n    ~~~~~~~~~~~~~~~~~~~~~~~~~~^\n        self._stmt_partition[\"mappable_stmt\"],\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    ...<2 lines>...\n        raw_as_string=self._raw_as_string,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\opentelemetry\\context_propagation.py\", line 97, in wrapper\n    return method(cnx, *args, **kwargs)\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 781, in cmd_query\n    raise get_mysql_exception(\n        err.errno, msg=err.msg, sqlstate=err.sqlstate\n    ) from err\nmysql.connector.errors.ProgrammingError: 1054 (42S22): Unknown column \'is_approved\' in \'field list\'\n','2026-01-28 06:58:00'),(15,'approver_IT','/api/get_approval_stats','1054 (42S22): Unknown column \'is_approved\' in \'field list\'','Traceback (most recent call last):\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 772, in cmd_query\n    self._cmysql.query(\n    ~~~~~~~~~~~~~~~~~~^\n        query,\n        ^^^^^^\n    ...<3 lines>...\n        query_attrs=self.query_attrs,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n_mysql_connector.MySQLInterfaceError: Unknown column \'is_approved\' in \'field list\'\n\nThe above exception was the direct cause of the following exception:\n\nTraceback (most recent call last):\n  File \"D:\\Code final 2\\app\\routes\\api.py\", line 1014, in get_approval_stats\n    cursor.execute(f\"\"\"\n    ~~~~~~~~~~~~~~^^^^^\n        SELECT\n        ^^^^^^\n    ...<5 lines>...\n        WHERE upload_id = %s\n        ^^^^^^^^^^^^^^^^^^^^\n    \"\"\", (upload_id,))\n    ^^^^^^^^^^^^^^^^^^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\cursor_cext.py\", line 353, in execute\n    self._connection.cmd_query(\n    ~~~~~~~~~~~~~~~~~~~~~~~~~~^\n        self._stmt_partition[\"mappable_stmt\"],\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    ...<2 lines>...\n        raw_as_string=self._raw_as_string,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\opentelemetry\\context_propagation.py\", line 97, in wrapper\n    return method(cnx, *args, **kwargs)\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 781, in cmd_query\n    raise get_mysql_exception(\n        err.errno, msg=err.msg, sqlstate=err.sqlstate\n    ) from err\nmysql.connector.errors.ProgrammingError: 1054 (42S22): Unknown column \'is_approved\' in \'field list\'\n','2026-01-28 06:58:00'),(16,'approver_IT','/api/get_approval_stats','1054 (42S22): Unknown column \'is_approved\' in \'field list\'','Traceback (most recent call last):\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 772, in cmd_query\n    self._cmysql.query(\n    ~~~~~~~~~~~~~~~~~~^\n        query,\n        ^^^^^^\n    ...<3 lines>...\n        query_attrs=self.query_attrs,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n_mysql_connector.MySQLInterfaceError: Unknown column \'is_approved\' in \'field list\'\n\nThe above exception was the direct cause of the following exception:\n\nTraceback (most recent call last):\n  File \"D:\\Code final 2\\app\\routes\\api.py\", line 1014, in get_approval_stats\n    cursor.execute(f\"\"\"\n    ~~~~~~~~~~~~~~^^^^^\n        SELECT\n        ^^^^^^\n    ...<5 lines>...\n        WHERE upload_id = %s\n        ^^^^^^^^^^^^^^^^^^^^\n    \"\"\", (upload_id,))\n    ^^^^^^^^^^^^^^^^^^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\cursor_cext.py\", line 353, in execute\n    self._connection.cmd_query(\n    ~~~~~~~~~~~~~~~~~~~~~~~~~~^\n        self._stmt_partition[\"mappable_stmt\"],\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    ...<2 lines>...\n        raw_as_string=self._raw_as_string,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\opentelemetry\\context_propagation.py\", line 97, in wrapper\n    return method(cnx, *args, **kwargs)\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 781, in cmd_query\n    raise get_mysql_exception(\n        err.errno, msg=err.msg, sqlstate=err.sqlstate\n    ) from err\nmysql.connector.errors.ProgrammingError: 1054 (42S22): Unknown column \'is_approved\' in \'field list\'\n','2026-01-28 06:58:31'),(17,'approver_IT','/api/get_approval_stats','1054 (42S22): Unknown column \'is_approved\' in \'field list\'','Traceback (most recent call last):\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 772, in cmd_query\n    self._cmysql.query(\n    ~~~~~~~~~~~~~~~~~~^\n        query,\n        ^^^^^^\n    ...<3 lines>...\n        query_attrs=self.query_attrs,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n_mysql_connector.MySQLInterfaceError: Unknown column \'is_approved\' in \'field list\'\n\nThe above exception was the direct cause of the following exception:\n\nTraceback (most recent call last):\n  File \"D:\\Code final 2\\app\\routes\\api.py\", line 1014, in get_approval_stats\n    cursor.execute(f\"\"\"\n    ~~~~~~~~~~~~~~^^^^^\n        SELECT\n        ^^^^^^\n    ...<5 lines>...\n        WHERE upload_id = %s\n        ^^^^^^^^^^^^^^^^^^^^\n    \"\"\", (upload_id,))\n    ^^^^^^^^^^^^^^^^^^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\cursor_cext.py\", line 353, in execute\n    self._connection.cmd_query(\n    ~~~~~~~~~~~~~~~~~~~~~~~~~~^\n        self._stmt_partition[\"mappable_stmt\"],\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    ...<2 lines>...\n        raw_as_string=self._raw_as_string,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\opentelemetry\\context_propagation.py\", line 97, in wrapper\n    return method(cnx, *args, **kwargs)\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 781, in cmd_query\n    raise get_mysql_exception(\n        err.errno, msg=err.msg, sqlstate=err.sqlstate\n    ) from err\nmysql.connector.errors.ProgrammingError: 1054 (42S22): Unknown column \'is_approved\' in \'field list\'\n','2026-01-28 06:59:01'),(18,'approver_IT','/api/get_approval_stats','1054 (42S22): Unknown column \'is_approved\' in \'field list\'','Traceback (most recent call last):\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 772, in cmd_query\n    self._cmysql.query(\n    ~~~~~~~~~~~~~~~~~~^\n        query,\n        ^^^^^^\n    ...<3 lines>...\n        query_attrs=self.query_attrs,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n_mysql_connector.MySQLInterfaceError: Unknown column \'is_approved\' in \'field list\'\n\nThe above exception was the direct cause of the following exception:\n\nTraceback (most recent call last):\n  File \"D:\\Code final 2\\app\\routes\\api.py\", line 1014, in get_approval_stats\n    cursor.execute(f\"\"\"\n    ~~~~~~~~~~~~~~^^^^^\n        SELECT\n        ^^^^^^\n    ...<5 lines>...\n        WHERE upload_id = %s\n        ^^^^^^^^^^^^^^^^^^^^\n    \"\"\", (upload_id,))\n    ^^^^^^^^^^^^^^^^^^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\cursor_cext.py\", line 353, in execute\n    self._connection.cmd_query(\n    ~~~~~~~~~~~~~~~~~~~~~~~~~~^\n        self._stmt_partition[\"mappable_stmt\"],\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    ...<2 lines>...\n        raw_as_string=self._raw_as_string,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\opentelemetry\\context_propagation.py\", line 97, in wrapper\n    return method(cnx, *args, **kwargs)\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 781, in cmd_query\n    raise get_mysql_exception(\n        err.errno, msg=err.msg, sqlstate=err.sqlstate\n    ) from err\nmysql.connector.errors.ProgrammingError: 1054 (42S22): Unknown column \'is_approved\' in \'field list\'\n','2026-01-28 06:59:31'),(19,'approver_IT','/api/get_approval_stats','1054 (42S22): Unknown column \'is_approved\' in \'field list\'','Traceback (most recent call last):\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 772, in cmd_query\n    self._cmysql.query(\n    ~~~~~~~~~~~~~~~~~~^\n        query,\n        ^^^^^^\n    ...<3 lines>...\n        query_attrs=self.query_attrs,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n_mysql_connector.MySQLInterfaceError: Unknown column \'is_approved\' in \'field list\'\n\nThe above exception was the direct cause of the following exception:\n\nTraceback (most recent call last):\n  File \"D:\\Code final 2\\app\\routes\\api.py\", line 1014, in get_approval_stats\n    cursor.execute(f\"\"\"\n    ~~~~~~~~~~~~~~^^^^^\n        SELECT\n        ^^^^^^\n    ...<5 lines>...\n        WHERE upload_id = %s\n        ^^^^^^^^^^^^^^^^^^^^\n    \"\"\", (upload_id,))\n    ^^^^^^^^^^^^^^^^^^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\cursor_cext.py\", line 353, in execute\n    self._connection.cmd_query(\n    ~~~~~~~~~~~~~~~~~~~~~~~~~~^\n        self._stmt_partition[\"mappable_stmt\"],\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    ...<2 lines>...\n        raw_as_string=self._raw_as_string,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\opentelemetry\\context_propagation.py\", line 97, in wrapper\n    return method(cnx, *args, **kwargs)\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 781, in cmd_query\n    raise get_mysql_exception(\n        err.errno, msg=err.msg, sqlstate=err.sqlstate\n    ) from err\nmysql.connector.errors.ProgrammingError: 1054 (42S22): Unknown column \'is_approved\' in \'field list\'\n','2026-01-28 07:00:01'),(20,'approver_IT','/api/get_approval_stats','1054 (42S22): Unknown column \'is_approved\' in \'field list\'','Traceback (most recent call last):\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 772, in cmd_query\n    self._cmysql.query(\n    ~~~~~~~~~~~~~~~~~~^\n        query,\n        ^^^^^^\n    ...<3 lines>...\n        query_attrs=self.query_attrs,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n_mysql_connector.MySQLInterfaceError: Unknown column \'is_approved\' in \'field list\'\n\nThe above exception was the direct cause of the following exception:\n\nTraceback (most recent call last):\n  File \"D:\\Code final 2\\app\\routes\\api.py\", line 1014, in get_approval_stats\n    cursor.execute(f\"\"\"\n    ~~~~~~~~~~~~~~^^^^^\n        SELECT\n        ^^^^^^\n    ...<5 lines>...\n        WHERE upload_id = %s\n        ^^^^^^^^^^^^^^^^^^^^\n    \"\"\", (upload_id,))\n    ^^^^^^^^^^^^^^^^^^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\cursor_cext.py\", line 353, in execute\n    self._connection.cmd_query(\n    ~~~~~~~~~~~~~~~~~~~~~~~~~~^\n        self._stmt_partition[\"mappable_stmt\"],\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    ...<2 lines>...\n        raw_as_string=self._raw_as_string,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\opentelemetry\\context_propagation.py\", line 97, in wrapper\n    return method(cnx, *args, **kwargs)\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 781, in cmd_query\n    raise get_mysql_exception(\n        err.errno, msg=err.msg, sqlstate=err.sqlstate\n    ) from err\nmysql.connector.errors.ProgrammingError: 1054 (42S22): Unknown column \'is_approved\' in \'field list\'\n','2026-01-28 07:00:31'),(21,'approver_IT','/api/get_approval_stats','1054 (42S22): Unknown column \'is_approved\' in \'field list\'','Traceback (most recent call last):\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 772, in cmd_query\n    self._cmysql.query(\n    ~~~~~~~~~~~~~~~~~~^\n        query,\n        ^^^^^^\n    ...<3 lines>...\n        query_attrs=self.query_attrs,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n_mysql_connector.MySQLInterfaceError: Unknown column \'is_approved\' in \'field list\'\n\nThe above exception was the direct cause of the following exception:\n\nTraceback (most recent call last):\n  File \"D:\\Code final 2\\app\\routes\\api.py\", line 1014, in get_approval_stats\n    cursor.execute(f\"\"\"\n    ~~~~~~~~~~~~~~^^^^^\n        SELECT\n        ^^^^^^\n    ...<5 lines>...\n        WHERE upload_id = %s\n        ^^^^^^^^^^^^^^^^^^^^\n    \"\"\", (upload_id,))\n    ^^^^^^^^^^^^^^^^^^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\cursor_cext.py\", line 353, in execute\n    self._connection.cmd_query(\n    ~~~~~~~~~~~~~~~~~~~~~~~~~~^\n        self._stmt_partition[\"mappable_stmt\"],\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    ...<2 lines>...\n        raw_as_string=self._raw_as_string,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\opentelemetry\\context_propagation.py\", line 97, in wrapper\n    return method(cnx, *args, **kwargs)\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 781, in cmd_query\n    raise get_mysql_exception(\n        err.errno, msg=err.msg, sqlstate=err.sqlstate\n    ) from err\nmysql.connector.errors.ProgrammingError: 1054 (42S22): Unknown column \'is_approved\' in \'field list\'\n','2026-01-28 07:01:01'),(22,'approver_IT','/api/get_approval_stats','1054 (42S22): Unknown column \'is_approved\' in \'field list\'','Traceback (most recent call last):\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 772, in cmd_query\n    self._cmysql.query(\n    ~~~~~~~~~~~~~~~~~~^\n        query,\n        ^^^^^^\n    ...<3 lines>...\n        query_attrs=self.query_attrs,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n_mysql_connector.MySQLInterfaceError: Unknown column \'is_approved\' in \'field list\'\n\nThe above exception was the direct cause of the following exception:\n\nTraceback (most recent call last):\n  File \"D:\\Code final 2\\app\\routes\\api.py\", line 1014, in get_approval_stats\n    cursor.execute(f\"\"\"\n    ~~~~~~~~~~~~~~^^^^^\n        SELECT\n        ^^^^^^\n    ...<5 lines>...\n        WHERE upload_id = %s\n        ^^^^^^^^^^^^^^^^^^^^\n    \"\"\", (upload_id,))\n    ^^^^^^^^^^^^^^^^^^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\cursor_cext.py\", line 353, in execute\n    self._connection.cmd_query(\n    ~~~~~~~~~~~~~~~~~~~~~~~~~~^\n        self._stmt_partition[\"mappable_stmt\"],\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    ...<2 lines>...\n        raw_as_string=self._raw_as_string,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\opentelemetry\\context_propagation.py\", line 97, in wrapper\n    return method(cnx, *args, **kwargs)\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 781, in cmd_query\n    raise get_mysql_exception(\n        err.errno, msg=err.msg, sqlstate=err.sqlstate\n    ) from err\nmysql.connector.errors.ProgrammingError: 1054 (42S22): Unknown column \'is_approved\' in \'field list\'\n','2026-01-28 07:01:31'),(23,'approver_IT','/api/get_approval_stats','1054 (42S22): Unknown column \'is_approved\' in \'field list\'','Traceback (most recent call last):\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 772, in cmd_query\n    self._cmysql.query(\n    ~~~~~~~~~~~~~~~~~~^\n        query,\n        ^^^^^^\n    ...<3 lines>...\n        query_attrs=self.query_attrs,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n_mysql_connector.MySQLInterfaceError: Unknown column \'is_approved\' in \'field list\'\n\nThe above exception was the direct cause of the following exception:\n\nTraceback (most recent call last):\n  File \"D:\\Code final 2\\app\\routes\\api.py\", line 1014, in get_approval_stats\n    cursor.execute(f\"\"\"\n    ~~~~~~~~~~~~~~^^^^^\n        SELECT\n        ^^^^^^\n    ...<5 lines>...\n        WHERE upload_id = %s\n        ^^^^^^^^^^^^^^^^^^^^\n    \"\"\", (upload_id,))\n    ^^^^^^^^^^^^^^^^^^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\cursor_cext.py\", line 353, in execute\n    self._connection.cmd_query(\n    ~~~~~~~~~~~~~~~~~~~~~~~~~~^\n        self._stmt_partition[\"mappable_stmt\"],\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    ...<2 lines>...\n        raw_as_string=self._raw_as_string,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\opentelemetry\\context_propagation.py\", line 97, in wrapper\n    return method(cnx, *args, **kwargs)\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 781, in cmd_query\n    raise get_mysql_exception(\n        err.errno, msg=err.msg, sqlstate=err.sqlstate\n    ) from err\nmysql.connector.errors.ProgrammingError: 1054 (42S22): Unknown column \'is_approved\' in \'field list\'\n','2026-01-28 07:02:01'),(24,'approver_IT','/api/get_approval_stats','1054 (42S22): Unknown column \'is_approved\' in \'field list\'','Traceback (most recent call last):\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 772, in cmd_query\n    self._cmysql.query(\n    ~~~~~~~~~~~~~~~~~~^\n        query,\n        ^^^^^^\n    ...<3 lines>...\n        query_attrs=self.query_attrs,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n_mysql_connector.MySQLInterfaceError: Unknown column \'is_approved\' in \'field list\'\n\nThe above exception was the direct cause of the following exception:\n\nTraceback (most recent call last):\n  File \"D:\\Code final 2\\app\\routes\\api.py\", line 1014, in get_approval_stats\n    cursor.execute(f\"\"\"\n    ~~~~~~~~~~~~~~^^^^^\n        SELECT\n        ^^^^^^\n    ...<5 lines>...\n        WHERE upload_id = %s\n        ^^^^^^^^^^^^^^^^^^^^\n    \"\"\", (upload_id,))\n    ^^^^^^^^^^^^^^^^^^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\cursor_cext.py\", line 353, in execute\n    self._connection.cmd_query(\n    ~~~~~~~~~~~~~~~~~~~~~~~~~~^\n        self._stmt_partition[\"mappable_stmt\"],\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    ...<2 lines>...\n        raw_as_string=self._raw_as_string,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\opentelemetry\\context_propagation.py\", line 97, in wrapper\n    return method(cnx, *args, **kwargs)\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 781, in cmd_query\n    raise get_mysql_exception(\n        err.errno, msg=err.msg, sqlstate=err.sqlstate\n    ) from err\nmysql.connector.errors.ProgrammingError: 1054 (42S22): Unknown column \'is_approved\' in \'field list\'\n','2026-01-28 07:02:31'),(25,'approver_IT','/api/get_approval_stats','1054 (42S22): Unknown column \'is_approved\' in \'field list\'','Traceback (most recent call last):\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 772, in cmd_query\n    self._cmysql.query(\n    ~~~~~~~~~~~~~~~~~~^\n        query,\n        ^^^^^^\n    ...<3 lines>...\n        query_attrs=self.query_attrs,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n_mysql_connector.MySQLInterfaceError: Unknown column \'is_approved\' in \'field list\'\n\nThe above exception was the direct cause of the following exception:\n\nTraceback (most recent call last):\n  File \"D:\\Code final 2\\app\\routes\\api.py\", line 1014, in get_approval_stats\n    cursor.execute(f\"\"\"\n    ~~~~~~~~~~~~~~^^^^^\n        SELECT\n        ^^^^^^\n    ...<5 lines>...\n        WHERE upload_id = %s\n        ^^^^^^^^^^^^^^^^^^^^\n    \"\"\", (upload_id,))\n    ^^^^^^^^^^^^^^^^^^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\cursor_cext.py\", line 353, in execute\n    self._connection.cmd_query(\n    ~~~~~~~~~~~~~~~~~~~~~~~~~~^\n        self._stmt_partition[\"mappable_stmt\"],\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    ...<2 lines>...\n        raw_as_string=self._raw_as_string,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\opentelemetry\\context_propagation.py\", line 97, in wrapper\n    return method(cnx, *args, **kwargs)\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 781, in cmd_query\n    raise get_mysql_exception(\n        err.errno, msg=err.msg, sqlstate=err.sqlstate\n    ) from err\nmysql.connector.errors.ProgrammingError: 1054 (42S22): Unknown column \'is_approved\' in \'field list\'\n','2026-01-28 07:03:01'),(26,'approver_IT','/api/get_approval_stats','1054 (42S22): Unknown column \'is_approved\' in \'field list\'','Traceback (most recent call last):\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 772, in cmd_query\n    self._cmysql.query(\n    ~~~~~~~~~~~~~~~~~~^\n        query,\n        ^^^^^^\n    ...<3 lines>...\n        query_attrs=self.query_attrs,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n_mysql_connector.MySQLInterfaceError: Unknown column \'is_approved\' in \'field list\'\n\nThe above exception was the direct cause of the following exception:\n\nTraceback (most recent call last):\n  File \"D:\\Code final 2\\app\\routes\\api.py\", line 1014, in get_approval_stats\n    cursor.execute(f\"\"\"\n    ~~~~~~~~~~~~~~^^^^^\n        SELECT\n        ^^^^^^\n    ...<5 lines>...\n        WHERE upload_id = %s\n        ^^^^^^^^^^^^^^^^^^^^\n    \"\"\", (upload_id,))\n    ^^^^^^^^^^^^^^^^^^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\cursor_cext.py\", line 353, in execute\n    self._connection.cmd_query(\n    ~~~~~~~~~~~~~~~~~~~~~~~~~~^\n        self._stmt_partition[\"mappable_stmt\"],\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    ...<2 lines>...\n        raw_as_string=self._raw_as_string,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\opentelemetry\\context_propagation.py\", line 97, in wrapper\n    return method(cnx, *args, **kwargs)\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 781, in cmd_query\n    raise get_mysql_exception(\n        err.errno, msg=err.msg, sqlstate=err.sqlstate\n    ) from err\nmysql.connector.errors.ProgrammingError: 1054 (42S22): Unknown column \'is_approved\' in \'field list\'\n','2026-01-28 07:04:02'),(27,'approver_IT','/api/get_approval_stats','1054 (42S22): Unknown column \'is_approved\' in \'field list\'','Traceback (most recent call last):\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 772, in cmd_query\n    self._cmysql.query(\n    ~~~~~~~~~~~~~~~~~~^\n        query,\n        ^^^^^^\n    ...<3 lines>...\n        query_attrs=self.query_attrs,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n_mysql_connector.MySQLInterfaceError: Unknown column \'is_approved\' in \'field list\'\n\nThe above exception was the direct cause of the following exception:\n\nTraceback (most recent call last):\n  File \"D:\\Code final 2\\app\\routes\\api.py\", line 1014, in get_approval_stats\n    cursor.execute(f\"\"\"\n    ~~~~~~~~~~~~~~^^^^^\n        SELECT\n        ^^^^^^\n    ...<5 lines>...\n        WHERE upload_id = %s\n        ^^^^^^^^^^^^^^^^^^^^\n    \"\"\", (upload_id,))\n    ^^^^^^^^^^^^^^^^^^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\cursor_cext.py\", line 353, in execute\n    self._connection.cmd_query(\n    ~~~~~~~~~~~~~~~~~~~~~~~~~~^\n        self._stmt_partition[\"mappable_stmt\"],\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    ...<2 lines>...\n        raw_as_string=self._raw_as_string,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\opentelemetry\\context_propagation.py\", line 97, in wrapper\n    return method(cnx, *args, **kwargs)\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 781, in cmd_query\n    raise get_mysql_exception(\n        err.errno, msg=err.msg, sqlstate=err.sqlstate\n    ) from err\nmysql.connector.errors.ProgrammingError: 1054 (42S22): Unknown column \'is_approved\' in \'field list\'\n','2026-01-28 07:04:30'),(28,'approver_IT','/api/get_approval_stats','1054 (42S22): Unknown column \'is_approved\' in \'field list\'','Traceback (most recent call last):\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 772, in cmd_query\n    self._cmysql.query(\n    ~~~~~~~~~~~~~~~~~~^\n        query,\n        ^^^^^^\n    ...<3 lines>...\n        query_attrs=self.query_attrs,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n_mysql_connector.MySQLInterfaceError: Unknown column \'is_approved\' in \'field list\'\n\nThe above exception was the direct cause of the following exception:\n\nTraceback (most recent call last):\n  File \"D:\\Code final 2\\app\\routes\\api.py\", line 1014, in get_approval_stats\n    cursor.execute(f\"\"\"\n    ~~~~~~~~~~~~~~^^^^^\n        SELECT\n        ^^^^^^\n    ...<5 lines>...\n        WHERE upload_id = %s\n        ^^^^^^^^^^^^^^^^^^^^\n    \"\"\", (upload_id,))\n    ^^^^^^^^^^^^^^^^^^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\cursor_cext.py\", line 353, in execute\n    self._connection.cmd_query(\n    ~~~~~~~~~~~~~~~~~~~~~~~~~~^\n        self._stmt_partition[\"mappable_stmt\"],\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    ...<2 lines>...\n        raw_as_string=self._raw_as_string,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\opentelemetry\\context_propagation.py\", line 97, in wrapper\n    return method(cnx, *args, **kwargs)\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 781, in cmd_query\n    raise get_mysql_exception(\n        err.errno, msg=err.msg, sqlstate=err.sqlstate\n    ) from err\nmysql.connector.errors.ProgrammingError: 1054 (42S22): Unknown column \'is_approved\' in \'field list\'\n','2026-01-28 07:04:31'),(29,'approver_IT','/api/get_approval_stats','1054 (42S22): Unknown column \'is_approved\' in \'field list\'','Traceback (most recent call last):\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 772, in cmd_query\n    self._cmysql.query(\n    ~~~~~~~~~~~~~~~~~~^\n        query,\n        ^^^^^^\n    ...<3 lines>...\n        query_attrs=self.query_attrs,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n_mysql_connector.MySQLInterfaceError: Unknown column \'is_approved\' in \'field list\'\n\nThe above exception was the direct cause of the following exception:\n\nTraceback (most recent call last):\n  File \"D:\\Code final 2\\app\\routes\\api.py\", line 1014, in get_approval_stats\n    cursor.execute(f\"\"\"\n    ~~~~~~~~~~~~~~^^^^^\n        SELECT\n        ^^^^^^\n    ...<5 lines>...\n        WHERE upload_id = %s\n        ^^^^^^^^^^^^^^^^^^^^\n    \"\"\", (upload_id,))\n    ^^^^^^^^^^^^^^^^^^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\cursor_cext.py\", line 353, in execute\n    self._connection.cmd_query(\n    ~~~~~~~~~~~~~~~~~~~~~~~~~~^\n        self._stmt_partition[\"mappable_stmt\"],\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    ...<2 lines>...\n        raw_as_string=self._raw_as_string,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\opentelemetry\\context_propagation.py\", line 97, in wrapper\n    return method(cnx, *args, **kwargs)\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 781, in cmd_query\n    raise get_mysql_exception(\n        err.errno, msg=err.msg, sqlstate=err.sqlstate\n    ) from err\nmysql.connector.errors.ProgrammingError: 1054 (42S22): Unknown column \'is_approved\' in \'field list\'\n','2026-01-28 07:04:31'),(30,'approver_IT','/api/get_approval_stats','1054 (42S22): Unknown column \'is_approved\' in \'field list\'','Traceback (most recent call last):\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 772, in cmd_query\n    self._cmysql.query(\n    ~~~~~~~~~~~~~~~~~~^\n        query,\n        ^^^^^^\n    ...<3 lines>...\n        query_attrs=self.query_attrs,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n_mysql_connector.MySQLInterfaceError: Unknown column \'is_approved\' in \'field list\'\n\nThe above exception was the direct cause of the following exception:\n\nTraceback (most recent call last):\n  File \"D:\\Code final 2\\app\\routes\\api.py\", line 1014, in get_approval_stats\n    cursor.execute(f\"\"\"\n    ~~~~~~~~~~~~~~^^^^^\n        SELECT\n        ^^^^^^\n    ...<5 lines>...\n        WHERE upload_id = %s\n        ^^^^^^^^^^^^^^^^^^^^\n    \"\"\", (upload_id,))\n    ^^^^^^^^^^^^^^^^^^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\cursor_cext.py\", line 353, in execute\n    self._connection.cmd_query(\n    ~~~~~~~~~~~~~~~~~~~~~~~~~~^\n        self._stmt_partition[\"mappable_stmt\"],\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    ...<2 lines>...\n        raw_as_string=self._raw_as_string,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\opentelemetry\\context_propagation.py\", line 97, in wrapper\n    return method(cnx, *args, **kwargs)\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 781, in cmd_query\n    raise get_mysql_exception(\n        err.errno, msg=err.msg, sqlstate=err.sqlstate\n    ) from err\nmysql.connector.errors.ProgrammingError: 1054 (42S22): Unknown column \'is_approved\' in \'field list\'\n','2026-01-28 07:04:33'),(31,'approver_IT','/api/get_approval_stats','1054 (42S22): Unknown column \'is_approved\' in \'field list\'','Traceback (most recent call last):\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 772, in cmd_query\n    self._cmysql.query(\n    ~~~~~~~~~~~~~~~~~~^\n        query,\n        ^^^^^^\n    ...<3 lines>...\n        query_attrs=self.query_attrs,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n_mysql_connector.MySQLInterfaceError: Unknown column \'is_approved\' in \'field list\'\n\nThe above exception was the direct cause of the following exception:\n\nTraceback (most recent call last):\n  File \"D:\\Code final 2\\app\\routes\\api.py\", line 1014, in get_approval_stats\n    cursor.execute(f\"\"\"\n    ~~~~~~~~~~~~~~^^^^^\n        SELECT\n        ^^^^^^\n    ...<5 lines>...\n        WHERE upload_id = %s\n        ^^^^^^^^^^^^^^^^^^^^\n    \"\"\", (upload_id,))\n    ^^^^^^^^^^^^^^^^^^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\cursor_cext.py\", line 353, in execute\n    self._connection.cmd_query(\n    ~~~~~~~~~~~~~~~~~~~~~~~~~~^\n        self._stmt_partition[\"mappable_stmt\"],\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    ...<2 lines>...\n        raw_as_string=self._raw_as_string,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\opentelemetry\\context_propagation.py\", line 97, in wrapper\n    return method(cnx, *args, **kwargs)\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 781, in cmd_query\n    raise get_mysql_exception(\n        err.errno, msg=err.msg, sqlstate=err.sqlstate\n    ) from err\nmysql.connector.errors.ProgrammingError: 1054 (42S22): Unknown column \'is_approved\' in \'field list\'\n','2026-01-28 07:04:33'),(32,'admin','/templates','1054 (42S22): Unknown column \'updated_by\' in \'field list\'','Traceback (most recent call last):\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 772, in cmd_query\n    self._cmysql.query(\n    ~~~~~~~~~~~~~~~~~~^\n        query,\n        ^^^^^^\n    ...<3 lines>...\n        query_attrs=self.query_attrs,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n_mysql_connector.MySQLInterfaceError: Unknown column \'updated_by\' in \'field list\'\n\nThe above exception was the direct cause of the following exception:\n\nTraceback (most recent call last):\n  File \"D:\\Code final 2\\app\\utils\\database.py\", line 73, in wrapper\n    return func(cursor, conn, *args, **kwargs)\n  File \"D:\\Code final 2\\app\\routes\\admin.py\", line 121, in get_templates\n    cursor.execute(\n    ~~~~~~~~~~~~~~^\n        \"SELECT id, name, department, updated_by \"\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n        \"FROM excel_templates ORDER BY id DESC\"\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\cursor_cext.py\", line 353, in execute\n    self._connection.cmd_query(\n    ~~~~~~~~~~~~~~~~~~~~~~~~~~^\n        self._stmt_partition[\"mappable_stmt\"],\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    ...<2 lines>...\n        raw_as_string=self._raw_as_string,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\opentelemetry\\context_propagation.py\", line 97, in wrapper\n    return method(cnx, *args, **kwargs)\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 781, in cmd_query\n    raise get_mysql_exception(\n        err.errno, msg=err.msg, sqlstate=err.sqlstate\n    ) from err\nmysql.connector.errors.ProgrammingError: 1054 (42S22): Unknown column \'updated_by\' in \'field list\'\n','2026-01-28 07:05:32'),(33,'admin','/templates','1054 (42S22): Unknown column \'updated_by\' in \'field list\'','Traceback (most recent call last):\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 772, in cmd_query\n    self._cmysql.query(\n    ~~~~~~~~~~~~~~~~~~^\n        query,\n        ^^^^^^\n    ...<3 lines>...\n        query_attrs=self.query_attrs,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n_mysql_connector.MySQLInterfaceError: Unknown column \'updated_by\' in \'field list\'\n\nThe above exception was the direct cause of the following exception:\n\nTraceback (most recent call last):\n  File \"D:\\Code final 2\\app\\utils\\database.py\", line 73, in wrapper\n    return func(cursor, conn, *args, **kwargs)\n  File \"D:\\Code final 2\\app\\routes\\admin.py\", line 121, in get_templates\n    cursor.execute(\n    ~~~~~~~~~~~~~~^\n        \"SELECT id, name, department, updated_by \"\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n        \"FROM excel_templates ORDER BY id DESC\"\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\cursor_cext.py\", line 353, in execute\n    self._connection.cmd_query(\n    ~~~~~~~~~~~~~~~~~~~~~~~~~~^\n        self._stmt_partition[\"mappable_stmt\"],\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    ...<2 lines>...\n        raw_as_string=self._raw_as_string,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\opentelemetry\\context_propagation.py\", line 97, in wrapper\n    return method(cnx, *args, **kwargs)\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 781, in cmd_query\n    raise get_mysql_exception(\n        err.errno, msg=err.msg, sqlstate=err.sqlstate\n    ) from err\nmysql.connector.errors.ProgrammingError: 1054 (42S22): Unknown column \'updated_by\' in \'field list\'\n','2026-01-28 09:16:22'),(34,'Nanda_IT','/download_register_template','Table \'tbl_hostel_det\' not found','Traceback (most recent call last):\n  File \"D:\\Code final 2\\app\\utils\\excel_helpers.py\", line 74, in generate_excel_template\n    raise ValueError(f\"Table \'{table}\' not found\")\nValueError: Table \'tbl_hostel_det\' not found\n','2026-01-28 09:21:26'),(35,'Nanda_IT','/download_register_template','Table \'tbl_hostel_det\' not found','Traceback (most recent call last):\n  File \"D:\\Code final 2\\app\\routes\\data.py\", line 50, in download_register_template\n    output = generate_excel_template(cursor, table, LOOKUP_CONFIG, {})\n  File \"D:\\Code final 2\\app\\utils\\excel_helpers.py\", line 74, in generate_excel_template\n    raise ValueError(f\"Table \'{table}\' not found\")\nValueError: Table \'tbl_hostel_det\' not found\n','2026-01-28 09:21:26'),(36,'Nanda_IT','/download_register_template','Table \'tbl_hostel_det\' not found','Traceback (most recent call last):\n  File \"D:\\Code final 2\\app\\utils\\excel_helpers.py\", line 74, in generate_excel_template\n    raise ValueError(f\"Table \'{table}\' not found\")\nValueError: Table \'tbl_hostel_det\' not found\n','2026-01-28 09:21:41'),(37,'Nanda_IT','/download_register_template','Table \'tbl_hostel_det\' not found','Traceback (most recent call last):\n  File \"D:\\Code final 2\\app\\routes\\data.py\", line 50, in download_register_template\n    output = generate_excel_template(cursor, table, LOOKUP_CONFIG, {})\n  File \"D:\\Code final 2\\app\\utils\\excel_helpers.py\", line 74, in generate_excel_template\n    raise ValueError(f\"Table \'{table}\' not found\")\nValueError: Table \'tbl_hostel_det\' not found\n','2026-01-28 09:21:41'),(38,'Nanda_IT','/download_register_template','Table \'tbl_hostel_det\' not found','Traceback (most recent call last):\n  File \"D:\\Code final 2\\app\\utils\\excel_helpers.py\", line 74, in generate_excel_template\n    raise ValueError(f\"Table \'{table}\' not found\")\nValueError: Table \'tbl_hostel_det\' not found\n','2026-01-28 09:21:44'),(39,'Nanda_IT','/download_register_template','Table \'tbl_hostel_det\' not found','Traceback (most recent call last):\n  File \"D:\\Code final 2\\app\\routes\\data.py\", line 50, in download_register_template\n    output = generate_excel_template(cursor, table, LOOKUP_CONFIG, {})\n  File \"D:\\Code final 2\\app\\utils\\excel_helpers.py\", line 74, in generate_excel_template\n    raise ValueError(f\"Table \'{table}\' not found\")\nValueError: Table \'tbl_hostel_det\' not found\n','2026-01-28 09:21:44'),(40,'admin','/templates','1054 (42S22): Unknown column \'updated_by\' in \'field list\'','Traceback (most recent call last):\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 772, in cmd_query\n    self._cmysql.query(\n    ~~~~~~~~~~~~~~~~~~^\n        query,\n        ^^^^^^\n    ...<3 lines>...\n        query_attrs=self.query_attrs,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n_mysql_connector.MySQLInterfaceError: Unknown column \'updated_by\' in \'field list\'\n\nThe above exception was the direct cause of the following exception:\n\nTraceback (most recent call last):\n  File \"D:\\Code final 2\\app\\utils\\database.py\", line 73, in wrapper\n    return func(cursor, conn, *args, **kwargs)\n  File \"D:\\Code final 2\\app\\routes\\admin.py\", line 121, in get_templates\n    cursor.execute(\n    ~~~~~~~~~~~~~~^\n        \"SELECT id, name, department, updated_by \"\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n        \"FROM excel_templates ORDER BY id DESC\"\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\cursor_cext.py\", line 353, in execute\n    self._connection.cmd_query(\n    ~~~~~~~~~~~~~~~~~~~~~~~~~~^\n        self._stmt_partition[\"mappable_stmt\"],\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    ...<2 lines>...\n        raw_as_string=self._raw_as_string,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\opentelemetry\\context_propagation.py\", line 97, in wrapper\n    return method(cnx, *args, **kwargs)\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 781, in cmd_query\n    raise get_mysql_exception(\n        err.errno, msg=err.msg, sqlstate=err.sqlstate\n    ) from err\nmysql.connector.errors.ProgrammingError: 1054 (42S22): Unknown column \'updated_by\' in \'field list\'\n','2026-01-28 09:24:36'),(41,'Nanda_AH','/upload_transaction','1452 (23000): Cannot add or update a child row: a foreign key constraint fails (`esp_stg_db`.`tbl_livestock_census`, CONSTRAINT `tbl_livestock_census_ibfk_3` FOREIGN KEY (`year_id`) REFERENCES `tbl_year_master` (`year_id`))','Traceback (most recent call last):\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 772, in cmd_query\n    self._cmysql.query(\n    ~~~~~~~~~~~~~~~~~~^\n        query,\n        ^^^^^^\n    ...<3 lines>...\n        query_attrs=self.query_attrs,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n_mysql_connector.MySQLInterfaceError: Cannot add or update a child row: a foreign key constraint fails (`esp_stg_db`.`tbl_livestock_census`, CONSTRAINT `tbl_livestock_census_ibfk_3` FOREIGN KEY (`year_id`) REFERENCES `tbl_year_master` (`year_id`))\n\nThe above exception was the direct cause of the following exception:\n\nTraceback (most recent call last):\n  File \"D:\\Code final 2\\app\\routes\\data.py\", line 191, in _process_upload_transaction\n    cursor.executemany(sql, values)\n    ~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\cursor_cext.py\", line 473, in executemany\n    return self.execute(cast(str, stmt))\n           ~~~~~~~~~~~~^^^^^^^^^^^^^^^^^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\cursor_cext.py\", line 353, in execute\n    self._connection.cmd_query(\n    ~~~~~~~~~~~~~~~~~~~~~~~~~~^\n        self._stmt_partition[\"mappable_stmt\"],\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    ...<2 lines>...\n        raw_as_string=self._raw_as_string,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\opentelemetry\\context_propagation.py\", line 97, in wrapper\n    return method(cnx, *args, **kwargs)\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 781, in cmd_query\n    raise get_mysql_exception(\n        err.errno, msg=err.msg, sqlstate=err.sqlstate\n    ) from err\nmysql.connector.errors.IntegrityError: 1452 (23000): Cannot add or update a child row: a foreign key constraint fails (`esp_stg_db`.`tbl_livestock_census`, CONSTRAINT `tbl_livestock_census_ibfk_3` FOREIGN KEY (`year_id`) REFERENCES `tbl_year_master` (`year_id`))\n','2026-01-28 09:26:59'),(42,'admin','/templates','1054 (42S22): Unknown column \'updated_by\' in \'field list\'','Traceback (most recent call last):\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 772, in cmd_query\n    self._cmysql.query(\n    ~~~~~~~~~~~~~~~~~~^\n        query,\n        ^^^^^^\n    ...<3 lines>...\n        query_attrs=self.query_attrs,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n_mysql_connector.MySQLInterfaceError: Unknown column \'updated_by\' in \'field list\'\n\nThe above exception was the direct cause of the following exception:\n\nTraceback (most recent call last):\n  File \"D:\\Code final 2\\app\\utils\\database.py\", line 73, in wrapper\n    return func(cursor, conn, *args, **kwargs)\n  File \"D:\\Code final 2\\app\\routes\\admin.py\", line 121, in get_templates\n    cursor.execute(\n    ~~~~~~~~~~~~~~^\n        \"SELECT id, name, department, updated_by \"\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n        \"FROM excel_templates ORDER BY id DESC\"\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\cursor_cext.py\", line 353, in execute\n    self._connection.cmd_query(\n    ~~~~~~~~~~~~~~~~~~~~~~~~~~^\n        self._stmt_partition[\"mappable_stmt\"],\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    ...<2 lines>...\n        raw_as_string=self._raw_as_string,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\opentelemetry\\context_propagation.py\", line 97, in wrapper\n    return method(cnx, *args, **kwargs)\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 781, in cmd_query\n    raise get_mysql_exception(\n        err.errno, msg=err.msg, sqlstate=err.sqlstate\n    ) from err\nmysql.connector.errors.ProgrammingError: 1054 (42S22): Unknown column \'updated_by\' in \'field list\'\n','2026-01-28 09:40:57'),(43,'Nanda_AH','/templates','1054 (42S22): Unknown column \'updated_by\' in \'field list\'','Traceback (most recent call last):\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 772, in cmd_query\n    self._cmysql.query(\n    ~~~~~~~~~~~~~~~~~~^\n        query,\n        ^^^^^^\n    ...<3 lines>...\n        query_attrs=self.query_attrs,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n_mysql_connector.MySQLInterfaceError: Unknown column \'updated_by\' in \'field list\'\n\nThe above exception was the direct cause of the following exception:\n\nTraceback (most recent call last):\n  File \"D:\\Code final 2\\app\\utils\\database.py\", line 73, in wrapper\n    return func(cursor, conn, *args, **kwargs)\n  File \"D:\\Code final 2\\app\\routes\\admin.py\", line 121, in get_templates\n    cursor.execute(\n    ~~~~~~~~~~~~~~^\n        \"SELECT id, name, department, updated_by \"\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n        \"FROM excel_templates ORDER BY id DESC\"\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\cursor_cext.py\", line 353, in execute\n    self._connection.cmd_query(\n    ~~~~~~~~~~~~~~~~~~~~~~~~~~^\n        self._stmt_partition[\"mappable_stmt\"],\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    ...<2 lines>...\n        raw_as_string=self._raw_as_string,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\opentelemetry\\context_propagation.py\", line 97, in wrapper\n    return method(cnx, *args, **kwargs)\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 781, in cmd_query\n    raise get_mysql_exception(\n        err.errno, msg=err.msg, sqlstate=err.sqlstate\n    ) from err\nmysql.connector.errors.ProgrammingError: 1054 (42S22): Unknown column \'updated_by\' in \'field list\'\n','2026-01-28 09:48:25'),(44,'admin','/templates','1054 (42S22): Unknown column \'updated_by\' in \'field list\'','Traceback (most recent call last):\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 772, in cmd_query\n    self._cmysql.query(\n    ~~~~~~~~~~~~~~~~~~^\n        query,\n        ^^^^^^\n    ...<3 lines>...\n        query_attrs=self.query_attrs,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n_mysql_connector.MySQLInterfaceError: Unknown column \'updated_by\' in \'field list\'\n\nThe above exception was the direct cause of the following exception:\n\nTraceback (most recent call last):\n  File \"D:\\Code final 2\\app\\utils\\database.py\", line 73, in wrapper\n    return func(cursor, conn, *args, **kwargs)\n  File \"D:\\Code final 2\\app\\routes\\admin.py\", line 121, in get_templates\n    cursor.execute(\n    ~~~~~~~~~~~~~~^\n        \"SELECT id, name, department, updated_by \"\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n        \"FROM excel_templates ORDER BY id DESC\"\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\cursor_cext.py\", line 353, in execute\n    self._connection.cmd_query(\n    ~~~~~~~~~~~~~~~~~~~~~~~~~~^\n        self._stmt_partition[\"mappable_stmt\"],\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    ...<2 lines>...\n        raw_as_string=self._raw_as_string,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\opentelemetry\\context_propagation.py\", line 97, in wrapper\n    return method(cnx, *args, **kwargs)\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 781, in cmd_query\n    raise get_mysql_exception(\n        err.errno, msg=err.msg, sqlstate=err.sqlstate\n    ) from err\nmysql.connector.errors.ProgrammingError: 1054 (42S22): Unknown column \'updated_by\' in \'field list\'\n','2026-01-28 09:55:25'),(45,'approver_IT','/templates','1054 (42S22): Unknown column \'updated_by\' in \'field list\'','Traceback (most recent call last):\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 772, in cmd_query\n    self._cmysql.query(\n    ~~~~~~~~~~~~~~~~~~^\n        query,\n        ^^^^^^\n    ...<3 lines>...\n        query_attrs=self.query_attrs,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n_mysql_connector.MySQLInterfaceError: Unknown column \'updated_by\' in \'field list\'\n\nThe above exception was the direct cause of the following exception:\n\nTraceback (most recent call last):\n  File \"D:\\Code final 2\\app\\utils\\database.py\", line 73, in wrapper\n    return func(cursor, conn, *args, **kwargs)\n  File \"D:\\Code final 2\\app\\routes\\admin.py\", line 121, in get_templates\n    cursor.execute(\n    ~~~~~~~~~~~~~~^\n        \"SELECT id, name, department, updated_by \"\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n        \"FROM excel_templates ORDER BY id DESC\"\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\cursor_cext.py\", line 353, in execute\n    self._connection.cmd_query(\n    ~~~~~~~~~~~~~~~~~~~~~~~~~~^\n        self._stmt_partition[\"mappable_stmt\"],\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    ...<2 lines>...\n        raw_as_string=self._raw_as_string,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\opentelemetry\\context_propagation.py\", line 97, in wrapper\n    return method(cnx, *args, **kwargs)\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 781, in cmd_query\n    raise get_mysql_exception(\n        err.errno, msg=err.msg, sqlstate=err.sqlstate\n    ) from err\nmysql.connector.errors.ProgrammingError: 1054 (42S22): Unknown column \'updated_by\' in \'field list\'\n','2026-01-28 09:57:33'),(46,'approver_IT','/templates','1054 (42S22): Unknown column \'updated_by\' in \'field list\'','Traceback (most recent call last):\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 772, in cmd_query\n    self._cmysql.query(\n    ~~~~~~~~~~~~~~~~~~^\n        query,\n        ^^^^^^\n    ...<3 lines>...\n        query_attrs=self.query_attrs,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n_mysql_connector.MySQLInterfaceError: Unknown column \'updated_by\' in \'field list\'\n\nThe above exception was the direct cause of the following exception:\n\nTraceback (most recent call last):\n  File \"D:\\Code final 2\\app\\utils\\database.py\", line 73, in wrapper\n    return func(cursor, conn, *args, **kwargs)\n  File \"D:\\Code final 2\\app\\routes\\admin.py\", line 121, in get_templates\n    cursor.execute(\n    ~~~~~~~~~~~~~~^\n        \"SELECT id, name, department, updated_by \"\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n        \"FROM excel_templates ORDER BY id DESC\"\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\cursor_cext.py\", line 353, in execute\n    self._connection.cmd_query(\n    ~~~~~~~~~~~~~~~~~~~~~~~~~~^\n        self._stmt_partition[\"mappable_stmt\"],\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    ...<2 lines>...\n        raw_as_string=self._raw_as_string,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\opentelemetry\\context_propagation.py\", line 97, in wrapper\n    return method(cnx, *args, **kwargs)\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 781, in cmd_query\n    raise get_mysql_exception(\n        err.errno, msg=err.msg, sqlstate=err.sqlstate\n    ) from err\nmysql.connector.errors.ProgrammingError: 1054 (42S22): Unknown column \'updated_by\' in \'field list\'\n','2026-01-28 09:57:37'),(47,'approver_IT','/templates','1054 (42S22): Unknown column \'updated_by\' in \'field list\'','Traceback (most recent call last):\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 772, in cmd_query\n    self._cmysql.query(\n    ~~~~~~~~~~~~~~~~~~^\n        query,\n        ^^^^^^\n    ...<3 lines>...\n        query_attrs=self.query_attrs,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n_mysql_connector.MySQLInterfaceError: Unknown column \'updated_by\' in \'field list\'\n\nThe above exception was the direct cause of the following exception:\n\nTraceback (most recent call last):\n  File \"D:\\Code final 2\\app\\utils\\database.py\", line 73, in wrapper\n    return func(cursor, conn, *args, **kwargs)\n  File \"D:\\Code final 2\\app\\routes\\admin.py\", line 121, in get_templates\n    cursor.execute(\n    ~~~~~~~~~~~~~~^\n        \"SELECT id, name, department, updated_by \"\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n        \"FROM excel_templates ORDER BY id DESC\"\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\cursor_cext.py\", line 353, in execute\n    self._connection.cmd_query(\n    ~~~~~~~~~~~~~~~~~~~~~~~~~~^\n        self._stmt_partition[\"mappable_stmt\"],\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    ...<2 lines>...\n        raw_as_string=self._raw_as_string,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\opentelemetry\\context_propagation.py\", line 97, in wrapper\n    return method(cnx, *args, **kwargs)\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 781, in cmd_query\n    raise get_mysql_exception(\n        err.errno, msg=err.msg, sqlstate=err.sqlstate\n    ) from err\nmysql.connector.errors.ProgrammingError: 1054 (42S22): Unknown column \'updated_by\' in \'field list\'\n','2026-01-28 09:57:37'),(48,'approver_IT','/templates','1054 (42S22): Unknown column \'updated_by\' in \'field list\'','Traceback (most recent call last):\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 772, in cmd_query\n    self._cmysql.query(\n    ~~~~~~~~~~~~~~~~~~^\n        query,\n        ^^^^^^\n    ...<3 lines>...\n        query_attrs=self.query_attrs,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n_mysql_connector.MySQLInterfaceError: Unknown column \'updated_by\' in \'field list\'\n\nThe above exception was the direct cause of the following exception:\n\nTraceback (most recent call last):\n  File \"D:\\Code final 2\\app\\utils\\database.py\", line 73, in wrapper\n    return func(cursor, conn, *args, **kwargs)\n  File \"D:\\Code final 2\\app\\routes\\admin.py\", line 121, in get_templates\n    cursor.execute(\n    ~~~~~~~~~~~~~~^\n        \"SELECT id, name, department, updated_by \"\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n        \"FROM excel_templates ORDER BY id DESC\"\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\cursor_cext.py\", line 353, in execute\n    self._connection.cmd_query(\n    ~~~~~~~~~~~~~~~~~~~~~~~~~~^\n        self._stmt_partition[\"mappable_stmt\"],\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    ...<2 lines>...\n        raw_as_string=self._raw_as_string,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\opentelemetry\\context_propagation.py\", line 97, in wrapper\n    return method(cnx, *args, **kwargs)\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 781, in cmd_query\n    raise get_mysql_exception(\n        err.errno, msg=err.msg, sqlstate=err.sqlstate\n    ) from err\nmysql.connector.errors.ProgrammingError: 1054 (42S22): Unknown column \'updated_by\' in \'field list\'\n','2026-01-28 09:57:38'),(49,'approver_IT','/templates','1054 (42S22): Unknown column \'updated_by\' in \'field list\'','Traceback (most recent call last):\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 772, in cmd_query\n    self._cmysql.query(\n    ~~~~~~~~~~~~~~~~~~^\n        query,\n        ^^^^^^\n    ...<3 lines>...\n        query_attrs=self.query_attrs,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n_mysql_connector.MySQLInterfaceError: Unknown column \'updated_by\' in \'field list\'\n\nThe above exception was the direct cause of the following exception:\n\nTraceback (most recent call last):\n  File \"D:\\Code final 2\\app\\utils\\database.py\", line 73, in wrapper\n    return func(cursor, conn, *args, **kwargs)\n  File \"D:\\Code final 2\\app\\routes\\admin.py\", line 121, in get_templates\n    cursor.execute(\n    ~~~~~~~~~~~~~~^\n        \"SELECT id, name, department, updated_by \"\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n        \"FROM excel_templates ORDER BY id DESC\"\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\cursor_cext.py\", line 353, in execute\n    self._connection.cmd_query(\n    ~~~~~~~~~~~~~~~~~~~~~~~~~~^\n        self._stmt_partition[\"mappable_stmt\"],\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    ...<2 lines>...\n        raw_as_string=self._raw_as_string,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\opentelemetry\\context_propagation.py\", line 97, in wrapper\n    return method(cnx, *args, **kwargs)\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 781, in cmd_query\n    raise get_mysql_exception(\n        err.errno, msg=err.msg, sqlstate=err.sqlstate\n    ) from err\nmysql.connector.errors.ProgrammingError: 1054 (42S22): Unknown column \'updated_by\' in \'field list\'\n','2026-01-28 09:57:39'),(50,'approver_IT','/templates','1054 (42S22): Unknown column \'updated_by\' in \'field list\'','Traceback (most recent call last):\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 772, in cmd_query\n    self._cmysql.query(\n    ~~~~~~~~~~~~~~~~~~^\n        query,\n        ^^^^^^\n    ...<3 lines>...\n        query_attrs=self.query_attrs,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n_mysql_connector.MySQLInterfaceError: Unknown column \'updated_by\' in \'field list\'\n\nThe above exception was the direct cause of the following exception:\n\nTraceback (most recent call last):\n  File \"D:\\Code final 2\\app\\utils\\database.py\", line 73, in wrapper\n    return func(cursor, conn, *args, **kwargs)\n  File \"D:\\Code final 2\\app\\routes\\admin.py\", line 121, in get_templates\n    cursor.execute(\n    ~~~~~~~~~~~~~~^\n        \"SELECT id, name, department, updated_by \"\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n        \"FROM excel_templates ORDER BY id DESC\"\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\cursor_cext.py\", line 353, in execute\n    self._connection.cmd_query(\n    ~~~~~~~~~~~~~~~~~~~~~~~~~~^\n        self._stmt_partition[\"mappable_stmt\"],\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    ...<2 lines>...\n        raw_as_string=self._raw_as_string,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\opentelemetry\\context_propagation.py\", line 97, in wrapper\n    return method(cnx, *args, **kwargs)\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 781, in cmd_query\n    raise get_mysql_exception(\n        err.errno, msg=err.msg, sqlstate=err.sqlstate\n    ) from err\nmysql.connector.errors.ProgrammingError: 1054 (42S22): Unknown column \'updated_by\' in \'field list\'\n','2026-01-28 09:57:39'),(51,'admin','/templates','1054 (42S22): Unknown column \'updated_by\' in \'field list\'','Traceback (most recent call last):\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 772, in cmd_query\n    self._cmysql.query(\n    ~~~~~~~~~~~~~~~~~~^\n        query,\n        ^^^^^^\n    ...<3 lines>...\n        query_attrs=self.query_attrs,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n_mysql_connector.MySQLInterfaceError: Unknown column \'updated_by\' in \'field list\'\n\nThe above exception was the direct cause of the following exception:\n\nTraceback (most recent call last):\n  File \"D:\\Code final 2\\app\\utils\\database.py\", line 73, in wrapper\n    return func(cursor, conn, *args, **kwargs)\n  File \"D:\\Code final 2\\app\\routes\\admin.py\", line 121, in get_templates\n    cursor.execute(\n    ~~~~~~~~~~~~~~^\n        \"SELECT id, name, department, updated_by \"\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n        \"FROM excel_templates ORDER BY id DESC\"\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\cursor_cext.py\", line 353, in execute\n    self._connection.cmd_query(\n    ~~~~~~~~~~~~~~~~~~~~~~~~~~^\n        self._stmt_partition[\"mappable_stmt\"],\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    ...<2 lines>...\n        raw_as_string=self._raw_as_string,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\opentelemetry\\context_propagation.py\", line 97, in wrapper\n    return method(cnx, *args, **kwargs)\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 781, in cmd_query\n    raise get_mysql_exception(\n        err.errno, msg=err.msg, sqlstate=err.sqlstate\n    ) from err\nmysql.connector.errors.ProgrammingError: 1054 (42S22): Unknown column \'updated_by\' in \'field list\'\n','2026-01-28 09:57:40'),(52,'admin','/templates','1054 (42S22): Unknown column \'updated_by\' in \'field list\'','Traceback (most recent call last):\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 772, in cmd_query\n    self._cmysql.query(\n    ~~~~~~~~~~~~~~~~~~^\n        query,\n        ^^^^^^\n    ...<3 lines>...\n        query_attrs=self.query_attrs,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n_mysql_connector.MySQLInterfaceError: Unknown column \'updated_by\' in \'field list\'\n\nThe above exception was the direct cause of the following exception:\n\nTraceback (most recent call last):\n  File \"D:\\Code final 2\\app\\utils\\database.py\", line 73, in wrapper\n    return func(cursor, conn, *args, **kwargs)\n  File \"D:\\Code final 2\\app\\routes\\admin.py\", line 121, in get_templates\n    cursor.execute(\n    ~~~~~~~~~~~~~~^\n        \"SELECT id, name, department, updated_by \"\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n        \"FROM excel_templates ORDER BY id DESC\"\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\cursor_cext.py\", line 353, in execute\n    self._connection.cmd_query(\n    ~~~~~~~~~~~~~~~~~~~~~~~~~~^\n        self._stmt_partition[\"mappable_stmt\"],\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    ...<2 lines>...\n        raw_as_string=self._raw_as_string,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\opentelemetry\\context_propagation.py\", line 97, in wrapper\n    return method(cnx, *args, **kwargs)\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 781, in cmd_query\n    raise get_mysql_exception(\n        err.errno, msg=err.msg, sqlstate=err.sqlstate\n    ) from err\nmysql.connector.errors.ProgrammingError: 1054 (42S22): Unknown column \'updated_by\' in \'field list\'\n','2026-01-28 09:58:16'),(53,'Nanda_AH','/api/add_excel_row','\'NoneType\' object has no attribute \'items\'','Traceback (most recent call last):\n  File \"D:\\Code final 2\\app\\routes\\api.py\", line 323, in api_add_excel_row\n    for col, val in new_row.items():\n                    ^^^^^^^^^^^^^\nAttributeError: \'NoneType\' object has no attribute \'items\'\n','2026-01-28 10:04:07'),(54,'Nanda_AH','/api/add_excel_row','\'NoneType\' object has no attribute \'items\'','Traceback (most recent call last):\n  File \"D:\\Code final 2\\app\\routes\\api.py\", line 323, in api_add_excel_row\n    for col, val in new_row.items():\n                    ^^^^^^^^^^^^^\nAttributeError: \'NoneType\' object has no attribute \'items\'\n','2026-01-28 10:04:12'),(55,'Nanda_AH','/api/add_excel_row','\'NoneType\' object has no attribute \'items\'','Traceback (most recent call last):\n  File \"D:\\Code final 2\\app\\routes\\api.py\", line 323, in api_add_excel_row\n    for col, val in new_row.items():\n                    ^^^^^^^^^^^^^\nAttributeError: \'NoneType\' object has no attribute \'items\'\n','2026-01-28 10:04:42'),(56,'Nanda_AH','/templates','1054 (42S22): Unknown column \'updated_by\' in \'field list\'','Traceback (most recent call last):\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 772, in cmd_query\n    self._cmysql.query(\n    ~~~~~~~~~~~~~~~~~~^\n        query,\n        ^^^^^^\n    ...<3 lines>...\n        query_attrs=self.query_attrs,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n_mysql_connector.MySQLInterfaceError: Unknown column \'updated_by\' in \'field list\'\n\nThe above exception was the direct cause of the following exception:\n\nTraceback (most recent call last):\n  File \"D:\\Code final 2\\app\\utils\\database.py\", line 73, in wrapper\n    return func(cursor, conn, *args, **kwargs)\n  File \"D:\\Code final 2\\app\\routes\\admin.py\", line 121, in get_templates\n    cursor.execute(\n    ~~~~~~~~~~~~~~^\n        \"SELECT id, name, department, updated_by \"\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n        \"FROM excel_templates ORDER BY id DESC\"\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\cursor_cext.py\", line 353, in execute\n    self._connection.cmd_query(\n    ~~~~~~~~~~~~~~~~~~~~~~~~~~^\n        self._stmt_partition[\"mappable_stmt\"],\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    ...<2 lines>...\n        raw_as_string=self._raw_as_string,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\opentelemetry\\context_propagation.py\", line 97, in wrapper\n    return method(cnx, *args, **kwargs)\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 781, in cmd_query\n    raise get_mysql_exception(\n        err.errno, msg=err.msg, sqlstate=err.sqlstate\n    ) from err\nmysql.connector.errors.ProgrammingError: 1054 (42S22): Unknown column \'updated_by\' in \'field list\'\n','2026-01-28 10:05:29'),(57,'approver_IT','/templates','1054 (42S22): Unknown column \'updated_by\' in \'field list\'','Traceback (most recent call last):\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 772, in cmd_query\n    self._cmysql.query(\n    ~~~~~~~~~~~~~~~~~~^\n        query,\n        ^^^^^^\n    ...<3 lines>...\n        query_attrs=self.query_attrs,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n_mysql_connector.MySQLInterfaceError: Unknown column \'updated_by\' in \'field list\'\n\nThe above exception was the direct cause of the following exception:\n\nTraceback (most recent call last):\n  File \"D:\\Code final 2\\app\\utils\\database.py\", line 73, in wrapper\n    return func(cursor, conn, *args, **kwargs)\n  File \"D:\\Code final 2\\app\\routes\\admin.py\", line 121, in get_templates\n    cursor.execute(\n    ~~~~~~~~~~~~~~^\n        \"SELECT id, name, department, updated_by \"\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n        \"FROM excel_templates ORDER BY id DESC\"\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\cursor_cext.py\", line 353, in execute\n    self._connection.cmd_query(\n    ~~~~~~~~~~~~~~~~~~~~~~~~~~^\n        self._stmt_partition[\"mappable_stmt\"],\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    ...<2 lines>...\n        raw_as_string=self._raw_as_string,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\opentelemetry\\context_propagation.py\", line 97, in wrapper\n    return method(cnx, *args, **kwargs)\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 781, in cmd_query\n    raise get_mysql_exception(\n        err.errno, msg=err.msg, sqlstate=err.sqlstate\n    ) from err\nmysql.connector.errors.ProgrammingError: 1054 (42S22): Unknown column \'updated_by\' in \'field list\'\n','2026-01-28 10:08:28'),(58,'approver_IT','/templates','1054 (42S22): Unknown column \'updated_by\' in \'field list\'','Traceback (most recent call last):\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 772, in cmd_query\n    self._cmysql.query(\n    ~~~~~~~~~~~~~~~~~~^\n        query,\n        ^^^^^^\n    ...<3 lines>...\n        query_attrs=self.query_attrs,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n_mysql_connector.MySQLInterfaceError: Unknown column \'updated_by\' in \'field list\'\n\nThe above exception was the direct cause of the following exception:\n\nTraceback (most recent call last):\n  File \"D:\\Code final 2\\app\\utils\\database.py\", line 73, in wrapper\n    return func(cursor, conn, *args, **kwargs)\n  File \"D:\\Code final 2\\app\\routes\\admin.py\", line 121, in get_templates\n    cursor.execute(\n    ~~~~~~~~~~~~~~^\n        \"SELECT id, name, department, updated_by \"\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n        \"FROM excel_templates ORDER BY id DESC\"\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\cursor_cext.py\", line 353, in execute\n    self._connection.cmd_query(\n    ~~~~~~~~~~~~~~~~~~~~~~~~~~^\n        self._stmt_partition[\"mappable_stmt\"],\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    ...<2 lines>...\n        raw_as_string=self._raw_as_string,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\opentelemetry\\context_propagation.py\", line 97, in wrapper\n    return method(cnx, *args, **kwargs)\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 781, in cmd_query\n    raise get_mysql_exception(\n        err.errno, msg=err.msg, sqlstate=err.sqlstate\n    ) from err\nmysql.connector.errors.ProgrammingError: 1054 (42S22): Unknown column \'updated_by\' in \'field list\'\n','2026-01-28 10:20:54'),(59,'approver_IT','/api/add_excel_row','\'NoneType\' object has no attribute \'items\'','Traceback (most recent call last):\n  File \"D:\\Code final 2\\app\\routes\\api.py\", line 323, in api_add_excel_row\n    for col, val in new_row.items():\n                    ^^^^^^^^^^^^^\nAttributeError: \'NoneType\' object has no attribute \'items\'\n','2026-01-28 10:21:33'),(60,'approver_IT','/api/add_excel_row','\'NoneType\' object has no attribute \'items\'','Traceback (most recent call last):\n  File \"D:\\Code final 2\\app\\routes\\api.py\", line 323, in api_add_excel_row\n    for col, val in new_row.items():\n                    ^^^^^^^^^^^^^\nAttributeError: \'NoneType\' object has no attribute \'items\'\n','2026-01-28 10:21:57'),(61,'approver_IT','/api/add_excel_row','\'NoneType\' object has no attribute \'items\'','Traceback (most recent call last):\n  File \"D:\\Code final 2\\app\\routes\\api.py\", line 323, in api_add_excel_row\n    for col, val in new_row.items():\n                    ^^^^^^^^^^^^^\nAttributeError: \'NoneType\' object has no attribute \'items\'\n','2026-01-28 10:22:14'),(62,'approver_IT','/api/add_excel_row','\'NoneType\' object has no attribute \'items\'','Traceback (most recent call last):\n  File \"D:\\Code final 2\\app\\routes\\api.py\", line 323, in api_add_excel_row\n    for col, val in new_row.items():\n                    ^^^^^^^^^^^^^\nAttributeError: \'NoneType\' object has no attribute \'items\'\n','2026-01-28 10:22:27'),(63,'admin','/templates','1054 (42S22): Unknown column \'updated_by\' in \'field list\'','Traceback (most recent call last):\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 772, in cmd_query\n    self._cmysql.query(\n    ~~~~~~~~~~~~~~~~~~^\n        query,\n        ^^^^^^\n    ...<3 lines>...\n        query_attrs=self.query_attrs,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n_mysql_connector.MySQLInterfaceError: Unknown column \'updated_by\' in \'field list\'\n\nThe above exception was the direct cause of the following exception:\n\nTraceback (most recent call last):\n  File \"D:\\Code final 2\\app\\utils\\database.py\", line 73, in wrapper\n    return func(cursor, conn, *args, **kwargs)\n  File \"D:\\Code final 2\\app\\routes\\admin.py\", line 121, in get_templates\n    cursor.execute(\n    ~~~~~~~~~~~~~~^\n        \"SELECT id, name, department, updated_by \"\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n        \"FROM excel_templates ORDER BY id DESC\"\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\cursor_cext.py\", line 353, in execute\n    self._connection.cmd_query(\n    ~~~~~~~~~~~~~~~~~~~~~~~~~~^\n        self._stmt_partition[\"mappable_stmt\"],\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    ...<2 lines>...\n        raw_as_string=self._raw_as_string,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\opentelemetry\\context_propagation.py\", line 97, in wrapper\n    return method(cnx, *args, **kwargs)\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 781, in cmd_query\n    raise get_mysql_exception(\n        err.errno, msg=err.msg, sqlstate=err.sqlstate\n    ) from err\nmysql.connector.errors.ProgrammingError: 1054 (42S22): Unknown column \'updated_by\' in \'field list\'\n','2026-01-28 10:26:34'),(64,'admin','/templates','1054 (42S22): Unknown column \'updated_by\' in \'field list\'','Traceback (most recent call last):\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 772, in cmd_query\n    self._cmysql.query(\n    ~~~~~~~~~~~~~~~~~~^\n        query,\n        ^^^^^^\n    ...<3 lines>...\n        query_attrs=self.query_attrs,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n_mysql_connector.MySQLInterfaceError: Unknown column \'updated_by\' in \'field list\'\n\nThe above exception was the direct cause of the following exception:\n\nTraceback (most recent call last):\n  File \"D:\\Code final 2\\app\\utils\\database.py\", line 73, in wrapper\n    return func(cursor, conn, *args, **kwargs)\n  File \"D:\\Code final 2\\app\\routes\\admin.py\", line 121, in get_templates\n    cursor.execute(\n    ~~~~~~~~~~~~~~^\n        \"SELECT id, name, department, updated_by \"\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n        \"FROM excel_templates ORDER BY id DESC\"\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\cursor_cext.py\", line 353, in execute\n    self._connection.cmd_query(\n    ~~~~~~~~~~~~~~~~~~~~~~~~~~^\n        self._stmt_partition[\"mappable_stmt\"],\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    ...<2 lines>...\n        raw_as_string=self._raw_as_string,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\opentelemetry\\context_propagation.py\", line 97, in wrapper\n    return method(cnx, *args, **kwargs)\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 781, in cmd_query\n    raise get_mysql_exception(\n        err.errno, msg=err.msg, sqlstate=err.sqlstate\n    ) from err\nmysql.connector.errors.ProgrammingError: 1054 (42S22): Unknown column \'updated_by\' in \'field list\'\n','2026-01-28 10:26:51'),(65,'admin','/templates','1054 (42S22): Unknown column \'updated_by\' in \'field list\'','Traceback (most recent call last):\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 772, in cmd_query\n    self._cmysql.query(\n    ~~~~~~~~~~~~~~~~~~^\n        query,\n        ^^^^^^\n    ...<3 lines>...\n        query_attrs=self.query_attrs,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n_mysql_connector.MySQLInterfaceError: Unknown column \'updated_by\' in \'field list\'\n\nThe above exception was the direct cause of the following exception:\n\nTraceback (most recent call last):\n  File \"D:\\Code final 2\\app\\utils\\database.py\", line 73, in wrapper\n    return func(cursor, conn, *args, **kwargs)\n  File \"D:\\Code final 2\\app\\routes\\admin.py\", line 121, in get_templates\n    cursor.execute(\n    ~~~~~~~~~~~~~~^\n        \"SELECT id, name, department, updated_by \"\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n        \"FROM excel_templates ORDER BY id DESC\"\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\cursor_cext.py\", line 353, in execute\n    self._connection.cmd_query(\n    ~~~~~~~~~~~~~~~~~~~~~~~~~~^\n        self._stmt_partition[\"mappable_stmt\"],\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    ...<2 lines>...\n        raw_as_string=self._raw_as_string,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\opentelemetry\\context_propagation.py\", line 97, in wrapper\n    return method(cnx, *args, **kwargs)\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 781, in cmd_query\n    raise get_mysql_exception(\n        err.errno, msg=err.msg, sqlstate=err.sqlstate\n    ) from err\nmysql.connector.errors.ProgrammingError: 1054 (42S22): Unknown column \'updated_by\' in \'field list\'\n','2026-01-28 10:27:00'),(66,'admin','/api/add_excel_row','\'NoneType\' object has no attribute \'items\'','Traceback (most recent call last):\n  File \"D:\\Code final 2\\app\\routes\\api.py\", line 323, in api_add_excel_row\n    for col, val in new_row.items():\n                    ^^^^^^^^^^^^^\nAttributeError: \'NoneType\' object has no attribute \'items\'\n','2026-01-28 10:27:11'),(67,'admin','/api/add_excel_row','\'NoneType\' object has no attribute \'items\'','Traceback (most recent call last):\n  File \"D:\\Code final 2\\app\\routes\\api.py\", line 323, in api_add_excel_row\n    for col, val in new_row.items():\n                    ^^^^^^^^^^^^^\nAttributeError: \'NoneType\' object has no attribute \'items\'\n','2026-01-28 10:27:19'),(68,'admin','/templates','1054 (42S22): Unknown column \'updated_by\' in \'field list\'','Traceback (most recent call last):\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 772, in cmd_query\n    self._cmysql.query(\n    ~~~~~~~~~~~~~~~~~~^\n        query,\n        ^^^^^^\n    ...<3 lines>...\n        query_attrs=self.query_attrs,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n_mysql_connector.MySQLInterfaceError: Unknown column \'updated_by\' in \'field list\'\n\nThe above exception was the direct cause of the following exception:\n\nTraceback (most recent call last):\n  File \"D:\\Code final 2\\app\\utils\\database.py\", line 73, in wrapper\n    return func(cursor, conn, *args, **kwargs)\n  File \"D:\\Code final 2\\app\\routes\\admin.py\", line 121, in get_templates\n    cursor.execute(\n    ~~~~~~~~~~~~~~^\n        \"SELECT id, name, department, updated_by \"\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n        \"FROM excel_templates ORDER BY id DESC\"\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\cursor_cext.py\", line 353, in execute\n    self._connection.cmd_query(\n    ~~~~~~~~~~~~~~~~~~~~~~~~~~^\n        self._stmt_partition[\"mappable_stmt\"],\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    ...<2 lines>...\n        raw_as_string=self._raw_as_string,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\opentelemetry\\context_propagation.py\", line 97, in wrapper\n    return method(cnx, *args, **kwargs)\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 781, in cmd_query\n    raise get_mysql_exception(\n        err.errno, msg=err.msg, sqlstate=err.sqlstate\n    ) from err\nmysql.connector.errors.ProgrammingError: 1054 (42S22): Unknown column \'updated_by\' in \'field list\'\n','2026-01-28 10:28:24'),(69,'admin','/templates','1054 (42S22): Unknown column \'updated_by\' in \'field list\'','Traceback (most recent call last):\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 772, in cmd_query\n    self._cmysql.query(\n    ~~~~~~~~~~~~~~~~~~^\n        query,\n        ^^^^^^\n    ...<3 lines>...\n        query_attrs=self.query_attrs,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n_mysql_connector.MySQLInterfaceError: Unknown column \'updated_by\' in \'field list\'\n\nThe above exception was the direct cause of the following exception:\n\nTraceback (most recent call last):\n  File \"D:\\Code final 2\\app\\utils\\database.py\", line 73, in wrapper\n    return func(cursor, conn, *args, **kwargs)\n  File \"D:\\Code final 2\\app\\routes\\admin.py\", line 121, in get_templates\n    cursor.execute(\n    ~~~~~~~~~~~~~~^\n        \"SELECT id, name, department, updated_by \"\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n        \"FROM excel_templates ORDER BY id DESC\"\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\cursor_cext.py\", line 353, in execute\n    self._connection.cmd_query(\n    ~~~~~~~~~~~~~~~~~~~~~~~~~~^\n        self._stmt_partition[\"mappable_stmt\"],\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    ...<2 lines>...\n        raw_as_string=self._raw_as_string,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\opentelemetry\\context_propagation.py\", line 97, in wrapper\n    return method(cnx, *args, **kwargs)\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 781, in cmd_query\n    raise get_mysql_exception(\n        err.errno, msg=err.msg, sqlstate=err.sqlstate\n    ) from err\nmysql.connector.errors.ProgrammingError: 1054 (42S22): Unknown column \'updated_by\' in \'field list\'\n','2026-01-28 10:39:16'),(70,'admin','/api/add_excel_row','\'NoneType\' object has no attribute \'items\'','Traceback (most recent call last):\n  File \"D:\\Code final 2\\app\\routes\\api.py\", line 323, in api_add_excel_row\n    for col, val in new_row.items():\n                    ^^^^^^^^^^^^^\nAttributeError: \'NoneType\' object has no attribute \'items\'\n','2026-01-28 10:39:35'),(71,'admin','/templates','1054 (42S22): Unknown column \'updated_by\' in \'field list\'','Traceback (most recent call last):\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 772, in cmd_query\n    self._cmysql.query(\n    ~~~~~~~~~~~~~~~~~~^\n        query,\n        ^^^^^^\n    ...<3 lines>...\n        query_attrs=self.query_attrs,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n_mysql_connector.MySQLInterfaceError: Unknown column \'updated_by\' in \'field list\'\n\nThe above exception was the direct cause of the following exception:\n\nTraceback (most recent call last):\n  File \"D:\\Code final 2\\app\\utils\\database.py\", line 73, in wrapper\n    return func(cursor, conn, *args, **kwargs)\n  File \"D:\\Code final 2\\app\\routes\\admin.py\", line 121, in get_templates\n    cursor.execute(\n    ~~~~~~~~~~~~~~^\n        \"SELECT id, name, department, updated_by \"\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n        \"FROM excel_templates ORDER BY id DESC\"\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\cursor_cext.py\", line 353, in execute\n    self._connection.cmd_query(\n    ~~~~~~~~~~~~~~~~~~~~~~~~~~^\n        self._stmt_partition[\"mappable_stmt\"],\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    ...<2 lines>...\n        raw_as_string=self._raw_as_string,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\opentelemetry\\context_propagation.py\", line 97, in wrapper\n    return method(cnx, *args, **kwargs)\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 781, in cmd_query\n    raise get_mysql_exception(\n        err.errno, msg=err.msg, sqlstate=err.sqlstate\n    ) from err\nmysql.connector.errors.ProgrammingError: 1054 (42S22): Unknown column \'updated_by\' in \'field list\'\n','2026-01-28 10:46:07'),(72,'admin','/templates','1054 (42S22): Unknown column \'updated_by\' in \'field list\'','Traceback (most recent call last):\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 772, in cmd_query\n    self._cmysql.query(\n    ~~~~~~~~~~~~~~~~~~^\n        query,\n        ^^^^^^\n    ...<3 lines>...\n        query_attrs=self.query_attrs,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n_mysql_connector.MySQLInterfaceError: Unknown column \'updated_by\' in \'field list\'\n\nThe above exception was the direct cause of the following exception:\n\nTraceback (most recent call last):\n  File \"D:\\Code final 2\\app\\utils\\database.py\", line 73, in wrapper\n    return func(cursor, conn, *args, **kwargs)\n  File \"D:\\Code final 2\\app\\routes\\admin.py\", line 121, in get_templates\n    cursor.execute(\n    ~~~~~~~~~~~~~~^\n        \"SELECT id, name, department, updated_by \"\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n        \"FROM excel_templates ORDER BY id DESC\"\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\cursor_cext.py\", line 353, in execute\n    self._connection.cmd_query(\n    ~~~~~~~~~~~~~~~~~~~~~~~~~~^\n        self._stmt_partition[\"mappable_stmt\"],\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    ...<2 lines>...\n        raw_as_string=self._raw_as_string,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\opentelemetry\\context_propagation.py\", line 97, in wrapper\n    return method(cnx, *args, **kwargs)\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 781, in cmd_query\n    raise get_mysql_exception(\n        err.errno, msg=err.msg, sqlstate=err.sqlstate\n    ) from err\nmysql.connector.errors.ProgrammingError: 1054 (42S22): Unknown column \'updated_by\' in \'field list\'\n','2026-01-28 10:46:54'),(73,'approver_IT','/api/add_excel_row','\'NoneType\' object has no attribute \'items\'','Traceback (most recent call last):\n  File \"D:\\Code final 2\\app\\routes\\api.py\", line 323, in api_add_excel_row\n    for col, val in new_row.items():\n                    ^^^^^^^^^^^^^\nAttributeError: \'NoneType\' object has no attribute \'items\'\n','2026-01-28 11:30:37'),(74,'approver_IT','/api/add_excel_row','\'NoneType\' object has no attribute \'items\'','Traceback (most recent call last):\n  File \"D:\\Code final 2\\app\\routes\\api.py\", line 323, in api_add_excel_row\n    for col, val in new_row.items():\n                    ^^^^^^^^^^^^^\nAttributeError: \'NoneType\' object has no attribute \'items\'\n','2026-01-28 11:30:45'),(75,'admin','/templates','1054 (42S22): Unknown column \'updated_by\' in \'field list\'','Traceback (most recent call last):\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 772, in cmd_query\n    self._cmysql.query(\n    ~~~~~~~~~~~~~~~~~~^\n        query,\n        ^^^^^^\n    ...<3 lines>...\n        query_attrs=self.query_attrs,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n_mysql_connector.MySQLInterfaceError: Unknown column \'updated_by\' in \'field list\'\n\nThe above exception was the direct cause of the following exception:\n\nTraceback (most recent call last):\n  File \"D:\\Code final 2\\app\\utils\\database.py\", line 73, in wrapper\n    return func(cursor, conn, *args, **kwargs)\n  File \"D:\\Code final 2\\app\\routes\\admin.py\", line 121, in get_templates\n    cursor.execute(\n    ~~~~~~~~~~~~~~^\n        \"SELECT id, name, department, updated_by \"\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n        \"FROM excel_templates ORDER BY id DESC\"\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\cursor_cext.py\", line 353, in execute\n    self._connection.cmd_query(\n    ~~~~~~~~~~~~~~~~~~~~~~~~~~^\n        self._stmt_partition[\"mappable_stmt\"],\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    ...<2 lines>...\n        raw_as_string=self._raw_as_string,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\opentelemetry\\context_propagation.py\", line 97, in wrapper\n    return method(cnx, *args, **kwargs)\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 781, in cmd_query\n    raise get_mysql_exception(\n        err.errno, msg=err.msg, sqlstate=err.sqlstate\n    ) from err\nmysql.connector.errors.ProgrammingError: 1054 (42S22): Unknown column \'updated_by\' in \'field list\'\n','2026-01-28 11:35:12'),(76,'admin','/templates','1054 (42S22): Unknown column \'updated_by\' in \'field list\'','Traceback (most recent call last):\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 772, in cmd_query\n    self._cmysql.query(\n    ~~~~~~~~~~~~~~~~~~^\n        query,\n        ^^^^^^\n    ...<3 lines>...\n        query_attrs=self.query_attrs,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n_mysql_connector.MySQLInterfaceError: Unknown column \'updated_by\' in \'field list\'\n\nThe above exception was the direct cause of the following exception:\n\nTraceback (most recent call last):\n  File \"D:\\Code final 2\\app\\utils\\database.py\", line 73, in wrapper\n    return func(cursor, conn, *args, **kwargs)\n  File \"D:\\Code final 2\\app\\routes\\admin.py\", line 121, in get_templates\n    cursor.execute(\n    ~~~~~~~~~~~~~~^\n        \"SELECT id, name, department, updated_by \"\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n        \"FROM excel_templates ORDER BY id DESC\"\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\cursor_cext.py\", line 353, in execute\n    self._connection.cmd_query(\n    ~~~~~~~~~~~~~~~~~~~~~~~~~~^\n        self._stmt_partition[\"mappable_stmt\"],\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    ...<2 lines>...\n        raw_as_string=self._raw_as_string,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\opentelemetry\\context_propagation.py\", line 97, in wrapper\n    return method(cnx, *args, **kwargs)\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 781, in cmd_query\n    raise get_mysql_exception(\n        err.errno, msg=err.msg, sqlstate=err.sqlstate\n    ) from err\nmysql.connector.errors.ProgrammingError: 1054 (42S22): Unknown column \'updated_by\' in \'field list\'\n','2026-01-28 11:35:32'),(77,'approver_IT','/api/update_excel_cell','1366 (HY000): Incorrect integer value: \'\' for column \'is_approve\' at row 1','Traceback (most recent call last):\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 772, in cmd_query\n    self._cmysql.query(\n    ~~~~~~~~~~~~~~~~~~^\n        query,\n        ^^^^^^\n    ...<3 lines>...\n        query_attrs=self.query_attrs,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n_mysql_connector.MySQLInterfaceError: Incorrect integer value: \'\' for column \'is_approve\' at row 1\n\nThe above exception was the direct cause of the following exception:\n\nTraceback (most recent call last):\n  File \"D:\\Code final 2\\app\\routes\\api.py\", line 704, in api_update_excel_cell\n    cursor.execute(sql, (value, row_id))\n    ~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\cursor_cext.py\", line 353, in execute\n    self._connection.cmd_query(\n    ~~~~~~~~~~~~~~~~~~~~~~~~~~^\n        self._stmt_partition[\"mappable_stmt\"],\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    ...<2 lines>...\n        raw_as_string=self._raw_as_string,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\opentelemetry\\context_propagation.py\", line 97, in wrapper\n    return method(cnx, *args, **kwargs)\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 781, in cmd_query\n    raise get_mysql_exception(\n        err.errno, msg=err.msg, sqlstate=err.sqlstate\n    ) from err\nmysql.connector.errors.DatabaseError: 1366 (HY000): Incorrect integer value: \'\' for column \'is_approve\' at row 1\n','2026-01-28 11:50:09'),(78,'approver_IT','/api/update_excel_cell','1366 (HY000): Incorrect integer value: \'\' for column \'is_approve\' at row 1','Traceback (most recent call last):\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 772, in cmd_query\n    self._cmysql.query(\n    ~~~~~~~~~~~~~~~~~~^\n        query,\n        ^^^^^^\n    ...<3 lines>...\n        query_attrs=self.query_attrs,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n_mysql_connector.MySQLInterfaceError: Incorrect integer value: \'\' for column \'is_approve\' at row 1\n\nThe above exception was the direct cause of the following exception:\n\nTraceback (most recent call last):\n  File \"D:\\Code final 2\\app\\routes\\api.py\", line 704, in api_update_excel_cell\n    cursor.execute(sql, (value, row_id))\n    ~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\cursor_cext.py\", line 353, in execute\n    self._connection.cmd_query(\n    ~~~~~~~~~~~~~~~~~~~~~~~~~~^\n        self._stmt_partition[\"mappable_stmt\"],\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    ...<2 lines>...\n        raw_as_string=self._raw_as_string,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\opentelemetry\\context_propagation.py\", line 97, in wrapper\n    return method(cnx, *args, **kwargs)\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 781, in cmd_query\n    raise get_mysql_exception(\n        err.errno, msg=err.msg, sqlstate=err.sqlstate\n    ) from err\nmysql.connector.errors.DatabaseError: 1366 (HY000): Incorrect integer value: \'\' for column \'is_approve\' at row 1\n','2026-01-28 11:50:10'),(79,'approver_IT','/api/add_excel_row','1364 (HY000): Field \'region_id\' doesn\'t have a default value','Traceback (most recent call last):\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 772, in cmd_query\n    self._cmysql.query(\n    ~~~~~~~~~~~~~~~~~~^\n        query,\n        ^^^^^^\n    ...<3 lines>...\n        query_attrs=self.query_attrs,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n_mysql_connector.MySQLInterfaceError: Field \'region_id\' doesn\'t have a default value\n\nThe above exception was the direct cause of the following exception:\n\nTraceback (most recent call last):\n  File \"D:\\Code final 2\\app\\routes\\api.py\", line 370, in api_add_excel_row\n    cursor.execute(sql, tuple(insert_vals))\n    ~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\cursor_cext.py\", line 353, in execute\n    self._connection.cmd_query(\n    ~~~~~~~~~~~~~~~~~~~~~~~~~~^\n        self._stmt_partition[\"mappable_stmt\"],\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    ...<2 lines>...\n        raw_as_string=self._raw_as_string,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\opentelemetry\\context_propagation.py\", line 97, in wrapper\n    return method(cnx, *args, **kwargs)\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 781, in cmd_query\n    raise get_mysql_exception(\n        err.errno, msg=err.msg, sqlstate=err.sqlstate\n    ) from err\nmysql.connector.errors.DatabaseError: 1364 (HY000): Field \'region_id\' doesn\'t have a default value\n','2026-01-29 04:55:05'),(80,'approver_IT','/api/add_excel_row','1364 (HY000): Field \'region_id\' doesn\'t have a default value','Traceback (most recent call last):\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 772, in cmd_query\n    self._cmysql.query(\n    ~~~~~~~~~~~~~~~~~~^\n        query,\n        ^^^^^^\n    ...<3 lines>...\n        query_attrs=self.query_attrs,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n_mysql_connector.MySQLInterfaceError: Field \'region_id\' doesn\'t have a default value\n\nThe above exception was the direct cause of the following exception:\n\nTraceback (most recent call last):\n  File \"D:\\Code final 2\\app\\routes\\api.py\", line 370, in api_add_excel_row\n    cursor.execute(sql, tuple(insert_vals))\n    ~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\cursor_cext.py\", line 353, in execute\n    self._connection.cmd_query(\n    ~~~~~~~~~~~~~~~~~~~~~~~~~~^\n        self._stmt_partition[\"mappable_stmt\"],\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    ...<2 lines>...\n        raw_as_string=self._raw_as_string,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\opentelemetry\\context_propagation.py\", line 97, in wrapper\n    return method(cnx, *args, **kwargs)\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 781, in cmd_query\n    raise get_mysql_exception(\n        err.errno, msg=err.msg, sqlstate=err.sqlstate\n    ) from err\nmysql.connector.errors.DatabaseError: 1364 (HY000): Field \'region_id\' doesn\'t have a default value\n','2026-01-29 04:55:18'),(81,'approver_IT','/api/add_excel_row','1364 (HY000): Field \'livestock_num\' doesn\'t have a default value','Traceback (most recent call last):\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 772, in cmd_query\n    self._cmysql.query(\n    ~~~~~~~~~~~~~~~~~~^\n        query,\n        ^^^^^^\n    ...<3 lines>...\n        query_attrs=self.query_attrs,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n_mysql_connector.MySQLInterfaceError: Field \'livestock_num\' doesn\'t have a default value\n\nThe above exception was the direct cause of the following exception:\n\nTraceback (most recent call last):\n  File \"D:\\Code final 2\\app\\routes\\api.py\", line 370, in api_add_excel_row\n    cursor.execute(sql, tuple(insert_vals))\n    ~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\cursor_cext.py\", line 353, in execute\n    self._connection.cmd_query(\n    ~~~~~~~~~~~~~~~~~~~~~~~~~~^\n        self._stmt_partition[\"mappable_stmt\"],\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    ...<2 lines>...\n        raw_as_string=self._raw_as_string,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\opentelemetry\\context_propagation.py\", line 97, in wrapper\n    return method(cnx, *args, **kwargs)\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 781, in cmd_query\n    raise get_mysql_exception(\n        err.errno, msg=err.msg, sqlstate=err.sqlstate\n    ) from err\nmysql.connector.errors.DatabaseError: 1364 (HY000): Field \'livestock_num\' doesn\'t have a default value\n','2026-01-29 06:36:21'),(82,'Nanda_AH','/uploads','1054 (42S22): Unknown column \'reapproval_requested\' in \'field list\'','Traceback (most recent call last):\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 772, in cmd_query\n    self._cmysql.query(\n    ~~~~~~~~~~~~~~~~~~^\n        query,\n        ^^^^^^\n    ...<3 lines>...\n        query_attrs=self.query_attrs,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n_mysql_connector.MySQLInterfaceError: Unknown column \'reapproval_requested\' in \'field list\'\n\nThe above exception was the direct cause of the following exception:\n\nTraceback (most recent call last):\n  File \"D:\\Code final 2\\app\\routes\\data.py\", line 310, in uploads_list\n    cursor.execute(\"\"\"\n    ~~~~~~~~~~~~~~^^^^\n        SELECT\n        ^^^^^^\n    ...<12 lines>...\n        ORDER BY uploaded_on DESC\n        ^^^^^^^^^^^^^^^^^^^^^^^^^\n    \"\"\", (dept,))\n    ^^^^^^^^^^^^^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\cursor_cext.py\", line 353, in execute\n    self._connection.cmd_query(\n    ~~~~~~~~~~~~~~~~~~~~~~~~~~^\n        self._stmt_partition[\"mappable_stmt\"],\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    ...<2 lines>...\n        raw_as_string=self._raw_as_string,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\opentelemetry\\context_propagation.py\", line 97, in wrapper\n    return method(cnx, *args, **kwargs)\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 781, in cmd_query\n    raise get_mysql_exception(\n        err.errno, msg=err.msg, sqlstate=err.sqlstate\n    ) from err\nmysql.connector.errors.ProgrammingError: 1054 (42S22): Unknown column \'reapproval_requested\' in \'field list\'\n','2026-01-29 07:07:31'),(83,'Nanda_AH','/uploads','1054 (42S22): Unknown column \'reapproval_requested\' in \'field list\'','Traceback (most recent call last):\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 772, in cmd_query\n    self._cmysql.query(\n    ~~~~~~~~~~~~~~~~~~^\n        query,\n        ^^^^^^\n    ...<3 lines>...\n        query_attrs=self.query_attrs,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n_mysql_connector.MySQLInterfaceError: Unknown column \'reapproval_requested\' in \'field list\'\n\nThe above exception was the direct cause of the following exception:\n\nTraceback (most recent call last):\n  File \"D:\\Code final 2\\app\\routes\\data.py\", line 310, in uploads_list\n    cursor.execute(\"\"\"\n    ~~~~~~~~~~~~~~^^^^\n        SELECT\n        ^^^^^^\n    ...<12 lines>...\n        ORDER BY uploaded_on DESC\n        ^^^^^^^^^^^^^^^^^^^^^^^^^\n    \"\"\", (dept,))\n    ^^^^^^^^^^^^^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\cursor_cext.py\", line 353, in execute\n    self._connection.cmd_query(\n    ~~~~~~~~~~~~~~~~~~~~~~~~~~^\n        self._stmt_partition[\"mappable_stmt\"],\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    ...<2 lines>...\n        raw_as_string=self._raw_as_string,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\opentelemetry\\context_propagation.py\", line 97, in wrapper\n    return method(cnx, *args, **kwargs)\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 781, in cmd_query\n    raise get_mysql_exception(\n        err.errno, msg=err.msg, sqlstate=err.sqlstate\n    ) from err\nmysql.connector.errors.ProgrammingError: 1054 (42S22): Unknown column \'reapproval_requested\' in \'field list\'\n','2026-01-29 07:07:31'),(84,'Nanda_AH','/upload_transaction','1452 (23000): Cannot add or update a child row: a foreign key constraint fails (`esp_stg_db`.`tbl_livestock_census`, CONSTRAINT `tbl_livestock_census_ibfk_3` FOREIGN KEY (`year_id`) REFERENCES `tbl_year_master` (`year_id`))','Traceback (most recent call last):\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 772, in cmd_query\n    self._cmysql.query(\n    ~~~~~~~~~~~~~~~~~~^\n        query,\n        ^^^^^^\n    ...<3 lines>...\n        query_attrs=self.query_attrs,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n_mysql_connector.MySQLInterfaceError: Cannot add or update a child row: a foreign key constraint fails (`esp_stg_db`.`tbl_livestock_census`, CONSTRAINT `tbl_livestock_census_ibfk_3` FOREIGN KEY (`year_id`) REFERENCES `tbl_year_master` (`year_id`))\n\nThe above exception was the direct cause of the following exception:\n\nTraceback (most recent call last):\n  File \"D:\\Code final 2\\app\\routes\\data.py\", line 191, in _process_upload_transaction\n    cursor.executemany(sql, values)\n    ~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\cursor_cext.py\", line 473, in executemany\n    return self.execute(cast(str, stmt))\n           ~~~~~~~~~~~~^^^^^^^^^^^^^^^^^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\cursor_cext.py\", line 353, in execute\n    self._connection.cmd_query(\n    ~~~~~~~~~~~~~~~~~~~~~~~~~~^\n        self._stmt_partition[\"mappable_stmt\"],\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    ...<2 lines>...\n        raw_as_string=self._raw_as_string,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\opentelemetry\\context_propagation.py\", line 97, in wrapper\n    return method(cnx, *args, **kwargs)\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 781, in cmd_query\n    raise get_mysql_exception(\n        err.errno, msg=err.msg, sqlstate=err.sqlstate\n    ) from err\nmysql.connector.errors.IntegrityError: 1452 (23000): Cannot add or update a child row: a foreign key constraint fails (`esp_stg_db`.`tbl_livestock_census`, CONSTRAINT `tbl_livestock_census_ibfk_3` FOREIGN KEY (`year_id`) REFERENCES `tbl_year_master` (`year_id`))\n','2026-01-29 11:53:02'),(85,'Nanda_AH','/upload_transaction','1452 (23000): Cannot add or update a child row: a foreign key constraint fails (`esp_stg_db`.`tbl_livestock_census`, CONSTRAINT `tbl_livestock_census_ibfk_3` FOREIGN KEY (`year_id`) REFERENCES `tbl_year_master` (`year_id`))','Traceback (most recent call last):\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 772, in cmd_query\n    self._cmysql.query(\n    ~~~~~~~~~~~~~~~~~~^\n        query,\n        ^^^^^^\n    ...<3 lines>...\n        query_attrs=self.query_attrs,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n_mysql_connector.MySQLInterfaceError: Cannot add or update a child row: a foreign key constraint fails (`esp_stg_db`.`tbl_livestock_census`, CONSTRAINT `tbl_livestock_census_ibfk_3` FOREIGN KEY (`year_id`) REFERENCES `tbl_year_master` (`year_id`))\n\nThe above exception was the direct cause of the following exception:\n\nTraceback (most recent call last):\n  File \"D:\\Code final 2\\app\\routes\\data.py\", line 191, in _process_upload_transaction\n    cursor.executemany(sql, values)\n    ~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\cursor_cext.py\", line 473, in executemany\n    return self.execute(cast(str, stmt))\n           ~~~~~~~~~~~~^^^^^^^^^^^^^^^^^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\cursor_cext.py\", line 353, in execute\n    self._connection.cmd_query(\n    ~~~~~~~~~~~~~~~~~~~~~~~~~~^\n        self._stmt_partition[\"mappable_stmt\"],\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    ...<2 lines>...\n        raw_as_string=self._raw_as_string,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\opentelemetry\\context_propagation.py\", line 97, in wrapper\n    return method(cnx, *args, **kwargs)\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 781, in cmd_query\n    raise get_mysql_exception(\n        err.errno, msg=err.msg, sqlstate=err.sqlstate\n    ) from err\nmysql.connector.errors.IntegrityError: 1452 (23000): Cannot add or update a child row: a foreign key constraint fails (`esp_stg_db`.`tbl_livestock_census`, CONSTRAINT `tbl_livestock_census_ibfk_3` FOREIGN KEY (`year_id`) REFERENCES `tbl_year_master` (`year_id`))\n','2026-01-29 11:53:22'),(86,'Nanda_AH','/upload_transaction','1452 (23000): Cannot add or update a child row: a foreign key constraint fails (`esp_stg_db`.`tbl_livestock_census`, CONSTRAINT `tbl_livestock_census_ibfk_3` FOREIGN KEY (`year_id`) REFERENCES `tbl_year_master` (`year_id`))','Traceback (most recent call last):\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 772, in cmd_query\n    self._cmysql.query(\n    ~~~~~~~~~~~~~~~~~~^\n        query,\n        ^^^^^^\n    ...<3 lines>...\n        query_attrs=self.query_attrs,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n_mysql_connector.MySQLInterfaceError: Cannot add or update a child row: a foreign key constraint fails (`esp_stg_db`.`tbl_livestock_census`, CONSTRAINT `tbl_livestock_census_ibfk_3` FOREIGN KEY (`year_id`) REFERENCES `tbl_year_master` (`year_id`))\n\nThe above exception was the direct cause of the following exception:\n\nTraceback (most recent call last):\n  File \"D:\\Code final 2\\app\\routes\\data.py\", line 191, in _process_upload_transaction\n    cursor.executemany(sql, values)\n    ~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\cursor_cext.py\", line 473, in executemany\n    return self.execute(cast(str, stmt))\n           ~~~~~~~~~~~~^^^^^^^^^^^^^^^^^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\cursor_cext.py\", line 353, in execute\n    self._connection.cmd_query(\n    ~~~~~~~~~~~~~~~~~~~~~~~~~~^\n        self._stmt_partition[\"mappable_stmt\"],\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    ...<2 lines>...\n        raw_as_string=self._raw_as_string,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\opentelemetry\\context_propagation.py\", line 97, in wrapper\n    return method(cnx, *args, **kwargs)\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 781, in cmd_query\n    raise get_mysql_exception(\n        err.errno, msg=err.msg, sqlstate=err.sqlstate\n    ) from err\nmysql.connector.errors.IntegrityError: 1452 (23000): Cannot add or update a child row: a foreign key constraint fails (`esp_stg_db`.`tbl_livestock_census`, CONSTRAINT `tbl_livestock_census_ibfk_3` FOREIGN KEY (`year_id`) REFERENCES `tbl_year_master` (`year_id`))\n','2026-01-29 11:53:27'),(87,'admin','/templates','1054 (42S22): Unknown column \'updated_by\' in \'field list\'','Traceback (most recent call last):\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 772, in cmd_query\n    self._cmysql.query(\n    ~~~~~~~~~~~~~~~~~~^\n        query,\n        ^^^^^^\n    ...<3 lines>...\n        query_attrs=self.query_attrs,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n_mysql_connector.MySQLInterfaceError: Unknown column \'updated_by\' in \'field list\'\n\nThe above exception was the direct cause of the following exception:\n\nTraceback (most recent call last):\n  File \"D:\\Code final 2\\app\\utils\\database.py\", line 73, in wrapper\n    return func(cursor, conn, *args, **kwargs)\n  File \"D:\\Code final 2\\app\\routes\\admin.py\", line 121, in get_templates\n    cursor.execute(\n    ~~~~~~~~~~~~~~^\n        \"SELECT id, name, department, updated_by \"\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n        \"FROM excel_templates ORDER BY id DESC\"\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\cursor_cext.py\", line 353, in execute\n    self._connection.cmd_query(\n    ~~~~~~~~~~~~~~~~~~~~~~~~~~^\n        self._stmt_partition[\"mappable_stmt\"],\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    ...<2 lines>...\n        raw_as_string=self._raw_as_string,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\opentelemetry\\context_propagation.py\", line 97, in wrapper\n    return method(cnx, *args, **kwargs)\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 781, in cmd_query\n    raise get_mysql_exception(\n        err.errno, msg=err.msg, sqlstate=err.sqlstate\n    ) from err\nmysql.connector.errors.ProgrammingError: 1054 (42S22): Unknown column \'updated_by\' in \'field list\'\n','2026-01-30 04:51:00'),(88,'admin','/templates','1054 (42S22): Unknown column \'updated_by\' in \'field list\'','Traceback (most recent call last):\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 772, in cmd_query\n    self._cmysql.query(\n    ~~~~~~~~~~~~~~~~~~^\n        query,\n        ^^^^^^\n    ...<3 lines>...\n        query_attrs=self.query_attrs,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n_mysql_connector.MySQLInterfaceError: Unknown column \'updated_by\' in \'field list\'\n\nThe above exception was the direct cause of the following exception:\n\nTraceback (most recent call last):\n  File \"D:\\Code final 2\\app\\utils\\database.py\", line 73, in wrapper\n    return func(cursor, conn, *args, **kwargs)\n  File \"D:\\Code final 2\\app\\routes\\admin.py\", line 121, in get_templates\n    cursor.execute(\n    ~~~~~~~~~~~~~~^\n        \"SELECT id, name, department, updated_by \"\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n        \"FROM excel_templates ORDER BY id DESC\"\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\cursor_cext.py\", line 353, in execute\n    self._connection.cmd_query(\n    ~~~~~~~~~~~~~~~~~~~~~~~~~~^\n        self._stmt_partition[\"mappable_stmt\"],\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    ...<2 lines>...\n        raw_as_string=self._raw_as_string,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\opentelemetry\\context_propagation.py\", line 97, in wrapper\n    return method(cnx, *args, **kwargs)\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 781, in cmd_query\n    raise get_mysql_exception(\n        err.errno, msg=err.msg, sqlstate=err.sqlstate\n    ) from err\nmysql.connector.errors.ProgrammingError: 1054 (42S22): Unknown column \'updated_by\' in \'field list\'\n','2026-01-30 05:24:10'),(89,'admin','/templates','1054 (42S22): Unknown column \'updated_by\' in \'field list\'','Traceback (most recent call last):\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 772, in cmd_query\n    self._cmysql.query(\n    ~~~~~~~~~~~~~~~~~~^\n        query,\n        ^^^^^^\n    ...<3 lines>...\n        query_attrs=self.query_attrs,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n_mysql_connector.MySQLInterfaceError: Unknown column \'updated_by\' in \'field list\'\n\nThe above exception was the direct cause of the following exception:\n\nTraceback (most recent call last):\n  File \"D:\\Code final 2\\app\\utils\\database.py\", line 73, in wrapper\n    return func(cursor, conn, *args, **kwargs)\n  File \"D:\\Code final 2\\app\\routes\\admin.py\", line 121, in get_templates\n    cursor.execute(\n    ~~~~~~~~~~~~~~^\n        \"SELECT id, name, department, updated_by \"\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n        \"FROM excel_templates ORDER BY id DESC\"\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\cursor_cext.py\", line 353, in execute\n    self._connection.cmd_query(\n    ~~~~~~~~~~~~~~~~~~~~~~~~~~^\n        self._stmt_partition[\"mappable_stmt\"],\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    ...<2 lines>...\n        raw_as_string=self._raw_as_string,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\opentelemetry\\context_propagation.py\", line 97, in wrapper\n    return method(cnx, *args, **kwargs)\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 781, in cmd_query\n    raise get_mysql_exception(\n        err.errno, msg=err.msg, sqlstate=err.sqlstate\n    ) from err\nmysql.connector.errors.ProgrammingError: 1054 (42S22): Unknown column \'updated_by\' in \'field list\'\n','2026-01-30 05:24:25'),(90,'admin','/templates','1054 (42S22): Unknown column \'updated_by\' in \'field list\'','Traceback (most recent call last):\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 772, in cmd_query\n    self._cmysql.query(\n    ~~~~~~~~~~~~~~~~~~^\n        query,\n        ^^^^^^\n    ...<3 lines>...\n        query_attrs=self.query_attrs,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n_mysql_connector.MySQLInterfaceError: Unknown column \'updated_by\' in \'field list\'\n\nThe above exception was the direct cause of the following exception:\n\nTraceback (most recent call last):\n  File \"D:\\Code final 2\\app\\utils\\database.py\", line 73, in wrapper\n    return func(cursor, conn, *args, **kwargs)\n  File \"D:\\Code final 2\\app\\routes\\admin.py\", line 121, in get_templates\n    cursor.execute(\n    ~~~~~~~~~~~~~~^\n        \"SELECT id, name, department, updated_by \"\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n        \"FROM excel_templates ORDER BY id DESC\"\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\cursor_cext.py\", line 353, in execute\n    self._connection.cmd_query(\n    ~~~~~~~~~~~~~~~~~~~~~~~~~~^\n        self._stmt_partition[\"mappable_stmt\"],\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    ...<2 lines>...\n        raw_as_string=self._raw_as_string,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\opentelemetry\\context_propagation.py\", line 97, in wrapper\n    return method(cnx, *args, **kwargs)\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 781, in cmd_query\n    raise get_mysql_exception(\n        err.errno, msg=err.msg, sqlstate=err.sqlstate\n    ) from err\nmysql.connector.errors.ProgrammingError: 1054 (42S22): Unknown column \'updated_by\' in \'field list\'\n','2026-01-30 05:24:43'),(91,'admin','/templates','1054 (42S22): Unknown column \'updated_by\' in \'field list\'','Traceback (most recent call last):\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 772, in cmd_query\n    self._cmysql.query(\n    ~~~~~~~~~~~~~~~~~~^\n        query,\n        ^^^^^^\n    ...<3 lines>...\n        query_attrs=self.query_attrs,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n_mysql_connector.MySQLInterfaceError: Unknown column \'updated_by\' in \'field list\'\n\nThe above exception was the direct cause of the following exception:\n\nTraceback (most recent call last):\n  File \"D:\\Code final 2\\app\\utils\\database.py\", line 73, in wrapper\n    return func(cursor, conn, *args, **kwargs)\n  File \"D:\\Code final 2\\app\\routes\\admin.py\", line 121, in get_templates\n    cursor.execute(\n    ~~~~~~~~~~~~~~^\n        \"SELECT id, name, department, updated_by \"\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n        \"FROM excel_templates ORDER BY id DESC\"\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\cursor_cext.py\", line 353, in execute\n    self._connection.cmd_query(\n    ~~~~~~~~~~~~~~~~~~~~~~~~~~^\n        self._stmt_partition[\"mappable_stmt\"],\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    ...<2 lines>...\n        raw_as_string=self._raw_as_string,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\opentelemetry\\context_propagation.py\", line 97, in wrapper\n    return method(cnx, *args, **kwargs)\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 781, in cmd_query\n    raise get_mysql_exception(\n        err.errno, msg=err.msg, sqlstate=err.sqlstate\n    ) from err\nmysql.connector.errors.ProgrammingError: 1054 (42S22): Unknown column \'updated_by\' in \'field list\'\n','2026-01-30 05:24:50'),(92,'approver_IT','/api/check_all_rows_reviewed','Not all parameters were used in the SQL statement','Traceback (most recent call last):\n  File \"D:\\Code final 2\\app\\routes\\api.py\", line 885, in api_check_all_rows_reviewed\n    cursor.execute(f\"\"\"\n    ~~~~~~~~~~~~~~^^^^^\n        SELECT COUNT(*) AS pending_count\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n        FROM `{table}`\n        ^^^^^^^^^^^^^^\n        WHERE is_approved IS NULL\n        ^^^^^^^^^^^^^^^^^^^^^^^^^\n    \"\"\", (upload_id,))\n    ^^^^^^^^^^^^^^^^^^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\cursor_cext.py\", line 335, in execute\n    raise ProgrammingError(\n        \"Not all parameters were used in the SQL statement\"\n    )\nmysql.connector.errors.ProgrammingError: Not all parameters were used in the SQL statement\n','2026-01-30 11:52:12'),(93,'approver_IT','/api/check_all_rows_reviewed','Not all parameters were used in the SQL statement','Traceback (most recent call last):\n  File \"D:\\Code final 2\\app\\routes\\api.py\", line 885, in api_check_all_rows_reviewed\n    cursor.execute(f\"\"\"\n    ~~~~~~~~~~~~~~^^^^^\n        SELECT COUNT(*) AS pending_count\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n        FROM `{table}`\n        ^^^^^^^^^^^^^^\n        WHERE is_approved IS NULL\n        ^^^^^^^^^^^^^^^^^^^^^^^^^\n    \"\"\", (upload_id,))\n    ^^^^^^^^^^^^^^^^^^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\cursor_cext.py\", line 335, in execute\n    raise ProgrammingError(\n        \"Not all parameters were used in the SQL statement\"\n    )\nmysql.connector.errors.ProgrammingError: Not all parameters were used in the SQL statement\n','2026-01-30 11:52:15'),(94,'approver_IT','/api/check_all_rows_reviewed','Not all parameters were used in the SQL statement','Traceback (most recent call last):\n  File \"D:\\Code final 2\\app\\routes\\api.py\", line 885, in api_check_all_rows_reviewed\n    cursor.execute(f\"\"\"\n    ~~~~~~~~~~~~~~^^^^^\n        SELECT COUNT(*) AS pending_count\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n        FROM `{table}`\n        ^^^^^^^^^^^^^^\n        WHERE is_approved IS NULL\n        ^^^^^^^^^^^^^^^^^^^^^^^^^\n    \"\"\", (upload_id,))\n    ^^^^^^^^^^^^^^^^^^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\cursor_cext.py\", line 335, in execute\n    raise ProgrammingError(\n        \"Not all parameters were used in the SQL statement\"\n    )\nmysql.connector.errors.ProgrammingError: Not all parameters were used in the SQL statement\n','2026-01-30 11:52:19'),(95,'approver_IT','/api/check_all_rows_reviewed','Not all parameters were used in the SQL statement','Traceback (most recent call last):\n  File \"D:\\Code final 2\\app\\routes\\api.py\", line 885, in api_check_all_rows_reviewed\n    cursor.execute(f\"\"\"\n    ~~~~~~~~~~~~~~^^^^^\n        SELECT COUNT(*) AS pending_count\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n        FROM `{table}`\n        ^^^^^^^^^^^^^^\n        WHERE is_approved IS NULL\n        ^^^^^^^^^^^^^^^^^^^^^^^^^\n    \"\"\", (upload_id,))\n    ^^^^^^^^^^^^^^^^^^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\cursor_cext.py\", line 335, in execute\n    raise ProgrammingError(\n        \"Not all parameters were used in the SQL statement\"\n    )\nmysql.connector.errors.ProgrammingError: Not all parameters were used in the SQL statement\n','2026-01-30 11:52:25'),(96,'approver_IT','/api/check_all_rows_reviewed','Not all parameters were used in the SQL statement','Traceback (most recent call last):\n  File \"D:\\Code final 2\\app\\routes\\api.py\", line 885, in api_check_all_rows_reviewed\n    cursor.execute(f\"\"\"\n    ~~~~~~~~~~~~~~^^^^^\n        SELECT COUNT(*) AS pending_count\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n        FROM `{table}`\n        ^^^^^^^^^^^^^^\n        WHERE is_approved IS NULL\n        ^^^^^^^^^^^^^^^^^^^^^^^^^\n    \"\"\", (upload_id,))\n    ^^^^^^^^^^^^^^^^^^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\cursor_cext.py\", line 335, in execute\n    raise ProgrammingError(\n        \"Not all parameters were used in the SQL statement\"\n    )\nmysql.connector.errors.ProgrammingError: Not all parameters were used in the SQL statement\n','2026-01-30 11:52:26'),(97,'approver_IT','/api/check_all_rows_reviewed','Not all parameters were used in the SQL statement','Traceback (most recent call last):\n  File \"D:\\Code final 2\\app\\routes\\api.py\", line 885, in api_check_all_rows_reviewed\n    cursor.execute(f\"\"\"\n    ~~~~~~~~~~~~~~^^^^^\n        SELECT COUNT(*) AS pending_count\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n        FROM `{table}`\n        ^^^^^^^^^^^^^^\n        WHERE is_approved IS NULL\n        ^^^^^^^^^^^^^^^^^^^^^^^^^\n    \"\"\", (upload_id,))\n    ^^^^^^^^^^^^^^^^^^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\cursor_cext.py\", line 335, in execute\n    raise ProgrammingError(\n        \"Not all parameters were used in the SQL statement\"\n    )\nmysql.connector.errors.ProgrammingError: Not all parameters were used in the SQL statement\n','2026-01-30 11:52:26'),(98,'approver_IT','/api/check_all_rows_reviewed','Not all parameters were used in the SQL statement','Traceback (most recent call last):\n  File \"D:\\Code final 2\\app\\routes\\api.py\", line 885, in api_check_all_rows_reviewed\n    cursor.execute(f\"\"\"\n    ~~~~~~~~~~~~~~^^^^^\n        SELECT COUNT(*) AS pending_count\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n        FROM `{table}`\n        ^^^^^^^^^^^^^^\n        WHERE is_approved IS NULL\n        ^^^^^^^^^^^^^^^^^^^^^^^^^\n    \"\"\", (upload_id,))\n    ^^^^^^^^^^^^^^^^^^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\cursor_cext.py\", line 335, in execute\n    raise ProgrammingError(\n        \"Not all parameters were used in the SQL statement\"\n    )\nmysql.connector.errors.ProgrammingError: Not all parameters were used in the SQL statement\n','2026-01-30 11:52:27'),(99,'approver_IT','/api/check_all_rows_reviewed','Not all parameters were used in the SQL statement','Traceback (most recent call last):\n  File \"D:\\Code final 2\\app\\routes\\api.py\", line 885, in api_check_all_rows_reviewed\n    cursor.execute(f\"\"\"\n    ~~~~~~~~~~~~~~^^^^^\n        SELECT COUNT(*) AS pending_count\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n        FROM `{table}`\n        ^^^^^^^^^^^^^^\n        WHERE is_approved IS NULL\n        ^^^^^^^^^^^^^^^^^^^^^^^^^\n    \"\"\", (upload_id,))\n    ^^^^^^^^^^^^^^^^^^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\cursor_cext.py\", line 335, in execute\n    raise ProgrammingError(\n        \"Not all parameters were used in the SQL statement\"\n    )\nmysql.connector.errors.ProgrammingError: Not all parameters were used in the SQL statement\n','2026-01-30 11:52:28'),(100,'approver_IT','/api/check_all_rows_reviewed','Not all parameters were used in the SQL statement','Traceback (most recent call last):\n  File \"D:\\Code final 2\\app\\routes\\api.py\", line 885, in api_check_all_rows_reviewed\n    cursor.execute(f\"\"\"\n    ~~~~~~~~~~~~~~^^^^^\n        SELECT COUNT(*) AS pending_count\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n        FROM `{table}`\n        ^^^^^^^^^^^^^^\n        WHERE is_approved IS NULL\n        ^^^^^^^^^^^^^^^^^^^^^^^^^\n    \"\"\", (upload_id,))\n    ^^^^^^^^^^^^^^^^^^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\cursor_cext.py\", line 335, in execute\n    raise ProgrammingError(\n        \"Not all parameters were used in the SQL statement\"\n    )\nmysql.connector.errors.ProgrammingError: Not all parameters were used in the SQL statement\n','2026-01-30 11:52:28'),(101,'approver_IT','/api/check_all_rows_reviewed','Not all parameters were used in the SQL statement','Traceback (most recent call last):\n  File \"D:\\Code final 2\\app\\routes\\api.py\", line 885, in api_check_all_rows_reviewed\n    cursor.execute(f\"\"\"\n    ~~~~~~~~~~~~~~^^^^^\n        SELECT COUNT(*) AS pending_count\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n        FROM `{table}`\n        ^^^^^^^^^^^^^^\n        WHERE is_approved IS NULL\n        ^^^^^^^^^^^^^^^^^^^^^^^^^\n    \"\"\", (upload_id,))\n    ^^^^^^^^^^^^^^^^^^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\cursor_cext.py\", line 335, in execute\n    raise ProgrammingError(\n        \"Not all parameters were used in the SQL statement\"\n    )\nmysql.connector.errors.ProgrammingError: Not all parameters were used in the SQL statement\n','2026-01-30 11:52:38'),(102,'approver_IT','/api/check_all_rows_reviewed','Not all parameters were used in the SQL statement','Traceback (most recent call last):\n  File \"D:\\Code final 2\\app\\routes\\api.py\", line 885, in api_check_all_rows_reviewed\n    cursor.execute(f\"\"\"\n    ~~~~~~~~~~~~~~^^^^^\n        SELECT COUNT(*) AS pending_count\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n        FROM `{table}`\n        ^^^^^^^^^^^^^^\n        WHERE is_approved IS NULL\n        ^^^^^^^^^^^^^^^^^^^^^^^^^\n    \"\"\", (upload_id,))\n    ^^^^^^^^^^^^^^^^^^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\cursor_cext.py\", line 335, in execute\n    raise ProgrammingError(\n        \"Not all parameters were used in the SQL statement\"\n    )\nmysql.connector.errors.ProgrammingError: Not all parameters were used in the SQL statement\n','2026-01-30 11:53:24'),(103,'approver_IT','/api/check_all_rows_reviewed','Not all parameters were used in the SQL statement','Traceback (most recent call last):\n  File \"D:\\Code final 2\\app\\routes\\api.py\", line 885, in api_check_all_rows_reviewed\n    cursor.execute(f\"\"\"\n    ~~~~~~~~~~~~~~^^^^^\n        SELECT COUNT(*) AS pending_count\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n        FROM `{table}`\n        ^^^^^^^^^^^^^^\n        WHERE is_approved IS NULL\n        ^^^^^^^^^^^^^^^^^^^^^^^^^\n    \"\"\", (upload_id,))\n    ^^^^^^^^^^^^^^^^^^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\cursor_cext.py\", line 335, in execute\n    raise ProgrammingError(\n        \"Not all parameters were used in the SQL statement\"\n    )\nmysql.connector.errors.ProgrammingError: Not all parameters were used in the SQL statement\n','2026-01-30 11:53:35'),(104,'approver_IT','/api/check_all_rows_reviewed','Not all parameters were used in the SQL statement','Traceback (most recent call last):\n  File \"D:\\Code final 2\\app\\routes\\api.py\", line 885, in api_check_all_rows_reviewed\n    cursor.execute(f\"\"\"\n    ~~~~~~~~~~~~~~^^^^^\n        SELECT COUNT(*) AS pending_count\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n        FROM `{table}`\n        ^^^^^^^^^^^^^^\n        WHERE is_approved IS NULL\n        ^^^^^^^^^^^^^^^^^^^^^^^^^\n    \"\"\", (upload_id,))\n    ^^^^^^^^^^^^^^^^^^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\cursor_cext.py\", line 335, in execute\n    raise ProgrammingError(\n        \"Not all parameters were used in the SQL statement\"\n    )\nmysql.connector.errors.ProgrammingError: Not all parameters were used in the SQL statement\n','2026-01-30 11:54:05'),(105,'approver_IT','/api/check_all_rows_reviewed','Not all parameters were used in the SQL statement','Traceback (most recent call last):\n  File \"D:\\Code final 2\\app\\routes\\api.py\", line 885, in api_check_all_rows_reviewed\n    cursor.execute(f\"\"\"\n    ~~~~~~~~~~~~~~^^^^^\n        SELECT COUNT(*) AS pending_count\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n        FROM `{table}`\n        ^^^^^^^^^^^^^^\n        WHERE is_approved IS NULL AND (status_ IS NULL OR status_ = \'\' )\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    \"\"\", (upload_id,))\n    ^^^^^^^^^^^^^^^^^^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\cursor_cext.py\", line 335, in execute\n    raise ProgrammingError(\n        \"Not all parameters were used in the SQL statement\"\n    )\nmysql.connector.errors.ProgrammingError: Not all parameters were used in the SQL statement\n','2026-01-30 11:56:50'),(106,'approver_IT','/api/check_all_rows_reviewed','Not all parameters were used in the SQL statement','Traceback (most recent call last):\n  File \"D:\\Code final 2\\app\\routes\\api.py\", line 885, in api_check_all_rows_reviewed\n    cursor.execute(f\"\"\"\n    ~~~~~~~~~~~~~~^^^^^\n        SELECT COUNT(*) AS pending_count\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n        FROM `{table}`\n        ^^^^^^^^^^^^^^\n        WHERE is_approved IS NULL AND (status_ IS NULL OR status_ = \'\' )\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    \"\"\", (upload_id,))\n    ^^^^^^^^^^^^^^^^^^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\cursor_cext.py\", line 335, in execute\n    raise ProgrammingError(\n        \"Not all parameters were used in the SQL statement\"\n    )\nmysql.connector.errors.ProgrammingError: Not all parameters were used in the SQL statement\n','2026-01-30 11:56:52'),(107,'approver_IT','/api/check_all_rows_reviewed','Not all parameters were used in the SQL statement','Traceback (most recent call last):\n  File \"D:\\Code final 2\\app\\routes\\api.py\", line 885, in api_check_all_rows_reviewed\n    cursor.execute(f\"\"\"\n    ~~~~~~~~~~~~~~^^^^^\n        SELECT COUNT(*) AS pending_count\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n        FROM `{table}`\n        ^^^^^^^^^^^^^^\n        WHERE is_approved IS NULL AND (status_ IS NULL OR status_ = \'\' )\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    \"\"\", (upload_id,))\n    ^^^^^^^^^^^^^^^^^^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\cursor_cext.py\", line 335, in execute\n    raise ProgrammingError(\n        \"Not all parameters were used in the SQL statement\"\n    )\nmysql.connector.errors.ProgrammingError: Not all parameters were used in the SQL statement\n','2026-01-30 11:56:54'),(108,'admin','/templates','1054 (42S22): Unknown column \'updated_by\' in \'field list\'','Traceback (most recent call last):\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 772, in cmd_query\n    self._cmysql.query(\n    ~~~~~~~~~~~~~~~~~~^\n        query,\n        ^^^^^^\n    ...<3 lines>...\n        query_attrs=self.query_attrs,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n_mysql_connector.MySQLInterfaceError: Unknown column \'updated_by\' in \'field list\'\n\nThe above exception was the direct cause of the following exception:\n\nTraceback (most recent call last):\n  File \"D:\\Code final 2\\app\\utils\\database.py\", line 73, in wrapper\n    return func(cursor, conn, *args, **kwargs)\n  File \"D:\\Code final 2\\app\\routes\\admin.py\", line 121, in get_templates\n    cursor.execute(\n    ~~~~~~~~~~~~~~^\n        \"SELECT id, name, department, updated_by \"\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n        \"FROM excel_templates ORDER BY id DESC\"\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\cursor_cext.py\", line 353, in execute\n    self._connection.cmd_query(\n    ~~~~~~~~~~~~~~~~~~~~~~~~~~^\n        self._stmt_partition[\"mappable_stmt\"],\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    ...<2 lines>...\n        raw_as_string=self._raw_as_string,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\opentelemetry\\context_propagation.py\", line 97, in wrapper\n    return method(cnx, *args, **kwargs)\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 781, in cmd_query\n    raise get_mysql_exception(\n        err.errno, msg=err.msg, sqlstate=err.sqlstate\n    ) from err\nmysql.connector.errors.ProgrammingError: 1054 (42S22): Unknown column \'updated_by\' in \'field list\'\n','2026-01-31 10:24:31'),(109,'Nanda_AH','/templates','1054 (42S22): Unknown column \'updated_by\' in \'field list\'','Traceback (most recent call last):\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 772, in cmd_query\n    self._cmysql.query(\n    ~~~~~~~~~~~~~~~~~~^\n        query,\n        ^^^^^^\n    ...<3 lines>...\n        query_attrs=self.query_attrs,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n_mysql_connector.MySQLInterfaceError: Unknown column \'updated_by\' in \'field list\'\n\nThe above exception was the direct cause of the following exception:\n\nTraceback (most recent call last):\n  File \"D:\\Code final 2\\app\\utils\\database.py\", line 73, in wrapper\n    return func(cursor, conn, *args, **kwargs)\n  File \"D:\\Code final 2\\app\\routes\\admin.py\", line 121, in get_templates\n    cursor.execute(\n    ~~~~~~~~~~~~~~^\n        \"SELECT id, name, department, updated_by \"\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n        \"FROM excel_templates ORDER BY id DESC\"\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\cursor_cext.py\", line 353, in execute\n    self._connection.cmd_query(\n    ~~~~~~~~~~~~~~~~~~~~~~~~~~^\n        self._stmt_partition[\"mappable_stmt\"],\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    ...<2 lines>...\n        raw_as_string=self._raw_as_string,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\opentelemetry\\context_propagation.py\", line 97, in wrapper\n    return method(cnx, *args, **kwargs)\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 781, in cmd_query\n    raise get_mysql_exception(\n        err.errno, msg=err.msg, sqlstate=err.sqlstate\n    ) from err\nmysql.connector.errors.ProgrammingError: 1054 (42S22): Unknown column \'updated_by\' in \'field list\'\n','2026-01-31 10:38:22'),(110,'Nanda_AH','/templates','1054 (42S22): Unknown column \'updated_by\' in \'field list\'','Traceback (most recent call last):\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 772, in cmd_query\n    self._cmysql.query(\n    ~~~~~~~~~~~~~~~~~~^\n        query,\n        ^^^^^^\n    ...<3 lines>...\n        query_attrs=self.query_attrs,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n_mysql_connector.MySQLInterfaceError: Unknown column \'updated_by\' in \'field list\'\n\nThe above exception was the direct cause of the following exception:\n\nTraceback (most recent call last):\n  File \"D:\\Code final 2\\app\\utils\\database.py\", line 73, in wrapper\n    return func(cursor, conn, *args, **kwargs)\n  File \"D:\\Code final 2\\app\\routes\\admin.py\", line 121, in get_templates\n    cursor.execute(\n    ~~~~~~~~~~~~~~^\n        \"SELECT id, name, department, updated_by \"\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n        \"FROM excel_templates ORDER BY id DESC\"\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\cursor_cext.py\", line 353, in execute\n    self._connection.cmd_query(\n    ~~~~~~~~~~~~~~~~~~~~~~~~~~^\n        self._stmt_partition[\"mappable_stmt\"],\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    ...<2 lines>...\n        raw_as_string=self._raw_as_string,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\opentelemetry\\context_propagation.py\", line 97, in wrapper\n    return method(cnx, *args, **kwargs)\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 781, in cmd_query\n    raise get_mysql_exception(\n        err.errno, msg=err.msg, sqlstate=err.sqlstate\n    ) from err\nmysql.connector.errors.ProgrammingError: 1054 (42S22): Unknown column \'updated_by\' in \'field list\'\n','2026-01-31 10:38:36'),(111,'admin','/templates','1054 (42S22): Unknown column \'updated_by\' in \'field list\'','Traceback (most recent call last):\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 772, in cmd_query\n    self._cmysql.query(\n    ~~~~~~~~~~~~~~~~~~^\n        query,\n        ^^^^^^\n    ...<3 lines>...\n        query_attrs=self.query_attrs,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n_mysql_connector.MySQLInterfaceError: Unknown column \'updated_by\' in \'field list\'\n\nThe above exception was the direct cause of the following exception:\n\nTraceback (most recent call last):\n  File \"D:\\Code final 2\\app\\utils\\database.py\", line 73, in wrapper\n    return func(cursor, conn, *args, **kwargs)\n  File \"D:\\Code final 2\\app\\routes\\admin.py\", line 121, in get_templates\n    cursor.execute(\n    ~~~~~~~~~~~~~~^\n        \"SELECT id, name, department, updated_by \"\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n        \"FROM excel_templates ORDER BY id DESC\"\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\cursor_cext.py\", line 353, in execute\n    self._connection.cmd_query(\n    ~~~~~~~~~~~~~~~~~~~~~~~~~~^\n        self._stmt_partition[\"mappable_stmt\"],\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    ...<2 lines>...\n        raw_as_string=self._raw_as_string,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\opentelemetry\\context_propagation.py\", line 97, in wrapper\n    return method(cnx, *args, **kwargs)\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 781, in cmd_query\n    raise get_mysql_exception(\n        err.errno, msg=err.msg, sqlstate=err.sqlstate\n    ) from err\nmysql.connector.errors.ProgrammingError: 1054 (42S22): Unknown column \'updated_by\' in \'field list\'\n','2026-02-02 05:12:58'),(112,'admin','/templates','1054 (42S22): Unknown column \'updated_by\' in \'field list\'','Traceback (most recent call last):\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 772, in cmd_query\n    self._cmysql.query(\n    ~~~~~~~~~~~~~~~~~~^\n        query,\n        ^^^^^^\n    ...<3 lines>...\n        query_attrs=self.query_attrs,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n_mysql_connector.MySQLInterfaceError: Unknown column \'updated_by\' in \'field list\'\n\nThe above exception was the direct cause of the following exception:\n\nTraceback (most recent call last):\n  File \"D:\\Code final 2\\app\\utils\\database.py\", line 73, in wrapper\n    return func(cursor, conn, *args, **kwargs)\n  File \"D:\\Code final 2\\app\\routes\\admin.py\", line 121, in get_templates\n    cursor.execute(\n    ~~~~~~~~~~~~~~^\n        \"SELECT id, name, department, updated_by \"\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n        \"FROM excel_templates ORDER BY id DESC\"\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\cursor_cext.py\", line 353, in execute\n    self._connection.cmd_query(\n    ~~~~~~~~~~~~~~~~~~~~~~~~~~^\n        self._stmt_partition[\"mappable_stmt\"],\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    ...<2 lines>...\n        raw_as_string=self._raw_as_string,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\opentelemetry\\context_propagation.py\", line 97, in wrapper\n    return method(cnx, *args, **kwargs)\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 781, in cmd_query\n    raise get_mysql_exception(\n        err.errno, msg=err.msg, sqlstate=err.sqlstate\n    ) from err\nmysql.connector.errors.ProgrammingError: 1054 (42S22): Unknown column \'updated_by\' in \'field list\'\n','2026-02-02 05:15:19'),(113,'admin','/templates','1054 (42S22): Unknown column \'updated_by\' in \'field list\'','Traceback (most recent call last):\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 772, in cmd_query\n    self._cmysql.query(\n    ~~~~~~~~~~~~~~~~~~^\n        query,\n        ^^^^^^\n    ...<3 lines>...\n        query_attrs=self.query_attrs,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n_mysql_connector.MySQLInterfaceError: Unknown column \'updated_by\' in \'field list\'\n\nThe above exception was the direct cause of the following exception:\n\nTraceback (most recent call last):\n  File \"D:\\Code final 2\\app\\utils\\database.py\", line 73, in wrapper\n    return func(cursor, conn, *args, **kwargs)\n  File \"D:\\Code final 2\\app\\routes\\admin.py\", line 121, in get_templates\n    cursor.execute(\n    ~~~~~~~~~~~~~~^\n        \"SELECT id, name, department, updated_by \"\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n        \"FROM excel_templates ORDER BY id DESC\"\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\cursor_cext.py\", line 353, in execute\n    self._connection.cmd_query(\n    ~~~~~~~~~~~~~~~~~~~~~~~~~~^\n        self._stmt_partition[\"mappable_stmt\"],\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    ...<2 lines>...\n        raw_as_string=self._raw_as_string,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\opentelemetry\\context_propagation.py\", line 97, in wrapper\n    return method(cnx, *args, **kwargs)\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 781, in cmd_query\n    raise get_mysql_exception(\n        err.errno, msg=err.msg, sqlstate=err.sqlstate\n    ) from err\nmysql.connector.errors.ProgrammingError: 1054 (42S22): Unknown column \'updated_by\' in \'field list\'\n','2026-02-02 05:15:22'),(114,'admin','/templates','1054 (42S22): Unknown column \'updated_by\' in \'field list\'','Traceback (most recent call last):\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 772, in cmd_query\n    self._cmysql.query(\n    ~~~~~~~~~~~~~~~~~~^\n        query,\n        ^^^^^^\n    ...<3 lines>...\n        query_attrs=self.query_attrs,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n_mysql_connector.MySQLInterfaceError: Unknown column \'updated_by\' in \'field list\'\n\nThe above exception was the direct cause of the following exception:\n\nTraceback (most recent call last):\n  File \"D:\\Code final 2\\app\\utils\\database.py\", line 73, in wrapper\n    return func(cursor, conn, *args, **kwargs)\n  File \"D:\\Code final 2\\app\\routes\\admin.py\", line 121, in get_templates\n    cursor.execute(\n    ~~~~~~~~~~~~~~^\n        \"SELECT id, name, department, updated_by \"\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n        \"FROM excel_templates ORDER BY id DESC\"\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\cursor_cext.py\", line 353, in execute\n    self._connection.cmd_query(\n    ~~~~~~~~~~~~~~~~~~~~~~~~~~^\n        self._stmt_partition[\"mappable_stmt\"],\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    ...<2 lines>...\n        raw_as_string=self._raw_as_string,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\opentelemetry\\context_propagation.py\", line 97, in wrapper\n    return method(cnx, *args, **kwargs)\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 781, in cmd_query\n    raise get_mysql_exception(\n        err.errno, msg=err.msg, sqlstate=err.sqlstate\n    ) from err\nmysql.connector.errors.ProgrammingError: 1054 (42S22): Unknown column \'updated_by\' in \'field list\'\n','2026-02-02 05:15:39'),(115,'admin','/templates','1054 (42S22): Unknown column \'updated_by\' in \'field list\'','Traceback (most recent call last):\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 772, in cmd_query\n    self._cmysql.query(\n    ~~~~~~~~~~~~~~~~~~^\n        query,\n        ^^^^^^\n    ...<3 lines>...\n        query_attrs=self.query_attrs,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n_mysql_connector.MySQLInterfaceError: Unknown column \'updated_by\' in \'field list\'\n\nThe above exception was the direct cause of the following exception:\n\nTraceback (most recent call last):\n  File \"D:\\Code final 2\\app\\utils\\database.py\", line 73, in wrapper\n    return func(cursor, conn, *args, **kwargs)\n  File \"D:\\Code final 2\\app\\routes\\admin.py\", line 121, in get_templates\n    cursor.execute(\n    ~~~~~~~~~~~~~~^\n        \"SELECT id, name, department, updated_by \"\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n        \"FROM excel_templates ORDER BY id DESC\"\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\cursor_cext.py\", line 353, in execute\n    self._connection.cmd_query(\n    ~~~~~~~~~~~~~~~~~~~~~~~~~~^\n        self._stmt_partition[\"mappable_stmt\"],\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    ...<2 lines>...\n        raw_as_string=self._raw_as_string,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\opentelemetry\\context_propagation.py\", line 97, in wrapper\n    return method(cnx, *args, **kwargs)\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 781, in cmd_query\n    raise get_mysql_exception(\n        err.errno, msg=err.msg, sqlstate=err.sqlstate\n    ) from err\nmysql.connector.errors.ProgrammingError: 1054 (42S22): Unknown column \'updated_by\' in \'field list\'\n','2026-02-02 05:15:55'),(116,'admin','/templates','1054 (42S22): Unknown column \'updated_by\' in \'field list\'','Traceback (most recent call last):\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 772, in cmd_query\n    self._cmysql.query(\n    ~~~~~~~~~~~~~~~~~~^\n        query,\n        ^^^^^^\n    ...<3 lines>...\n        query_attrs=self.query_attrs,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n_mysql_connector.MySQLInterfaceError: Unknown column \'updated_by\' in \'field list\'\n\nThe above exception was the direct cause of the following exception:\n\nTraceback (most recent call last):\n  File \"D:\\Code final 2\\app\\utils\\database.py\", line 73, in wrapper\n    return func(cursor, conn, *args, **kwargs)\n  File \"D:\\Code final 2\\app\\routes\\admin.py\", line 121, in get_templates\n    cursor.execute(\n    ~~~~~~~~~~~~~~^\n        \"SELECT id, name, department, updated_by \"\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n        \"FROM excel_templates ORDER BY id DESC\"\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\cursor_cext.py\", line 353, in execute\n    self._connection.cmd_query(\n    ~~~~~~~~~~~~~~~~~~~~~~~~~~^\n        self._stmt_partition[\"mappable_stmt\"],\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    ...<2 lines>...\n        raw_as_string=self._raw_as_string,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\opentelemetry\\context_propagation.py\", line 97, in wrapper\n    return method(cnx, *args, **kwargs)\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 781, in cmd_query\n    raise get_mysql_exception(\n        err.errno, msg=err.msg, sqlstate=err.sqlstate\n    ) from err\nmysql.connector.errors.ProgrammingError: 1054 (42S22): Unknown column \'updated_by\' in \'field list\'\n','2026-02-02 05:28:26'),(117,'approver_IT','/templates','1054 (42S22): Unknown column \'updated_by\' in \'field list\'','Traceback (most recent call last):\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 772, in cmd_query\n    self._cmysql.query(\n    ~~~~~~~~~~~~~~~~~~^\n        query,\n        ^^^^^^\n    ...<3 lines>...\n        query_attrs=self.query_attrs,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n_mysql_connector.MySQLInterfaceError: Unknown column \'updated_by\' in \'field list\'\n\nThe above exception was the direct cause of the following exception:\n\nTraceback (most recent call last):\n  File \"D:\\Code final 2\\app\\utils\\database.py\", line 73, in wrapper\n    return func(cursor, conn, *args, **kwargs)\n  File \"D:\\Code final 2\\app\\routes\\admin.py\", line 121, in get_templates\n    cursor.execute(\n    ~~~~~~~~~~~~~~^\n        \"SELECT id, name, department, updated_by \"\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n        \"FROM excel_templates ORDER BY id DESC\"\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\cursor_cext.py\", line 353, in execute\n    self._connection.cmd_query(\n    ~~~~~~~~~~~~~~~~~~~~~~~~~~^\n        self._stmt_partition[\"mappable_stmt\"],\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    ...<2 lines>...\n        raw_as_string=self._raw_as_string,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\opentelemetry\\context_propagation.py\", line 97, in wrapper\n    return method(cnx, *args, **kwargs)\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 781, in cmd_query\n    raise get_mysql_exception(\n        err.errno, msg=err.msg, sqlstate=err.sqlstate\n    ) from err\nmysql.connector.errors.ProgrammingError: 1054 (42S22): Unknown column \'updated_by\' in \'field list\'\n','2026-02-02 05:32:03'),(118,'approver_IT','/templates','1054 (42S22): Unknown column \'updated_by\' in \'field list\'','Traceback (most recent call last):\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 772, in cmd_query\n    self._cmysql.query(\n    ~~~~~~~~~~~~~~~~~~^\n        query,\n        ^^^^^^\n    ...<3 lines>...\n        query_attrs=self.query_attrs,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n_mysql_connector.MySQLInterfaceError: Unknown column \'updated_by\' in \'field list\'\n\nThe above exception was the direct cause of the following exception:\n\nTraceback (most recent call last):\n  File \"D:\\Code final 2\\app\\utils\\database.py\", line 73, in wrapper\n    return func(cursor, conn, *args, **kwargs)\n  File \"D:\\Code final 2\\app\\routes\\admin.py\", line 121, in get_templates\n    cursor.execute(\n    ~~~~~~~~~~~~~~^\n        \"SELECT id, name, department, updated_by \"\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n        \"FROM excel_templates ORDER BY id DESC\"\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\cursor_cext.py\", line 353, in execute\n    self._connection.cmd_query(\n    ~~~~~~~~~~~~~~~~~~~~~~~~~~^\n        self._stmt_partition[\"mappable_stmt\"],\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    ...<2 lines>...\n        raw_as_string=self._raw_as_string,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\opentelemetry\\context_propagation.py\", line 97, in wrapper\n    return method(cnx, *args, **kwargs)\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 781, in cmd_query\n    raise get_mysql_exception(\n        err.errno, msg=err.msg, sqlstate=err.sqlstate\n    ) from err\nmysql.connector.errors.ProgrammingError: 1054 (42S22): Unknown column \'updated_by\' in \'field list\'\n','2026-02-02 05:32:08'),(119,'approver_IT','/templates','1054 (42S22): Unknown column \'updated_by\' in \'field list\'','Traceback (most recent call last):\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 772, in cmd_query\n    self._cmysql.query(\n    ~~~~~~~~~~~~~~~~~~^\n        query,\n        ^^^^^^\n    ...<3 lines>...\n        query_attrs=self.query_attrs,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n_mysql_connector.MySQLInterfaceError: Unknown column \'updated_by\' in \'field list\'\n\nThe above exception was the direct cause of the following exception:\n\nTraceback (most recent call last):\n  File \"D:\\Code final 2\\app\\utils\\database.py\", line 73, in wrapper\n    return func(cursor, conn, *args, **kwargs)\n  File \"D:\\Code final 2\\app\\routes\\admin.py\", line 121, in get_templates\n    cursor.execute(\n    ~~~~~~~~~~~~~~^\n        \"SELECT id, name, department, updated_by \"\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n        \"FROM excel_templates ORDER BY id DESC\"\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\cursor_cext.py\", line 353, in execute\n    self._connection.cmd_query(\n    ~~~~~~~~~~~~~~~~~~~~~~~~~~^\n        self._stmt_partition[\"mappable_stmt\"],\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    ...<2 lines>...\n        raw_as_string=self._raw_as_string,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\opentelemetry\\context_propagation.py\", line 97, in wrapper\n    return method(cnx, *args, **kwargs)\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 781, in cmd_query\n    raise get_mysql_exception(\n        err.errno, msg=err.msg, sqlstate=err.sqlstate\n    ) from err\nmysql.connector.errors.ProgrammingError: 1054 (42S22): Unknown column \'updated_by\' in \'field list\'\n','2026-02-02 05:32:50'),(120,'approver_IT','/templates','1054 (42S22): Unknown column \'updated_by\' in \'field list\'','Traceback (most recent call last):\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 772, in cmd_query\n    self._cmysql.query(\n    ~~~~~~~~~~~~~~~~~~^\n        query,\n        ^^^^^^\n    ...<3 lines>...\n        query_attrs=self.query_attrs,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n_mysql_connector.MySQLInterfaceError: Unknown column \'updated_by\' in \'field list\'\n\nThe above exception was the direct cause of the following exception:\n\nTraceback (most recent call last):\n  File \"D:\\Code final 2\\app\\utils\\database.py\", line 73, in wrapper\n    return func(cursor, conn, *args, **kwargs)\n  File \"D:\\Code final 2\\app\\routes\\admin.py\", line 121, in get_templates\n    cursor.execute(\n    ~~~~~~~~~~~~~~^\n        \"SELECT id, name, department, updated_by \"\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n        \"FROM excel_templates ORDER BY id DESC\"\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\cursor_cext.py\", line 353, in execute\n    self._connection.cmd_query(\n    ~~~~~~~~~~~~~~~~~~~~~~~~~~^\n        self._stmt_partition[\"mappable_stmt\"],\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    ...<2 lines>...\n        raw_as_string=self._raw_as_string,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\opentelemetry\\context_propagation.py\", line 97, in wrapper\n    return method(cnx, *args, **kwargs)\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 781, in cmd_query\n    raise get_mysql_exception(\n        err.errno, msg=err.msg, sqlstate=err.sqlstate\n    ) from err\nmysql.connector.errors.ProgrammingError: 1054 (42S22): Unknown column \'updated_by\' in \'field list\'\n','2026-02-02 05:32:53'),(121,'admin','/templates','1054 (42S22): Unknown column \'updated_by\' in \'field list\'','Traceback (most recent call last):\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 772, in cmd_query\n    self._cmysql.query(\n    ~~~~~~~~~~~~~~~~~~^\n        query,\n        ^^^^^^\n    ...<3 lines>...\n        query_attrs=self.query_attrs,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n_mysql_connector.MySQLInterfaceError: Unknown column \'updated_by\' in \'field list\'\n\nThe above exception was the direct cause of the following exception:\n\nTraceback (most recent call last):\n  File \"D:\\Code final 2\\app\\utils\\database.py\", line 73, in wrapper\n    return func(cursor, conn, *args, **kwargs)\n  File \"D:\\Code final 2\\app\\routes\\admin.py\", line 121, in get_templates\n    cursor.execute(\n    ~~~~~~~~~~~~~~^\n        \"SELECT id, name, department, updated_by \"\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n        \"FROM excel_templates ORDER BY id DESC\"\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\cursor_cext.py\", line 353, in execute\n    self._connection.cmd_query(\n    ~~~~~~~~~~~~~~~~~~~~~~~~~~^\n        self._stmt_partition[\"mappable_stmt\"],\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    ...<2 lines>...\n        raw_as_string=self._raw_as_string,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\opentelemetry\\context_propagation.py\", line 97, in wrapper\n    return method(cnx, *args, **kwargs)\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 781, in cmd_query\n    raise get_mysql_exception(\n        err.errno, msg=err.msg, sqlstate=err.sqlstate\n    ) from err\nmysql.connector.errors.ProgrammingError: 1054 (42S22): Unknown column \'updated_by\' in \'field list\'\n','2026-02-02 05:32:58'),(122,'admin','/templates','1054 (42S22): Unknown column \'updated_by\' in \'field list\'','Traceback (most recent call last):\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 772, in cmd_query\n    self._cmysql.query(\n    ~~~~~~~~~~~~~~~~~~^\n        query,\n        ^^^^^^\n    ...<3 lines>...\n        query_attrs=self.query_attrs,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n_mysql_connector.MySQLInterfaceError: Unknown column \'updated_by\' in \'field list\'\n\nThe above exception was the direct cause of the following exception:\n\nTraceback (most recent call last):\n  File \"D:\\Code final 2\\app\\utils\\database.py\", line 73, in wrapper\n    return func(cursor, conn, *args, **kwargs)\n  File \"D:\\Code final 2\\app\\routes\\admin.py\", line 121, in get_templates\n    cursor.execute(\n    ~~~~~~~~~~~~~~^\n        \"SELECT id, name, department, updated_by \"\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n        \"FROM excel_templates ORDER BY id DESC\"\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\cursor_cext.py\", line 353, in execute\n    self._connection.cmd_query(\n    ~~~~~~~~~~~~~~~~~~~~~~~~~~^\n        self._stmt_partition[\"mappable_stmt\"],\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    ...<2 lines>...\n        raw_as_string=self._raw_as_string,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\opentelemetry\\context_propagation.py\", line 97, in wrapper\n    return method(cnx, *args, **kwargs)\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 781, in cmd_query\n    raise get_mysql_exception(\n        err.errno, msg=err.msg, sqlstate=err.sqlstate\n    ) from err\nmysql.connector.errors.ProgrammingError: 1054 (42S22): Unknown column \'updated_by\' in \'field list\'\n','2026-02-02 05:35:48'),(123,'admin','/templates','1054 (42S22): Unknown column \'updated_by\' in \'field list\'','Traceback (most recent call last):\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 772, in cmd_query\n    self._cmysql.query(\n    ~~~~~~~~~~~~~~~~~~^\n        query,\n        ^^^^^^\n    ...<3 lines>...\n        query_attrs=self.query_attrs,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n_mysql_connector.MySQLInterfaceError: Unknown column \'updated_by\' in \'field list\'\n\nThe above exception was the direct cause of the following exception:\n\nTraceback (most recent call last):\n  File \"D:\\Code final 2\\app\\utils\\database.py\", line 73, in wrapper\n    return func(cursor, conn, *args, **kwargs)\n  File \"D:\\Code final 2\\app\\routes\\admin.py\", line 121, in get_templates\n    cursor.execute(\n    ~~~~~~~~~~~~~~^\n        \"SELECT id, name, department, updated_by \"\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n        \"FROM excel_templates ORDER BY id DESC\"\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\cursor_cext.py\", line 353, in execute\n    self._connection.cmd_query(\n    ~~~~~~~~~~~~~~~~~~~~~~~~~~^\n        self._stmt_partition[\"mappable_stmt\"],\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    ...<2 lines>...\n        raw_as_string=self._raw_as_string,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\opentelemetry\\context_propagation.py\", line 97, in wrapper\n    return method(cnx, *args, **kwargs)\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 781, in cmd_query\n    raise get_mysql_exception(\n        err.errno, msg=err.msg, sqlstate=err.sqlstate\n    ) from err\nmysql.connector.errors.ProgrammingError: 1054 (42S22): Unknown column \'updated_by\' in \'field list\'\n','2026-02-02 05:35:52'),(124,'admin','/templates','1054 (42S22): Unknown column \'updated_by\' in \'field list\'','Traceback (most recent call last):\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 772, in cmd_query\n    self._cmysql.query(\n    ~~~~~~~~~~~~~~~~~~^\n        query,\n        ^^^^^^\n    ...<3 lines>...\n        query_attrs=self.query_attrs,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n_mysql_connector.MySQLInterfaceError: Unknown column \'updated_by\' in \'field list\'\n\nThe above exception was the direct cause of the following exception:\n\nTraceback (most recent call last):\n  File \"D:\\Code final 2\\app\\utils\\database.py\", line 73, in wrapper\n    return func(cursor, conn, *args, **kwargs)\n  File \"D:\\Code final 2\\app\\routes\\admin.py\", line 121, in get_templates\n    cursor.execute(\n    ~~~~~~~~~~~~~~^\n        \"SELECT id, name, department, updated_by \"\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n        \"FROM excel_templates ORDER BY id DESC\"\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\cursor_cext.py\", line 353, in execute\n    self._connection.cmd_query(\n    ~~~~~~~~~~~~~~~~~~~~~~~~~~^\n        self._stmt_partition[\"mappable_stmt\"],\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    ...<2 lines>...\n        raw_as_string=self._raw_as_string,\n        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n    )\n    ^\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\opentelemetry\\context_propagation.py\", line 97, in wrapper\n    return method(cnx, *args, **kwargs)\n  File \"C:\\Users\\DELL\\AppData\\Local\\Python\\pythoncore-3.14-64\\Lib\\site-packages\\mysql\\connector\\connection_cext.py\", line 781, in cmd_query\n    raise get_mysql_exception(\n        err.errno, msg=err.msg, sqlstate=err.sqlstate\n    ) from err\nmysql.connector.errors.ProgrammingError: 1054 (42S22): Unknown column \'updated_by\' in \'field list\'\n','2026-02-02 05:50:17'),(125,'Nanda_AH','/download_register_template','generate_excel_template() got an unexpected keyword argument \'hide_cols\'','Traceback (most recent call last):\n  File \"D:\\Code final 2\\app\\routes\\data.py\", line 55, in download_register_template\n    output = generate_excel_template(\n        cursor,\n    ...<3 lines>...\n        hide_cols=hide_cols   # ✅ new param\n    )\nTypeError: generate_excel_template() got an unexpected keyword argument \'hide_cols\'\n','2026-02-02 06:21:28'),(126,NULL,'/download_register_template','generate_excel_template() got an unexpected keyword argument \'hide_cols\'','Traceback (most recent call last):\n  File \"D:\\Code final 2\\app\\routes\\data.py\", line 55, in download_register_template\n    output = generate_excel_template(\n        cursor,\n    ...<3 lines>...\n        hide_cols=hide_cols   # ✅ new param\n    )\nTypeError: generate_excel_template() got an unexpected keyword argument \'hide_cols\'\n','2026-02-02 06:22:31'),(127,'Nanda_AH','/download_register_template','generate_excel_template() got an unexpected keyword argument \'hide_cols\'','Traceback (most recent call last):\n  File \"D:\\Code final 2\\app\\routes\\data.py\", line 55, in download_register_template\n    output = generate_excel_template(\n        cursor,\n    ...<3 lines>...\n        hide_cols=hide_cols   # ✅ new param\n    )\nTypeError: generate_excel_template() got an unexpected keyword argument \'hide_cols\'\n','2026-02-02 06:22:39'),(128,NULL,'/download_register_template','Table \'undefined\' not found','Traceback (most recent call last):\n  File \"D:\\Code final 2\\app\\utils\\excel_helpers.py\", line 70, in generate_excel_template\n    raise ValueError(f\"Table \'{table}\' not found\")\nValueError: Table \'undefined\' not found\n','2026-02-02 06:25:17'),(129,NULL,'/download_register_template','Table \'undefined\' not found','Traceback (most recent call last):\n  File \"D:\\Code final 2\\app\\routes\\data.py\", line 55, in download_register_template\n    output = generate_excel_template(\n        cursor,\n    ...<3 lines>...\n        hide_cols=hide_cols   # ✅ new param\n    )\n  File \"D:\\Code final 2\\app\\utils\\excel_helpers.py\", line 70, in generate_excel_template\n    raise ValueError(f\"Table \'{table}\' not found\")\nValueError: Table \'undefined\' not found\n','2026-02-02 06:25:17'),(130,'Nanda_AH','/download_register_template','Table \'undefined\' not found','Traceback (most recent call last):\n  File \"D:\\Code final 2\\app\\utils\\excel_helpers.py\", line 70, in generate_excel_template\n    raise ValueError(f\"Table \'{table}\' not found\")\nValueError: Table \'undefined\' not found\n','2026-02-02 06:25:26'),(131,'Nanda_AH','/download_register_template','Table \'undefined\' not found','Traceback (most recent call last):\n  File \"D:\\Code final 2\\app\\routes\\data.py\", line 55, in download_register_template\n    output = generate_excel_template(\n        cursor,\n    ...<3 lines>...\n        hide_cols=hide_cols   # ✅ new param\n    )\n  File \"D:\\Code final 2\\app\\utils\\excel_helpers.py\", line 70, in generate_excel_template\n    raise ValueError(f\"Table \'{table}\' not found\")\nValueError: Table \'undefined\' not found\n','2026-02-02 06:25:26');
/*!40000 ALTER TABLE `error_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `excel_templates`
--

DROP TABLE IF EXISTS `excel_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `excel_templates` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `department` varchar(100) DEFAULT NULL,
  `uploaded_by` varchar(100) DEFAULT NULL,
  `uploaded_on` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `excel_templates`
--

LOCK TABLES `excel_templates` WRITE;
/*!40000 ALTER TABLE `excel_templates` DISABLE KEYS */;
/*!40000 ALTER TABLE `excel_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `excel_uploads`
--

DROP TABLE IF EXISTS `excel_uploads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `excel_uploads` (
  `id` int NOT NULL AUTO_INCREMENT,
  `filename` varchar(255) NOT NULL,
  `table_name` varchar(100) NOT NULL,
  `uploaded_by` varchar(100) DEFAULT NULL,
  `department` varchar(100) DEFAULT NULL,
  `uploaded_on` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `status_` tinyint DEFAULT NULL,
  `updated_by` varchar(100) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `reapproval_requested` tinyint(1) DEFAULT '0',
  `reapproval_date` timestamp NULL DEFAULT NULL,
  `rejection_reason` text,
  PRIMARY KEY (`id`),
  KEY `idx_department` (`department`),
  KEY `idx_table_name` (`table_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `excel_uploads`
--

LOCK TABLES `excel_uploads` WRITE;
/*!40000 ALTER TABLE `excel_uploads` DISABLE KEYS */;
INSERT INTO `excel_uploads` VALUES (1,'tbl_livestock_census_template_4.xlsx','tbl_livestock_census','approver_IT','Animal Husbandry and Animal Welfare','2026-02-02 05:32:48',1,'approver_IT','2026-02-02 11:02:36',0,NULL,NULL),(2,'tbl_livestock_census_template_4.xlsx','tbl_livestock_census',NULL,'Animal Husbandry and Animal Welfare','2026-02-02 05:54:27',NULL,'Nanda_AH',NULL,0,NULL,NULL);
/*!40000 ALTER TABLE `excel_uploads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_accident_details`
--

DROP TABLE IF EXISTS `tbl_accident_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_accident_details` (
  `accident_det_refno` int NOT NULL AUTO_INCREMENT,
  `accident_id` int NOT NULL,
  `year_id` int NOT NULL,
  `region_id` int NOT NULL,
  `accident_num` int DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(50) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `status_` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`accident_det_refno`),
  KEY `accident_id` (`accident_id`),
  KEY `region_id` (`region_id`),
  KEY `idx_year_region` (`year_id`,`region_id`),
  CONSTRAINT `tbl_accident_details_ibfk_1` FOREIGN KEY (`accident_id`) REFERENCES `tbl_accident_master` (`accident_id`),
  CONSTRAINT `tbl_accident_details_ibfk_2` FOREIGN KEY (`year_id`) REFERENCES `tbl_year_master` (`year_id`),
  CONSTRAINT `tbl_accident_details_ibfk_3` FOREIGN KEY (`region_id`) REFERENCES `tbl_region_master` (`region_id`),
  CONSTRAINT `tbl_accident_details_chk_1` CHECK ((`accident_num` between 1 and 999999999))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_accident_details`
--

LOCK TABLES `tbl_accident_details` WRITE;
/*!40000 ALTER TABLE `tbl_accident_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_accident_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_accident_master`
--

DROP TABLE IF EXISTS `tbl_accident_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_accident_master` (
  `accident_id` int NOT NULL,
  `accident_desc` varchar(200) NOT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(50) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `status_` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`accident_id`),
  CONSTRAINT `tbl_accident_master_chk_1` CHECK ((`accident_id` between 0 and 99))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_accident_master`
--

LOCK TABLES `tbl_accident_master` WRITE;
/*!40000 ALTER TABLE `tbl_accident_master` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_accident_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_case_status_master`
--

DROP TABLE IF EXISTS `tbl_case_status_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_case_status_master` (
  `case_stat_id` int NOT NULL,
  `case_stat_desc` varchar(200) NOT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(50) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `status_` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`case_stat_id`),
  CONSTRAINT `tbl_case_status_master_chk_1` CHECK ((`case_stat_id` between 0 and 99))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_case_status_master`
--

LOCK TABLES `tbl_case_status_master` WRITE;
/*!40000 ALTER TABLE `tbl_case_status_master` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_case_status_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_case_type_master`
--

DROP TABLE IF EXISTS `tbl_case_type_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_case_type_master` (
  `case_type_id` int NOT NULL,
  `case_type_desc` varchar(100) NOT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(50) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `status_` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`case_type_id`),
  CONSTRAINT `tbl_case_type_master_chk_1` CHECK ((`case_type_id` between 0 and 99))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_case_type_master`
--

LOCK TABLES `tbl_case_type_master` WRITE;
/*!40000 ALTER TABLE `tbl_case_type_master` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_case_type_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_civil_pol_det`
--

DROP TABLE IF EXISTS `tbl_civil_pol_det`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_civil_pol_det` (
  `civil_pol_det_refno` int NOT NULL AUTO_INCREMENT,
  `civil_pol_id` int NOT NULL,
  `year_id` int NOT NULL,
  `region_id` int NOT NULL,
  `unit_id` int DEFAULT NULL,
  `civil_pol_value` decimal(15,2) DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(50) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `status_` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`civil_pol_det_refno`),
  KEY `civil_pol_id` (`civil_pol_id`),
  KEY `region_id` (`region_id`),
  KEY `unit_id` (`unit_id`),
  KEY `idx_year_region` (`year_id`,`region_id`),
  CONSTRAINT `tbl_civil_pol_det_ibfk_1` FOREIGN KEY (`civil_pol_id`) REFERENCES `tbl_civil_police_master` (`civil_pol_id`),
  CONSTRAINT `tbl_civil_pol_det_ibfk_2` FOREIGN KEY (`year_id`) REFERENCES `tbl_year_master` (`year_id`),
  CONSTRAINT `tbl_civil_pol_det_ibfk_3` FOREIGN KEY (`region_id`) REFERENCES `tbl_region_master` (`region_id`),
  CONSTRAINT `tbl_civil_pol_det_ibfk_4` FOREIGN KEY (`unit_id`) REFERENCES `tbl_unit_master` (`unit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_civil_pol_det`
--

LOCK TABLES `tbl_civil_pol_det` WRITE;
/*!40000 ALTER TABLE `tbl_civil_pol_det` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_civil_pol_det` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_civil_police_master`
--

DROP TABLE IF EXISTS `tbl_civil_police_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_civil_police_master` (
  `civil_pol_id` int NOT NULL,
  `civil_pol_desc` varchar(200) NOT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(50) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `status_` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`civil_pol_id`),
  CONSTRAINT `tbl_civil_police_master_chk_1` CHECK ((`civil_pol_id` between 0 and 99))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_civil_police_master`
--

LOCK TABLES `tbl_civil_police_master` WRITE;
/*!40000 ALTER TABLE `tbl_civil_police_master` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_civil_police_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_cog_crime_master`
--

DROP TABLE IF EXISTS `tbl_cog_crime_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_cog_crime_master` (
  `cog_crime_id` int NOT NULL,
  `cog_crime_desc` varchar(200) NOT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(50) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `status_` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`cog_crime_id`),
  CONSTRAINT `tbl_cog_crime_master_chk_1` CHECK ((`cog_crime_id` between 0 and 99))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_cog_crime_master`
--

LOCK TABLES `tbl_cog_crime_master` WRITE;
/*!40000 ALTER TABLE `tbl_cog_crime_master` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_cog_crime_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_cogniz_crime`
--

DROP TABLE IF EXISTS `tbl_cogniz_crime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_cogniz_crime` (
  `cogniz_crime_refno` int NOT NULL AUTO_INCREMENT,
  `cog_crime_id` int NOT NULL,
  `year_id` int NOT NULL,
  `region_id` int NOT NULL,
  `cog_crime_num` int DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(50) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `status_` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`cogniz_crime_refno`),
  KEY `cog_crime_id` (`cog_crime_id`),
  KEY `region_id` (`region_id`),
  KEY `idx_year_region` (`year_id`,`region_id`),
  CONSTRAINT `tbl_cogniz_crime_ibfk_1` FOREIGN KEY (`cog_crime_id`) REFERENCES `tbl_cog_crime_master` (`cog_crime_id`),
  CONSTRAINT `tbl_cogniz_crime_ibfk_2` FOREIGN KEY (`year_id`) REFERENCES `tbl_year_master` (`year_id`),
  CONSTRAINT `tbl_cogniz_crime_ibfk_3` FOREIGN KEY (`region_id`) REFERENCES `tbl_region_master` (`region_id`),
  CONSTRAINT `tbl_cogniz_crime_chk_1` CHECK ((`cog_crime_num` between 1 and 999999999))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_cogniz_crime`
--

LOCK TABLES `tbl_cogniz_crime` WRITE;
/*!40000 ALTER TABLE `tbl_cogniz_crime` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_cogniz_crime` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_column_metadata`
--

DROP TABLE IF EXISTS `tbl_column_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_column_metadata` (
  `table_name` varchar(100) NOT NULL,
  `column_name` varchar(100) NOT NULL,
  `display_label` varchar(200) NOT NULL,
  PRIMARY KEY (`table_name`,`column_name`),
  KEY `idx_table_name` (`table_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_column_metadata`
--

LOCK TABLES `tbl_column_metadata` WRITE;
/*!40000 ALTER TABLE `tbl_column_metadata` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_column_metadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_conviction_master`
--

DROP TABLE IF EXISTS `tbl_conviction_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_conviction_master` (
  `conviction_id` int NOT NULL,
  `conviction_desc` varchar(200) NOT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(50) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `status_` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`conviction_id`),
  CONSTRAINT `tbl_conviction_master_chk_1` CHECK ((`conviction_id` between 0 and 99))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_conviction_master`
--

LOCK TABLES `tbl_conviction_master` WRITE;
/*!40000 ALTER TABLE `tbl_conviction_master` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_conviction_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_crime_convict_det`
--

DROP TABLE IF EXISTS `tbl_crime_convict_det`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_crime_convict_det` (
  `crime_convict_refno` int NOT NULL AUTO_INCREMENT,
  `conviction_id` int NOT NULL,
  `year_id` int NOT NULL,
  `region_id` int NOT NULL,
  `crime_convict_num` int DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(50) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `status_` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`crime_convict_refno`),
  KEY `conviction_id` (`conviction_id`),
  KEY `region_id` (`region_id`),
  KEY `idx_year_region` (`year_id`,`region_id`),
  CONSTRAINT `tbl_crime_convict_det_ibfk_1` FOREIGN KEY (`conviction_id`) REFERENCES `tbl_conviction_master` (`conviction_id`),
  CONSTRAINT `tbl_crime_convict_det_ibfk_2` FOREIGN KEY (`year_id`) REFERENCES `tbl_year_master` (`year_id`),
  CONSTRAINT `tbl_crime_convict_det_ibfk_3` FOREIGN KEY (`region_id`) REFERENCES `tbl_region_master` (`region_id`),
  CONSTRAINT `tbl_crime_convict_det_chk_1` CHECK ((`crime_convict_num` between 1 and 999999999))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_crime_convict_det`
--

LOCK TABLES `tbl_crime_convict_det` WRITE;
/*!40000 ALTER TABLE `tbl_crime_convict_det` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_crime_convict_det` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_crime_law_details`
--

DROP TABLE IF EXISTS `tbl_crime_law_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_crime_law_details` (
  `crime_law_det_refno` int NOT NULL AUTO_INCREMENT,
  `crime_law_id` int NOT NULL,
  `year_id` int NOT NULL,
  `region_id` int NOT NULL,
  `crime_det_num` int DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(50) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `status_` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`crime_law_det_refno`),
  KEY `crime_law_id` (`crime_law_id`),
  KEY `region_id` (`region_id`),
  KEY `idx_year_region` (`year_id`,`region_id`),
  CONSTRAINT `tbl_crime_law_details_ibfk_1` FOREIGN KEY (`crime_law_id`) REFERENCES `tbl_crime_law_master` (`crime_law_id`),
  CONSTRAINT `tbl_crime_law_details_ibfk_2` FOREIGN KEY (`year_id`) REFERENCES `tbl_year_master` (`year_id`),
  CONSTRAINT `tbl_crime_law_details_ibfk_3` FOREIGN KEY (`region_id`) REFERENCES `tbl_region_master` (`region_id`),
  CONSTRAINT `tbl_crime_law_details_chk_1` CHECK ((`crime_det_num` between 1 and 999999999))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_crime_law_details`
--

LOCK TABLES `tbl_crime_law_details` WRITE;
/*!40000 ALTER TABLE `tbl_crime_law_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_crime_law_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_crime_law_master`
--

DROP TABLE IF EXISTS `tbl_crime_law_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_crime_law_master` (
  `crime_law_id` int NOT NULL,
  `crime_law_desc` varchar(200) NOT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(50) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `status_` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`crime_law_id`),
  CONSTRAINT `tbl_crime_law_master_chk_1` CHECK ((`crime_law_id` between 0 and 99))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_crime_law_master`
--

LOCK TABLES `tbl_crime_law_master` WRITE;
/*!40000 ALTER TABLE `tbl_crime_law_master` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_crime_law_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_crime_stat_det`
--

DROP TABLE IF EXISTS `tbl_crime_stat_det`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_crime_stat_det` (
  `crime_stat_refno` int NOT NULL AUTO_INCREMENT,
  `offence_head_id` int NOT NULL,
  `offence_id` int NOT NULL,
  `year_id` int NOT NULL,
  `region_id` int NOT NULL,
  `crime_stat_num` int DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(50) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `status_` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`crime_stat_refno`),
  KEY `offence_head_id` (`offence_head_id`),
  KEY `offence_id` (`offence_id`),
  KEY `region_id` (`region_id`),
  KEY `idx_year_region` (`year_id`,`region_id`),
  CONSTRAINT `tbl_crime_stat_det_ibfk_1` FOREIGN KEY (`offence_head_id`) REFERENCES `tbl_offence_head_master` (`offence_head_id`),
  CONSTRAINT `tbl_crime_stat_det_ibfk_2` FOREIGN KEY (`offence_id`) REFERENCES `tbl_offence_master` (`offence_id`),
  CONSTRAINT `tbl_crime_stat_det_ibfk_3` FOREIGN KEY (`year_id`) REFERENCES `tbl_year_master` (`year_id`),
  CONSTRAINT `tbl_crime_stat_det_ibfk_4` FOREIGN KEY (`region_id`) REFERENCES `tbl_region_master` (`region_id`),
  CONSTRAINT `tbl_crime_stat_det_chk_1` CHECK ((`crime_stat_num` between 1 and 999999999))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_crime_stat_det`
--

LOCK TABLES `tbl_crime_stat_det` WRITE;
/*!40000 ALTER TABLE `tbl_crime_stat_det` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_crime_stat_det` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_crime_status_det`
--

DROP TABLE IF EXISTS `tbl_crime_status_det`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_crime_status_det` (
  `crime_status_refno` int NOT NULL AUTO_INCREMENT,
  `offence_head_id` int NOT NULL,
  `case_stat_id` int NOT NULL,
  `year_id` int NOT NULL,
  `region_id` int NOT NULL,
  `crime_status_num` int DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(50) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `status_` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`crime_status_refno`),
  KEY `offence_head_id` (`offence_head_id`),
  KEY `case_stat_id` (`case_stat_id`),
  KEY `region_id` (`region_id`),
  KEY `idx_year_region` (`year_id`,`region_id`),
  CONSTRAINT `tbl_crime_status_det_ibfk_1` FOREIGN KEY (`offence_head_id`) REFERENCES `tbl_offence_head_master` (`offence_head_id`),
  CONSTRAINT `tbl_crime_status_det_ibfk_2` FOREIGN KEY (`case_stat_id`) REFERENCES `tbl_case_status_master` (`case_stat_id`),
  CONSTRAINT `tbl_crime_status_det_ibfk_3` FOREIGN KEY (`year_id`) REFERENCES `tbl_year_master` (`year_id`),
  CONSTRAINT `tbl_crime_status_det_ibfk_4` FOREIGN KEY (`region_id`) REFERENCES `tbl_region_master` (`region_id`),
  CONSTRAINT `tbl_crime_status_det_chk_1` CHECK ((`crime_status_num` between 1 and 999999999))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_crime_status_det`
--

LOCK TABLES `tbl_crime_status_det` WRITE;
/*!40000 ALTER TABLE `tbl_crime_status_det` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_crime_status_det` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_crime_status_law`
--

DROP TABLE IF EXISTS `tbl_crime_status_law`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_crime_status_law` (
  `crime_status_law_refno` int NOT NULL AUTO_INCREMENT,
  `offence_head_id` int NOT NULL,
  `offence_id` int NOT NULL,
  `year_id` int NOT NULL,
  `region_id` int NOT NULL,
  `crime_status_law_num` int DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(50) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `status_` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`crime_status_law_refno`),
  KEY `offence_head_id` (`offence_head_id`),
  KEY `offence_id` (`offence_id`),
  KEY `region_id` (`region_id`),
  KEY `idx_year_region` (`year_id`,`region_id`),
  CONSTRAINT `tbl_crime_status_law_ibfk_1` FOREIGN KEY (`offence_head_id`) REFERENCES `tbl_offence_head_master` (`offence_head_id`),
  CONSTRAINT `tbl_crime_status_law_ibfk_2` FOREIGN KEY (`offence_id`) REFERENCES `tbl_offence_master` (`offence_id`),
  CONSTRAINT `tbl_crime_status_law_ibfk_3` FOREIGN KEY (`year_id`) REFERENCES `tbl_year_master` (`year_id`),
  CONSTRAINT `tbl_crime_status_law_ibfk_4` FOREIGN KEY (`region_id`) REFERENCES `tbl_region_master` (`region_id`),
  CONSTRAINT `tbl_crime_status_law_chk_1` CHECK ((`crime_status_law_num` between 1 and 999999999))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_crime_status_law`
--

LOCK TABLES `tbl_crime_status_law` WRITE;
/*!40000 ALTER TABLE `tbl_crime_status_law` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_crime_status_law` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_currency_crime_det`
--

DROP TABLE IF EXISTS `tbl_currency_crime_det`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_currency_crime_det` (
  `curr_crime_refno` int NOT NULL AUTO_INCREMENT,
  `police_stn_id` int NOT NULL,
  `currency_denom_id` int NOT NULL,
  `year_id` int NOT NULL,
  `region_id` int NOT NULL,
  `curr_crime_num` int DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(50) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `status_` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`curr_crime_refno`),
  KEY `police_stn_id` (`police_stn_id`),
  KEY `currency_denom_id` (`currency_denom_id`),
  KEY `region_id` (`region_id`),
  KEY `idx_year_region` (`year_id`,`region_id`),
  CONSTRAINT `tbl_currency_crime_det_ibfk_1` FOREIGN KEY (`police_stn_id`) REFERENCES `tbl_police_station_master` (`police_stn_id`),
  CONSTRAINT `tbl_currency_crime_det_ibfk_2` FOREIGN KEY (`currency_denom_id`) REFERENCES `tbl_currency_denom_master` (`currency_denom_id`),
  CONSTRAINT `tbl_currency_crime_det_ibfk_3` FOREIGN KEY (`year_id`) REFERENCES `tbl_year_master` (`year_id`),
  CONSTRAINT `tbl_currency_crime_det_ibfk_4` FOREIGN KEY (`region_id`) REFERENCES `tbl_region_master` (`region_id`),
  CONSTRAINT `tbl_currency_crime_det_chk_1` CHECK ((`curr_crime_num` between 1 and 999999999))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_currency_crime_det`
--

LOCK TABLES `tbl_currency_crime_det` WRITE;
/*!40000 ALTER TABLE `tbl_currency_crime_det` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_currency_crime_det` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_currency_denom_master`
--

DROP TABLE IF EXISTS `tbl_currency_denom_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_currency_denom_master` (
  `currency_denom_id` int NOT NULL,
  `currency_denom_desc` varchar(100) NOT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(50) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `status_` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`currency_denom_id`),
  CONSTRAINT `tbl_currency_denom_master_chk_1` CHECK ((`currency_denom_id` between 0 and 99))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_currency_denom_master`
--

LOCK TABLES `tbl_currency_denom_master` WRITE;
/*!40000 ALTER TABLE `tbl_currency_denom_master` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_currency_denom_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_dept_master`
--

DROP TABLE IF EXISTS `tbl_dept_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_dept_master` (
  `dept_id` int NOT NULL,
  `dept_desc` varchar(200) DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(50) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `status_` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`dept_id`),
  CONSTRAINT `tbl_dept_master_chk_1` CHECK ((`dept_id` between 1 and 999))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_dept_master`
--

LOCK TABLES `tbl_dept_master` WRITE;
/*!40000 ALTER TABLE `tbl_dept_master` DISABLE KEYS */;
INSERT INTO `tbl_dept_master` VALUES (1,'Information Technology','admin','2026-01-22 11:40:06',NULL,NULL,NULL),(2,'Economics & Statistics','admin','2026-01-22 11:40:06',NULL,NULL,NULL),(3,'Animal Husbandry and Animal Welfare','admin','2026-01-22 11:40:06',NULL,NULL,NULL),(4,'Adi Dravidar Welfare','admin','2026-01-22 11:40:06',NULL,NULL,NULL);
/*!40000 ALTER TABLE `tbl_dept_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_livestock_census`
--

DROP TABLE IF EXISTS `tbl_livestock_census`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_livestock_census` (
  `livestock_census_refno` int NOT NULL AUTO_INCREMENT,
  `livestock_id` int NOT NULL,
  `livestock_div_id` int NOT NULL,
  `year_id` int NOT NULL,
  `region_id` int NOT NULL,
  `livestock_num` int NOT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(50) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `status_` tinyint(1) DEFAULT '1',
  `is_approved` tinyint DEFAULT NULL COMMENT 'NULL=Pending, 1=Approved, 0=Rejected',
  `upload_id` int DEFAULT NULL,
  PRIMARY KEY (`livestock_census_refno`),
  KEY `livestock_id` (`livestock_id`),
  KEY `livestock_div_id` (`livestock_div_id`),
  KEY `region_id` (`region_id`),
  KEY `idx_year_region` (`year_id`,`region_id`),
  CONSTRAINT `tbl_livestock_census_ibfk_1` FOREIGN KEY (`livestock_id`) REFERENCES `tbl_livestock_master` (`livestock_id`),
  CONSTRAINT `tbl_livestock_census_ibfk_2` FOREIGN KEY (`livestock_div_id`) REFERENCES `tbl_livestock_div_master` (`livestock_div_id`),
  CONSTRAINT `tbl_livestock_census_ibfk_3` FOREIGN KEY (`year_id`) REFERENCES `tbl_year_master` (`year_id`),
  CONSTRAINT `tbl_livestock_census_ibfk_4` FOREIGN KEY (`region_id`) REFERENCES `tbl_region_master` (`region_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_livestock_census`
--

LOCK TABLES `tbl_livestock_census` WRITE;
/*!40000 ALTER TABLE `tbl_livestock_census` DISABLE KEYS */;
INSERT INTO `tbl_livestock_census` VALUES (1,8,2,2,4,50000,'Nanda_AH','2026-02-02 11:00:02','approver_IT','2026-02-02 11:01:53',1,1,1),(2,9,2,1,1,200,'Nanda_AH','2026-02-02 11:00:02','approver_IT','2026-02-02 11:02:45',1,1,1),(3,8,2,2,4,50000,'Nanda_AH','2026-02-02 11:24:28','Nanda_AH','2026-02-02 11:24:28',NULL,NULL,2),(4,9,2,1,1,20000,'Nanda_AH','2026-02-02 11:24:28','Nanda_AH','2026-02-02 11:24:28',NULL,NULL,2);
/*!40000 ALTER TABLE `tbl_livestock_census` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_livestock_div_master`
--

DROP TABLE IF EXISTS `tbl_livestock_div_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_livestock_div_master` (
  `livestock_div_id` int NOT NULL,
  `livestock_div_desc` varchar(100) NOT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(50) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `status_` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`livestock_div_id`),
  CONSTRAINT `tbl_livestock_div_master_chk_1` CHECK ((`livestock_div_id` between 0 and 99))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_livestock_div_master`
--

LOCK TABLES `tbl_livestock_div_master` WRITE;
/*!40000 ALTER TABLE `tbl_livestock_div_master` DISABLE KEYS */;
INSERT INTO `tbl_livestock_div_master` VALUES (1,'Males over 3 years','admin','2026-01-22 11:47:40',NULL,NULL,NULL),(2,'Femaltes over 3 years','admin','2026-01-22 11:47:40',NULL,NULL,NULL),(3,'Males over 2-1/2 years','admin','2026-01-22 11:47:40',NULL,NULL,NULL),(4,'Females over 2-1/2 years','admin','2026-01-22 11:47:40',NULL,NULL,NULL),(5,'Young Stock','admin','2026-01-22 11:47:40',NULL,NULL,NULL),(6,'Domestic','admin','2026-01-22 11:47:40',NULL,NULL,NULL),(7,'Stray','admin','2026-01-22 11:47:40',NULL,NULL,NULL);
/*!40000 ALTER TABLE `tbl_livestock_div_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_livestock_master`
--

DROP TABLE IF EXISTS `tbl_livestock_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_livestock_master` (
  `livestock_id` int NOT NULL,
  `livestock_desc` varchar(100) NOT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(50) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `status_` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`livestock_id`),
  CONSTRAINT `tbl_livestock_master_chk_1` CHECK ((`livestock_id` between 0 and 99))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_livestock_master`
--

LOCK TABLES `tbl_livestock_master` WRITE;
/*!40000 ALTER TABLE `tbl_livestock_master` DISABLE KEYS */;
INSERT INTO `tbl_livestock_master` VALUES (1,'Cattle','admin','2026-01-22 11:47:40',NULL,NULL,NULL),(2,'Buffaloes','admin','2026-01-22 11:47:40',NULL,NULL,NULL),(3,'Sheep','admin','2026-01-22 11:47:40',NULL,NULL,NULL),(4,'Goats','admin','2026-01-22 11:47:40',NULL,NULL,NULL),(5,'Horses and Ponies','admin','2026-01-22 11:47:40',NULL,NULL,NULL),(6,'Donkeys','admin','2026-01-22 11:47:40',NULL,NULL,NULL),(7,'Pigs','admin','2026-01-22 11:47:40',NULL,NULL,NULL),(8,'Camel','admin','2026-01-22 11:47:40',NULL,NULL,NULL),(9,'Elephant','admin','2026-01-22 11:47:40',NULL,NULL,NULL),(10,'Rabbit','admin','2026-01-22 11:47:40',NULL,NULL,NULL),(11,'Dog','admin','2026-01-22 11:47:40',NULL,NULL,NULL),(12,'Fowls','admin','2026-01-22 11:47:40',NULL,NULL,NULL),(13,'Ducks','admin','2026-01-22 11:47:40',NULL,NULL,NULL),(14,'Other Poultry','admin','2026-01-22 11:47:40',NULL,NULL,NULL),(15,'Hen','admin','2026-01-05 17:12:18',NULL,NULL,NULL);
/*!40000 ALTER TABLE `tbl_livestock_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_livestock_prod`
--

DROP TABLE IF EXISTS `tbl_livestock_prod`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_livestock_prod` (
  `livestock_prod_refno` int NOT NULL AUTO_INCREMENT,
  `livestock_prod_id` int NOT NULL,
  `year_id` int NOT NULL,
  `region_id` int NOT NULL,
  `unit_id` int DEFAULT NULL,
  `livestock_prod_num` int DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(50) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `status_` tinyint(1) DEFAULT '1',
  `is_approved` tinyint DEFAULT NULL COMMENT 'NULL=Pending, 1=Approved, 0=Rejected',
  PRIMARY KEY (`livestock_prod_refno`),
  KEY `livestock_prod_id` (`livestock_prod_id`),
  KEY `region_id` (`region_id`),
  KEY `unit_id` (`unit_id`),
  KEY `idx_year_region` (`year_id`,`region_id`),
  CONSTRAINT `tbl_livestock_prod_ibfk_1` FOREIGN KEY (`livestock_prod_id`) REFERENCES `tbl_livestock_prod_master` (`livestock_prod_id`),
  CONSTRAINT `tbl_livestock_prod_ibfk_2` FOREIGN KEY (`year_id`) REFERENCES `tbl_year_master` (`year_id`),
  CONSTRAINT `tbl_livestock_prod_ibfk_3` FOREIGN KEY (`region_id`) REFERENCES `tbl_region_master` (`region_id`),
  CONSTRAINT `tbl_livestock_prod_ibfk_4` FOREIGN KEY (`unit_id`) REFERENCES `tbl_unit_master` (`unit_id`),
  CONSTRAINT `tbl_livestock_prod_chk_1` CHECK ((`livestock_prod_num` between 1 and 9999999))
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_livestock_prod`
--

LOCK TABLES `tbl_livestock_prod` WRITE;
/*!40000 ALTER TABLE `tbl_livestock_prod` DISABLE KEYS */;
INSERT INTO `tbl_livestock_prod` VALUES (1,2,1,4,2,5000,'Nanda_AH','2026-01-27 17:05:43','Nanda_AH','2026-01-27 17:05:43',1,NULL),(2,2,1,4,2,5000,'Nanda_AH','2026-01-27 17:06:03','Nanda_AH','2026-01-27 17:06:03',1,NULL);
/*!40000 ALTER TABLE `tbl_livestock_prod` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_livestock_prod_master`
--

DROP TABLE IF EXISTS `tbl_livestock_prod_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_livestock_prod_master` (
  `livestock_prod_id` int NOT NULL,
  `livestock_prod_desc` varchar(100) NOT NULL,
  `livestock_unit` varchar(100) DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(50) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `status_` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`livestock_prod_id`),
  CONSTRAINT `tbl_livestock_prod_master_chk_1` CHECK ((`livestock_prod_id` between 0 and 99))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_livestock_prod_master`
--

LOCK TABLES `tbl_livestock_prod_master` WRITE;
/*!40000 ALTER TABLE `tbl_livestock_prod_master` DISABLE KEYS */;
INSERT INTO `tbl_livestock_prod_master` VALUES (1,'Milk','Tonnes','admin','2026-01-22 11:47:40',NULL,NULL,NULL),(2,'Eggs','Lakh Nos','admin','2026-01-22 11:47:40',NULL,NULL,NULL),(3,'Meat - Livestock','Metric Tonnes','admin','2026-01-22 11:47:40',NULL,NULL,NULL),(4,'Meat - Poultry','Metric Tonnes','admin','2026-01-22 11:47:40',NULL,NULL,NULL);
/*!40000 ALTER TABLE `tbl_livestock_prod_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_month_master`
--

DROP TABLE IF EXISTS `tbl_month_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_month_master` (
  `month_id` int NOT NULL,
  `month_desc` varchar(100) NOT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(50) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `status_` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`month_id`),
  CONSTRAINT `tbl_month_master_chk_1` CHECK ((`month_id` between 1 and 99))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_month_master`
--

LOCK TABLES `tbl_month_master` WRITE;
/*!40000 ALTER TABLE `tbl_month_master` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_month_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_offence_head_master`
--

DROP TABLE IF EXISTS `tbl_offence_head_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_offence_head_master` (
  `offence_head_id` int NOT NULL,
  `offence_head_desc` varchar(100) NOT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(50) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `status_` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`offence_head_id`),
  CONSTRAINT `tbl_offence_head_master_chk_1` CHECK ((`offence_head_id` between 0 and 99))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_offence_head_master`
--

LOCK TABLES `tbl_offence_head_master` WRITE;
/*!40000 ALTER TABLE `tbl_offence_head_master` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_offence_head_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_offence_master`
--

DROP TABLE IF EXISTS `tbl_offence_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_offence_master` (
  `offence_id` int NOT NULL,
  `offence_desc` varchar(200) NOT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(50) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `status_` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`offence_id`),
  CONSTRAINT `tbl_offence_master_chk_1` CHECK ((`offence_id` between 0 and 999))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_offence_master`
--

LOCK TABLES `tbl_offence_master` WRITE;
/*!40000 ALTER TABLE `tbl_offence_master` DISABLE KEYS */;
INSERT INTO `tbl_offence_master` VALUES (1,'Reported','admin','2026-01-21 16:58:02',NULL,NULL,1),(2,'Detected','admin','2026-01-21 16:58:02',NULL,NULL,1);
/*!40000 ALTER TABLE `tbl_offence_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_pol_work_strgth_det`
--

DROP TABLE IF EXISTS `tbl_pol_work_strgth_det`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_pol_work_strgth_det` (
  `pol_workstgth_refno` int NOT NULL AUTO_INCREMENT,
  `police_stn_id` int NOT NULL,
  `police_post_id` int NOT NULL,
  `year_id` int NOT NULL,
  `pol_workstgth_num` int DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(50) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `status_` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`pol_workstgth_refno`),
  KEY `police_stn_id` (`police_stn_id`),
  KEY `police_post_id` (`police_post_id`),
  KEY `idx_year` (`year_id`),
  CONSTRAINT `tbl_pol_work_strgth_det_ibfk_1` FOREIGN KEY (`police_stn_id`) REFERENCES `tbl_police_station_master` (`police_stn_id`),
  CONSTRAINT `tbl_pol_work_strgth_det_ibfk_2` FOREIGN KEY (`police_post_id`) REFERENCES `tbl_police_post_master` (`police_post_id`),
  CONSTRAINT `tbl_pol_work_strgth_det_ibfk_3` FOREIGN KEY (`year_id`) REFERENCES `tbl_year_master` (`year_id`),
  CONSTRAINT `tbl_pol_work_strgth_det_chk_1` CHECK ((`pol_workstgth_num` between 1 and 999999999))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_pol_work_strgth_det`
--

LOCK TABLES `tbl_pol_work_strgth_det` WRITE;
/*!40000 ALTER TABLE `tbl_pol_work_strgth_det` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_pol_work_strgth_det` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_police_post_master`
--

DROP TABLE IF EXISTS `tbl_police_post_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_police_post_master` (
  `police_post_id` int NOT NULL,
  `police_post_desc` varchar(200) NOT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(50) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `status_` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`police_post_id`),
  CONSTRAINT `tbl_police_post_master_chk_1` CHECK ((`police_post_id` between 0 and 99))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_police_post_master`
--

LOCK TABLES `tbl_police_post_master` WRITE;
/*!40000 ALTER TABLE `tbl_police_post_master` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_police_post_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_police_station_master`
--

DROP TABLE IF EXISTS `tbl_police_station_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_police_station_master` (
  `police_stn_id` int NOT NULL,
  `police_stn_desc` varchar(200) NOT NULL,
  `region_id` int DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(50) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `status_` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`police_stn_id`),
  KEY `region_id` (`region_id`),
  CONSTRAINT `tbl_police_station_master_ibfk_1` FOREIGN KEY (`region_id`) REFERENCES `tbl_region_master` (`region_id`),
  CONSTRAINT `tbl_police_station_master_chk_1` CHECK ((`police_stn_id` between 0 and 99))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_police_station_master`
--

LOCK TABLES `tbl_police_station_master` WRITE;
/*!40000 ALTER TABLE `tbl_police_station_master` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_police_station_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_property_stolen_master`
--

DROP TABLE IF EXISTS `tbl_property_stolen_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_property_stolen_master` (
  `prop_stolen_id` int NOT NULL,
  `prop_stolen_desc` varchar(200) NOT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(50) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `status_` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`prop_stolen_id`),
  CONSTRAINT `tbl_property_stolen_master_chk_1` CHECK ((`prop_stolen_id` between 0 and 99))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_property_stolen_master`
--

LOCK TABLES `tbl_property_stolen_master` WRITE;
/*!40000 ALTER TABLE `tbl_property_stolen_master` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_property_stolen_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_region_master`
--

DROP TABLE IF EXISTS `tbl_region_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_region_master` (
  `region_id` int NOT NULL,
  `region_desc` varchar(100) NOT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(50) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `status_` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`region_id`),
  CONSTRAINT `tbl_region_master_chk_1` CHECK ((`region_id` between 1 and 999))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_region_master`
--

LOCK TABLES `tbl_region_master` WRITE;
/*!40000 ALTER TABLE `tbl_region_master` DISABLE KEYS */;
INSERT INTO `tbl_region_master` VALUES (1,'Puducherry','admin','2026-01-21 16:58:02',NULL,NULL,1),(2,'Karaikal','admin','2026-01-21 16:58:02',NULL,NULL,1),(3,'Yanam','admin','2026-01-21 16:58:02',NULL,NULL,1),(4,'Mahe','admin','2026-01-21 16:58:02',NULL,NULL,1);
/*!40000 ALTER TABLE `tbl_region_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_riot_hurt_det`
--

DROP TABLE IF EXISTS `tbl_riot_hurt_det`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_riot_hurt_det` (
  `riot_hurt_refno` int NOT NULL AUTO_INCREMENT,
  `police_stn_id` int NOT NULL,
  `case_type_id` int NOT NULL,
  `year_id` int NOT NULL,
  `region_id` int NOT NULL,
  `riot_hurt_num` int DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(50) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `status_` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`riot_hurt_refno`),
  KEY `police_stn_id` (`police_stn_id`),
  KEY `case_type_id` (`case_type_id`),
  KEY `region_id` (`region_id`),
  KEY `idx_year_region` (`year_id`,`region_id`),
  CONSTRAINT `tbl_riot_hurt_det_ibfk_1` FOREIGN KEY (`police_stn_id`) REFERENCES `tbl_police_station_master` (`police_stn_id`),
  CONSTRAINT `tbl_riot_hurt_det_ibfk_2` FOREIGN KEY (`case_type_id`) REFERENCES `tbl_case_type_master` (`case_type_id`),
  CONSTRAINT `tbl_riot_hurt_det_ibfk_3` FOREIGN KEY (`year_id`) REFERENCES `tbl_year_master` (`year_id`),
  CONSTRAINT `tbl_riot_hurt_det_ibfk_4` FOREIGN KEY (`region_id`) REFERENCES `tbl_region_master` (`region_id`),
  CONSTRAINT `tbl_riot_hurt_det_chk_1` CHECK ((`riot_hurt_num` between 1 and 999999999))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_riot_hurt_det`
--

LOCK TABLES `tbl_riot_hurt_det` WRITE;
/*!40000 ALTER TABLE `tbl_riot_hurt_det` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_riot_hurt_det` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_stole_recov_det`
--

DROP TABLE IF EXISTS `tbl_stole_recov_det`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_stole_recov_det` (
  `stole_recov_refno` int NOT NULL AUTO_INCREMENT,
  `prop_stolen_id` int NOT NULL,
  `year_id` int NOT NULL,
  `region_id` int NOT NULL,
  `stole_recov_num` int DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(50) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `status_` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`stole_recov_refno`),
  KEY `prop_stolen_id` (`prop_stolen_id`),
  KEY `region_id` (`region_id`),
  KEY `idx_year_region` (`year_id`,`region_id`),
  CONSTRAINT `tbl_stole_recov_det_ibfk_1` FOREIGN KEY (`prop_stolen_id`) REFERENCES `tbl_property_stolen_master` (`prop_stolen_id`),
  CONSTRAINT `tbl_stole_recov_det_ibfk_2` FOREIGN KEY (`year_id`) REFERENCES `tbl_year_master` (`year_id`),
  CONSTRAINT `tbl_stole_recov_det_ibfk_3` FOREIGN KEY (`region_id`) REFERENCES `tbl_region_master` (`region_id`),
  CONSTRAINT `tbl_stole_recov_det_chk_1` CHECK ((`stole_recov_num` between 1 and 999999999))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_stole_recov_det`
--

LOCK TABLES `tbl_stole_recov_det` WRITE;
/*!40000 ALTER TABLE `tbl_stole_recov_det` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_stole_recov_det` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_unit_master`
--

DROP TABLE IF EXISTS `tbl_unit_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_unit_master` (
  `unit_id` int NOT NULL,
  `unit_measure` varchar(100) NOT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(50) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `status_` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`unit_id`),
  CONSTRAINT `tbl_unit_master_chk_1` CHECK ((`unit_id` between 1 and 999))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_unit_master`
--

LOCK TABLES `tbl_unit_master` WRITE;
/*!40000 ALTER TABLE `tbl_unit_master` DISABLE KEYS */;
INSERT INTO `tbl_unit_master` VALUES (1,'Hectares','admin','2026-01-21 16:58:02',NULL,NULL,1),(2,'Acres','admin','2026-01-21 16:58:02',NULL,NULL,1),(3,'Square Kilometers','admin','2026-01-21 16:58:02',NULL,NULL,1),(4,'Square Meters','admin','2026-01-21 16:58:02',NULL,NULL,1),(5,'Numbers','admin','2026-01-21 16:58:02',NULL,NULL,1),(6,'Litres','admin','2026-01-21 16:58:02',NULL,NULL,1),(7,'Eggs (Number)','admin','2026-01-21 16:58:02',NULL,NULL,1);
/*!40000 ALTER TABLE `tbl_unit_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_vet_aid`
--

DROP TABLE IF EXISTS `tbl_vet_aid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_vet_aid` (
  `vet_aid_refno` int NOT NULL AUTO_INCREMENT,
  `vet_aid_id` int NOT NULL,
  `unit_id` int NOT NULL,
  `year_id` int NOT NULL,
  `region_id` int NOT NULL,
  `vet_aid_num` int NOT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(50) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `status_` tinyint(1) DEFAULT '1',
  `is_approved` tinyint DEFAULT NULL COMMENT 'NULL=Pending, 1=Approved, 0=Rejected',
  PRIMARY KEY (`vet_aid_refno`),
  KEY `vet_aid_id` (`vet_aid_id`),
  KEY `unit_id` (`unit_id`),
  KEY `region_id` (`region_id`),
  KEY `idx_year_region` (`year_id`,`region_id`),
  CONSTRAINT `tbl_vet_aid_ibfk_1` FOREIGN KEY (`vet_aid_id`) REFERENCES `tbl_vet_aid_master` (`vet_aid_id`),
  CONSTRAINT `tbl_vet_aid_ibfk_2` FOREIGN KEY (`unit_id`) REFERENCES `tbl_unit_master` (`unit_id`),
  CONSTRAINT `tbl_vet_aid_ibfk_3` FOREIGN KEY (`year_id`) REFERENCES `tbl_year_master` (`year_id`),
  CONSTRAINT `tbl_vet_aid_ibfk_4` FOREIGN KEY (`region_id`) REFERENCES `tbl_region_master` (`region_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_vet_aid`
--

LOCK TABLES `tbl_vet_aid` WRITE;
/*!40000 ALTER TABLE `tbl_vet_aid` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_vet_aid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_vet_aid_master`
--

DROP TABLE IF EXISTS `tbl_vet_aid_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_vet_aid_master` (
  `vet_aid_id` int NOT NULL,
  `vet_aid_desc` varchar(200) NOT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(50) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `status_` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`vet_aid_id`),
  CONSTRAINT `tbl_vet_aid_master_chk_1` CHECK ((`vet_aid_id` between 0 and 999))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_vet_aid_master`
--

LOCK TABLES `tbl_vet_aid_master` WRITE;
/*!40000 ALTER TABLE `tbl_vet_aid_master` DISABLE KEYS */;
INSERT INTO `tbl_vet_aid_master` VALUES (1,'Cases treaed in daily clinic','admin','2026-01-22 11:47:40',NULL,NULL,NULL),(2,'Castration done','admin','2026-01-22 11:47:40',NULL,NULL,NULL),(3,'Operations done','admin','2026-01-22 11:47:40',NULL,NULL,NULL),(4,'Cases treated in night clinic','admin','2026-01-22 11:47:40',NULL,NULL,NULL),(5,'Vaccination done','admin','2026-01-22 11:47:40',NULL,NULL,NULL),(6,'Specimen examined in clinical laboratory','admin','2026-01-22 11:47:40',NULL,NULL,NULL),(7,'Post mortem examination done (Cattle)','admin','2026-01-22 11:47:40',NULL,NULL,NULL),(8,'Post mortem examination done (Poultry and others)','admin','2026-01-22 11:47:40',NULL,NULL,NULL),(9,'Milk for mastitis test','admin','2026-01-22 11:47:40',NULL,NULL,NULL),(10,'Skin scraping test','admin','2026-01-22 11:47:40',NULL,NULL,NULL),(11,'Liver function test','admin','2026-01-22 11:47:40',NULL,NULL,NULL),(12,'Antibiotic sensitive test','admin','2026-01-22 11:47:40',NULL,NULL,NULL),(13,'Dogs protected through antirabies vaccination','admin','2026-01-22 11:47:40',NULL,NULL,NULL),(14,'Post bite treatment given to animals','admin','2026-01-22 11:47:40',NULL,NULL,NULL);
/*!40000 ALTER TABLE `tbl_vet_aid_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_vet_infra`
--

DROP TABLE IF EXISTS `tbl_vet_infra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_vet_infra` (
  `vet_infra_refno` int NOT NULL AUTO_INCREMENT,
  `vet_infra_cat_id` int NOT NULL,
  `unit_id` int NOT NULL,
  `year_id` int NOT NULL,
  `region_id` int NOT NULL,
  `vet_infra_num` int NOT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(50) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `status_` tinyint(1) DEFAULT '1',
  `is_approved` tinyint DEFAULT NULL COMMENT 'NULL=Pending, 1=Approved, 0=Rejected',
  PRIMARY KEY (`vet_infra_refno`),
  KEY `vet_infra_cat_id` (`vet_infra_cat_id`),
  KEY `unit_id` (`unit_id`),
  KEY `region_id` (`region_id`),
  KEY `idx_year_region` (`year_id`,`region_id`),
  CONSTRAINT `tbl_vet_infra_ibfk_1` FOREIGN KEY (`vet_infra_cat_id`) REFERENCES `tbl_vet_infra_cat_master` (`vet_infra_cat_id`),
  CONSTRAINT `tbl_vet_infra_ibfk_2` FOREIGN KEY (`unit_id`) REFERENCES `tbl_unit_master` (`unit_id`),
  CONSTRAINT `tbl_vet_infra_ibfk_3` FOREIGN KEY (`year_id`) REFERENCES `tbl_year_master` (`year_id`),
  CONSTRAINT `tbl_vet_infra_ibfk_4` FOREIGN KEY (`region_id`) REFERENCES `tbl_region_master` (`region_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_vet_infra`
--

LOCK TABLES `tbl_vet_infra` WRITE;
/*!40000 ALTER TABLE `tbl_vet_infra` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_vet_infra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_vet_infra_cat_master`
--

DROP TABLE IF EXISTS `tbl_vet_infra_cat_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_vet_infra_cat_master` (
  `vet_infra_cat_id` int NOT NULL,
  `vet_infra_cat_desc` varchar(300) NOT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(50) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `status_` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`vet_infra_cat_id`),
  CONSTRAINT `tbl_vet_infra_cat_master_chk_1` CHECK ((`vet_infra_cat_id` between 0 and 999))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_vet_infra_cat_master`
--

LOCK TABLES `tbl_vet_infra_cat_master` WRITE;
/*!40000 ALTER TABLE `tbl_vet_infra_cat_master` DISABLE KEYS */;
INSERT INTO `tbl_vet_infra_cat_master` VALUES (1,'Veterinary Hospitals / Teaching Veterinary Campus','admin','2026-01-22 11:47:40',NULL,NULL,NULL),(2,'Veterinary Dispensaries','admin','2026-01-22 11:47:40',NULL,NULL,NULL),(3,'Minor Veterinary Dispensaries','admin','2026-01-22 11:47:40',NULL,NULL,NULL),(4,'Mobile Veterinary Dispensaries','admin','2026-01-22 11:47:40',NULL,NULL,NULL),(5,'Night Clinic','admin','2026-01-22 11:47:40',NULL,NULL,NULL),(6,'Artifiical Insemination Centre of Ponlait / Vet. College','admin','2026-01-22 11:47:40',NULL,NULL,NULL),(7,'Frozen Semen Bank','admin','2026-01-22 11:47:40',NULL,NULL,NULL),(8,'Disease Investigation Centre','admin','2026-01-22 11:47:40',NULL,NULL,NULL),(9,'Cliincal Laboratory','admin','2026-01-22 11:47:40',NULL,NULL,NULL),(10,'Central Veterinary Medical Store','admin','2026-01-22 11:47:40',NULL,NULL,NULL),(11,'Rinderpest Checkpost','admin','2026-01-22 11:47:40',NULL,NULL,NULL),(12,'Key Village Units','admin','2026-01-22 11:47:40',NULL,NULL,NULL),(13,'Poultry farm','admin','2026-01-22 11:47:40',NULL,NULL,NULL),(14,'Pig Breeding Unit','admin','2026-01-22 11:47:40',NULL,NULL,NULL),(15,'Veterinary Assistant Surgeon','admin','2026-01-22 11:47:40',NULL,NULL,NULL),(16,'Assistant Veterinarian','admin','2026-01-22 11:47:40',NULL,NULL,NULL),(17,'Attendant (Veterinary)','admin','2026-01-22 11:47:40',NULL,NULL,NULL);
/*!40000 ALTER TABLE `tbl_vet_infra_cat_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_year_master`
--

DROP TABLE IF EXISTS `tbl_year_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_year_master` (
  `year_id` int NOT NULL,
  `year_desc` varchar(50) NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(50) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `status_` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`year_id`),
  CONSTRAINT `tbl_year_master_chk_1` CHECK ((`year_id` between 1 and 999))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_year_master`
--

LOCK TABLES `tbl_year_master` WRITE;
/*!40000 ALTER TABLE `tbl_year_master` DISABLE KEYS */;
INSERT INTO `tbl_year_master` VALUES (1,'2025-26','2025-04-01 00:00:00','2026-03-31 00:00:00','admin','2026-01-21 16:58:02',NULL,NULL,1),(2,'2024-25','2024-04-01 00:00:00','2025-03-31 00:00:00','admin','2026-01-21 16:58:02',NULL,NULL,1),(101,'2025-26','2025-06-01 00:00:00','2026-05-31 00:00:00','admin','2026-01-21 16:58:02',NULL,NULL,1),(102,'2024-25','2024-06-01 00:00:00','2025-05-31 00:00:00','admin','2026-01-21 16:58:02',NULL,NULL,1);
/*!40000 ALTER TABLE `tbl_year_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `txn_registry`
--

DROP TABLE IF EXISTS `txn_registry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `txn_registry` (
  `report_id` int NOT NULL AUTO_INCREMENT,
  `department` varchar(100) NOT NULL,
  `report_name` varchar(200) NOT NULL,
  `target_table_name` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`report_id`),
  KEY `idx_department` (`department`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `txn_registry`
--

LOCK TABLES `txn_registry` WRITE;
/*!40000 ALTER TABLE `txn_registry` DISABLE KEYS */;
INSERT INTO `txn_registry` VALUES (1,'Animal Husbandry and Animal Welfare','Livestock Census Details','tbl_livestock_census','2026-01-22 04:50:41'),(2,'Animal Husbandry and Animal Welfare','Veterinary Aid Details','tbl_vet_aid','2026-01-22 04:50:41'),(3,'Animal Husbandry and Animal Welfare','Veterinary Infrastructure Details','tbl_vet_infra','2026-01-22 04:50:41'),(4,'Animal Husbandry and Animal Welfare','Livestock Production Details','tbl_livestock_prod','2026-01-22 04:50:41'),(5,'Adi Dravidar Welfare','Hostel Details','tbl_hostel_det','2026-01-22 04:50:55'),(6,'Adi Dravidar Welfare','Welfare Measure Details ','tbl_welfare_measure_det','2026-01-22 04:50:55'),(7,'Adi Dravidar Welfare','Welfare Student Details ','tbl_welfare_student_det','2026-01-22 04:50:55');
/*!40000 ALTER TABLE `txn_registry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `department` varchar(100) DEFAULT NULL,
  `role` enum('admin','user','approver') DEFAULT 'user',
  `created_by` varchar(100) DEFAULT NULL,
  `permissions_json` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','scrypt:32768:8:1$RZ6AbvF6YbhDWsd3$0a3079671576fb55a5ff5592970a61bc3589d3aed1cd9b8554d1dc2edcc2fac14ca3faa16fce5e6fd9eedc6a01c9bdec74fe83d45f9c23cf75115aef7b57dadf','IT','admin','admin',NULL,'2026-01-22 07:24:36','2026-01-22 07:25:34'),(5,'Nanda_IT','scrypt:32768:8:1$l6aGSwU8vAajuW1Q$9905c55f7f9c106044032f5576fa7237b8eb39d7077e83a43dda9fd67b6a22bce6c00d2e594907a6081c961fbb794272cf932f6b8f5d453881b53105f85c85a8','Adi Dravidar Welfare','user','admin',NULL,'2026-01-22 09:42:38','2026-01-22 09:42:38'),(6,'approver_IT','scrypt:32768:8:1$V7N3R2EKcmDPCd4V$5a385a9fc756c555c3f35bf2c9651ce15700d180669a35882414324010591675b01183f961d6450b7cf0ed3ff8bad6cb1cff90d121f3016099650c4302cbf078','Animal Husbandry and Animal Welfare','approver','admin',NULL,'2026-01-22 09:49:50','2026-01-22 09:49:50'),(7,'Nanda_DT','scrypt:32768:8:1$oSOXJHS4bkPnyoX8$bc1f51d21b5b9ff0e577cfdc465c30d583934f9e4a8c08e9b343e9469c5a77d7b95acc516f48727d3829c6ec9938371e200bcb5e36c2fe9f14cbab484ad03b6a','Animal Husbandry and Animal Welfare','user','admin',NULL,'2026-01-22 10:52:17','2026-01-22 10:52:17'),(8,'Nanda_AH','scrypt:32768:8:1$79DJ59dcyoshP0iH$4890576fc2a915bfe2559102f07248f33670f246721db2764f5e4bb7928e70205e67380cf234a73cd502c30cb46987eb0e583180bb20084484602e6faf039c84','Animal Husbandry and Animal Welfare','user','admin','{\"GLOBAL\": {\"view\": true, \"edit\": false, \"download\": false}}','2026-01-24 06:43:28','2026-01-29 10:07:08');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-02-02 12:59:25
