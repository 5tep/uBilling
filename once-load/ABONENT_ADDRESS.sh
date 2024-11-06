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
    u.login*1 AS ABONENT_ID,
    8 AS REGION_ID,
    0 AS ADDRESS_TYPE_ID,  -- Фиксированное значение
    0 AS ADDRESS_TYPE,     -- Фиксированное значение
    '' AS ZIP,             -- Пустое поле, значение не указано
    'Российская Федерация' AS COUNTRY,  -- Статическое значение для страны
    'Херсонская область' AS REGION,    -- Регион из таблицы улиц
    '' AS ZONE,            -- Пустое поле, значение не указано
    c.cityname AS CITY,  -- Статическое значение для города
    s.streetname AS STREET,  -- Название улицы
    b.buildnum AS BUILDING,  -- Номер здания 
    '' AS BUILD_SECT,  -- Секция здания
    ap.apt AS APARTMENT,  -- Номер квартиры
    '' AS UNSTRUCT_INFO,  -- Адрес как неструктурированное поле
    u.date AS BEGIN_TIME,  
    '2049-12-31 23:59:00' AS END_TIME,    -- Фиксированное значение
    u.login*1 AS INTERNAL_ID1,   -- Пустое поле
    u.login*1 AS INTERNAL_ID2    -- Пустое поле
INTO OUTFILE '/home/boss/COPM/files/ABONENT_ADDRESS_$current_date.txt'
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
" > /home/boss/COPM/query.sql

# Выполнение завроса в базе данных
mysql -u root -pghbdtn5235441 stg < /home/boss/COPM/query.sql

# подчищаем за собой
rm -f /home/boss/COPM/query.sql
