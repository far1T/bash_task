#!/bin/bash
printf "Отчет о логе веб-сервера \n======================== \nОбщее количество запросов: " > "report.txt"
wc -l < access.log >> "report.txt"
awk '{ip[$1]++} END {print "Количество уникальных IP-адресов:", length(ip)}' access.log >> "report.txt"
awk 'BEGIN {print "Количество запросов по методам:"} {methods[substr($6, 2)]++} END {for (method in methods) print method, methods[method]}' access.log >> "report.txt"
awk '{url[$7]++} END {max=0; for (val in url) {if (url[val]>max) {pop_val=val; max=url[val]}}; print "Самый популярный URL:", max, pop_val}' access.log >> "report.txt"
