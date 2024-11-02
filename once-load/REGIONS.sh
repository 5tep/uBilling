# Получение текущей даты
current_date=$(date +%Y%m%d_%H%M)

# Формирование пустые данные в файл
echo "ID;BEGIN_TIME;END_TIME;DESCRIPTION;MCC;MNC" > /home/boss/COPM/files/REGIONS_$current_date.txt


#
#
#   В таблицах данных нет, можно заполнить вручную по примеру ниже:
#       
   echo "99;2022-02-02 00:00:00;2049-12-12 23:59:00;ИП;;" >> /home/boss/COPM/files/REGIONS_$current_date.txt
#
