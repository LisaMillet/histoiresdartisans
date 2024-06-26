const path    = require("path")
const webpack = require("webpack")

module.exports = {
  mode: "production",
  devtool: "source-map",
  entry: {
    application: "./app/javascript/application.js"
  },
  // resolve: {
  //   alias: {
  //     'flowbite': 'flowbite/dist/flowbite.turbo.js',
  //   },
  // },
  performance: {
    maxEntrypointSize: 512000,
    maxAssetSize: 512000
  },
  output: {
    filename: "[name].js",
    sourceMapFilename: "[file].map",
    path: path.resolve(__dirname, "app/assets/builds"),
  },
  plugins: [
    new webpack.optimize.LimitChunkCountPlugin({
      maxChunks: 1
    }),
    // new webpack.ProvidePlugin({
    //   Flowbite: 'flowbite/flowbite.js',
    // })
  ]
}
