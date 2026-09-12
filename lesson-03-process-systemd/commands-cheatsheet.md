# Шпаргалка: процессы и systemd

## ps — снимок процессов
```bash
ps aux                          # все процессы всех пользователей
ps -ef                          # стандартный Unix-формат
ps aux | grep nginx             # найти процессы nginx
ps -o pid,ppid,cmd,stat -p 1    # информация о конкретном PID
```

## top / htop — интерактивный мониторинг
```bash
top                             # запустить мониторинг
# q = выйти
# k = убить процесс
# M = сортировать по памяти
# P = сортировать по CPU
# 1 = показать ядра отдельно

htop                            # улучшенная версия (если установлена)
```

## pgrep / pkill — поиск и убийство по имени
```bash
pgrep nginx                     # найти PID процессов nginx
pgrep -a nginx                  # PID + командная строка
pkill nginx                     # отправить SIGTERM всем nginx
```

## kill — сигналы процессам
```bash
kill 1234                       # SIGTERM (15) — graceful shutdown
kill -15 1234                   # явно SIGTERM
kill -9 1234                    # SIGKILL — немедленно, без cleanup
kill -1 1234                    # SIGHUP — перечитать конфиг
killall nginx                   # убить все процессы с именем nginx
```

## Фоновые процессы
```bash
sleep 300 &                     # запустить в фоне
jobs                            # список фоновых задач
fg %1                           # вернуть на передний план
bg %1                           # продолжить в фоне
kill %1                         # убить по номеру job
```

## systemctl — управление сервисами
```bash
systemctl status nginx          # статус
systemctl start nginx           # запустить
systemctl stop nginx            # остановить
systemctl restart nginx         # перезапустить
systemctl reload nginx          # перечитать конфиг
systemctl enable nginx          # включить автозапуск
systemctl disable nginx         # отключить автозапуск
systemctl is-active nginx       # запущен ли?
systemctl is-enabled nginx      # включен ли автозапуск?
systemctl daemon-reload         # перечитать service-файлы
```

## journalctl — логи systemd
```bash
journalctl -u nginx             # логи сервиса
journalctl -u nginx -f          # следить в реальном времени
journalctl -u nginx -n 50       # последние 50 строк
journalctl -u nginx --since "10 minutes ago"
journalctl --disk-usage         # размер логов
```

## Полезные комбинации
```bash
ps aux | grep "[n]ginx"         # grep без самого себя в выводе
sudo systemctl restart nginx && sudo systemctl status nginx
```
