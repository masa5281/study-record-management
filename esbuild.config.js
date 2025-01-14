// esbuild.config.js
const esbuild = require('esbuild');
const { sassPlugin } = require('esbuild-sass-plugin');

esbuild.build({
  // 例: メインの JS エントリポイント
  entryPoints: ['app/javascript/application.js'], // ビルド開始ファイル / importされているJSやSCSSを全部まとめてビルドする
  bundle: true,
  // 出力先
  outdir: 'public/builds',
  // esbuild-sass-plugin を使う
  plugins: [
    sassPlugin({
      // ここで node_modulesをloadPathsに加えておくと、SCSSで @use "bootstrap/scss/bootstrap"が通りやすくなる。
      loadPaths: ['node_modules']
    })
  ],
  // 必要に応じて watch や minify を設定
  watch: process.argv.includes('--watch'),
  minify: true,
}).catch(() => process.exit(1));
