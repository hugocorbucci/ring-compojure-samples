# Clojure web samples using ring, compojure and hiccup

This is a collection of very short samples to show how to use [ring](https://github.com/ring-clojure/ring), [compojure](https://github.com/weavejester/compojure) and [hiccup](https://github.com/weavejester/hiccup) to create web applications in [clojure](https://clojure.org/).

To run the examples locally, simply clone this repository using [git](https://git-scm.com/) (or [download](https://github.com/hugocorbucci/ring-compojure-samples/archive/master.zip) it and extract it) and run:

```
./setup.sh
PORT=3000 ./bin/lein run -m samples.minimal
```

You can replace the argument after `-m` with any of the 5 samples available:
  * samples.minimal - A minimal ring only application that only replies with a 200 http code and a "Hello Minimal World!" response body.
  * samples.with-middleware - A ring application that uses the [ring default middleware](https://github.com/ring-clojure/ring-defaults) to set up bases for a web application understanding static assets and setting appropriate http headers.
  * samples.with-compojure - A ring application with compojure that helps define known routes.
  * samples.without-compojure - A ring application that sets up routes without compojure's help for pure comparison
  * samples.with-hiccup - A ring application with compojure and hiccup to generate html.

This code was released to support [a blog post](http://blog.hugocorbucci.com/post/developing-clojure) and therefore has a couple shell scripts to help run comparisons of the web responses provided by each sample.

To run the full comparison, just run:

```
./test_script.sh
```

This will run and stop each of the 5 samples and issue the same set of requests against each one collecting both response bodies as well as headers so you can see what each sample provides.
