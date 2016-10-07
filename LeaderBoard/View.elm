module LeaderBoard.View exposing (..)

import Html exposing (..)
import Html.Events exposing (..)
import Html.Attributes exposing (..)
import LeaderBoard.Model exposing (..)


view : Model -> Html Msg
view model =
    div []
        [ h1 [] [ text "Leaderboard page... So far" ]
        , input
            [ type' "text"
            , onInput QueryInput
            , value model.query
            , placeholder "Search for a runner..."
            ]
            []
        , hr [] []
        , h4 [] [ text "Leaderboard Model:" ]
        , p [] [ text <| toString model ]
        ]
