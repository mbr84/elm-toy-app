module Players.Edit exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class, value, href, placeholder, type_)
import Html.Events exposing (onClick, onInput)
import Msgs exposing (Msg)
import Models exposing (Player)
import Routing exposing (playersPath)

view : Player -> Bool -> Html Msg
view model editing =
    div []
        [ nav model
        , form model editing
        ]


nav : Player -> Html Msg
nav model =
    div [ class "clearfix mb2 white bg-black p1" ]
         [ listBtn ]


form : Player -> Bool -> Html Msg
form player editing =
    div [ class "m3" ]
        (formLevel player::playerName player editing |> List.foldl (::) [])

playerName : Player -> Bool -> List (Html Msg)
playerName player editing =
    if editing then
        [ button [ onClick (Msgs.ChangeName player) ] [text "Change Name"]
        , input [ type_ "text", placeholder player.name, onInput Msgs.Name ] []
        ]
    else
        [ h1 [ onClick Msgs.EditName ] [ text player.name ] ]

formLevel : Player -> Html Msg
formLevel player =
    div
        [ class "clearfix py1"
        ]
        [ div [ class "col col-5" ] [ text "Level" ]
        , div [ class "col col-7" ]
            [ span [ class "h2 bold" ] [ text (toString player.level) ]
            , btnLevelDecrease player
            , btnLevelIncrease player
            ]
        ]


btnLevelDecrease : Player -> Html Msg
btnLevelDecrease player =
    let
        message =
            Msgs.ChangeLevel player -1
    in
        a [ class "btn ml1 h1", onClick message ]
            [ i [ class "fa fa-minus-circle" ] [] ]


btnLevelIncrease : Player -> Html Msg
btnLevelIncrease player =
    let
        message =
            Msgs.ChangeLevel player 1
    in
        a [ class "btn ml1 h1", onClick message ]
            [ i [ class "fa fa-plus-circle" ] [] ]

listBtn : Html Msg
listBtn =
    a
        [ class "btn regular"
        , href playersPath
        ]
        [ i [ class "fa fa-chevron-left mr1" ] [], text "List" ]
