# Notes

## Versions

goenv: https://github.com/syndbg/goenv
```
git clone https://github.com/syndbg/goenv.git ~/.goenv
#GO
export GOENV_ROOT="$HOME/.goenv"
export PATH="$GOENV_ROOT/bin:$PATH"
eval "$(goenv init -)"
goenv install 1.17.1
goenv global 1.17.1
go version
```

	//fmt.Printf("%+v\n", decode)
	fmt.Printf("%s\n", decode)



	https://medium.com/rungo/variadic-function-in-go-5d9b23f4c01a

go build main.go
./main
go run main.go

fmt.Println("Next train:", nextTrainTime, "minutes")
fmt.Printf("%v %f %v %q\n", myInt, myFloat, myBool, myString)

https://golang.org/ref/spec#Numeric_types

int  int8  int16  int32  int64 // whole numbers

uint uint8 uint16 uint32 uint64 uintptr // positive whole numbers

float32 float64 // decimal numbers

complex64 complex128 // imaginary numbers (rare)
