(ns samples.minimal
  (:gen-class)
  (:require
    [org.httpkit.server :refer [run-server]]
    [environ.core :refer [env]]))

(def handler
  (fn [request]
    {:status 200 :headers {"Content-Type" "text/html"} :body "Hello Minimal World!"}))

(defn -main [& [port]] ;; entry point, lein run will pick up and start from here
  (let [p (Integer. (or port (env :port) 5000))]
    (run-server handler {:port p})))
