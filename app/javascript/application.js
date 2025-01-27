// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails

import "@hotwired/turbo-rails"
import "bootstrap"; // "モジュール名"で読み込んでいる → node_modulesから参照
import "./stylesheets/application.scss"; // sassPlugin を通してSCSSをコンパイル