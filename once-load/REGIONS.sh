# Получение текущей даты
current_date=$(date +%Y%m%d_%H%M)

# Формирование MySQL-запроса с выводом в файл
echo "
SELECT 
    c.id AS ID,
    '2022-01-01 00:00:00' AS BEGIN_TIME,  --  дата начала
    '2099-12-31 23:59:59' AS END_TIME,    --  дата окончания
    c.cityname AS DESCRIPTION,        -- Описание
    '' AS MCC,                         -- Значение MCC
    '' AS MNC                           -- MNC не указан
INTO OUTFILE '/var/lib/mysql-files/REGIONS_$current_date.txt'
FIELDS TERMINATED BY ';' 
OPTIONALLY ENCLOSED BY ''
LINES TERMINATED BY '\n'
FROM 
    city c
;
" > /var/lib/mysql-files/query.sql

# Выполнение завроса в базе данных
mysql -u user -ppassword bdname < /var/lib/mysql-files/query.sql

# Перенос файлов, подчищаем за собой
mv -f /var/lib/mysql-files/REGIONS* /home/user/COPM/files
rm -f /var/lib/mysql-files/query.sql
