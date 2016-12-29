
../assets/index.html: Main.elm
	(cd ./Generated; elm make Main.elm)
	mv ./Generated/index.html ../assets/

Main.elm: ../server/src/Api.hs
	(cd ../ ; stack exec -- runhaskell -iserver/src client/src/Generate.hs)
