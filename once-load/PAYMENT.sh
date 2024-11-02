# Получение текущей даты
current_date=$(date +%Y%m%d_%H%M)

# Формирование MySQL-запроса с выводом в файл
echo "
SELECT 
    'PAYMENT_TYPE',
    'PAY_TYPE_ID',
    'PAYMENT_DATE',
    'AMOUNT',
    'AMOUNT_CURRENCY',
    'PHONE_NUMBER',
    'ACCOUNT',
    'INTERNAL_ID1',
    'INTERNAL_ID2',
    'BANK_ACCOUNT',
    'BANK_NAME',
    'EXPRESS_CARD_NUMBER',
    'TERMINAL_ID',
    'TERMINAL_NUMBER',
    'LATITUDE',
    'LONGITUDE',
    'PROJECTION_TYPE',
    'CENTER_ID',
    'DONATED_PHONE_NUMBER',
    'DONATED_ACCOUNT',
    'DONATED_INTERNAL_ID1',
    'DONATED_INTERNAL_ID2',
    'CARD_NUMBER',
    'PAY_PARAMS',
    'PERSON_RECEIVED',
    'BANK_DIVISION_NAME',
    'BANK_CARD_ID',
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
    'REGION_ID'
UNION ALL
SELECT 
    83 AS PAYMENT_TYPE,  -- Задано статически
    p.cashtypeid AS PAY_TYPE_ID,
    p.date AS PAYMENT_DATE,
    p.summ AS AMOUNT,
    '' AS AMOUNT_CURRENCY,  -- Пустое поле
    '' AS PHONE_NUMBER,  -- Информация о номере телефона отсутствует в этой таблице
    u.login AS ACCOUNT,  -- Пример форматирования номера счета
    '' AS INTERNAL_ID1,
    '' AS INTERNAL_ID2,
    '' AS BANK_ACCOUNT,  -- Пустое поле
    '' AS BANK_NAME,  -- Пустое поле
    '' AS EXPRESS_CARD_NUMBER,  -- Пустое поле
    '' AS TERMINAL_ID,  -- Пустое поле
    '' AS TERMINAL_NUMBER,  -- Пустое поле
    '' AS LATITUDE,  -- Пустое поле
    '' AS LONGITUDE,  -- Пустое поле
    '' AS PROJECTION_TYPE,  -- Пустое поле
    '' AS CENTER_ID,  -- Пустое поле
    '' AS DONATED_PHONE_NUMBER,  -- Пустое поле
    '' AS DONATED_ACCOUNT,  -- Пустое поле
    '' AS DONATED_INTERNAL_ID1,  -- Пустое поле
    '' AS DONATED_INTERNAL_ID2,  -- Пустое поле
    '' AS CARD_NUMBER,  -- Пустое поле
    '' AS PAY_PARAMS,  -- Пустое поле
    n.realname AS PERSON_RECIEVED,  -- Пустое поле
    '' AS BANK_DIVISION_NAME,  -- Пустое поле
    '' AS BANK_CARD_ID,  -- Пустое поле
    '' AS ADDRESS_TYPE_ID,  -- Пустое поле
    '' AS ADDRESS_TYPE,  -- Пустое поле
    '' AS ZIP,  -- Пустое поле
    'Российская Федерация' AS COUNTRY,  -- Пример статического значения
    '' AS REGION,  -- Пустое поле
    '' AS ZONE,  -- Пустое поле
    '' AS CITY,  -- Пустое поле
    '' AS STREET,  -- Пустое поле
    '' AS BUILDING,  -- Пустое поле
    '' AS BUILD_SECT,  -- Пустое поле
    '' AS APARTMENT,  -- Пустое поле
    '' AS UNSTRUCT_INFO,  -- Пустое поле
    99 AS REGION_ID  -- Пример статического значения
INTO OUTFILE '/home/boss/COPM/files/PAYMENT_$current_date.txt'
FIELDS TERMINATED BY ';' 
OPTIONALLY ENCLOSED BY ''
LINES TERMINATED BY '\n'
FROM 
    payments p, users u
LEFT JOIN 
    realname n ON n.login = u.login
WHERE p.login = u.login AND p.cashtypeid in (3);
" > /home/boss/COPM/query.sql

# Выполнение завроса в базе данных
mysql -u asdf -ptD44vTG59d big_nodeny < /home/boss/COPM/query.sql

# Перенос файлов, подчищаем за собой
rm -f /home/boss/COPM/query.sql
