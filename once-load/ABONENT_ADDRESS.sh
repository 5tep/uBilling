# Получение текущей даты
current_date=$(date +%Y%m%d_%H%M)

# Формирование MySQL-запроса с выводом в файл
echo "
SELECT 
    'ABONENT_ID',
    'REGION_ID',
    'ADDRESS_TYPE_ID',
    'ADDRESS_TYPE',
    'ZIP',
    'COUNTRY',
    'REGION',
    'ZONE',
    'CITY',
    'STREET',
    'BUILDING',
    'BUILD_SECT',
    'APARTMENT',
    'BEGIN_TIME',
    'END_TIME',
    'INTERNAL_ID1',
    'INTERNAL_ID2'
UNION ALL
SELECT DISTINCT 
    u.login AS ABONENT_ID,
    c.id AS REGION_ID,
    0 AS ADDRESS_TYPE_ID,  -- Фиксированное значение
    0 AS ADDRESS_TYPE,     -- Фиксированное значение
    '' AS ZIP,             -- Пустое поле, значение не указано
    'Российская Федерация' AS COUNTRY,  -- Статическое значение для страны
    'Херсонская область' AS REGION,    -- Регион из таблицы улиц
    c.cityalias AS ZONE,            -- Пустое поле, значение не указано
    c.cityname AS CITY,  -- Статическое значение для города
    s.streetname AS STREET,  -- Название улицы
    b.buildnum AS BUILDING,  -- Номер здания 
    '' AS BUILD_SECT,  -- Секция здания
    ap.`apt` AS APARTMENT,  -- Номер квартиры
    CONCAT('г. ', c.`cityname`, ' ул.', u.`address`) AS UNSTRUCT_INFO,  -- Адрес как неструктурированное поле
    u.`date` AS BEGIN_TIME,  
    '2099-12-31 23:59:59' AS END_TIME,    -- Фиксированное значение
    '' AS INTERNAL_ID1,   -- Пустое поле
    '' AS INTERNAL_ID2    -- Пустое поле
INTO OUTFILE '/var/lib/mysql-files/ABONENT_ADDRESS_$current_date.txt'
FIELDS TERMINATED BY ';' 
OPTIONALLY ENCLOSED BY ''
LINES TERMINATED BY '\n'
FROM userreg u, address adr, apt ap, build b, street s, city c
WHERE u.login = adr.login 
    AND adr.aptid = ap.id 
    AND b.id = ap.buildid 
    AND s.id = b.streetid 
    AND c.id = s.cityid
;
" > /var/lib/mysql-files/query.sql

# Выполнение завроса в базе данных
mysql -u user -ppassword database < /var/lib/mysql-files/query.sql

# Перенос файлов, подчищаем за собой
mv -f /var/lib/mysql-files/ABONENT_ADDRESS* /home/COPM/files
rm -f /var/lib/mysql-files/query.sql
