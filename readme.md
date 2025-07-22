# 📱📺 Painel Eletrônico de Votação - SAPL App

Aplicativo Ionic Vue + Capacitor com suporte para múltiplas plataformas (Mobile e Android TV).

## ✨ Características do Projeto

- **Framework**: Ionic Vue 8.5.7 + Capacitor 6.2.1
- **Multi-platform**: Android Mobile e Android TV
- **Security**: Vulnerabilidades corrigidas e dependências atualizadas
- **Build Tools**: Vite 6.3.5, TypeScript 5.8.3

## 🚀 Início Rápido

### Pré-requisitos
- Node.js 18+ 
- Android Studio
- JDK 17+

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
- **Target**: Android 10 (API 29)
- **Orientação**: Portrait
- **Package**: `generico.sapl.softagon.app.mobile`
- **Features**: Touchscreen obrigatório

### 📺 TV APK  
- **Target**: Android TV 11 (API 30)
- **Orientação**: Landscape 
- **Package**: `generico.sapl.softagon.app.tv`
- **Features**: Leanback obrigatório

### Comandos de Build

```bash
# Script automatizado (recomendado)
npm run build:apks

# Builds individuais
npm run build:mobile    # Gera APK Mobile
npm run build:tv        # Gera APK TV
npm run build:both      # Gera ambos os APKs

# Gradle direto
cd android
./gradlew assembleMobileRelease assembleTvRelease
```

### Localização dos APKs
```
android/app/build/outputs/apk/
├── mobile/release/SAPL-mobile-release-v1.0-mobile.apk
└── tv/release/SAPL-tv-release-v1.0-tv.apk
```

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
│   │   ├── build.gradle         # Configuração flavors
│   │   └── src/
│   │       ├── main/            # Código compartilhado
│   │       ├── mobile/          # Específico mobile
│   │       └── tv/              # Específico TV
│   ├── variables.gradle         # Configurações SDK
│   └── capacitor.settings.gradle
├── public/                      # Assets públicos
├── assets/                      # Assets do projeto
├── build-apks.ps1              # Script PowerShell build
├── capacitor.config.json       # Configuração Capacitor
├── vite.config.ts             # Configuração Vite
└── package.json               # Dependências
```

## 🔧 Configuração Android

### Adicionando Capacitor Android
```bash
ionic capacitor add android
```

### Build e Deploy
```bash
# Build do projeto web
npm run build

# Sincronizar com Android
npx cap copy android

# Abrir no Android Studio
npx cap open android
```

### Instalação dos APKs
```bash
# Mobile
adb install android/app/build/outputs/apk/mobile/release/SAPL-mobile-release-v1.0-mobile.apk

# TV
adb install android/app/build/outputs/apk/tv/release/SAPL-tv-release-v1.0-tv.apk
```

## 📋 Compatibilidade

| Plataforma | Versão Mínima | Status |
|------------|---------------|--------|
| Android Mobile | 10 (API 29) | ✅ Suportado |
| Android TV | 11 (API 30) | ✅ Suportado |
| Tablets Android | 10 (API 29) | ✅ Suportado |
| Set-top boxes | Android TV 11+ | ✅ Suportado |

## 🤝 Contribuição

1. Fork o projeto
2. Crie uma branch para sua feature (`git checkout -b feature/AmazingFeature`)
3. Commit suas mudanças (`git commit -m 'Add some AmazingFeature'`)
4. Push para a branch (`git push origin feature/AmazingFeature`)
5. Abra um Pull Request

## 📄 Licença

Este projeto está sob a licença [MIT](LICENSE).

## 📞 Suporte

Para mais informações, consulte:
- [Documentação Multi-APK](MULTI-APK-CONFIG.md)
- [Capacitor Docs](https://capacitorjs.com)
- [Ionic Vue Docs](https://ionicframework.com/docs/vue/overview)

---

*Desenvolvido pela Softagon Sistemas* 🚀
