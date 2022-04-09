(lang dune 2.7)

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
 (synopsis "Encoding primitives for Dream")
 (description "Encoding primitives for Dream.")
 (depends
  (ocaml
   (>= 4.08.0))
  (dream
   (>= 1.0.0~alpha3))
  (decompress
   (>= 1.4.1))
  lwt_ppx))
