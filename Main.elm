module Main exposing (..)

import Html exposing (..)
import Html.Events exposing (..)
import Html.Attributes exposing (..)
import Html.App as App
import Login
import LeaderBoard


main : Program Never
main =
    App.beginnerProgram { model = initModel, view = view, update = update }



-- model


type alias Model =
    { page : Page
    , leaderBoard : LeaderBoard.Model
    , login : Login.Model
    }


type Page
    = LeaderBoardPage
    | LoginPage


initModel : Model
initModel =
    { page = LeaderBoardPage
    , leaderBoard = LeaderBoard.initModel
    , login = Login.initModel
    }



-- update


type Msg
    = ChangePage Page
    | LeaderBoardMsg LeaderBoard.Msg
    | LoginMsg Login.Msg


update : Msg -> Model -> Model
update msg model =
    case msg of
        ChangePage page ->
            { model
                | page = page
            }

        LeaderBoardMsg lbMsg ->
            { model | leaderBoard = LeaderBoard.update lbMsg model.leaderBoard }

        LoginMsg loginMsg ->
            { model | login = Login.update loginMsg model.login }



-- vew


view : Model -> Html Msg
view model =
    let
        page =
            case model.page of
                LeaderBoardPage ->
                    App.map LeaderBoardMsg (LeaderBoard.view model.leaderBoard)

                LoginPage ->
                    App.map LoginMsg (Login.view model.login)
    in
        div []
            [ div []
                [ a [ href "#", onClick (ChangePage LeaderBoardPage) ] [ text "Leader Board" ]
                , span [] [ text " | " ]
                , a [ href "#", onClick (ChangePage LoginPage) ] [ text "Login" ]
                ]
            , hr [] []
            , page
            , hr [] []
            , h4 [] [ text "App Model: " ]
            , p [] [ text <| toString model ]
            ]
