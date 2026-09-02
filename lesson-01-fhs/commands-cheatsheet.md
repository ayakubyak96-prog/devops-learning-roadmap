## Навигация
```bash
pwd                           # показать текущий путь
cd /var/log                   # перейти в /var/log
cd ~                          # перейти в домашнюю директорию
cd -                          # вернуться в предыдущую директорию
cd ..                         # подняться на уровень вверх

## Просмотр файлов
```bash
ls -lah /var/log              # детальный список, human-readable, включая скрытые
cat /etc/passwd               # вывести содержимое
cat file1 file2               # склеить файлы
less /var/log/syslog          # постраничный просмотр (q — выход)

## Создание и удаление
```bash
touch app.log                 # создать пустой файл / обновить время
mkdir -p project/{bin,etc}    # создать структуру папок
rm file.txt                   # удалить файл
rm -i file.txt                # удалить с подтверждением
rm -r dir/                    # удалить директорию рекурсивно
rm -rf dir/                   # удалить без подтверждения (ОПАСНО!)
cp /etc/passwd ~/backup       # копировать файл
cp -r dir1/ dir2/             # копировать директорию
cp -p file backup             # копировать с сохранением прав
mv old.txt new.txt            # переименовать
mv file.txt dir/              # переместить

## Ссылки
```bash
ln file hardlink              # hard link
ln -s file symlink            # soft link (symlink)
ls -li file                   # посмотреть inode

## Полезные комбинации
```bash
cat /var/log/syslog | tail -n 20      # последние 20 строк лога
cat /proc/cpuinfo | grep "model name" # модель процессора
date >> app.log                       # дописать дату в лог
