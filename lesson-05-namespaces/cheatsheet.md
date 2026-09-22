# Namespaces Cheatsheet

## Namespace management
| Команда | Что делает |
|---|---|
| ip netns add NAME | создать network namespace |
| ip netns exec NAME CMD | выполнить команду внутри |
| ip netns list | список namespace'ов |
| ip netns delete NAME | удалить |

## veth pair
| Команда | Что делает |
|---|---|
| ip link add A type veth peer name B | создать пару |
| ip link set A netns NAME | конец → в namespace |
| ip link set A up | поднять интерфейс |

## Bridge
| Команда | Что делает |
|---|---|
| ip link add br0 type bridge | создать свитч |
| ip link set IFACE master br0 | воткнуть порт |
| bridge fdb show br br0 | таблица MAC |
| tcpdump -i br0 -e | виден весь L2-трафик! |

## Routing & NAT
| Команда | Что делает |
|---|---|
| ip route add default via GW | default route |
| echo 1 > /proc/sys/net/ipv4/ip_forward | включить forwarding |
| iptables -t nat -A POSTROUTING -s NET -o IFACE -j MASQUERADE | NAT |
| iptables -t nat -L -n -v | проверить + счётчики |

## Диагностика (порядок = путь пакета)
1. ip neigh show — ARP ок?
2. ip route — маршрут есть?
3. cat /proc/sys/net/ipv4/ip_forward — forwarding?
4. iptables -L -v — счётчики растут?
