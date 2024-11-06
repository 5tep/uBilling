# Получение текущей даты
current_date=$(date +%Y%m%d_%H%M)

# Формирование пустые данные в файл
echo "DESCRIPTION;IP_TYPE;IPV4;IPV6;IP_MASK_TYPE;IPV4_MASK;IPV6_MASK;BEGIN_TIME;END_TIME;REGION_ID" > /home/boss/COPM/files/IP_PLAN_$current_date.txt

# Формирование MySQL-запроса с выводом в файл
echo "
SELECT 
    'DESCRIPTION',
    'IP_TYPE',
    'IPV4',
    'IPV6',
    'IP_MASK_TYPE',
    'IPV4_MASK',
    'IPV6_MASK',
    'BEGIN_TIME',
    'END_TIME',
    'REGION_ID'                        
UNION ALL
SELECT 
    n.desc AS DESCRIPTION, 
    0 AS IP_TYPE,
    n.desc AS IPV4,
    '' AS IPV6,
    0 AS IP_MASK_TYPE,                      
    'FFFFFF00' AS IPV4_MASK,                       
    '' AS IPV6_MASK,                   
    '2022-01-01 00:00:00' AS BEGIN_TIME,
    '2049-12-31 23:59:59' AS END_TIME,        
    8 AS REGION_ID
INTO OUTFILE '/home/boss/COPM/files/IP_PLAN_$current_date.txt'
FIELDS TERMINATED BY ';' 
OPTIONALLY ENCLOSED BY ''
LINES TERMINATED BY '\n'
FROM 
    switches s, switchmodels sm
WHERE s.modelid = sm.id
;" > /home/boss/COPM/query.sql

# Выполнение завроса в базе данных
mysql -u root -pghbdtn5235441 stg < /home/boss/COPM/query.sql

# Перенос файлов, подчищаем за собой
rm -f /home/boss/COPM/query.sql
