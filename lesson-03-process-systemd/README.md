# Урок 03 — Процессы и systemd

## 1. Что такое процесс

**Процесс** — это экземпляр запущенной программы. Каждый процесс имеет уникальный **PID** (Process ID).

### Ключевые понятия

| Термин | Что это |
|---|---|
| **PID** | Уникальный номер процесса |
| **PPID** | PID родительского процесса |
| **UID/GID** | Пользователь и группа, от чьего имени работает процесс |
| **TTY** | Терминал, к которому привязан процесс |
| **STAT** | Состояние процесса |

### Состояния процессов (STAT)

| Буква | Состояние | Что значит |
|---|---|---|
| `R` | Running | Выполняется прямо сейчас |
| `S` | Sleeping (interruptible) | Ждёт события |
| `D` | Sleeping (uninterruptible) | Ждёт диск/IO, нельзя убить |
| `Z` | Zombie | Завершился, но родитель не забрал статус |
| `T` | Stopped | Остановлен сигналом |

## 2. Мониторинг процессов

| Команда | Описание |
|---|---|
| `ps aux` | Все процессы всех пользователей |
| `ps -ef` | Альтернативный формат (стандарт Unix) |
| `ps -o pid,ppid,cmd -p 1` | Информация о конкретном PID |
| `top` | Интерактивный мониторинг (q — выход) |
| `htop` | Улучшенный top (цветной, с мышью) |
| `pgrep nginx` | Найти PID по имени |
| `pkill nginx` | Убить процессы по имени |
| `pstree -p 1` | Дерево процессов от systemd |

## 3. Сигналы процессов

| Сигнал | Номер | Что делает |
|---|---|---|
| **SIGTERM** | 15 | "Прошу завершиться" (graceful) |
| **SIGKILL** | 9 | "Убиваю немедленно" (нельзя игнорировать) |
| **SIGHUP** | 1 | Перечитать конфиг |
| **SIGINT** | 2 | Прерывание с клавиатуры (Ctrl+C) |
| **SIGSTOP** | 19 | Остановить процесс (Ctrl+Z) |

**Правило:** сначала `kill -15`, подождать, потом `kill -9` только если не помогло.

## 4. systemd — система инициализации

systemd запускает сервисы при загрузке, следит за ними и ведёт логи.

### systemctl

| Команда | Действие |
|---|---|
| `systemctl status nginx` | Статус сервиса |
| `systemctl start nginx` | Запустить |
| `systemctl stop nginx` | Остановить |
| `systemctl restart nginx` | Перезапустить |
| `systemctl reload nginx` | Перечитать конфиг (SIGHUP) |
| `systemctl enable nginx` | Включить автозапуск |
| `systemctl disable nginx` | Отключить автозапуск |
| `systemctl is-active nginx` | Запущен ли? |
| `systemctl is-enabled nginx` | Включен ли автозапуск? |
| `systemctl daemon-reload` | Перечитать service-файлы |

### journalctl

| Команда | Действие |
|---|---|
| `journalctl -u nginx` | Логи сервиса |
| `journalctl -u nginx -f` | Следить в реальном времени |
| `journalctl -u nginx -n 50` | Последние 50 строк |
| `journalctl --disk-usage` | Сколько места занимают логи |

## 5. Создание systemd-сервиса

Файл `/etc/systemd/system/myapp.service`:

```ini
[Unit]
Description=MyApp Demo Service
After=network.target

[Service]
Type=simple
ExecStart=/home/devops/myapp/bin/run.sh
Restart=on-failure
RestartSec=5
User=devops
Group=devops

[Install]
WantedBy=multi-user.target
```

**После изменения файла обязательно:**
```bash
sudo systemctl daemon-reload
sudo systemctl start myapp
sudo systemctl status myapp
```

## 6. Чек-лист

- [ ] Понимаю разницу между PID и PPID
- [ ] Знаю состояния R, S, D, Z, T
- [ ] Умею использовать `ps aux`, `top`, `pgrep`, `pstree`
- [ ] Знаю разницу между SIGTERM (15) и SIGKILL (9)
- [ ] Умею управлять сервисами через `systemctl`
- [ ] Умею читать логи через `journalctl`
- [ ] Могу создать простой systemd-сервис
