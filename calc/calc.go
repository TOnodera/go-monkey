package calc

type Calc struct {
	A,B int
}

type MyInt int
func (p Calc) Add() int {
	return p.A + p.B
}

func (m MyInt) Add(n int) MyInt {
	return m + MyInt(n)
}

