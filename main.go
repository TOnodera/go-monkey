package main

import (
	"app/calc"
	"fmt"
)

/*
import (
	"app/p1"
	"app/p2"
)

func main(){
	p1.Func1()
	p2.Func2()
}
*/

func main() {
	p := calc.Calc{A:3,B:2}
	var m calc.MyInt = 1

	fmt.Println(p.Add())
	fmt.Println(m.Add(2))
}

