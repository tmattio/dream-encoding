(lang dune 2.0)

(name dream-encoding)

(documentation "https://tmattio.github.io/dream-encoding/")

(source
 (github tmattio/dream-encoding))

(license MIT)

(authors "Thibaut Mattio")

(maintainers "Thibaut Mattio")

(generate_opam_files true)

(package
 (name dream-encoding)
 (synopsis "Live reloading for Dream applications")
 (description "Live reloading for Dream applications")
 (depends
  (ocaml
   (>= 4.08.0))
  dune
  dream
  (decompress
   (>= 1.4.1))
  (odoc :with-doc)))
