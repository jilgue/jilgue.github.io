# The little go book

https://www.openmymind.net/assets/go/go.pdf

## Intro
You can see the location of the temporary file by running: `go run work main.go`

Packages documentation: https://golang.org/pkg/

If you’re ever stuck without internet access, you can get the documentation running locally via: `godoc http=:6060 and pointing your browser to http://localhost:6060

## Structures

```go
goku := Saiyan{
    Name: "Goku",
    Power: 9000,
}

func main() {
    goku := Saiyan{"Goku", 9000}
    Super(goku)
    fmt.Println(goku.Power)
}
func Super(s Saiyan) {
    s.Power += 10000
}
```

The answer is 9000, not 19000. Why? Because Super made changes to a copy of our original goku value and thus, changes made in Super weren’t reflected in the caller. To make this work as you probably expect, we need to pass a pointer to our value:

```go
func main() {
    goku := &Saiyan{"Goku", 9000}
    Super(goku)
    fmt.Println(goku.Power)
}
    func Super(s *Saiyan) {
    s.Power += 10000
}
```

### Constructors

Structures don’t have constructors. Instead, you create a function that returns an instance of the desired type (like a
factory):

```go
func NewSaiyan(name string, power int) Saiyan {
    return Saiyan{
        Name: name,
        Power: power,
    }
}
```

### New

Go does have a builtin new function which is used to allocate the memory required by a type. The result of new(X) is the same as &X{}:

```go
goku := new(Saiyan)
goku.name = "goku"
goku.power = 9001
//vs
goku := &Saiyan {
    name: "goku",
    power: 9000,
}
```

### Composition

```go
package main

import "fmt"

type Person struct {
	Name string
}
func (p *Person) Introduce() {
	fmt.Printf("Hi, I'm %s\n", p.Name)
}
type Saiyan struct {
	*Person
	Power int
}

func main() {
	goku := &Saiyan{
		Person: &Person{"Goku"},
		Power: 9001,
	}
	goku.Introduce()

	goku2 := &Saiyan{
		Person: &Person{"Goku"},
	}
	fmt.Println(goku2.Name)
	fmt.Println(goku2.Person.Name)
}
```

## Arrays, slices, maps
### Arrays

Declaring:

```go
var scores [10]int
scores[0] = 339
scores := [4]int{9001, 9333, 212, 33}
```

Iterate:

```go
for index, value := range scores {

}
```

### Slices

A slice is a lightweight structure that wraps and represents a portion of an array.

```go
scores := []int{1,4,293,4,9}

scores := make([]int, 0, 10) // this creates a slice with a length of 0 but with a capacity of 10

scores := make([]int, 0, 10)
scores[7] = 9033 // fails because len is 0

scores := make([]int, 0, 10)
scores = append(scores, 5) // append increases len and cap

scores := make([]int, 0, 10)
scores = scores[0:8] // set len = 8
scores[7] = 9033 // works
```

### Maps

```go
func main() {
    lookup := make(map[string]int)
    lookup["goku"] = 9001
    power, exists := lookup["vegeta"]
    // prints 0, false
    // 0 is the default value for an integer
    fmt.Println(power, exists)
}
```

```go
// returns 1
total := len(lookup)
// has no return, can be called on a non existing key
delete(lookup, "goku")

// maps grow dynamically. However, we can supply a second argument to make to set an initial size:
lookup := make(map[string]int, 100)

lookup := map[string]int{
    "goku": 9001,
    "gohan": 2044,
}

for key, value := range lookup {

}
```
