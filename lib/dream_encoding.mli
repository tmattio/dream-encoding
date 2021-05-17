(** Encoding primitives for Dream.

    As of now, the supported encoding directives are [deflate] and [gzip]. More
    directive will be supported when their support land in [decompress], the
    underlying compression library used by Dream_encoding. *)

val compress : Dream.middleware
(** Middleware that reads the [Accept-Encoding] header of the request and
    compresses the responses with the preferred supported algorithm. *)

val decompress : Dream.middleware
(** Middleware that reads the [Content-Encoding] of the request and decompresses
    the body if all of the directives of the header are supported.

    If one or more of the directive is not supported, an HTTP response
    [415 Unsupported Media Type] is returned to the client.

    Note that although HTTP supports encoding requests, it is rarely used in
    practice. See [compress] to for a middleware that compresses the responses
    instead. *)

val with_encoded_body
  :  ?algorithm:[ `Deflate | `Gzip ]
  -> string
  -> Dream.response
  -> Dream.response
(** [with_encoded_body ?algorithm body response] replaces the body of the
    response with [body] compressed with [algorithm] and adds the corresponding
    [Content-Encoding] header.

    [algorithm] defaults to [`Deflate]. *)

val accept_encoding
  :  'a Dream.message
  -> [ `Deflate | `Gzip | `Unknown of string ] list option
(** Retrieve the list of accepted encoding directives from the [Accept-Encoding]
    header.

    If the request does not have an [Accept-Encoding] header, this returns
    [None]. *)

val content_encoding
  :  'a Dream.message
  -> [ `Deflate | `Gzip | `Unknown of string ] list option
(** Retrieve the list of content encoding directives from the [Content-Encoding]
    header.

    If the request does not have an [Content-Encoding] header, this returns
    [None]. *)

val preferred_content_encoding : 'a Dream.message -> [ `Deflate | `Gzip ] option
(** Retrieve preferred encoding directive from the [Accept-Encoding].

    The preferred encoding directive is the first supported algorithm in the
    list of accepted directives.

    If no algorithm is supported, or if the request does not have an
    [Accept-Encoding] header, this returns [None]. *)
