# Script para configurar o ambiente de desenvolvimento Android
Write-Host "Configurando ambiente Android..." -ForegroundColor Green

# Tentar instalar Java via winget
if (Get-Command winget -ErrorAction SilentlyContinue) {
    Write-Host "Instalando Java JDK 17..." -ForegroundColor Yellow
    winget install EclipseAdoptium.Temurin.17.JDK
} else {
    Write-Host "winget nao disponivel. Instale Java JDK 17 manualmente." -ForegroundColor Red
    Write-Host "Acesse: https://adoptium.net/temurin/releases/" -ForegroundColor Cyan
}

Write-Host "Configuracao concluida!" -ForegroundColor Green
