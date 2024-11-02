# Получение текущей даты
current_date=$(date +%Y%m%d_%H%M)

# Формирование MySQL-запроса с выводом в файл
echo "
SELECT 
    'ID',
    'BEGIN_TIME',
    'END_TIME',
    'DESCRIPTION',
    'REGION_ID'
UNION ALL
SELECT 
    id AS ID, 
    '2022-12-31 23:59:00' AS BEGIN_TIME, 
    '2049-12-31 23:59:00' AS END_TIME,
    cashtype AS DESCRIPTION,
    99 AS REGION_ID    
INTO OUTFILE '/home/boss/COPM/files/PAY_TYPE_$current_date.txt'
FIELDS TERMINATED BY ';' 
OPTIONALLY ENCLOSED BY ''
LINES TERMINATED BY '\n'
FROM 
    cashtype;
" > /home/boss/COPM/query.sql

# Выполнение завроса в базе данных
mysql -u root -pghbdtn5235441 stg < /home/boss/COPM/query.sql

# Перенос файлов, подчищаем за собой
rm -f /home/boss/COPM/query.sql
