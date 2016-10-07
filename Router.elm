module Router exposing (..)

import Navigation exposing (..)
import String
import Model exposing (..)


-- Navigation


{-|
Translate URL to Page
-}
locationParser : Location -> Page
locationParser location =
    let
        hash =
            String.dropLeft 1 location.hash

        _ =
            Debug.log "locationParser: " location.hash
    in
        case hash of
            "" ->
                LeaderBoardPage

            "login" ->
                LoginPage

            "add" ->
                AddRunnerPage

            _ ->
                NotFound


{-|
Called when URL changes, using Page produced by locationParser.
-}
urlUpdate : Page -> Model -> ( Model, Cmd Msg )
urlUpdate page model =
    let
        _ =
            Debug.log "urlUpdate: " page
    in
        ( { model | page = page }, Cmd.none )


toHash : Page -> String
toHash page =
    case page of
        LeaderBoardPage ->
            "#"

        LoginPage ->
            "#login"

        AddRunnerPage ->
            "#add"

        NotFound ->
            "#notfound"


navigateCmd : Page -> Cmd Msg
navigateCmd page =
    newUrl (toHash page)
