(ns samples.with-middleware
  (:gen-class)
  (:require
    [org.httpkit.server :refer [run-server]]
    [ring.middleware.defaults :refer [wrap-defaults site-defaults api-defaults]]
    [environ.core :refer [env]]))

(def handler
  (fn [request]
    {:status 200 :headers {"Content-Type" "text/html"} :body "Hello World with middleware!"}))

(def app
  (wrap-defaults handler site-defaults))

(defn -main [& [port]] ;; entry point, lein run will pick up and start from here
  (let [p (Integer. (or port (env :port) 5000))]
    (run-server app {:port p})))
