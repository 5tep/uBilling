# Получение текущей даты
current_date=$(date +%Y%m%d_%H%M)

# Формирование пустые данные в файл
echo "DESCRIPTION;IP_TYPE;IPV4;IPV6;IP_MASK_TYPE;IPV4_MASK;IPV6_MASK;BEGIN_TIME;END_TIME;REGION_ID" > /home/boss/COPM/files/IP_PLAN_$current_date.txt


#
#
#   В таблицах данных нет, можно заполнить вручную по примеру ниже:
#                                                  
   echo "Сеть для абонентов при отсутствии денег;0;AC100A01;;0;FFFFFF00;;2024-01-02 00:00:00;2049-12-31 23:59:00;4" >> /home/boss/COPM/files/IP_PLAN_$current_date.txt

#
