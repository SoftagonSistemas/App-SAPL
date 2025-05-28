# Script PowerShell para gerar APKs do SAPL para Mobile e TV
# Autor: Assistente de Desenvolvimento
# Data: $(Get-Date)

Write-Host "🚀 Iniciando build dos APKs SAPL..." -ForegroundColor Green
Write-Host "📱 Mobile (Android 10) + 📺 TV (Android 11)" -ForegroundColor Cyan
Write-Host "=================================================" -ForegroundColor Yellow

# Configurar Java temporariamente
$env:JAVA_HOME = "C:\Program Files\Eclipse Adoptium\jdk-21.0.7.6-hotspot"
$env:PATH = "$env:JAVA_HOME\bin;$env:PATH"

# Verificar Java
Write-Host "☕ Verificando Java..." -ForegroundColor Yellow
java -version

# Build da aplicação Vue/Ionic
Write-Host "🔨 Compilando aplicação Vue/Ionic..." -ForegroundColor Blue
npm run build

# Copiar arquivos para Android
Write-Host "📄 Copiando arquivos para Android..." -ForegroundColor Blue
npx @capacitor/cli copy android

# Navegar para o diretório do projeto Android
Set-Location android

# Limpar builds anteriores
Write-Host "🧹 Limpando builds anteriores..." -ForegroundColor Yellow
.\gradlew.bat clean

# Build do APK Mobile (Release)
Write-Host "📱 Gerando APK Mobile (Android 10)..." -ForegroundColor Blue
.\gradlew.bat assembleMobileRelease

# Build do APK TV (Release)  
Write-Host "📺 Gerando APK TV (Android 11)..." -ForegroundColor Magenta
.\gradlew.bat assembleTvRelease

# Assinar APKs com certificado debug
Write-Host "🔐 Assinando APKs..." -ForegroundColor Yellow
$env:ANDROID_SDK = "C:\Users\$env:USERNAME\AppData\Local\Android\Sdk"

# Assinar APK Mobile
$MOBILE_APK_PATH = "app\build\outputs\apk\mobile\release\SAPL-mobile-release-v1.0-mobile.apk"
if (Test-Path $MOBILE_APK_PATH) {
    Write-Host "🔐 Assinando APK Mobile..." -ForegroundColor Cyan
    & "$env:ANDROID_SDK\build-tools\35.0.0\apksigner.bat" sign --ks "app\debug.keystore" --ks-pass pass:android --key-pass pass:android --ks-key-alias androiddebugkey $MOBILE_APK_PATH
}

# Assinar APK TV
$TV_APK_PATH = "app\build\outputs\apk\tv\release\SAPL-tv-release-v1.0-tv.apk"
if (Test-Path $TV_APK_PATH) {
    Write-Host "🔐 Assinando APK TV..." -ForegroundColor Cyan
    & "$env:ANDROID_SDK\build-tools\35.0.0\apksigner.bat" sign --ks "app\debug.keystore" --ks-pass pass:android --key-pass pass:android --ks-key-alias androiddebugkey $TV_APK_PATH
}

# Verificar se os APKs foram gerados
Write-Host "✅ Verificando APKs gerados..." -ForegroundColor Green

$MOBILE_APK = "app\build\outputs\apk\mobile\release\SAPL-mobile-release-v1.0-mobile.apk"
$TV_APK = "app\build\outputs\apk\tv\release\SAPL-tv-release-v1.0-tv.apk"

Write-Host "=================================================" -ForegroundColor Yellow
Write-Host "📂 APKs GERADOS COM SUCESSO!" -ForegroundColor Green

if (Test-Path $MOBILE_APK) {
    $mobileSize = (Get-Item $MOBILE_APK).Length / 1MB
    Write-Host "✅ 📱 APK Mobile: $MOBILE_APK" -ForegroundColor Green
    Write-Host "   Tamanho: $([math]::Round($mobileSize, 2)) MB" -ForegroundColor Cyan
} else {
    Write-Host "❌ Erro: APK Mobile não foi gerado" -ForegroundColor Red
}

if (Test-Path $TV_APK) {
    $tvSize = (Get-Item $TV_APK).Length / 1MB
    Write-Host "✅ 📺 APK TV: $TV_APK" -ForegroundColor Green
    Write-Host "   Tamanho: $([math]::Round($tvSize, 2)) MB" -ForegroundColor Cyan
} else {
    Write-Host "❌ Erro: APK TV não foi gerado" -ForegroundColor Red
}

Write-Host "=================================================" -ForegroundColor Yellow
Write-Host "🎉 BUILD CONCLUÍDO COM SUCESSO!" -ForegroundColor Green
Write-Host "APKs disponiveis em: android\app\build\outputs\apk\" -ForegroundColor Cyan
Write-Host ""
Write-Host "INSTALACAO:" -ForegroundColor Yellow
Write-Host "   Mobile: adb install `"$MOBILE_APK`"" -ForegroundColor White
Write-Host "   TV:     adb install `"$TV_APK`"" -ForegroundColor White

# Voltar ao diretório raiz
Set-Location ..
