# 📱📺 Painel Eletrônico de Votação - SAPL App

Aplicativo Ionic Vue + Capacitor com suporte para múltiplas plataformas (Mobile e Android TV).

## ✨ Características do Projeto

- **Framework**: Ionic Vue 8.5.7 + Capacitor 6.2.1
- **Multi-platform**: Android Mobile e Android TV
- **Security**: Vulnerabilidades corrigidas e dependências atualizadas
- **Build Tools**: Vite 6.3.5, TypeScript 5.8.3
- **Android Studio**: Configuração otimizada com resolução de ambiguidade de tarefas
- **Java**: Compatibilidade com JDK 21 (OpenJDK Temurin)

## 🚀 Início Rápido

### Pré-requisitos
- Node.js 18+ 
- Android Studio (configurado com resolução de ambiguidade)
- JDK 21 (OpenJDK Temurin recomendado)
- Android SDK API 29+ (Mobile) e API 30+ (TV)

### Instalação
```bash
# Clone o repositório
git clone <repository-url>
cd App-SAPL

# Instale as dependências
npm install

# Execute em desenvolvimento
npm run dev

# Build para produção
npm run build
```

## 📱📺 Configuração Multi-APK

Este projeto gera **dois APKs distintos**:

### 📱 Mobile APK
- **Target**: Android 10+ (API 29)
- **Orientação**: Portrait/Landscape adaptável
- **Package**: `generico.sapl.softagon.app.mobile`
- **Features**: Touchscreen obrigatório
- **Build Variant**: `mobileDebug` / `mobileRelease`

### 📺 TV APK  
- **Target**: Android TV 11+ (API 30)
- **Orientação**: Landscape obrigatório
- **Package**: `generico.sapl.softagon.app.tv`
- **Features**: Leanback obrigatório
- **Build Variant**: `tvDebug` / `tvRelease`

### Comandos de Build

```bash
# ✅ Script automatizado (recomendado)
npm run build:apks

# ✅ Builds individuais
npm run build:mobile    # Gera APK Mobile
npm run build:tv        # Gera APK TV
npm run build:both      # Gera ambos os APKs

# ✅ Gradle direto (agora sem ambiguidade)
cd android
.\gradlew clean                        # Limpar projeto
.\gradlew assembleMobileRelease        # APK Mobile produção
.\gradlew assembleTvRelease           # APK TV produção
.\gradlew assembleMobileDebug         # APK Mobile debug
.\gradlew assembleTvDebug             # APK TV debug

# ✅ Comandos que agora funcionam no Android Studio:
.\gradlew assembleDebugUnitTest       # Executa testes mobile
.\gradlew assembleDebugAndroidTest    # Executa testes instrumentados mobile
```

### 🤖 Build Automatizado
Após executar qualquer build, os APKs são **automaticamente copiados** para a pasta `apks/` com nomenclatura por data:

```powershell
# Windows PowerShell
.\build-apks.ps1

# Linux/macOS Bash  
./build-apks.sh
```

**Resultado**: Os APKs ficam disponíveis tanto localmente quanto no GitHub após commit! 🎉

### Localização dos APKs
```
android/app/build/outputs/apk/
├── mobile/release/SAPL-mobile-release-v1.0-mobile.apk
└── tv/release/SAPL-tv-release-v1.0-tv.apk
```

## 📥 Download dos APKs

### 🎯 APKs Prontos para Download
Os APKs compilados estão disponíveis na pasta `apks/` na raiz do repositório:

```
apks/
├── SAPL-mobile-v1.0-YYYY-MM-DD.apk    # 📱 Versão Mobile
└── SAPL-tv-v1.0-YYYY-MM-DD.apk        # 📺 Versão TV
```

### 🔗 Links Diretos (GitHub)
- **📱 Mobile APK**: [Download Latest Mobile](../../tree/main/apks) 
- **📺 TV APK**: [Download Latest TV](../../tree/main/apks)
- **📂 Pasta APKs**: [Ver todos os APKs disponíveis](../../tree/main/apks)

### ⚡ Instalação Rápida
```bash
# Download e instalação direta via ADB
# (substitua YYYY-MM-DD pela data do APK desejado)

# Mobile
adb install "apks/SAPL-mobile-v1.0-YYYY-MM-DD.apk"

# TV
adb install "apks/SAPL-tv-v1.0-YYYY-MM-DD.apk"
```

### 📋 Informações dos APKs
| Tipo | Package ID | Versão Mínima | Tamanho Aprox. |
|------|-----------|---------------|----------------|
| 📱 Mobile | `generico.sapl.softagon.app.mobile` | Android 10+ | ~15-25MB |
| 📺 TV | `generico.sapl.softagon.app.tv` | Android TV 11+ | ~15-25MB |

