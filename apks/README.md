# 📱📺 APKs Compilados - SAPL App

Esta pasta contém os APKs compilados do aplicativo SAPL, organizados por data de build.

## 📥 Downloads Disponíveis

### 📱 **Mobile APKs**
- Android 10+ (API 29)
- Package: `generico.sapl.softagon.app.mobile`
- Orientação: Portrait/Landscape

### 📺 **TV APKs**  
- Android TV 11+ (API 30)
- Package: `generico.sapl.softagon.app.tv`
- Orientação: Landscape (obrigatório)

## 🗓️ **Nomenclatura**
```
SAPL-{tipo}-v{versão}-{data}.apk

Exemplos:
- SAPL-mobile-v1.0-2025-07-22.apk
- SAPL-tv-v1.0-2025-07-22.apk
```

## 🚀 **Instalação**
```bash
# Baixe o APK desejado e instale via ADB
adb install SAPL-mobile-v1.0-YYYY-MM-DD.apk
adb install SAPL-tv-v1.0-YYYY-MM-DD.apk
```

## ⚡ **Build Automático**
Os APKs são gerados automaticamente quando você executa:
```bash
# Windows
.\build-apks.ps1

# Linux/macOS  
./build-apks.sh
```

---
*APKs atualizados automaticamente pelo sistema de build* 🤖
