# Шпаргалка: права доступа (chmod, chown, umask)

## chmod — числовая нотация
```bash
chmod 700 file                # только owner: rwx------
chmod 755 script.sh           # owner полный, остальные читают/исполняют: rwxr-xr-x
chmod 644 file.txt            # owner читает/пишет, остальные только читают: rw-r--r--
chmod 600 secret.key          # только owner: rw-------
chmod 750 /opt/myapp          # директория: rwxr-x---
```

## chmod — символьная нотация
```bash
chmod u+x file                # owner + execute
chmod g-w file                # group - write
chmod o=r file                # others = read only
chmod a+x file                # all + execute
chmod +x file                 # сокращение от a+x
```

## chown
```bash
chown user:group file         # сменить owner и группу
chown user file               # сменить только owner
chown :group file             # сменить только group
chown -R user:group dir/      # рекурсивно
sudo chown root:root /etc/shadow   # от root
```

## umask
```bash
umask                         # посмотреть текущее значение
umask 022                     # стандарт (файлы 644, директории 755)
umask 077                     # paranoid (файлы 600, директории 700)
```

## Проверка прав
```bash
ls -l file                    # права файла
ls -ld dir                    # права самой директории (не содержимого)
stat file                     # подробная информация о файле
```

## Полезные комбинации
```bash
chmod +x script.sh && ./script.sh   # дать права и сразу запустить
find /dir -type f -exec chmod 644 {} +   # всем файлам в директории — 644
find /dir -type d -exec chmod 755 {} +   # всем подпапкам — 755
```
