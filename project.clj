(defproject samples "0.0.1"
  :description "A group of samples to show usage of ring and compojure for a clojure web app"
  :license {:name "MIT"}
  :min-lein-version "2.0.0"
  :source-paths ["src/clj"]
  :main samples.with-compojure
  :aot :all
  :dependencies [[org.clojure/clojure "1.8.0"]
    [compojure "1.5.1"]
    [ring/ring-defaults "0.2.1"]
    [ring/ring-core "1.5.0"]
    [ring/ring-devel "1.5.0"]
    [http-kit "2.2.0"]
    [environ "1.0.3"]
    [hiccup "1.0.5"]]
  :dev-dependencies []
  :plugins [[lein-environ "1.0.2"]
    [lein-ring "0.9.7"]]
  :ring { :handler samples.minimal/handler }
  :profiles {
    :production
    {:env {:production "true" :clj-env "production"}}
    :dev
    { :plugins [[lein-dotenv "RELEASE"]] :env {:development "true" :clj-env "development"}}})
