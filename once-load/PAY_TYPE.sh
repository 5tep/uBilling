# Получение текущей даты
current_date=$(date +%Y%m%d_%H%M)

# Формирование пустые данные в файл
echo "ID;BEGIN_TIME;END_TIME;DESCRIPTION;REGION_ID" > /home/boss/COPM/files/PAY_TYPE_$current_date.txt
echo "1;2024-01-02 00:00:00;2049-12-31 23:59:00;Касса;99" >> /home/boss/COPM/files/PAY_TYPE_$current_date.txt
