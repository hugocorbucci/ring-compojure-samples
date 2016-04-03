(ns samples.with-compojure
  (:gen-class)
  (:require
    [org.httpkit.server :refer [run-server]]
    [compojure.core :refer [defroutes GET PUT POST DELETE ANY]]
    [ring.middleware.defaults :refer [wrap-defaults site-defaults api-defaults]]
    [environ.core :refer [env]]))

(defroutes site-routes
  (GET "/" []
    {:status 200 :headers {"Content-Type" "text/html"} :body "Hello World with compojure!"}))

(def handler
  (wrap-defaults site-routes site-defaults))

(defn -main [& [port]] ;; entry point, lein run will pick up and start from here
  (let [p (Integer. (or port (env :port) 5000))]
    (run-server handler {:port p})))
