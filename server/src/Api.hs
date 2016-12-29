{-# LANGUAGE DataKinds       #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE TypeOperators   #-}
{-# LANGUAGE DeriveGeneric     #-}

module Api where

import Network.Wai
import Network.Wai.Handler.Warp
import Servant
import Data.Text
import Data.Int

import Database.Persist

import Models

type Api =
       "user" :> "add" :> ReqBody '[JSON] User :> Post '[JSON] (Maybe Int64)
  :<|> "user" :> "get" :> Capture "name" Text  :> Get  '[JSON] (Maybe User)

api :: Proxy Api
api = Proxy
