#!/bin/bash

# Script para gerar APKs do SAPL para Mobile e TV
# Autor: Assistente de Desenvolvimento
# Data: $(date)

echo "🚀 Iniciando build dos APKs SAPL..."
echo "📱 Mobile (Android 10) + 📺 TV (Android 11)"
echo "================================================="

# Navegar para o diretório do projeto Android
cd android

# Limpar builds anteriores
echo "🧹 Limpando builds anteriores..."
./gradlew clean

# Build do APK Mobile (Release)
echo "📱 Gerando APK Mobile (Android 10)..."
./gradlew assembleMobileRelease

# Build do APK TV (Release)  
echo "📺 Gerando APK TV (Android 11)..."
./gradlew assembleTvRelease

# Verificar se os APKs foram gerados
echo "✅ Verificando APKs gerados..."

MOBILE_APK="app/build/outputs/apk/mobile/release/SAPL-mobile-release-v1.0-mobile.apk"
TV_APK="app/build/outputs/apk/tv/release/SAPL-tv-release-v1.0-tv.apk"

if [ -f "$MOBILE_APK" ]; then
    echo "✅ APK Mobile gerado: $MOBILE_APK"
    ls -lh "$MOBILE_APK"
else
    echo "❌ Erro: APK Mobile não foi gerado"
fi

if [ -f "$TV_APK" ]; then
    echo "✅ APK TV gerado: $TV_APK"
    ls -lh "$TV_APK"
else
    echo "❌ Erro: APK TV não foi gerado"
fi

echo "================================================="
echo "🎉 Build concluído!"
echo "📂 APKs disponíveis em: android/app/build/outputs/apk/"
