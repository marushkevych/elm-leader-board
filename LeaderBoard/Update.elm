module LeaderBoard.Update exposing (..)

import LeaderBoard.Model exposing (..)


-- update


update : Msg -> Model -> Model
update msg model =
    case msg of
        QueryInput query ->
            { model | query = query }
