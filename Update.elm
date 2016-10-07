module Update exposing (..)

import Model exposing (..)
import Router exposing (..)
import Login
import LeaderBoard


-- update


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    let
        _ =
            Debug.log "update: " (toString model)
    in
        case msg of
            Navigate page ->
                ( model, navigateCmd page )

            LeaderBoardMsg lbMsg ->
                ( { model
                    | leaderBoard = LeaderBoard.update lbMsg model.leaderBoard
                  }
                , Cmd.none
                )

            LoginMsg loginMsg ->
                ( { model
                    | login = Login.update loginMsg model.login
                  }
                , Cmd.none
                )
