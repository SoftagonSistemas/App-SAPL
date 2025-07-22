# Script para facilitar operações com Android Studio
# App-SAPL - Configurações Específicas

## Comandos úteis para desenvolvimento:

# Limpar e fazer build completo
.\gradlew clean
.\gradlew assembleMobileDebug

# Para executar no Android Studio, use:
# Build > Select Build Variant > mobileDebug

# Para resolver problemas de build:
1. No Android Studio, vá em File > Sync Project with Gradle Files
2. Build > Clean Project
3. Build > Rebuild Project

## Configurações aplicadas:
- Definido build variant padrão como 'mobileDebug'
- Criadas tarefas para resolver ambiguidade:
  * assembleDebugUnitTest -> assembleMobileDebugUnitTest
  * assembleDebugAndroidTest -> assembleMobileDebugAndroidTest

## Flavors disponíveis:
- mobile: Para smartphones/tablets
- tv: Para Android TV
