# Получение текущей даты
current_date=$(date +%Y%m%d_%H%M)

# Формирование MySQL-запроса с выводом в файл
echo "
SELECT 
    'ABONENT_ID', 
    'REGION_ID', 
    'ID', 
    'BEGIN_TIME', 
    'END_TIME', 
    'PARAMETER', 
    'INTERNAL_ID1', 
    'INTERNAL_ID2'
UNION ALL
SELECT 
    u.login*1 AS ABONENT_ID, 
    8 AS REGION_ID, 
    s.desc AS ID, 
    COALESCE(DATE_FORMAT(cd.date, '%Y-%m-%d 00:00:00'), '2022-01-01 00:00:00') AS BEGIN_TIME, 
    '2049-12-31 23:59:00' AS END_TIME,
    nh.option AS PARAMETER, 
    u.login*1 AS INTERNAL_ID1, 
    u.login*1 AS INTERNAL_ID2
INTO OUTFILE '/home/boss/COPM/files/ABONENT_SERVICE_$current_date.txt'
FIELDS TERMINATED BY ';' 
OPTIONALLY ENCLOSED BY ''
LINES TERMINATED BY '\n'
FROM 
    nethosts nh, services s, users u
LEFT JOIN 
    contracts cn ON cn.login = u.login
LEFT JOIN 
    contractdates cd ON cd.contract = cn.contract
WHERE u.ip = nh.ip AND s.netid = nh.netid AND LENGTH(u.login) < 8;
" > /home/boss/COPM/query.sql

# Выполнение завроса в базе данных
mysql -u root -pghbdtn5235441 stg < /home/boss/COPM/query.sql

# Перенос файлов, подчищаем за собой
rm -f /home/boss/COPM/query.sql
