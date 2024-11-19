# Получение текущей даты
current_date=$(date +%Y%m%d_%H%M)

# Формирование MySQL-запроса с выводом в файл
echo "
SELECT 
    'ID', 'REGION_ID', 'CONTRACT_DATE', 'CONTRACT', 'ACTUAL_FROM', 'ACTUAL_TO', 'ABONENT_TYPE', 
    'NAME_INFO_TYPE', 'FAMILY_NAME', 'GIVEN_NAME', 'INITIAL_NAME', 'UNSTRUCT_NAME', 'BIRTH_DATE', 
    'IDENT_CARD_TYPE_ID', 'IDENT_CARD_TYPE', 'IDENT_CARD_SERIAL', 'IDENT_CARD_NUMBER', 
    'IDENT_CARD_DESCRIPTION', 'IDENT_CARD_UNSTRUCT', 'BANK', 'BANK_ACCOUNT', 'FULL_NAME', 'INN', 
    'CONTACT', 'PHONE_FAX', 'STATUS', 'ATTACH', 'DETACH', 'NETWORK_TYPE', 'INTERNAL_ID1', 
    'INTERNAL_ID2'
UNION ALL
SELECT DISTINCT
    u.login*1 AS ID,
    8 AS REGION_ID, -- Статическое значение региона
    COALESCE(DATE_FORMAT(cd.date, '%Y-%m-%d 00:00:00'), '2000-01-01 00:00:00')  AS CONTRACT_DATE, -- Преобразование UNIX времени в читаемый формат
    cn.contract AS CONTRACT,
    COALESCE(DATE_FORMAT(cd.date, '%Y-%m-%d 00:00:00'), '2000-01-01 00:00:00') AS ACTUAL_FROM, -- Дата заключения контракта
    '2049-12-31 23:59:00' AS ACTUAL_TO, -- Статическая дата окончания
    42 AS ABONENT_TYPE, -- Статическое значение типа абонента физическое лицо (43 -юридическое)
    1 AS NAME_INFO_TYPE, -- Поле пустое
    '' AS FAMILY_NAME, -- Фамилия
    '' AS GIVEN_NAME, -- Имя
    '' AS INITIAL_NAME, -- Отчество
    n.realname AS UNSTRUCT_NAME, -- Используем FIO как неструктурированное имя
    COALESCE(pd.birthdate, '') AS BIRTH_DATE, -- Поле Дата рождения
    1 AS IDENT_CARD_TYPE_ID, -- Поле ИД типа документа
    0 AS IDENT_CARD_TYPE, -- Поле Тип документа
    COALESCE(SUBSTRING_INDEX(pd.passportnum, ' ', 1), '') AS IDENT_CARD_SERIAL, -- Поле серия паспорта
    COALESCE(SUBSTRING_INDEX(pd.passportnum, ' ', -1), '') AS IDENT_CARD_NUMBER, -- Поле номер паспорта
    COALESCE(pd.passportwho, '') AS IDENT_CARD_DESCRIPTION, -- Поле Кем, когда выдан
    '' AS IDENT_CARD_UNSTRUCT, -- Документ
    '' AS BANK, -- Статическое значение банка
    '' AS BANK_ACCOUNT, -- Статическое значение банковского счета
    '' AS FULL_NAME, -- Используем FIO как полное имя
    '' AS INN, -- Поле пустое
    '' AS CONTACT, -- Поле пустое
    '' AS PHONE_FAX, -- Поле пустое
    0 AS STATUS, -- Статус пользователя
    '' AS ATTACH, -- Дата последнего изменения
    '' AS DETACH, -- Статическая дата отсоединения
    4 AS NETWORK_TYPE, -- Тип сети
    u.login*1 AS INTERNAL_ID1, -- Поле пустое
    u.login*1 AS INTERNAL_ID2 -- Поле пустое
INTO OUTFILE '/home/boss/COPM/files/ABONENT_$current_date.txt'
FIELDS TERMINATED BY ';' 
OPTIONALLY ENCLOSED BY ''
LINES TERMINATED BY '\n'
FROM 
    address adr, apt ap, build b, street s, city c, users u
LEFT JOIN 
    contracts cn ON cn.login = u.login and cn.contract != ''
LEFT JOIN 
    contractdates cd ON cd.contract = cn.contract 
LEFT JOIN 
    phones p ON p.login = u.login
LEFT JOIN 
    realname n ON n.login = u.login
LEFT JOIN 
    passportdata pd ON pd.login = u.login
WHERE n.realname != ''
	AND u.login = adr.login AND adr.aptid = ap.id AND b.id = ap.buildid AND s.id = b.streetid AND c.id = s.cityid;
" > /home/boss/COPM/query.sql

# Выполнение завроса в базе данных
mysql -u root -pghbdtn5235441 stg < /home/boss/COPM/query.sql

# Перенос файлов, подчищаем за собой
rm -f /home/boss/COPM/query.sql
