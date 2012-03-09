# -*- encoding: utf-8 -*-

module Stomp
  #
  # == Purpose
  #
  # Parameters for STOMP ssl connections.
  #
  class SSLParams
    # The trust store files.  Normally the certificate of the CA that signed
    # the server's certificate.  One file name, or a CSV list of file names.
    attr_accessor :ts_files
    # The client certificate file.
    attr_accessor :cert_file
    # The client private key file.
    attr_accessor :key_file
    # SSL Connect Verify Result.  The result of the handshake.
    attr_accessor :verify_result
    # The certificate of the connection peer (the server), received during
    # the handshake.
    attr_accessor :peer_cert
    # Optional list of SSL ciphers to be used.  In the format documented for
    # Ruby's OpenSSL.
    attr_accessor :ciphers
    #
    def initialize(opts={})

      # Server authentication parameters
      @ts_files = opts[:ts_files]   # A trust store file, normally a CA's cert
      # or a CSV list of cert file names

      # Client authentication parameters
      @cert_file = opts[:cert_file]         # Client cert
      @key_file = opts[:key_file]           # Client key
      #
      raise Stomp::Error::SSLClientParamsError if @cert_file.nil? && !@key_file.nil?
      raise Stomp::Error::SSLClientParamsError if !@cert_file.nil? && @key_file.nil?
      #
      @ciphers = opts[:ciphers]
    end
  end # of class SSLParams

end # of module Stomp
