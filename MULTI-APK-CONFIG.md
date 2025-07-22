# 📱📺 Configuração Multi-APK - SAPL App

Este projeto está configurado para gerar **dois APKs distintos**:

## 🎯 Configurações dos APKs

### 📱 **Mobile APK** 
- **Target**: Android 10 (API 29)
- **Orientação**: Portrait
- **Nome**: `SAPL-mobile-release-v1.0-mobile.apk`
- **Package ID**: `generico.sapl.softagon.app.mobile`
- **Features**: Touchscreen obrigatório

### 📺 **TV APK**
- **Target**: Android TV 11 (API 30) 
- **Orientação**: Landscape
- **Nome**: `SAPL-tv-release-v1.0-tv.apk`
- **Package ID**: `generico.sapl.softagon.app.tv`
- **Features**: Leanback obrigatório, Touchscreen opcional

## 🚀 Como Gerar os APKs

### Opção 1: Script Automatizado (Recomendado)
```powershell
npm run build:apks
```

### Opção 2: Comandos Individuais
```bash
# APK Mobile
npm run build:mobile

# APK TV  
npm run build:tv

# Ambos
npm run build:both
```

### Opção 3: Gradle Direto
```bash
cd android

# Mobile
./gradlew assembleMobileRelease

# TV
./gradlew assembleTvRelease

# Ambos
./gradlew assembleMobileRelease assembleTvRelease
```

## 📂 Localização dos APKs

Após o build, os APKs estarão em:
```
android/app/build/outputs/apk/
├── mobile/release/SAPL-mobile-release-v1.0-mobile.apk
└── tv/release/SAPL-tv-release-v1.0-tv.apk
```

## ⚙️ Estrutura de Configuração

```
android/
├── variables.gradle          # Versões SDK para cada sabor
├── app/
│   ├── build.gradle         # Configuração dos product flavors
│   └── src/
│       ├── main/            # Código compartilhado
│       ├── mobile/          # Específico para mobile
│       │   ├── AndroidManifest.xml
│       │   └── res/values/strings.xml
│       └── tv/              # Específico para TV
│           ├── AndroidManifest.xml
│           └── res/values/strings.xml
```

## 🔧 Diferenças entre os APKs

| Característica | Mobile | TV |
|----------------|--------|-----|
| Min SDK | 29 (Android 10) | 30 (Android 11) |
| Orientação | Portrait | Landscape |
| Touchscreen | Obrigatório | Opcional |
| Leanback | Não | Obrigatório |
| Launcher | LAUNCHER | LAUNCHER + LEANBACK_LAUNCHER |

## 🛠️ Personalizações Adicionais

Para personalizar ainda mais os APKs:

1. **Ícones diferentes**: Adicione ícones em `src/mobile/res/` e `src/tv/res/`
2. **Recursos específicos**: Cores, strings, layouts específicos por sabor
3. **Código Java/Kotlin**: Classes específicas para cada plataforma

## 📦 Instalação

### Mobile APK
```bash
adb install SAPL-mobile-release-v1.0-mobile.apk
```

### TV APK  
```bash
adb install SAPL-tv-release-v1.0-tv.apk
```

## ✅ Compatibilidade

- ✅ Android Mobile 10+
- ✅ Android TV 11+  
- ✅ Tablets Android 10+
- ✅ Set-top boxes com Android TV 11+

---

*Configurado automaticamente pelo assistente de desenvolvimento* 🤖
