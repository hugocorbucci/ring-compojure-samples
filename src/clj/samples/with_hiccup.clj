(ns samples.with-hiccup
  (:gen-class)
  (:use
    [hiccup.page :only (html5 include-css include-js)])
  (:require
    [org.httpkit.server :refer [run-server]]
    [compojure.core :refer [defroutes GET PUT POST DELETE ANY]]
    [ring.middleware.defaults :refer [wrap-defaults site-defaults api-defaults]]
    [environ.core :refer [env]]))

(defroutes site-routes
  (GET "/" request
    (html5
      [:head
        [:title "Home"]
        (include-css "/css/template.css")]
      [:body
        [:p "Hello World with hiccup"]
        (include-js "/js/template.js")])))

(def handler
  (wrap-defaults site-routes site-defaults))

(defn -main [& [port]] ;; entry point, lein run will pick up and start from here
  (let [p (Integer. (or port (env :port) 5000))]
    (run-server handler {:port p})))
