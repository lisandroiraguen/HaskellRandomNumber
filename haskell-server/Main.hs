{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE OverloadedStrings #-}

module Main where

import System.Environment (lookupEnv)
import Data.Maybe (fromMaybe)
import Network.Wai
import Network.Wai.Handler.Warp (run)
import Network.HTTP.Types (status200)
import System.Random (randomIO)                  -- Proporciona 'randomIO'
import Control.Monad.IO.Class (liftIO)          -- Proporciona 'liftIO'
import Data.Text.Lazy (pack)
import Data.Text.Lazy.Encoding (encodeUtf8)

-- Función principal de la aplicación WAI
app :: Application
app _ respond = do
    -- 1. Generar un número aleatorio.
    -- La función 'randomIO' está en IO, así que usamos liftIO.
    randomNumber :: Int <- liftIO randomIO

    -- 2. Convertir el número a un String (o Text) y luego a ByteString.
    let numberText = pack $ show randomNumber
    let responseBody = encodeUtf8 numberText

    -- 3. Enviar la respuesta.
    respond $ responseLBS
        status200
        [("Content-Type", "text/plain")]
        responseBody

-- | La función principal que inicia el servidor
main :: IO ()
main = do
  -- 1. Leer el puerto asignado por Azure Functions
  mportStr <- lookupEnv "FUNCTIONS_CUSTOMHANDLER_PORT"
  
  -- Usamos 8080 como fallback si la variable no está (solo para pruebas fuera de func start)
  let port = fromMaybe 8080 (fmap read mportStr) :: Int
  
  -- Para propósitos de depuración
  putStrLn $ "Starting Haskell Custom Handler on port: " ++ show port
  
  -- 2. Iniciar el servidor Warp en el puerto leído
  run port app