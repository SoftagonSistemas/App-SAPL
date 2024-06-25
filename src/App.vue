<script setup lang="ts">
import { IonButton, IonContent, IonPage } from '@ionic/vue'
import { Browser } from '@capacitor/browser'
import { App } from '@capacitor/app'
import { onMounted, ref } from 'vue'

const showExitButton = ref(false)

onMounted(async () => {
  await App.addListener('backButton', ({ canGoBack }) => {
    if (!canGoBack) {
      App.exitApp()
    }
  })

  const currentDate = new Date()
  const year = currentDate.getFullYear()
  const month = currentDate.getMonth() + 1
  const day = currentDate.getDate()

  const sapl = 'https://sapl.salitre.ce.leg.br'
  const url = `${sapl}/sessao/pesquisar-sessao?data_inicio__year=${year}&data_inicio__month=${month}&data_inicio__day=${day}&tipo=&salvar=Pesquisar`

  await Browser.open({ url })

  // Adicione um atraso antes de mostrar o botão de saída
  setTimeout(() => {
    showExitButton.value = true
  }, 5000) // 5 segundos
})
</script>

<template>
  <IonPage>
    <IonContent>
      <p>Softagon Sistemas</p>
      <IonButton v-if="showExitButton" @click="App.exitApp">
        Sair do Aplicativo
      </IonButton>
    </IonContent>
  </IonPage>
</template>
