(ns samples.without-compojure
  (:gen-class)
  (:require
    [org.httpkit.server :refer [run-server]]
    [ring.middleware.defaults :refer [wrap-defaults site-defaults api-defaults]]
    [ring.util.request :refer [path-info]]
    [environ.core :refer [env]]))

(def handler
  (fn [request]
    (if (= "/" (path-info request))
      {:status 200 :headers {"Content-Type" "text/html"} :body "Hello World without compojure!"}
      {:status 404 :body ""})))

(def app
  (wrap-defaults handler site-defaults))

(defn -main [& [port]] ;; entry point, lein run will pick up and start from here
  (let [p (Integer. (or port (env :port) 5000))]
    (run-server app {:port p})))
