module Models exposing (..)
import RemoteData exposing (WebData)



type alias Model =
    { players : WebData (List Player)
    , route : Route
    , editing : Bool
    , editNameText : String
    }


initialModel : Route -> Model
initialModel route =
    { players = RemoteData.Loading
    , route = route
    , editing = False
    , editNameText = ""
    }

type Route
    = PlayersRoute
    | PlayerRoute PlayerId
    | NotFoundRoute

type alias PlayerId =
    String


type alias Player =
    { id : PlayerId
    , name : String
    , level : Int
    }
