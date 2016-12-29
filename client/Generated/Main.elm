module Generated.Main exposing (..)

import Json.Decode exposing (..)
import Json.Decode.Pipeline exposing (..)
import Json.Encode
import Http
import String


type alias User =
    { userName : String
    , userAge : Int
    }

decodeUser : Decoder User
decodeUser =
    decode User
        |> required "userName" string
        |> required "userAge" int

encodeUser : User -> Json.Encode.Value
encodeUser x =
    Json.Encode.object
        [ ( "userName", Json.Encode.string x.userName )
        , ( "userAge", Json.Encode.int x.userAge )
        ]

postUserAdd : User -> Http.Request (Maybe (Int))
postUserAdd body =
    Http.request
        { method =
            "POST"
        , headers =
            []
        , url =
            String.join "/"
                [ ""
                , "user"
                , "add"
                ]
        , body =
            Http.jsonBody (encodeUser body)
        , expect =
            Http.expectJson (maybe int)
        , timeout =
            Nothing
        , withCredentials =
            False
        }

getUserGetByName : String -> Http.Request (Maybe (User))
getUserGetByName name =
    Http.request
        { method =
            "GET"
        , headers =
            []
        , url =
            String.join "/"
                [ ""
                , "user"
                , "get"
                , name |> toString |> Http.encodeUri
                ]
        , body =
            Http.emptyBody
        , expect =
            Http.expectJson (maybe decodeUser)
        , timeout =
            Nothing
        , withCredentials =
            False
        }