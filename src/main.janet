#!/usr/bin/env janet
(use sh)
(import cmd)

(cmd/main (cmd/fn
            [port (required :number)]
            (let [pid (string/trim ($< lsof -i -P |grep LISTEN |grep ,(string/format ":%d" port) |grep -oE "[0-9]+" |head -n 1) "\n")]
              (when pid
                (print "Killing process " pid "...")
                ($ kill -9 (string/format "%d" pid))
                (print "Process killed successfully")))))
