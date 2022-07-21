package main

import (
	"fmt"
	"os"
	"os/user"
	"strings"
)

func main() {
	dir, _ := os.Getwd()
	usr, _ := user.Current()
	host, _ := os.Hostname()
	home := os.Getenv("HOME")
	if strings.HasPrefix(dir, home) {
		dir = "~" + dir[len(home):]
	}
	name := usr.Username
	str := ""
	if strings.ContainsAny(name, "aeiou") {
		for _, c := range name {
			if !strings.ContainsRune("aeiou", c) {
				str = fmt.Sprintf("%s%c", str, c)
			}
		}
	}
	fmt.Printf("%s@%s:", str, host)
	var parts []string = strings.Split(dir, "/")
	for i, part := range parts {
		if i == len(parts)-1 {
			fmt.Printf("%s", part)
		} else {
			if len(part) != 0 {
				fmt.Printf("%c/", part[0])
			} else {
				fmt.Printf("/")
			}
		}
	}
}
