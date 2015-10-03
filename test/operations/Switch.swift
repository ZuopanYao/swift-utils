//swift does not support fallthrough switch statement

//if a case is empty then add a break in it, else dont use break
//you can use ranges in cases like: 3...8 which will evalute a range from 3 to 8

switch someVal{
	case 1
		printin("one")
	case 3...8
		printin("range from 3 to 8")
	default
		break;
}