### 🏷️ Controle de Versões
- **Formato**: `SAPL-{tipo}-v{versão}-{data}.apk`
- **Exemplo**: `SAPL-mobile-v1.0-2025-07-22.apk`
- **Vantagens**: 
  - ✅ Identificação fácil da data de build
  - ✅ Histórico completo de versões no GitHub
  - ✅ Download direto sem necessidade de build local

## 🔧 Funcionalidades

### InAppBrowser (@capacitor/browser)
```typescript
import { Browser } from '@capacitor/browser'
import { App } from '@capacitor/app'

// Abre browser interno
await Browser.open({ url })

// Fecha app quando browser termina
Browser.addListener('browserFinished', () => {
  App.exitApp()
})
```

### Outros Plugins Capacitor
- **@capacitor/app**: Controle do aplicativo
- **@capacitor/haptics**: Feedback tátil
- **@capacitor/keyboard**: Controle do teclado
- **@capacitor/preferences**: Armazenamento local
- **@capacitor/status-bar**: Customização da status bar

## 🎨 Personalização de Ícones

1. Substitua a imagem em `assets/logo.png`
2. Execute o comando:

```bash
npx @capacitor/assets generate 
  --iconBackgroundColor '#00C8F0' 
  --iconBackgroundColorDark '#0084B4' 
  --splashBackgroundColor '#FECF27' 
  --splashBackgroundColorDark '#FF632F' 
  --android
```

## 🔒 Segurança

### Vulnerabilidades Corrigidas
- ✅ **cross-spawn**: RegExp DoS vulnerability
- ✅ **esbuild**: Development server vulnerability  
- ✅ **rollup**: DOM Clobbering/XSS
- ✅ **micromatch**: RegExp DoS
- ✅ **nanoid**: Predictable generation
- ✅ **@babel/helpers**: RegExp complexity
- ✅ **vue-template-compiler**: XSS vulnerability

### Manutenção de Segurança
```bash
# Verificar vulnerabilidades
npm audit

# Corrigir automaticamente
npm audit fix

# Forçar atualizações (breaking changes)
npm audit fix --force
```

## 🛠️ Scripts Disponíveis

```bash
npm run dev              # Desenvolvimento
npm run build            # Build produção
npm run preview          # Preview do build
npm run lint             # Linting
npm run test:unit        # Testes unitários
npm run test:e2e         # Testes E2E (Cypress)
npm run build:mobile     # Build APK Mobile
npm run build:tv         # Build APK TV
npm run build:both       # Build ambos APKs
npm run build:apks       # Script PowerShell completo
```

## 📁 Estrutura do Projeto

```
App-SAPL/
├── src/                          # Código fonte Vue
│   ├── App.vue
│   ├── main.ts
│   ├── router/
│   └── theme/
├── android/                      # Projeto Android nativo
│   ├── app/
│   │   ├── build.gradle         # ✅ Configuração flavors + resolução ambiguidade
│   │   └── src/
│   │       ├── main/            # Código compartilhado
│   │       ├── mobile/          # Específico mobile
│   │       └── tv/              # Específico TV
│   ├── .idea/                   # ✅ Configurações Android Studio otimizadas
│   │   ├── gradle.xml
│   │   └── runConfigurations/
│   ├── local.properties         # ✅ Build variant padrão configurado
│   ├── variables.gradle         # Configurações SDK
│   ├── ANDROID_STUDIO_GUIDE.md  # ✅ Guia de uso do Android Studio
│   └── capacitor.settings.gradle
├── public/                      # Assets públicos
├── assets/                      # Assets do projeto
├── build-apks.ps1              # Script PowerShell build
├── capacitor.config.json       # Configuração Capacitor
├── vite.config.ts             # Configuração Vite
└── package.json               # Dependências
```

## 🔧 Configuração Android Studio

### ⚠️ Problema Resolvido: Ambiguidade de Tarefas
Este projeto tinha um problema onde o Android Studio não conseguia executar tarefas como `assembleDebugUnitTest` devido aos múltiplos product flavors (mobile/tv). **Problema já corrigido!**

### Configurações Aplicadas:
- ✅ Build variant padrão definido como `mobileDebug`
- ✅ Tarefas de resolução de ambiguidade criadas
- ✅ Configuração do Android Studio otimizada
- ✅ Java 21 configurado corretamente

### Como Abrir no Android Studio:
```bash
# Sincronizar projeto
npx cap sync android

# Abrir no Android Studio (recomendado)
npx cap open android

# Ou abra manualmente a pasta android/
```

### Build Variants Disponíveis:
- **mobileDebug** (padrão) - Para desenvolvimento mobile
- **mobileRelease** - Para produção mobile
- **tvDebug** - Para desenvolvimento TV
- **tvRelease** - Para produção TV

