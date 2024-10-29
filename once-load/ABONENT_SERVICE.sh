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
    c.id AS REGION_ID, 
    u.Tariff AS ID, 
    DATE_FORMAT(cd.`date`, '%Y-%m-%d 00:00:00') AS BEGIN_TIME, 
    '2099-12-31 23:59:59' AS END_TIME, 
    '' AS PARAMETER, 
    u.login AS INTERNAL_ID1, 
    u.login AS INTERNAL_ID2
INTO OUTFILE '/var/lib/mysql-files/ABONENT_SERVICE_$current_date.txt'
FIELDS TERMINATED BY ';' 
OPTIONALLY ENCLOSED BY '\"'
LINES TERMINATED BY '\n'
FROM 
    address adr, apt ap, build b, street s, city c, users u
LEFT JOIN 
    phones p ON p.login = u.login
LEFT JOIN 
    pononu mac ON mac.login = u.login
LEFT JOIN
	nethosts net ON net.ip = u.ip
LEFT JOIN 
    contracts cn ON cn.login = u.login
LEFT JOIN 
    contractdates cd ON cd.contract = cn.contract
WHERE u.login = adr.login AND adr.aptid = ap.id AND b.id = ap.buildid AND s.id = b.streetid AND c.id = s.cityid;
" > /var/lib/mysql-files/query.sql

# Выполнение завроса в базе данных
mysql -u user -ppassword database < /var/lib/mysql-files/query.sql

# Перенос файлов, подчищаем за собой
mv -f /var/lib/mysql-files/ABONENT_SERVICE_* /home/COPM/files
rm -f /var/lib/mysql-files/query.sql
