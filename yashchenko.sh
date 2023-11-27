#!/bin/bash
date +"%Y-%m-%d %H:%M:%S"
echo "текущий каталог: $(pwd)"
echo
while true;do
echo "имя файла: "
read filename
if [ ! -f "$filename" ];then
echo "ошибка: файл '$filename' не существует."
else
echo "успех: файл '$filename' найден в каталоге $(pwd)."
break;
fi
done

echo "введите дату (ГГГГ-ММ-ДД): "
read input_date
index_descriptor=$(stat -c %i "$filename")
modification_date=$(stat -c %y "$filename")

if find "$filename" -newermt "$input_date" 2>/dev/null;then
new_index=$(stat -c %i "$filename")
if [ "$index_descriptor" != "$new_index" ];then
echo "индексный дескриптор файла был изменен с указанной даты. Код 120."
else
echo "индексный дескриптор файла не был изменен с указанной даты."
fi
fi

#if [[ "$modification_date" > "$input_date" ]]; then 
#if [[ "$index_descriptor" != $(stat -c %i "$filename") ]];then
#echo "индексный дескриптор файла был изменен с указанной даты. Код 120."
#else
#echo "индексный дескриптор файла не был изменен с указанной даты."
#fi
#fi

