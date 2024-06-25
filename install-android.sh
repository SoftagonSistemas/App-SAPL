#!/bin/bash

# Instalar OpenJDK 17 e dependências JAXB
sudo apt update
sudo apt install -y openjdk-17-jdk libjaxb-api-java libjaxb-java

# Adicionar caminho do JDK ao .zshrc
if ! grep -q "export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64" ~/.zshrc; then
    echo "export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64" >> ~/.zshrc
    echo "export PATH=\$JAVA_HOME/bin:\$PATH" >> ~/.zshrc
fi

# Adicionar caminho do Android SDK ao .zshrc
if ! grep -q "export ANDROID_HOME=\$HOME/Android/Sdk" ~/.zshrc; then
    echo "export ANDROID_HOME=\$HOME/Android/Sdk" >> ~/.zshrc
    echo "export PATH=\$ANDROID_HOME/cmdline-tools/latest/cmdline-tools/bin:\$PATH" >> ~/.zshrc
    echo "export PATH=\$ANDROID_HOME/emulator:\$PATH" >> ~/.zshrc
    echo "export PATH=\$ANDROID_HOME/platform-tools:\$PATH" >> ~/.zshrc
    echo "export PATH=\$ANDROID_HOME/tools:\$PATH" >> ~/.zshrc
    echo "export PATH=\$ANDROID_HOME/tools/bin:\$PATH" >> ~/.zshrc
fi

# Carregar as novas variáveis de ambiente
export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
export PATH=$JAVA_HOME/bin:$PATH
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$ANDROID_HOME/cmdline-tools/latest/cmdline-tools/bin:$PATH
export PATH=$ANDROID_HOME/emulator:$PATH
export PATH=$ANDROID_HOME/platform-tools:$PATH
export PATH=$ANDROID_HOME/tools:$PATH
export PATH=$ANDROID_HOME/tools/bin:$PATH

# Função para instalar ferramentas Android SDK
android_sdk_setup() {
    # Criar diretório do Android SDK se não existir
    if [ ! -d "$ANDROID_HOME" ]; then
        mkdir -p $ANDROID_HOME
        echo "Diretório $ANDROID_HOME criado com sucesso."
    fi

    # Baixar e instalar ferramentas de linha de comando do SDK Android se não existir
    if [ ! -d "$ANDROID_HOME/cmdline-tools/latest" ]; then
        mkdir -p $ANDROID_HOME/cmdline-tools/latest
        cd $ANDROID_HOME/cmdline-tools/latest
        wget https://dl.google.com/android/repository/commandlinetools-linux-11076708_latest.zip?hl=pt-br -O commandlinetools.zip
        unzip commandlinetools.zip -d cmdline-tools
        rm commandlinetools.zip
        echo "Ferramentas de linha de comando do SDK Android instaladas com sucesso."
    fi

    # Instalar plataformas e ferramentas necessárias
    yes | java --add-modules java.xml.bind -cp $ANDROID_HOME/cmdline-tools/latest/cmdline-tools/bin/sdkmanager --sdk_root=$ANDROID_HOME "platform-tools" "platforms;android-30" "build-tools;30.0.3"
}

# Função para verificar a instalação do JDK e SDK
check_installation() {
    echo "Verificando instalação do JDK..."
    java -version
    echo "Verificando instalação do SDK Android..."
    java --add-modules java.xml.bind -cp $ANDROID_HOME/cmdline-tools/latest/cmdline-tools/bin/sdkmanager --list || {
        echo "Tentando instalar dependências JAXB..."
        sudo apt install -y libjaxb-api-java libjaxb-java
        echo "Tentando novamente verificar a instalação do SDK Android..."
        java --add-modules java.xml.bind -cp $ANDROID_HOME/cmdline-tools/latest/cmdline-tools/bin/sdkmanager --list
    }
}

# Função para configurar o projeto Android
setup_project() {
    if [ ! -f "local.properties" ]; then
        echo "sdk.dir=$ANDROID_HOME" > local.properties
        echo "Arquivo local.properties criado com sucesso."
    else
        echo "Arquivo local.properties já existe."
    fi
}

# Executar as funções
android_sdk_setup
check_installation
setup_project

# Mensagem de conclusão
echo "Configuração do ambiente Android SDK concluída com sucesso."
echo "Variáveis de ambiente adicionadas ao ~/.zshrc. Use 'source ~/.zshrc' para carregá-las."
