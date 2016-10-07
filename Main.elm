module Main exposing (..)

import Model exposing (..)
import Router exposing (..)
import Update exposing (..)
import View exposing (..)
import Navigation exposing (..)


main : Program Never
main =
    Navigation.program (makeParser locationParser)
        { init = init
        , update = update
        , view = view
        , subscriptions = subscriptions
        , urlUpdate = urlUpdate
        }



-- Subscribtions


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
