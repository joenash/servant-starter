{-# LANGUAGE DataKinds         #-}
{-# LANGUAGE DeriveGeneric     #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TypeOperators     #-}

module Generate where

import           Elm          (Spec (Spec), specsToDir, toElmDecoderSource, toElmEncoderSource,
                               toElmTypeSource)
import           GHC.Generics (Generic)
import           Servant.API  ((:>), Capture, Get, JSON)
import           Servant.Elm  (ElmType, Proxy (Proxy), defElmImports,
                               generateElmForAPI)
import           Api
import           Models


spec :: Spec
spec = Spec ["Generated", "Main"]
            (defElmImports
            : toElmTypeSource    (Proxy :: Proxy User)
            : toElmDecoderSource (Proxy :: Proxy User)
            : toElmEncoderSource (Proxy :: Proxy User)
            : generateElmForAPI  (Proxy :: Proxy Api))

main :: IO ()
main = specsToDir [spec] "./client"
