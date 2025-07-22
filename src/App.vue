<script setup lang="ts">
import type { InAppBrowserObject } from '@awesome-cordova-plugins/in-app-browser'
import { InAppBrowser } from '@awesome-cordova-plugins/in-app-browser'
import { App } from '@capacitor/app'
import { Preferences } from '@capacitor/preferences'

import { IonButton, IonCard, IonCardContent, IonCardHeader, IonCardTitle, IonContent, IonPage, IonProgressBar, IonToast } from '@ionic/vue'
import { onMounted, ref } from 'vue'

const SAPL_URL_KEY = 'sapl_url'
const defaultUrl = 'https://sapl.novaolinda.ce.leg.br'
const newUrl = ref('')
const currentUrl = ref(defaultUrl)
const showToast = ref(false)
const toastMessage = ref('')

const countdown = ref(30)
const countdownActive = ref(true)
let countdownInterval: ReturnType<typeof setInterval> | null = null

// Garante que a URL inicial seja sempre a de Nova Olinda ao instalar/abrir pela primeira vez
async function ensureDefaultUrl() {
  const { value } = await Preferences.get({ key: SAPL_URL_KEY })
  if (!value) {
    await Preferences.set({ key: SAPL_URL_KEY, value: defaultUrl })
  }
}

async function getSaplUrl() {
  const { value } = await Preferences.get({ key: SAPL_URL_KEY })
  return value || defaultUrl
}

async function setSaplUrl(url: string) {
  await Preferences.set({ key: SAPL_URL_KEY, value: url })
  currentUrl.value = url
}

async function openSapl() {
  // Ativa o modo fullscreen/imersivo se disponível
  // @ts-expect-error Assuming AndroidFullScreen is available
  if (window.AndroidFullScreen && window.AndroidFullScreen.immersiveMode) {
    // @ts-expect-error Assuming AndroidFullScreen is available
    window.AndroidFullScreen.immersiveMode()
  }

  const currentDate = new Date()
  const year = currentDate.getFullYear()
  const month = currentDate.getMonth() + 1
  const day = currentDate.getDate()

  const sapl = await getSaplUrl()
  const url = `${sapl}/sessao/pesquisar-sessao?data_inicio__year=${year}&data_inicio__month=${month}&data_inicio__day=${day}&tipo=&salvar=Pesquisar`

  const browserInstance: InAppBrowserObject = await InAppBrowser.create(url, 'blank', 'toolbar=no,location=no,zoom=no')
  browserInstance.on('exit').subscribe(() => {
    App.exitApp()
  })
}

async function saveUrl() {
  if (newUrl.value) {
    await setSaplUrl(newUrl.value)
    toastMessage.value = 'URL salva! Reinicie o app para aplicar.'
    showToast.value = true
  }
}

onMounted(async () => {
  await App.addListener('backButton', ({ canGoBack }) => {
    if (!canGoBack) {
      App.exitApp()
    }
  })

  await ensureDefaultUrl()
  currentUrl.value = await getSaplUrl()

  countdown.value = 30
  countdownActive.value = true
  countdownInterval = setInterval(() => {
    if (countdown.value > 0) {
      countdown.value--
    }
    if (countdown.value === 0) {
      countdownActive.value = false
      clearInterval(countdownInterval!)
      openSapl()
    }
  }, 1000)
})
</script>

<template>
  <IonPage>
    <IonContent class="ion-padding" :fullscreen="true">
      <IonCard v-if="countdownActive">
        <IonCardHeader>
          <IonCardTitle style="text-align:center;">
            Configuração Inicial
          </IonCardTitle>
        </IonCardHeader>
        <IonCardContent style="display:flex; flex-direction:column; align-items:center;">
          <div style="font-size:1.2em; margin-bottom:8px;">
            Você pode alterar a URL do SAPL antes de iniciar
          </div>
          <label style="margin-bottom:4px;">URL atual:</label>
          <b style="margin-bottom:8px;">{{ currentUrl }}</b>
          <input v-model="newUrl" placeholder="Digite a nova URL do SAPL" style="width: 100%; margin: 8px 0; padding:8px; border-radius:6px; border:1px solid #ccc;">
          <IonButton expand="block" color="primary" style="margin-bottom:12px;" @click="saveUrl">
            Salvar URL
          </IonButton>
          <div style="margin: 12px 0; font-size:1.1em; color:var(--ion-color-primary); font-weight:bold;">
            Iniciando em {{ countdown }} segundo<span v-if="countdown !== 1">s</span>...
          </div>
          <IonProgressBar :value="(30 - countdown) / 30" color="primary" style="width:100%" />
        </IonCardContent>
      </IonCard>
      <p v-else style="text-align:center; margin-top:40px;">
        Softagon Sistemas
      </p>
      <IonToast
        :is-open="showToast"
        :message="toastMessage"
        :duration="2500"
        @did-dismiss="showToast = false"
      />
    </IonContent>
  </IonPage>
</template>
