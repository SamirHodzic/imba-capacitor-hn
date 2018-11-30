const webpack = require('webpack');
const CleanWebpackPlugin = require('clean-webpack-plugin');
const UglifyJsPlugin = require('uglifyjs-webpack-plugin');
const HtmlWebpackPlugin = require('html-webpack-plugin');
const ExtractTextPlugin = require('extract-text-webpack-plugin');

const debug = process.env.NODE_ENV !== 'production';
const extractCSSApp = new ExtractTextPlugin({ filename: '[name].[hash].css' });

const plugins = [
  new CleanWebpackPlugin(['www'], { verbose: true, dry: false }),
  new HtmlWebpackPlugin({
    template: './app/index.html',
    chunks: ['vendor', 'app'],
    chunksSortMode: 'manual'
  }),
  new webpack.LoaderOptionsPlugin({
    minimize: !debug
  }),
  extractCSSApp
];

if (!debug) {
  plugins.push(new UglifyJsPlugin());
}

module.exports = {
  devServer: {
    stats: {
      colors: true,
      hash: false,
      version: false,
      timings: true,
      assets: false,
      chunks: false,
      modules: false,
      reasons: false,
      children: false,
      source: false,
      errors: true,
      errorDetails: true,
      warnings: true,
      publicPath: false
    }
  },
  module: {
    rules: [
      {
        test: /\.imba$/,
        use: [
          {
            loader: 'babel-loader'
          },
          {
            loader: 'imba/loader'
          }
        ]
      },
      {
        test: /\.(scss|sass)$/,
        use: extractCSSApp.extract({
          fallback: 'style-loader',
          use: 'css-loader!sass-loader'
        })
      }
    ]
  },
  resolve: {
    extensions: ['.imba', '.js', '.json', '.scss', '.css']
  },
  entry: {
    app: ['./app/app.imba', './app/styles/app.scss']
    // vendor: []
  },
  output: {
    path: __dirname + '/www',
    filename: '[name].[hash].js'
  },
  plugins: plugins
};
