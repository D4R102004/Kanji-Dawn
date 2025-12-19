#!/usr/bin/env bash
set -e

echo "== 🌸 Kanji-Dawn – Commit Asistido =="

echo "Tipos disponibles:"
echo "  feat     - Nueva funcionalidad (ej: modelo de kanji)"
echo "  fix      - Corrección de errores"
echo "  docs     - Cambios en documentación"
echo "  style    - Formato, comas, puntos (sin cambio de lógica)"
echo "  refactor - Mejora de código que no añade nada nuevo"
echo "  chore    - Mantenimiento (configuraciones, carpetas, etc.)"

read -p "Tipo de commit: " type
read -p "Resumen breve (en minúsculas): " summary
read -p "Número de issue (ej: 1): " issue

# Limpieza de espacios
type=$(echo "$type" | xargs)
summary=$(echo "$summary" | xargs)
issue=$(echo "$issue" | xargs)

if [[ -z "$type" || -z "$summary" || -z "$issue" ]]; then
    echo "❌ Error: Todos los campos son obligatorios."
    exit 1
fi

message="$type: $summary (#$issue)"

echo -e "\nTu mensaje será: \033[1;32m$message\033[0m"
read -p "¿Confirmar commit? [s/N]: " confirm

if [[ "$confirm" == "s" || "$confirm" == "S" ]]; then
    git commit -m "$message"
    echo "✅ Commit realizado con éxito."
else
    echo "⚠️ Commit cancelado."
fi

