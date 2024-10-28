# Получение текущей даты
current_date=$(date +%Y%m%d_%H%M)

# Формирование MySQL-запроса с выводом в файл
echo "
SELECT 
    s.id AS SWITCH_ID, 
    '2024-01-01 00:00:00' AS BEGIN_TIME,      -- Указанная дата начала
    '2099-12-31 23:59:59' AS END_TIME,        -- Указанная дата окончания
    s.desc AS DESCRIPTION,                    -- Используем поле name для описания
    '' AS NETWORK_TYPE,                      
    sm.modelname AS SWITCH_TYPE,                       
    '' AS ADDRESS_TYPE_ID,                   
    '' AS ADDRESS_TYPE,                      
    '' AS ZIP,                                -- Пустое значение для ZIP
    'Российская Федерация' AS COUNTRY,        -- Статическое значение для страны
    'Херсонсткая область' AS REGION,             -- Статическое значение для региона
    '' AS ZONE,              -- Статическое значение для зоны
    '' AS CITY,                   -- Статическое значение для города
    s.location AS STREET,                     -- Статическое значение для улицы
    '' AS BUILDING,                        -- Статическое значение для здания
    '' AS BUILD_SECT,                    -- Статическое значение для секции здания
    '' AS APARTMENT,                        -- Пустое значение для квартиры
    '' AS UNSTRUCT_INFO,                    -- Пустое значение для дополнительной информации
    '' AS SWITCH_SIGN,                       
    '' AS REGION_ID                        -- Статическое значение для региона

INTO OUTFILE '/var/lib/mysql-files/COMMUTATORS_$current_date.txt'
FIELDS TERMINATED BY ';' 
OPTIONALLY ENCLOSED BY ''
LINES TERMINATED BY '\n'
FROM 
    `switches` s, switchmodels sm
WHERE s.modelid = sm.id
;" > /var/lib/mysql-files/query.sql

# Выполнение завроса в базе данных
mysql -u user -ppassword database < /var/lib/mysql-files/query.sql

# Перенос файлов, подчищаем за собой
mv -f /var/lib/mysql-files/COMMUTATORS_* /home/COPM/files
rm -f /var/lib/mysql-files/query.sql
