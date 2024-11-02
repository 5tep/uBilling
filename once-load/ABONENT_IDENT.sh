# Получение текущей даты
current_date=$(date +%Y%m%d_%H%M)

# Формирование MySQL-запроса с выводом в файл
echo "SELECT 
    u.login AS ABONENT_ID, 
    99 AS REGION_ID, -- Статическое значение региона
    5 AS IDENT_TYPE, -- Статическое значение идентификационного типа
    '' AS PHONE, -- Поле пустое
    '' AS INTERNAL_NUMBER, -- Поле пустое
    '' AS IMSI, -- Поле пустое
    '' AS IMEI, -- Поле пустое
    '' AS ICC, -- Поле пустое
    '' AS MIN, -- Поле пустое
    '' AS ESN, -- Поле пустое
    0 AS EQUIPMENT_TYPE, -- Поле пустое
    net.mac AS MAC, -- MAC-адрес пользователя, если он есть
    '' AS VPI, -- Поле пустое
    '' AS VCI, -- Поле пустое
    u.login AS LOGIN, -- Логин пользователя
    '' AS E_MAIL, -- Поле пустое
    '' AS PIN, -- Поле пустое
    '' AS USER_DOMAIN, -- Поле пустое
    '' AS RESERVED, -- Поле пустое
    '' AS ORIGINATOR_NAME, -- Поле пустое
    0 AS IP_TYPE, -- Поле пустое
    u.ip AS IPV4, -- Преобразование IP-адреса из формата INT в строку
    '' AS IPV6, -- Поле пустое
    '' AS IP_MASK_TYPE, -- Поле пустое
    '255.255.0.0' AS IPV4_MASK, -- Поле пустое
    '' AS IPV6_MASK, -- Поле пустое
    nw.startip AS IP_RANGE_START, -- Поле пустое
    nw.endip AS IP_RANGE_END, -- Поле пустое
    u.login AS INTERNAL_ID1, -- Используем ID пользователя как INTERNAL_ID1
    u.login AS INTERNAL_ID2, -- Используем ID пользователя как INTERNAL_ID2
    DATE_FORMAT(cd.date, '%Y-%m-%d 00:00:00') AS BEGIN_TIME, -- Дата начала контракта
    '2049-12-12 23:59:00' AS END_TIME, -- Статическая дата окончания
    '' AS LINE_OBJECT, -- Поле пустое
    '' AS LINE_CROSS, -- Поле пустое
    '' AS LINE_BLOCK, -- Поле пустое
    '' AS LINE_PAIR, -- Поле пустое
    '' AS LINE_RESERVED, -- Поле пустое
    '' AS LOC_TYPE, -- Поле пустое
    '' AS LOC_LAC, -- Поле пустое
    '' AS LOC_CELL, -- Поле пустое
    '' AS LOC_TA, -- Поле пустое
    '' AS LOC_CELL_WIRELESS, -- Поле пустое
    '' AS LOC_MAC, -- Поле пустое
    '' AS LOC_LATITUDE, -- Поле пустое
    '' AS LOC_LONGITUDE, -- Поле пустое
    '' AS LOC_PROJECTION_TYPE, -- Поле пустое
    '' AS LOC_IP_TYPE, -- Поле пустое
    u.ip AS LOC_IPV4, -- Используем IP пользователя для LOC_IPV4
    '' AS LOC_IPV6, -- Поле пустое
    '' AS LOC_IP_PORT -- Поле пустое
INTO OUTFILE '/home/boss/COPM/files/ABONENT_IDENT_$current_date.txt'
FIELDS TERMINATED BY ';' 
OPTIONALLY ENCLOSED BY ''
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
	networks nw ON net.netid = nw.id
LEFT JOIN 
    contracts cn ON cn.login = u.login
LEFT JOIN 
    contractdates cd ON cd.contract = cn.contract
WHERE u.login = adr.login AND adr.aptid = ap.id AND b.id = ap.buildid AND s.id = b.streetid AND c.id = s.cityid;
" > /home/boss/COPM/query.sql

# Выполнение завроса в базе данных
mysql -u root -pghbdtn5235441 stg < /home/boss/COPM/query.sql

# Перенос файлов, подчищаем за собой
rm -f /home/boss/COPM/query.sql
