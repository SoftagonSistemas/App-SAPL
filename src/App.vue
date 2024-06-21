<template>
  <ion-page>
    <ion-content>
      <p>Please Wait...</p>
    </ion-content>
  </ion-page>
</template>

<script lang="ts">
import { IonContent, IonPage } from '@ionic/vue';

// /** Capacitor Plugin */
// import { Browser } from '@capacitor/browser';

/** Cordova Plugin */
import { InAppBrowser, InAppBrowserObject } from '@awesome-cordova-plugins/in-app-browser';
import { App } from '@capacitor/app';
import { onMounted } from 'vue';
export default {
  components: {
    IonPage, IonContent
  },
  setup() {
    onMounted(async () => {
      await App.addListener('backButton', ({ canGoBack }) => {
        if (!canGoBack) {
          App.exitApp();
        }
      });

      const url = 'https://sapl.salitre.ce.leg.br/sessao/pesquisar-sessao?data_inicio__year=2024';

      //** Cordova Plugin Implementation */
      const browserInstance: InAppBrowserObject = await InAppBrowser.create(url, "blank", "toolbar=no,location=no,zoom=no");
      browserInstance.on("exit").subscribe(exit => {
        console.log("Browser Exited", exit);
        App.exitApp();
      });

      // //** Capacitor Plugin Implementation  */
      //    await Browser.open({ url});
      //    Browser.addListener("browserFinished" , () =>{
      //    App.exitApp();
      // })
    });
  }
}
</script>

<style scoped></style>