### Comandos Gradle Corrigidos:
```bash
cd android

# Tarefas que agora funcionam corretamente:
.\gradlew assembleDebugUnitTest        # ✅ Aponta para mobile
.\gradlew assembleDebugAndroidTest     # ✅ Aponta para mobile

# Tarefas específicas (sempre funcionaram):
.\gradlew assembleMobileDebug          # Mobile debug
.\gradlew assembleMobileRelease        # Mobile release
.\gradlew assembleTvDebug              # TV debug
.\gradlew assembleTvRelease            # TV release
```

## 🛠️ Troubleshooting

### ❌ Problema: Android Studio não consegue executar tarefas
**Status**: ✅ **RESOLVIDO**

Se você encontrar erros como:
```
Cannot locate tasks that match ':app:assembleDebugUnitTest' as task 'assembleDebugUnitTest' is ambiguous
```

**Solução aplicada**:
1. ✅ Tarefas de resolução criadas no `build.gradle`
2. ✅ Build variant padrão configurado
3. ✅ Configurações do Android Studio otimizadas

### 🔧 Se ainda houver problemas:
```bash
# Limpar completamente o projeto
cd android
.\gradlew clean

# Sincronizar Capacitor
cd ..
npx cap sync android

# Reabrir no Android Studio
npx cap open android
```

### 📋 Verificação do Ambiente:
```bash
# Verificar Capacitor
npx cap doctor

# Verificar Java (deve ser 21)
java -version

# Verificar Gradle
cd android && .\gradlew --version
```

## 📋 Compatibilidade

| Plataforma | Versão Mínima | Build Variant | Status |
|------------|---------------|---------------|--------|
| Android Mobile | 10+ (API 29) | mobileDebug/Release | ✅ Totalmente suportado |
| Android TV | 11+ (API 30) | tvDebug/Release | ✅ Totalmente suportado |
| Tablets Android | 10+ (API 29) | mobileDebug/Release | ✅ Totalmente suportado |
| Set-top boxes | Android TV 11+ | tvDebug/Release | ✅ Totalmente suportado |

### 💻 Ambiente de Desenvolvimento
| Ferramenta | Versão | Status |
|------------|--------|--------|
| Node.js | 18+ | ✅ Suportado |
| JDK | 21 (Temurin) | ✅ Configurado |
| Android Studio | Última | ✅ Otimizado |
| Gradle | 8.10+ | ✅ Atualizado |

## 🚀 Instalação dos APKs

### 📥 Download Direto (GitHub)
**Recomendado**: Baixe os APKs mais recentes diretamente do GitHub:
- [📂 **Pasta APKs** - Todos os builds disponíveis](../../tree/main/apks)

### 🗓️ Versionamento por Data
Os APKs são nomeados com a data de build para fácil identificação:
- `SAPL-mobile-v1.0-2025-07-22.apk` ← Build do dia 22/07/2025
- `SAPL-tv-v1.0-2025-07-22.apk` ← Build do dia 22/07/2025

### Via ADB:
```bash
# Baixe os APKs do GitHub e instale localmente

# Mobile (substitua pela data do APK desejado)
adb install "apks/SAPL-mobile-v1.0-2025-07-22.apk"

# TV (substitua pela data do APK desejado)  
adb install "apks/SAPL-tv-v1.0-2025-07-22.apk"

# Ou use os caminhos originais do build
adb install android/app/build/outputs/apk/mobile/release/SAPL-mobile-release-v1.0-mobile.apk
adb install android/app/build/outputs/apk/tv/release/SAPL-tv-release-v1.0-tv.apk
```

### Via Android Studio:
1. Abra o projeto: `npx cap open android`
2. Selecione o Build Variant desejado
3. Clique em "Run" ou "Debug"

## 🤝 Contribuição

1. Fork o projeto
2. Crie uma branch para sua feature (`git checkout -b feature/AmazingFeature`)
3. Commit suas mudanças (`git commit -m 'Add some AmazingFeature'`)
4. Push para a branch (`git push origin feature/AmazingFeature`)
5. Abra um Pull Request

## 📄 Licença

Este projeto está sob a licença [MIT](LICENSE).

## 📞 Suporte

### 📚 Documentação:
- ✅ [Guia Android Studio](android/ANDROID_STUDIO_GUIDE.md) - **NOVO!**
- [Documentação Multi-APK](MULTI-APK-CONFIG.md)
- [Capacitor Docs](https://capacitorjs.com)
- [Ionic Vue Docs](https://ionicframework.com/docs/vue/overview)

### 🆘 Problemas Comuns:
1. **Erro de ambiguidade de tarefas** → ✅ Resolvido automaticamente
2. **Android Studio não abre** → Verificar JDK 21 instalado
3. **Build falha** → Executar `.\gradlew clean` primeiro
4. **APK não instala** → Verificar versões mínimas do Android

### 🔧 Comandos de Diagnóstico:
```bash
npx cap doctor          # Status do Capacitor
java -version           # Verificar JDK
adb devices             # Dispositivos conectados
```

---

*Desenvolvido pela Softagon Sistemas* 🚀
