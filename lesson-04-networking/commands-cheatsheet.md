# Шпаргалка: сетевой стек Linux

## IP и маршрутизация
```bash
ip addr show                    # IP-адреса всех интерфейсов
ip addr show ens32              # Конкретный интерфейс
ip route show                   # Таблица маршрутизации
ip link show ens32              # Состояние интерфейса
```

## Сокеты и соединения
```bash
ss -tunap                       # Все TCP/UDP + процессы
ss -tlnp                        # Только listening порты
ss -tnp state established       # Только активные соединения
```

## Доступность и маршрут
```bash
ping 8.8.8.8                    # Проверка ICMP
ping -c 4 google.com            # 4 пакета и стоп
traceroute 8.8.8.8              # Маршрут до хоста
```

## HTTP и DNS
```bash
curl https://google.com         # GET-запрос
curl -I https://google.com      # Только заголовки
curl -v https://google.com      # Подробный вывод
dig google.com                  # A-запись
dig google.com AAAA             # IPv6
dig google.com MX               # Почтовые серверы
dig -x 8.8.8.8                  # Обратный DNS
nslookup google.com             # Простой DNS-запрос
```

## Захват трафика
```bash
sudo tcpdump -i ens32           # Весь трафик на интерфейсе
sudo tcpdump -i ens32 port 22   # Только порт 22
sudo tcpdump -i ens32 icmp      # Только ICMP
sudo tcpdump -i ens32 -w capture.pcap  # Сохранить в файл
tcpdump -r capture.pcap         # Прочитать файл
```

## Firewall
```bash
sudo iptables -L -v -n          # Показать правила
sudo iptables -t nat -L -v -n   # Таблица NAT
```

## Полезные комбинации
```bash
sudo ss -tlnp | grep :22        # Проверить, слушает ли SSH
curl -I https://google.com 2>/dev/null | head -n 1  # Только статус
```

## Файлы конфигурации
| Файл | Назначение |
|:---|:---|
| `/etc/hosts` | Локальные записи имя → IP |
| `/etc/resolv.conf` | DNS-серверы |
| `/etc/ssh/sshd_config` | Порт SSH |

