module Model exposing (..)

import Login
import LeaderBoard


-- model


type alias Model =
    { page : Page
    , leaderBoard : LeaderBoard.Model
    , login : Login.Model
    }


type Page
    = LeaderBoardPage
    | LoginPage
    | AddRunnerPage
    | NotFound


type Msg
    = Navigate Page
    | LeaderBoardMsg LeaderBoard.Msg
    | LoginMsg Login.Msg


initModel : Page -> Model
initModel page =
    { page = page
    , leaderBoard = LeaderBoard.initModel
    , login = Login.initModel
    }


init : Page -> ( Model, Cmd Msg )
init page =
    ( initModel page, Cmd.none )
