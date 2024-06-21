# InAppBrowser Implementation to open a web url in Ionic Vue Capacitor App.

Ionic Vue Capacitor app with InAppBrowser.

## Using @capacitor/browser

(If we need toolbar at top.)

`npm install @Capacitor/browser`

open() creates the browser instance with the given ```URL```,
On ```browserFinished``` we can close the app.

```typescript
        await Browser.open({ url });
        Browser.addListener("browserFinished", () => {
            App.exitApp();
        })
```
## Using cordova-plugin-in-app-browser
  (If We don't need toolbar at top and just the webview.)
`npm install cordova-plugin-inappbrowser`

`npm install @awesome-cordova-plugins/core`

`npm install @awesome-cordova-plugins/in-app-browser`

Updated `ionic.config.json` to use cordova plugin.

`ionic cap sync`;

  ```typescript
  const browserInstance: InAppBrowserObject = await InAppBrowser.create(url, "blank", "toolbar=no,location=no,zoom=no");
      browserInstance.on("exit").subscribe(exit => {
        console.log("Browser Exited", exit);
        App.exitApp();
      });
  ```


# Building Android App

`ionic capacitor add android`

`ionic capacitor build android`

