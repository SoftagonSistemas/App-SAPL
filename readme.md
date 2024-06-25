# Painel eletrônico de votação

Ionic Vue Capacitor app with InAppBrowser.

## Usando @capacitor/browser

 `npm install @Capacitor/browser`

open() creates the browser instance with the given ```URL```,
On ```browserFinished``` we can close the app.

```typescript
await Browser.open({ url })
Browser.addListener('browserFinished', () => {
  App.exitApp()
})
```
## Faça os ícones o projeto
- Mude a imagem em assets/logo.png e depois rode o comando:

```console
  npx @capacitor/assets generate --iconBackgroundColor '#eeeeee' --iconBackgroundColorDark '#222222' --splashBackgroundColor '#eeeeee' --splashBackgroundColorDark '#111111' --android

```
# Building Android App

`ionic capacitor add android`

`ionic capacitor build android`

`npx cap open android`
