module Main exposing (Msg(..), main, update, view)

import Browser
import Html exposing (Html, button, div, input, text)
import Html.Events exposing (onClick, onInput)


main : Program () Model Msg
main =
    Browser.element
        { init = init
        , view = view
        , update = update
        , subscriptions = \_ -> Sub.none
        }


type alias Model =
    { value : String
    }


init : () -> ( Model, Cmd Msg )
init _ =
    ( { value = "type something below" }
    , Cmd.none
    )


type Msg
    = UpdateModel String


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        UpdateModel value ->
            ( { model | value = value }, Cmd.none )


view : Model -> Html Msg
view model =
    div []
        [ div [] [ text model.value ]
        , input [ onInput UpdateModel ] []
        ]
