module Login exposing (..)

import Html exposing (..)
import Html.Events exposing (..)
import Html.Attributes exposing (..)


-- MODEL


type alias Model =
    { username : String
    , password : String
    }


initModel : Model
initModel =
    { username = ""
    , password = ""
    }



-- UPDATE


type Msg
    = UsernameInput String
    | PasswordInput String


update : Msg -> Model -> Model
update msg model =
    case msg of
        UsernameInput username ->
            { model
                | username = username
            }

        PasswordInput password ->
            { model
                | password = password
            }



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ h3 [] [ text "Login Page" ]
        , Html.form []
            [ input [ placeholder "username", onInput UsernameInput ] []
            , input [ placeholder "password", type' "password", onInput PasswordInput ] []
            , input [ type' "submit" ] [ text "Login" ]
            ]
        , hr [] []
        , h4 [] [ text "login model" ]
        , p [] [ text <| toString model ]
        ]
