<script setup lang="ts">
import { IonContent, IonPage } from '@ionic/vue'
import { Browser } from '@capacitor/browser'
import { App } from '@capacitor/app'
import { onMounted } from 'vue'

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

  const sapl = '`https://sapl.salitre.ce.leg.br'
  const url = `${sapl}/sessao/pesquisar-sessao?data_inicio__year=${year}&data_inicio__month=${month}&data_inicio__day=${day}&tipo=&salvar=Pesquisar`

  await Browser.open({ url })
  Browser.addListener('browserFinished', () => {
    App.exitApp()
  })
})
</script>

<template>
  <IonPage>
    <IonContent>
      <p>Softagon Sistemas</p>
    </IonContent>
  </IonPage>
</template>
