#!/bin/bash
# Pet project: Environment setup script
# Создаёт структуру приложения с правильными правами доступа

set -euo pipefail
# -e = выйти при ошибке любой команды
# -u = ошибка при использовании неопределённой переменной
# -o pipefail = код возврата pipeline = код последней упавшей команды

APP_DIR="${HOME}/myapp"

echo "=== Creating directory structure ==="
mkdir -p "${APP_DIR}"/bin
mkdir -p "${APP_DIR}"/etc
mkdir -p "${APP_DIR}"/var/log

echo "=== Creating config ==="
cat << 'INNER_EOF' > "${APP_DIR}/etc/config.ini"
[app]
env=production
INNER_EOF

echo "=== Creating log file ==="
touch "${APP_DIR}/var/log/app.log"

echo "=== Creating run script ==="
cat << 'INNER_EOF' > "${APP_DIR}/bin/run.sh"
#!/bin/bash
LOG_FILE="${HOME}/myapp/var/log/app.log"
echo "[$(date '+%Y-%m-%d %H:%M:%S')] Application started" >> "${LOG_FILE}"
echo "Log written to ${LOG_FILE}"
INNER_EOF

chmod +x "${APP_DIR}/bin/run.sh"

echo "=== Setting permissions ==="
chmod 750 "${APP_DIR}/bin"
chmod 750 "${APP_DIR}/bin/run.sh"
chmod 600 "${APP_DIR}/etc/config.ini"
chmod 755 "${APP_DIR}/var/log"
chmod 644 "${APP_DIR}/var/log/app.log"

echo "=== Result ==="
if command -v tree &> /dev/null; then
    tree "${APP_DIR}"
else
    find "${APP_DIR}" -exec ls -ld {} +
fi
