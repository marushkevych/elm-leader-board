module View exposing (..)

import Html exposing (..)
import Html.Events exposing (..)


--import Html.Attributes exposing (..)

import Html.App as App
import Model exposing (..)
import Login
import LeaderBoard


view : Model -> Html Msg
view model =
    let
        page =
            case model.page of
                LeaderBoardPage ->
                    App.map LeaderBoardMsg (LeaderBoard.view model.leaderBoard)

                LoginPage ->
                    App.map LoginMsg (Login.view model.login)

                AddRunnerPage ->
                    h1 [] [ text "Add Runner" ]

                NotFound ->
                    h1 [] [ text "Not Found" ]
    in
        div []
            [ header []
                [ a [ onClick (Navigate LeaderBoardPage) ] [ text "Leader Board" ]
                , span [] [ text " | " ]
                , a [ onClick (Navigate LoginPage) ] [ text "Login" ]
                , span [] [ text " | " ]
                , a [ onClick (Navigate AddRunnerPage) ] [ text "Add Runner" ]
                ]
            , hr [] []
            , page
            , hr [] []
            , h4 [] [ text "App Model: " ]
            , p [] [ text <| toString model ]
            ]
