# Получение текущей даты
current_date=$(date +%Y%m%d_%H%M)

# Формирование MySQL-запроса с выводом в файл
echo "
SELECT DISTINCT
    u.login AS ID,
    '?' AS REGION_ID, -- Статическое значение региона
    DATE_FORMAT(cd.`date`, '%Y-%m-%d 00:00:00')  AS CONTRACT_DATE, -- Преобразование UNIX времени в читаемый формат
    c.contract AS CONTRACT,
    DATE_FORMAT(cd.`date`, '%Y-%m-%d 00:00:00') AS ACTUAL_FROM, -- Дата заключения контракта
    '2099-12-31 23:59:59' AS ACTUAL_TO, -- Статическая дата окончания
    '' AS ABONENT_TYPE, -- Статическое значение типа абонента
    '' AS NAME_INFO_TYPE, -- Поле пустое
    '' AS FAMILY_NAME, -- Поле пустое
    n.realname AS GIVEN_NAME, -- Можно предположить, что FIO содержит полное имя
    '' AS INITIAL_NAME, -- Поле пустое
    n.realname AS UNSTRUCT_NAME, -- Используем FIO как неструктурированное имя
    pd.birthdate AS BIRTH_DATE, -- Поле Дата рождения
    1 AS IDENT_CARD_TYPE_ID, -- Поле ИД типа документа
    1 AS IDENT_CARD_TYPE, -- Поле Тип документа
    pd.passportnum AS IDENT_CARD_SERIAL, -- Поле серия паспорта
    pd.passportnum AS IDENT_CARD_NUMBER, -- Поле номер паспорта
    pd.passportwho AS IDENT_CARD_DESCRIPTION, -- Поле Кем, когда выдан
    '' AS IDENT_CARD_UNSTRUCT, -- Поле пустое
    '' AS BANK, -- Статическое значение банка
    '' AS BANK_ACCOUNT, -- Статическое значение банковского счета
    n.realname AS FULL_NAME, -- Используем FIO как полное имя
    '' AS INN, -- Поле пустое
    p.mobile AS CONTACT, -- Поле пустое
    p.phone AS PHONE_FAX, -- Поле пустое
    0 AS STATUS, -- Статическое значение статуса
    DATE_FORMAT(cd.`date`, '%Y-%m-%d 00:00:00') AS ATTACH, -- Дата последнего изменения
    '2099-12-31 23:59:59' AS DETACH, -- Статическая дата отсоединения
    '' AS NETWORK_TYPE, -- Поле пустое
    '' AS INTERNAL_ID1, -- Поле пустое
    '' AS INTERNAL_ID2 -- Поле пустое
INTO OUTFILE '/var/lib/mysql-files/ABONENT_$current_date.txt'
FIELDS TERMINATED BY ';' 
OPTIONALLY ENCLOSED BY ''
LINES TERMINATED BY '\n'
FROM 
    users u
LEFT JOIN 
    contracts c ON c.login = u.login
LEFT JOIN 
    contractdates cd ON cd.contract = c.contract
LEFT JOIN 
    phones p ON p.login = u.login
LEFT JOIN 
    realname n ON n.login = u.login
LEFT JOIN 
    passportdata pd ON pd.login = u.login
WHERE n.realname != '';
" > /var/lib/mysql-files/query.sql

# Выполнение завроса в базе данных
mysql -uuser -ppassword stg < /var/lib/mysql-files/query.sql

# Перенос файлов, подчищаем за собой
mv -f /var/lib/mysql-files/ABONENT* /home/COPM/files
rm -f /var/lib/mysql-files/query.sql
