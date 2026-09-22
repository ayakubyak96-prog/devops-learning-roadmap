# Lesson 05 — Linux Namespaces

## Что построено
- network namespaces red/blue (`ip netns add/exec/delete`)
- veth pair — прямой кабель между namespace'ами
- bridge br0 = L2-свитч (`master br0`, FDB, tcpdump -e)
- Маршрутизация: br0 = 10.0.0.254 (шлюз), default route в ns
- NAT: ip_forward=1 + MASQUERADE → red выходит в интернет

## Ключевые выводы
- Namespace изолирует видимость, не безопасность (shared medium: tcpdump на br0 видит всё)
- veth pair соединяет ровно 2 точки; для сети нужен bridge
- Диагностика по цепочке: neigh → route → forward → NAT
- «Destination Host Unreachable» от себя = ARP к шлюзу FAILED

## История отладки
IP шлюза 10.0.0.254 не был назначен (команды в history не было) →
ARP FAILED → "unreachable". Лечение: ip addr add 10.0.0.254/24 dev br0.
Правило: «сделано» = есть вывод проверки, не предположение.

## Команды
(сюда завтра — netns-lab.sh и cleanup.sh)
