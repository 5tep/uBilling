# Получение текущей даты
current_date=$(date +%Y%m%d_%H%M)

# Формирование MySQL-запроса с выводом в файл
echo "
SELECT 
    'SWITCH_ID', 
    'BEGIN_TIME',      
    'END_TIME',        
    'DESCRIPTION',                    
    'NETWORK_TYPE',                      
    'SWITCH_TYPE',                       
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
    'UNSTRUCT_INFO',                    
    'SWITCH_SIGN',                       
    'REGION_ID'                        
UNION ALL
SELECT 
    s.id AS SWITCH_ID, 
    '2024-01-01 00:00:00' AS BEGIN_TIME,      -- Указанная дата начала
    '2049-12-31 23:59:00' AS END_TIME,        -- Указанная дата окончания
    s.desc AS DESCRIPTION,                    -- Используем поле name для описания
    4 AS NETWORK_TYPE,                      
    sm.modelname AS SWITCH_TYPE,                       
    0 AS ADDRESS_TYPE_ID,                   
    1 AS ADDRESS_TYPE,                      
    '' AS ZIP,                                -- Пустое значение для ZIP
    'Российская Федерация' AS COUNTRY,        -- Статическое значение для страны
    'Херсонсткая область' AS REGION,             -- Статическое значение для региона
    '' AS ZONE,              -- Статическое значение для зоны
    '' AS CITY,                   -- Статическое значение для города
    '' AS STREET,                     -- Статическое значение для улицы
    '' AS BUILDING,                        -- Статическое значение для здания
    '' AS BUILD_SECT,                    -- Статическое значение для секции здания
    '' AS APARTMENT,                        -- Пустое значение для квартиры
    s.location AS UNSTRUCT_INFO,                    -- Пустое значение для дополнительной информации
    '' AS SWITCH_SIGN,                       
    99 AS REGION_ID                        -- Статическое значение для региона
INTO OUTFILE '/home/boss/COPM/files/COMMUTATORS_$current_date.txt'
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
