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
    u.login AS ABONENT_ID, 
    99 AS REGION_ID, 
    s.`desc` AS ID, 
    DATE_FORMAT(cd.`date`, '%Y-%m-%d 00:00:00') AS BEGIN_TIME, 
    '2099-12-31 23:59:59' AS END_TIME, 
    '' AS PARAMETER, 
    '' AS INTERNAL_ID1, 
    '' AS INTERNAL_ID2
INTO OUTFILE '/var/lib/mysql-files/ABONENT_SERVICE_$current_date.txt'
FIELDS TERMINATED BY ';' 
OPTIONALLY ENCLOSED BY '\"'
LINES TERMINATED BY '\n'
FROM 
    nethosts nh, services s, users u
LEFT JOIN 
    contracts cn ON cn.`login` = u.`login`
LEFT JOIN 
    contractdates cd ON cd.contract = cn.contract
WHERE u.ip = nh.ip AND s.netid = nh.netid;
" > /var/lib/mysql-files/query.sql

# Выполнение завроса в базе данных
mysql -u user -ppassword database < /var/lib/mysql-files/query.sql

# Перенос файлов, подчищаем за собой
mv -f /var/lib/mysql-files/ABONENT_SERVICE_* /home/COPM/files
rm -f /var/lib/mysql-files/query.sql
