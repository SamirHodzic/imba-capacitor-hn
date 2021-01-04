# imba-capacitor-hn

This is an example of a HackerNews built using [Imba](http://imba.io), [Webpack](https://webpack.js.org), and [Capacitor](https://capacitor.ionicframework.com) (for mobile packing). Please do not think of this as the way to build your application. Instead, this as an experimental concept used to understand a bit Imba and trying to use it for both web/mobile development.

<img src="assets/imba-capacitor-hn.gif"/>

## Installation

1. Install dependencies
    ```sh
    npm install
    ```
2. (optional) Add mobile platforms
    ```sh
    npx cap add android
    
    # or
    
    npx cap add ios
    ```
3. Run Locally web version
    ```sh
    npm start

    # Project is running at http://localhost:8080/
    ```
4. Build dev/prod versions
    ```sh
    npm run build:dev
    
    # or
    
    npm run build:prod
    ```
5. Build prod version and open Android/iOS
    ```sh
    npm run build:android
    
    # or
    
    npm run build:ios
    ```

## License

MIT
