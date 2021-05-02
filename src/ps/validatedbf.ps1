$sqlQuery = @'
SET linesize 120 pagesize 4000 recsep off
 
COLUMN segment_name    format a16 heading "Segment|Name"
COLUMN tablespace_name format a16 heading "Tablespace|Name"
COLUMN partition_name  format a10 heading "Partition|Name"
COLUMN owner           format a14
COLUMN relative_fno    format 9999 heading "File|No"
COLUMN segment_type    format a10  heading "Segment|Type"
COLUMN file#           format 9999 heading "File|Id"
COLUMN defekt_range    format a18 heading "defect|range"
prompt CHECK OF the DATABASE has detected corrupt blocks

SELECT COUNT(*) FROM  v$database_block_corruption;
prompt ...
prompt CHECK which TABLES are affected
prompt
 
SELECT ext.owner
     , ext.segment_name
	  , ext.segment_type
	  , ext.relative_fno
	  , ext.partition_name
	  , ext.tablespace_name
	  , blc.file# 
	  , blc.block# ||' for '||blc.blocks AS defekt_range
 FROM dba_extents ext
   ,  v$database_block_corruption blc
WHERE ext.file_id = blc.file# 
  AND blc.block# BETWEEN ext.block_id AND ext.block_id + ext.blocks - 1
/
 
exit

'@

$sqlQuery | sqlplus sys/Admin1234@medistar as sysdba

pause